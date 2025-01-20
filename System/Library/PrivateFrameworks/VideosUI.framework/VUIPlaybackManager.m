@interface VUIPlaybackManager
+ (BOOL)_isFullScreenPlaybackState:(id)a3;
+ (BOOL)_isShowingExtrasState:(id)a3;
+ (id)sharedInstance;
- (AVControlItem)extrasControlItem;
- (AVControlItem)multiViewControlItem;
- (AVControlItem)shareControlItem;
- (AVPlayerViewController)avPlayerViewController;
- (AVPlayerViewController)extrasAVPlayerViewController;
- (AVPlayerViewController)mainAVPlayerViewController;
- (BOOL)_allowedToAutoPlayForType:(unint64_t)a3;
- (BOOL)_audioContainsAirPlayRoute;
- (BOOL)_audioContainsHDMIRoute;
- (BOOL)_isNewPostPlayEnabled;
- (BOOL)_multiviewContainsMediaInfo:(id)a3;
- (BOOL)_shouldShowPerformanceDebugger;
- (BOOL)_shouldShowTimedMetadataDebugger;
- (BOOL)_shouldUseExperienceController;
- (BOOL)allowedToAutoPlay;
- (BOOL)configuredPostPlay;
- (BOOL)currentPlaylistAllowsCellular;
- (BOOL)hasMainPlayerFinishedInitialLoading;
- (BOOL)hasPerformanceDebuggerAppeared;
- (BOOL)isExperienceControllerPresented;
- (BOOL)isFullscreenPlaybackUIBeingShown;
- (BOOL)isMaloneEnabled;
- (BOOL)isMultiviewPlaybackUIBeingShown;
- (BOOL)isPIPing;
- (BOOL)isPIPingBackgroundPlayback;
- (BOOL)isPlaybackUIBeingShown;
- (BOOL)isPlaylistBeingPresented:(id)a3;
- (BOOL)isPlaylistBeingPresentedFullScreen:(id)a3;
- (BOOL)isPlaylistBeingPresentedInMultiview:(id)a3;
- (BOOL)isPostPlayActive;
- (BOOL)isShowingExtras;
- (BOOL)isTrackingPlayerViewFrame;
- (BOOL)mediaSupportsStartOver;
- (BOOL)multiviewContainsMediaItemWithIdentifier:(id)a3;
- (BOOL)requiresLinearPlayback;
- (BOOL)shouldAnimateProductPlacementView;
- (BOOL)shouldAnimateTVRatingView;
- (BOOL)shouldDisplayProductPlacementWhenVideoBoundsIsAvailable;
- (BOOL)shouldDisplayTVRatingWhenVideoBoundsIsAvailable;
- (BOOL)shouldRestartIfAppHasBeenBackgroundedTooLong;
- (BOOL)transportBarVisible;
- (CGRect)_calculatePostPlayPipRectForParent:(id)a3;
- (NSArray)multiviewIdentifiers;
- (NSDate)dateAppWasBackgrounded;
- (NSDate)datePlaybackWasPaused;
- (NSDate)initialPlaybackStartDate;
- (NSDictionary)savedErrorUserInfo;
- (NSDictionary)skipButtonImpressionMetrics;
- (NSDictionary)upNextButtonImpressionMetrics;
- (NSLayoutConstraint)postPlayTrailingConstraint;
- (NSLayoutConstraint)skipBottomConstraint;
- (NSLayoutConstraint)skipCenterXConstraint;
- (NSLayoutConstraint)skipTrailingConstraint;
- (NSMutableArray)multiviewPlaybackInfo;
- (NSNumber)postPlayImpressionTime;
- (NSString)postPlayItemId;
- (NSTimer)clearPerformanceDebuggerTimer;
- (NSTimer)mainPlayerLongLoadingTimer;
- (NSTimer)pausedTooLongTimer;
- (OS_dispatch_queue)audioSessionSerialQueue;
- (TVPMediaItem)currentMediaItem;
- (TVPStateMachine)stateMachine;
- (UIActivityItemsConfiguration)itemsConfiguration;
- (UIAlertController)errorAlertController;
- (UIAlertController)longLoadingAlertController;
- (UIButton)skipButton;
- (UIImage)highMotionWarningImage;
- (UIImage)photoSensitivityImage;
- (UIImage)productPlacementImage;
- (UIImage)ratingImage;
- (UIViewController)PIPedBackgroundMediaController;
- (UIViewController)moreInfoCanonicalViewController;
- (UIVisualEffectView)platterView;
- (VUIAdditionalAdvisoryInfoView)hmwView;
- (VUIControllerPresenter)fullScreenViewControllerForPresentation;
- (VUIControllerPresenter)presentingViewController;
- (VUILivePostPlayController)mainLivePostPlayController;
- (VUIMultiPlayerDetailsViewController)multiPlayerDetailsViewController;
- (VUIMultiPlayerViewController)multiPlayerViewController;
- (VUINowPlayingFeatureMonitor)featureMonitor;
- (VUIPerformanceDebuggerViewController)performanceDebuggerViewController;
- (VUIPlaybackContainerViewController)playbackContainerViewController;
- (VUIPlaybackManager)init;
- (VUIPlayer)activePlayer;
- (VUIPlayer)backgroundAudioPlayer;
- (VUIPlayer)backgroundMediaPlayer;
- (VUIPlayer)extrasPlayer;
- (VUIPlayer)mainPlayer;
- (VUIPostPlayView)postPlayView;
- (VUIProductPlacementView)productPlacementView;
- (VUIPromoMetadataView)promoMetadataView;
- (VUITimedMetadataDebuggerViewController)timedMetadataDebuggerViewController;
- (VUIVideoAdvisoryLogoImageDownloader)logoImageDownloader;
- (VUIVideoAdvisoryView)ratingView;
- (VideosExtrasContext)extrasContext;
- (VideosExtrasPresenter)extrasPresenter;
- (double)detailsViewHeightForMultiPlayerViewController:(id)a3;
- (id)_currentlyPlayingMultiviewInfo;
- (id)_deepLinkPlaybackURLForCurrentMediaItem;
- (id)_getLivePostPlayPrefetchPlayerIfApplicable:(id)a3;
- (id)_multiviewInfoForPlayer:(id)a3;
- (id)_multiviewInfoForPlayerViewController:(id)a3;
- (id)_multiviewInfoForPlaylist:(id)a3;
- (id)createContentSelectionViewController;
- (id)createPlayerViewController;
- (id)detailsViewControllerForMultiPlayerViewController:(id)a3;
- (id)extrasNavigationController;
- (id)playerViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4;
- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4;
- (id)savedErrorContext;
- (int64_t)dismissalOperation;
- (int64_t)maxMultiviewPlayerCount;
- (int64_t)multiviewPlayerCount;
- (unint64_t)autoPlayedVideosCount;
- (unint64_t)indexOfMediaItemInMultiviewWithIdentifier:(id)a3;
- (unint64_t)indexOfMediaItemInMultiviewWithPlayer:(id)a3;
- (void)_accountDidChange:(id)a3;
- (void)_addMultiviewButtonIfSupportedWithWindowSize:(CGSize)a3;
- (void)_addPerformanceDebuggerView;
- (void)_addPlayerToTimedMetadataManager:(id)a3;
- (void)_addProductPlacementFeatureFromMediaItem:(id)a3;
- (void)_addRollsInfoFeaturesFromMediaItem:(id)a3;
- (void)_addSkipIntroFeatureToMonitorIfNeeded:(BOOL)a3;
- (void)_addSkipTriggerFeaturesToMonitor:(id)a3;
- (void)_addTVRatingFeatureFromMediaItem:(id)a3 duration:(double)a4;
- (void)_addTappableViewToRemoveSkipButton;
- (void)_addTimedMetadataDebuggerView;
- (void)_addVideoDimmingViewForPostPlay;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_audioSessionRouteDidChange:(id)a3;
- (void)_avPlayerViewControllerPresentationDidTimeout;
- (void)_clearActivityItemsConfiguration;
- (void)_configureStillWatchingFeatureMonitoringIfLivePlayback;
- (void)_currentMediaItemDidChange:(id)a3;
- (void)_didPlayToEnd:(id)a3;
- (void)_dismissPostPlayWithSwipe:(id)a3;
- (void)_donateUserActivityForMediaItem:(id)a3;
- (void)_downloadProductPlacementImageIfAvailable:(id)a3;
- (void)_downloadRatingImageIfAvailable:(id)a3;
- (void)_externalPlaybackTypeDidChange:(id)a3;
- (void)_groupActivityDidEnd:(id)a3;
- (void)_handleDismissSkipButtonGesture:(id)a3;
- (void)_handleLongLoadingTimeout:(id)a3;
- (void)_handlePausedTooLong:(id)a3;
- (void)_handleTapAwayFromPostPlayGesture:(id)a3;
- (void)_mainPlayerViewControllerRemoveAllCustomControlItems;
- (void)_mainPlayerViewControllerSetupControlItems;
- (void)_markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:(BOOL)a3 forAVPlayerViewController:(id)a4;
- (void)_markMainPlayerMediaItemPostPlayActive:(BOOL)a3;
- (void)_muteAllMultiviewPlayersExcept:(id)a3;
- (void)_networkReachbilityDidChange:(id)a3;
- (void)_notifyAVPlayerViewControllerDisplaySize;
- (void)_performEnterBackgroundOperations;
- (void)_performEnterForegroundOperations;
- (void)_playbackErrorDidOccur:(id)a3;
- (void)_playbackStateDidChange:(id)a3;
- (void)_playerRateDidChange:(id)a3;
- (void)_postPlayItemSelected:(id)a3;
- (void)_pushMoreInfoControllerIfNeeded;
- (void)_recordPageMetricsForPreRoll:(id)a3;
- (void)_recordSkipButtonImpressionsWithSkipInfo:(id)a3;
- (void)_recordUpNextButtonImpressionsWithPromoInfo:(id)a3;
- (void)_registerApplicationNotifications;
- (void)_registerAudioSessionNotifications;
- (void)_registerBroadcastEndHandler;
- (void)_registerStateMachineHandlers;
- (void)_removeAdvisoryViews;
- (void)_removeMoreInfoViewControllerIfNeeded;
- (void)_removeMultiviewButton;
- (void)_removePlayerFromTimedMetadataManager:(id)a3;
- (void)_removePrerollFadeIn;
- (void)_removeTappableViewForSkipButtonIfNeeded;
- (void)_removeVideoDimmingViewForPostPlay;
- (void)_resetAutoPlayBingeWatchingQualifications;
- (void)_setExtrasButtonVisible:(BOOL)a3;
- (void)_setupBootstrapPostPlayFeatureMonitorForMediaItem:(id)a3;
- (void)_setupFeaturesFromMainPlayersCurrentMediaItem;
- (void)_setupInfoTab;
- (void)_setupPerformanceDebugger:(id)a3;
- (void)_setupPlayerViewController:(id)a3;
- (void)_showOrUpdateAdvisoryViewsIfNeeded;
- (void)_showProductPlacement:(BOOL)a3 withImage:(id)a4 animated:(BOOL)a5;
- (void)_showShareMediaMenuForMediaItem:(id)a3;
- (void)_showSkipAndPromoView:(BOOL)a3 animated:(BOOL)a4;
- (void)_showSkipButtonWithTitle:(id)a3 show:(BOOL)a4 animated:(BOOL)a5;
- (void)_showStillWatchingAlertFeature:(id)a3;
- (void)_showTVRating:(BOOL)a3 withRatingImage:(id)a4 photoSensitivityImage:(id)a5 highMotionWarningImage:(id)a6 animated:(BOOL)a7;
- (void)_skipButtonTapped:(id)a3;
- (void)_startPlaybackFromBeginning;
- (void)_unmuteNextAvailableMultiviewPlayer;
- (void)_updateActivityItemsConfigurationWithSharedWatchId:(id)a3 sharedWatchUrl:(id)a4 previewMetadata:(id)a5 mediaItem:(id)a6;
- (void)_updateMultiviewButtonState;
- (void)_updateMultiviewReportingMetrics;
- (void)_updateRequiresLinearPlayback;
- (void)_updateTimeBoundFeature:(id)a3 animated:(BOOL)a4;
- (void)_updateTimeTriggeredFeature:(id)a3 animated:(BOOL)a4;
- (void)addPlaylistToMultiview:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)addPlaylistToMultiview:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)autoPlayTimerDidCompleteForPostPlayView:(id)a3;
- (void)configureAudioSessionForBackgroundPlayback:(BOOL)a3 usingPlaybackCategory:(BOOL)a4 isMultiview:(BOOL)a5;
- (void)dismissPlaybackAnimated:(BOOL)a3 leaveGroupActivitySession:(BOOL)a4 completion:(id)a5;
- (void)dismissPostPlayAnimated:(BOOL)a3;
- (void)experienceManagerDidDismissPresentation:(id)a3;
- (void)experienceManagerDidRemoveFromMultiview:(id)a3;
- (void)experienceManagerDidTransitionToFullScreen:(id)a3;
- (void)experienceManagerPresentationDidComplete;
- (void)experienceManagerWillTransitionToMultiview;
- (void)extrasBackButtonPressed;
- (void)extrasContext:(id)a3 extrasVisibilityNeedsUpdate:(BOOL)a4;
- (void)extrasContext:(id)a3 hadFatalError:(id)a4;
- (void)extrasContextDidLoadMainMenuItems:(id)a3;
- (void)extrasDoneButtonPressed;
- (void)extrasMenuItemSelected:(id)a3 atIndex:(unint64_t)a4;
- (void)extrasRequestsMediaPlayback:(id)a3 isBackground:(BOOL)a4;
- (void)featureMonitor:(id)a3 featureDidChangeState:(id)a4 animated:(BOOL)a5;
- (void)mediaInfoDidChangeTo:(id)a3 canPlay:(BOOL)a4 wasAutoPlayed:(BOOL)a5;
- (void)multiPlayerDetailsViewControllerDidDeselectLockupWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5;
- (void)multiPlayerDetailsViewControllerDidSelectLockupWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5;
- (void)multiPlayerViewController:(id)a3 detailsViewControllerDidAppear:(id)a4;
- (void)multiPlayerViewController:(id)a3 detailsViewControllerDidDisappear:(id)a4;
- (void)multiPlayerViewController:(id)a3 detailsViewControllerWillAppear:(id)a4;
- (void)multiPlayerViewController:(id)a3 detailsViewControllerWillDisappear:(id)a4;
- (void)multiPlayerViewController:(id)a3 didBeginDropWithMediaInfo:(id)a4 atIndex:(int64_t)a5;
- (void)multiPlayerViewController:(id)a3 didCrossSupportedScreenSizeBoundary:(BOOL)a4;
- (void)multiPlayerViewController:(id)a3 didDismissWithPlayerViewController:(id)a4 withReason:(unint64_t)a5;
- (void)multiPlayerViewController:(id)a3 didDropWithMediaInfo:(id)a4 overPlayerAtIndex:(int64_t)a5;
- (void)multiPlayerViewController:(id)a3 didEndDropWithMediaInfo:(id)a4;
- (void)multiPlayerViewController:(id)a3 didEnterFullscreenWithPlayerViewController:(id)a4;
- (void)multiPlayerViewController:(id)a3 didExitFullscreenWithPlayerViewController:(id)a4;
- (void)multiPlayerViewController:(id)a3 didPinchPlayerToDismiss:(id)a4;
- (void)multiPlayerViewController:(id)a3 didRemovePlayer:(id)a4 atIndex:(int64_t)a5;
- (void)multiPlayerViewController:(id)a3 didSelectPlayerViewController:(id)a4;
- (void)multiPlayerViewController:(id)a3 didSwapPlayerViewControllerAtIndex:(int64_t)a4 withPlayerAtIndex:(int64_t)a5;
- (void)multiPlayerViewController:(id)a3 playerViewController:(id)a4 didResizeToFrame:(CGRect)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playbackContainerViewControllerBackgroundPlaybackWillBegin:(id)a3;
- (void)playbackContainerViewControllerDidDisappear:(id)a3;
- (void)playbackContainerViewControllerDidFinishLoadingPostPlay:(id)a3;
- (void)playbackContainerViewControllerExitPictureInPicturePressed:(id)a3;
- (void)playbackContainerViewControllerWillTransitionToSize:(CGSize)a3;
- (void)playerViewController:(id)a3 contentViewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)presentContainerViewController:(id)a3 withPlayer:(id)a4 andPlayerViewController:(id)a5 completion:(id)a6;
- (void)presentExtrasWithURL:(id)a3 storeID:(id)a4 actionParams:(id)a5 fromViewController:(id)a6 completion:(id)a7;
- (void)presentExtrasWithURL:(id)a3 storeID:(id)a4 actionParams:(id)a5 hlsURL:(id)a6 fromViewController:(id)a7 completion:(id)a8;
- (void)presentMultiviewWithPlaylists:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5;
- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 allowsCellular:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 allowsCellular:(BOOL)a6 animated:(BOOL)a7 userInfo:(id)a8 completion:(id)a9;
- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)presentViewControllerOnExtrasNav:(id)a3;
- (void)removeFromMultiviewWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)removePlaylistFromMultiview:(id)a3 animated:(BOOL)a4;
- (void)replacePlaylistInMultiviewAtIndex:(int64_t)a3 withPlaylist:(id)a4 animated:(BOOL)a5;
- (void)restoreBackgroundMediaControllerFromPIP:(id)a3;
- (void)setActivePlayer:(id)a3;
- (void)setAudioSessionSerialQueue:(id)a3;
- (void)setAutoPlayedVideosCount:(unint64_t)a3;
- (void)setAvPlayerViewController:(id)a3;
- (void)setBackgroundAudioPlayer:(id)a3;
- (void)setBackgroundMediaControllerForPIP:(id)a3;
- (void)setClearPerformanceDebuggerTimer:(id)a3;
- (void)setConfiguredPostPlay:(BOOL)a3;
- (void)setDateAppWasBackgrounded:(id)a3;
- (void)setDatePlaybackWasPaused:(id)a3;
- (void)setDismissalOperation:(int64_t)a3;
- (void)setErrorAlertController:(id)a3;
- (void)setExtrasAVPlayerViewController:(id)a3;
- (void)setExtrasContext:(id)a3;
- (void)setExtrasControlItem:(id)a3;
- (void)setExtrasPlayer:(id)a3;
- (void)setExtrasPresenter:(id)a3;
- (void)setFeatureMonitor:(id)a3;
- (void)setHasMainPlayerFinishedInitialLoading:(BOOL)a3;
- (void)setHasPerformanceDebuggerAppeared:(BOOL)a3;
- (void)setHighMotionWarningImage:(id)a3;
- (void)setHmwView:(id)a3;
- (void)setInitialPlaybackStartDate:(id)a3;
- (void)setIsExperienceControllerPresented:(BOOL)a3;
- (void)setItemsConfiguration:(id)a3;
- (void)setLogoImageDownloader:(id)a3;
- (void)setLongLoadingAlertController:(id)a3;
- (void)setMainAVPlayerViewController:(id)a3;
- (void)setMainLivePostPlayController:(id)a3;
- (void)setMainPlayer:(id)a3;
- (void)setMainPlayerLongLoadingTimer:(id)a3;
- (void)setMoreInfoCanonicalViewController:(id)a3;
- (void)setMultiPlayerDetailsViewController:(id)a3;
- (void)setMultiPlayerViewController:(id)a3;
- (void)setMultiViewControlItem:(id)a3;
- (void)setMultiviewPlaybackInfo:(id)a3;
- (void)setPIPedBackgroundMediaController:(id)a3;
- (void)setPausedTooLongTimer:(id)a3;
- (void)setPerformanceDebuggerViewController:(id)a3;
- (void)setPhotoSensitivityImage:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPlaybackContainerViewController:(id)a3;
- (void)setPostPlayImpressionTime:(id)a3;
- (void)setPostPlayItemId:(id)a3;
- (void)setPostPlayTrailingConstraint:(id)a3;
- (void)setPostPlayView:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProductPlacementImage:(id)a3;
- (void)setProductPlacementView:(id)a3;
- (void)setPromoMetadataView:(id)a3;
- (void)setRatingImage:(id)a3;
- (void)setRatingView:(id)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setSavedErrorContext:(id)a3;
- (void)setSavedErrorUserInfo:(id)a3;
- (void)setShareControlItem:(id)a3;
- (void)setShouldAnimateProductPlacementView:(BOOL)a3;
- (void)setShouldAnimateTVRatingView:(BOOL)a3;
- (void)setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:(BOOL)a3;
- (void)setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:(BOOL)a3;
- (void)setShouldRestartIfAppHasBeenBackgroundedTooLong:(BOOL)a3;
- (void)setSkipBottomConstraint:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)setSkipButtonImpressionMetrics:(id)a3;
- (void)setSkipCenterXConstraint:(id)a3;
- (void)setSkipTrailingConstraint:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTimedMetadataDebuggerViewController:(id)a3;
- (void)setTrackingPlayerViewFrame:(BOOL)a3;
- (void)setTransportBarVisible:(BOOL)a3;
- (void)setUpNextButtonImpressionMetrics:(id)a3;
- (void)startPictureInPicture;
- (void)transferPlaybackToBackgroundMediaController:(id)a3;
- (void)upNextButtonTapped:(id)a3;
@end

@implementation VUIPlaybackManager

+ (BOOL)_isFullScreenPlaybackState:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Showing video full screen"] & 1) != 0
    || ([v3 isEqualToString:@"Showing video full screen with post play content on screen"] & 1) != 0
    || ([v3 isEqualToString:@"Waiting for AVPlayerViewController presentation to complete"] & 1) != 0
    || ([v3 isEqualToString:@"Showing extras video full screen outside extras content"] & 1) != 0
    || ([v3 isEqualToString:@"Showing multiview playback fullscreen"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"Showing multiview playback fullscreen due to small screen size"];
  }

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_531);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Application did become active"];
}

- (BOOL)isFullscreenPlaybackUIBeingShown
{
  v2 = [(VUIPlaybackManager *)self stateMachine];
  id v3 = [v2 currentState];
  BOOL v4 = +[VUIPlaybackManager _isFullScreenPlaybackState:v3];

  return v4;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

void __36__VUIPlaybackManager_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIPlaybackManager");
  v1 = (void *)sLogObject_5;
  sLogObject_5 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIPlaybackManager);
  id v3 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v2;
}

- (VUIPlaybackManager)init
{
  v29.receiver = self;
  v29.super_class = (Class)VUIPlaybackManager;
  v2 = [(VUIPlaybackManager *)&v29 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Playback manager audio session serial queue", 0);
    audioSessionSerialQueue = v2->_audioSessionSerialQueue;
    v2->_audioSessionSerialQueue = (OS_dispatch_queue *)v3;

    id v5 = +[VUIPlaybackSettings sharedSettings];
    [(VUIPlaybackManager *)v2 _registerApplicationNotifications];
    [(VUIPlaybackManager *)v2 _registerAudioSessionNotifications];
    id v6 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = init_instanceNumber++;
    v9 = (void *)[v6 initWithFormat:@"%@ %ld", v7, v8];
    v2->_trackingPlayerViewFrame = 0;
    objc_initWeak(&location, v2);
    id v10 = objc_alloc(MEMORY[0x1E4FA9DA8]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __26__VUIPlaybackManager_init__block_invoke;
    v25[3] = &unk_1E6DF6FA0;
    objc_copyWeak(&v27, &location);
    v11 = v2;
    v26 = v11;
    uint64_t v12 = [v10 initWithName:v9 initialState:@"Not showing anything" mode:0 stateChangeHandler:v25];
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (TVPStateMachine *)v12;

    [(TVPStateMachine *)v11->_stateMachine setLogObject:sLogObject_5];
    [(TVPStateMachine *)v11->_stateMachine setCallsStateChangeHandlerSynchronously:1];
    [(VUIPlaybackManager *)v11 _registerStateMachineHandlers];
    [(TVPStateMachine *)v11->_stateMachine setShouldAcceptEvents:1];
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    multiviewPlaybackInfo = v11->_multiviewPlaybackInfo;
    v11->_multiviewPlaybackInfo = (NSMutableArray *)v14;

    if ([(VUIPlaybackManager *)v11 _shouldShowPerformanceDebugger])
    {
      v16 = +[VUIInterfaceFactory sharedInstance];
      v17 = [v16 documentCreator];
      uint64_t v18 = [v17 performanceDebuggerViewController];
      performanceDebuggerViewController = v11->_performanceDebuggerViewController;
      v11->_performanceDebuggerViewController = (VUIPerformanceDebuggerViewController *)v18;
    }
    if ([(VUIPlaybackManager *)v11 _shouldShowTimedMetadataDebugger])
    {
      v20 = +[VUIInterfaceFactory sharedInstance];
      v21 = [v20 documentCreator];
      uint64_t v22 = [v21 timedMetadataDebuggerViewController];
      timedMetadataDebuggerViewController = v11->_timedMetadataDebuggerViewController;
      v11->_timedMetadataDebuggerViewController = (VUITimedMetadataDebuggerViewController *)v22;
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)_shouldShowTimedMetadataDebugger
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  v2 = [MEMORY[0x1E4FB3C80] sharedInstance];
  if ([v2 capellaDebuggerEnabled])
  {
    char v3 = 1;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4FB3C80] sharedInstance];
    char v3 = [v4 capellaMusicInfoEnabled];
  }
  return v3;
}

- (BOOL)_shouldShowPerformanceDebugger
{
  v2 = [MEMORY[0x1E4FB3C80] sharedInstance];
  if ([v2 performanceDebuggerEnabled])
  {
    char v3 = 1;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4FB3C80] sharedInstance];
    char v3 = [v4 performanceDebuggerVerboseEnabled];
  }
  return v3;
}

- (void)_registerStateMachineHandlers
{
  v641[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&v614, self);
  v612[0] = MEMORY[0x1E4F143A8];
  v612[1] = 3221225472;
  v612[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke;
  v612[3] = &unk_1E6DF7258;
  objc_copyWeak(&v613, &v614);
  v309 = (id *)_Block_copy(v612);
  v610[0] = MEMORY[0x1E4F143A8];
  v610[1] = 3221225472;
  v610[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4;
  v610[3] = &unk_1E6DF7280;
  objc_copyWeak(&v611, &v614);
  v2 = _Block_copy(v610);
  v608[0] = MEMORY[0x1E4F143A8];
  v608[1] = 3221225472;
  v608[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_824;
  v608[3] = &unk_1E6DF72A8;
  id v3 = v2;
  id v609 = v3;
  v327 = (id *)_Block_copy(v608);
  v606[0] = MEMORY[0x1E4F143A8];
  v606[1] = 3221225472;
  v606[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_827;
  v606[3] = &unk_1E6DF72D0;
  id v305 = v3;
  id v607 = v305;
  v325 = (id *)_Block_copy(v606);
  v604[0] = MEMORY[0x1E4F143A8];
  v604[1] = 3221225472;
  v604[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_830;
  v604[3] = &unk_1E6DF72F8;
  objc_copyWeak(&v605, &v614);
  BOOL v4 = _Block_copy(v604);
  v602[0] = MEMORY[0x1E4F143A8];
  v602[1] = 3221225472;
  v602[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_855;
  v602[3] = &unk_1E6DF7320;
  objc_copyWeak(&v603, &v614);
  id v5 = _Block_copy(v602);
  v599[0] = MEMORY[0x1E4F143A8];
  v599[1] = 3221225472;
  v599[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6;
  v599[3] = &unk_1E6DF4428;
  objc_copyWeak(&v601, &v614);
  v308 = v5;
  v600 = v308;
  id v6 = _Block_copy(v599);
  v597[0] = MEMORY[0x1E4F143A8];
  v597[1] = 3221225472;
  v597[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7;
  v597[3] = &unk_1E6DF7348;
  objc_copyWeak(&v598, &v614);
  uint64_t v7 = _Block_copy(v597);
  v594[0] = MEMORY[0x1E4F143A8];
  v594[1] = 3221225472;
  v594[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_860;
  v594[3] = &unk_1E6DF7370;
  id v8 = v7;
  id v595 = v8;
  objc_copyWeak(&v596, &v614);
  v315 = (id *)_Block_copy(v594);
  v592[0] = MEMORY[0x1E4F143A8];
  v592[1] = 3221225472;
  v592[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_864;
  v592[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v593, &v614);
  v310 = (id *)_Block_copy(v592);
  v590[0] = MEMORY[0x1E4F143A8];
  v590[1] = 3221225472;
  v590[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_870;
  v590[3] = &unk_1E6DF7348;
  objc_copyWeak(&v591, &v614);
  v317 = (id *)_Block_copy(v590);
  v588[0] = MEMORY[0x1E4F143A8];
  v588[1] = 3221225472;
  v588[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_872;
  v588[3] = &unk_1E6DF7410;
  objc_copyWeak(&v589, &v614);
  v9 = _Block_copy(v588);
  v585[0] = MEMORY[0x1E4F143A8];
  v585[1] = 3221225472;
  v585[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_875;
  v585[3] = &unk_1E6DF7438;
  objc_copyWeak(&v587, &v614);
  id v10 = v9;
  id v586 = v10;
  v316 = (id *)_Block_copy(v585);
  v581[0] = MEMORY[0x1E4F143A8];
  v581[1] = 3221225472;
  v581[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_878;
  v581[3] = &unk_1E6DF7460;
  objc_copyWeak(&v584, &v614);
  id v304 = v6;
  id v582 = v304;
  v314 = (id *)v8;
  v583 = v314;
  v11 = _Block_copy(v581);
  v579[0] = MEMORY[0x1E4F143A8];
  v579[1] = 3221225472;
  v579[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_881;
  v579[3] = &unk_1E6DF7488;
  objc_copyWeak(&v580, &v614);
  v312 = (id *)_Block_copy(v579);
  v577[0] = MEMORY[0x1E4F143A8];
  v577[1] = 3221225472;
  v577[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_883;
  v577[3] = &unk_1E6DF7500;
  objc_copyWeak(&v578, &v614);
  uint64_t v12 = _Block_copy(v577);
  v575[0] = MEMORY[0x1E4F143A8];
  v575[1] = 3221225472;
  v575[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_891;
  v575[3] = &unk_1E6DF7550;
  objc_copyWeak(&v576, &v614);
  id location = (id *)_Block_copy(v575);
  v573[0] = MEMORY[0x1E4F143A8];
  v573[1] = 3221225472;
  v573[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_909;
  v573[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v574, &v614);
  v311 = (id *)_Block_copy(v573);
  v570[0] = MEMORY[0x1E4F143A8];
  v570[1] = 3221225472;
  v570[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_949;
  v570[3] = &unk_1E6DF7638;
  objc_copyWeak(&v572, &v614);
  id v13 = v4;
  id v571 = v13;
  uint64_t v14 = _Block_copy(v570);
  v566[0] = MEMORY[0x1E4F143A8];
  v566[1] = 3221225472;
  v566[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_958;
  v566[3] = &unk_1E6DF76B0;
  id v15 = v11;
  id v567 = v15;
  objc_copyWeak(&v569, &v614);
  id v16 = v14;
  id v568 = v16;
  v17 = _Block_copy(v566);
  v563[0] = MEMORY[0x1E4F143A8];
  v563[1] = 3221225472;
  v563[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8;
  v563[3] = &unk_1E6DF76D8;
  objc_copyWeak(&v565, &v614);
  id v18 = v16;
  id v564 = v18;
  v19 = _Block_copy(v563);
  v561[0] = MEMORY[0x1E4F143A8];
  v561[1] = 3221225472;
  v561[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9;
  v561[3] = &unk_1E6DF7700;
  objc_copyWeak(&v562, &v614);
  v319 = (id *)_Block_copy(v561);
  v559[0] = MEMORY[0x1E4F143A8];
  v559[1] = 3221225472;
  v559[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10;
  v559[3] = &unk_1E6DF7700;
  objc_copyWeak(&v560, &v614);
  v321 = (id *)_Block_copy(v559);
  id v20 = objc_loadWeakRetained(&v614);
  v21 = [v20 stateMachine];
  v557[0] = MEMORY[0x1E4F143A8];
  v557[1] = 3221225472;
  v557[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13;
  v557[3] = &unk_1E6DF6470;
  id v22 = v12;
  id v558 = v22;
  [v21 registerHandlerForEvent:@"Present playlist" onState:@"Showing video full screen with post play content on screen" withBlock:v557];

  id v23 = objc_loadWeakRetained(&v614);
  v24 = [v23 stateMachine];
  v554[0] = MEMORY[0x1E4F143A8];
  v554[1] = 3221225472;
  v554[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16;
  v554[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v556, &v614);
  id v25 = v22;
  id v555 = v25;
  [v24 registerHandlerForEvent:@"Present playlist" onState:@"Showing post play content without playback UI" withBlock:v554];

  id v26 = objc_loadWeakRetained(&v614);
  id v27 = [v26 stateMachine];
  v547[0] = MEMORY[0x1E4F143A8];
  v547[1] = 3221225472;
  v547[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19;
  v547[3] = &unk_1E6DF77A0;
  objc_copyWeak(&v553, &v614);
  v313 = (id *)v25;
  v548 = v313;
  id v28 = v15;
  id v549 = v28;
  id v29 = v13;
  id v550 = v29;
  v302 = v325;
  v551 = v302;
  v328 = v327;
  v552 = v328;
  [v27 registerDefaultHandlerForEvent:@"Present playlist" withBlock:v547];

  id v30 = objc_loadWeakRetained(&v614);
  v31 = [v30 stateMachine];
  v641[0] = @"Showing Extras content";
  v641[1] = @"Showing extras video picture in picture on extras content";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v641 count:2];
  v544[0] = MEMORY[0x1E4F143A8];
  v544[1] = 3221225472;
  v544[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_996;
  v544[3] = &unk_1E6DF77C8;
  v326 = (id *)v10;
  v545 = v326;
  objc_copyWeak(&v546, &v614);
  [v31 registerHandlerForEvent:@"Present playlist" onStates:v32 withBlock:v544];

  id v33 = objc_loadWeakRetained(&v614);
  v34 = [v33 stateMachine];
  v540[0] = MEMORY[0x1E4F143A8];
  v540[1] = 3221225472;
  v540[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_999;
  v540[3] = &unk_1E6DF6560;
  objc_copyWeak(&v543, &v614);
  id v35 = v28;
  id v541 = v35;
  v307 = (id *)v29;
  v542 = v307;
  [v34 registerHandlerForEvent:@"Present player container view controller" onState:@"Not showing anything" withBlock:v540];

  id v36 = objc_loadWeakRetained(&v614);
  v37 = [v36 stateMachine];
  v538[0] = MEMORY[0x1E4F143A8];
  v538[1] = 3221225472;
  v538[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1002;
  v538[3] = &unk_1E6DF6470;
  id v303 = v17;
  id v539 = v303;
  [v37 registerHandlerForEvent:@"Show multiview playback" onState:@"Not showing anything" withBlock:v538];

  id v38 = objc_loadWeakRetained(&v614);
  v39 = [v38 stateMachine];
  v536[0] = MEMORY[0x1E4F143A8];
  v536[1] = 3221225472;
  v536[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1003;
  v536[3] = &unk_1E6DF6470;
  id v40 = v19;
  id v537 = v40;
  [v39 registerHandlerForEvent:@"Show multiview playback" onState:@"Showing video full screen" withBlock:v536];

  id v41 = objc_loadWeakRetained(&v614);
  v42 = [v41 stateMachine];
  v533[0] = MEMORY[0x1E4F143A8];
  v533[1] = 3221225472;
  v533[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1004;
  v533[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v535, &v614);
  v43 = v321;
  v534 = v43;
  [v42 registerHandlerForEvent:@"Show multiview playback" onState:@"Showing multiview playback fullscreen" withBlock:v533];

  id v44 = objc_loadWeakRetained(&v614);
  v45 = [v44 stateMachine];
  v640[0] = @"Showing multiview playback";
  v640[1] = @"Showing multiview playback fullscreen";
  v640[2] = @"Showing multiview playback fullscreen due to small screen size";
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v640 count:3];
  v530[0] = MEMORY[0x1E4F143A8];
  v530[1] = 3221225472;
  v530[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_1056;
  v530[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v532, &v614);
  id v47 = v35;
  id v531 = v47;
  [v45 registerHandlerForEvent:@"Dismiss multiview playback" onStates:v46 withBlock:v530];

  id v48 = objc_loadWeakRetained(&v614);
  v49 = [v48 stateMachine];
  v527[0] = MEMORY[0x1E4F143A8];
  v527[1] = 3221225472;
  v527[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_1060;
  v527[3] = &unk_1E6DF7818;
  id v50 = v18;
  id v528 = v50;
  objc_copyWeak(&v529, &v614);
  v527[4] = self;
  [v49 registerHandlerForEvent:@"Add multiview playback" onState:@"Showing multiview playback" withBlock:v527];

  id v51 = objc_loadWeakRetained(&v614);
  v52 = [v51 stateMachine];
  v639[0] = @"Showing multiview playback fullscreen";
  v639[1] = @"Showing multiview playback fullscreen due to small screen size";
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v639 count:2];
  v524[0] = MEMORY[0x1E4F143A8];
  v524[1] = 3221225472;
  v524[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_22;
  v524[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v526, &v614);
  v54 = v43;
  v525 = v54;
  [v52 registerHandlerForEvent:@"Add multiview playback" onStates:v53 withBlock:v524];

  id v55 = objc_loadWeakRetained(&v614);
  v56 = [v55 stateMachine];
  v522[0] = MEMORY[0x1E4F143A8];
  v522[1] = 3221225472;
  v522[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_24;
  v522[3] = &unk_1E6DF6470;
  id v301 = v40;
  id v523 = v301;
  [v56 registerHandlerForEvent:@"Add multiview playback" onState:@"Showing video full screen" withBlock:v522];

  id v57 = objc_loadWeakRetained(&v614);
  v58 = [v57 stateMachine];
  v520[0] = MEMORY[0x1E4F143A8];
  v520[1] = 3221225472;
  v520[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_25;
  v520[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v521, &v614);
  [v58 registerHandlerForEvent:@"Remove multiview playback" onState:@"Showing multiview playback" withBlock:v520];

  id v59 = objc_loadWeakRetained(&v614);
  v60 = [v59 stateMachine];
  v518[0] = MEMORY[0x1E4F143A8];
  v518[1] = 3221225472;
  v518[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_26;
  v518[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v519, &v614);
  [v60 registerHandlerForEvent:@"Playback was removed from multiview" onState:@"Showing multiview playback" withBlock:v518];

  id v61 = objc_loadWeakRetained(&v614);
  v62 = [v61 stateMachine];
  v515[0] = MEMORY[0x1E4F143A8];
  v515[1] = 3221225472;
  v515[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_27;
  v515[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v517, &v614);
  id v300 = v50;
  id v516 = v300;
  [v62 registerHandlerForEvent:@"Replace multiview playback" onState:@"Showing multiview playback" withBlock:v515];

  id v63 = objc_loadWeakRetained(&v614);
  v64 = [v63 stateMachine];
  v512[0] = MEMORY[0x1E4F143A8];
  v512[1] = 3221225472;
  v512[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_28;
  v512[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v514, &v614);
  v65 = v54;
  v513 = v65;
  [v64 registerHandlerForEvent:@"Did select multiview player" onState:@"Showing multiview playback" withBlock:v512];

  id v66 = objc_loadWeakRetained(&v614);
  v67 = [v66 stateMachine];
  v509[0] = MEMORY[0x1E4F143A8];
  v509[1] = 3221225472;
  v509[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_29;
  v509[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v511, &v614);
  v324 = v319;
  v510 = v324;
  [v67 registerHandlerForEvent:@"Multiview did enter fullscreen" onState:@"Showing multiview playback" withBlock:v509];

  id v68 = objc_loadWeakRetained(&v614);
  v69 = [v68 stateMachine];
  v638[0] = @"Showing video full screen";
  v638[1] = @"Showing multiview playback fullscreen";
  v638[2] = @"Showing multiview playback fullscreen due to small screen size";
  v638[3] = @"Showing long loading dialog";
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v638 count:4];
  v506[0] = MEMORY[0x1E4F143A8];
  v506[1] = 3221225472;
  v506[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_32;
  v506[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v508, &v614);
  v299 = v328;
  v507 = v299;
  [v69 registerHandlerForEvent:@"Media info did change" onStates:v70 withBlock:v506];

  id v71 = objc_loadWeakRetained(&v614);
  v72 = [v71 stateMachine];
  v637[0] = @"Showing multiview playback fullscreen";
  v637[1] = @"Showing multiview playback fullscreen due to small screen size";
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v637 count:2];
  v503[0] = MEMORY[0x1E4F143A8];
  v503[1] = 3221225472;
  v503[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1064;
  v503[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v505, &v614);
  v322 = v65;
  v504 = v322;
  [v72 registerHandlerForEvent:@"Multiview did exit fullscreen" onStates:v73 withBlock:v503];

  id v74 = objc_loadWeakRetained(&v614);
  v75 = [v74 stateMachine];
  v636[0] = @"Showing video full screen";
  v636[1] = @"Showing Extras content";
  v636[2] = @"Showing error message on playback UI";
  v636[3] = @"Showing video full screen with post play content on screen";
  v636[4] = @"Showing extras video full screen outside extras content";
  v636[5] = @"Showing post play content without playback UI";
  v636[6] = @"Showing multiview playback";
  v636[7] = @"Showing multiview playback fullscreen";
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v636 count:8];
  v501[0] = MEMORY[0x1E4F143A8];
  v501[1] = 3221225472;
  v501[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1065;
  v501[3] = &unk_1E6DF6470;
  id v77 = v47;
  id v502 = v77;
  [v75 registerHandlerForEvent:@"Dismiss playback" onStates:v76 withBlock:v501];

  id v78 = objc_loadWeakRetained(&v614);
  v79 = [v78 stateMachine];
  [v79 registerHandlerForEvent:@"Dismiss playback" onState:@"Waiting for AVPlayerViewController presentation to complete" withBlock:&__block_literal_global_1068];

  id v80 = objc_loadWeakRetained(&v614);
  v81 = [v80 stateMachine];
  v635[0] = @"Waiting for Extras AVPlayerViewController presentation to complete";
  v635[1] = @"Showing main video picture in picture";
  v635[2] = @"Showing extras video picture in picture on extras content";
  v635[3] = @"Showing extras video picture in picture outside extras content";
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v635 count:4];
  v499[0] = MEMORY[0x1E4F143A8];
  v499[1] = 3221225472;
  v499[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1069;
  v499[3] = &unk_1E6DF6470;
  id v83 = v77;
  id v500 = v83;
  [v81 registerHandlerForEvent:@"Dismiss playback" onStates:v82 withBlock:v499];

  id v84 = objc_loadWeakRetained(&v614);
  v85 = [v84 stateMachine];
  v497[0] = MEMORY[0x1E4F143A8];
  v497[1] = 3221225472;
  v497[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1070;
  v497[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v498, &v614);
  [v85 registerHandlerForEvent:@"Dismiss playback" onState:@"Playing background media in picture and picture" withBlock:v497];

  id v86 = objc_loadWeakRetained(&v614);
  v87 = [v86 stateMachine];
  v495[0] = MEMORY[0x1E4F143A8];
  v495[1] = 3221225472;
  v495[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1072;
  v495[3] = &unk_1E6DF6470;
  id v88 = v83;
  id v496 = v88;
  [v87 registerHandlerForEvent:@"Done Button Pressed" onState:@"Showing Extras content" withBlock:v495];

  id v89 = objc_loadWeakRetained(&v614);
  v90 = [v89 stateMachine];
  v493[0] = MEMORY[0x1E4F143A8];
  v493[1] = 3221225472;
  v493[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1073;
  v493[3] = &unk_1E6DF6470;
  v329 = v317;
  v494 = v329;
  [v90 registerHandlerForEvent:@"Done Button Pressed" onState:@"Showing extras video picture in picture on extras content" withBlock:v493];

  id v91 = objc_loadWeakRetained(&v614);
  v92 = [v91 stateMachine];
  v490[0] = MEMORY[0x1E4F143A8];
  v490[1] = 3221225472;
  v490[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1074;
  v490[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v492, &v614);
  id v93 = v88;
  id v491 = v93;
  [v92 registerHandlerForEvent:@"AVPlayerViewController presentation did complete" onState:@"Waiting for AVPlayerViewController presentation to complete" withBlock:v490];

  id v94 = objc_loadWeakRetained(&v614);
  v95 = [v94 stateMachine];
  v487[0] = MEMORY[0x1E4F143A8];
  v487[1] = 3221225472;
  v487[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1078;
  v487[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v489, &v614);
  v96 = v316;
  v488 = v96;
  [v95 registerHandlerForEvent:@"AVPlayerViewController presentation did complete" onState:@"Waiting for Extras AVPlayerViewController presentation to complete" withBlock:v487];

  id v97 = objc_loadWeakRetained(&v614);
  v98 = [v97 stateMachine];
  v484[0] = MEMORY[0x1E4F143A8];
  v484[1] = 3221225472;
  v484[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1080;
  v484[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v486, &v614);
  id v99 = v93;
  id v485 = v99;
  [v98 registerHandlerForEvent:@"AVPlayerViewController presentation did complete" onState:@"Waiting for AVPlayerViewController presentation to complete to dismiss" withBlock:v484];

  id v100 = objc_loadWeakRetained(&v614);
  v101 = [v100 stateMachine];
  v482[0] = MEMORY[0x1E4F143A8];
  v482[1] = 3221225472;
  v482[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1082;
  v482[3] = &unk_1E6DF6470;
  id v102 = v99;
  id v483 = v102;
  [v101 registerHandlerForEvent:@"AVPlayerViewController presentation did timeout" onState:@"Waiting for AVPlayerViewController presentation to complete" withBlock:v482];

  id v103 = objc_loadWeakRetained(&v614);
  v104 = [v103 stateMachine];
  v480[0] = MEMORY[0x1E4F143A8];
  v480[1] = 3221225472;
  v480[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1084;
  v480[3] = &unk_1E6DF6470;
  id v105 = v102;
  id v481 = v105;
  [v104 registerHandlerForEvent:@"AVPlayerViewController presentation did timeout" onState:@"Waiting for AVPlayerViewController presentation to complete to dismiss" withBlock:v480];

  id v106 = objc_loadWeakRetained(&v614);
  v107 = [v106 stateMachine];
  v634[0] = @"Showing video full screen";
  v634[1] = @"Showing multiview playback fullscreen";
  v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v634 count:2];
  v478[0] = MEMORY[0x1E4F143A8];
  v478[1] = 3221225472;
  v478[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1086;
  v478[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v479, &v614);
  [v107 registerHandlerForEvent:@"Will start picture in picture" onStates:v108 withBlock:v478];

  id v109 = objc_loadWeakRetained(&v614);
  v110 = [v109 stateMachine];
  v476[0] = MEMORY[0x1E4F143A8];
  v476[1] = 3221225472;
  v476[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1087;
  v476[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v477, &v614);
  [v110 registerHandlerForEvent:@"Will start picture in picture" onState:@"Showing multiview playback" withBlock:v476];

  id v111 = objc_loadWeakRetained(&v614);
  v112 = [v111 stateMachine];
  v473[0] = MEMORY[0x1E4F143A8];
  v473[1] = 3221225472;
  v473[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1088;
  v473[3] = &unk_1E6DF77C8;
  v113 = v315;
  v474 = v113;
  objc_copyWeak(&v475, &v614);
  [v112 registerHandlerForEvent:@"Will start picture in picture" onState:@"Showing extras video full screen outside extras content" withBlock:v473];

  id v114 = objc_loadWeakRetained(&v614);
  v115 = [v114 stateMachine];
  v471[0] = MEMORY[0x1E4F143A8];
  v471[1] = 3221225472;
  v471[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1089;
  v471[3] = &unk_1E6DF6470;
  v116 = v313;
  v472 = v116;
  [v115 registerHandlerForEvent:@"Will start picture in picture" onState:@"Showing video full screen with post play content on screen" withBlock:v471];

  id v117 = objc_loadWeakRetained(&v614);
  v118 = [v117 stateMachine];
  v633[0] = @"Showing main video picture in picture";
  v633[1] = @"Showing multiview playback in PIP";
  v633[2] = @"Showing multiview playback fullscreen";
  v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v633 count:3];
  v468[0] = MEMORY[0x1E4F143A8];
  v468[1] = 3221225472;
  v468[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1090;
  v468[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v470, &v614);
  v120 = v113;
  v469 = v120;
  [v118 registerHandlerForEvent:@"Did start picture in picture" onStates:v119 withBlock:v468];

  id v121 = objc_loadWeakRetained(&v614);
  v122 = [v121 stateMachine];
  v466[0] = MEMORY[0x1E4F143A8];
  v466[1] = 3221225472;
  v466[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1091;
  v466[3] = &unk_1E6DF6470;
  v298 = v314;
  v467 = v298;
  [v122 registerHandlerForEvent:@"Did start picture in picture" onState:@"Showing extras video picture in picture on extras content" withBlock:v466];

  id v123 = objc_loadWeakRetained(&v614);
  v124 = [v123 stateMachine];
  v463[0] = MEMORY[0x1E4F143A8];
  v463[1] = 3221225472;
  v463[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1092;
  v463[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v465, &v614);
  v297 = v120;
  v464 = v297;
  [v124 registerHandlerForEvent:@"Did start picture in picture" onState:@"Showing multiview playback" withBlock:v463];

  id v125 = objc_loadWeakRetained(&v614);
  v126 = [v125 stateMachine];
  [v126 registerHandlerForEvent:@"Picture in picture presentation did fail" onState:@"Showing main video picture in picture" withBlock:&__block_literal_global_1095];

  id v127 = objc_loadWeakRetained(&v614);
  v128 = [v127 stateMachine];
  v632[0] = @"Showing video full screen";
  v632[1] = @"Showing error message on playback UI";
  v632[2] = @"Showing multiview playback fullscreen";
  v632[3] = @"Showing multiview playback fullscreen due to small screen size";
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v632 count:4];
  v460[0] = MEMORY[0x1E4F143A8];
  v460[1] = 3221225472;
  v460[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_1096;
  v460[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v462, &v614);
  id v130 = v105;
  id v461 = v130;
  [v128 registerHandlerForEvent:@"AVPlayerViewController did end full screen presentation" onStates:v129 withBlock:v460];

  id v131 = objc_loadWeakRetained(&v614);
  v132 = [v131 stateMachine];
  [v132 registerHandlerForEvent:@"AVPlayerViewController did end full screen presentation" onState:@"Transferring player to background media" withBlock:&__block_literal_global_1100];

  id v133 = objc_loadWeakRetained(&v614);
  v134 = [v133 stateMachine];
  [v134 registerDefaultHandlerForEvent:@"Restore user interface for picture in picture stop" withBlock:&__block_literal_global_1103];

  id v135 = objc_loadWeakRetained(&v614);
  v136 = [v135 stateMachine];
  v631[0] = @"Showing main video picture in picture";
  v631[1] = @"Showing multiview playback in PIP";
  v631[2] = @"Showing multiview playback fullscreen in PIP";
  v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v631 count:3];
  v458[0] = MEMORY[0x1E4F143A8];
  v458[1] = 3221225472;
  v458[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1104;
  v458[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v459, &v614);
  [v136 registerHandlerForEvent:@"Restore user interface for picture in picture stop" onStates:v137 withBlock:v458];

  id v138 = objc_loadWeakRetained(&v614);
  v139 = [v138 stateMachine];
  v456[0] = MEMORY[0x1E4F143A8];
  v456[1] = 3221225472;
  v456[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1108;
  v456[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v457, &v614);
  [v139 registerHandlerForEvent:@"Restore user interface for picture in picture stop" onState:@"Showing extras video picture in picture on extras content" withBlock:v456];

  id v140 = objc_loadWeakRetained(&v614);
  v141 = [v140 stateMachine];
  v454[0] = MEMORY[0x1E4F143A8];
  v454[1] = 3221225472;
  v454[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1110;
  v454[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v455, &v614);
  [v141 registerHandlerForEvent:@"Restore user interface for picture in picture stop" onState:@"Showing extras video picture in picture outside extras content" withBlock:v454];

  id v142 = objc_loadWeakRetained(&v614);
  v143 = [v142 stateMachine];
  v630[0] = @"Showing main video picture in picture";
  v630[1] = @"Showing multiview playback in PIP";
  v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:v630 count:2];
  v451[0] = MEMORY[0x1E4F143A8];
  v451[1] = 3221225472;
  v451[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1112;
  v451[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v453, &v614);
  id v145 = v130;
  id v452 = v145;
  [v143 registerHandlerForEvent:@"Did stop picture in picture" onStates:v144 withBlock:v451];

  id v146 = objc_loadWeakRetained(&v614);
  v147 = [v146 stateMachine];
  v629[0] = @"Showing extras video picture in picture on extras content";
  v629[1] = @"Showing extras video picture in picture outside extras content";
  v148 = [MEMORY[0x1E4F1C978] arrayWithObjects:v629 count:2];
  v449[0] = MEMORY[0x1E4F143A8];
  v449[1] = 3221225472;
  v449[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1115;
  v449[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v450, &v614);
  [v147 registerHandlerForEvent:@"Did stop picture in picture" onStates:v148 withBlock:v449];

  id v149 = objc_loadWeakRetained(&v614);
  v150 = [v149 stateMachine];
  v446[0] = MEMORY[0x1E4F143A8];
  v446[1] = 3221225472;
  v446[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1117;
  v446[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v448, &v614);
  v151 = v311;
  v447 = v151;
  [v150 registerHandlerForEvent:@"Did stop picture in picture" onState:@"Showing video full screen" withBlock:v446];

  id v152 = objc_loadWeakRetained(&v614);
  v153 = [v152 stateMachine];
  v442[0] = MEMORY[0x1E4F143A8];
  v442[1] = 3221225472;
  v442[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1118;
  v442[3] = &unk_1E6DF6560;
  objc_copyWeak(&v445, &v614);
  id v154 = v145;
  id v443 = v154;
  v155 = v312;
  v444 = v155;
  [v153 registerDefaultHandlerForEvent:@"Playback state did change" withBlock:v442];

  id v156 = objc_loadWeakRetained(&v614);
  v157 = [v156 stateMachine];
  v440[0] = MEMORY[0x1E4F143A8];
  v440[1] = 3221225472;
  v440[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1120;
  v440[3] = &unk_1E6DF6470;
  v158 = v116;
  v441 = v158;
  [v157 registerHandlerForEvent:@"Playback state did change" onState:@"Waiting for playback to start to return to fullscreen" withBlock:v440];

  id v159 = objc_loadWeakRetained(&v614);
  v160 = [v159 stateMachine];
  [v160 registerHandlerForEvent:@"Playback state did change" onState:@"Showing video full screen with post play content on screen" withBlock:&__block_literal_global_1124];

  id v161 = objc_loadWeakRetained(&v614);
  v162 = [v161 stateMachine];
  v628[0] = @"Showing video full screen";
  v628[1] = @"Showing long loading dialog";
  v163 = [MEMORY[0x1E4F1C978] arrayWithObjects:v628 count:2];
  v434[0] = MEMORY[0x1E4F143A8];
  v434[1] = 3221225472;
  v434[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1126;
  v434[3] = &unk_1E6DF7890;
  objc_copyWeak(&v439, &v614);
  id v164 = v154;
  id v435 = v164;
  v320 = v96;
  v436 = v320;
  v318 = v151;
  v437 = v318;
  v165 = v155;
  v438 = v165;
  [v162 registerHandlerForEvent:@"Playback state did change" onStates:v163 withBlock:v434];

  id v166 = objc_loadWeakRetained(&v614);
  v167 = [v166 stateMachine];
  [v167 registerHandlerForEvent:@"Playback state did change" onState:@"Waiting for Extras AVPlayerViewController presentation to complete" withBlock:&__block_literal_global_1130];

  id v168 = objc_loadWeakRetained(&v614);
  v169 = [v168 stateMachine];
  v432[0] = MEMORY[0x1E4F143A8];
  v432[1] = 3221225472;
  v432[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1131;
  v432[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v433, &v614);
  [v169 registerHandlerForEvent:@"Playback state did change" onState:@"Showing extras video picture in picture on extras content" withBlock:v432];

  id v170 = objc_loadWeakRetained(&v614);
  v171 = [v170 stateMachine];
  [v171 registerHandlerForEvent:@"Playback state did change" onState:@"Showing Extras content" withBlock:&__block_literal_global_1135];

  id v172 = objc_loadWeakRetained(&v614);
  v173 = [v172 stateMachine];
  v627[0] = @"Waiting for AVPlayerViewController presentation to complete";
  v627[1] = @"Waiting for AVPlayerViewController presentation to complete to dismiss";
  v627[2] = @"Waiting for Extras AVPlayerViewController presentation to complete";
  v627[3] = @"Showing error message on playback UI";
  v627[4] = @"Showing error message without playback UI";
  v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v627 count:5];
  [v173 registerHandlerForEvent:@"Playback state did change" onStates:v174 withBlock:&__block_literal_global_1138];

  id v175 = objc_loadWeakRetained(&v614);
  v176 = [v175 stateMachine];
  v428[0] = MEMORY[0x1E4F143A8];
  v428[1] = 3221225472;
  v428[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1139;
  v428[3] = &unk_1E6DF6560;
  objc_copyWeak(&v431, &v614);
  id v177 = v164;
  id v429 = v177;
  v296 = v165;
  v430 = v296;
  [v176 registerHandlerForEvent:@"Playback state did change" onState:@"Showing error message without playback UI" withBlock:v428];

  id v178 = objc_loadWeakRetained(&v614);
  v179 = [v178 stateMachine];
  v426[0] = MEMORY[0x1E4F143A8];
  v426[1] = 3221225472;
  v426[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1141;
  v426[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v427, &v614);
  [v179 registerHandlerForEvent:@"Playback state did change" onState:@"Showing multiview playback" withBlock:v426];

  id v180 = objc_loadWeakRetained(&v614);
  v181 = [v180 stateMachine];
  v423[0] = MEMORY[0x1E4F143A8];
  v423[1] = 3221225472;
  v423[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1142;
  v423[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v425, &v614);
  v295 = v310;
  v424 = v295;
  [v181 registerHandlerForEvent:@"Extras button pressed" onState:@"Showing video full screen" withBlock:v423];

  id v182 = objc_loadWeakRetained(&v614);
  v183 = [v182 stateMachine];
  v626[0] = @"Showing Extras content";
  v626[1] = @"Showing extras video picture in picture on extras content";
  v184 = [MEMORY[0x1E4F1C978] arrayWithObjects:v626 count:2];
  v421[0] = MEMORY[0x1E4F143A8];
  v421[1] = 3221225472;
  v421[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1143;
  v421[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v422, &v614);
  [v183 registerHandlerForEvent:@"Extras menu item selected" onStates:v184 withBlock:v421];

  id v185 = objc_loadWeakRetained(&v614);
  v186 = [v185 stateMachine];
  v419[0] = MEMORY[0x1E4F143A8];
  v419[1] = 3221225472;
  v419[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1145;
  v419[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v420, &v614);
  [v186 registerHandlerForEvent:@"Extras visibility needs update" onState:@"Showing video full screen" withBlock:v419];

  id v187 = objc_loadWeakRetained(&v614);
  v188 = [v187 stateMachine];
  v416[0] = MEMORY[0x1E4F143A8];
  v416[1] = 3221225472;
  v416[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1146;
  v416[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v418, &v614);
  v189 = v326;
  v417 = v189;
  [v188 registerHandlerForEvent:@"Extras visibility needs update" onState:@"Showing Extras content" withBlock:v416];

  id v190 = objc_loadWeakRetained(&v614);
  v191 = [v190 stateMachine];
  v414[0] = MEMORY[0x1E4F143A8];
  v414[1] = 3221225472;
  v414[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1147;
  v414[3] = &unk_1E6DF6470;
  v294 = v329;
  v415 = v294;
  [v191 registerHandlerForEvent:@"Extras visibility needs update" onState:@"Showing extras video picture in picture on extras content" withBlock:v414];

  id v192 = objc_loadWeakRetained(&v614);
  v193 = [v192 stateMachine];
  v412[0] = MEMORY[0x1E4F143A8];
  v412[1] = 3221225472;
  v412[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1148;
  v412[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v413, &v614);
  [v193 registerDefaultHandlerForEvent:@"Extras failure did occur" withBlock:v412];

  id v194 = objc_loadWeakRetained(&v614);
  v195 = [v194 stateMachine];
  v409[0] = MEMORY[0x1E4F143A8];
  v409[1] = 3221225472;
  v409[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1150;
  v409[3] = &unk_1E6DF77C8;
  v196 = v189;
  v410 = v196;
  objc_copyWeak(&v411, &v614);
  [v195 registerHandlerForEvent:@"Extras failure did occur" onState:@"Showing Extras content" withBlock:v409];

  id v197 = objc_loadWeakRetained(&v614);
  v198 = [v197 stateMachine];
  v407[0] = MEMORY[0x1E4F143A8];
  v407[1] = 3221225472;
  v407[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1152;
  v407[3] = &unk_1E6DF6470;
  v199 = v196;
  v408 = v199;
  [v198 registerHandlerForEvent:@"Back button pressed" onState:@"Showing Extras content" withBlock:v407];

  id v200 = objc_loadWeakRetained(&v614);
  v201 = [v200 stateMachine];
  v403[0] = MEMORY[0x1E4F143A8];
  v403[1] = 3221225472;
  v403[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1153;
  v403[3] = &unk_1E6DF6560;
  objc_copyWeak(&v406, &v614);
  v293 = v308;
  v404 = v293;
  v202 = v199;
  v405 = v202;
  [v201 registerHandlerForEvent:@"Back button pressed" onState:@"Showing extras video picture in picture on extras content" withBlock:v403];

  id v203 = objc_loadWeakRetained(&v614);
  v204 = [v203 stateMachine];
  v399[0] = MEMORY[0x1E4F143A8];
  v399[1] = 3221225472;
  v399[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1154;
  v399[3] = &unk_1E6DF6560;
  objc_copyWeak(&v402, &v614);
  v292 = v307;
  v400 = v292;
  v205 = v309;
  v401 = v205;
  [v204 registerHandlerForEvent:@"Extras playback requested" onState:@"Showing Extras content" withBlock:v399];

  id v206 = objc_loadWeakRetained(&v614);
  v207 = [v206 stateMachine];
  v396[0] = MEMORY[0x1E4F143A8];
  v396[1] = 3221225472;
  v396[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1162;
  v396[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v398, &v614);
  v291 = v205;
  v397 = v291;
  [v207 registerHandlerForEvent:@"Extras playback requested" onState:@"Showing extras video picture in picture on extras content" withBlock:v396];

  id v208 = objc_loadWeakRetained(&v614);
  v209 = [v208 stateMachine];
  v625[0] = @"Waiting for AVPlayerViewController presentation to complete";
  v625[1] = @"Waiting for AVPlayerViewController presentation to complete to dismiss";
  v625[2] = @"Waiting for Extras AVPlayerViewController presentation to complete";
  v210 = [MEMORY[0x1E4F1C978] arrayWithObjects:v625 count:3];
  v394[0] = MEMORY[0x1E4F143A8];
  v394[1] = 3221225472;
  v394[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1165;
  v394[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v395, &v614);
  [v209 registerHandlerForEvent:@"Error did occur" onStates:v210 withBlock:v394];

  id v211 = objc_loadWeakRetained(&v614);
  v212 = [v211 stateMachine];
  v392[0] = MEMORY[0x1E4F143A8];
  v392[1] = 3221225472;
  v392[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1166;
  v392[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v393, &v614);
  [v212 registerHandlerForEvent:@"Error did occur" onState:@"Showing long loading dialog" withBlock:v392];

  id v213 = objc_loadWeakRetained(&v614);
  v214 = [v213 stateMachine];
  v624[0] = @"Showing video full screen";
  v624[1] = @"Showing video full screen with post play content on screen";
  v624[2] = @"Showing main video picture in picture";
  v215 = [MEMORY[0x1E4F1C978] arrayWithObjects:v624 count:3];
  v389[0] = MEMORY[0x1E4F143A8];
  v389[1] = 3221225472;
  v389[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1167;
  v389[3] = &unk_1E6DF77C8;
  v216 = v158;
  v390 = v216;
  objc_copyWeak(&v391, &v614);
  [v214 registerHandlerForEvent:@"Error did occur" onStates:v215 withBlock:v389];

  id v217 = objc_loadWeakRetained(&v614);
  v218 = [v217 stateMachine];
  v623[0] = @"Showing error message on playback UI";
  v623[1] = @"Showing error message without playback UI";
  v219 = [MEMORY[0x1E4F1C978] arrayWithObjects:v623 count:2];
  v384[0] = MEMORY[0x1E4F143A8];
  v384[1] = 3221225472;
  v384[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1291;
  v384[3] = &unk_1E6DF7978;
  objc_copyWeak(&v388, &v614);
  v290 = v320;
  v385 = v290;
  id v220 = v177;
  id v386 = v220;
  id v387 = &__block_literal_global_915;
  [v218 registerHandlerForEvent:@"Error alert dismissed" onStates:v219 withBlock:v384];

  id v221 = objc_loadWeakRetained(&v614);
  v222 = [v221 stateMachine];
  [v222 registerHandlerForEvent:@"Download compatible video button pressed" onState:@"Showing error message on playback UI" withBlock:&__block_literal_global_1306];

  id v223 = objc_loadWeakRetained(&v614);
  v224 = [v223 stateMachine];
  v382[0] = MEMORY[0x1E4F143A8];
  v382[1] = 3221225472;
  v382[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1308;
  v382[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v383, &v614);
  [v224 registerHandlerForEvent:@"Force streaming video button pressed" onState:@"Showing error message on playback UI" withBlock:v382];

  id v225 = objc_loadWeakRetained(&v614);
  v226 = [v225 stateMachine];
  v380[0] = MEMORY[0x1E4F143A8];
  v380[1] = 3221225472;
  v380[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1309;
  v380[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v381, &v614);
  [v226 registerHandlerForEvent:@"Play using cellular data button pressed" onState:@"Showing error message on playback UI" withBlock:v380];

  id v227 = objc_loadWeakRetained(&v614);
  v228 = [v227 stateMachine];
  v622[0] = @"Showing multiview playback";
  v622[1] = @"Showing multiview playback in PIP";
  v229 = [MEMORY[0x1E4F1C978] arrayWithObjects:v622 count:2];
  v377[0] = MEMORY[0x1E4F143A8];
  v377[1] = 3221225472;
  v377[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1311;
  v377[3] = &unk_1E6DF77C8;
  v289 = v324;
  v378 = v289;
  objc_copyWeak(&v379, &v614);
  [v228 registerHandlerForEvent:@"Application did enter background" onStates:v229 withBlock:v377];

  id v230 = objc_loadWeakRetained(&v614);
  v231 = [v230 stateMachine];
  v375[0] = MEMORY[0x1E4F143A8];
  v375[1] = 3221225472;
  v375[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1312;
  v375[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v376, &v614);
  [v231 registerDefaultHandlerForEvent:@"Application did enter background" withBlock:v375];

  id v232 = objc_loadWeakRetained(&v614);
  v233 = [v232 stateMachine];
  v621[0] = @"Showing video full screen";
  v621[1] = @"Showing extras video full screen outside extras content";
  v621[2] = @"Showing video full screen with post play content on screen";
  v234 = [MEMORY[0x1E4F1C978] arrayWithObjects:v621 count:3];
  v372[0] = MEMORY[0x1E4F143A8];
  v372[1] = 3221225472;
  v372[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1313;
  v372[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v374, &v614);
  v235 = v318;
  v373 = v235;
  [v233 registerHandlerForEvent:@"Application will enter foreground" onStates:v234 withBlock:v372];

  id v236 = objc_loadWeakRetained(&v614);
  v237 = [v236 stateMachine];
  v620[0] = @"Showing multiview playback";
  v620[1] = @"Showing multiview playback in PIP";
  v238 = [MEMORY[0x1E4F1C978] arrayWithObjects:v620 count:2];
  v369[0] = MEMORY[0x1E4F143A8];
  v369[1] = 3221225472;
  v369[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1315;
  v369[3] = &unk_1E6DF77C8;
  v288 = v322;
  v370 = v288;
  objc_copyWeak(&v371, &v614);
  [v237 registerHandlerForEvent:@"Application will enter foreground" onStates:v238 withBlock:v369];

  id v239 = objc_loadWeakRetained(&v614);
  v240 = [v239 stateMachine];
  v367[0] = MEMORY[0x1E4F143A8];
  v367[1] = 3221225472;
  v367[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1316;
  v367[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v368, &v614);
  [v240 registerDefaultHandlerForEvent:@"Application will enter foreground" withBlock:v367];

  id v241 = objc_loadWeakRetained(&v614);
  v242 = [v241 stateMachine];
  v365[0] = MEMORY[0x1E4F143A8];
  v365[1] = 3221225472;
  v365[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1318;
  v365[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v366, &v614);
  [v242 registerHandlerForEvent:@"Application will resign active" onState:@"Showing Extras content" withBlock:v365];

  id v243 = objc_loadWeakRetained(&v614);
  v244 = [v243 stateMachine];
  v362[0] = MEMORY[0x1E4F143A8];
  v362[1] = 3221225472;
  v362[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1319;
  v362[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v364, &v614);
  v287 = v202;
  v363 = v287;
  [v244 registerHandlerForEvent:@"Application did become active" onState:@"Showing Extras content" withBlock:v362];

  id v245 = objc_loadWeakRetained(&v614);
  v246 = [v245 stateMachine];
  v360[0] = MEMORY[0x1E4F143A8];
  v360[1] = 3221225472;
  v360[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1320;
  v360[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v361, &v614);
  [v246 registerHandlerForEvent:@"External playback type did change" onState:@"Showing multiview playback" withBlock:v360];

  id v247 = objc_loadWeakRetained(&v614);
  v248 = [v247 stateMachine];
  v619[0] = @"Showing video full screen";
  v619[1] = @"Showing main video picture in picture";
  v249 = [MEMORY[0x1E4F1C978] arrayWithObjects:v619 count:2];
  v357[0] = MEMORY[0x1E4F143A8];
  v357[1] = 3221225472;
  v357[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1321;
  v357[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v359, &v614);
  v286 = location;
  v358 = v286;
  [v248 registerHandlerForEvent:@"Post play configuration time reached" onStates:v249 withBlock:v357];

  id v250 = objc_loadWeakRetained(&v614);
  v251 = [v250 stateMachine];
  v354[0] = MEMORY[0x1E4F143A8];
  v354[1] = 3221225472;
  v354[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1322;
  v354[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v356, &v614);
  v252 = v235;
  v355 = v252;
  [v251 registerHandlerForEvent:@"Post play has been configured" onState:@"Showing video full screen" withBlock:v354];

  id v253 = objc_loadWeakRetained(&v614);
  v254 = [v253 stateMachine];
  v351[0] = MEMORY[0x1E4F143A8];
  v351[1] = 3221225472;
  v351[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1323;
  v351[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v353, &v614);
  v285 = v252;
  v352 = v285;
  [v254 registerHandlerForEvent:@"Post play time boundary crossed" onState:@"Showing video full screen" withBlock:v351];

  id v255 = objc_loadWeakRetained(&v614);
  v256 = [v255 stateMachine];
  v348[0] = MEMORY[0x1E4F143A8];
  v348[1] = 3221225472;
  v348[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1324;
  v348[3] = &unk_1E6DF77C8;
  v257 = v216;
  v349 = v257;
  objc_copyWeak(&v350, &v614);
  [v256 registerHandlerForEvent:@"Post play cancelled" onState:@"Showing video full screen with post play content on screen" withBlock:v348];

  id v258 = objc_loadWeakRetained(&v614);
  v259 = [v258 stateMachine];
  v618[0] = @"Post play item selected";
  v618[1] = @"Post play auto play timer did complete";
  v260 = [MEMORY[0x1E4F1C978] arrayWithObjects:v618 count:2];
  v617 = @"Showing video full screen with post play content on screen";
  v261 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v617 count:1];
  v344[0] = MEMORY[0x1E4F143A8];
  v344[1] = 3221225472;
  v344[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1325;
  v344[3] = &unk_1E6DF79C8;
  v284 = v257;
  v345 = v284;
  objc_copyWeak(&v347, &v614);
  id v262 = v220;
  id v346 = v262;
  [v259 registerHandlerForEvents:v260 onStates:v261 withBlock:v344];

  id v263 = objc_loadWeakRetained(&v614);
  v264 = [v263 stateMachine];
  v341[0] = MEMORY[0x1E4F143A8];
  v341[1] = 3221225472;
  v341[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1330;
  v341[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v343, &v614);
  id v265 = v262;
  id v342 = v265;
  [v264 registerHandlerForEvent:@"Post play hide playback" onState:@"Showing video full screen with post play content on screen" withBlock:v341];

  id v266 = objc_loadWeakRetained(&v614);
  v267 = [v266 stateMachine];
  v616[0] = @"Showing video full screen with post play content on screen";
  v616[1] = @"Showing post play content without playback UI";
  v268 = [MEMORY[0x1E4F1C978] arrayWithObjects:v616 count:2];
  v339[0] = MEMORY[0x1E4F143A8];
  v339[1] = 3221225472;
  v339[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1332;
  v339[3] = &unk_1E6DF6470;
  id v269 = v265;
  id v340 = v269;
  [v267 registerHandlerForEvent:@"Playback container did disappear" onStates:v268 withBlock:v339];

  id v270 = objc_loadWeakRetained(&v614);
  v271 = [v270 stateMachine];
  [v271 registerHandlerForEvent:@"Background media enter picture in picture" onState:@"Not showing anything" withBlock:&__block_literal_global_1335];

  id v272 = objc_loadWeakRetained(&v614);
  v273 = [v272 stateMachine];
  v337[0] = MEMORY[0x1E4F143A8];
  v337[1] = 3221225472;
  v337[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1336;
  v337[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v338, &v614);
  [v273 registerHandlerForEvent:@"Background media picture in picture did end" onState:@"Playing background media in picture and picture" withBlock:v337];

  id v274 = objc_loadWeakRetained(&v614);
  v275 = [v274 stateMachine];
  v615[0] = @"Showing video full screen";
  v615[1] = @"Showing multiview playback fullscreen";
  v276 = [MEMORY[0x1E4F1C978] arrayWithObjects:v615 count:2];
  v334[0] = MEMORY[0x1E4F143A8];
  v334[1] = 3221225472;
  v334[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1337;
  v334[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v336, &v614);
  id v283 = v269;
  id v335 = v283;
  [v275 registerHandlerForEvent:@"Transfer player to background media controller" onStates:v276 withBlock:v334];

  id v277 = objc_loadWeakRetained(&v614);
  v278 = [v277 stateMachine];
  [v278 registerHandlerForEvent:@"Main player long loading timer did fire" onState:@"Showing video full screen" withBlock:&__block_literal_global_1342];

  id v279 = objc_loadWeakRetained(&v614);
  v280 = [v279 stateMachine];
  v332[0] = MEMORY[0x1E4F143A8];
  v332[1] = 3221225472;
  v332[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1343;
  v332[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v333, &v614);
  [v280 registerHandlerForEvent:@"Exit playback button pressed" onState:@"Showing long loading dialog" withBlock:v332];

  id v281 = objc_loadWeakRetained(&v614);
  v282 = [v281 stateMachine];
  v330[0] = MEMORY[0x1E4F143A8];
  v330[1] = 3221225472;
  v330[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1347;
  v330[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v331, &v614);
  [v282 registerHandlerForEvent:@"Continue watching button pressed" onState:@"Showing long loading dialog" withBlock:v330];

  objc_destroyWeak(&v331);
  objc_destroyWeak(&v333);

  objc_destroyWeak(&v336);
  objc_destroyWeak(&v338);

  objc_destroyWeak(&v343);
  objc_destroyWeak(&v347);

  objc_destroyWeak(&v350);
  objc_destroyWeak(&v353);

  objc_destroyWeak(&v356);
  objc_destroyWeak(&v359);
  objc_destroyWeak(&v361);

  objc_destroyWeak(&v364);
  objc_destroyWeak(&v366);
  objc_destroyWeak(&v368);
  objc_destroyWeak(&v371);

  objc_destroyWeak(&v374);
  objc_destroyWeak(&v376);
  objc_destroyWeak(&v379);

  objc_destroyWeak(&v381);
  objc_destroyWeak(&v383);

  objc_destroyWeak(&v388);
  objc_destroyWeak(&v391);

  objc_destroyWeak(&v393);
  objc_destroyWeak(&v395);

  objc_destroyWeak(&v398);
  objc_destroyWeak(&v402);

  objc_destroyWeak(&v406);
  objc_destroyWeak(&v411);

  objc_destroyWeak(&v413);
  objc_destroyWeak(&v418);
  objc_destroyWeak(&v420);
  objc_destroyWeak(&v422);

  objc_destroyWeak(&v425);
  objc_destroyWeak(&v427);

  objc_destroyWeak(&v431);
  objc_destroyWeak(&v433);

  objc_destroyWeak(&v439);
  objc_destroyWeak(&v445);

  objc_destroyWeak(&v448);
  objc_destroyWeak(&v450);

  objc_destroyWeak(&v453);
  objc_destroyWeak(&v455);
  objc_destroyWeak(&v457);
  objc_destroyWeak(&v459);

  objc_destroyWeak(&v462);
  objc_destroyWeak(&v465);

  objc_destroyWeak(&v470);
  objc_destroyWeak(&v475);

  objc_destroyWeak(&v477);
  objc_destroyWeak(&v479);

  objc_destroyWeak(&v486);
  objc_destroyWeak(&v489);

  objc_destroyWeak(&v492);
  objc_destroyWeak(&v498);

  objc_destroyWeak(&v505);
  objc_destroyWeak(&v508);

  objc_destroyWeak(&v511);
  objc_destroyWeak(&v514);

  objc_destroyWeak(&v517);
  objc_destroyWeak(&v519);
  objc_destroyWeak(&v521);

  objc_destroyWeak(&v526);
  objc_destroyWeak(&v529);

  objc_destroyWeak(&v532);
  objc_destroyWeak(&v535);

  objc_destroyWeak(&v543);
  objc_destroyWeak(&v546);

  objc_destroyWeak(&v553);
  objc_destroyWeak(&v556);

  objc_destroyWeak(&v560);
  objc_destroyWeak(&v562);

  objc_destroyWeak(&v565);
  objc_destroyWeak(&v569);

  objc_destroyWeak(&v572);
  objc_destroyWeak(&v574);

  objc_destroyWeak(&v576);
  objc_destroyWeak(&v578);

  objc_destroyWeak(&v580);
  objc_destroyWeak(&v584);

  objc_destroyWeak(&v587);
  objc_destroyWeak(&v589);

  objc_destroyWeak(&v591);
  objc_destroyWeak(&v593);

  objc_destroyWeak(&v596);
  objc_destroyWeak(&v598);

  objc_destroyWeak(&v601);
  objc_destroyWeak(&v603);

  objc_destroyWeak(&v605);
  objc_destroyWeak(&v611);

  objc_destroyWeak(&v613);
  objc_destroyWeak(&v614);
}

- (void)_registerAudioSessionNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__audioSessionRouteDidChange_ name:*MEMORY[0x1E4F15168] object:0];
}

- (void)_registerApplicationNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__accountDidChange_ name:*MEMORY[0x1E4FB51D8] object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__groupActivityDidEnd_ name:@"VUIGroupWatchActivitySessionDidEndNotification" object:0];
}

void __26__VUIPlaybackManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v23 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v23 && v6)
  {
    int v8 = [v23 isEqualToString:@"Not showing anything"];
    if (v8 != [v6 isEqualToString:@"Not showing anything"])
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0] object:WeakRetained];
    }
    id v10 = PIPStates();
    int v11 = [v10 containsObject:v23];

    uint64_t v12 = PIPStates();
    uint64_t v13 = [v12 containsObject:v6];

    if (v11 != v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v13];
      [v14 setObject:v15 forKey:VUIPlaybackManagerNotificationKeyIsPIPing[0]];

      id v16 = [*(id *)(a1 + 32) activePlayer];
      objc_msgSend(v14, "vui_setObjectIfNotNil:forKey:", v16, VUIPlaybackManagerNotificationKeyPlayer[0]);

      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 postNotificationName:VUIPlaybackManagerIsPIPingDidChangeNotification[0] object:WeakRetained userInfo:v14];
    }
    BOOL v18 = +[VUIPlaybackManager _isFullScreenPlaybackState:v23];
    if (v18 != +[VUIPlaybackManager _isFullScreenPlaybackState:v6])
    {
      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 postNotificationName:VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0] object:0];
    }
    BOOL v20 = +[VUIPlaybackManager _isShowingExtrasState:v23];
    if (v20 != +[VUIPlaybackManager _isShowingExtrasState:v6])
    {
      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 postNotificationName:VUIPlaybackManagerShowingExtrasDidChangeNotification[0] object:0];
    }
    int v22 = [v23 isEqualToString:@"Showing multiview playback"];
    if (v22 != [v6 isEqualToString:@"Showing multiview playback"]) {
      [WeakRetained _updateMultiviewReportingMetrics];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id val = a4;
  id v60 = a5;
  if ((void *)__PlayerAVPlayerKVOContext_0 == a6)
  {
    id v58 = [(VUIPlaybackManager *)self activePlayer];
    id v10 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v78 = v58;
      __int16 v79 = 2112;
      id v80 = val;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "AVPVC setPlayer late (KVO), activePlayer: %@, object: %@", buf, 0x16u);
    }
    if (v58 != val)
    {
      id v11 = val;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v12 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v69;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v69 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            v17 = [v16 player];
            BOOL v18 = [v17 playlist];
            v19 = [v11 playlist];
            int v20 = [v18 isEqualToPlaylist:v19];

            if (v20)
            {
              id v23 = [v16 player];
              objc_initWeak((id *)buf, v23);

              v24 = [v16 playerViewController];
              objc_initWeak(&location, v24);

              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_547;
              block[3] = &unk_1E6DF5440;
              objc_copyWeak(&v66, (id *)buf);
              objc_copyWeak(&v67, &location);
              dispatch_async(MEMORY[0x1E4F14428], block);
              objc_destroyWeak(&v67);
              objc_destroyWeak(&v66);
              objc_destroyWeak(&location);
              objc_destroyWeak((id *)buf);
              goto LABEL_24;
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      goto LABEL_49;
    }
    id v25 = [(VUIPlaybackManager *)self mainPlayer];
    BOOL v26 = v25 == val;

    if (v26)
    {
      uint64_t v57 = [(VUIPlaybackManager *)self mainAVPlayerViewController];
    }
    else
    {
      id v27 = [(VUIPlaybackManager *)self extrasPlayer];
      BOOL v28 = v27 == val;

      if (!v28)
      {
        id v11 = 0;
LABEL_48:
        objc_initWeak((id *)buf, val);
        objc_initWeak(&location, v11);
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v72[3] = &unk_1E6DF5440;
        objc_copyWeak(&v73, (id *)buf);
        objc_copyWeak(&v74, &location);
        dispatch_async(MEMORY[0x1E4F14428], v72);
        objc_destroyWeak(&v74);
        objc_destroyWeak(&v73);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
LABEL_49:

        goto LABEL_50;
      }
      uint64_t v57 = [(VUIPlaybackManager *)self extrasAVPlayerViewController];
    }
    id v11 = (id)v57;
    goto LABEL_48;
  }
  if ((void *)__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext == a6)
  {
    id v21 = [(VUIPlaybackManager *)self activePlayer];
    if (v21 == val)
    {
      v34 = [(VUIPlaybackManager *)self activePlayer];
      int v35 = [v34 initialMediaItemHasCompletedInitialLoading];

      if (v35)
      {
        id v36 = [(VUIPlaybackManager *)self activePlayer];
        v37 = [v36 currentMediaItem];
        id v38 = [v37 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];

        if (v38 && ([v38 complete] & 1) == 0)
        {
          [v38 addEndEventWithName:*MEMORY[0x1E4FAA370]];
          [v38 addSingleShotEventWithName:*MEMORY[0x1E4FAA350] value:*MEMORY[0x1E4FAA3A0]];
        }
        v39 = [(VUIPlaybackManager *)self activePlayer];
        id v40 = [v39 currentMediaItem];

        if (v40) {
          [(VUIPlaybackManager *)self _setupFeaturesFromMainPlayersCurrentMediaItem];
        }
        id v41 = [(VUIPlaybackManager *)self initialPlaybackStartDate];

        if (!v41)
        {
          v42 = [MEMORY[0x1E4F1C9C8] date];
          [(VUIPlaybackManager *)self setInitialPlaybackStartDate:v42];
        }
        [(VUIPlaybackManager *)self setAutoPlayedVideosCount:[(VUIPlaybackManager *)self autoPlayedVideosCount] + 1];
        v43 = [v40 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA0]];
        if ([v43 integerValue] == 3)
        {
          id v44 = [(VUIPlaybackManager *)self activePlayer];
          uint64_t v45 = [v44 externalPlaybackType];

          if (v45 == 2)
          {
            v46 = +[VUIPlaybackSettings sharedSettings];
            [v46 setPreferAVAdapterCompatibility:1];
          }
        }
        id v47 = +[VUIPostPlayUpsellConfig sharedInstance];
        [v47 setHasShownPostPlay:0];
      }
    }
    else
    {
    }
  }
  else if ((void *)__PlayerAVPlayerViewControllerDisplaySizeKVOContext == a6)
  {
    id v22 = [(VUIPlaybackManager *)self avPlayerViewController];

    if (v22 == val)
    {
      [(VUIPlaybackManager *)self _notifyAVPlayerViewControllerDisplaySize];
      [(VUIPlaybackManager *)self _showOrUpdateAdvisoryViewsIfNeeded];
      [(VUIPlaybackManager *)self _updateMultiviewButtonState];
    }
  }
  else if ((void *)__PlayerMediaItemDurationKVOContext == a6)
  {
    id v29 = [(VUIPlaybackManager *)self mainPlayer];

    if (v29 == val)
    {
      [(VUIPlaybackManager *)self _configureStillWatchingFeatureMonitoringIfLivePlayback];
      id v30 = +[VUIPlaybackTabManager sharedInstance];
      int v31 = [v30 isPlayerTabsEnabled];

      if (v31)
      {
        objc_initWeak((id *)buf, self);
        v32 = +[VUIPlaybackTabManager sharedInstance];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_551;
        v63[3] = &unk_1E6DF4A30;
        objc_copyWeak(&v64, (id *)buf);
        [v32 updatePlayerTabsExcludingCanonicals:0 completion:v63];

        id WeakRetained = objc_loadWeakRetained((id *)buf);
        [WeakRetained _removeAdvisoryViews];

        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else if ((void *)__PlayerViewControllerFrameKVOContext == a6)
  {
    id v48 = [(VUIPlaybackManager *)self multiPlayerViewController];
    [val frame];
    int v51 = objc_msgSend(v48, "isSupportedScreenSize:", v49, v50);

    if (v51)
    {
      v52 = [(VUIPlaybackManager *)self avPlayerViewController];
      v53 = [(VUIPlaybackManager *)self multiPlayerViewController];
      [v52 setDelegate:v53];

      v54 = [(VUIPlaybackManager *)self playbackContainerViewController];
      id v55 = [(VUIPlaybackManager *)self multiPlayerViewController];
      [v54 embedMultiPlayerViewController:v55];

      v56 = [(VUIPlaybackManager *)self multiPlayerViewController];
      [v56 exitFullscreenWithCompletion:0];

      [val removeObserver:self forKeyPath:@"frame" context:__PlayerViewControllerFrameKVOContext];
      [(VUIPlaybackManager *)self setTrackingPlayerViewFrame:0];
    }
  }
  else
  {
    v62.receiver = self;
    v62.super_class = (Class)VUIPlaybackManager;
    [(VUIPlaybackManager *)&v62 observeValueForKeyPath:v59 ofObject:val change:v60 context:a6];
  }
LABEL_50:
}

void __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    id v6 = [v5 avPlayer];
    int v10 = 138412546;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "AVPVC setPlayer late (KVO), activePlayer: %@, AVPlayer: %@", (uint8_t *)&v10, 0x16u);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = [v8 avPlayer];
  [v7 setPlayer:v9];
}

void __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_547(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    id v6 = [v5 avPlayer];
    int v10 = 138412546;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "AVPVC setPlayer late (KVO), activePlayer: %@, AVPlayer: %@", (uint8_t *)&v10, 0x16u);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = [v8 avPlayer];
  [v7 setPlayer:v9];
}

void __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_551(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupInfoTab];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateMultiviewButtonState];
}

- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
}

- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 allowsCellular:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
}

- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 allowsCellular:(BOOL)a6 animated:(BOOL)a7 userInfo:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  BOOL v18 = (void (**)(void))a9;
  v19 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = @"NO";
    *(_DWORD *)buf = 138413570;
    id v49 = v15;
    __int16 v50 = 2112;
    if (v11) {
      id v21 = @"YES";
    }
    else {
      id v21 = @"NO";
    }
    id v51 = v16;
    if (v10) {
      int v20 = @"YES";
    }
    __int16 v52 = 2048;
    int64_t v53 = a5;
    __int16 v54 = 2112;
    id v55 = v21;
    __int16 v56 = 2112;
    uint64_t v57 = v20;
    __int16 v58 = 2112;
    id v59 = v17;
    _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "presentPlaylist:%@, presentingViewController:%@, dismissalOperation:%ld, allowsCellular:%@, animated:%@, userInfo:%@", buf, 0x3Eu);
  }
  if (!v15
    || ([v15 trackList],
        id v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v23 = [v22 count],
        v22,
        !v23))
  {
    id v41 = sLogObject_5;
    if (!os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v42 = "Not presenting playlist since playlist is empty";
    goto LABEL_26;
  }
  if (v16)
  {
    uint64_t v45 = self;
    v24 = [(VUIPlaybackManager *)self stateMachine];
    id v25 = [v24 currentState];

    id v44 = v25;
    if (([v25 isEqualToString:@"Showing main video picture in picture"] & 1) == 0
      && ([v25 isEqualToString:@"Showing extras video picture in picture on extras content"] & 1) == 0
      && ![v25 isEqualToString:@"Showing extras video picture in picture outside extras content"])
    {
      goto LABEL_16;
    }
    BOOL v26 = [(VUIPlaybackManager *)self activePlayer];
    id v27 = [v26 playlist];
    int v28 = [v15 isEqualToPlaylist:v27];

    if (!v28) {
      goto LABEL_16;
    }
    id v29 = +[VUIInterfaceFactory sharedInstance];
    id v30 = [v29 groupActivitiesManager];
    char v31 = [v30 isEligibleForSession];

    if ((v31 & 1) == 0)
    {
      v43 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v43, OS_LOG_TYPE_DEFAULT, "Content is already being played in PIP.  Calling stopPictureInPicture to restore to fullscreen", buf, 2u);
      }
      v37 = [(VUIPlaybackManager *)v45 avPlayerViewController];
      [v37 stopPictureInPicture];
    }
    else
    {
LABEL_16:
      [(VUIPlaybackManager *)v45 configureAudioSessionForBackgroundPlayback:0 usingPlaybackCategory:0 isMultiview:0];
      if (+[VUIUtilities isSUIEnabled]) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = 0;
      }
      v46[0] = @"PlaylistKey";
      v46[1] = @"PresentingViewControllerKey";
      v47[0] = v15;
      v47[1] = v16;
      v46[2] = @"DismissalOperationKey";
      id v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:v32];
      v47[2] = v33;
      v46[3] = @"AnimatedKey";
      v34 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
      v47[3] = v34;
      v46[4] = @"AllowCellularUsageKey";
      int v35 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
      v47[4] = v35;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:5];
      v37 = (void *)[v36 mutableCopy];

      if (v17) {
        [v37 addEntriesFromDictionary:v17];
      }
      if (v18)
      {
        id v38 = _Block_copy(v18);
        v39 = (void *)[v38 copy];
        [v37 setObject:v39 forKey:@"CompletionKey"];
      }
      id v40 = [(VUIPlaybackManager *)v45 stateMachine];
      [v40 postEvent:@"Present playlist" withContext:0 userInfo:v37];
    }
    goto LABEL_35;
  }
  id v41 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v42 = "Not presenting playlist since presenting view controller is nil";
LABEL_26:
    _os_log_impl(&dword_1E2BD7000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
  }
LABEL_27:
  if (v18) {
    v18[2](v18);
  }
LABEL_35:
}

- (void)presentContainerViewController:(id)a3 withPlayer:(id)a4 andPlayerViewController:(id)a5 completion:(id)a6
{
  BOOL v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v18 = [v10 dictionary];
  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v14, @"PlaybackContainerKey");

  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v12, @"PlayerViewControllerKey");
  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v13, @"PlayerKey");

  id v15 = _Block_copy(v11);
  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v15, @"CompletionKey");

  id v16 = [(VUIPlaybackManager *)self stateMachine];
  id v17 = (void *)[v18 copy];
  [v16 postEvent:@"Present player container view controller" withContext:0 userInfo:v17];
}

- (void)presentExtrasWithURL:(id)a3 storeID:(id)a4 actionParams:(id)a5 fromViewController:(id)a6 completion:(id)a7
{
}

- (void)presentExtrasWithURL:(id)a3 storeID:(id)a4 actionParams:(id)a5 hlsURL:(id)a6 fromViewController:(id)a7 completion:(id)a8
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14 || ![v15 length] || !objc_msgSend(v16, "length"))
  {
    uint64_t v29 = sLogObject_5;
    if (!os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)uint64_t v32 = 0;
    id v30 = "Not presenting extras since either extrasURL, storeID or actionsParams is invalid.";
    char v31 = v29;
LABEL_14:
    _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, v30, v32, 2u);
    goto LABEL_15;
  }
  int v20 = sLogObject_5;
  BOOL v21 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (!v21) {
      goto LABEL_15;
    }
    *(_WORD *)uint64_t v32 = 0;
    id v30 = "Not presenting extras since presenting view controller is nil";
    char v31 = v20;
    goto LABEL_14;
  }
  if (v21)
  {
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Presenting extras", v32, 2u);
  }
  uint64_t v22 = *MEMORY[0x1E4FA9E20];
  v35[0] = *MEMORY[0x1E4FA9EF0];
  v35[1] = v22;
  v36[0] = v14;
  v36[1] = v16;
  v35[2] = *MEMORY[0x1E4FAA0D8];
  v36[2] = v15;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v24 = (void *)[v23 mutableCopy];

  if (v17) {
    [v24 setObject:v17 forKey:@"HLSURLKey"];
  }
  v33[0] = @"PresentingViewControllerKey";
  v33[1] = @"DismissalOperationKey";
  v34[0] = v18;
  v34[1] = &unk_1F3F3C998;
  v33[2] = @"AnimatedKey";
  v33[3] = @"ExtrasDictionaryKey";
  v34[2] = MEMORY[0x1E4F1CC38];
  v34[3] = v24;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
  BOOL v26 = (void *)[v25 mutableCopy];

  if (v19)
  {
    id v27 = (void *)[v19 copy];
    [v26 setObject:v27 forKey:@"CompletionKey"];
  }
  int v28 = [(VUIPlaybackManager *)self stateMachine];
  [v28 postEvent:@"Present playlist" withContext:0 userInfo:v26];

LABEL_15:
}

- (BOOL)isPlaylistBeingPresented:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(VUIPlaybackManager *)self activePlayer],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 playlist],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [(VUIPlaybackManager *)self activePlayer];
    id v8 = [v7 playlist];
    char v9 = [v4 isEqualToPlaylist:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isPlaylistBeingPresentedFullScreen:(id)a3
{
  id v4 = a3;
  if ([(VUIPlaybackManager *)self isFullscreenPlaybackUIBeingShown]
    && [(VUIPlaybackManager *)self isPlaylistBeingPresented:v4])
  {
    BOOL v5 = 1;
  }
  else if ([(VUIPlaybackManager *)self isPlaylistBeingPresentedInMultiview:v4])
  {
    BOOL v5 = [(VUIPlaybackManager *)self multiviewPlayerCount] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isPlaylistBeingPresentedInMultiview:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self _multiviewInfoForPlaylist:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)dismissPlaybackAnimated:(BOOL)a3 leaveGroupActivitySession:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  char v9 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Dismiss playback", (uint8_t *)&v23, 2u);
  }
  BOOL v10 = +[VUIInterfaceFactory sharedInstance];
  id v11 = [v10 groupActivitiesManager];
  int v12 = [v11 isSessionActive];

  id v13 = sLogObject_5;
  BOOL v14 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v14) {
      goto LABEL_13;
    }
    LOWORD(v23) = 0;
    id v17 = "No session is active, ignoring leaveGroupActivitySession param";
LABEL_12:
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, 2u);
    goto LABEL_13;
  }
  if (!v5)
  {
    if (!v14) {
      goto LABEL_13;
    }
    LOWORD(v23) = 0;
    id v17 = "Session is active but leaveGroupActivitySession is NO.  Not leaving session";
    goto LABEL_12;
  }
  if (v14)
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Session is active and leaveGroupActivitySession is YES.  Leaving session", (uint8_t *)&v23, 2u);
  }
  id v15 = +[VUIInterfaceFactory sharedInstance];
  id v16 = [v15 groupActivitiesManager];
  [v16 leaveSession];

LABEL_13:
  id v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v6, v23, @"AnimatedKey");
  v25[0] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  int v20 = (void *)[v19 mutableCopy];

  if (v8)
  {
    BOOL v21 = (void *)[v8 copy];
    [v20 setObject:v21 forKey:@"CompletionKey"];
  }
  uint64_t v22 = [(VUIPlaybackManager *)self stateMachine];
  [v22 postEvent:@"Dismiss playback" withContext:0 userInfo:v20];
}

- (void)dismissPostPlayAnimated:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"PostPlaySlideOutAnimationKey";
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v8[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  BOOL v6 = [(VUIPlaybackManager *)self stateMachine];
  [v6 postEvent:@"Post play cancelled" withContext:0 userInfo:v5];
}

- (void)presentMultiviewWithPlaylists:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  char v9 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  [v9 setObject:v10 forKey:@"AnimatedKey"];

  if ([v13 count]) {
    [v9 setObject:v13 forKey:@"PlaylistsKey"];
  }
  if (v8) {
    [v9 setObject:v8 forKey:@"PresentingViewControllerKey"];
  }
  id v11 = [(VUIPlaybackManager *)self stateMachine];
  int v12 = (void *)[v9 copy];
  [v11 postEvent:@"Show multiview playback" withContext:0 userInfo:v12];
}

- (void)addPlaylistToMultiview:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)addPlaylistToMultiview:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v17 = a3;
  id v10 = a6;
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  int v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
  [v11 setObject:v12 forKey:@"AnimatedKey"];

  if (v17) {
    [v11 setObject:v17 forKey:@"PlaylistKey"];
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    id v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [v11 setObject:v13 forKey:@"IndexKey"];
  }
  if (v10)
  {
    BOOL v14 = _Block_copy(v10);
    [v11 setObject:v14 forKey:@"CompletionKey"];
  }
  id v15 = [(VUIPlaybackManager *)self stateMachine];
  id v16 = (void *)[v11 copy];
  [v15 postEvent:@"Add multiview playback" withContext:0 userInfo:v16];
}

- (void)replacePlaylistInMultiviewAtIndex:(int64_t)a3 withPlaylist:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  char v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  [v8 setObject:v9 forKey:@"AnimatedKey"];

  id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v8 setObject:v10 forKey:@"IndexKey"];

  if (v13) {
    [v8 setObject:v13 forKey:@"PlaylistKey"];
  }
  id v11 = [(VUIPlaybackManager *)self stateMachine];
  int v12 = (void *)[v8 copy];
  [v11 postEvent:@"Replace multiview playback" withContext:0 userInfo:v12];
}

- (void)removePlaylistFromMultiview:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  BOOL v6 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v6 setObject:v7 forKey:@"AnimatedKey"];

  if (v10) {
    [v6 setObject:v10 forKey:@"PlaylistKey"];
  }
  id v8 = [(VUIPlaybackManager *)self stateMachine];
  char v9 = (void *)[v6 copy];
  [v8 postEvent:@"Remove multiview playback" withContext:0 userInfo:v9];
}

- (void)removeFromMultiviewWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(VUIPlaybackManager *)self indexOfMediaItemInMultiviewWithIdentifier:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    id v8 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    unint64_t v9 = [v8 count];

    if (v7 < v9)
    {
      id v10 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      id v15 = [v10 objectAtIndex:v7];

      id v11 = [v15 player];
      int v12 = [v11 playlist];

      if (v12)
      {
        id v13 = [v15 player];
        BOOL v14 = [v13 playlist];

        [(VUIPlaybackManager *)self removePlaylistFromMultiview:v14 animated:v4];
      }
    }
  }
}

- (BOOL)multiviewContainsMediaItemWithIdentifier:(id)a3
{
  return [(VUIPlaybackManager *)self indexOfMediaItemInMultiviewWithIdentifier:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexOfMediaItemInMultiviewWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = *MEMORY[0x1E4FA9E28];
    while (1)
    {
      unint64_t v9 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      id v10 = [v9 objectAtIndex:v7];

      uint64_t v11 = [v10 player];
      int v12 = [(id)v11 currentMediaItem];
      id v13 = [v12 mediaItemMetadataForProperty:v8];

      LOBYTE(v11) = [v13 isEqualToString:v4];
      if (v11) {
        break;
      }
      ++v7;
      BOOL v14 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      unint64_t v15 = [v14 count];

      if (v7 >= v15) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (unint64_t)indexOfMediaItemInMultiviewWithPlayer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      unint64_t v9 = [v8 objectAtIndex:v7];

      id v10 = [v9 player];

      if (v10 == v4) {
        break;
      }
      ++v7;
      uint64_t v11 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      unint64_t v12 = [v11 count];

      if (v7 >= v12) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)multiviewPlayerCount
{
  v2 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)maxMultiviewPlayerCount
{
  v2 = +[VUIFeaturesConfiguration sharedInstance];
  int64_t v3 = [v2 multiviewConfig];
  int64_t v4 = [v3 maximumPlayerCount];

  return v4;
}

- (BOOL)isMaloneEnabled
{
  return 0;
}

- (BOOL)isMultiviewPlaybackUIBeingShown
{
  v2 = [(VUIPlaybackManager *)self stateMachine];
  int64_t v3 = [v2 currentState];
  char v4 = [v3 isEqualToString:@"Showing multiview playback"];

  return v4;
}

- (BOOL)isShowingExtras
{
  v2 = [(VUIPlaybackManager *)self stateMachine];
  int64_t v3 = [v2 currentState];
  BOOL v4 = +[VUIPlaybackManager _isShowingExtrasState:v3];

  return v4;
}

+ (BOOL)_isShowingExtrasState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Showing Extras content"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"Showing extras video picture in picture on extras content"];
  }

  return v4;
}

- (BOOL)isPlaybackUIBeingShown
{
  v2 = [(VUIPlaybackManager *)self stateMachine];
  id v3 = [v2 currentState];
  char v4 = [v3 isEqualToString:@"Not showing anything"] ^ 1;

  return v4;
}

- (BOOL)isPIPing
{
  v2 = [(VUIPlaybackManager *)self stateMachine];
  id v3 = [v2 currentState];

  char v4 = PIPStates();
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)isPIPingBackgroundPlayback
{
  v2 = [(VUIPlaybackManager *)self stateMachine];
  id v3 = [v2 currentState];

  LOBYTE(v2) = [v3 isEqualToString:@"Playing background media in picture and picture"];
  return (char)v2;
}

- (TVPMediaItem)currentMediaItem
{
  v2 = [(VUIPlaybackManager *)self activePlayer];
  id v3 = [v2 currentMediaItem];

  return (TVPMediaItem *)v3;
}

- (BOOL)currentPlaylistAllowsCellular
{
  v2 = [(VUIPlaybackManager *)self activePlayer];
  char v3 = [v2 allowsCellularUsage];

  return v3;
}

- (id)createPlayerViewController
{
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F16750]) initWithNibName:0 bundle:0];
  [(VUIPlaybackManager *)self _setupPlayerViewController:v3];
  return v3;
}

- (void)_setupPlayerViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  [v4 setDelegate:self];

  [v4 setEntersFullScreenWhenPlaybackBegins:1];
  [v4 setAllowsPictureInPicturePlayback:1];
  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"ForcePlaybackControls"];

  if (v7) {
    [v4 setCanHidePlaybackControls:0];
  }
  objc_destroyWeak(&location);
}

- (void)setBackgroundMediaControllerForPIP:(id)a3
{
  -[VUIPlaybackManager setPIPedBackgroundMediaController:](self, "setPIPedBackgroundMediaController:");
  id v5 = [(VUIPlaybackManager *)self stateMachine];
  id v7 = v5;
  if (a3) {
    uint64_t v6 = @"Background media enter picture in picture";
  }
  else {
    uint64_t v6 = @"Background media picture in picture did end";
  }
  [v5 postEvent:v6];
}

- (void)restoreBackgroundMediaControllerFromPIP:(id)a3
{
  id v4 = a3;
  id v5 = +[VUIApplicationRouter currentNavigationController];
  uint64_t v6 = [v5 topViewController];
  id v11 = [v6 presentedViewController];
  if (!v11)
  {
    id v7 = +[VUITVAppLauncher sharedInstance];
    uint64_t v8 = [v7 appWindow];

    id v11 = [v8 rootViewController];

    if (!v11)
    {
      unint64_t v9 = +[VUIInterfaceFactory sharedInstance];
      id v11 = [v9 controllerPresenter];
    }
  }
  id v10 = [(VUIPlaybackManager *)self PIPedBackgroundMediaController];
  [v11 presentViewController:v10 animated:1 completion:v4];
}

- (VUIPlayer)backgroundMediaPlayer
{
  v2 = [(VUIPlaybackManager *)self PIPedBackgroundMediaController];
  if ([v2 conformsToProtocol:&unk_1F4022B88])
  {
    char v3 = [v2 activePlayer];
  }
  else
  {
    char v3 = 0;
  }

  return (VUIPlayer *)v3;
}

- (void)setAvPlayerViewController:(id)a3
{
  id v5 = (AVPlayerViewController *)a3;
  p_avPlayerViewController = &self->_avPlayerViewController;
  avPlayerViewController = self->_avPlayerViewController;
  uint64_t v8 = v5;
  if (avPlayerViewController != v5)
  {
    if (avPlayerViewController) {
      [(AVPlayerViewController *)avPlayerViewController removeObserver:self forKeyPath:@"videoBounds" context:__PlayerAVPlayerViewControllerDisplaySizeKVOContext];
    }
    objc_storeStrong((id *)&self->_avPlayerViewController, a3);
    if (*p_avPlayerViewController) {
      [(AVPlayerViewController *)*p_avPlayerViewController addObserver:self forKeyPath:@"videoBounds" options:0 context:__PlayerAVPlayerViewControllerDisplaySizeKVOContext];
    }
  }
}

- (void)setActivePlayer:(id)a3
{
  id obj = a3;
  p_activePlayer = &self->_activePlayer;
  id WeakRetained = objc_loadWeakRetained((id *)p_activePlayer);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_activePlayer, obj);
    uint64_t v6 = obj;
  }
}

- (BOOL)_audioContainsAirPlayRoute
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F153E0] sharedInstance];
  char v3 = [v2 currentRoute];
  id v4 = [v3 outputs];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = (void *)*MEMORY[0x1E4F150B8];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "portType", (void)v12);

        if (v10 == v8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_audioContainsHDMIRoute
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F153E0] sharedInstance];
  char v3 = [v2 currentRoute];
  id v4 = [v3 outputs];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = (void *)*MEMORY[0x1E4F15130];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "portType", (void)v12);

        if (v10 == v8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)configureAudioSessionForBackgroundPlayback:(BOOL)a3 usingPlaybackCategory:(BOOL)a4 isMultiview:(BOOL)a5
{
  unint64_t v9 = [(VUIPlaybackManager *)self stateMachine];
  id v10 = [v9 currentState];
  char v11 = [v10 isEqualToString:@"Not showing anything"] ^ 1;

  long long v12 = [(VUIPlaybackManager *)self audioSessionSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  BOOL v14 = a3;
  char v15 = v11;
  BOOL v16 = a4;
  BOOL v17 = a5;
  dispatch_async(v12, block);
}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke(unsigned char *a1)
{
  if (!a1[32])
  {
    char v3 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Setting the audio category to AVAudioSessionCategoryPlayback, mode:AVAudioSessionModeMoviePlayback, routing: AVAudioSessionRouteSharingPolicyLongFormVideo", buf, 2u);
    }
    char v4 = a1[35];
    id v5 = [MEMORY[0x1E4FA9D38] sharedInstance];
    uint64_t v6 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_590;
    v11[3] = &__block_descriptor_33_e24_v16__0__AVAudioSession_8l;
    char v12 = v4;
    uint64_t v7 = v11;
    goto LABEL_15;
  }
  if (!a1[33])
  {
    int v8 = a1[34];
    unint64_t v9 = sLogObject_5;
    BOOL v10 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Setting the audio category to AVAudioSessionCategoryPlayback, mode:AVAudioSessionModeDefault", buf, 2u);
      }
      id v5 = [MEMORY[0x1E4FA9D38] sharedInstance];
      uint64_t v6 = v5;
      uint64_t v7 = &__block_literal_global_586;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Setting the audio category to AVAudioSessionCategoryAmbient, mode:AVAudioSessionModeDefault", buf, 2u);
      }
      id v5 = [MEMORY[0x1E4FA9D38] sharedInstance];
      uint64_t v6 = v5;
      uint64_t v7 = &__block_literal_global_589;
    }
LABEL_15:
    [v5 setConfigurationBlock:v7];

    return;
  }
  v2 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set audio category to AVAudioSessionCategoryAmbient since playback is happening either fullscreen or in PIP", buf, 2u);
  }
}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_583(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F14F98];
  uint64_t v3 = *MEMORY[0x1E4F15050];
  id v7 = 0;
  char v4 = [a2 setCategory:v2 mode:v3 options:0 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Failed to set audio session playback category: %@", buf, 0xCu);
    }
  }
}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_587(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F14F68];
  uint64_t v3 = *MEMORY[0x1E4F15050];
  id v7 = 0;
  char v4 = [a2 setCategory:v2 mode:v3 options:0 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Failed to set audio session playback category: %@", buf, 0xCu);
    }
  }
}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_590(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F14F98];
  uint64_t v4 = *MEMORY[0x1E4F15060];
  id v16 = 0;
  id v5 = a2;
  LOBYTE(v4) = [v5 setCategory:v3 mode:v4 routeSharingPolicy:3 options:0 error:&v16];
  id v6 = v16;
  if ((v4 & 1) == 0)
  {
    id v7 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Failed to set audio session playback category: %@", buf, 0xCu);
    }
  }
  int v8 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = VUIBoolLogString();
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Setting prefers concurrent air play audio %@", buf, 0xCu);
  }
  uint64_t v11 = *(unsigned __int8 *)(a1 + 32);
  id v15 = v6;
  char v12 = [v5 setPrefersConcurrentAirPlayAudio:v11 error:&v15];

  id v13 = v15;
  if ((v12 & 1) == 0)
  {
    BOOL v14 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Failed to set prefers concurrent air play audio %@", buf, 0xCu);
    }
  }
}

- (VUIControllerPresenter)fullScreenViewControllerForPresentation
{
  if (![(VUIPlaybackManager *)self isFullscreenPlaybackUIBeingShown]
    || ([(VUIPlaybackManager *)self avPlayerViewController],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "vui_viewControllerForFullScreenPresentation"),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    id v5 = +[VUITVAppLauncher sharedInstance];
    id v6 = [v5 appWindow];
    uint64_t v4 = [v6 rootViewController];
  }
  return (VUIControllerPresenter *)v4;
}

- (BOOL)isPostPlayActive
{
  uint64_t v3 = [(VUIPlaybackManager *)self stateMachine];
  uint64_t v4 = [v3 currentState];
  if ([v4 isEqualToString:@"Showing video full screen with post play content on screen"])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(VUIPlaybackManager *)self stateMachine];
    id v7 = [v6 currentState];
    char v5 = [v7 isEqualToString:@"Showing post play content without playback UI"];
  }
  return v5;
}

- (void)transferPlaybackToBackgroundMediaController:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v8)
  {
    char v5 = (void *)[v8 copy];
    [v4 setObject:v5 forKey:@"CompletionKey"];
  }
  id v6 = [(VUIPlaybackManager *)self stateMachine];
  id v7 = (void *)[v4 copy];
  [v6 postEvent:@"Transfer player to background media controller" withContext:0 userInfo:v7];
}

- (void)startPictureInPicture
{
  id v2 = [(VUIPlaybackManager *)self avPlayerViewController];
  [v2 startPictureInPicture];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__VUIPlaybackManager_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v9[3] = &unk_1E6DF7028;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 animateAlongsideTransition:&__block_literal_global_595 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __97__VUIPlaybackManager_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v3 = [WeakRetained stateMachine];
    [v3 postEvent:@"AVPlayerViewController did end full screen presentation" withContext:*(void *)(a1 + 32)];
  }
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerWillStartPictureInPicture: %@", buf, 0xCu);
  }
  id v6 = [(VUIPlaybackManager *)self stateMachine];
  id v8 = @"PlayerViewControllerKey";
  id v9 = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 postEvent:@"Will start picture in picture" withContext:0 userInfo:v7];
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerDidStartPictureInPicture: %@", (uint8_t *)&v9, 0xCu);
  }
  [(VUIPlaybackManager *)self _markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:1 forAVPlayerViewController:v4];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v4, @"PlayerViewControllerKey");
  id v7 = [(VUIPlaybackManager *)self stateMachine];
  id v8 = (void *)[v6 copy];
  [v7 postEvent:@"Did start picture in picture" withContext:0 userInfo:v8];
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "playerViewController:failedToStartPictureInPictureWithError: %@, %@", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [(VUIPlaybackManager *)self stateMachine];
  [v9 postEvent:@"Picture in picture presentation did fail"];
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerWillStopPictureInPicture: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VUIPlaybackManager_playerViewControllerWillStopPictureInPicture___block_invoke;
  block[3] = &unk_1E6DF3D58;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__VUIPlaybackManager_playerViewControllerWillStopPictureInPicture___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 postEvent:@"Will stop picture in picture"];
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerDidStopPictureInPicture: %@", buf, 0xCu);
  }
  [(VUIPlaybackManager *)self _markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:0 forAVPlayerViewController:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__VUIPlaybackManager_playerViewControllerDidStopPictureInPicture___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __66__VUIPlaybackManager_playerViewControllerDidStopPictureInPicture___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = *(void *)(a1 + 40);
  char v5 = @"PlayerViewControllerKey";
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postEvent:@"Did stop picture in picture" withContext:0 userInfo:v4];
}

- (id)playerViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  char v5 = objc_msgSend(v4, "vui_localizedDisplayNameOverride");
  if (v5)
  {
    id v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "App providing localized display name for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler: %@", buf, 0xCu);
  }
  if (v7)
  {
    uint64_t v14 = @"CompletionKey";
    id v9 = (void *)[v7 copy];
    id v15 = v9;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
  else
  {
    __int16 v10 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__VUIPlaybackManager_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6DF3F68;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __108__VUIPlaybackManager_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 postEvent:@"Restore user interface for picture in picture stop" withContext:0 userInfo:*(void *)(a1 + 40)];
}

- (void)playerViewController:(id)a3 contentViewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [(VUIPlaybackManager *)self skipButton];
  if (v11)
  {
  }
  else
  {
    uint64_t v12 = [(VUIPlaybackManager *)self promoMetadataView];

    if (!v12) {
      goto LABEL_5;
    }
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__VUIPlaybackManager_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v24[3] = &unk_1E6DF7050;
  v26[1] = *(id *)&width;
  v26[2] = *(id *)&height;
  v24[4] = self;
  objc_copyWeak(v26, &location);
  id v25 = v9;
  [v10 animateAlongsideTransition:v24 completion:&__block_literal_global_598];

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
LABEL_5:
  id v13 = [(VUIPlaybackManager *)self mainAVPlayerViewController];
  BOOL v14 = v13 == v9;

  if (v14)
  {
    id v15 = [(VUIPlaybackManager *)self mainLivePostPlayController];
    objc_msgSend(v15, "playerViewControllerWillTransitionToSize:withTransitionCoordinator:", v10, width, height);
  }
  id v16 = [(VUIPlaybackManager *)self extrasContext];
  if (objc_msgSend(v16, "shouldExtrasBeVisibleForSize:", width, height))
  {
    id v17 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v18 = [v17 groupActivitiesManager];
    int v19 = [v18 isSessionActive];

    uint64_t v20 = v19 ^ 1u;
  }
  else
  {
    uint64_t v20 = 0;
  }

  BOOL v21 = [(VUIPlaybackManager *)self stateMachine];
  int v28 = @"ExtrasShouldBeVisibleKey";
  uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithBool:v20];
  v29[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  [v21 postEvent:@"Extras visibility needs update" withContext:0 userInfo:v23];
}

void __101__VUIPlaybackManager_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v44 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", *(double *)(a1 + 56));
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", *(double *)(a1 + 64));
  uint64_t v5 = v4;
  if ((unint64_t)(v3 - 3) <= 2)
  {
    if ((unint64_t)(v4 - 2) >= 4) {
      double v6 = 34.0;
    }
    else {
      double v6 = 80.0;
    }
    if ((unint64_t)(v4 - 2) >= 4) {
      double v7 = 90.0;
    }
    else {
      double v7 = 80.0;
    }
LABEL_8:
    char v8 = 1;
    goto LABEL_12;
  }
  double v7 = 0.0;
  if (v3 == 2)
  {
    id v9 = [*(id *)(a1 + 32) promoMetadataView];

    if (!v9)
    {
      if ((unint64_t)(v5 - 2) >= 4) {
        double v7 = 90.0;
      }
      else {
        double v7 = 80.0;
      }
      if ((unint64_t)(v5 - 2) >= 4) {
        double v6 = 34.0;
      }
      else {
        double v6 = 80.0;
      }
      goto LABEL_8;
    }
  }
  char v8 = 0;
  double v6 = 34.0;
LABEL_12:
  id v10 = [*(id *)(a1 + 32) skipButton];

  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v12 = WeakRetained;
    if (v8)
    {
      id v13 = [WeakRetained skipCenterXConstraint];
      [v13 setActive:0];

      id v14 = objc_loadWeakRetained((id *)(a1 + 48));
      id v15 = [v14 skipTrailingConstraint];
      [v15 setConstant:-v7];

      id v16 = objc_loadWeakRetained((id *)(a1 + 48));
      [v16 skipTrailingConstraint];
    }
    else
    {
      v37 = [WeakRetained skipTrailingConstraint];
      [v37 setActive:0];

      id v16 = objc_loadWeakRetained((id *)(a1 + 48));
      [v16 skipCenterXConstraint];
    id v38 = };
    [v38 setActive:1];

    id v39 = objc_loadWeakRetained((id *)(a1 + 48));
    id v40 = [v39 skipBottomConstraint];
    [v40 setConstant:-v6];

    goto LABEL_31;
  }
  id v17 = [*(id *)(a1 + 32) promoMetadataView];

  if (v17)
  {
    uint64_t v18 = [*(id *)(a1 + 32) promoMetadataView];
    objc_msgSend(v18, "vui_sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v20 = v19;
    double v22 = v21;

    if (v8)
    {
      uint64_t v23 = [*(id *)(a1 + 32) promoMetadataView];
      int v24 = [v23 vuiIsRTL];

      VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      id v33 = [*(id *)(a1 + 32) promoMetadataView];
      objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

      v34 = *(void **)(a1 + 40);
      if (!v24)
      {
        double v42 = v7 + v30;
        double v35 = 0.0;
        double v36 = 0.0;
        goto LABEL_30;
      }
      double v35 = v26 + v30;
      double v36 = 0.0;
    }
    else
    {
      id v41 = [*(id *)(a1 + 32) promoMetadataView];
      objc_msgSend(v41, "setFrame:", (*(double *)(a1 + 56) - v20) * 0.5, *(double *)(a1 + 64) - v22 - v6, v20, v22);

      v34 = *(void **)(a1 + 40);
      double v36 = v6 + v22;
      double v35 = 0.0;
    }
    double v42 = 0.0;
LABEL_30:
    objc_msgSend(v34, "setLegibleContentInsets:", 0.0, v35, v36, v42);
  }
LABEL_31:
  v43 = [*(id *)(a1 + 40) view];
  [v43 setNeedsLayout];
}

- (void)extrasRequestsMediaPlayback:(id)a3 isBackground:(BOOL)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    double v7 = objc_opt_new();
    char v8 = [(VUIPlaybackManager *)self extrasContext];
    id v9 = [v8 tvpMediaItem];

    id v10 = [v7 playlistForIKMediaElements:v6 withMediaItem:v9 isExtrasContent:1];

    if (v10)
    {
      id v11 = [(VUIPlaybackManager *)self stateMachine];
      v14[0] = @"PlaylistKey";
      v14[1] = @"IsBackgroundPlaybackKey";
      v15[0] = v10;
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
      v15[1] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      [v11 postEvent:@"Extras playback requested" withContext:0 userInfo:v13];
    }
  }
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(VUIPlaybackManager *)self setTransportBarVisible:v6];
  id v10 = [(VUIPlaybackManager *)self mainLivePostPlayController];
  [v10 playerControlsVisibilityChanged:v6];

  if (v6)
  {
    id v11 = [(VUIPlaybackManager *)self activePlayer];
    uint64_t v12 = [v11 state];
    id v13 = [MEMORY[0x1E4FA9D88] loading];

    if (v12 != v13) {
      [(VUIPlaybackManager *)self _resetAutoPlayBingeWatchingQualifications];
    }
    id v14 = [(VUIPlaybackManager *)self activePlayer];
    id v15 = [v14 currentMediaItem];
    id v16 = [v15 mediaItemMetadataForProperty:@"VUIMediaItemMetadataMakeAdditionalPlayerTabsRequest"];
    int v17 = [v16 BOOLValue];

    if (v17)
    {
      objc_initWeak(&location, self);
      uint64_t v18 = +[VUIPlaybackTabManager sharedInstance];
      double v19 = [(VUIPlaybackManager *)self multiviewIdentifiers];
      double v20 = (void *)[v19 copy];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __113__VUIPlaybackManager_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
      v21[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v22, &location);
      [v18 updatePlayerTabsExcludingCanonicals:v20 completion:v21];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(VUIPlaybackManager *)self _addSkipIntroFeatureToMonitorIfNeeded:0];
  }
}

void __113__VUIPlaybackManager_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMultiviewButtonState];
}

- (void)extrasDoneButtonPressed
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(VUIPlaybackManager *)self stateMachine];
  BOOL v4 = @"AnimatedKey";
  v5[0] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 postEvent:@"Done Button Pressed" withContext:0 userInfo:v3];
}

- (void)extrasMenuItemSelected:(id)a3 atIndex:(unint64_t)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(VUIPlaybackManager *)self stateMachine];
  v10[0] = @"MenuItemElementKey";
  v10[1] = @"MenuItemIndexKey";
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [v7 postEvent:@"Extras menu item selected" withContext:0 userInfo:v9];
}

- (void)extrasBackButtonPressed
{
  id v2 = [(VUIPlaybackManager *)self stateMachine];
  [v2 postEvent:@"Back button pressed"];
}

- (void)extrasContext:(id)a3 hadFatalError:(id)a4
{
  id v5 = a4;
  id v6 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR)) {
    -[VUIPlaybackManager extrasContext:hadFatalError:]((uint64_t)v5, v6);
  }
  double v7 = [(VUIPlaybackManager *)self stateMachine];
  [v7 postEvent:@"Extras failure did occur"];
}

- (void)extrasContextDidLoadMainMenuItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIPlaybackManager *)self extrasContext];
  id v6 = [v5 mainMenuItemElements];

  double v7 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v19 = 134217984;
    uint64_t v20 = [v6 count];
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Extras context did load %lu main menu items", (uint8_t *)&v19, 0xCu);
  }
  id v9 = [(VUIPlaybackManager *)self extrasControlItem];

  if (!v9 && [v6 count])
  {
    id v10 = [(VUIPlaybackManager *)self avPlayerViewController];
    id v11 = [v10 view];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    if (objc_msgSend(v4, "shouldExtrasBeVisibleForSize:", v13, v15))
    {
      id v16 = +[VUIInterfaceFactory sharedInstance];
      int v17 = [v16 groupActivitiesManager];
      uint64_t v18 = [v17 isSessionActive] ^ 1;
    }
    else
    {
      uint64_t v18 = 0;
    }
    [(VUIPlaybackManager *)self _setExtrasButtonVisible:v18];
  }
}

- (void)extrasContext:(id)a3 extrasVisibilityNeedsUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(VUIPlaybackManager *)self stateMachine];
  id v8 = @"ExtrasShouldBeVisibleKey";
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  v9[0] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 postEvent:@"Extras visibility needs update" withContext:0 userInfo:v7];
}

- (void)featureMonitor:(id)a3 featureDidChangeState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_1F3F797F8])
  {
    [(VUIPlaybackManager *)self _updateTimeBoundFeature:v7 animated:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VUIPlaybackManager *)self _updateTimeTriggeredFeature:v7 animated:v5];
    }
  }
}

- (void)playbackContainerViewControllerDidFinishLoadingPostPlay:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Post play has been configured" withContext:0 userInfo:0];
}

- (void)playbackContainerViewControllerExitPictureInPicturePressed:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Post play cancelled"];
}

- (void)playbackContainerViewControllerBackgroundPlaybackWillBegin:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Post play hide playback"];
}

- (void)playbackContainerViewControllerDidDisappear:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Playback container did disappear"];
}

- (void)playbackContainerViewControllerWillTransitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = +[VUIPlaybackTabManager sharedInstance];
  objc_msgSend(v5, "updatePlayerViewSize:", width, height);
}

- (NSArray)multiviewIdentifiers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4FA9E28];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) player];
        id v11 = [v10 currentMediaItem];
        double v12 = [v11 mediaItemMetadataForProperty:v8];

        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)mediaSupportsStartOver
{
  id v2 = [(VUIPlaybackManager *)self currentMediaItem];
  id v3 = [v2 mediaItemMetadataForProperty:@"VUIMediaItemMetadataSupportsStartOver"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)experienceManagerDidDismissPresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Experience controller playback was dismissed", v7, 2u);
  }
  uint64_t v6 = [(VUIPlaybackManager *)self stateMachine];
  [v6 postEvent:@"AVPlayerViewController did end full screen presentation" withContext:v4];
}

- (void)experienceManagerDidRemoveFromMultiview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Player was removed from multiview", v7, 2u);
  }
  uint64_t v6 = [(VUIPlaybackManager *)self stateMachine];
  [v6 postEvent:@"Playback was removed from multiview" withContext:v4];
}

- (void)experienceManagerDidTransitionToFullScreen:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v5, @"PlayerViewControllerKey");

  uint64_t v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Player transitioned from multiview to full screen", v10, 2u);
  }
  uint64_t v8 = [(VUIPlaybackManager *)self stateMachine];
  id v9 = (void *)[v6 copy];
  [v8 postEvent:@"Dismiss multiview playback" withContext:0 userInfo:v9];
}

- (void)experienceManagerWillTransitionToMultiview
{
  id v3 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Experience manager will transition to multiview", v5, 2u);
  }
  id v4 = [(VUIPlaybackManager *)self stateMachine];
  [v4 postEvent:@"Show multiview playback" withContext:0 userInfo:0];
}

- (void)experienceManagerPresentationDidComplete
{
  id v3 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "ExperienceManager presentation did complete", v5, 2u);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__avPlayerViewControllerPresentationDidTimeout object:0];
  id v4 = [(VUIPlaybackManager *)self stateMachine];
  [v4 postEvent:@"AVPlayerViewController presentation did complete" withContext:0 userInfo:0];
}

- (id)createContentSelectionViewController
{
  id v3 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v17 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Creating content selection view controller", v17, 2u);
  }
  id v4 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  id v5 = [v4 firstObject];

  uint64_t v6 = +[VUIPlaybackTabManager sharedInstance];
  uint64_t v7 = [v6 tabsInfo];
  uint64_t v8 = [v7 multiviewTabInfo];

  if (v8)
  {
    uint64_t v9 = [v5 broadcastLocale];
    id v10 = (void *)v9;
    id v11 = &stru_1F3E921E0;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    double v12 = v11;

    double v13 = +[VUIPlaybackTabManager sharedInstance];
    uint64_t v14 = [v5 playsFromStart];
    long long v15 = [v13 createHUDViewControllerWithTabInfo:v8 excludingCanonicals:MEMORY[0x1E4F1CBF0] isMultiview:1 locale:v12 playsFromStart:v14];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)_playbackStateDidChange:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FAA3C8]];

  uint64_t v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    double v30 = *(double *)&v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Playback state did change to %@", (uint8_t *)&v29, 0xCu);
  }
  uint64_t v8 = [v4 object];
  uint64_t v9 = [(VUIPlaybackManager *)self mainPlayer];

  if (v8 != v9)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  if ([(VUIPlaybackManager *)self hasMainPlayerFinishedInitialLoading]) {
    goto LABEL_11;
  }
  uint64_t v15 = [MEMORY[0x1E4FA9D88] playing];
  if (v6 == (void *)v15)
  {
  }
  else
  {
    long long v16 = (void *)v15;
    long long v17 = [MEMORY[0x1E4FA9D88] paused];

    if (v6 != v17)
    {
LABEL_11:
      uint64_t v10 = 0;
      goto LABEL_14;
    }
  }
  [(VUIPlaybackManager *)self setHasMainPlayerFinishedInitialLoading:1];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
LABEL_14:
  uint64_t v18 = [MEMORY[0x1E4FA9D88] loading];

  uint64_t v19 = [(VUIPlaybackManager *)self mainPlayerLongLoadingTimer];

  if (v6 == v18)
  {
    if (!v19)
    {
      id v22 = +[VUIFeaturesConfiguration sharedInstance];
      uint64_t v23 = [v22 nowPlayingConfig];
      [v23 longLoadingTimeout];
      double v25 = v24;

      double v26 = sLogObject_5;
      BOOL v27 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
      if (v25 <= 0.0)
      {
        if (v27)
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Not starting long loading timer since timeout value is 0 or less", (uint8_t *)&v29, 2u);
        }
      }
      else
      {
        if (v27)
        {
          int v29 = 134217984;
          double v30 = v25;
          _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Starting long loading timer.  Will fire if loading for more than %f seconds", (uint8_t *)&v29, 0xCu);
        }
        double v28 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__handleLongLoadingTimeout_ selector:0 userInfo:0 repeats:v25];
        [(VUIPlaybackManager *)self setMainPlayerLongLoadingTimer:v28];
      }
    }
  }
  else if (v19)
  {
    uint64_t v20 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Invalidating long loading timer", (uint8_t *)&v29, 2u);
    }
    uint64_t v21 = [(VUIPlaybackManager *)self mainPlayerLongLoadingTimer];
    [v21 invalidate];

    [(VUIPlaybackManager *)self setMainPlayerLongLoadingTimer:0];
  }
LABEL_5:
  id v11 = [v4 userInfo];
  double v12 = (void *)[v11 mutableCopy];

  if (v10) {
    [v12 setObject:v10 forKey:@"DidMainPlayerJustCompleteInitialLoadingKey"];
  }
  double v13 = [(VUIPlaybackManager *)self stateMachine];
  uint64_t v14 = [v4 object];
  [v13 postEvent:@"Playback state did change" withContext:v14 userInfo:v12];
}

- (void)_currentMediaItemDidChange:(id)a3
{
  [(VUIPlaybackManager *)self _updateRequiresLinearPlayback];
  id v4 = [(VUIPlaybackManager *)self featureMonitor];
  [v4 removeFeaturesMatching:&unk_1F3F3E1F8];

  id v5 = [(VUIPlaybackManager *)self currentMediaItem];

  if (v5)
  {
    uint64_t v6 = [(VUIPlaybackManager *)self currentMediaItem];
    [(VUIPlaybackManager *)self _donateUserActivityForMediaItem:v6];

    uint64_t v7 = [(VUIPlaybackManager *)self stateMachine];
    uint64_t v8 = [v7 currentState];
    char v9 = [v8 isEqualToString:@"Showing multiview playback"];

    if ((v9 & 1) == 0)
    {
      id v11 = +[VUIPlaybackTabManager sharedInstance];
      uint64_t v10 = [(VUIPlaybackManager *)self avPlayerViewController];
      [v11 resetPlayerTabsForPlayerViewController:v10];
    }
  }
}

- (void)_playbackErrorDidOccur:(id)a3
{
  id v4 = a3;
  id v7 = [(VUIPlaybackManager *)self stateMachine];
  id v5 = [v4 object];
  uint64_t v6 = [v4 userInfo];

  [v7 postEvent:@"Error did occur" withContext:v5 userInfo:v6];
}

- (void)_externalPlaybackTypeDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  id v5 = [(VUIPlaybackManager *)self mainPlayer];

  if (v4 == v5)
  {
    uint64_t v6 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = [(VUIPlaybackManager *)self mainPlayer];
      int v14 = 134217984;
      uint64_t v15 = [v8 externalPlaybackType];
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ExternalPlaybacktype did change externalPlaybackType = %ld", (uint8_t *)&v14, 0xCu);
    }
    char v9 = [(VUIPlaybackManager *)self avPlayerViewController];
    uint64_t v10 = [(VUIPlaybackManager *)self mainPlayer];
    BOOL v11 = [v10 externalPlaybackType] != 0;

    double v12 = [v9 configuration];
    [v12 setExcludedControls:32 * v11];
    [v9 setConfiguration:v12];
  }
  double v13 = [(VUIPlaybackManager *)self stateMachine];
  [v13 postEvent:@"External playback type did change"];
}

- (void)_networkReachbilityDidChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4FB3CF8], "sharedInstance", a3);
  int v5 = [v4 isNetworkReachable];

  uint64_t v6 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v5) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    double v24 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Network reachability did change. Is reachable: %@", buf, 0xCu);
  }
  uint64_t v8 = [(VUIPlaybackManager *)self avPlayerViewController];
  char v9 = [v8 view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  if (v5)
  {
    int v14 = [(VUIPlaybackManager *)self extrasContext];
    if (objc_msgSend(v14, "shouldExtrasBeVisibleForSize:", v11, v13))
    {
      uint64_t v15 = +[VUIInterfaceFactory sharedInstance];
      uint64_t v16 = [v15 groupActivitiesManager];
      uint64_t v17 = [v16 isSessionActive] ^ 1;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = [(VUIPlaybackManager *)self stateMachine];
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v17, @"ExtrasShouldBeVisibleKey");
  id v22 = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v18 postEvent:@"Extras visibility needs update" withContext:0 userInfo:v20];
}

- (void)_playerRateDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [v4 object];
    int v17 = 138412290;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Player rate did change %@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v8 = [v4 object];
  char v9 = [(VUIPlaybackManager *)self _multiviewInfoForPlayer:v8];
  double v10 = [v4 userInfo];
  double v11 = [v10 objectForKey:*MEMORY[0x1E4F16070]];

  if (v9)
  {
    double v12 = [v9 player];
    [v12 rate];
    double v14 = v13;

    if (v14 == 0.0)
    {
      uint64_t v15 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412546;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Player %@ paused due to %@", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v16 = [v11 isEqualToString:*MEMORY[0x1E4F16078]] ^ 1;
    }
    else
    {
      uint64_t v16 = 0;
    }
    [v9 setPausedDueToInterruption:v16];
  }
}

- (void)_didPlayToEnd:(id)a3
{
  if (![(VUIPlaybackManager *)self _isNewPostPlayEnabled])
  {
    id v4 = [(VUIPlaybackManager *)self postPlayView];
    uint64_t v5 = [v4 type];

    BOOL v6 = [(VUIPlaybackManager *)self _allowedToAutoPlayForType:v5];
    id v7 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v8 = [v7 groupActivitiesManager];
    char v9 = [v8 isSessionActive];

    if ((v9 & 1) != 0
      || ([(VUIPlaybackManager *)self postPlayView], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)
      && (double v11 = (void *)v10,
          BOOL v12 = [(VUIPlaybackManager *)self isPostPlayActive],
          v11,
          v12 && !v6))
    {
      [(VUIPlaybackManager *)self dismissPlaybackAnimated:1 leaveGroupActivitySession:0 completion:0];
    }
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  uint64_t v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Setting app background date to %@", (uint8_t *)&v7, 0xCu);
  }
  [(VUIPlaybackManager *)self setDateAppWasBackgrounded:v4];
  BOOL v6 = [(VUIPlaybackManager *)self stateMachine];
  [v6 postEvent:@"Application did enter background"];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Application will enter foreground"];
}

- (void)_applicationWillResignActive:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Application will resign active"];
}

- (void)_accountDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB5030], "sharedInstance", a3);
  uint64_t v5 = [v4 activeAccount];

  if (!v5)
  {
    BOOL v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "user did sign out", v7, 2u);
    }
    [(VUIPlaybackManager *)self dismissPlaybackAnimated:1 leaveGroupActivitySession:1 completion:0];
  }
}

- (void)_groupActivityDidEnd:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "group activity did end %@", (uint8_t *)&v7, 0xCu);
  }
  BOOL v6 = [(VUIPlaybackManager *)self multiPlayerViewController];
  [v6 setFullscreenGesturesEnabled:1];
}

- (void)_audioSessionRouteDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "session route did change %@", (uint8_t *)&v8, 0xCu);
  }
  if ([(VUIPlaybackManager *)self _audioContainsHDMIRoute])
  {
    BOOL v6 = [(VUIPlaybackManager *)self _currentlyPlayingMultiviewInfo];
    int v7 = [v6 player];
    [v7 play];
  }
}

- (void)_markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:(BOOL)a3 forAVPlayerViewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(VUIPlaybackManager *)self mainAVPlayerViewController];

  if (v7 == v6)
  {
    id v10 = [(VUIPlaybackManager *)self mainPlayer];
    int v8 = [v10 currentMediaItem];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
      [v8 setMediaItemMetadata:v9 forProperty:@"VUIContentMetadataIsPlayingInPIP"];
    }
  }
}

- (void)_markMainPlayerMediaItemPostPlayActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(VUIPlaybackManager *)self mainPlayer];
  BOOL v4 = [v6 currentMediaItem];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [v4 setMediaItemMetadata:v5 forProperty:@"VUIContentMetadataIsPlayingInPostPlay"];
  }
}

- (void)_notifyAVPlayerViewControllerDisplaySize
{
  id v13 = [(VUIPlaybackManager *)self avPlayerViewController];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 videoDisplaySize];
  double v6 = v5;
  double v7 = v4;
  if (v5 != *MEMORY[0x1E4F1DB30] || v4 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v13 videoDisplayScale];
    v15.double height = round(v7) * v9;
    v15.double width = round(v6) * v9;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v15);
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", DictionaryRepresentation, VUIPlaybackManagerNotificationKeyDisplaySize[0]);
    double v11 = [(VUIPlaybackManager *)self activePlayer];
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, VUIPlaybackManagerNotificationKeyPlayer[0]);

    BOOL v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:VUIPlaybackManagerVideoDisplaySizeDidChange[0] object:self userInfo:v3];
  }
}

- (void)_setExtrasButtonVisible:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(VUIPlaybackManager *)self extrasControlItem];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F16710]);
      double v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
      double v7 = [v6 localizedStringForKey:@"EXTRAS_BUTTON_TITLE" value:0 table:@"VideosExtras"];
      int v8 = (void *)[v5 initWithTitle:v7 type:2];

      objc_initWeak(&location, self);
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      double v11 = __46__VUIPlaybackManager__setExtrasButtonVisible___block_invoke;
      BOOL v12 = &unk_1E6DF4A30;
      objc_copyWeak(&v13, &location);
      [v8 setAction:&v9];
      -[VUIPlaybackManager setExtrasControlItem:](self, "setExtrasControlItem:", v8, v9, v10, v11, v12);
      [(VUIPlaybackManager *)self _mainPlayerViewControllerSetupControlItems];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(VUIPlaybackManager *)self setExtrasControlItem:0];
    [(VUIPlaybackManager *)self _mainPlayerViewControllerSetupControlItems];
  }
}

void __46__VUIPlaybackManager__setExtrasButtonVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Extras button pressed"];
}

- (void)_mainPlayerViewControllerRemoveAllCustomControlItems
{
  [(VUIPlaybackManager *)self setExtrasControlItem:0];
  [(VUIPlaybackManager *)self setShareControlItem:0];
  [(VUIPlaybackManager *)self setMultiViewControlItem:0];
  [(VUIPlaybackManager *)self _mainPlayerViewControllerSetupControlItems];
}

- (void)_mainPlayerViewControllerSetupControlItems
{
  id v7 = (id)objc_opt_new();
  id v3 = [(VUIPlaybackManager *)self extrasControlItem];
  if (v3) {
    [v7 addObject:v3];
  }
  double v4 = [(VUIPlaybackManager *)self multiViewControlItem];
  if (v4) {
    [v7 addObject:v4];
  }
  id v5 = [(VUIPlaybackManager *)self shareControlItem];
  if (v5) {
    [v7 addObject:v5];
  }
  double v6 = [(VUIPlaybackManager *)self mainAVPlayerViewController];
  [v6 setCustomControlItems:v7];
}

- (void)_setupFeaturesFromMainPlayersCurrentMediaItem
{
  id v3 = [(VUIPlaybackManager *)self mainPlayer];
  id v4 = [v3 currentMediaItem];

  if (v4)
  {
    [(VUIPlaybackManager *)self _downloadRatingImageIfAvailable:v4];
    [(VUIPlaybackManager *)self _downloadProductPlacementImageIfAvailable:v4];
    [(VUIPlaybackManager *)self _setupBootstrapPostPlayFeatureMonitorForMediaItem:v4];
    [(VUIPlaybackManager *)self _addRollsInfoFeaturesFromMediaItem:v4];
    [(VUIPlaybackManager *)self _addSkipTriggerFeaturesToMonitor:v4];
  }
}

- (void)_downloadRatingImageIfAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA078]];
  double v6 = v5;
  if (v5) {
    int v7 = [v5 BOOLValue];
  }
  else {
    int v7 = 1;
  }
  int v8 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v9 = [v8 groupActivitiesManager];
  char v10 = [v9 isSessionActive];

  if ((v10 & 1) != 0 || v7)
  {
    double v11 = [(VUIPlaybackManager *)self ratingImage];

    if (v4 && !v11)
    {
      BOOL v12 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA000]];
      if ([v12 length])
      {
        uint64_t v13 = objc_opt_new();
        [(id)v13 setWidth:100];
        [(id)v13 setHeight:100];
        [(id)v13 setFormat:@"png"];
        [(id)v13 setImageURL:v12];
        double v14 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FD0]];
        if ([v14 length])
        {
          CGSize v15 = objc_opt_new();
          [v15 setWidth:100];
          [v15 setHeight:100];
          [v15 setFormat:@"png"];
          [v15 setImageURL:v14];
        }
        else
        {
          CGSize v15 = 0;
        }
      }
      else
      {
        CGSize v15 = 0;
        uint64_t v13 = 0;
      }
      uint64_t v16 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F68]];
      int v17 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F60]];
      [v17 floatValue];
      float v19 = v18;
      if (_os_feature_enabled_impl() && [v16 length])
      {
        uint64_t v20 = objc_opt_new();
        [(id)v20 setWidth:100];
        [(id)v20 setHeight:100];
        [(id)v20 setFormat:@"png"];
        [(id)v20 setImageURL:v16];
      }
      else
      {
        uint64_t v20 = 0;
      }
      if (v13 | v20)
      {
        uint64_t v23 = v12;
        objc_initWeak(&location, self);
        uint64_t v21 = [(VUIPlaybackManager *)self logoImageDownloader];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __54__VUIPlaybackManager__downloadRatingImageIfAvailable___block_invoke;
        v24[3] = &unk_1E6DF7078;
        objc_copyWeak(v27, &location);
        id v22 = v4;
        *(double *)&v27[1] = v19;
        id v25 = v22;
        double v26 = self;
        [v21 downloadImagesWithAdvisoryImageInfo:v13 photoSensitivityImageInfo:v15 highMotionWarningImageInfo:v20 completion:v24];

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);
        BOOL v12 = v23;
      }
      else
      {
        [(VUIPlaybackManager *)self _addProductPlacementFeatureFromMediaItem:v4];
      }
    }
  }
  else
  {
    [(VUIPlaybackManager *)self _addProductPlacementFeatureFromMediaItem:v4];
  }
}

void __54__VUIPlaybackManager__downloadRatingImageIfAvailable___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  int v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setRatingImage:v10];

  [WeakRetained setPhotoSensitivityImage:v9];
  [WeakRetained setHighMotionWarningImage:v8];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    double v12 = 6.0;
  }
  else
  {
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    double v12 = *(double *)(a1 + 56);
  }
  [WeakRetained _addTVRatingFeatureFromMediaItem:v11 duration:v12];
LABEL_6:
  [*(id *)(a1 + 40) _downloadProductPlacementImageIfAvailable:*(void *)(a1 + 32)];
}

- (void)_downloadProductPlacementImageIfAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIPlaybackManager *)self productPlacementImage];

  if (v4 && !v5)
  {
    double v6 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE8]];
    int v7 = [v6 imageUrlStringFormat];
    if ([v7 length])
    {
      id v8 = objc_opt_new();
      [v8 setWidth:100];
      [v8 setHeight:100];
      [v8 setFormat:@"png"];
      objc_initWeak(&location, self);
      id v9 = [(VUIPlaybackManager *)self logoImageDownloader];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __64__VUIPlaybackManager__downloadProductPlacementImageIfAvailable___block_invoke;
      v10[3] = &unk_1E6DF70A0;
      objc_copyWeak(&v11, &location);
      [v9 downloadImagesWithAdvisoryImageInfo:v8 photoSensitivityImageInfo:0 highMotionWarningImageInfo:0 completion:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __64__VUIPlaybackManager__downloadProductPlacementImageIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    [WeakRetained setProductPlacementImage:v4];
  }
}

- (void)_addTVRatingFeatureFromMediaItem:(id)a3 duration:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v6 = [a3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA038]];
    if ([v6 count])
    {
      int v7 = objc_opt_new();
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v24;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
            id v14 = objc_alloc(MEMORY[0x1E4FA9DB0]);
            objc_msgSend(v13, "start", (void)v23);
            double v16 = v15;
            [v13 start];
            double v18 = v17;
            [v13 duration];
            uint64_t v20 = (void *)[v14 initWithStartTime:v16 endTime:v18 + v19];
            if (v20) {
              [v7 addObject:v20];
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v10);
      }
    }
    else
    {
      int v7 = 0;
    }
    uint64_t v21 = [[VUINowPlayingTVAdvisoryFeature alloc] initWithType:9 startTime:0.0 duration:a4];
    if (v21)
    {
      if ([v7 count]) {
        [(VUINowPlayingTVAdvisoryFeature *)v21 setAdvisoryDisabledTimeRanges:v7];
      }
      -[VUINowPlayingTimeBoundFeature setAutoRemove:](v21, "setAutoRemove:", 1, (void)v23);
      id v22 = [(VUIPlaybackManager *)self featureMonitor];
      [v22 addFeature:v21];
    }
  }
}

- (void)_addProductPlacementFeatureFromMediaItem:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE8]];
    int v7 = [(VUIPlaybackManager *)self productPlacementImage];
    if (v7)
    {
    }
    else
    {
      id v8 = [v6 localizedInfoString];
      uint64_t v9 = [v8 length];

      if (!v9)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    uint64_t v10 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA038]];
    if ([v10 count])
    {
      uint64_t v11 = objc_opt_new();
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      double v30 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id v18 = objc_alloc(MEMORY[0x1E4FA9DB0]);
            [v17 start];
            double v20 = v19;
            [v17 start];
            double v22 = v21;
            [v17 duration];
            long long v24 = (void *)[v18 initWithStartTime:v20 endTime:v22 + v23];
            if (v24) {
              [v11 addObject:v24];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v14);
      }

      uint64_t v10 = v30;
    }
    else
    {
      uint64_t v11 = 0;
    }
    long long v25 = objc_msgSend(v6, "duration", v30);
    [v25 doubleValue];
    double v27 = v26;

    uint64_t v28 = [[VUINowPlayingTVAdvisoryFeature alloc] initWithType:13 startTime:0.0 duration:v27];
    if (v28)
    {
      if ([v11 count]) {
        [(VUINowPlayingTVAdvisoryFeature *)v28 setAdvisoryDisabledTimeRanges:v11];
      }
      [(VUINowPlayingTimeBoundFeature *)v28 setUserInfo:v6];
      [(VUINowPlayingTimeBoundFeature *)v28 setAutoRemove:1];
      int v29 = [(VUIPlaybackManager *)self featureMonitor];
      [v29 addFeature:v28];
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_addRollsInfoFeaturesFromMediaItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA038]];
  if ([v4 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "type", (void)v19);
          if ((unint64_t)(v11 - 1) <= 2)
          {
            uint64_t v12 = v11 + 3;
            uint64_t v13 = [VUINowPlayingTimeBoundFeature alloc];
            [v10 start];
            double v15 = v14;
            [v10 duration];
            double v17 = [(VUINowPlayingTimeBoundFeature *)v13 initWithType:v12 startTime:v15 duration:v16];
            if (v17)
            {
              -[VUINowPlayingTimeBoundFeature setSkippable:](v17, "setSkippable:", [v10 isSkippable]);
              id v18 = [(VUIPlaybackManager *)self featureMonitor];
              [v18 addFeature:v17];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }
}

- (void)_addSkipTriggerFeaturesToMonitor:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA088]];
  uint64_t v4 = [v3 count];
  id v5 = sLogObject_5;
  BOOL v6 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = v5;
      *(_DWORD *)buf = 134217984;
      uint64_t v60 = [v3 count];
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Number of skip features found = %lu", buf, 0xCu);
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    int64_t v53 = v3;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v56 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if ([v13 type] == 1)
          {
            double v14 = [VUINowPlayingTimeBoundFeature alloc];
            [v13 start];
            double v16 = v15;
            [v13 duration];
            id v18 = [(VUINowPlayingTimeBoundFeature *)v14 initWithType:7 startTime:v16 duration:v17];
            long long v19 = v18;
            if (v18)
            {
              [(VUINowPlayingTimeBoundFeature *)v18 setUserInfo:v13];
              long long v20 = +[VUIFeaturesConfiguration sharedInstance];
              long long v21 = [v20 nowPlayingConfig];
              [v21 prerollFadeInEndOffset];
              double v23 = v22;

              [v13 target];
              double v25 = v24;
              [v13 start];
              double v27 = v25 - v26 - v23;
              if (v27 <= 0.0
                || ([v13 promoInfo],
                    uint64_t v28 = objc_claimAutoreleasedReturnValue(),
                    v28,
                    !v28))
              {
                int v29 = (void *)sLogObject_5;
                if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
                {
                  double v30 = v29;
                  [v13 target];
                  double v32 = v31;
                  [v13 start];
                  *(double *)&uint64_t v34 = v32 - v33;
                  double v35 = [v13 promoInfo];
                  *(_DWORD *)buf = 134218242;
                  uint64_t v60 = v34;
                  __int16 v61 = 2112;
                  double v62 = *(double *)&v35;
                  _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Pre-roll too short to fade back or not a promo, duration=%1.2f, promoInfo=%@", buf, 0x16u);
                }
                [v13 target];
                double v37 = v36;
                [v13 start];
                double v27 = v37 - v38;
                double v23 = 0.0;
              }
              id v39 = (void *)sLogObject_5;
              if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
              {
                id v40 = v39;
                [v13 start];
                *(_DWORD *)buf = 134218240;
                uint64_t v60 = v41;
                __int16 v61 = 2048;
                double v62 = v27;
                _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, "Adding preroll at %1.2f with duration %1.2f", buf, 0x16u);
              }
              [v13 target];
              double v43 = v42 - v23;
              id v44 = [VUINowPlayingTimeBoundFeature alloc];
              [v13 start];
              double v46 = v45;
              [v13 target];
              double v48 = v47;
              [v13 start];
              __int16 v50 = [(VUINowPlayingTimeBoundFeature *)v44 initWithType:8 startTime:v46 restartTime:v43 duration:v48 - v49];
              id v51 = v50;
              if (v50)
              {
                [(VUINowPlayingTimeBoundFeature *)v50 setUserInfo:v19];
                __int16 v52 = [(VUIPlaybackManager *)self featureMonitor];
                [v52 addFeature:v51];
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v10);
    }

    id v3 = v53;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "No skip features found", buf, 2u);
  }
}

- (void)_addSkipIntroFeatureToMonitorIfNeeded:(BOOL)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (![(VUIPlaybackManager *)self transportBarVisible])
  {
    if ([(VUIPlaybackManager *)self isPIPing])
    {
      id v5 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Not adding skip intro feature to the monitor as player view controller is in PIP state", buf, 2u);
      }
    }
    else
    {
      BOOL v6 = [(VUIPlaybackManager *)self featureMonitor];
      uint64_t v7 = [v6 activeFeatureForType:7];
      if (v7) {
        [v6 deactivateFeature:v7 animated:1];
      }
      id v8 = [v6 featuresForType:8];
      if ([v8 count])
      {
        uint64_t v9 = [v6 player];
        uint64_t v10 = v9;
        if (v9)
        {
          [v9 elapsedTime];
          double v12 = v11;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v13 = v8;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            double v45 = v10;
            double v46 = v8;
            BOOL v44 = a3;
            double v43 = self;
            double v47 = v7;
            double v48 = v6;
            id v16 = 0;
            uint64_t v17 = *(void *)v50;
            id v18 = (char *)&unk_1EBF73000;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v50 != v17) {
                  objc_enumerationMutation(v13);
                }
                long long v20 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "userInfo", v43);
                long long v21 = [v20 userInfo];
                [v21 start];
                double v23 = v22;
                [v21 target];
                double v25 = v24;
                [v21 duration];
                BOOL v27 = v12 >= v23 && v12 < v25;
                double v28 = v25 - v12;
                if (v27 && v28 > 5.0)
                {
                  if (v28 <= v26) {
                    double v30 = v25 - v12;
                  }
                  else {
                    double v30 = v26;
                  }
                  double v31 = (void *)[objc_alloc((Class)(v18 + 2240)) initWithType:7 startTime:v12 duration:v30];
                  [v31 setAutoRemove:1];
                  if (v31)
                  {
                    [v31 setUserInfo:v21];
                    if (v16)
                    {
                      double v32 = [v16 userInfo];
                      [v32 start];
                      if (v33 < v23)
                      {
                        id v34 = v31;
                        double v35 = v16;
                        double v36 = v18;
                        id v37 = v34;

                        id v38 = v37;
                        id v18 = v36;
                        id v16 = v38;
                      }
                    }
                    else
                    {
                      id v16 = v31;
                    }
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v15);

            if (v16)
            {
              id v39 = (void *)sLogObject_5;
              BOOL v6 = v48;
              uint64_t v10 = v45;
              id v8 = v46;
              if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
              {
                id v40 = v39;
                [v16 duration];
                *(_DWORD *)buf = 134218240;
                double v54 = v12;
                __int16 v55 = 2048;
                uint64_t v56 = v41;
                _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, "Adding skipIntro feature to feature monitor with start time - %f and duration - %f", buf, 0x16u);
              }
              [v48 addFeature:v16];
              if (!v44)
              {
                double v42 = sLogObject_5;
                if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1E2BD7000, v42, OS_LOG_TYPE_DEFAULT, "Removing preroll fade in due to user interaction", buf, 2u);
                }
                [(VUIPlaybackManager *)v43 _removePrerollFadeIn];
              }
              uint64_t v7 = v47;
            }
            else
            {
              uint64_t v7 = v47;
              BOOL v6 = v48;
              uint64_t v10 = v45;
              id v8 = v46;
            }
          }
          else
          {

            id v16 = 0;
          }
        }
      }
    }
  }
}

- (id)_deepLinkPlaybackURLForCurrentMediaItem
{
  id v2 = [(VUIPlaybackManager *)self activePlayer];
  id v3 = [v2 currentMediaItem];

  uint64_t v4 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  id v5 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
  BOOL v6 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA058]];
  uint64_t v7 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  if ([v4 length] && objc_msgSend(v7, "length"))
  {
    if (([v7 isEqualToString:*MEMORY[0x1E4FAA1E8]] & 1) != 0
      || ([v7 isEqualToString:*MEMORY[0x1E4FAA1F8]] & 1) != 0)
    {
      uint64_t v8 = 1;
LABEL_6:
      uint64_t v9 = (void *)MEMORY[0x1E4FB5110];
      id v10 = objc_alloc_init(MEMORY[0x1E4FB5108]);
      double v11 = [v9 _watchListAppPunchoutURLWithPlayable:v10 forContentType:v8 canonicalID:v4 showCanonicalID:v5 seasonCanonicalID:v6 allowPlayAction:0 isPlaybackURL:0];

      double v12 = [MEMORY[0x1E4FB5110] _punchoutURLForDirectPlayback:v11 ignoreExtras:1];

      goto LABEL_10;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4FAA200]])
    {
      uint64_t v8 = 4;
      goto LABEL_6;
    }
  }
  double v12 = 0;
LABEL_10:

  return v12;
}

- (void)_startPlaybackFromBeginning
{
  id v3 = +[VUIPlaybackTabManager sharedInstance];
  [v3 playbackFromBeginningTimeOffset];
  double v5 = v4;

  BOOL v6 = [(VUIPlaybackManager *)self activePlayer];
  [v6 setElapsedTime:1 precise:v5];

  id v7 = [(VUIPlaybackManager *)self activePlayer];
  [v7 play];
}

- (void)_pushMoreInfoControllerIfNeeded
{
  id v3 = [(VUIPlaybackManager *)self moreInfoCanonicalViewController];
  if (v3)
  {
    id v2 = +[VUIApplicationRouter currentNavigationController];
    [v2 pushViewController:v3 animated:1];
  }
}

- (void)_removeMoreInfoViewControllerIfNeeded
{
  id v3 = [(VUIPlaybackManager *)self moreInfoCanonicalViewController];
  if (v3)
  {
    id v11 = v3;
    double v4 = [v3 navigationController];
    double v5 = [v4 viewControllers];

    uint64_t v6 = [v5 indexOfObject:v11];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      uint64_t v8 = (void *)[v5 mutableCopy];
      [v8 removeObjectAtIndex:v7];
      uint64_t v9 = (void *)[v8 copy];
      id v10 = [v11 navigationController];
      [v10 setViewControllers:v9];

      [(VUIPlaybackManager *)self setMoreInfoCanonicalViewController:0];
    }

    id v3 = v11;
  }
}

- (void)_setupInfoTab
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  double v4 = +[VUIPlaybackTabManager sharedInstance];
  int v5 = [v4 shouldShowPlayFromBeginningButtonForMediaInfo];

  if (v5)
  {
    uint64_t v6 = +[VUIPlaybackTabManager sharedInstance];
    uint64_t v7 = [v6 playTitleForFromBeginningAction];

    uint64_t v8 = +[VUIPlaybackTabManager sharedInstance];
    uint64_t v9 = [v8 playImageForFromBeginningAction];

    id v10 = (void *)MEMORY[0x1E4FB13F0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __35__VUIPlaybackManager__setupInfoTab__block_invoke;
    v22[3] = &unk_1E6DF70C8;
    objc_copyWeak(&v23, &location);
    id v11 = [v10 actionWithTitle:v7 image:v9 identifier:0 handler:v22];
    [v3 addObject:v11];

    objc_destroyWeak(&v23);
  }
  double v12 = +[VUIPlaybackTabManager sharedInstance];
  int v13 = [v12 shouldShowMoreInfoButton];

  if (v13)
  {
    uint64_t v14 = +[VUIPlaybackTabManager sharedInstance];
    uint64_t v15 = [v14 moreInfoTitle];

    id v16 = (void *)MEMORY[0x1E4FB13F0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__VUIPlaybackManager__setupInfoTab__block_invoke_2;
    v20[3] = &unk_1E6DF70C8;
    objc_copyWeak(&v21, &location);
    uint64_t v17 = [v16 actionWithTitle:v15 image:0 identifier:0 handler:v20];
    [v3 addObject:v17];

    objc_destroyWeak(&v21);
  }
  id v18 = [(VUIPlaybackManager *)self avPlayerViewController];
  long long v19 = (void *)[v3 copy];
  [v18 setInfoViewActions:v19];

  objc_destroyWeak(&location);
}

void __35__VUIPlaybackManager__setupInfoTab__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startPlaybackFromBeginning];
    id v2 = +[VUIPlaybackTabManager sharedInstance];
    [v2 reportPlayFromBeginningMetrics];

    id WeakRetained = v3;
  }
}

void __35__VUIPlaybackManager__setupInfoTab__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v12 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIPlaybackManager::will show more info", v12, 2u);
  }
  int v5 = +[VUITVAppLauncher sharedInstance];
  uint64_t v6 = [v5 appController];
  uint64_t v7 = [v6 appContext];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v9 = +[VUIPlaybackTabManager sharedInstance];
      id v10 = [v9 moreInfoViewControllerWithAppContext:v7];

      [WeakRetained setMoreInfoCanonicalViewController:v10];
      [WeakRetained startPictureInPicture];
      id v11 = +[VUIPlaybackTabManager sharedInstance];
      [v11 reportMoreInfoMetrics];
    }
  }
}

- (void)_addPlayerToTimedMetadataManager:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    id v3 = +[VUIInterfaceFactory sharedInstance];
    double v4 = [v3 timedMetadataManager];

    [v4 addObserverForPlayer:v5];
  }
}

- (void)_removePlayerFromTimedMetadataManager:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    id v3 = +[VUIInterfaceFactory sharedInstance];
    double v4 = [v3 timedMetadataManager];

    [v4 removeObserverForPlayer:v5];
  }
}

- (void)_setupBootstrapPostPlayFeatureMonitorForMediaItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIPlaybackManager *)self activePlayer];
  [v5 duration];
  double v7 = v6;

  if (v7 != *MEMORY[0x1E4FA9DC8])
  {
    uint64_t v8 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE0]];
    uint64_t v9 = +[VUIFeaturesConfiguration sharedInstance];
    id v10 = [v9 playbackUpNextConfig];

    id v11 = (void *)MEMORY[0x1E4F28ED0];
    if (v8)
    {
      [v8 doubleValue];
      double v13 = v12;
    }
    else
    {
      [v10 minTimeIntervalFromEndToDisplay];
      double v13 = v7 - v14;
    }
    [v10 bootstrapInterval];
    id v16 = [v11 numberWithDouble:v13 - v15];
    if (v16)
    {
      [v8 doubleValue];
      if (v17 >= 0.0)
      {
        id v18 = [(VUIPlaybackManager *)self featureMonitor];
        [v16 doubleValue];
        double v20 = v19;
        id v21 = [v18 featuresForType:3];
        double v22 = [v21 firstObject];

        if (v22) {
          [(VUINowPlayingTimeBoundFeature *)v22 setStartTime:v20];
        }
        else {
          double v22 = [[VUINowPlayingTimeBoundFeature alloc] initWithType:3 startTime:v20 duration:INFINITY];
        }
        [(VUINowPlayingTimeBoundFeature *)v22 setAutoRemove:1];
        id v23 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          double v25 = v22;
          _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "setup post play bootstrap feature:<%@>", (uint8_t *)&v24, 0xCu);
        }
        [v18 addFeature:v22];
      }
    }
  }
}

- (void)_addVideoDimmingViewForPostPlay
{
  id v3 = [(VUIPlaybackManager *)self postPlayView];
  if (v3)
  {
    id v4 = [(VUIPlaybackManager *)self avPlayerViewController];
    id v5 = [v4 contentOverlayView];

    if (v5)
    {
      id v6 = [v5 viewWithTag:88];
      if (!v6)
      {
        double v7 = [v5 safeAreaLayoutGuide];
        [v7 layoutFrame];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;

        id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v11, v13, v15);
        double v17 = [MEMORY[0x1E4FB1618] blackColor];
        [v16 setBackgroundColor:v17];

        [v16 setAlpha:0.0];
        [v16 setAutoresizingMask:18];
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapAwayFromPostPlayGesture_];
        [v16 setTag:88];
        [v16 addGestureRecognizer:v18];
        [v5 insertSubview:v16 belowSubview:v3];
        double v19 = (void *)MEMORY[0x1E4FB1EB0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __53__VUIPlaybackManager__addVideoDimmingViewForPostPlay__block_invoke;
        v20[3] = &unk_1E6DF3D58;
        id v6 = v16;
        id v21 = v6;
        [v19 animateWithDuration:5242880 delay:v20 options:0 animations:0.5 completion:0.0];
      }
    }
  }
}

uint64_t __53__VUIPlaybackManager__addVideoDimmingViewForPostPlay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.699999988];
}

- (void)_removeVideoDimmingViewForPostPlay
{
  id v3 = [(VUIPlaybackManager *)self avPlayerViewController];

  if (v3)
  {
    id v4 = [(VUIPlaybackManager *)self avPlayerViewController];
    id v5 = [v4 contentOverlayView];

    id v6 = [v5 viewWithTag:88];
    double v7 = v6;
    if (v6)
    {
      double v8 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke;
      void v11[3] = &unk_1E6DF3D58;
      id v12 = v6;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke_2;
      v9[3] = &unk_1E6DF5B20;
      id v10 = v12;
      [v8 animateWithDuration:5242880 delay:v11 options:v9 animations:0.5 completion:0.0];
    }
  }
}

uint64_t __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_handleTapAwayFromPostPlayGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    id v6 = [(VUIPlaybackManager *)self stateMachine];
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC28], @"PostPlaySlideOutAnimationKey", 0);
    [v6 postEvent:@"Post play cancelled" withContext:0 userInfo:v5];
  }
}

- (void)_postPlayItemSelected:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Post play item selected"];
}

- (void)_dismissPostPlayWithSwipe:(id)a3
{
  id v5 = [(VUIPlaybackManager *)self stateMachine];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"PostPlaySlideOutAnimationKey", 0);
  [v5 postEvent:@"Post play cancelled" withContext:0 userInfo:v4];
}

- (void)_resetAutoPlayBingeWatchingQualifications
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(VUIPlaybackManager *)self setInitialPlaybackStartDate:v3];

  [(VUIPlaybackManager *)self setAutoPlayedVideosCount:0];
}

- (void)multiPlayerDetailsViewControllerDidSelectLockupWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VUIPlaybackManager *)self multiPlayerViewController];
  [v11 recordMetricsEventWithIdentifier:v10 impressionsData:v9 locationData:v8 didAddPlayer:1];
}

- (void)multiPlayerDetailsViewControllerDidDeselectLockupWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VUIPlaybackManager *)self multiPlayerViewController];
  [v11 recordMetricsEventWithIdentifier:v10 impressionsData:v9 locationData:v8 didAddPlayer:0];
}

- (id)detailsViewControllerForMultiPlayerViewController:(id)a3
{
  id v4 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  id v5 = [v4 firstObject];

  id v6 = +[VUIPlaybackTabManager sharedInstance];
  double v7 = [v6 tabsInfo];
  id v8 = [v7 multiviewTabInfo];

  if (v8)
  {
    uint64_t v9 = [v5 broadcastLocale];
    id v10 = (void *)v9;
    id v11 = &stru_1F3E921E0;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    id v12 = v11;

    double v13 = +[VUIPlaybackTabManager sharedInstance];
    uint64_t v14 = [v5 playsFromStart];
    double v15 = [v13 createHUDViewControllerWithTabInfo:v8 excludingCanonicals:MEMORY[0x1E4F1CBF0] isMultiview:1 locale:v12 playsFromStart:v14];

    id v16 = [v15 hudContentViewController];
    int v17 = [v16 conformsToProtocol:&unk_1F4022EA8];

    if (v17)
    {
      id v18 = [v15 hudContentViewController];
      [v18 setDetailDelegate:self];
      [(VUIPlaybackManager *)self setMultiPlayerDetailsViewController:v18];
    }
    double v19 = [v15 hudContentViewController];
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (double)detailsViewHeightForMultiPlayerViewController:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self multiPlayerDetailsViewController];
  [v3 contentsHeight];
  if (v4 <= 0.0) {
    double v5 = 326.5;
  }
  else {
    double v5 = v4 + 38.0;
  }

  return v5;
}

- (void)multiPlayerViewController:(id)a3 didEnterFullscreenWithPlayerViewController:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v9 = @"PlayerViewControllerKey";
    v10[0] = a4;
    double v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a4;
    double v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    double v7 = 0;
  }
  id v8 = [(VUIPlaybackManager *)self stateMachine];
  [v8 postEvent:@"Multiview did enter fullscreen" withContext:0 userInfo:v7];
}

- (void)multiPlayerViewController:(id)a3 didExitFullscreenWithPlayerViewController:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v9 = @"PlayerViewControllerKey";
    v10[0] = a4;
    double v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a4;
    double v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    double v7 = 0;
  }
  id v8 = [(VUIPlaybackManager *)self stateMachine];
  [v8 postEvent:@"Multiview did exit fullscreen" withContext:0 userInfo:v7];
}

- (void)multiPlayerViewController:(id)a3 didDismissWithPlayerViewController:(id)a4 withReason:(unint64_t)a5
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v10 = [v6 dictionary];
  objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v7, @"PlayerViewControllerKey");

  id v8 = [(VUIPlaybackManager *)self stateMachine];
  uint64_t v9 = (void *)[v10 copy];
  [v8 postEvent:@"Dismiss multiview playback" withContext:0 userInfo:v9];
}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerWillAppear:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  id v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller will appear %@", buf, 0xCu);
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v6);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v24;
    uint64_t v14 = *MEMORY[0x1E4FA9E28];
    do
    {
      uint64_t v15 = 0;
      id v16 = v12;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        int v17 = [*(id *)(*((void *)&v23 + 1) + 8 * v15) player];
        id v18 = [v17 currentMediaItem];
        id v12 = [v18 mediaItemMetadataForProperty:v14];

        if ([v12 length]) {
          [v8 addObject:v12];
        }
        ++v15;
        id v16 = v12;
      }
      while (v11 != v15);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  if (v21)
  {
    double v19 = (void *)[v8 copy];
    [v21 updateWithSelectedPlaybackIdentifiers:v19 reloadingData:0];

    double v20 = +[VUIPlaybackTabManager sharedInstance];
    [v20 updatePrefetchedDataOnExistingHUDContentViewController:v21 canonicalId:v12 excludingCanonicals:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerDidAppear:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  double v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller did appear %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerWillDisappear:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  double v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller will disappear %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerDidDisappear:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  double v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller did disappear %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)multiPlayerViewController:(id)a3 didSelectPlayerViewController:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(VUIPlaybackManager *)self stateMachine];
  uint64_t v8 = @"PlayerViewControllerKey";
  v9[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postEvent:@"Did select multiview player" withContext:0 userInfo:v7];
}

- (void)multiPlayerViewController:(id)a3 didSwapPlayerViewControllerAtIndex:(int64_t)a4 withPlayerAtIndex:(int64_t)a5
{
  id v14 = a3;
  uint64_t v8 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  unint64_t v9 = [v8 count];

  if (v9 >= 2)
  {
    uint64_t v10 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    [v10 exchangeObjectAtIndex:a4 withObjectAtIndex:a5];

    if ([v14 distribution] == 1)
    {
      if (!a4) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v11 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      if ([v11 count] != 3)
      {
LABEL_9:

        goto LABEL_10;
      }

      if (!a4)
      {
LABEL_8:
        id v12 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
        uint64_t v11 = [v12 objectAtIndex:0];

        uint64_t v13 = [v11 playerViewController];
        [(VUIPlaybackManager *)self _muteAllMultiviewPlayersExcept:v13];

        goto LABEL_9;
      }
    }
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_10:
}

- (void)multiPlayerViewController:(id)a3 didBeginDropWithMediaInfo:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Multi player view controller did begin drop with %@", (uint8_t *)&v14, 0xCu);
  }
  if (![(VUIPlaybackManager *)self _multiviewContainsMediaInfo:v9])
  {
    int64_t v11 = [(VUIPlaybackManager *)self multiviewPlayerCount];
    if (v11 < [(VUIPlaybackManager *)self maxMultiviewPlayerCount])
    {
      [v8 setProspectivePlayerVisible:1 atIndex:a5 animated:1 completion:0];
      id v12 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      uint64_t v13 = +[VUIMultiviewPlaybackInfo prospectivePlaybackInfo];
      [v12 insertObject:v13 atIndex:a5];

      [(VUIPlaybackManager *)self _updateMultiviewReportingMetrics];
    }
  }
}

- (void)multiPlayerViewController:(id)a3 didEndDropWithMediaInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Multi player view controller did end drop with %@", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v9 = [v6 prospectivePlayerIndex];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v9;
    int64_t v11 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    if (v10 >= [v11 count])
    {
LABEL_8:

      goto LABEL_9;
    }
    id v12 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    uint64_t v13 = [v12 objectAtIndex:v10];
    int v14 = +[VUIMultiviewPlaybackInfo prospectivePlaybackInfo];

    if (v13 == v14)
    {
      id v15 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      int64_t v11 = [v15 objectAtIndex:v10];

      uint64_t v16 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
      [v16 removeObjectAtIndex:v10];

      int v17 = [v11 player];

      if (v17)
      {
        id v18 = +[VUIInterfaceFactory sharedInstance];
        double v19 = [v18 playbackEndManager];
        double v20 = [v11 player];
        [v19 remove:v20];
      }
      goto LABEL_8;
    }
  }
LABEL_9:
  [v6 setProspectivePlayerVisible:0 animated:1 completion:0];
}

- (void)multiPlayerViewController:(id)a3 didDropWithMediaInfo:(id)a4 overPlayerAtIndex:(int64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VUIPlaybackManager_multiPlayerViewController_didDropWithMediaInfo_overPlayerAtIndex___block_invoke;
  aBlock[3] = &unk_1E6DF5C48;
  id v10 = v8;
  id v27 = v10;
  objc_copyWeak(&v28, &location);
  int64_t v11 = _Block_copy(aBlock);
  id v12 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  uint64_t v13 = [v12 objectAtIndex:a5];
  int v14 = +[VUIMultiviewPlaybackInfo prospectivePlaybackInfo];
  BOOL v15 = v13 == v14;

  if (v15)
  {
    uint64_t v16 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    int v17 = [v16 objectAtIndex:a5];

    id v18 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    [v18 removeObjectAtIndex:a5];

    double v19 = [v17 player];

    if (v19)
    {
      double v20 = +[VUIInterfaceFactory sharedInstance];
      int v21 = [v20 playbackEndManager];
      id v22 = [v17 player];
      [v21 remove:v22];
    }
  }
  uint64_t v23 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v9;
    __int16 v32 = 2048;
    int64_t v33 = a5;
    _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "Multi player view controller did drop with %@ - %ld", buf, 0x16u);
  }
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v24 = [(VUIPlaybackManager *)self multiviewPlayerCount];
    if (v24 == [(VUIPlaybackManager *)self maxMultiviewPlayerCount])
    {
      long long v25 = [v9 tvpPlaylist];
      [(VUIPlaybackManager *)self replacePlaylistInMultiviewAtIndex:a5 withPlaylist:v25 animated:1];
LABEL_14:

      goto LABEL_15;
    }
  }
  if (![(VUIPlaybackManager *)self _multiviewContainsMediaInfo:v9])
  {
    long long v25 = [v9 tvpPlaylist];
    if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
      [(VUIPlaybackManager *)self addPlaylistToMultiview:v25 animated:1 completion:v11];
    }
    else {
      [(VUIPlaybackManager *)self addPlaylistToMultiview:v25 atIndex:a5 animated:1 completion:v11];
    }
    goto LABEL_14;
  }
LABEL_15:

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __87__VUIPlaybackManager_multiPlayerViewController_didDropWithMediaInfo_overPlayerAtIndex___block_invoke(id *a1)
{
  id v1 = a1;
  [a1[4] setProspectivePlayerVisible:0 animated:1 completion:0];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  id v2 = [WeakRetained multiPlayerDetailsViewController];
  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 multiviewIdentifiers];
  id v5 = (void *)[v4 copy];
  [v2 updateVisibleCellsWithPlaybackIdentifiers:v5];
}

- (void)multiPlayerViewController:(id)a3 didRemovePlayer:(id)a4 atIndex:(int64_t)a5
{
  id v7 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  int64_t v8 = [v7 count];

  if (v8 > a5)
  {
    id v9 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    id v17 = [v9 objectAtIndex:a5];

    id v10 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    [v10 removeObjectAtIndex:a5];

    int64_t v11 = [v17 player];

    if (v11)
    {
      id v12 = +[VUIInterfaceFactory sharedInstance];
      uint64_t v13 = [v12 playbackEndManager];
      int v14 = [v17 player];
      [v13 remove:v14];
    }
    BOOL v15 = [v17 player];
    [v15 stop];

    uint64_t v16 = [v17 player];
    [v16 invalidate];

    [(VUIPlaybackManager *)self _unmuteNextAvailableMultiviewPlayer];
  }
}

- (void)multiPlayerViewController:(id)a3 didCrossSupportedScreenSizeBoundary:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v8 = [v7 applicationState];

    if (v8 != 2)
    {
      id v9 = [(VUIPlaybackManager *)self _currentlyPlayingMultiviewInfo];
      id v10 = [v9 playerViewController];
      if (v10)
      {
        objc_initWeak(&location, self);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __84__VUIPlaybackManager_multiPlayerViewController_didCrossSupportedScreenSizeBoundary___block_invoke;
        void v11[3] = &unk_1E6DF5490;
        objc_copyWeak(&v13, &location);
        id v12 = v10;
        [v6 enterFullscreenWithPlayerViewController:v12 completion:v11];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __84__VUIPlaybackManager_multiPlayerViewController_didCrossSupportedScreenSizeBoundary___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = [WeakRetained isTrackingPlayerViewFrame];

  if ((v4 & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 32) view];
    id v5 = objc_loadWeakRetained(v2);
    [v7 addObserver:v5 forKeyPath:@"frame" options:0 context:__PlayerViewControllerFrameKVOContext];

    id v6 = objc_loadWeakRetained(v2);
    [v6 setTrackingPlayerViewFrame:1];
  }
}

- (void)multiPlayerViewController:(id)a3 didPinchPlayerToDismiss:(id)a4
{
  id v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Showing multiview from a pinch", v7, 2u);
  }
  id v6 = [(VUIPlaybackManager *)self stateMachine];
  [v6 postEvent:@"Show multiview playback" withContext:0 userInfo:0];
}

- (void)multiPlayerViewController:(id)a3 playerViewController:(id)a4 didResizeToFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v17 = [(VUIPlaybackManager *)self _multiviewInfoForPlayerViewController:a4];
  id v9 = [v17 player];
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  id v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:CGRectGetWidth(v19)];
  [v9 setReportingValueWithNumber:v10 forKey:@"multiviewWidth"];

  int64_t v11 = [v17 player];
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  id v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:CGRectGetHeight(v20)];
  [v11 setReportingValueWithNumber:v12 forKey:@"multiviewHeight"];

  id v13 = [v17 player];
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  int v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:CGRectGetMinX(v21)];
  [v13 setReportingValueWithNumber:v14 forKey:@"multiviewOriginX"];

  BOOL v15 = [v17 player];
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:CGRectGetMinY(v22)];
  [v15 setReportingValueWithNumber:v16 forKey:@"multiviewOriginY"];
}

- (id)_currentlyPlayingMultiviewInfo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 context] == 1)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_unmuteNextAvailableMultiviewPlayer
{
  id v3 = [(VUIPlaybackManager *)self _currentlyPlayingMultiviewInfo];
  if (!v3)
  {
    uint64_t v4 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    id v5 = [v4 firstObject];

    if (v5)
    {
      id v6 = [v5 player];

      if (v6)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __57__VUIPlaybackManager__unmuteNextAvailableMultiviewPlayer__block_invoke;
        v7[3] = &unk_1E6DF3D58;
        id v8 = v5;
        [v8 swapActiveAudioWithPlaybackInfo:0 completion:v7];
      }
    }
  }
}

void __57__VUIPlaybackManager__unmuteNextAvailableMultiviewPlayer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContext:1];
  id v2 = [*(id *)(a1 + 32) playerViewController];
  [v2 setCanStartPictureInPictureAutomaticallyFromInline:1];
}

- (id)_multiviewInfoForPlayer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 player];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_multiviewContainsMediaInfo:(id)a3
{
  id v4 = [a3 tvpPlaylist];
  id v5 = [v4 currentMediaItem];
  id v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];

  LOBYTE(self) = [(VUIPlaybackManager *)self multiviewContainsMediaItemWithIdentifier:v6];
  return (char)self;
}

- (void)upNextButtonTapped:(id)a3
{
  id v9 = [(VUIPlaybackManager *)self promoMetadataView];
  id v4 = [v9 skipInfo];
  id v5 = [v4 promoInfo];
  id v6 = [(VUIPlaybackManager *)self activePlayer];
  uint64_t v7 = [v6 currentMediaItem];

  id v8 = [(VUIPlaybackManager *)self upNextButtonImpressionMetrics];
  +[VUIMetricsMediaEvent recordClickOfUpNextButtonWithPromoInfo:v5 onMediaItem:v7 impressionData:v8];
  [(VUIPlaybackManager *)self _recordUpNextButtonImpressionsWithPromoInfo:v5];
  [(VUIPlaybackManager *)self _removePrerollFadeIn];
}

- (void)autoPlayTimerDidCompleteForPostPlayView:(id)a3
{
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  [v3 postEvent:@"Post play auto play timer did complete"];
}

- (BOOL)allowedToAutoPlay
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self initialPlaybackStartDate];

  if (!v3) {
    return 1;
  }
  id v4 = +[VUIFeaturesConfiguration sharedInstance];
  id v5 = [v4 playbackUpNextConfig];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [(VUIPlaybackManager *)self initialPlaybackStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  id v10 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    double v23 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "current continuous playback time:(%f)", (uint8_t *)&v22, 0xCu);
  }
  long long v11 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = v11;
    uint64_t v13 = [v5 maximumAutoPlayableItems];
    unint64_t v14 = [(VUIPlaybackManager *)self autoPlayedVideosCount];
    int v22 = 134218240;
    double v23 = *(double *)&v13;
    __int16 v24 = 2048;
    unint64_t v25 = v14;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "maximum auto playable items:(%lu) current count:(%lu)", (uint8_t *)&v22, 0x16u);
  }
  long long v15 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v16 = [v15 groupActivitiesManager];
  char v17 = [v16 isSessionActive];

  if (v17)
  {
    BOOL v18 = 0;
  }
  else
  {
    [v5 minAutoPlayStopTime];
    if (v9 >= v19)
    {
      unint64_t v20 = [(VUIPlaybackManager *)self autoPlayedVideosCount];
      BOOL v18 = v20 < [v5 maximumAutoPlayableItems];
    }
    else
    {
      BOOL v18 = 1;
    }
  }

  return v18;
}

- (BOOL)_allowedToAutoPlayForType:(unint64_t)a3
{
  BOOL v4 = +[VUISettingsManager isPostPlayAutoPlayEnabledForType:postPlayAutoPlayTypeFromViewType(a3)];
  if (![(VUIPlaybackManager *)self _isNewPostPlayEnabled] && !v4) {
    return 0;
  }
  return [(VUIPlaybackManager *)self allowedToAutoPlay];
}

- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(VUIPlaybackManager *)self stateMachine];
  double v9 = [v8 currentState];
  int v10 = [v9 isEqualToString:@"Showing video full screen with post play content on screen"];

  if (!v10)
  {
    unint64_t v20 = [(VUIPlaybackManager *)self stateMachine];
    CGRect v21 = [v20 currentState];
    if ([v21 isEqualToString:@"Showing multiview playback"])
    {
    }
    else
    {
      int v22 = [(VUIPlaybackManager *)self stateMachine];
      double v23 = [v22 currentState];
      int v24 = [v23 isEqualToString:@"Showing multiview playback in PIP"];

      if (!v24)
      {
        double v36 = [(VUIPlaybackManager *)self stateMachine];
        id v37 = [v36 currentState];
        int v38 = [v37 isEqualToString:@"Transferring player to background media"];

        id v39 = [(VUIPlaybackManager *)self playbackContainerViewController];
        id v40 = [v39 view];
        [v40 bounds];
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        if (v38)
        {
          double v48 = v41;

          long long v49 = [(VUIPlaybackManager *)self playbackContainerViewController];
          long long v50 = [v49 view];

          objc_msgSend(v50, "setFrame:", v43, v48, v45, v47);
          id v7 = v50;
          goto LABEL_10;
        }

        uint64_t v30 = v7;
        double v31 = v43;
        double v32 = v47;
        double v33 = v45;
        double v34 = v47;
LABEL_9:
        objc_msgSend(v30, "setFrame:", v31, v32, v33, v34);
        goto LABEL_10;
      }
    }
    unint64_t v25 = [(VUIPlaybackManager *)self multiPlayerViewController];
    [v25 presentationRectForPlayerViewController:v6];
    CGFloat v13 = v26;
    CGFloat v15 = v27;
    CGFloat v17 = v28;
    CGFloat v19 = v29;

LABEL_8:
    uint64_t v30 = v7;
    double v31 = v13;
    double v32 = v15;
    double v33 = v17;
    double v34 = v19;
    goto LABEL_9;
  }
  long long v11 = [(VUIPlaybackManager *)self playbackContainerViewController];
  [(VUIPlaybackManager *)self _calculatePostPlayPipRectForParent:v11];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v52.origin.CGFloat x = v13;
  v52.origin.CGFloat y = v15;
  v52.size.CGFloat width = v17;
  v52.size.CGFloat height = v19;
  if (!CGRectIsNull(v52)) {
    goto LABEL_8;
  }
LABEL_10:

  return v7;
}

- (void)_updateTimeBoundFeature:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Updating UI with time bound feature - %@", buf, 0xCu);
  }
  switch([v6 type])
  {
    case 2:
      if ([v6 isActive])
      {
        double v9 = [(VUIPlaybackManager *)self stateMachine];
        int v10 = v9;
        long long v11 = @"Post play time boundary crossed";
        goto LABEL_22;
      }
      if (![(VUIPlaybackManager *)self _isNewPostPlayEnabled])
      {
        double v9 = [(VUIPlaybackManager *)self stateMachine];
        int v10 = v9;
        long long v11 = @"Post play cancelled";
        goto LABEL_22;
      }
      goto LABEL_31;
    case 3:
      if ([v6 isActive])
      {
        double v9 = [(VUIPlaybackManager *)self stateMachine];
        int v10 = v9;
        long long v11 = @"Post play configuration time reached";
LABEL_22:
        [v9 postEvent:v11];
      }
      goto LABEL_31;
    case 4:
    case 5:
    case 6:
      if ([v6 isActive]) {
        uint64_t v8 = [v6 isSkippable] ^ 1;
      }
      else {
        uint64_t v8 = 0;
      }
      [(VUIPlaybackManager *)self setRequiresLinearPlayback:v8];
      [(VUIPlaybackManager *)self _updateRequiresLinearPlayback];
      goto LABEL_31;
    case 7:
      if (![v6 isActive])
      {
        CGRect v21 = [(VUIPlaybackManager *)self featureMonitor];
        CGFloat v19 = [v21 activeFeatureForType:7];

        if (!v19) {
          [(VUIPlaybackManager *)self _showSkipAndPromoView:0 animated:v4];
        }
        goto LABEL_27;
      }
      [(VUIPlaybackManager *)self _showSkipAndPromoView:1 animated:v4];
      goto LABEL_31;
    case 8:
      [(VUIPlaybackManager *)self _addSkipIntroFeatureToMonitorIfNeeded:1];
      goto LABEL_31;
    case 9:
      uint64_t v12 = [v6 isActive];
      CGFloat v13 = [(VUIPlaybackManager *)self ratingImage];
      double v14 = [(VUIPlaybackManager *)self photoSensitivityImage];
      CGFloat v15 = [(VUIPlaybackManager *)self highMotionWarningImage];
      [(VUIPlaybackManager *)self _showTVRating:v12 withRatingImage:v13 photoSensitivityImage:v14 highMotionWarningImage:v15 animated:v4];

      if ([v6 isActive]) {
        goto LABEL_31;
      }
      double v16 = [(VUIPlaybackManager *)self currentMediaItem];
      CGFloat v17 = [v16 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE8]];

      double v18 = [(VUIPlaybackManager *)self productPlacementImage];
      if (v18)
      {
      }
      else
      {
        double v26 = [v17 localizedInfoString];
        uint64_t v27 = [v26 length];

        if (!v27) {
          goto LABEL_30;
        }
      }
      dispatch_time_t v28 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__VUIPlaybackManager__updateTimeBoundFeature_animated___block_invoke;
      block[3] = &unk_1E6DF3D58;
      void block[4] = self;
      dispatch_after(v28, MEMORY[0x1E4F14428], block);
LABEL_30:

      goto LABEL_31;
    case 13:
      CGFloat v19 = [v6 userInfo];
      unint64_t v20 = [(VUIPlaybackManager *)self productPlacementImage];
      if (v20)
      {
      }
      else
      {
        int v22 = [v19 localizedInfoString];
        uint64_t v23 = [v22 length];

        if (!v23) {
          goto LABEL_27;
        }
      }
      uint64_t v24 = [v6 isActive];
      unint64_t v25 = [(VUIPlaybackManager *)self productPlacementImage];
      [(VUIPlaybackManager *)self _showProductPlacement:v24 withImage:v25 animated:v4];

LABEL_27:
LABEL_31:

      return;
    default:
      goto LABEL_31;
  }
}

void __55__VUIPlaybackManager__updateTimeBoundFeature_animated___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentMediaItem];
  [v1 _addProductPlacementFeatureFromMediaItem:v2];
}

- (void)mediaInfoDidChangeTo:(id)a3 canPlay:(BOOL)a4 wasAutoPlayed:(BOOL)a5
{
  BOOL v6 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v6 && !a5) {
    [(VUIPlaybackManager *)self _resetAutoPlayBingeWatchingQualifications];
  }
  int v22 = @"CanPlayMediaKey";
  double v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  v23[0] = v9;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  long long v11 = (void *)[v10 mutableCopy];

  if (v8) {
    [v11 setObject:v8 forKey:@"PlaylistKey"];
  }
  uint64_t v12 = [(VUIPlaybackManager *)self avPlayerViewController];

  if (v12)
  {
    CGFloat v13 = [(VUIPlaybackManager *)self avPlayerViewController];
    [v11 setObject:v13 forKey:@"PlayerViewControllerKey"];
  }
  double v14 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v15 = v14;
    double v16 = VUIBoolLogString();
    int v18 = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    CGRect v21 = v16;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Now playing view controller media info changed:<%@>, canPlay:<%@>", (uint8_t *)&v18, 0x16u);
  }
  CGFloat v17 = [(VUIPlaybackManager *)self stateMachine];
  [v17 postEvent:@"Media info did change" withContext:0 userInfo:v11];
}

- (void)_showShareMediaMenuForMediaItem:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Try to show share button for item: %@", (uint8_t *)&v9, 0xCu);
  }
  if (+[VUIMediaShareCoordinator shouldShowShareForMediaItem:v4])
  {
    BOOL v6 = [(VUIPlaybackManager *)self mainAVPlayerViewController];
    id v7 = +[VUIMediaShareControlButton shareControlItemForMediaItem:v4 inPlayerViewController:v6];

    [(VUIPlaybackManager *)self setShareControlItem:v7];
    [(VUIPlaybackManager *)self _mainPlayerViewControllerSetupControlItems];
  }
  else
  {
    id v8 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "This item: %@ doesn't support share in player", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_removeAdvisoryViews
{
  id v2 = [(VUIPlaybackManager *)self ratingView];
  [v2 removeAllViews];
}

- (void)_showOrUpdateAdvisoryViewsIfNeeded
{
  id v53 = [(VUIPlaybackManager *)self avPlayerViewController];
  [v53 videoBounds];
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  if (CGRectEqualToRect(v55, *MEMORY[0x1E4F1DB28])) {
    goto LABEL_22;
  }
  if ([(VUIPlaybackManager *)self shouldDisplayTVRatingWhenVideoBoundsIsAvailable])
  {
    id v7 = [(VUIPlaybackManager *)self ratingImage];
    if (v7)
    {
      id v8 = [(VUIPlaybackManager *)self photoSensitivityImage];
      int v9 = [(VUIPlaybackManager *)self highMotionWarningImage];
      [(VUIPlaybackManager *)self _showTVRating:1 withRatingImage:v7 photoSensitivityImage:v8 highMotionWarningImage:v9 animated:[(VUIPlaybackManager *)self shouldAnimateTVRatingView]];

      [(VUIPlaybackManager *)self setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:0];
      [(VUIPlaybackManager *)self setShouldAnimateTVRatingView:0];
    }
LABEL_16:

    goto LABEL_17;
  }
  id v10 = [(VUIPlaybackManager *)self ratingView];

  if (v10)
  {
    id v7 = [(VUIPlaybackManager *)self ratingView];
    [v7 frame];
    uint64_t v11 = [v7 layout];
    [v11 margin];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    int v18 = [v7 traitCollection];
    uint64_t v19 = [v18 userInterfaceIdiom];

    if (!v19 && (unint64_t)(objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation") - 1) < 2
      || +[VUIUtilities isIpadPortrait])
    {
      [v11 portraitMargin];
      double v13 = v20;
      double v15 = v21;
      double v17 = v22;
    }
    if ([v7 vuiIsRTL])
    {
      objc_msgSend(v7, "sizeThatFits:", width, height);
      double v24 = width - (v17 + v23);
    }
    else
    {
      double v24 = x + v15;
    }
    double v52 = y + v13;
    objc_msgSend(v7, "sizeThatFits:", width, height);
    objc_msgSend(v7, "setFrame:", v24, y + v13, v25, v26);
    uint64_t v27 = [v7 photoSensitivityView];
    dispatch_time_t v28 = [v7 photoSensitivityView];
    objc_msgSend(v28, "sizeThatFits:", width, height);
    double v51 = v29;
    double v31 = v30;

    objc_msgSend(v7, "sizeThatFits:", width, height);
    double v33 = v32;
    objc_msgSend(v27, "sizeThatFits:", width, height);
    double v35 = v34;
    int v36 = [v27 vuiIsRTL];
    double v37 = v35 - v33;
    if (!v36) {
      double v37 = 0.0;
    }
    double v38 = v24 - v37;
    id v39 = [v7 photoSensitivityView];
    objc_msgSend(v39, "setFrame:", v38, v52, v51, v31);

    goto LABEL_16;
  }
LABEL_17:
  if ([(VUIPlaybackManager *)self shouldDisplayProductPlacementWhenVideoBoundsIsAvailable]&& ([(VUIPlaybackManager *)self ratingView], id v40 = objc_claimAutoreleasedReturnValue(), v40, !v40))
  {
    long long v50 = [(VUIPlaybackManager *)self productPlacementImage];
    [(VUIPlaybackManager *)self _showProductPlacement:1 withImage:v50 animated:[(VUIPlaybackManager *)self shouldAnimateProductPlacementView]];

    [(VUIPlaybackManager *)self setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:0];
    [(VUIPlaybackManager *)self setShouldAnimateProductPlacementView:0];
  }
  else
  {
    double v41 = [(VUIPlaybackManager *)self productPlacementView];

    if (v41)
    {
      double v42 = [(VUIPlaybackManager *)self productPlacementView];
      double v43 = [v42 layout];
      [v43 margin];
      double v45 = x + v44;
      [v43 margin];
      double v47 = y + v46;
      objc_msgSend(v42, "sizeThatFits:", width, height);
      objc_msgSend(v42, "setFrame:", v45, v47, v48, v49);
    }
  }
LABEL_22:
}

- (void)_showTVRating:(BOOL)a3 withRatingImage:(id)a4 photoSensitivityImage:(id)a5 highMotionWarningImage:(id)a6 animated:(BOOL)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke;
  aBlock[3] = &unk_1E6DF70F0;
  objc_copyWeak(&v34, location);
  double v15 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_2;
  id v26[3] = &unk_1E6DF7140;
  objc_copyWeak(&v31, location);
  id v16 = v12;
  id v27 = v16;
  id v17 = v13;
  id v28 = v17;
  id v18 = v14;
  id v29 = v18;
  id v19 = v15;
  id v30 = v19;
  BOOL v32 = a7;
  double v20 = _Block_copy(v26);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_5;
  v23[3] = &unk_1E6DF5330;
  objc_copyWeak(&v24, location);
  BOOL v25 = a7;
  double v21 = _Block_copy(v23);
  double v22 = v21;
  if (v10) {
    double v21 = v20;
  }
  (*((void (**)(void))v21 + 2))();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(location);
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15)
{
  id v43 = a2;
  id v27 = (id *)(a1 + 32);
  id v28 = a3;
  id WeakRetained = objc_loadWeakRetained(v27);
  id v30 = [v43 traitCollection];
  uint64_t v31 = [v30 userInterfaceIdiom];

  if ((v31 || (unint64_t)(objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation") - 1) >= 2)
    && !+[VUIUtilities isIpadPortrait])
  {
    a8 = a4;
    a9 = a5;
    a11 = a7;
  }
  if ([v43 vuiIsRTL])
  {
    objc_msgSend(v43, "sizeThatFits:", a14, a15);
    double v33 = a14 - (a11 + v32);
  }
  else
  {
    double v33 = a12 + a9;
  }
  double v34 = a13 + a8;
  objc_msgSend(v43, "sizeThatFits:", a14, a15);
  double v36 = v35;
  objc_msgSend(v43, "setFrame:", v33, v34, v37, v35);
  [v28 addSubview:v43];

  [v43 layoutIfNeeded];
  [v43 center];
  double v39 = v38;
  id v40 = [WeakRetained platterView];
  objc_msgSend(v40, "setFrame:", v39, v34 + -10.0, 0.0, v36 + 20.0);

  double v41 = [WeakRetained platterView];
  [v41 layoutIfNeeded];
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [WeakRetained activePlayer];
  id v5 = [v4 currentMediaItem];

  if (v5)
  {
    BOOL v6 = [WeakRetained avPlayerViewController];
    [v6 videoBounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    double v15 = [WeakRetained avPlayerViewController];
    id v16 = [v15 contentOverlayView];

    v64.origin.double x = v8;
    v64.origin.double y = v10;
    v64.size.double width = v12;
    v64.size.double height = v14;
    if (CGRectEqualToRect(v64, *MEMORY[0x1E4F1DB28]) || !v16)
    {
      [WeakRetained setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:1];
      [WeakRetained setShouldAnimateTVRatingView:*(unsigned __int8 *)(a1 + 72)];
      goto LABEL_9;
    }
    id v17 = +[VUIVideoAdvisoryInfoDictionaryBuilder advisoryInfoDictionaryWithRatingImage:*(void *)(a1 + 32) photoSensitivityImage:*(void *)(a1 + 40) highMotionWarningImage:*(void *)(a1 + 48) andMediaItem:v5];
    id v18 = v17;
    if (*(void *)(a1 + 32))
    {
      id v19 = [VUIVideoAdvisoryView alloc];
      double v20 = -[VUIVideoAdvisoryView initWithAdvisoryInfoDictionary:reduceMotion:](v19, "initWithAdvisoryInfoDictionary:reduceMotion:", v18, [MEMORY[0x1E4FB3C20] isFeatureEnabled:1]);
      double v21 = [(VUIVideoAdvisoryView *)v20 layout];
      uint64_t v22 = *(void *)(a1 + 56);
      [v21 margin];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      [v21 portraitMargin];
      (*(void (**)(uint64_t, VUIVideoAdvisoryView *, void *, double, double, double, double, double, double, double, double, double, double, double, double))(v22 + 16))(v22, v20, v16, v24, v26, v28, v30, v31, v32, v33, v34, v8, v10, v12, v14);
      [WeakRetained setRatingView:v20];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_3;
      block[3] = &unk_1E6DF7118;
      objc_copyWeak(&v62, v2);
      __int16 v61 = v20;
      char v63 = *(unsigned char *)(a1 + 72);
      double v35 = v20;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v62);
    }
    else
    {
      if (!*(void *)(a1 + 48)) {
        goto LABEL_7;
      }
      double v36 = [v17 objectForKeyedSubscript:@"VUIAdvisoryViewAdditionalViewsDictionaryKey"];
      double v21 = v36;
      if (v36)
      {
        double v37 = [v36 firstObject];

        if (v37)
        {
          CGRect v55 = [v21 firstObject];
          double v38 = [VUIAdditionalAdvisoryInfoView alloc];
          double v39 = -[VUIAdditionalAdvisoryInfoView initWithAdvisoryInfoDictionary:reduceMotion:](v38, "initWithAdvisoryInfoDictionary:reduceMotion:", v55, [MEMORY[0x1E4FB3C20] isFeatureEnabled:1]);
          id v40 = [(VUIAdditionalAdvisoryInfoView *)v39 layout];
          uint64_t v41 = *(void *)(a1 + 56);
          [v40 margin];
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;
          double v49 = v48;
          [v40 portraitMargin];
          (*(void (**)(uint64_t, VUIAdditionalAdvisoryInfoView *, void *, double, double, double, double, double, double, double, double, double, double, double, double))(v41 + 16))(v41, v39, v16, v43, v45, v47, v49, v50, v51, v52, v53, v8, v10, v12, v14);
          [WeakRetained setHmwView:v39];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_4;
          v56[3] = &unk_1E6DF7118;
          objc_copyWeak(&v58, v2);
          long long v57 = v39;
          char v59 = *(unsigned char *)(a1 + 72);
          double v54 = v39;
          dispatch_async(MEMORY[0x1E4F14428], v56);

          objc_destroyWeak(&v58);
        }
      }
    }

LABEL_7:
LABEL_9:
  }
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = [WeakRetained platterView];
  [v2 showAnimated:v3 platterView:v4 completion:0];
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = [WeakRetained platterView];
  [v2 showWithAnimatedLogoAndText:v3 animateDivider:1 platterView:v4 completion:0];
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_5(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained ratingView];
  uint64_t v5 = [WeakRetained hmwView];
  BOOL v6 = (void *)v5;
  if (v4)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
    double v8 = [WeakRetained platterView];
    double v9 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_6;
    void v15[3] = &unk_1E6DF5490;
    double v10 = &v17;
    objc_copyWeak(&v17, v2);
    id v16 = v4;
    [v16 hideAnimated:v7 platterView:v8 completion:v15];
LABEL_5:

    objc_destroyWeak(v10);
    goto LABEL_6;
  }
  if (v5)
  {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 40);
    double v8 = [WeakRetained platterView];
    double v9 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_7;
    v12[3] = &unk_1E6DF5490;
    double v10 = &v14;
    objc_copyWeak(&v14, v2);
    id v13 = v6;
    [v13 hideAnimated:v11 platterView:v8 hidePlatterView:1 completion:v12];
    goto LABEL_5;
  }
LABEL_6:
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) removeFromSuperview];
  [WeakRetained setRatingView:0];
  id v2 = [WeakRetained platterView];
  [v2 removeFromSuperview];

  [WeakRetained setPlatterView:0];
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) removeFromSuperview];
  [WeakRetained setHmwView:0];
  id v2 = [WeakRetained platterView];
  [v2 removeFromSuperview];

  [WeakRetained setPlatterView:0];
}

- (void)_showProductPlacement:(BOOL)a3 withImage:(id)a4 animated:(BOOL)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke;
  aBlock[3] = &unk_1E6DF7118;
  objc_copyWeak(&v21, &location);
  id v9 = v8;
  id v20 = v9;
  BOOL v22 = a5;
  double v10 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_3;
  v16[3] = &unk_1E6DF5330;
  objc_copyWeak(&v17, &location);
  BOOL v18 = a5;
  uint64_t v11 = _Block_copy(v16);
  double v15 = v11;
  if (v6) {
    uint64_t v11 = v10;
  }
  (*((void (**)(void *, uint64_t, uint64_t, uint64_t))v11 + 2))(v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained activePlayer];
  id v4 = [v3 currentMediaItem];

  if (v4)
  {
    uint64_t v5 = [WeakRetained avPlayerViewController];
    [v5 videoBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [WeakRetained avPlayerViewController];
    double v15 = [v14 contentOverlayView];

    v29.origin.double x = v7;
    v29.origin.double y = v9;
    v29.size.double width = v11;
    v29.size.double height = v13;
    if (CGRectEqualToRect(v29, *MEMORY[0x1E4F1DB28]) || !v15)
    {
      [WeakRetained setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:1];
      [WeakRetained setShouldAnimateProductPlacementView:*(unsigned __int8 *)(a1 + 48)];
    }
    else
    {
      id v16 = +[VUIVideoAdvisoryInfoDictionaryBuilder advisoryInfoDictionaryWithRatingImage:*(void *)(a1 + 32) photoSensitivityImage:0 highMotionWarningImage:0 andMediaItem:v4];
      id v17 = [[VUIProductPlacementView alloc] initWithAdvisoryInfoDictionary:v16];
      BOOL v18 = [(VUIProductPlacementView *)v17 layout];
      [v18 margin];
      double v20 = v7 + v19;
      [v18 margin];
      double v22 = v9 + v21;
      -[VUIProductPlacementView sizeThatFits:](v17, "sizeThatFits:", v11, v13);
      -[VUIProductPlacementView setFrame:](v17, "setFrame:", v20, v22, v23, v24);
      [v15 addSubview:v17];
      [WeakRetained setProductPlacementView:v17];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_2;
      id v26[3] = &unk_1E6DF51F0;
      double v27 = v17;
      char v28 = *(unsigned char *)(a1 + 48);
      double v25 = v17;
      dispatch_async(MEMORY[0x1E4F14428], v26);
    }
  }
}

uint64_t __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) show:1 animated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

void __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained productPlacementView];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_4;
  v6[3] = &unk_1E6DF3F68;
  id v7 = v3;
  id v8 = WeakRetained;
  id v5 = v3;
  [v5 show:0 animated:v4 completion:v6];
}

uint64_t __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);
  return [v2 setProductPlacementView:0];
}

- (void)_showSkipAndPromoView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Promo view show = %d", buf, 8u);
  }
  id v8 = [(VUIPlaybackManager *)self featureMonitor];
  double v9 = [v8 activeFeatureForType:7];

  double v10 = [v9 userInfo];
  if (v5)
  {
    double v11 = [(VUIPlaybackManager *)self avPlayerViewController];
    id v12 = [v11 view];

    if (v12)
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke;
      aBlock[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v58, &location);
      double v13 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v14 = [(VUIPlaybackManager *)self promoMetadataView];
      if (!v14) {
        goto LABEL_15;
      }
      double v15 = [(VUIPlaybackManager *)self promoMetadataView];
      id v16 = [v15 superview];
      BOOL v17 = v16 == 0;

      if (v17)
      {
LABEL_15:
        double v25 = objc_alloc_init(VUIPromoMetadataView);
        [(VUIPromoMetadataView *)v25 setDelegate:self];
        [(VUIPromoMetadataView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(VUIPromoMetadataView *)v25 updateWithInfo:v10];
        [(VUIPlaybackManager *)self setPromoMetadataView:v25];
        double v26 = (void *)MEMORY[0x1E4FB1F48];
        [v12 bounds];
        uint64_t v27 = objc_msgSend(v26, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v65));
        char v28 = (void *)MEMORY[0x1E4FB1F48];
        [v12 bounds];
        uint64_t v29 = objc_msgSend(v28, "vui_currentSizeClassForWindowWidth:", CGRectGetHeight(v66));
        *(void *)buf = 0;
        __int16 v61 = buf;
        uint64_t v62 = 0x2020000000;
        double v63 = 0.0;
        v54[0] = 0;
        v54[1] = v54;
        v54[2] = 0x2020000000;
        if ((unint64_t)(v27 - 6) >= 0xFFFFFFFFFFFFFFFDLL)
        {
          if ((unint64_t)(v29 - 2) >= 4) {
            double v31 = 90.0;
          }
          else {
            double v31 = 80.0;
          }
          double v30 = 34.0;
          if ((unint64_t)(v29 - 2) < 4) {
            double v30 = 80.0;
          }
          double v63 = v31;
        }
        else
        {
          double v30 = 34.0;
        }
        BOOL v32 = (unint64_t)(v27 - 6) < 0xFFFFFFFFFFFFFFFDLL;
        *(double *)&v54[3] = v30;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_3;
        v46[3] = &unk_1E6DF7168;
        id v47 = v12;
        double v33 = v25;
        BOOL v53 = v32;
        double v48 = v33;
        double v50 = v54;
        objc_copyWeak(&v52, &location);
        double v51 = buf;
        id v49 = v10;
        double v34 = (void (**)(void))_Block_copy(v46);
        double v35 = v34;
        if (v4)
        {
          [(VUIPromoMetadataView *)v33 setAlpha:0.0];
          v35[2](v35);
          v13[2](v13);
          double v36 = (void *)MEMORY[0x1E4FB1EB0];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_4;
          v44[3] = &unk_1E6DF3D58;
          double v45 = v33;
          [v36 animateWithDuration:5242880 delay:v44 options:0 animations:0.5 completion:0.0];
        }
        else
        {
          v34[2](v34);
          v13[2](v13);
        }

        objc_destroyWeak(&v52);
        _Block_object_dispose(v54, 8);
        _Block_object_dispose(buf, 8);

        objc_destroyWeak(&v58);
        objc_destroyWeak(&location);
      }
      else
      {
        BOOL v18 = [(VUIPlaybackManager *)self promoMetadataView];
        [v18 setAlpha:0.0];
        [v18 updateWithInfo:v10];
        if (v4)
        {
          v13[2](v13);
          double v19 = (void *)MEMORY[0x1E4FB1EB0];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_2;
          v55[3] = &unk_1E6DF3D58;
          id v56 = v18;
          [v19 animateWithDuration:5242880 delay:v55 options:0 animations:0.5 completion:0.0];
        }
        else
        {
          [v18 setAlpha:1.0];
          v13[2](v13);
        }

        objc_destroyWeak(&v58);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    double v20 = [(VUIPlaybackManager *)self promoMetadataView];
    double v21 = [v20 skipInfo];
    double v22 = [v21 promoInfo];
    [(VUIPlaybackManager *)self setPromoMetadataView:0];
    objc_initWeak((id *)buf, self);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_5;
    v41[3] = &unk_1E6DF6510;
    id v12 = v20;
    id v42 = v12;
    objc_copyWeak(&v43, (id *)buf);
    double v23 = (void (**)(void))_Block_copy(v41);
    [(VUIPlaybackManager *)self _recordSkipButtonImpressionsWithSkipInfo:v10];
    if (v22) {
      [(VUIPlaybackManager *)self _recordUpNextButtonImpressionsWithPromoInfo:v22];
    }
    if (v4)
    {
      double v24 = (void *)MEMORY[0x1E4FB1EB0];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_6;
      v39[3] = &unk_1E6DF3D58;
      id v40 = v12;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_7;
      v37[3] = &unk_1E6DF3D80;
      double v38 = v23;
      [v24 animateWithDuration:5242880 delay:v39 options:v37 animations:0.5 completion:0.0];
    }
    else
    {
      [v12 setAlpha:0.0];
      v23[2](v23);
    }

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
}

void __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained avPlayerViewController];

  [v3 setPlaybackControlsIncludeTransportControls:0];
  [v3 setPlaybackControlsIncludeVolumeControls:0];
  [v3 setPlaybackControlsIncludeDisplayModeControls:0];
  id v2 = [v3 configuration];
  [v2 setExcludedControls:32];
  [v3 setConfiguration:v2];
}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v2, "vui_sizeThatFits:", v3, v4);
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) bounds];
  if (*(unsigned char *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", (v9 - v6) * 0.5, v10 - v8 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v6, v8);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v12 = [WeakRetained avPlayerViewController];
    double v13 = v12;
    double v14 = v8 + *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    double v15 = 0.0;
    double v16 = 0.0;
  }
  else
  {
    int v17 = [*(id *)(a1 + 40) vuiIsRTL];
    [*(id *)(a1 + 32) bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v19 = v18;
    double v21 = v20;
    objc_msgSend(*(id *)(a1 + 40), "setFrame:");
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v12 = [WeakRetained avPlayerViewController];
    double v13 = v12;
    if (v17)
    {
      double v15 = v19 + v21;
      double v14 = 0.0;
      double v16 = 0.0;
    }
    else
    {
      double v16 = v21 + *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      double v15 = 0.0;
      double v14 = 0.0;
    }
  }
  objc_msgSend(v12, "setLegibleContentInsets:", 0.0, v15, v14, v16);

  double v22 = (id *)(a1 + 72);
  id v23 = objc_loadWeakRetained((id *)(a1 + 72));
  [v23 _addTappableViewToRemoveSkipButton];

  id v29 = +[VUIMetricsMediaEvent generateSkipImpressionsFromSkipInfo:*(void *)(a1 + 48)];
  id v24 = objc_loadWeakRetained((id *)(a1 + 72));
  [v24 setSkipButtonImpressionMetrics:v29];

  double v25 = [*(id *)(a1 + 48) promoInfo];
  if (v25)
  {
    id v26 = objc_loadWeakRetained(v22);
    [v26 _recordPageMetricsForPreRoll:v25];

    uint64_t v27 = +[VUIMetricsMediaEvent generateUpNextButtonImpressionsFromPromoInfo:v25];
    id v28 = objc_loadWeakRetained(v22);
    [v28 setUpNextButtonImpressionMetrics:v27];
  }
}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_5(id *a1)
{
  id v1 = a1;
  [a1[4] removeFromSuperview];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained _removeTappableViewForSkipButtonIfNeeded];

  id v3 = objc_loadWeakRetained(v1);
  double v4 = [v3 avPlayerViewController];
  objc_msgSend(v4, "setLegibleContentInsets:", 0.0, 0.0, 0.0, 0.0);

  id v5 = objc_loadWeakRetained(v1);
  id v13 = [v5 avPlayerViewController];

  id v6 = objc_loadWeakRetained(v1);
  double v7 = [v6 avPlayerViewController];
  [v7 setPlaybackControlsIncludeTransportControls:1];

  id v8 = objc_loadWeakRetained(v1);
  double v9 = [v8 avPlayerViewController];
  [v9 setPlaybackControlsIncludeVolumeControls:1];

  id v10 = objc_loadWeakRetained(v1);
  double v11 = [v10 avPlayerViewController];
  [v11 setPlaybackControlsIncludeDisplayModeControls:1];

  id v12 = [v13 configuration];
  [v12 setExcludedControls:0];
  [v13 setConfiguration:v12];
}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showSkipButtonWithTitle:(id)a3 show:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!v6)
  {
    double v16 = [(VUIPlaybackManager *)self skipButton];
    [(VUIPlaybackManager *)self setSkipButton:0];
    [(VUIPlaybackManager *)self setSkipCenterXConstraint:0];
    [(VUIPlaybackManager *)self setSkipBottomConstraint:0];
    [(VUIPlaybackManager *)self setSkipTrailingConstraint:0];
    objc_initWeak(&location, self);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_5;
    v44[3] = &unk_1E6DF6510;
    id v10 = v16;
    id v45 = v10;
    objc_copyWeak(&v46, &location);
    int v17 = (void (**)(void))_Block_copy(v44);
    [(VUIPlaybackManager *)self _recordSkipButtonImpressionsWithSkipInfo:0];
    if (v5)
    {
      double v18 = (void *)MEMORY[0x1E4FB1EB0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_6;
      v42[3] = &unk_1E6DF3D58;
      id v43 = v10;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_7;
      v40[3] = &unk_1E6DF3D80;
      uint64_t v41 = v17;
      [v18 animateWithDuration:5242880 delay:v42 options:v40 animations:0.5 completion:0.0];
    }
    else
    {
      v17[2](v17);
    }

    objc_destroyWeak(&v46);
LABEL_27:
    objc_destroyWeak(&location);
    goto LABEL_28;
  }
  double v9 = [(VUIPlaybackManager *)self avPlayerViewController];
  id v10 = [v9 view];

  if (v10)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke;
    aBlock[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v58, &location);
    double v11 = (void (**)(void))_Block_copy(aBlock);
    id v12 = [(VUIPlaybackManager *)self skipButton];

    if (v12)
    {
      id v13 = [(VUIPlaybackManager *)self skipButton];
      [v13 setTitle:v8 forState:0];
      [v13 alpha];
      if (v14 < 1.0)
      {
        if (v5)
        {
          [v13 setAlpha:0.0];
          v11[2](v11);
          double v15 = (void *)MEMORY[0x1E4FB1EB0];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_2;
          v55[3] = &unk_1E6DF3D58;
          id v56 = v13;
          [v15 animateWithDuration:5242880 delay:v55 options:0 animations:0.5 completion:0.0];
        }
        else
        {
          [v13 setAlpha:1.0];
          v11[2](v11);
        }
      }
    }
    else
    {
      double v19 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
      [v19 setTitle:v8 forState:0];
      double v20 = [MEMORY[0x1E4FB1618] whiteColor];
      [v19 setBackgroundColor:v20];

      [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v21 = [MEMORY[0x1E4FB1618] blackColor];
      [v19 setTitleColor:v21 forState:0];

      double v22 = [MEMORY[0x1E4FB1618] darkGrayColor];
      [v19 setTitleColor:v22 forState:5];

      id v23 = [v19 titleLabel];
      [v23 setTextAlignment:1];

      objc_msgSend(v19, "setContentEdgeInsets:", 14.0, 50.0, 14.0, 50.0);
      id v24 = [v19 titleLabel];
      double v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
      [v24 setFont:v25];

      id v26 = [v19 layer];
      [v26 setCornerRadius:12.0];

      [v19 addTarget:self action:sel__skipButtonTapped_ forControlEvents:64];
      [(VUIPlaybackManager *)self setSkipButton:v19];
      uint64_t v27 = (void *)MEMORY[0x1E4FB1F48];
      [v10 bounds];
      uint64_t v28 = objc_msgSend(v27, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v60));
      id v29 = (void *)MEMORY[0x1E4FB1F48];
      [v10 bounds];
      uint64_t v30 = objc_msgSend(v29, "vui_currentSizeClassForWindowWidth:", CGRectGetHeight(v61));
      unint64_t v31 = v28 - 2;
      double v32 = 90.0;
      if ((unint64_t)(v30 - 2) >= 4)
      {
        BOOL v33 = 1;
      }
      else
      {
        double v32 = 80.0;
        BOOL v33 = v31 >= 4;
      }
      if (v33) {
        double v34 = 34.0;
      }
      else {
        double v34 = 80.0;
      }
      if (v31 >= 4) {
        double v35 = 0.0;
      }
      else {
        double v35 = v32;
      }
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_3;
      v49[3] = &unk_1E6DF7190;
      id v50 = v10;
      id v36 = v19;
      id v51 = v36;
      objc_copyWeak(v53, &location);
      BOOL v54 = (unint64_t)(v28 - 6) < 0xFFFFFFFFFFFFFFFCLL;
      v53[1] = *(id *)&v35;
      v53[2] = *(id *)&v34;
      id v52 = self;
      double v37 = (void (**)(void))_Block_copy(v49);
      double v38 = v37;
      if (v5)
      {
        [v36 setAlpha:0.0];
        v38[2](v38);
        v11[2](v11);
        double v39 = (void *)MEMORY[0x1E4FB1EB0];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_4;
        v47[3] = &unk_1E6DF3D58;
        id v48 = v36;
        [v39 animateWithDuration:5242880 delay:v47 options:0 animations:0.5 completion:0.0];
      }
      else
      {
        v37[2](v37);
        v11[2](v11);
      }

      objc_destroyWeak(v53);
    }

    objc_destroyWeak(&v58);
    goto LABEL_27;
  }
LABEL_28:
}

void __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained avPlayerViewController];
  [v3 setPlaybackControlsIncludeTransportControls:0];

  id v4 = objc_loadWeakRetained(v1);
  BOOL v5 = [v4 avPlayerViewController];
  [v5 setPlaybackControlsIncludeVolumeControls:0];

  id v7 = objc_loadWeakRetained(v1);
  BOOL v6 = [v7 avPlayerViewController];
  [v6 setPlaybackControlsIncludeDisplayModeControls:0];
}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [*(id *)(a1 + 40) centerXAnchor];
  BOOL v5 = [*(id *)(a1 + 32) centerXAnchor];
  BOOL v6 = [v4 constraintEqualToAnchor:v5];
  [WeakRetained setSkipCenterXConstraint:v6];

  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [*(id *)(a1 + 40) bottomAnchor];
  double v9 = [*(id *)(a1 + 32) bottomAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  [v7 setSkipBottomConstraint:v10];

  id v11 = objc_loadWeakRetained((id *)(a1 + 56));
  id v12 = [*(id *)(a1 + 40) trailingAnchor];
  id v13 = [*(id *)(a1 + 32) trailingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v11 setSkipTrailingConstraint:v14];

  LODWORD(v12) = *(unsigned __int8 *)(a1 + 80);
  id v15 = objc_loadWeakRetained((id *)(a1 + 56));
  id v16 = v15;
  if (v12)
  {
    [v15 skipCenterXConstraint];
  }
  else
  {
    int v17 = [v15 skipTrailingConstraint];
    [v17 setConstant:-*(double *)(a1 + 64)];

    id v16 = objc_loadWeakRetained((id *)(a1 + 56));
    [v16 skipTrailingConstraint];
  double v18 = };
  [v18 setActive:1];

  id v19 = objc_loadWeakRetained((id *)(a1 + 56));
  double v20 = [v19 skipBottomConstraint];
  [v20 setConstant:-*(double *)(a1 + 72)];

  id v21 = objc_loadWeakRetained((id *)(a1 + 56));
  double v22 = [v21 skipBottomConstraint];
  [v22 setActive:1];

  id v23 = objc_loadWeakRetained((id *)(a1 + 56));
  [v23 _addTappableViewToRemoveSkipButton];

  id v24 = [*(id *)(a1 + 48) featureMonitor];
  id v29 = [v24 activeFeatureForType:7];

  if (v29)
  {
    double v25 = [v29 userInfo];

    if (v25)
    {
      id v26 = [v29 userInfo];
      uint64_t v27 = +[VUIMetricsMediaEvent generateSkipImpressionsFromSkipInfo:v26];
      id v28 = objc_loadWeakRetained(v2);
      [v28 setSkipButtonImpressionMetrics:v27];
    }
  }
}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_5(id *a1)
{
  id v1 = a1;
  [a1[4] removeFromSuperview];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained _removeTappableViewForSkipButtonIfNeeded];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 avPlayerViewController];
  [v4 setPlaybackControlsIncludeTransportControls:1];

  id v5 = objc_loadWeakRetained(v1);
  BOOL v6 = [v5 avPlayerViewController];
  [v6 setPlaybackControlsIncludeVolumeControls:1];

  id v8 = objc_loadWeakRetained(v1);
  id v7 = [v8 avPlayerViewController];
  [v7 setPlaybackControlsIncludeDisplayModeControls:1];
}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_recordSkipButtonImpressionsWithSkipInfo:(id)a3
{
  id v7 = a3;
  id v4 = [(VUIPlaybackManager *)self skipButtonImpressionMetrics];
  if (v4)
  {
    id v5 = [(VUIPlaybackManager *)self activePlayer];
    BOOL v6 = [v5 currentMediaItem];

    +[VUIMetricsMediaEvent recordImpressionsOfSkipButton:v4 onMediaItem:v6 skipInfo:v7];
    [(VUIPlaybackManager *)self setSkipButtonImpressionMetrics:0];
  }
}

- (void)_recordUpNextButtonImpressionsWithPromoInfo:(id)a3
{
  id v7 = a3;
  id v4 = [(VUIPlaybackManager *)self upNextButtonImpressionMetrics];
  if (v4)
  {
    id v5 = [(VUIPlaybackManager *)self activePlayer];
    BOOL v6 = [v5 currentMediaItem];

    +[VUIMetricsMediaEvent recordImpressionsOfUpNextButton:v4 onMediaItem:v6 promoInfo:v7];
    [(VUIPlaybackManager *)self setUpNextButtonImpressionMetrics:0];
  }
}

- (void)_recordPageMetricsForPreRoll:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIPlaybackManager *)self featureMonitor];
  BOOL v6 = [v5 player];

  [v6 elapsedTime];
  double v8 = v7;
  double v9 = [v6 currentMediaItem];
  id v10 = [v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA038]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    double v14 = &stru_1F3E921E0;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v16 start];
        double v18 = v17;
        [v16 start];
        double v20 = v19;
        [v16 duration];
        double v22 = v20 + v21;
        if (v8 >= v18 && v8 < v22)
        {
          id v24 = [v16 adamID];
          uint64_t v25 = [v24 stringValue];

          double v14 = (__CFString *)v25;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v12);
  }
  else
  {
    double v14 = &stru_1F3E921E0;
  }
  v34[0] = @"pageContext";
  v34[1] = @"contentPlaying";
  v35[0] = @"preRoll";
  v35[1] = v14;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  uint64_t v27 = [v4 canonicalId];
  id v28 = +[VUIMetricsPageEventData createWithPageId:v27 andPageType:@"PreRoll" andEventData:v26];

  id v29 = +[VUIMetricsController sharedInstance];
  [v29 recordPage:v28];
}

- (void)_skipButtonTapped:(id)a3
{
  id v4 = [(VUIPlaybackManager *)self featureMonitor];
  id v20 = [v4 activeFeatureForType:7];

  id v5 = v20;
  if (v20)
  {
    BOOL v6 = [v20 userInfo];

    id v5 = v20;
    if (v6)
    {
      double v7 = [v20 userInfo];
      [v7 target];
      if (v8 > 0.0)
      {
        double v9 = v8;
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = [(VUIPlaybackManager *)self activePlayer];
        objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v11, VUIPlaybackManagerNotificationKeyPlayer[0]);

        objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", &unk_1F3F3CA88, VUIPlaybackManagerSeekReasonKey[0]);
        objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v7, VUIPlaybackManagerSeekInfoKey);
        uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v13 = VUIPlaybackManagerWillSkipIntroNotification[0];
        double v14 = (void *)[v10 copy];
        [v12 postNotificationName:v13 object:self userInfo:v14];

        id v15 = [(VUIPlaybackManager *)self activePlayer];
        id v16 = [v15 currentMediaItem];

        double v17 = [(VUIPlaybackManager *)self skipButtonImpressionMetrics];
        +[VUIMetricsMediaEvent recordClickOfSkipInfo:v7 onMediaItem:v16 impressionData:v17];
        [(VUIPlaybackManager *)self _recordSkipButtonImpressionsWithSkipInfo:v7];
        double v18 = [(VUIPlaybackManager *)self activePlayer];
        [v18 setElapsedTime:1 precise:v9];

        double v19 = [(VUIPlaybackManager *)self activePlayer];
        [v19 play];

        [(VUIPlaybackManager *)self _resetAutoPlayBingeWatchingQualifications];
      }

      id v5 = v20;
    }
  }
}

- (void)_updateRequiresLinearPlayback
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self mainAVPlayerViewController];
  if (v3)
  {
    id v4 = [(VUIPlaybackManager *)self mainPlayer];
    id v5 = [v4 currentMediaItem];
    int v6 = [v5 hasTrait:*MEMORY[0x1E4FAA160]];

    int v7 = [v3 requiresLinearPlayback];
    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        double v8 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Overriding requiresLinearPlayback to YES due to TVPMediaItemTraitDisableScrubbing", (uint8_t *)&v14, 2u);
        }
        BOOL v9 = 1;
LABEL_13:
        [v3 setRequiresLinearPlayback:v9];
      }
    }
    else if (v7 != [(VUIPlaybackManager *)self requiresLinearPlayback])
    {
      id v10 = (void *)sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        BOOL v12 = [(VUIPlaybackManager *)self requiresLinearPlayback];
        uint64_t v13 = @"NO";
        if (v12) {
          uint64_t v13 = @"YES";
        }
        int v14 = 138412290;
        id v15 = v13;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Setting requiresLinearPlayback to %@", (uint8_t *)&v14, 0xCu);
      }
      BOOL v9 = [(VUIPlaybackManager *)self requiresLinearPlayback];
      goto LABEL_13;
    }
    [(VUIPlaybackManager *)self _updateMultiviewButtonState];
  }
}

- (void)_updateMultiviewButtonState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self mainAVPlayerViewController];
  id v4 = +[VUIPlaybackTabManager sharedInstance];
  id v5 = [v4 tabsInfo];
  int v6 = [v5 multiviewTabInfo];
  if (v6)
  {
    int v7 = +[VUIFeaturesConfiguration sharedInstance];
    double v8 = [v7 multiviewConfig];
    if ([v8 isEnabled])
    {
      BOOL v9 = +[VUIInterfaceFactory sharedInstance];
      id v10 = [v9 groupActivitiesManager];
      int v11 = [v10 isSessionActive] ^ 1;
    }
    else
    {
      int v11 = 0;
    }
  }
  else
  {
    int v11 = 0;
  }

  BOOL v12 = [v3 view];
  uint64_t v13 = [v12 window];

  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v18 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = v18;
    v27.double width = v15;
    v27.double height = v17;
    id v20 = NSStringFromCGSize(v27);
    double v21 = VUIBoolLogString();
    int v22 = 138412546;
    id v23 = v20;
    __int16 v24 = 2112;
    uint64_t v25 = v21;
    _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Updating multiview button for size: %@, isEnabled: %@", (uint8_t *)&v22, 0x16u);
  }
  if (v11) {
    -[VUIPlaybackManager _addMultiviewButtonIfSupportedWithWindowSize:](self, "_addMultiviewButtonIfSupportedWithWindowSize:", v15, v17);
  }
  else {
    [(VUIPlaybackManager *)self _removeMultiviewButton];
  }
}

- (void)_addMultiviewButtonIfSupportedWithWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v6 = [(VUIPlaybackManager *)self multiPlayerViewController];
  if (!v6)
  {
    int v7 = +[VUIInterfaceFactory sharedInstance];
    double v8 = [v7 documentCreator];
    int v6 = [v8 createMultiPlayerViewControllerWithPlayerViewControllers:MEMORY[0x1E4F1CBF0] showingDetails:0];

    [v6 setDelegate:self];
  }
  int v9 = objc_msgSend(v6, "isSupportedScreenSize:", width, height);
  id v10 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = v10;
    v31.double width = width;
    v31.double height = height;
    BOOL v12 = NSStringFromCGSize(v31);
    uint64_t v13 = VUIBoolLogString();
    *(_DWORD *)buf = 138412546;
    CGSize v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Updating multiview button for size: %@, isSupported: %@", buf, 0x16u);
  }
  if (v9)
  {
    double v14 = [(VUIPlaybackManager *)self multiViewControlItem];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      objc_initWeak((id *)buf, self);
      double v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.split.2x2"];
      double v17 = [MEMORY[0x1E4FB1830] configurationWithPointSize:22.0];
      double v18 = [v16 imageWithConfiguration:v17];

      id v19 = objc_alloc(MEMORY[0x1E4F16710]);
      id v20 = +[VUILocalizationManager sharedInstance];
      double v21 = [v20 localizedStringForKey:@"TV.Button.WatchInMultiview"];
      int v22 = (void *)[v19 initWithTitle:v21 type:0];

      [v22 setImage:v18];
      id v23 = [MEMORY[0x1E4FB1618] whiteColor];
      [v22 setTintColor:v23];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __67__VUIPlaybackManager__addMultiviewButtonIfSupportedWithWindowSize___block_invoke;
      v24[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v25, (id *)buf);
      [v22 setAction:v24];
      [(VUIPlaybackManager *)self setMultiViewControlItem:v22];
      objc_destroyWeak(&v25);

      objc_destroyWeak((id *)buf);
    }
    [(VUIPlaybackManager *)self _mainPlayerViewControllerSetupControlItems];
  }
}

void __67__VUIPlaybackManager__addMultiviewButtonIfSupportedWithWindowSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Show multiview playback" withContext:0 userInfo:0];
}

- (void)_removeMultiviewButton
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = +[VUIPlaybackTabManager sharedInstance];
    int v6 = [v5 tabsInfo];
    int v7 = [v6 multiviewTabInfo];
    double v8 = VUIBoolLogString();
    [MEMORY[0x1E4FB3C90] isPad];
    int v9 = VUIBoolLogString();
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Removing multiview because it is not enabled => remote flag: %@, is iPad: %@", (uint8_t *)&v10, 0x16u);
  }
  [(VUIPlaybackManager *)self setMultiViewControlItem:0];
  [(VUIPlaybackManager *)self _mainPlayerViewControllerSetupControlItems];
}

- (void)_removePrerollFadeIn
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self featureMonitor];
  id v4 = [v3 featuresForType:8];

  id v5 = [(VUIPlaybackManager *)self activePlayer];
  [v5 elapsedTime];
  double v7 = v6;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "userInfo", (void)v24);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v16 = [v13 userInfo];
          double v17 = [v16 userInfo];
          double v18 = [v17 promoInfo];
          if (v18 && ([v17 start], v7 >= v19) && (objc_msgSend(v17, "target"), v7 <= v20))
          {
            [v13 restartTime];
            double v22 = v21;

            if (v22 != -9999.0) {
              [v13 setRestartTime:-9999.0];
            }
          }
          else
          {
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v23 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v10 = v23;
    }
    while (v23);
  }
}

- (BOOL)_shouldUseExperienceController
{
  return 0;
}

- (void)_addTimedMetadataDebuggerView
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self avPlayerViewController];
  id v4 = [v3 contentOverlayView];

  id v5 = [(VUITimedMetadataDebuggerViewController *)self->_timedMetadataDebuggerViewController view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v5];
  uint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
  double v19 = [v5 topAnchor];
  double v18 = [v4 topAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  double v16 = [v5 bottomAnchor];
  BOOL v15 = [v4 bottomAnchor];
  double v6 = [v16 constraintEqualToAnchor:v15];
  v20[1] = v6;
  double v7 = [v5 leadingAnchor];
  id v8 = [v4 leadingAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  v20[2] = v9;
  uint64_t v10 = [v5 trailingAnchor];
  uint64_t v11 = [v4 trailingAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v20[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v14 activateConstraints:v13];
}

- (void)_addPerformanceDebuggerView
{
  void v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self avPlayerViewController];
  id v4 = [v3 contentOverlayView];

  id v5 = [(VUIPlaybackManager *)self performanceDebuggerViewController];
  double v6 = [v5 view];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v6];
  self->_hasPerformanceDebuggerAppeared = 0;
  BOOL v15 = (void *)MEMORY[0x1E4F28DC8];
  double v20 = [v6 topAnchor];
  double v19 = [v4 topAnchor];
  double v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  double v17 = [v6 bottomAnchor];
  double v16 = [v4 bottomAnchor];
  double v7 = [v17 constraintEqualToAnchor:v16];
  v21[1] = v7;
  id v8 = [v6 leadingAnchor];
  uint64_t v9 = [v4 leadingAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  v21[2] = v10;
  uint64_t v11 = [v6 trailingAnchor];
  uint64_t v12 = [v4 trailingAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  v21[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v15 activateConstraints:v14];
}

- (void)_setupPerformanceDebugger:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIPlaybackManager *)self performanceDebuggerViewController];
  double v6 = [v4 startupEventsDict];

  [v5 setupWithPlaybackEventsDictionary:v6];
  double v7 = [MEMORY[0x1E4FB3C80] sharedInstance];
  LODWORD(v5) = [v7 performanceDebuggerVerboseEnabled];

  double v8 = 5.0;
  if (v5) {
    double v8 = 30.0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __48__VUIPlaybackManager__setupPerformanceDebugger___block_invoke;
  v10[3] = &unk_1E6DF71B8;
  void v10[4] = self;
  uint64_t v9 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v10 block:v8];
  [(VUIPlaybackManager *)self setClearPerformanceDebuggerTimer:v9];
}

void __48__VUIPlaybackManager__setupPerformanceDebugger___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) performanceDebuggerViewController];
  [v1 clear];
}

- (void)_addTappableViewToRemoveSkipButton
{
  uint64_t v22 = [(VUIPlaybackManager *)self skipButton];
  uint64_t v3 = [(VUIPlaybackManager *)self promoMetadataView];
  if (v22 | v3)
  {
    id v4 = [(VUIPlaybackManager *)self avPlayerViewController];
    id v5 = [v4 view];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [v5 bounds];
      double v7 = objc_msgSend(v6, "initWithFrame:");
      double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDismissSkipButtonGesture_];
      [v7 setTag:76];
      [v7 addGestureRecognizer:v8];
      if (v22) {
        uint64_t v9 = v22;
      }
      else {
        uint64_t v9 = v3;
      }
      [v5 insertSubview:v7 belowSubview:v9];
      uint64_t v10 = [v7 leadingAnchor];
      uint64_t v11 = [v5 leadingAnchor];
      uint64_t v12 = [v10 constraintEqualToAnchor:v11];
      [v12 setActive:1];

      uint64_t v13 = [v7 trailingAnchor];
      uint64_t v14 = [v5 trailingAnchor];
      BOOL v15 = [v13 constraintEqualToAnchor:v14];
      [v15 setActive:1];

      double v16 = [v7 rightAnchor];
      double v17 = [v5 rightAnchor];
      double v18 = [v16 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      double v19 = [v7 bottomAnchor];
      double v20 = [v5 bottomAnchor];
      double v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];
    }
  }
}

- (void)_removeTappableViewForSkipButtonIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(VUIPlaybackManager *)self avPlayerViewController];
  uint64_t v3 = [v2 view];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(v3, "subviews", 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 tag] == 76)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v5 removeFromSuperview];
}

- (void)_handleDismissSkipButtonGesture:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 state] == 3)
  {
    id v4 = [(VUIPlaybackManager *)self featureMonitor];
    id v5 = [v4 featuresForType:7];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          long long v12 = [(VUIPlaybackManager *)self featureMonitor];
          [v12 deactivateFeature:v11 animated:1];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(VUIPlaybackManager *)self _resetAutoPlayBingeWatchingQualifications];
  }
}

- (void)_configureStillWatchingFeatureMonitoringIfLivePlayback
{
  uint64_t v3 = [(VUIPlaybackManager *)self mainPlayer];
  [v3 duration];
  double v5 = v4;

  if (v5 == *MEMORY[0x1E4FA9DC0])
  {
    id v6 = +[VUIFeaturesConfiguration sharedInstance];
    id v10 = [v6 nowPlayingConfig];

    if ([v10 showsStillWatchingAlert])
    {
      [v10 stillWatchingAlertDuration];
      if (v7 > 0.0)
      {
        uint64_t v8 = [[VUINowPlayingTimerTriggeredFeature alloc] initWithType:10 duration:1 repeats:v7];
        uint64_t v9 = [(VUIPlaybackManager *)self featureMonitor];
        [v9 addFeature:v8];
      }
    }
  }
}

- (void)_updateTimeTriggeredFeature:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 type] == 10) {
    [(VUIPlaybackManager *)self _showStillWatchingAlertFeature:v5];
  }
}

- (void)_showStillWatchingAlertFeature:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 isActive])
  {
    objc_initWeak(&location, self);
    id v6 = +[VUIFeaturesConfiguration sharedInstance];
    double v7 = [v6 nowPlayingConfig];
    [v7 alertIdleTimeout];
    double v9 = v8;

    id v10 = [(VUIPlaybackManager *)self mainPlayer];
    uint64_t v11 = [v10 currentMediaItem];
    long long v12 = [v11 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

    long long v13 = [(VUIPlaybackManager *)self avPlayerViewController];
    long long v14 = objc_msgSend(v13, "vui_viewControllerForFullScreenPresentation");

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__VUIPlaybackManager__showStillWatchingAlertFeature___block_invoke;
    void v15[3] = &unk_1E6DF71E0;
    objc_copyWeak(&v17, &location);
    id v16 = v5;
    +[VUIStillWatchingAlertPresenter presentWithTitle:v12 presentingController:v14 timeout:v15 responseHandler:v9];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

uint64_t __53__VUIPlaybackManager__showStillWatchingAlertFeature___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained dismissPlaybackAnimated:1 leaveGroupActivitySession:1 completion:0];
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setActive:0];
}

- (void)_performEnterBackgroundOperations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIPlaybackManager *)self pausedTooLongTimer];

  if (v3)
  {
    id v4 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating paused too long timer because app was backgrounded. Will re-create timer when app is foregrounded", v17, 2u);
    }
    id v5 = [(VUIPlaybackManager *)self pausedTooLongTimer];
    [v5 invalidate];

    [(VUIPlaybackManager *)self setPausedTooLongTimer:0];
  }
  if ([(VUIPlaybackManager *)self isFullscreenPlaybackUIBeingShown])
  {
    id v6 = [(VUIPlaybackManager *)self activePlayer];
    uint64_t v7 = [v6 externalPlaybackType];

    if (v7)
    {
      double v8 = sLogObject_5;
      BOOL v9 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
      uint64_t v10 = 0;
      if (v9)
      {
        *(_DWORD *)id v17 = 134217984;
        *(void *)&v17[4] = 0x404E000000000000;
        uint64_t v11 = "Will NOT restart playback if backgrounded for more than %f seconds because external playback is active";
        goto LABEL_11;
      }
    }
    else
    {
      long long v13 = [(VUIPlaybackManager *)self activePlayer];
      long long v14 = [v13 currentMediaItem];
      int v15 = [v14 hasTrait:*MEMORY[0x1E4FAA1B0]];

      double v8 = sLogObject_5;
      BOOL v16 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (!v16) {
          goto LABEL_12;
        }
        *(_DWORD *)id v17 = 134217984;
        *(void *)&v17[4] = 0x404E000000000000;
        uint64_t v11 = "Will NOT restart playback if backgrounded for more than %f seconds because media item does not require it";
LABEL_11:
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, v11, v17, 0xCu);
LABEL_12:
        uint64_t v10 = 0;
        goto LABEL_13;
      }
      if (v16)
      {
        *(_DWORD *)id v17 = 134217984;
        *(void *)&v17[4] = 0x404E000000000000;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Will restart playback if backgrounded for more than %f seconds", v17, 0xCu);
      }
      uint64_t v10 = 1;
    }
  }
  else
  {
    double v8 = sLogObject_5;
    BOOL v12 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    uint64_t v10 = 0;
    if (v12)
    {
      *(_DWORD *)id v17 = 134217984;
      *(void *)&v17[4] = 0x404E000000000000;
      uint64_t v11 = "Will NOT restart playback if backgrounded for more than %f seconds because playback is not fullscreen";
      goto LABEL_11;
    }
  }
LABEL_13:
  -[VUIPlaybackManager setShouldRestartIfAppHasBeenBackgroundedTooLong:](self, "setShouldRestartIfAppHasBeenBackgroundedTooLong:", v10, *(_OWORD *)v17);
}

- (void)_performEnterForegroundOperations
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to determine whether to restart playback since dateAppWasBackgrounded is nil", v2, v3, v4, v5, v6);
}

- (void)_avPlayerViewControllerPresentationDidTimeout
{
  id v2 = [(VUIPlaybackManager *)self stateMachine];
  [v2 postEvent:@"AVPlayerViewController presentation did timeout"];
}

- (void)_donateUserActivityForMediaItem:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F29230];
  id v5 = a3;
  id v10 = (id)[[v4 alloc] initWithActivityType:@"com.apple.UMC.externalMediaContent"];
  uint8_t v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  uint64_t v7 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataDeepLinkURL"];

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [v10 setExternalMediaContentIdentifier:v6];
    [v10 setWebpageURL:v7];
    BOOL v9 = [(VUIPlaybackManager *)self avPlayerViewController];
    [v9 setUserActivity:v10];

    [v10 becomeCurrent];
  }
}

- (CGRect)_calculatePostPlayPipRectForParent:(id)a3
{
  uint64_t v4 = [a3 view];
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClass");
  uint8_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 orientation];

  BOOL v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = +[VUIUtilities isPortraitIgnoringFlatOrientation:viewSize:](VUIUtilities, "isPortraitIgnoringFlatOrientation:viewSize:", v7, v10, v12);
  if ([MEMORY[0x1E4FB3C90] isPhone])
  {
    if (!v13)
    {
      double v14 = 16.0;
LABEL_10:
      double v17 = 47.0;
      goto LABEL_11;
    }
  }
  else
  {
    int v15 = v5 < 3 || v13;
    if (v15 != 1)
    {
      double v14 = 38.0;
      goto LABEL_10;
    }
  }
  [v4 safeAreaInsets];
  double v14 = v16 + 60.0;
  double v17 = 16.0;
LABEL_11:
  int v18 = [MEMORY[0x1E4FB3C90] isPad];
  [v4 bounds];
  double v20 = v19;
  double v21 = [(VUIPlaybackManager *)self mainPlayer];
  [v21 currentMediaItemPresentationSize];
  double v23 = v22;
  double v25 = v24;

  if (v23 == 0.0 || v25 == 0.0)
  {
    double v28 = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    if (v18) {
      double v26 = 300.0;
    }
    else {
      double v26 = 212.0;
    }
    double v27 = v26 / (v23 / v25);
    if ([v4 vuiIsRTL]) {
      double v28 = v17;
    }
    else {
      double v28 = v20 - v26 - v17;
    }
  }

  double v29 = v28;
  double v30 = v14;
  double v31 = v26;
  double v32 = v27;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (BOOL)_isNewPostPlayEnabled
{
  return 1;
}

- (void)_updateActivityItemsConfigurationWithSharedWatchId:(id)a3 sharedWatchUrl:(id)a4 previewMetadata:(id)a5 mediaItem:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  int v15 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  double v16 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F70]];
  int v17 = [v16 BOOLValue];

  if ([v14 length])
  {
    if (v17) {
      goto LABEL_3;
    }
LABEL_10:
    id v38 = v10;
    double v20 = [v13 mediaItemMetadataForProperty:@"VUIContentMetadataDeepLinkURL"];
    id v37 = v11;
    if (v20)
    {
      double v21 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v20;
        _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Adding launch playback URL %@", buf, 0xCu);
      }
      double v22 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v20];
      if (!v12) {
        goto LABEL_27;
      }
    }
    else
    {
      double v22 = 0;
      if (!v12) {
        goto LABEL_27;
      }
    }
    double v23 = +[VUIInterfaceFactory sharedInstance];
    double v24 = [v23 groupActivitiesManager];

    if (v24)
    {
      if (v38 && v37)
      {
        double v25 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v37;
          _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Adding shared watch URL %@", buf, 0xCu);
        }
        double v26 = +[VUIInterfaceFactory sharedInstance];
        double v27 = [v26 groupActivitiesManager];
        uint64_t v28 = [v27 itemProviderForActivityWithSharedWatchId:v38 sharedWatchUrl:v37 previewMetadata:v12 existingItemProvider:v22];
LABEL_26:
        double v30 = (void *)v28;

        double v22 = v30;
        goto LABEL_27;
      }
      if (v15)
      {
        double v29 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v15;
          _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Adding group activity with adam id %@", buf, 0xCu);
        }
        double v26 = +[VUIInterfaceFactory sharedInstance];
        double v27 = [v26 groupActivitiesManager];
        uint64_t v28 = [v27 itemProviderForActivityWithAdamId:v15 previewMetadata:v12 existingItemProvider:v22];
        goto LABEL_26;
      }
    }
LABEL_27:
    if (v22)
    {
      id v31 = objc_alloc(MEMORY[0x1E4FB1408]);
      double v39 = v22;
      double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      long long v33 = (void *)[v31 initWithItemProviders:v32];
      [(VUIPlaybackManager *)self setItemsConfiguration:v33];

      double v34 = +[VUITVAppLauncher sharedInstance];
      double v35 = [v34 appWindow];
      id v36 = [v35 windowScene];

      [v36 setActivityItemsConfigurationSource:self];
    }
    else
    {
      [(VUIPlaybackManager *)self _clearActivityItemsConfiguration];
    }

    id v11 = v37;
    id v10 = v38;
    goto LABEL_31;
  }
  if ([v15 length]) {
    char v19 = v17;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_3:
  int v18 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Not adding items because adam id and canonical id are missing or is adult content", buf, 2u);
  }
  [(VUIPlaybackManager *)self _clearActivityItemsConfiguration];
LABEL_31:
}

- (void)_clearActivityItemsConfiguration
{
  [(VUIPlaybackManager *)self setItemsConfiguration:0];
  id v2 = +[VUITVAppLauncher sharedInstance];
  uint64_t v3 = [v2 appWindow];
  id v4 = [v3 windowScene];

  [v4 setActivityItemsConfigurationSource:0];
}

- (id)_multiviewInfoForPlayerViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 playerViewController];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_multiviewInfoForPlaylist:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v5 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 player];
        id v11 = [v10 playlist];
        int v12 = [v11 isEqualToPlaylist:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_muteAllMultiviewPlayersExcept:(id)a3
{
  id v4 = [(VUIPlaybackManager *)self _multiviewInfoForPlayerViewController:a3];
  unint64_t v5 = [(VUIPlaybackManager *)self _currentlyPlayingMultiviewInfo];
  if (v4)
  {
    id v6 = [v4 player];

    if (v6)
    {
      if (v4 != v5)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __53__VUIPlaybackManager__muteAllMultiviewPlayersExcept___block_invoke;
        v7[3] = &unk_1E6DF3F68;
        id v8 = v4;
        id v9 = v5;
        [v8 swapActiveAudioWithPlaybackInfo:v9 completion:v7];
      }
    }
  }
}

void __53__VUIPlaybackManager__muteAllMultiviewPlayersExcept___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContext:1];
  id v2 = [*(id *)(a1 + 32) playerViewController];
  [v2 setCanStartPictureInPictureAutomaticallyFromInline:1];

  [*(id *)(a1 + 40) setContext:0];
  id v3 = [*(id *)(a1 + 40) playerViewController];
  [v3 setCanStartPictureInPictureAutomaticallyFromInline:0];
}

- (void)_updateMultiviewReportingMetrics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlaybackManager *)self stateMachine];
  id v4 = [v3 currentState];
  if ([v4 isEqualToString:@"Showing multiview playback"])
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    id v6 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
    uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  }
  else
  {
    uint64_t v7 = &unk_1F3F3CAA0;
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(VUIPlaybackManager *)self multiviewPlaybackInfo];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) player];
        [v13 setReportingValueWithNumber:v7 forKey:@"multiviewCount"];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_handlePausedTooLong:(id)a3
{
  id v4 = [(VUIPlaybackManager *)self pausedTooLongTimer];
  [v4 invalidate];

  [(VUIPlaybackManager *)self setPausedTooLongTimer:0];
  unint64_t v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing playback since playback has been paused too long", v6, 2u);
  }
  [(VUIPlaybackManager *)self dismissPlaybackAnimated:1 leaveGroupActivitySession:1 completion:0];
}

- (void)_handleLongLoadingTimeout:(id)a3
{
  id v4 = [(VUIPlaybackManager *)self mainPlayerLongLoadingTimer];
  [v4 invalidate];

  [(VUIPlaybackManager *)self setMainPlayerLongLoadingTimer:0];
  id v5 = [(VUIPlaybackManager *)self stateMachine];
  [v5 postEvent:@"Main player long loading timer did fire" withContext:0 userInfo:0];
}

- (id)_getLivePostPlayPrefetchPlayerIfApplicable:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIPlaybackManager *)self mainLivePostPlayController];
  id v6 = [v5 prefetchedPlayer];

  if (v6)
  {
    uint64_t v7 = [(VUIPlaybackManager *)self mainLivePostPlayController];
    [v7 setPrefetchedPlayer:0];

    id v8 = [v6 playlist];
    uint64_t v9 = v8;
    if (v4 && v8 && [v8 isEqualToPlaylist:v4])
    {
      id v10 = v6;
    }
    else
    {
      [v6 invalidate];
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)presentViewControllerOnExtrasNav:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initWithRootViewController:v5];

  [v9 setModalPresentationStyle:0];
  id v6 = [(VUIPlaybackManager *)self backgroundAudioPlayer];
  [v6 stop];

  uint64_t v7 = [(VUIPlaybackManager *)self extrasContext];
  id v8 = [v7 extrasRootViewController];
  [v8 presentViewController:v9 animated:1 completion:0];
}

- (id)extrasNavigationController
{
  id v2 = +[VUIPlaybackManager sharedInstance];
  id v3 = [v2 extrasContext];
  id v4 = [v3 extrasRootViewController];
  id v5 = [v4 navigationController];

  return v5;
}

- (void)_registerBroadcastEndHandler
{
  objc_initWeak(&location, self);
  id v2 = +[VUIInterfaceFactory sharedInstance];
  id v3 = [v2 playbackEndManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__VUIPlaybackManager__registerBroadcastEndHandler__block_invoke;
  v4[3] = &unk_1E6DF7208;
  objc_copyWeak(&v5, &location);
  [v3 setPlaybackBroadcastDidEndHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__VUIPlaybackManager__registerBroadcastEndHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "player did end %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [v3 playlist];
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v6, @"PlaylistKey");

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained stateMachine];
  id v9 = (void *)[v5 copy];
  [v8 postEvent:@"Remove multiview playback" withContext:0 userInfo:v9];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "_createAndPresentExtrasAVPlayerViewController with presentingController:%@", buf, 0xCu);
  }
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v7 = [WeakRetained createPlayerViewController];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setAvPlayerViewController:v7];

  id v9 = objc_loadWeakRetained(v5);
  [v9 setExtrasAVPlayerViewController:v7];

  id v10 = objc_loadWeakRetained(v5);
  int v11 = [v10 _isNewPostPlayEnabled];

  if (v11) {
    [v7 _setIgnoreAppSupportedOrientations:1];
  }
  id v12 = objc_loadWeakRetained(v5);
  long long v13 = [v12 stateMachine];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_821;
  v16[3] = &unk_1E6DF7230;
  id v14 = v3;
  id v17 = v14;
  id v15 = v7;
  id v18 = v15;
  objc_copyWeak(&v19, v5);
  [v13 executeBlockAfterCurrentStateTransition:v16];

  objc_destroyWeak(&v19);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_821(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2;
  block[3] = &unk_1E6DF7230;
  id v3 = a1[4];
  id v4 = a1[5];
  objc_copyWeak(&v5, a1 + 6);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3;
  v3[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 presentViewController:v2 animated:1 completion:v3];
  objc_destroyWeak(&v4);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"AVPlayerViewController presentation did complete"];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 javascriptURL];

  id v5 = sLogObject_5;
  BOOL v6 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      __int16 v19 = 0;
      id v14 = "Extras URL does not exist for this media item";
      id v15 = (uint8_t *)&v19;
      long long v16 = v5;
LABEL_13:
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Extras URL exists for this media item", buf, 2u);
  }
  uint64_t v7 = +[VUIPlaybackSettings sharedSettings];
  uint64_t v8 = [v7 networkStatus];

  if (v8 != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = [WeakRetained mainPlayer];
    int v11 = [v10 allowsCellularUsage];

    if (!v11)
    {
      uint64_t v17 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v20 = 0;
        id v14 = "Not loading Extras since current network config and/or user settings do not allow it";
        id v15 = v20;
        long long v16 = v17;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
  id v12 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v21 = 0;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Will load Extras since current network config and user settings allow it", v21, 2u);
  }
  [v3 setShowsMenuBar:0];
  [v3 setShowsBuiltInNavigationControls:1];
  id v13 = v3;
LABEL_15:

  return v13;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_824(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[VideosExtrasContext alloc] initWithTVPMediaItem:v3];

  id v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v5;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_827(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4FA9EF0];
  id v4 = a2;
  id v5 = [v4 objectForKey:v3];
  BOOL v6 = [v4 objectForKey:*MEMORY[0x1E4FA9E20]];
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4FAA0D8]];
  uint64_t v8 = [v4 objectForKey:@"HLSURLKey"];

  id v9 = [[VUIStoreAuxMediaItem alloc] initWithURL:v8];
  id v10 = -[VideosExtrasContext initWithApplicationJavascriptURL:storeID:buyParameters:mediaItem:]([VideosExtrasContext alloc], "initWithApplicationJavascriptURL:storeID:buyParameters:mediaItem:", v5, [v7 longLongValue], v6, v9);
  int v11 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v11;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_830(id *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a2;
  id v5 = [v3 defaultCenter];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v5 addObserver:WeakRetained selector:sel__playbackStateDidChange_ name:*MEMORY[0x1E4FAA3C0] object:v4];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = objc_loadWeakRetained(a1);
  [v7 addObserver:v8 selector:sel__currentMediaItemDidChange_ name:*MEMORY[0x1E4FAA240] object:v4];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = objc_loadWeakRetained(a1);
  [v9 addObserver:v10 selector:sel__playbackErrorDidOccur_ name:*MEMORY[0x1E4FAA268] object:v4];

  int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v12 = objc_loadWeakRetained(a1);
  [v11 addObserver:v12 selector:sel__externalPlaybackTypeDidChange_ name:*MEMORY[0x1E4FAA3F8] object:v4];

  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v14 = objc_loadWeakRetained(a1);
  [v13 addObserver:v14 selector:sel__networkReachbilityDidChange_ name:*MEMORY[0x1E4FB3E08] object:0];

  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v16 = objc_loadWeakRetained(a1);
  [v15 addObserver:v16 selector:sel__playerRateDidChange_ name:*MEMORY[0x1E4FAA270] object:v4];

  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v18 = objc_loadWeakRetained(a1);
  [v17 addObserver:v18 selector:sel__didPlayToEnd_ name:*MEMORY[0x1E4FAA258] object:v4];

  id v19 = objc_loadWeakRetained(a1);
  [v4 addObserver:v19 forKeyPath:@"avPlayer" options:0 context:__PlayerAVPlayerKVOContext_0];

  id v20 = objc_loadWeakRetained(a1);
  [v4 addObserver:v20 forKeyPath:@"initialMediaItemHasCompletedInitialLoading" options:0 context:__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext];

  id v21 = objc_loadWeakRetained(a1);
  [v4 addObserver:v21 forKeyPath:@"duration" options:0 context:__PlayerMediaItemDurationKVOContext];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_855(id *a1, void *a2, int a3)
{
  id v5 = a2;
  BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v6 removeObserver:WeakRetained name:0 object:v5];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_loadWeakRetained(a1);
  [v8 removeObserver:v9 name:*MEMORY[0x1E4FB3E08] object:0];

  id v10 = objc_loadWeakRetained(a1);
  [v5 removeObserver:v10 forKeyPath:@"avPlayer" context:__PlayerAVPlayerKVOContext_0];

  id v11 = objc_loadWeakRetained(a1);
  [v5 removeObserver:v11 forKeyPath:@"initialMediaItemHasCompletedInitialLoading" context:__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext];

  id v12 = objc_loadWeakRetained(a1);
  [v5 removeObserver:v12 forKeyPath:@"duration" context:__PlayerMediaItemDurationKVOContext];

  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5;
    block[3] = &unk_1E6DF3D58;
    id v14 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained mainPlayer];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v7 = [v6 mainPlayer];
    [v2 addObject:v7];
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v8 extrasPlayer];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = [v10 extrasPlayer];
    [v2 addObject:v11];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v2;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  id v18 = objc_msgSend(v17, "backgroundAudioPlayer", (void)v23);
  [v18 invalidate];

  id v19 = objc_loadWeakRetained(v3);
  [v19 setBackgroundAudioPlayer:0];

  id v20 = objc_loadWeakRetained(v3);
  [v20 setActivePlayer:0];

  id v21 = objc_loadWeakRetained(v3);
  [v21 setMainPlayer:0];

  id v22 = objc_loadWeakRetained(v3);
  [v22 setExtrasPlayer:0];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  id v8 = [WeakRetained presentingViewController];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    if ([v9 dismissalOperation] == 1)
    {
      id v10 = objc_loadWeakRetained(v6);
      id v11 = [v10 presentingViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v13 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = @"NO";
          if (a2) {
            uint64_t v14 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          long long v33 = v14;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Popping presenting view controller; animated? %@",
            buf,
            0xCu);
        }
        id v15 = objc_loadWeakRetained(v6);
        uint64_t v16 = [v15 presentingViewController];

        id v17 = [v16 navigationController];
        id v18 = (id)[v17 popViewControllerAnimated:a2];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_858;
        block[3] = &unk_1E6DF3DD0;
        id v31 = v5;
        dispatch_async(MEMORY[0x1E4F14428], block);
        id v19 = v31;
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v21 = objc_loadWeakRetained(v6);
    uint64_t v22 = [v21 dismissalOperation];

    if (v22 != 2
      || (id v23 = objc_loadWeakRetained(v6),
          char v24 = [v23 isExperienceControllerPresented],
          v23,
          (v24 & 1) != 0))
    {
      uint64_t v20 = 0;
LABEL_20:
      id v27 = objc_loadWeakRetained(v6);
      [v27 setPresentingViewController:0];

      goto LABEL_21;
    }
    long long v25 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = @"NO";
      if (a2) {
        long long v26 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      long long v33 = v26;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Dismissing presenting view controller; animated? %@",
        buf,
        0xCu);
    }
    uint64_t v16 = objc_loadWeakRetained(v6);
    id v19 = [v16 presentingViewController];
    [v19 dismissViewControllerAnimated:a2 completion:v5];
LABEL_19:

    uint64_t v20 = 1;
    goto LABEL_20;
  }
  uint64_t v20 = 0;
LABEL_21:
  id v28 = objc_loadWeakRetained(v6);
  [v28 setDismissalOperation:0];

  return v20;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_858(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_860(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"PlayerViewControllerKey"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v4, VUIPlaybackManagerNotificationKeyPlayerViewController);
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_861;
  v8[3] = &unk_1E6DF5490;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = v5;
  id v9 = v7;
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, 1, v8);

  objc_destroyWeak(&v10);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_861(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained playbackContainerViewController];
  id v5 = [v4 presentingViewController];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    id v7 = [v6 playbackContainerViewController];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_862;
    void v11[3] = &unk_1E6DF6510;
    id v12 = *(id *)(a1 + 32);
    objc_copyWeak(&v13, v2);
    [v7 dismissViewControllerAnimated:0 completion:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = VUIPlaybackManagerPlayerControllerDismissedAfterPIPingNotification[0];
    id v9 = (void *)[*(id *)(a1 + 32) copy];
    [v10 postNotificationName:v8 object:0 userInfo:v9];
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_862(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = VUIPlaybackManagerPlayerControllerDismissedAfterPIPingNotification[0];
  id v4 = (void *)[*(id *)(a1 + 32) copy];
  [v2 postNotificationName:v3 object:0 userInfo:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained playbackContainerViewController];
  id v6 = (id)[v5 unembedMultiPlayerViewController];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_864(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained stateMachine];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_865;
  v4[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, v1);
  [v3 executeBlockAfterCurrentStateTransition:v4];

  objc_destroyWeak(&v5);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_865(uint64_t a1)
{
  v85[4] = *MEMORY[0x1E4F143B8];
  id location = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained avPlayerViewController];
  id v3 = [v2 customControlsView];
  long long v68 = [v3 transportControlsAreaLayoutGuide];

  id v4 = objc_loadWeakRetained(location);
  id v5 = [v4 avPlayerViewController];
  id v67 = [v5 contentOverlayView];

  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v67 addSubview:v6];
  double v63 = (void *)MEMORY[0x1E4F28DC8];
  long long v69 = v6;
  CGRect v66 = [v6 centerXAnchor];
  CGRect v65 = [v68 centerXAnchor];
  uint64_t v64 = [v66 constraintEqualToAnchor:v65];
  v85[0] = v64;
  id v7 = [v6 widthAnchor];
  id v8 = [v68 widthAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v85[1] = v9;
  id v10 = [v6 heightAnchor];
  id v11 = [v68 heightAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  v85[2] = v12;
  id v13 = [v69 bottomAnchor];
  uint64_t v14 = [v68 bottomAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];
  v85[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:4];
  [v63 activateConstraints:v16];

  [v67 layoutIfNeeded];
  [v69 frame];
  id v18 = v17;
  double v20 = v19;
  uint64_t v22 = v21;
  double v24 = v23;
  [v69 removeFromSuperview];
  id v25 = objc_loadWeakRetained(location);
  long long v26 = [v25 extrasPresenter];
  LODWORD(v13) = v26 == 0;

  double v27 = v20 + v24 + -70.3332977;
  if (v13)
  {
    id v28 = [VideosExtrasPresenter alloc];
    id v29 = objc_loadWeakRetained(location);
    double v30 = [v29 extrasContext];
    id v31 = -[VideosExtrasPresenter initWithExtrasContext:extrasMenuBarFrame:](v28, "initWithExtrasContext:extrasMenuBarFrame:", v30, *(double *)&v18, v27, *(double *)&v22, 70.3332977);

    id v32 = objc_loadWeakRetained(location);
    [v32 setExtrasPresenter:v31];
  }
  id v33 = objc_loadWeakRetained(location);
  uint64_t v34 = [v33 avPlayerViewController];
  double v35 = [v34 view];
  [v35 frame];
  double v37 = v36;
  double v39 = v38;

  id v40 = objc_loadWeakRetained(location);
  uint64_t v41 = [v40 extrasContext];
  uint64_t v42 = [v41 extrasRootViewController];
  objc_msgSend(v42, "setInitialPresentationSize:", v37, v39);

  id v43 = objc_loadWeakRetained(location);
  double v44 = [v43 avPlayerViewController];
  id v45 = objc_msgSend(v44, "vui_viewControllerForFullScreenPresentation");

  id v46 = objc_loadWeakRetained(location);
  id v47 = [v46 extrasPresenter];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_867;
  v83[3] = &unk_1E6DF7398;
  objc_copyWeak(v84, location);
  v84[1] = v18;
  v84[2] = *(id *)&v27;
  v84[3] = v22;
  v84[4] = (id)0x40519554C0000000;
  [v47 presentExtrasWith:v45 animated:1 completion:v83];

  id v48 = objc_loadWeakRetained(location);
  id v49 = [v48 activePlayer];
  id v50 = objc_loadWeakRetained(location);
  id v51 = [v50 extrasPlayer];
  BOOL v52 = v49 == v51;

  if (!v52)
  {
    uint64_t v77 = 0;
    id v78 = &v77;
    uint64_t v79 = 0x3032000000;
    id v80 = __Block_byref_object_copy__7;
    uint64_t v81 = __Block_byref_object_dispose__7;
    id v82 = 0;
    uint64_t v73 = 0;
    id v74 = &v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = 0;
    id v53 = objc_loadWeakRetained(location);
    BOOL v54 = [v53 extrasContext];
    uint64_t v55 = [v54 selectedMainMenuIndex];

    uint64_t v76 = v55;
    if (v74[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v56 = objc_loadWeakRetained(location);
      long long v57 = [v56 extrasContext];
      id v58 = [v57 mainMenuItemElements];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_868;
      v71[3] = &unk_1E6DF73C0;
      objc_copyWeak(&v72, location);
      v71[4] = &v77;
      v71[5] = &v73;
      [v58 enumerateObjectsUsingBlock:v71];

      if (v78[5])
      {
        id v59 = objc_loadWeakRetained(location);
        CGRect v60 = [v59 extrasContext];
        [v60 setClearsStackOnNextPush];

        id v61 = objc_loadWeakRetained(location);
        uint64_t v62 = [v61 extrasContext];
        [v62 setSelectedMainMenuIndex:v74[3]];

        [(id)v78[5] dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
      }
      objc_destroyWeak(&v72);
    }
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v77, 8);
  }
  objc_destroyWeak(v84);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_867(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained activePlayer];
  [v4 pause];

  id v7 = objc_loadWeakRetained(v2);
  id v5 = [v7 extrasContext];
  id v6 = [v5 extrasRootViewController];
  objc_msgSend(v6, "showExtrasMenuBarInFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_868(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = [WeakRetained extrasContext];
  char v10 = [v9 isMenuItemElementMainFeature:v11];

  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

BOOL __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_870(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained setExtrasPresenter:0];

  id v8 = objc_loadWeakRetained(v6);
  id v9 = [v8 backgroundAudioPlayer];

  if (v9)
  {
    id v10 = objc_loadWeakRetained(v6);
    id v11 = [v10 backgroundAudioPlayer];
    [v11 invalidate];

    id v12 = objc_loadWeakRetained(v6);
    [v12 setBackgroundAudioPlayer:0];
  }
  id v13 = objc_loadWeakRetained(v6);
  uint64_t v14 = [v13 mainAVPlayerViewController];
  id v15 = [v14 presentingViewController];

  uint64_t v16 = sLogObject_5;
  BOOL v17 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Going back to main content", buf, 2u);
    }
    id v18 = objc_loadWeakRetained(v6);
    int v19 = [v18 _isNewPostPlayEnabled];

    if (v19)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_871;
      v21[3] = &unk_1E6DF4D78;
      objc_copyWeak(&v23, v6);
      id v22 = v5;
      [v15 dismissViewControllerAnimated:a2 completion:v21];

      objc_destroyWeak(&v23);
    }
    else
    {
      [v15 dismissViewControllerAnimated:a2 completion:v5];
    }
  }
  else if (v17)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Cannot go back to main content, presentingViewController is nil.", buf, 2u);
  }

  return v15 != 0;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_871(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained playbackContainerViewController];
  [v2 dismissViewControllerAnimated:0 completion:*(void *)(a1 + 32)];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_872(uint64_t a1, char a2, char a3)
{
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained stateMachine];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_873;
  v8[3] = &unk_1E6DF73E8;
  objc_copyWeak(&v9, v5);
  char v10 = a2;
  char v11 = a3;
  [v7 executeBlockAfterCurrentStateTransition:v8];

  objc_destroyWeak(&v9);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_873(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained mainAVPlayerViewController];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 mainAVPlayerViewController];
    [v5 setAvPlayerViewController:v6];
  }
  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 backgroundAudioPlayer];
  [v8 stop];

  id v9 = objc_loadWeakRetained(v2);
  char v10 = [v9 backgroundAudioPlayer];
  [v10 invalidate];

  id v11 = objc_loadWeakRetained(v2);
  [v11 setBackgroundAudioPlayer:0];

  id v12 = +[VUITVAppLauncher sharedInstance];
  id v26 = [v12 appController];

  id v13 = [v26 navigationController];
  uint64_t v14 = [v13 topViewController];

  id v15 = objc_loadWeakRetained(v2);
  [v15 setPresentingViewController:v14];

  id v16 = objc_loadWeakRetained(v2);
  [v16 setDismissalOperation:0];

  id v17 = objc_loadWeakRetained(v2);
  id v18 = [v17 mainPlayer];
  [v17 setActivePlayer:v18];

  if (*(unsigned char *)(a1 + 40))
  {
    id v19 = objc_loadWeakRetained(v2);
    double v20 = [v19 mainPlayer];
    [v20 play];
  }
  id v21 = objc_loadWeakRetained(v2);
  id v22 = [v21 extrasPresenter];

  if (v22)
  {
    id v23 = objc_loadWeakRetained(v2);
    double v24 = [v23 extrasPresenter];
    [v24 dismissExtrasAnimated:*(unsigned __int8 *)(a1 + 41) completion:0];
  }
  id v25 = objc_loadWeakRetained(v2);
  [v25 setExtrasPresenter:0];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_875(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained _isNewPostPlayEnabled];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = v5;
  if (v4) {
    [v5 playbackContainerViewController];
  }
  else {
  id v7 = [v5 avPlayerViewController];
  }
  id v8 = [v7 view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_loadWeakRetained(v2);
  uint64_t v14 = [v13 extrasContext];

  if (!v14)
  {
    id v28 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v29 = "Not returning to Extras because context has gone away, probably due to an error";
LABEL_13:
      _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    }
LABEL_14:
    id v30 = objc_loadWeakRetained(v2);
    id v31 = [v30 mainAVPlayerViewController];
    [v30 setAvPlayerViewController:v31];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    return @"Showing video full screen";
  }
  id v15 = objc_loadWeakRetained(v2);
  id v16 = [v15 extrasContext];
  char v17 = objc_msgSend(v16, "shouldExtrasBeVisibleForSize:", v10, v12);

  if ((v17 & 1) == 0)
  {
    id v28 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v29 = "Not returning to Extras because they cannot be displayed for the current view size";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v18 = objc_loadWeakRetained(v2);
  id v19 = [v18 mainAVPlayerViewController];
  [v18 setAvPlayerViewController:v19];

  id v20 = objc_loadWeakRetained(v2);
  id v21 = [v20 extrasAVPlayerViewController];
  id v22 = [v21 presentingViewController];

  if (v22)
  {
    id v23 = objc_loadWeakRetained(v2);
    double v24 = [v23 extrasAVPlayerViewController];
    [v24 dismissViewControllerAnimated:1 completion:0];
  }
  id v25 = objc_loadWeakRetained(v2);
  id v26 = [v25 stateMachine];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_876;
  v32[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v33, v2);
  [v26 executeBlockAfterCurrentStateTransition:v32];

  objc_destroyWeak(&v33);
  return @"Showing Extras content";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_876(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained backgroundAudioPlayer];

  if (v2)
  {
    [v2 play];
  }
  else
  {
    id v3 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "No active backgroundAudioPlayer available", v4, 2u);
    }
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_878(uint64_t a1, int a2, int a3, int a4, unsigned int a5, int a6, int a7, void *a8)
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  v118 = a8;
  double v11 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setExtrasContext:0];

  id v13 = objc_loadWeakRetained((id *)(a1 + 48));
  [v13 setExtrasPresenter:0];

  id v14 = objc_loadWeakRetained((id *)(a1 + 48));
  [v14 setMoreInfoCanonicalViewController:0];

  id v15 = objc_loadWeakRetained((id *)(a1 + 48));
  [v15 setDateAppWasBackgrounded:0];

  id v16 = objc_loadWeakRetained((id *)(a1 + 48));
  [v16 setShouldRestartIfAppHasBeenBackgroundedTooLong:0];

  id v17 = objc_loadWeakRetained((id *)(a1 + 48));
  [v17 setDatePlaybackWasPaused:0];

  id v18 = objc_loadWeakRetained((id *)(a1 + 48));
  id v19 = [v18 pausedTooLongTimer];
  [v19 invalidate];

  id v20 = objc_loadWeakRetained((id *)(a1 + 48));
  [v20 setPausedTooLongTimer:0];

  id v21 = objc_loadWeakRetained((id *)(a1 + 48));
  id v22 = [v21 mainPlayerLongLoadingTimer];
  [v22 invalidate];

  id v23 = objc_loadWeakRetained((id *)(a1 + 48));
  [v23 setMainPlayerLongLoadingTimer:0];

  id v24 = objc_loadWeakRetained((id *)(a1 + 48));
  [v24 setLongLoadingAlertController:0];

  id v25 = objc_loadWeakRetained((id *)(a1 + 48));
  [v25 setHasMainPlayerFinishedInitialLoading:0];

  id v26 = objc_loadWeakRetained((id *)(a1 + 48));
  v119 = [v26 activePlayer];

  if ((a6 & 1) == 0 && ([v119 initialMediaItemHasCompletedInitialLoading] & 1) == 0)
  {
    double v27 = [v119 currentMediaItem];
    id v28 = [v27 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];

    if (v28 && ([v28 complete] & 1) == 0) {
      [v28 addSingleShotEventWithName:*MEMORY[0x1E4FAA350] value:*MEMORY[0x1E4FAA390]];
    }
  }
  if ((a4 & 1) == 0)
  {
    id v29 = objc_loadWeakRetained((id *)(a1 + 48));
    id v30 = [v29 mainAVPlayerViewController];
    [v30 setDelegate:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v31 = objc_loadWeakRetained((id *)(a1 + 48));
  [v31 _removePlayerFromTimedMetadataManager:v119];

  id v32 = objc_loadWeakRetained((id *)(a1 + 48));
  id v33 = [v32 timedMetadataDebuggerViewController];
  [v33 stopObserving];

  if (a2) {
    [v119 stop];
  }
  id v34 = objc_loadWeakRetained((id *)(a1 + 48));
  [v34 setSavedErrorUserInfo:0];

  id v35 = objc_loadWeakRetained((id *)(a1 + 48));
  [v35 setSavedErrorContext:0];

  id v36 = objc_loadWeakRetained((id *)(a1 + 48));
  [v36 setFeatureMonitor:0];

  id v37 = objc_loadWeakRetained((id *)(a1 + 48));
  [v37 setRatingImage:0];

  id v38 = objc_loadWeakRetained((id *)(a1 + 48));
  [v38 setPhotoSensitivityImage:0];

  id v39 = objc_loadWeakRetained((id *)(a1 + 48));
  id v40 = [v39 ratingView];
  [v40 removeFromSuperview];

  id v41 = objc_loadWeakRetained((id *)(a1 + 48));
  [v41 setRatingView:0];

  id v42 = objc_loadWeakRetained((id *)(a1 + 48));
  [v42 setProductPlacementImage:0];

  id v43 = objc_loadWeakRetained((id *)(a1 + 48));
  double v44 = [v43 productPlacementView];
  [v44 removeFromSuperview];

  id v45 = objc_loadWeakRetained((id *)(a1 + 48));
  [v45 setProductPlacementView:0];

  id v46 = objc_loadWeakRetained((id *)(a1 + 48));
  [v46 setLogoImageDownloader:0];

  if (a2)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v47 = objc_loadWeakRetained((id *)(a1 + 48));
    id v48 = [v47 multiviewPlaybackInfo];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v123 objects:v127 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v124;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v124 != v50) {
            objc_enumerationMutation(v48);
          }
          BOOL v52 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          id v53 = [v52 player];
          [v53 stop];

          BOOL v54 = [v52 player];
          [v54 invalidate];
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v123 objects:v127 count:16];
      }
      while (v49);
    }

    id v55 = objc_loadWeakRetained((id *)(a1 + 48));
    id v56 = [v55 multiviewPlaybackInfo];
    [v56 removeAllObjects];

    id v57 = objc_loadWeakRetained((id *)(a1 + 48));
    id v58 = [v57 mainLivePostPlayController];
    [v58 cleanup];

    id v59 = objc_loadWeakRetained((id *)(a1 + 48));
    [v59 setMainLivePostPlayController:0];
  }
  CGRect v60 = +[VUIPlaybackTabManager sharedInstance];
  id v61 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v62 = [v61 mainAVPlayerViewController];
  [v60 resetPlayerTabsForPlayerViewController:v62];

  id v63 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v64 = [v63 performanceDebuggerViewController];
  [v64 clear];

  id v65 = objc_loadWeakRetained((id *)(a1 + 48));
  [v65 setHasPerformanceDebuggerAppeared:0];

  id v66 = objc_loadWeakRetained((id *)(a1 + 48));
  id v67 = [v66 stateMachine];
  long long v68 = [v67 currentState];
  if ([v68 isEqualToString:@"Returning post play PiP to fullscreen with playback UI"])
  {
  }
  else
  {
    id v69 = objc_loadWeakRetained((id *)(a1 + 48));
    long long v70 = [v69 stateMachine];
    long long v71 = [v70 currentState];
    char v72 = [v71 isEqualToString:@"Returning post play PiP to fullscreen without playback UI"];

    if (v72) {
      goto LABEL_25;
    }
    id v73 = objc_loadWeakRetained((id *)(a1 + 48));
    [v73 setAutoPlayedVideosCount:0];

    id v66 = objc_loadWeakRetained((id *)(a1 + 48));
    [v66 setInitialPlaybackStartDate:0];
  }

LABEL_25:
  id v74 = objc_loadWeakRetained((id *)(a1 + 48));
  [v74 setConfiguredPostPlay:0];

  id v75 = objc_loadWeakRetained((id *)(a1 + 48));
  [v75 _mainPlayerViewControllerRemoveAllCustomControlItems];

  uint64_t v76 = (void *)MEMORY[0x1E4FBA8A8];
  id v77 = objc_loadWeakRetained((id *)(a1 + 48));
  [v76 cancelPreviousPerformRequestsWithTarget:v77 selector:sel__avPlayerViewControllerPresentationDidTimeout object:0];

  id v78 = objc_loadWeakRetained((id *)(a1 + 48));
  LODWORD(v76) = [v78 _isNewPostPlayEnabled];

  if (v76)
  {
    id v79 = objc_loadWeakRetained((id *)(a1 + 48));
    [v79 setDismissalOperation:2];
  }
  if (a4) {
    int v80 = 0;
  }
  else {
    int v80 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v81 = objc_loadWeakRetained(v11);
  id v82 = [v81 avPlayerViewController];
  BOOL v83 = v82 == 0;

  if (v83)
  {
    BOOL v86 = 0;
  }
  else
  {
    if (((a3 ^ 1 | v80) & 1) != 0
      || (id v84 = objc_loadWeakRetained(v11),
          char v85 = [v84 isExperienceControllerPresented],
          v84,
          (v85 & 1) != 0))
    {
      BOOL v86 = 0;
    }
    else
    {
      id v87 = objc_loadWeakRetained(v11);
      id v88 = [v87 avPlayerViewController];
      id v89 = [v88 presentingViewController];

      BOOL v86 = v89 != 0;
      if (v89)
      {
        v90 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v90, OS_LOG_TYPE_DEFAULT, "Dismissing AVPlayerViewController", buf, 2u);
        }
        [v89 dismissViewControllerAnimated:a5 completion:v118];
      }
    }
    id v91 = sLogObject_5;
    BOOL v92 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (v92)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v91, OS_LOG_TYPE_DEFAULT, "Keeping existing AVPlayerViewcontroller to re-use", buf, 2u);
      }
    }
    else
    {
      if (v92)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v91, OS_LOG_TYPE_DEFAULT, "Removing references to existing AVPlayerViewController", buf, 2u);
      }
      id v93 = objc_loadWeakRetained(v11);
      [v93 setAvPlayerViewController:0];

      id v94 = objc_loadWeakRetained(v11);
      [v94 setMainAVPlayerViewController:0];
    }
    id v95 = objc_loadWeakRetained(v11);
    [v95 setExtrasAVPlayerViewController:0];

    id v96 = objc_loadWeakRetained(v11);
    [v96 setPostPlayView:0];
  }
  if ((a4 & 1) == 0)
  {
    if (a6)
    {
      id v97 = objc_loadWeakRetained(v11);
      v98 = [v97 playbackContainerViewController];
      [v98 removePostPlayViewController];
    }
    id v99 = objc_loadWeakRetained(v11);
    char v100 = [v99 isExperienceControllerPresented];

    if ((v100 & 1) == 0)
    {
      id v101 = objc_loadWeakRetained(v11);
      id v102 = [v101 playbackContainerViewController];
      id v103 = [v102 presentingViewController];

      id v104 = objc_loadWeakRetained(v11);
      id v105 = [v104 playbackContainerViewController];
      id v106 = v105;
      if (v103)
      {
        v120[0] = MEMORY[0x1E4F143A8];
        v120[1] = 3221225472;
        v120[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_879;
        v120[3] = &unk_1E6DF4A30;
        objc_copyWeak(&v121, v11);
        [v106 dismissViewControllerAnimated:0 completion:v120];

        objc_destroyWeak(&v121);
      }
      else
      {
        id v107 = (id)[v105 unembedMultiPlayerViewController];

        id v108 = objc_loadWeakRetained(v11);
        [v108 setMultiPlayerViewController:0];

        id v109 = objc_loadWeakRetained(v11);
        [v109 setPlaybackContainerViewController:0];
      }
    }
  }
  if (a7)
  {
    v110 = +[VUIInterfaceFactory sharedInstance];
    id v111 = [v110 groupActivitiesManager];
    [v111 leaveSession];
  }
  id v112 = objc_loadWeakRetained(v11);
  [v112 _clearActivityItemsConfiguration];

  if (v118) {
    int v113 = v86;
  }
  else {
    int v113 = 1;
  }
  if (((v113 | v80) & 1) == 0) {
    v118[2]();
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_879(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained playbackContainerViewController];
  id v4 = (id)[v3 unembedMultiPlayerViewController];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setMultiPlayerViewController:0];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setPlaybackContainerViewController:0];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_881(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA9D88] paused];
  if (v4 != v3)
  {

LABEL_11:
    id v18 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v20 = [WeakRetained datePlaybackWasPaused];

    if (v20)
    {
      id v21 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Setting date playback was paused to nil", (uint8_t *)&v38, 2u);
      }
      id v22 = objc_loadWeakRetained(v18);
      [v22 setDatePlaybackWasPaused:0];
    }
    id v23 = objc_loadWeakRetained(v18);
    id v24 = [v23 pausedTooLongTimer];

    if (v24)
    {
      id v25 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Invalidating paused too long timer", (uint8_t *)&v38, 2u);
      }
      id v26 = objc_loadWeakRetained(v18);
      double v27 = [v26 pausedTooLongTimer];
      [v27 invalidate];

      id v28 = objc_loadWeakRetained(v18);
      [v28 setPausedTooLongTimer:0];
    }
    goto LABEL_19;
  }
  id v5 = (id *)(a1 + 32);
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [v6 activePlayer];
  id v8 = [v7 currentMediaItem];
  int v9 = [v8 hasTrait:VUIMediaItemTraitStopWhenPausedForTooLong];

  if (!v9) {
    goto LABEL_11;
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = [v10 datePlaybackWasPaused];

  if (!v11)
  {
    double v12 = [MEMORY[0x1E4F1C9C8] date];
    id v13 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      uint64_t v39 = (uint64_t)v12;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Setting date playback was paused to %@", (uint8_t *)&v38, 0xCu);
    }
    id v14 = objc_loadWeakRetained(v5);
    [v14 setDatePlaybackWasPaused:v12];
  }
  id v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v16 = [v15 applicationState];

  if (v16 == 2)
  {
    id v17 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Not creating paused too long timer since app is backgrounded. Will create the timer when app becomes foregrounded", (uint8_t *)&v38, 2u);
    }
  }
  else
  {
    id v29 = objc_loadWeakRetained(v5);
    id v30 = [v29 pausedTooLongTimer];

    if (!v30)
    {
      id v31 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 134218240;
        uint64_t v39 = 0x408C200000000000;
        __int16 v40 = 2048;
        uint64_t v41 = 0x402E000000000000;
        _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "Creating paused too long timer.  Will stop after %f seconds (%f minutes) of being paused", (uint8_t *)&v38, 0x16u);
      }
      id v32 = (void *)MEMORY[0x1E4F1CB00];
      id v33 = objc_loadWeakRetained(v5);
      id v34 = [v32 scheduledTimerWithTimeInterval:v33 target:sel__handlePausedTooLong_ selector:0 userInfo:0 repeats:900.0];

      id v35 = objc_loadWeakRetained(v5);
      id v36 = [v35 pausedTooLongTimer];
      [v36 invalidate];

      id v37 = objc_loadWeakRetained(v5);
      [v37 setPausedTooLongTimer:v34];
    }
  }
LABEL_19:
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_883(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = [WeakRetained _isNewPostPlayEnabled];

  id v9 = objc_loadWeakRetained(v6);
  id v10 = v9;
  if (v8)
  {
    double v11 = [v9 mainPlayer];

    if (v11)
    {
      id v12 = objc_loadWeakRetained(v6);
      [v12 _markMainPlayerMediaItemPostPlayActive:0];
    }
    id v13 = objc_loadWeakRetained(v6);
    id v14 = [v13 playbackContainerViewController];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_884;
    v44[3] = &unk_1E6DF3DD0;
    id v45 = v5;
    [v14 exitPictureInPictureWithCompletion:v44];

    id v15 = v45;
  }
  else
  {
    uint64_t v16 = [v9 activePlayer];
    id v15 = [v16 currentMediaItem];

    id v17 = objc_loadWeakRetained(v6);
    id v18 = [v17 postPlayView];

    id v19 = [v15 mediaItemMetadataForProperty:@"VUIContentMetadataPostPlayItemMetrics"];
    id v20 = objc_loadWeakRetained(v6);
    id v21 = [v20 activePlayer];
    [v21 setMediaItemEndAction:0];

    id v22 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Dismissing PostPlay View", buf, 2u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_885;
    aBlock[3] = &unk_1E6DF74B0;
    id v23 = v18;
    id v39 = v23;
    objc_copyWeak(&v42, v6);
    id v24 = v19;
    id v40 = v24;
    id v41 = v5;
    id v25 = _Block_copy(aBlock);
    if (a2)
    {
      [v23 frame];
      CGFloat y = v46.origin.y;
      CGFloat width = v46.size.width;
      CGFloat height = v46.size.height;
      CGFloat v29 = v46.origin.x + CGRectGetWidth(v46);
      id v30 = (void *)MEMORY[0x1E4FB1EB0];
      id v31 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_886;
      v37[3] = &unk_1E6DF74D8;
      void v37[4] = v23;
      *(CGFloat *)&v37[5] = v29;
      *(CGFloat *)&v37[6] = y;
      *(CGFloat *)&v37[7] = width;
      *(CGFloat *)&v37[8] = height;
      id v32 = v36;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_887;
      v36[3] = &unk_1E6DF3D80;
      void v36[4] = v25;
      [v30 animateWithDuration:0 delay:v37 options:v36 animations:0.5 completion:0.0];
    }
    else
    {
      id v33 = (void *)MEMORY[0x1E4FB1EB0];
      id v31 = v35;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      void v35[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_888;
      void v35[3] = &unk_1E6DF3D58;
      v35[4] = v23;
      id v32 = v34;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_889;
      v34[3] = &unk_1E6DF3D80;
      void v34[4] = v25;
      [v33 animateWithDuration:5242880 delay:v35 options:v34 animations:0.5 completion:0.0];
    }

    objc_destroyWeak(&v42);
  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_884(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_885(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _removeVideoDimmingViewForPostPlay];

  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [v3 avPlayerViewController];
  [v4 setPlaybackControlsIncludeTransportControls:1];

  [*(id *)(a1 + 32) stopAutoPlayTimer];
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = [v5 postPlayImpressionTime];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 56));
    int v8 = [v7 postPlayImpressionTime];
    v19[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

    if ([*(id *)(a1 + 40) count])
    {
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"VUIContentMetadataPostPlayItemMetricsImpressionsDataKey"];
      double v11 = (void *)[v10 mutableCopy];

      id v12 = [v11 objectForKeyedSubscript:@"impressions"];
      id v13 = (void *)[v12 mutableCopy];

      if (v11 && v13)
      {
        [v13 setObject:v9 forKeyedSubscript:@"impressionTimes"];
        id v14 = (void *)[v13 copy];
        id v18 = v14;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        [v11 setObject:v15 forKeyedSubscript:@"impressions"];

        uint64_t v16 = +[VUIMetricsController sharedInstance];
        [v16 recordImpressions:v11];
      }
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_886(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_887(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_888(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_889(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_891(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v4 BOOLForKey:@"RepeatMovieForever"])
  {

    goto LABEL_4;
  }
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"RepeatOneForAllMedia"];

  if (v6)
  {
LABEL_4:
    id v7 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "not configuring post play because RepeatMovieForever or RepeatOneForAllMedia is enabled", buf, 2u);
    }
    goto LABEL_14;
  }
  int v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConfiguredPostPlay:0];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_898;
  aBlock[3] = &unk_1E6DF5490;
  objc_copyWeak(&v23, v8);
  id v10 = v3;
  id v22 = v10;
  double v11 = (void (**)(void))_Block_copy(aBlock);
  id v12 = objc_loadWeakRetained(v8);
  int v13 = [v12 _isNewPostPlayEnabled];

  if (v13)
  {
    id v14 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
    if (([v14 isEqualToString:*MEMORY[0x1E4FAA1E8]] & 1) != 0
      || ([v14 isEqualToString:*MEMORY[0x1E4FAA200]] & 1) != 0
      || [v14 isEqualToString:*MEMORY[0x1E4FAA1F8]])
    {
      v11[2](v11);
      id v15 = objc_loadWeakRetained(v8);
      uint64_t v16 = [v15 playbackContainerViewController];
      [v16 loadPostPlayForMediaItem:v10];
    }
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_900;
    v17[3] = &unk_1E6DF7528;
    objc_copyWeak(&v20, v8);
    id v18 = v10;
    id v19 = v11;
    +[VUIPostPlayDataManager fetchPostPlayItemForCurrentMediaItem:v18 completion:v17];

    objc_destroyWeak(&v20);
  }

  objc_destroyWeak(&v23);
LABEL_14:
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_898(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained activePlayer];
  [v4 duration];
  double v6 = v5;

  if (v6 != *MEMORY[0x1E4FA9DC8])
  {
    id v7 = [*(id *)(a1 + 32) mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE0]];
    [v7 doubleValue];
    double v9 = v8;
    id v10 = +[VUIFeaturesConfiguration sharedInstance];
    double v11 = [v10 playbackUpNextConfig];

    if (v7 && ([v11 minTimeIntervalFromEndToDisplay], v6 - v9 >= v12)
      || (int v13 = (void *)MEMORY[0x1E4F28ED0],
          [v11 minTimeIntervalFromEndToDisplay],
          [v13 numberWithDouble:v6 - v14],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          v7,
          (id v7 = (void *)v15) != 0))
    {
      id v16 = objc_loadWeakRetained(v2);
      id v17 = [v16 featureMonitor];

      [v7 doubleValue];
      double v19 = v18;
      id v20 = [v17 featuresForType:2];
      id v21 = [v20 firstObject];

      if (v21) {
        [(VUINowPlayingTimeBoundFeature *)v21 setStartTime:v19];
      }
      else {
        id v21 = [[VUINowPlayingTimeBoundFeature alloc] initWithType:2 startTime:v19 duration:INFINITY];
      }
      id v22 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        id v24 = v21;
        _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "configured post play feature:<%@>", (uint8_t *)&v23, 0xCu);
      }
      [v17 addFeature:v21];
    }
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_900(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, void *a7)
{
  id v13 = a2;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v14 | v15)
  {
    double v18 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v20 = [WeakRetained isFullscreenPlaybackUIBeingShown];

    if (v20)
    {
      if (v14)
      {
        [(id)v14 setMediaItemMetadata:&unk_1F3F3CAA0 forProperty:*MEMORY[0x1E4FAA0C0]];
        id v21 = (id *)(a1 + 32);
        [*(id *)(a1 + 32) setMediaItemMetadata:v13 forProperty:@"VUIMediaItemMetadataUpNextPostPlayMediaInfo"];
        id v22 = (__CFString **)MEMORY[0x1E4FAA100];
        id v23 = (id)v14;
      }
      else
      {
        if (!v16) {
          goto LABEL_10;
        }
        id v21 = (id *)(a1 + 32);
        id v22 = VUIContentMetadataPostPlayItemUpsellRouterDataSource;
        id v23 = v16;
      }
      [*v21 setMediaItemMetadata:v23 forProperty:*v22];
LABEL_10:
      if (v17) {
        [*(id *)(a1 + 32) setMediaItemMetadata:v17 forProperty:@"VUIContentMetadataPostPlayItemMetrics"];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v25 = objc_loadWeakRetained((id *)(a1 + 48));
      id v26 = [v25 avPlayerViewController];
      double v27 = [v26 contentOverlayView];

      if (!v27) {
        goto LABEL_25;
      }
      id v63 = v16;
      id v61 = v13;
      unsigned int v62 = a6;
      long long v68 = v27;
      id v28 = [v27 traitCollection];
      if ([v28 isAXEnabled]) {
        double v29 = 271.0;
      }
      else {
        double v29 = 190.0;
      }

      long long v70 = [(id)v15 objectForKey:@"postPlayHeader"];
      uint64_t v30 = [(id)v15 objectForKey:@"postPlayTitle"];
      id v31 = [(id)v15 objectForKey:@"postPlayImage"];
      uint64_t v32 = [(id)v15 objectForKey:@"postPlayId"];
      id v65 = [(id)v15 objectForKey:@"postPlayViewType"];
      unint64_t v33 = +[VUIPostPlayView postPlayTypeFromString:](VUIPostPlayView, "postPlayTypeFromString:");
      id v34 = objc_loadWeakRetained(v18);
      id v66 = (void *)v32;
      [v34 setPostPlayItemId:v32];

      id v67 = v31;
      id v35 = [v31 objectForKey:@"src"];
      id v69 = (void *)v30;
      uint64_t v64 = v35;
      if ([v35 length])
      {
        id v36 = objc_loadWeakRetained(v18);
        id v37 = -[VUIPostPlayView initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:andType:]([VUIPostPlayView alloc], "initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:andType:", v35, v30, v70, v33, 0.0, 0.0, v29, 186.0);
        [v36 setPostPlayView:v37];
        uint64_t v38 = v62;
        id v13 = v61;
      }
      else
      {
        unint64_t v60 = v33;
        uint64_t v38 = v62;
        id v13 = v61;
        if (!v14)
        {
LABEL_24:
          id v41 = objc_loadWeakRetained(v18);
          id v42 = [v41 postPlayView];
          id v43 = objc_loadWeakRetained(v18);
          [v42 setDelegate:v43];

          id v44 = objc_loadWeakRetained(v18);
          id v45 = [v44 postPlayView];
          [v45 setCanAutoPlay:v38];

          id v46 = objc_loadWeakRetained(v18);
          id v47 = [v46 postPlayView];
          [v47 setAutoresizingMask:9];

          id v48 = objc_alloc(MEMORY[0x1E4FB1D38]);
          id v49 = objc_loadWeakRetained(v18);
          uint64_t v50 = (void *)[v48 initWithTarget:v49 action:sel__postPlayItemSelected_];

          id v51 = objc_loadWeakRetained(v18);
          BOOL v52 = [v51 postPlayView];
          [v52 addGestureRecognizer:v50];

          id v53 = objc_alloc(MEMORY[0x1E4FB1CC8]);
          id v54 = objc_loadWeakRetained(v18);
          id v55 = (void *)[v53 initWithTarget:v54 action:sel__dismissPostPlayWithSwipe_];

          [v55 setDirection:1];
          id v56 = objc_loadWeakRetained(v18);
          id v57 = [v56 postPlayView];
          [v57 addGestureRecognizer:v55];

          id v58 = objc_loadWeakRetained(v18);
          id v59 = [v58 stateMachine];
          [v59 postEvent:@"Post play has been configured"];

          double v27 = v68;
          id v16 = v63;
LABEL_25:

          goto LABEL_26;
        }
        id v36 = [(id)v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9DF0]];
        if (v36)
        {
          id v37 = (VUIPostPlayView *)objc_loadWeakRetained(v18);
          id v39 = -[VUIPostPlayView initWithFrame:andTVImageProxy:andTitle:andHeader:andType:]([VUIPostPlayView alloc], "initWithFrame:andTVImageProxy:andTitle:andHeader:andType:", v36, v30, v70, v60, 0.0, 0.0, v29, 186.0);
          [(VUIPostPlayView *)v37 setPostPlayView:v39];
        }
        else
        {
          id v37 = [(id)v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E08]];
          id v39 = (VUIPostPlayView *)objc_loadWeakRetained(v18);
          id v40 = -[VUIPostPlayView initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:andType:]([VUIPostPlayView alloc], "initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:andType:", v37, v30, v70, v60, 0.0, 0.0, v29, 186.0);
          [(VUIPostPlayView *)v39 setPostPlayView:v40];
        }
      }

      goto LABEL_24;
    }
  }
  id v24 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "No post play item for current media item", buf, 2u);
  }
LABEL_26:
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_909(uint64_t a1)
{
  v82[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _isNewPostPlayEnabled];

  id v4 = objc_loadWeakRetained(v1);
  double v5 = v4;
  if (v3)
  {
    [v4 _markMainPlayerMediaItemPostPlayActive:1];

    double v6 = +[VUIPostPlayUpsellConfig sharedInstance];
    [v6 setHasShownPostPlay:1];

    id v7 = objc_loadWeakRetained(v1);
    double v8 = [v7 playbackContainerViewController];
    [v8 enterPictureInPicture];

    id v9 = objc_loadWeakRetained(v1);
    id v10 = [v9 featureMonitor];
    double v11 = [v10 featuresForType:2];
    id v74 = [v11 firstObject];

    id v12 = objc_loadWeakRetained(v1);
    id v13 = [v12 featureMonitor];
    [v13 deactivateFeature:v74 animated:0];

    return;
  }
  unint64_t v14 = [v4 activePlayer];
  unint64_t v15 = [v14 currentMediaItem];

  id v16 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA100]];
  if (v16)
  {
    id v17 = +[VUIInterfaceFactory sharedInstance];
    double v18 = [v17 groupActivitiesManager];
    int v19 = [v18 isSessionActive];

    if (v19) {
      [v16 setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:@"VUIContentMetadataDisableSpeculativeLoading"];
    }
    id v20 = objc_loadWeakRetained(v1);
    id v21 = [v20 activePlayer];
    id v22 = [v21 playlist];
    uint64_t v23 = [v22 activeListIndex];

    id v24 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Adding post play item to playlist", buf, 2u);
    }
    id v25 = objc_loadWeakRetained(v1);
    id v26 = [v25 activePlayer];
    double v27 = [v26 playlist];
    [v27 insertItem:v16 atIndex:v23 + 1];
  }
  else
  {
    id v28 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, "Not adding post play item to playlist because its missing", buf, 2u);
    }
  }
  id v29 = objc_loadWeakRetained(v1);
  uint64_t v30 = [v29 avPlayerViewController];
  id v31 = [v30 contentOverlayView];
  uint64_t v32 = [v31 safeAreaLayoutGuide];

  id v33 = objc_loadWeakRetained(v1);
  id v34 = [v33 avPlayerViewController];
  id v75 = [v34 contentOverlayView];

  id v35 = objc_loadWeakRetained(v1);
  id v36 = [v35 postPlayView];

  int v37 = [v36 canAutoPlay];
  char v72 = v16;
  id v73 = v15;
  if (v37)
  {
    id v35 = objc_loadWeakRetained(v1);
    if (objc_msgSend(v35, "_allowedToAutoPlayForType:", objc_msgSend(v36, "type")))
    {

      goto LABEL_20;
    }
  }
  uint64_t v38 = +[VUIInterfaceFactory sharedInstance];
  id v39 = [v38 groupActivitiesManager];
  int v40 = [v39 isSessionActive];

  if (v37)
  {

    if ((v40 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v40)
  {
LABEL_20:
    id v41 = objc_loadWeakRetained(v1);
    id v42 = [v41 activePlayer];
    [v42 setMediaItemEndAction:1];
  }
LABEL_21:
  [v36 setAlpha:1.0];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v75 addSubview:v36];
  id v43 = objc_loadWeakRetained(v1);
  [v43 _addVideoDimmingViewForPostPlay];

  id v44 = objc_loadWeakRetained(v1);
  id v45 = [v44 avPlayerViewController];
  [v45 setPlaybackControlsIncludeTransportControls:0];

  id v46 = objc_loadWeakRetained(v1);
  id v47 = [v46 avPlayerViewController];
  id v48 = [v47 contentOverlayView];

  id v49 = [v36 trailingAnchor];
  uint64_t v50 = [v32 trailingAnchor];
  [v36 bounds];
  [v49 constraintEqualToAnchor:v50 constant:CGRectGetWidth(v84)];
  id v51 = v69 = v1;

  id v67 = (void *)MEMORY[0x1E4F28DC8];
  v82[0] = v51;
  long long v68 = [v36 bottomAnchor];
  long long v71 = v32;
  BOOL v52 = [v32 bottomAnchor];
  id v53 = [v68 constraintEqualToAnchor:v52 constant:-20.0];
  v82[1] = v53;
  id v54 = [v36 widthAnchor];
  long long v70 = v48;
  id v55 = [v48 traitCollection];
  int v56 = [v55 isAXEnabled];
  double v57 = 190.0;
  if (v56) {
    double v57 = 271.0;
  }
  id v58 = [v54 constraintEqualToConstant:v57];
  v82[2] = v58;
  id v59 = [v36 heightAnchor];
  unint64_t v60 = [v59 constraintEqualToConstant:186.0];
  v82[3] = v60;
  id v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
  [v67 activateConstraints:v61];

  [v36 setNeedsLayout];
  [v36 layoutIfNeeded];
  [v75 setNeedsLayout];
  id v62 = objc_loadWeakRetained(v69);
  [v62 setPostPlayTrailingConstraint:v51];

  id v63 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v63, OS_LOG_TYPE_DEFAULT, "Showing PostPlayView", buf, 2u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_910;
  block[3] = &unk_1E6DF7578;
  v80[1] = (id)0xC034000000000000;
  id v77 = v51;
  id v78 = v75;
  id v64 = v75;
  id v65 = v51;
  objc_copyWeak(v80, v69);
  id v79 = v36;
  id v66 = v36;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v80);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_910(uint64_t a1)
{
  [*(id *)(a1 + 32) setConstant:*(double *)(a1 + 64)];
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_911;
  v6[3] = &unk_1E6DF3D58;
  id v7 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_912;
  v3[3] = &unk_1E6DF5778;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 48);
  [v2 animateWithDuration:0 delay:v6 options:v3 animations:0.5 completion:0.0];

  objc_destroyWeak(&v5);
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_911(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_912(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = objc_msgSend(WeakRetained, "_allowedToAutoPlayForType:", objc_msgSend(*(id *)(a1 + 32), "type"));

  if (v4)
  {
    [*(id *)(a1 + 32) startAutoPlayTimer];
  }
  else
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 _resetAutoPlayBingeWatchingQualifications];
  }
  id v6 = objc_loadWeakRetained(v2);
  id v7 = [v6 activePlayer];
  double v8 = [v7 currentMediaItem];
  id v16 = [v8 mediaItemMetadataForProperty:@"VUIContentMetadataPostPlayItemMetrics"];

  if (v16)
  {
    id v9 = [v16 objectForKeyedSubscript:@"VUIContentMetadataPostPlayItemMetricsDialogDataKey"];
    if (v9)
    {
      id v10 = +[VUIMetricsController sharedInstance];
      [v10 recordDialog:v9];
    }
  }
  id v11 = objc_loadWeakRetained(v2);
  id v12 = (void *)MEMORY[0x1E4F28ED0];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v13 timeIntervalSince1970];
  unint64_t v15 = [v12 numberWithLong:(uint64_t)(v14 * 1000.0)];
  [v11 setPostPlayImpressionTime:v15];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_913(uint64_t a1, void *a2)
{
  id v26[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = +[VUIInterfaceFactory sharedInstance];
  int v4 = [v3 controllerPresenter];

  if (v4) {
    goto LABEL_3;
  }
  id v5 = +[VUITVAppLauncher sharedInstance];
  id v6 = [v5 appController];

  int v4 = [v6 navigationController];

  if (v4)
  {
LABEL_3:
    id v7 = [v2 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
    if ([v7 length])
    {
      double v8 = [VUIMediaEntityFetchRequest alloc];
      id v9 = (void *)MEMORY[0x1E4F1CAD0];
      id v10 = +[VUIMediaEntityType movie];
      v26[0] = v10;
      id v11 = +[VUIMediaEntityType episode];
      v26[1] = v11;
      id v12 = +[VUIMediaEntityType movieRental];
      v26[2] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
      double v14 = [v9 setWithArray:v13];
      unint64_t v15 = [(VUIMediaEntityFetchRequest *)v8 initWithMediaEntityTypes:v14];

      id v16 = VUIMediaEntityFetchRequestAllPropertiesSet();
      [(VUIMediaEntityFetchRequest *)v15 setProperties:v16];

      id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
      [(VUIMediaEntityFetchRequest *)v15 addAdamIdPredicate:v17];

      double v18 = +[VUIMediaLibraryManager defaultManager];
      int v19 = [v18 aggregateMediaLibrary];

      id v25 = v15;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_920;
      v22[3] = &unk_1E6DF7610;
      id v23 = v2;
      id v24 = v4;
      id v21 = (id)[v19 enqueueFetchRequests:v20 completionHandler:v22];
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_913_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
  {
    __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_913_cold_1();
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_920(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_921;
  block[3] = &unk_1E6DF45D8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_921(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = [v2 mediaEntities];
  id v4 = [v3 firstObject];

  id v5 = [v4 assetController];
  id v6 = sLogObject_5;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Preflighting download of %@", buf, 0xCu);
    }
    id v8 = +[VUIDownloadManager sharedInstance];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = [v5 contentAllowsCellularDownload];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_923;
    v12[3] = &unk_1E6DF75E8;
    id v13 = *(id *)(a1 + 40);
    id v14 = v5;
    [v8 preflightDownloadForTVPMediaItem:v9 presentingViewController:v10 contentAllowsCellularDownload:v11 completion:v12];
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
  {
    __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_921_cold_1();
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_923(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = sLogObject_5;
  BOOL v9 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v10;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Deleting existing download and starting new compatible download of %@", buf, 0xCu);
    }
    uint64_t v11 = *(void **)(a1 + 40);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_924;
    v31[3] = &unk_1E6DF75C0;
    id v32 = v11;
    [v32 deleteAndRedownloadAllowingCellular:a3 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:0 completion:v31];
    id v12 = v32;
LABEL_16:

    return;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Downloading compatible video was not allowed", buf, 2u);
  }
  id v13 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v14 = [v13 networkType];

  if (!v14)
  {
    char v15 = MGGetBoolAnswer();
    uint64_t v16 = +[VUILocalizationManager sharedInstance];
    uint64_t v17 = v16;
    if (v15)
    {
      id v12 = [v16 localizedStringForKey:@"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_TITLE"];

      double v18 = +[VUILocalizationManager sharedInstance];
      int v19 = v18;
      id v20 = @"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_MESSAGE";
    }
    else
    {
      id v12 = [v16 localizedStringForKey:@"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_TITLE"];

      double v18 = +[VUILocalizationManager sharedInstance];
      int v19 = v18;
      id v20 = @"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_MESSAGE";
    }
    id v21 = [v18 localizedStringForKey:v20];

    id v22 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v21 preferredStyle:1];
    id v23 = (void *)MEMORY[0x1E4FB1410];
    id v24 = +[VUILocalizationManager sharedInstance];
    id v25 = [v24 localizedStringForKey:@"OK"];
    id v26 = [v23 actionWithTitle:v25 style:0 handler:0];

    [v22 addAction:v26];
    double v27 = +[VUIApplicationRouter topPresentedViewController];
    if (v27) {
      goto LABEL_19;
    }
    id v28 = +[VUITVAppLauncher sharedInstance];
    id v29 = [v28 appWindow];

    double v27 = [v29 rootViewController];

    if (v27)
    {
LABEL_19:
      uint64_t v30 = [v27 presentedViewController];

      if (!v30) {
        [v27 presentViewController:v22 animated:1 completion:0];
      }
    }

    goto LABEL_16;
  }
}

VUIMultiviewPlaybackInfo *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_949(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [VUIPlayer alloc];
  id v5 = NSString;
  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained multiviewPlaybackInfo];
  BOOL v9 = objc_msgSend(v5, "stringWithFormat:", @"Multiview Player (%ld)", objc_msgSend(v8, "count") + 1);
  uint64_t v10 = [(VUIPlayer *)v4 initWithName:v9];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [(TVPPlayer *)v10 setReportingCategory:@"multiview"];
  [(TVPPlayer *)v10 setReportingValueWithString:@"multiview" forKey:@"initiator"];
  [(TVPPlayer *)v10 setErrorBehavior:2];
  uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v11 BOOLForKey:@"RepeatMovieForever"])
  {

LABEL_4:
    [v3 setRepeatMode:2];
    goto LABEL_5;
  }
  id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v13 = [v12 BOOLForKey:@"RepeatOneForAllMedia"];

  if (v13) {
    goto LABEL_4;
  }
LABEL_5:
  id v14 = objc_loadWeakRetained(v6);
  char v15 = [v14 createPlayerViewController];

  [v15 setShowsPlaybackControls:0];
  [v15 setCanPausePlaybackWhenExitingFullScreen:0];
  uint64_t v16 = [v3 currentMediaItem];
  uint64_t v17 = [v16 mediaItemMetadataForProperty:@"VUIContentMetadataBroadcastLocale"];
  double v18 = [v16 mediaItemMetadataForProperty:@"VUIContentMetadataPlaysFromStartOfLiveStream"];
  uint64_t v19 = [v18 BOOLValue];

  id v20 = [[VUIMultiviewPlaybackInfo alloc] initWithPlayer:v10 playerViewController:v15 playsFromStart:v19 broadcastLocale:v17 livePostPlayController:0];
  uint64_t v30 = v3;
  [(TVPPlayer *)v10 setPlaylist:v3];
  id v21 = objc_loadWeakRetained(v6);
  id v22 = [v21 multiviewPlaybackInfo];
  uint64_t v23 = [v22 count];
  BOOL v24 = v23 != 0;
  BOOL v25 = v23 == 0;

  [v15 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:4 * v25];
  [(TVPPlayer *)v10 setMuted:v24];
  id v26 = [v15 playerController];
  [v26 setAllowsAudioPlayback:v25];

  [(TVPPlayer *)v10 setAllowsExternalPlayback:v25];
  [v15 setUpdatesNowPlayingInfoCenter:v25];
  id v27 = objc_loadWeakRetained(v6);
  int v28 = [v27 _audioContainsAirPlayRoute];

  if (v28 && v24)
  {
    [(TVPPlayer *)v10 pause];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_955;
    v31[3] = &unk_1E6DF3F68;
    id v32 = v20;
    id v33 = v10;
    [(VUIMultiviewPlaybackInfo *)v32 waitForExternalPlaybackToBecomeType:1 forPlayer:v33 completion:v31];
  }
  else
  {
    [(TVPPlayer *)v10 play];
  }

  return v20;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_955(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_956;
  v3[3] = &unk_1E6DF3D58;
  id v4 = v1;
  [v2 waitForExternalPlaybackToBecomeType:0 forPlayer:v4 completion:v3];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_956(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_958(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_959;
  v14[3] = &unk_1E6DF7688;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  id v11 = v7;
  id v15 = v11;
  id v17 = *(id *)(a1 + 40);
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v18 = v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, void, uint64_t, void *))(v10 + 16))(v10, 1, 1, 0, 1, 0, 1, v14);

  objc_destroyWeak(&v19);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_959(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _registerBroadcastEndHandler];

  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v9 = objc_loadWeakRetained(v1);
        uint64_t v10 = [v9 multiviewPlaybackInfo];
        [v10 addObject:v8];

        id v11 = [v8 playerViewController];
        [v3 addObject:v11];

        id v12 = [v8 player];

        if (v12)
        {
          id v13 = +[VUIInterfaceFactory sharedInstance];
          id v14 = [v13 playbackEndManager];
          id v15 = [v8 player];
          [v14 monitor:v15];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v5);
  }

  id v16 = objc_loadWeakRetained(v1);
  [v16 _updateMultiviewReportingMetrics];

  id v17 = +[VUIInterfaceFactory sharedInstance];
  id v18 = [v17 documentCreator];
  id v19 = [v18 playbackContainerViewController];

  id v20 = objc_loadWeakRetained(v1);
  [v19 setDelegate:v20];

  id v21 = [v19 view];
  id v22 = [MEMORY[0x1E4FB1618] clearColor];
  [v21 setBackgroundColor:v22];

  id v23 = objc_loadWeakRetained(v1);
  [v23 setPlaybackContainerViewController:v19];

  id v24 = objc_loadWeakRetained(v1);
  BOOL v25 = [v24 multiviewPlaybackInfo];
  id v26 = [v25 firstObject];
  id v27 = [v26 player];
  [v24 setActivePlayer:v27];

  id v28 = objc_loadWeakRetained(v1);
  [v28 configureAudioSessionForBackgroundPlayback:0 usingPlaybackCategory:0 isMultiview:1];

  id v29 = +[VUIPlaybackTabManager sharedInstance];
  id v30 = objc_loadWeakRetained(v1);
  id v31 = [v30 multiviewIdentifiers];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  void v35[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_960;
  void v35[3] = &unk_1E6DF7660;
  objc_copyWeak(&v41, v1);
  id v32 = v3;
  id v36 = v32;
  id v37 = *(id *)(a1 + 32);
  id v38 = *(id *)(a1 + 40);
  id v33 = v19;
  id v39 = v33;
  id v40 = *(id *)(a1 + 56);
  [v29 updatePlayerTabsExcludingCanonicals:v31 completion:v35];

  objc_destroyWeak(&v41);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_960(uint64_t a1)
{
  id v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setActivePlayer:0];

  id v4 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v5 = [v4 documentCreator];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v7 = [v5 createMultiPlayerViewControllerWithPlayerViewControllers:v6 showingDetails:0];

  id v8 = objc_loadWeakRetained(v2);
  [v7 setDelegate:v8];

  id v9 = objc_loadWeakRetained(v2);
  uint64_t v10 = [v9 playbackContainerViewController];
  [v10 embedMultiPlayerViewController:v7];

  id v11 = objc_loadWeakRetained(v2);
  [v11 setMultiPlayerViewController:v7];

  id v12 = [*(id *)(a1 + 40) firstObject];
  id v13 = [v12 currentMediaItem];

  id v14 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E08]];
  id v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    id v17 = [MEMORY[0x1E4FB3D58] sharedInstance];
    id v18 = (void *)[v16 initWithObject:v15 imageLoader:v17 groupType:0];

    [v7 setBackgroundImageProxy:v18];
  }
  id v19 = *(void **)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_964;
  v21[3] = &unk_1E6DF3DD0;
  id v22 = *(id *)(a1 + 64);
  [v19 presentViewController:v20 animated:1 completion:v21];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_964(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v56 = a4;
  uint64_t v60 = a1;
  id location = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _registerBroadcastEndHandler];
  id v8 = [WeakRetained mainAVPlayerViewController];
  [v8 setShowsPlaybackControls:0];
  [v8 setCanPausePlaybackWhenExitingFullScreen:0];
  [v8 setCanStartPictureInPictureAutomaticallyFromInline:1];
  id v59 = v8;
  [v8 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:4];
  id v9 = [WeakRetained currentMediaItem];
  uint64_t v10 = [v9 mediaItemMetadataForProperty:@"VUIContentMetadataBroadcastLocale"];
  id v58 = v9;
  id v11 = [v9 mediaItemMetadataForProperty:@"VUIContentMetadataPlaysFromStartOfLiveStream"];
  uint64_t v12 = [v11 BOOLValue];

  id v13 = [VUIMultiviewPlaybackInfo alloc];
  id v14 = [WeakRetained mainPlayer];
  id v15 = [WeakRetained mainAVPlayerViewController];
  id v16 = [WeakRetained mainLivePostPlayController];
  id v55 = (void *)v10;
  id v17 = [(VUIMultiviewPlaybackInfo *)v13 initWithPlayer:v14 playerViewController:v15 playsFromStart:v12 broadcastLocale:v10 livePostPlayController:v16];

  [(VUIMultiviewPlaybackInfo *)v17 setContext:1];
  id v62 = WeakRetained;
  id v18 = [WeakRetained multiviewPlaybackInfo];
  [v18 addObject:v17];

  id v19 = [(VUIMultiviewPlaybackInfo *)v17 player];

  if (v19)
  {
    uint64_t v20 = +[VUIInterfaceFactory sharedInstance];
    id v21 = [v20 playbackEndManager];
    id v22 = [(VUIMultiviewPlaybackInfo *)v17 player];
    [v21 monitor:v22];
  }
  objc_msgSend(WeakRetained, "_updateMultiviewReportingMetrics", location);
  [WeakRetained setActivePlayer:0];
  [WeakRetained setMainPlayer:0];
  [WeakRetained setMainAVPlayerViewController:0];
  [WeakRetained setAvPlayerViewController:0];
  [WeakRetained setMainLivePostPlayController:0];
  id v61 = [MEMORY[0x1E4F1CA48] arrayWithObject:v59];
  double v57 = v6;
  if (v6)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v23 = v6;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v68 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = (*(void (**)(void))(*(void *)(v60 + 32) + 16))();
          id v29 = [v62 multiviewPlaybackInfo];
          [v29 addObject:v28];

          id v30 = [v28 playerViewController];
          [v61 addObject:v30];

          id v31 = [(VUIMultiviewPlaybackInfo *)v17 player];

          if (v31)
          {
            id v32 = +[VUIInterfaceFactory sharedInstance];
            id v33 = [v32 playbackEndManager];
            uint64_t v34 = [(VUIMultiviewPlaybackInfo *)v17 player];
            [v33 monitor:v34];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v25);
    }

    id v35 = objc_loadWeakRetained(locationa);
    [v35 _updateMultiviewReportingMetrics];
  }
  id v36 = +[VUIInterfaceFactory sharedInstance];
  id v37 = [v36 documentCreator];
  id v38 = (void *)[v61 copy];
  id v39 = [v37 createMultiPlayerViewControllerWithPlayerViewControllers:v38 showingDetails:a2];

  [v39 setDelegate:v62];
  if (a2) {
    [v39 setDetailsViewControllerVisible:1 animated:0 completion:0];
  }
  id v40 = [v62 playbackContainerViewController];
  [v40 embedMultiPlayerViewController:v39];

  [v62 setMultiPlayerViewController:v39];
  id v41 = [v58 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E08]];
  long long v42 = [MEMORY[0x1E4F1CB10] URLWithString:v41];
  if (v42)
  {
    id v43 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    long long v44 = [MEMORY[0x1E4FB3D58] sharedInstance];
    long long v45 = (void *)[v43 initWithObject:v42 imageLoader:v44 groupType:0];

    [v39 setBackgroundImageProxy:v45];
  }
  [v62 configureAudioSessionForBackgroundPlayback:0 usingPlaybackCategory:0 isMultiview:1];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v46 = [v62 multiviewPlaybackInfo];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(v46);
        }
        id v51 = [*(id *)(*((void *)&v63 + 1) + 8 * j) player];
        [v51 setReportingCategory:@"multiview"];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v48);
  }

  if (v56) {
    v56[2](v56);
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_msgSend(WeakRetained, "multiviewPlaybackInfo", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v10 playerViewController];

        uint64_t v12 = [v10 player];
        id v13 = v12;
        if (v11 == v3)
        {
          [v12 setReportingCategory:@"fullscreen"];
LABEL_13:

          continue;
        }
        id v14 = [v12 state];
        [v10 setBackgroundPlayerState:v14];

        if ([v10 isAtLiveEdge])
        {
          [v10 setResumeDate:0];
        }
        else
        {
          id v15 = [v10 player];
          id v16 = [v15 playbackDate];
          [v10 setResumeDate:v16];
        }
        if ([v10 context] != 3)
        {
          id v13 = [v10 player];
          [v13 stop];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v6 = [WeakRetained multiviewPlaybackInfo];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v26 = v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "playerViewController", v26);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 != v3)
        {
          id v13 = [v11 resumeDate];

          id v14 = [v11 player];
          id v15 = v14;
          if (v13)
          {
            id v16 = [v11 resumeDate];
            [v15 setPlaybackDate:v16];
          }
          else
          {
            long long v17 = [v14 currentMediaItem];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v17 setIgnoreStartOverParam:1];
            }
            id v15 = v17;
          }

          long long v18 = [v11 player];
          objc_msgSend(v18, "setAllowsExternalPlayback:", objc_msgSend(v11, "context") == 1);

          long long v19 = [v11 backgroundPlayerState];
          long long v20 = [MEMORY[0x1E4FA9D88] paused];

          if (v19 == v20)
          {
            uint64_t v24 = [v11 player];
            [v24 pause];
          }
          else
          {
            id v21 = objc_loadWeakRetained(v4);
            int v22 = [v21 _audioContainsAirPlayRoute];

            id v23 = [v11 player];
            uint64_t v24 = v23;
            if (v22)
            {
              [v23 pause];

              uint64_t v24 = [v11 player];
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v28[0] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11;
              v28[1] = &unk_1E6DF3D58;
              v28[2] = v11;
              [v11 waitForExternalPlaybackToBecomeType:1 forPlayer:v24 completion:v27];
            }
            else
            {
              [v23 play];
            }
          }
        }
        [v11 setPausedDueToInterruption:0];
        uint64_t v25 = [v11 player];
        [v25 setReportingCategory:@"multiview"];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 player];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12;
  v4[3] = &unk_1E6DF3D58;
  void v4[4] = *(void *)(a1 + 32);
  [v2 waitForExternalPlaybackToBecomeType:0 forPlayer:v3 completion:v4];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) player];
  [v1 play];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"AnimatedKey"];
  char v12 = [v11 BOOLValue];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14;
  v18[3] = &unk_1E6DF7728;
  id v13 = *(id *)(a1 + 32);
  char v23 = v12;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v16 executeBlockAfterCurrentStateTransition:v18];

  return @"Returning post play PiP to fullscreen with playback UI";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15;
  v4[3] = &unk_1E6DF45D8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Present playlist" withContext:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17;
  v17[3] = &unk_1E6DF7750;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  id v21 = *(id *)(a1 + 32);
  id v13 = v9;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  [v13 executeBlockAfterCurrentStateTransition:v17];

  objc_destroyWeak(&v22);
  return @"Returning post play PiP to fullscreen without playback UI";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v3 = [WeakRetained _isNewPostPlayEnabled];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18;
    v8[3] = &unk_1E6DF45D8;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v8);
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    [v5 postEvent:@"Present playlist" withContext:v6 userInfo:v7];
  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Present playlist" withContext:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v190 = a2;
  id v176 = a3;
  id v177 = a4;
  id v9 = a5;
  v195 = [v9 objectForKey:@"PlaylistKey"];
  v189 = [v9 objectForKey:@"PresentingViewControllerKey"];
  id v10 = [v9 objectForKey:@"DismissalOperationKey"];
  uint64_t v175 = [v10 integerValue];

  id v11 = [v9 objectForKey:@"AnimatedKey"];
  char v174 = [v11 BOOLValue];

  id v12 = [v9 objectForKey:@"AllowCellularUsageKey"];
  unsigned int v185 = [v12 BOOLValue];

  id v182 = [v9 objectForKey:@"CompletionKey"];
  v193 = [v9 objectForKey:@"ExtrasDictionaryKey"];
  id v194 = [v190 currentState];
  v191 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchId[0]];
  v184 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchURL[0]];
  id v13 = +[VUIInterfaceFactory sharedInstance];
  id v14 = [v13 groupActivitiesManager];
  int v15 = [v14 isSharedWatchIdValidForCurrentSession:v191];

  id v16 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v18 = [WeakRetained isPlaylistBeingPresented:v195];

  if (v15)
  {
    id v19 = +[VUIPlaybackManager sharedInstance];
    id v192 = [v19 activePlayer];

    [v192 duration];
    double v21 = v20;
    double v22 = *MEMORY[0x1E4FA9DC0];
    if ([v194 isEqualToString:@"Showing video full screen"])
    {
      if (!v18) {
        goto LABEL_4;
      }
    }
    else if (([v194 isEqualToString:@"Showing main video picture in picture"] & v18 & 1) == 0)
    {
LABEL_4:
      if (([v194 isEqualToString:@"Showing multiview playback fullscreen"] & 1) == 0
        && ([v194 isEqualToString:@"Showing multiview playback fullscreen in PIP"] & 1) == 0
        && ![v194 isEqualToString:@"Showing multiview playback fullscreen due to small screen size"])
      {
        if ([v194 isEqualToString:@"Showing multiview playback"])
        {
          long long v209 = 0u;
          long long v210 = 0u;
          long long v207 = 0u;
          long long v208 = 0u;
          id v144 = objc_loadWeakRetained((id *)(a1 + 72));
          id obja = [v144 multiviewPlaybackInfo];

          uint64_t v145 = [obja countByEnumeratingWithState:&v207 objects:v213 count:16];
          if (v145)
          {
            uint64_t v146 = *(void *)v208;
            while (2)
            {
              for (uint64_t i = 0; i != v145; ++i)
              {
                if (*(void *)v208 != v146) {
                  objc_enumerationMutation(obja);
                }
                v148 = *(void **)(*((void *)&v207 + 1) + 8 * i);
                id v149 = [v148 player];
                v150 = [v149 playlist];
                int v151 = [v150 isEqualToPlaylist:v195];

                if (v151)
                {
                  id v152 = [v148 player];
                  uint64_t v153 = [v148 playerViewController];
                  id v154 = (void *)v153;
                  if (v152)
                  {
                    if (v153)
                    {
                      [v152 duration];
                      if (v155 == v22)
                      {
                        v162 = sLogObject_5;
                        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1E2BD7000, v162, OS_LOG_TYPE_DEFAULT, "Current playlist is already playing multiview and is live, bringing fullscreen and reusing for SharePlay", buf, 2u);
                        }
                        v163 = +[VUIInterfaceFactory sharedInstance];
                        id v164 = [v163 groupActivitiesManager];
                        [v164 playerDidStart:v152];

                        id v165 = objc_loadWeakRetained(v16);
                        id v166 = [v165 multiPlayerViewController];
                        [v166 enterFullscreenWithPlayerViewController:v154 completion:0];

                        id v167 = objc_loadWeakRetained(v16);
                        id v168 = [v167 multiPlayerViewController];
                        [v168 setFullscreenGesturesEnabled:0];

                        id v33 = v194;
                        goto LABEL_92;
                      }
                    }
                  }
                }
              }
              uint64_t v145 = [obja countByEnumeratingWithState:&v207 objects:v213 count:16];
              if (v145) {
                continue;
              }
              break;
            }
          }
        }
        goto LABEL_25;
      }
      if (v21 == v22) {
        int v23 = v18;
      }
      else {
        int v23 = 0;
      }
      uint64_t v24 = sLogObject_5;
      BOOL v25 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
      if (v23 == 1)
      {
        if (v25)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Current playlist is already playing fullscreen in multiview and is live, reusing for SharePlay", buf, 2u);
        }
        uint64_t v26 = +[VUIInterfaceFactory sharedInstance];
        id v27 = [v26 groupActivitiesManager];
        [v27 playerDidStart:v192];

        id v28 = objc_loadWeakRetained(v16);
        long long v29 = [v28 multiPlayerViewController];
        [v29 setFullscreenGesturesEnabled:0];

LABEL_19:
        id v33 = v194;
        goto LABEL_92;
      }
      if (!v25) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      uint64_t v34 = "Current playlist is already playing fullscreen in multiview but not live, not reusing for SharePlay";
LABEL_24:
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v24 = sLogObject_5;
    BOOL v30 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    if (v21 == v22)
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Current playlist is already playing fullscreen and is live, reusing for SharePlay", buf, 2u);
      }
      long long v31 = +[VUIInterfaceFactory sharedInstance];
      long long v32 = [v31 groupActivitiesManager];
      [v32 playerDidStart:v192];

      goto LABEL_19;
    }
    if (!v30) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    uint64_t v34 = "Current playlist is not not live, not reusing for SharePlay";
    goto LABEL_24;
  }
LABEL_26:
  if ([v194 isEqualToString:@"Showing video full screen"])
  {
    id v35 = objc_loadWeakRetained((id *)(a1 + 72));
    id v36 = [v35 extrasPresenter];
    BOOL v37 = v36 == 0;

    double v38 = 1.0;
    if (!v37)
    {
      id v39 = objc_loadWeakRetained((id *)(a1 + 72));
      id v40 = [v39 extrasPresenter];
      [v40 dismissExtrasAnimated:0 completion:0];
    }
    goto LABEL_29;
  }
  if ([v194 isEqualToString:@"Showing Extras content"])
  {
    id v42 = objc_loadWeakRetained((id *)(a1 + 72));
    id v43 = [v42 extrasPresenter];
    [v43 dismissExtrasAnimated:0 completion:0];

    goto LABEL_39;
  }
  if ([v194 isEqualToString:@"Showing video full screen with post play content on screen"])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_39;
  }
  if ([v194 isEqualToString:@"Returning post play PiP to fullscreen with playback UI"])
  {
    id v44 = objc_loadWeakRetained((id *)(a1 + 72));
    long long v45 = [v44 mainPlayer];
    id v46 = [v45 state];
    uint64_t v47 = [MEMORY[0x1E4FA9D88] playing];
    BOOL v48 = v46 == v47;

    if (!v48) {
      goto LABEL_39;
    }
  }
  else
  {
    if (![v194 isEqualToString:@"Returning post play PiP to fullscreen without playback UI"])
    {
      double v38 = 1.0;
      if (([v194 isEqualToString:@"Waiting for AVPlayerViewController presentation to complete"] & 1) == 0
        && ([v194 isEqualToString:@"Waiting for AVPlayerViewController presentation to complete to dismiss"] & 1) == 0)
      {
        if (([v194 isEqualToString:@"Showing multiview playback fullscreen"] & 1) != 0
          || ([v194 isEqualToString:@"Showing multiview playback fullscreen in PIP"] & 1) != 0
          || [v194 isEqualToString:@"Showing multiview playback fullscreen due to small screen size"])
        {
          id v156 = objc_loadWeakRetained((id *)(a1 + 72));
          v157 = [v156 multiPlayerViewController];
          [v157 setFullscreenGesturesEnabled:0];

          id v158 = objc_loadWeakRetained((id *)(a1 + 72));
          id v159 = [v158 playbackContainerViewController];
          id v160 = (id)[v159 unembedMultiPlayerViewController];

          id v161 = objc_loadWeakRetained((id *)(a1 + 72));
          [v161 setMultiPlayerViewController:0];
        }
        else
        {
          if (![v194 isEqualToString:@"Showing long loading dialog"])
          {
            int v41 = 0;
            goto LABEL_40;
          }
          id v169 = objc_loadWeakRetained((id *)(a1 + 72));
          [v169 setSavedErrorContext:0];

          id v170 = objc_loadWeakRetained((id *)(a1 + 72));
          [v170 setSavedErrorUserInfo:0];

          id v171 = objc_loadWeakRetained((id *)(a1 + 72));
          id v172 = [v171 longLoadingAlertController];
          v173 = [v172 presentingViewController];
          [v173 dismissViewControllerAnimated:0 completion:0];
        }
      }
      goto LABEL_29;
    }
    id v52 = objc_loadWeakRetained((id *)(a1 + 72));
    id v53 = [v52 mainPlayer];
    id v54 = [v53 state];
    id v55 = [MEMORY[0x1E4FA9D88] playing];
    BOOL v56 = v54 == v55;

    if (!v56)
    {
LABEL_39:
      int v41 = 1;
      double v38 = 1.0;
      goto LABEL_40;
    }
  }
  id v49 = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v50 = [v49 mainPlayer];
  [v50 rate];
  double v38 = v51;

LABEL_29:
  int v41 = 1;
LABEL_40:
  if ([v194 isEqualToString:@"Showing error message without playback UI"])
  {
    id v57 = objc_loadWeakRetained((id *)(a1 + 72));
    id v58 = [v57 errorAlertController];
    BOOL v59 = v58 == 0;

    if (!v59)
    {
      id v60 = objc_loadWeakRetained((id *)(a1 + 72));
      id v61 = [v60 errorAlertController];
      id v62 = [v61 presentingViewController];
      BOOL v63 = v62 == 0;

      if (!v63)
      {
        long long v64 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v64, OS_LOG_TYPE_DEFAULT, "Dismissing error alert controller", buf, 2u);
        }
        id v65 = objc_loadWeakRetained((id *)(a1 + 72));
        long long v66 = [v65 errorAlertController];
        [v66 dismissViewControllerAnimated:0 completion:0];
      }
      id v67 = objc_loadWeakRetained((id *)(a1 + 72));
      [v67 setErrorAlertController:0];
    }
  }
  if (!v41) {
    goto LABEL_56;
  }
  id v68 = objc_loadWeakRetained((id *)(a1 + 72));
  long long v69 = [v68 avPlayerViewController];
  long long v70 = [v69 presentingViewController];
  if (!v70)
  {
    char v71 = [v194 isEqualToString:@"Waiting for AVPlayerViewController presentation to complete"];

    if (v71) {
      goto LABEL_51;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR)) {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_cold_1();
    }
LABEL_56:
    int v183 = 0;
    goto LABEL_57;
  }

LABEL_51:
  char v72 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v72, OS_LOG_TYPE_DEFAULT, "Will reuse existing presented AVPlayerViewController", buf, 2u);
  }
  int v183 = 1;
LABEL_57:
  id v73 = objc_loadWeakRetained((id *)(a1 + 72));
  id v74 = [v73 activePlayer];
  id v192 = [v74 preferredAudioLanguageCode];

  id v75 = objc_loadWeakRetained((id *)(a1 + 72));
  id obj = [v75 _getLivePostPlayPrefetchPlayerIfApplicable:v195];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (obj)
  {
    +[VUIPlaybackUtilities updateReportingForStartOfPreloadedPlayer:](VUIPlaybackUtilities, "updateReportingForStartOfPreloadedPlayer:");
    [obj setElapsedTime:1 precise:*MEMORY[0x1E4FA9DD0]];
    uint64_t v76 = (VUIPlayer *)obj;
    id v77 = objc_loadWeakRetained((id *)(a1 + 72));
    id v78 = [v77 avPlayerViewController];
    id v79 = [(TVPPlayer *)v76 avPlayer];
    [v78 setPlayer:v79];
  }
  else
  {
    uint64_t v76 = [[VUIPlayer alloc] initWithName:@"Main player"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [(TVPPlayer *)v76 setReportingCategory:@"fullscreen"];
  [(TVPPlayer *)v76 setErrorBehavior:2];
  [(TVPPlayer *)v76 setAllowsCellularUsage:v185];
  [(TVPPlayer *)v76 setRateUsedForPlayback:v38];
  v181 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoPlaybackContext[0]];
  int v80 = [v195 currentMediaItem];
  id v178 = [v80 mediaItemMetadataForProperty:@"VUIMediaItemMetadataPreferredAudioLanguageCode"];

  if ((unint64_t)([v181 integerValue] - 9) > 1)
  {
    if (![v178 length]) {
      goto LABEL_68;
    }
    id v81 = sLogObject_5;
    BOOL v86 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    BOOL v83 = v178;
    if (v86)
    {
      *(_DWORD *)buf = 138412290;
      CGRect v84 = v178;
      v212 = v178;
      char v85 = "Using preferred audio language: %@";
      goto LABEL_66;
    }
  }
  else
  {
    id v81 = sLogObject_5;
    BOOL v82 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    BOOL v83 = v192;
    if (v82)
    {
      *(_DWORD *)buf = 138412290;
      CGRect v84 = v192;
      v212 = v192;
      char v85 = "Playback context is post play next episode, setting main player's preferred audio language code to value fro"
            "m previous player: %@";
LABEL_66:
      _os_log_impl(&dword_1E2BD7000, v81, OS_LOG_TYPE_DEFAULT, v85, buf, 0xCu);
      BOOL v83 = v84;
    }
  }
  [(TVPPlayer *)v76 setPreferredAudioLanguageCode:v83];
LABEL_68:
  id v180 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoIsEligibleForPlayerTabs[0]];
  id v87 = [v195 currentMediaItem];
  [v87 setMediaItemMetadata:v180 forProperty:@"VUIMediaItemMetadataIsEligibleForPlayerTabs"];

  id v88 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v88 BOOLForKey:@"RepeatMovieForever"])
  {
  }
  else
  {
    id v89 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v90 = [v89 BOOLForKey:@"RepeatOneForAllMedia"];

    if (!v90) {
      goto LABEL_72;
    }
  }
  [v195 setRepeatMode:2];
LABEL_72:
  [(TVPPlayer *)v76 setPlaylist:v195];
  id v91 = objc_loadWeakRetained((id *)(a1 + 72));
  [v91 setMainPlayer:v76];

  BOOL v92 = +[VUIInterfaceFactory sharedInstance];
  id v93 = [v92 groupActivitiesManager];
  [v93 playerDidStart:v76];

  v179 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchMetadata[0]];
  id v94 = objc_loadWeakRetained((id *)(a1 + 72));
  id v95 = [v195 currentMediaItem];
  [v94 _updateActivityItemsConfigurationWithSharedWatchId:v191 sharedWatchUrl:v184 previewMetadata:v179 mediaItem:v95];

  id v96 = objc_loadWeakRetained((id *)(a1 + 72));
  [v96 setPresentingViewController:v189];

  id v97 = objc_loadWeakRetained((id *)(a1 + 72));
  [v97 setDismissalOperation:v175];

  if (v193)
  {
    v186 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v98 = *(void *)(a1 + 64);
    id v99 = [v195 currentMediaItem];
    v186 = (*(void (**)(uint64_t, void *))(v98 + 16))(v98, v99);
  }
  id v100 = objc_loadWeakRetained(v16);
  [v186 setDelegate:v100];

  id v101 = objc_loadWeakRetained(v16);
  [v101 setExtrasContext:v186];

  id v102 = objc_loadWeakRetained(v16);
  id v103 = objc_opt_new();
  [v102 setLogoImageDownloader:v103];

  id v104 = objc_opt_new();
  [v104 setPlayer:v76];
  id v105 = objc_loadWeakRetained(v16);
  [v104 setDelegate:v105];

  id v106 = objc_loadWeakRetained(v16);
  [v106 setFeatureMonitor:v104];

  id v107 = +[VUIPlaybackTabManager sharedInstance];
  id v108 = objc_loadWeakRetained(v16);
  [v107 setDelegate:v108];

  id v109 = objc_loadWeakRetained(v16);
  [v109 setPIPedBackgroundMediaController:0];

  id v110 = objc_loadWeakRetained(v16);
  [v110 _addPlayerToTimedMetadataManager:v76];

  id v111 = objc_loadWeakRetained(v16);
  id v112 = [v111 timedMetadataDebuggerViewController];
  [v112 observeCurrentVendor];

  int v113 = @"fullscreen";
  [(TVPPlayer *)v76 setReportingValueWithString:v113 forKey:@"initiator"];
  id v114 = objc_loadWeakRetained(v16);
  v115 = [v114 avPlayerViewController];

  if (!v115)
  {
    id v116 = objc_loadWeakRetained(v16);
    v115 = [v116 createPlayerViewController];

    id v117 = objc_loadWeakRetained(v16);
    [v117 setAvPlayerViewController:v115];

    id v118 = objc_loadWeakRetained(v16);
    [v118 setMainAVPlayerViewController:v115];

    if ((v183 & 1) == 0)
    {
      id v119 = objc_loadWeakRetained(v16);
      int v120 = [v119 _shouldShowTimedMetadataDebugger];

      if (v120)
      {
        id v121 = objc_loadWeakRetained(v16);
        [v121 _addTimedMetadataDebuggerView];
      }
      id v122 = objc_loadWeakRetained(v16);
      int v123 = [v122 _shouldShowPerformanceDebugger];

      if (v123)
      {
        id v124 = objc_loadWeakRetained(v16);
        [v124 _addPerformanceDebuggerView];
      }
    }
  }
  id v125 = objc_loadWeakRetained(v16);
  long long v126 = [v195 currentMediaItem];
  [v125 _donateUserActivityForMediaItem:v126];

  id v127 = objc_loadWeakRetained(v16);
  [v127 _updateRequiresLinearPlayback];

  id v128 = objc_loadWeakRetained(v16);
  v129 = [v128 mainLivePostPlayController];
  BOOL v130 = v129 == 0;

  if (!v130)
  {
    id v131 = objc_loadWeakRetained(v16);
    v132 = [v131 mainLivePostPlayController];
    [v132 cleanup];

    id v133 = objc_loadWeakRetained(v16);
    [v133 setMainLivePostPlayController:0];
  }
  if (_os_feature_enabled_impl())
  {
    v134 = +[VUIInterfaceFactory sharedInstance];
    id v135 = [v134 documentCreator];

    v136 = [v115 view];
    v137 = [v135 initializeLivePostPlayControllerWithPlayer:v76 playerViewController:v115 presentationView:v136];

    id v138 = objc_loadWeakRetained(v16);
    [v138 setMainLivePostPlayController:v137];
  }
  id v139 = objc_loadWeakRetained(v16);
  id v140 = [v139 stateMachine];
  v205[0] = MEMORY[0x1E4F143A8];
  v205[1] = 3221225472;
  v205[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_975;
  v205[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v206, v16);
  [v140 executeBlockAfterCurrentStateTransition:v205];

  if (v183)
  {
    v203[0] = MEMORY[0x1E4F143A8];
    v203[1] = 3221225472;
    v203[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_984;
    v203[3] = &unk_1E6DF4A30;
    v141 = &v204;
    objc_copyWeak(&v204, v16);
    [v190 executeBlockAfterCurrentStateTransition:v203];
    if (([v194 isEqualToString:@"Waiting for AVPlayerViewController presentation to complete"] & 1) == 0)
    {
      if (![v194 isEqualToString:@"Waiting for AVPlayerViewController presentation to complete to dismiss"])
      {
        if ([v194 isEqualToString:@"Returning post play PiP to fullscreen without playback UI"])id v33 = @"Waiting for playback to start to return to fullscreen"; {
        else
        }
          id v33 = @"Showing video full screen";
        goto LABEL_91;
      }
      id v142 = objc_loadWeakRetained(v16);
      [v142 performSelector:sel__avPlayerViewControllerPresentationDidTimeout withObject:0 afterDelay:5.0];
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_985;
    block[3] = &unk_1E6DF7778;
    v141 = &v200;
    objc_copyWeak(&v200, v16);
    id v199 = v182;
    BOOL v201 = v193 != 0;
    id v197 = v189;
    id v198 = v115;
    char v202 = v174;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  id v33 = @"Waiting for AVPlayerViewController presentation to complete";
LABEL_91:
  objc_destroyWeak(v141);
  objc_destroyWeak(&v206);

LABEL_92:
  return v33;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_975(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained mainPlayer];
  uint64_t v4 = [v3 currentMediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v5 addEndEventWithName:*MEMORY[0x1E4FAA388]];

  id v6 = objc_loadWeakRetained(v1);
  uint64_t v7 = [v6 mainPlayer];
  [v6 setActivePlayer:v7];

  id v8 = +[VUIInterfaceFactory sharedInstance];
  id v9 = [v8 groupActivitiesManager];
  LODWORD(v4) = [v9 isSessionActive];

  if (v4)
  {
    id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v11 = [v10 objectForKey:*MEMORY[0x1E4FB3DA8]];

    if (!v11 || (objc_opt_respondsToSelector() & 1) == 0 || ([v11 BOOLValue] & 1) != 0) {
      goto LABEL_10;
    }
    int v12 = [v11 BOOLValue];
    id v13 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = @"paused";
      if (v12) {
        id v14 = @"playing";
      }
      *(_DWORD *)buf = 138412290;
      double v22 = v14;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Overriding initial playback state to %@ per user default", buf, 0xCu);
    }
    if (!v12)
    {
      id v19 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting in paused state", buf, 2u);
      }
      id v16 = objc_loadWeakRetained(v1);
      long long v17 = [v16 mainPlayer];
      [v17 pause];
    }
    else
    {
LABEL_10:
      int v15 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting in playing state", buf, 2u);
      }
      id v16 = objc_loadWeakRetained(v1);
      long long v17 = [v16 mainPlayer];
      [v17 play];
    }
  }
  else
  {
    id v20 = objc_loadWeakRetained(v1);
    int v18 = [v20 mainPlayer];
    [v18 play];
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_984(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained extrasContext];
  [v1 startIfNecessary];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_985(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_986;
  aBlock[3] = &unk_1E6DF6498;
  uint64_t v2 = (id *)(a1 + 56);
  objc_copyWeak(&v35, (id *)(a1 + 56));
  id v34 = *(id *)(a1 + 48);
  char v36 = *(unsigned char *)(a1 + 64);
  int v3 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained performSelector:sel__avPlayerViewControllerPresentationDidTimeout withObject:0 afterDelay:5.0];

  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v5 _isNewPostPlayEnabled];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v2);
    id v8 = [v7 playbackContainerViewController];

    if (!v8)
    {
      id v9 = +[VUIInterfaceFactory sharedInstance];
      id v10 = [v9 documentCreator];
      id v11 = [v10 playbackContainerViewController];

      id v12 = objc_loadWeakRetained(v2);
      [v11 setDelegate:v12];

      id v13 = [v11 view];
      id v14 = [MEMORY[0x1E4FB1618] blackColor];
      [v13 setBackgroundColor:v14];

      id v15 = objc_loadWeakRetained(v2);
      [v15 setPlaybackContainerViewController:v11];
    }
    if ([*(id *)(a1 + 32) conformsToProtocol:&unk_1F3F5D0F8])
    {
      id v16 = *(id *)(a1 + 32);
      long long v17 = +[VUIInterfaceFactory sharedInstance];
      int v18 = [v17 documentCreator];
      id v19 = [v16 currentViewController];
      [v18 recordImpressionsForViewController:v19];
    }
    else
    {
      id v16 = +[VUIInterfaceFactory sharedInstance];
      long long v17 = [v16 documentCreator];
      [v17 recordImpressionsForViewController:*(void *)(a1 + 32)];
    }

    id v20 = objc_loadWeakRetained(v2);
    double v21 = [v20 playbackContainerViewController];
    double v22 = [v21 presentingViewController];

    if (v22)
    {
      id v23 = objc_loadWeakRetained(v2);
      uint64_t v24 = [v23 playbackContainerViewController];
      id v25 = objc_loadWeakRetained(v2);
      uint64_t v26 = [v25 avPlayerViewController];
      [v24 presentPlayerViewController:v26 animated:0 completion:v3];
    }
    else
    {
      id v27 = *(void **)(a1 + 32);
      id v28 = objc_loadWeakRetained(v2);
      long long v29 = [v28 playbackContainerViewController];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_995;
      v30[3] = &unk_1E6DF4D78;
      objc_copyWeak(&v32, v2);
      id v31 = v3;
      [v27 presentViewController:v29 animated:1 completion:v30];

      objc_destroyWeak(&v32);
    }
  }
  else
  {
    [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 65) completion:v3];
  }

  objc_destroyWeak(&v35);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_986(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FBA8A8];
  int v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 cancelPreviousPerformRequestsWithTarget:WeakRetained selector:sel__avPlayerViewControllerPresentationDidTimeout object:0];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  id v6 = objc_loadWeakRetained(v3);
  id v7 = [v6 stateMachine];
  id v10 = @"IsTestingITunesExtrasKey";
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v11[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v7 postEvent:@"AVPlayerViewController presentation did complete" withContext:0 userInfo:v9];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_995(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = [WeakRetained playbackContainerViewController];
  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 avPlayerViewController];
  [v3 presentPlayerViewController:v5 animated:0 completion:*(void *)(a1 + 32)];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_996(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKey:@"PlaylistKey"];
  id v14 = [v13 currentMediaItem];
  id v15 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

  if (([v15 isEqualToString:*MEMORY[0x1E4FAA1F0]] & 1) != 0
    || ([v15 isEqualToString:*MEMORY[0x1E4FAA208]] & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    long long v17 = [WeakRetained stateMachine];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_998;
    v24[3] = &unk_1E6DF5490;
    objc_copyWeak(&v26, (id *)(a1 + 40));
    id v25 = v13;
    [v17 executeBlockAfterCurrentStateTransition:v24];

    int v18 = [v9 currentState];

    objc_destroyWeak(&v26);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v19 = [v12 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoPlaybackContext[0]];
    if ([v19 unsignedIntegerValue] == 5)
    {
      dispatch_time_t v20 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_997;
      block[3] = &unk_1E6DF3F90;
      objc_copyWeak(&v30, (id *)(a1 + 40));
      id v28 = v11;
      id v29 = v12;
      dispatch_after(v20, MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v30);
    }
    else
    {
      id v21 = objc_loadWeakRetained((id *)(a1 + 40));
      double v22 = [v21 stateMachine];
      [v22 postEvent:@"Present playlist" withContext:v11 userInfo:v12];
    }
    int v18 = @"Showing video full screen";
  }

  return v18;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_997(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Present playlist" withContext:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_998(uint64_t a1)
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained extrasNavigationController];
  uint64_t v5 = [v4 visibleViewController];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 && v5)
  {
    v10[0] = @"PlaylistKey";
    v10[1] = @"PresentingViewControllerKey";
    v11[0] = v6;
    v11[1] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v8 = objc_loadWeakRetained(v2);
    id v9 = [v8 stateMachine];
    [v9 postEvent:@"Extras playback requested" withContext:0 userInfo:v7];
  }
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_999(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v81 = a2;
  id v80 = a3;
  id v79 = a4;
  id v9 = a5;
  BOOL v83 = [v9 objectForKey:@"CompletionKey"];
  id v10 = [v9 objectForKey:@"PlayerKey"];
  id v11 = [v10 playlist];
  uint64_t v12 = [v9 objectForKey:@"PlaybackContainerKey"];
  id v13 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v15 = [WeakRetained playbackContainerViewController];

  BOOL v82 = (void *)v12;
  if ((void *)v12 != v15) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v10 setReportingCategory:@"fullscreen"];
  [v10 setErrorBehavior:2];
  [v10 setAllowsCellularUsage:0];
  [v10 setAllowsExternalPlayback:1];
  uint64_t v16 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoIsEligibleForPlayerTabs[0]];
  long long v17 = [v11 currentMediaItem];
  id v77 = (void *)v16;
  [v17 setMediaItemMetadata:v16 forProperty:@"VUIMediaItemMetadataIsEligibleForPlayerTabs"];

  int v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v18 BOOLForKey:@"RepeatMovieForever"])
  {

LABEL_6:
    [v11 setRepeatMode:2];
    goto LABEL_7;
  }
  id v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v20 = [v19 BOOLForKey:@"RepeatOneForAllMedia"];

  if (v20) {
    goto LABEL_6;
  }
LABEL_7:
  id v21 = objc_loadWeakRetained(v13);
  [v21 setMainPlayer:v10];

  id v22 = objc_loadWeakRetained(v13);
  [v22 setActivePlayer:v10];

  id v23 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v24 = [v23 groupActivitiesManager];
  [v24 playerDidStart:v10];

  uint64_t v25 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchId[0]];
  uint64_t v26 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchURL[0]];
  uint64_t v27 = [v9 objectForKey:VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchMetadata[0]];
  id v28 = objc_loadWeakRetained(v13);
  id v29 = [v11 currentMediaItem];
  id v75 = (void *)v26;
  uint64_t v76 = (void *)v25;
  id v74 = (void *)v27;
  [v28 _updateActivityItemsConfigurationWithSharedWatchId:v25 sharedWatchUrl:v26 previewMetadata:v27 mediaItem:v29];

  id v30 = objc_opt_new();
  [v30 setPlayer:v10];
  id v31 = objc_loadWeakRetained(v13);
  [v30 setDelegate:v31];

  id v32 = objc_loadWeakRetained(v13);
  id v73 = v30;
  [v32 setFeatureMonitor:v30];

  id v33 = [v9 objectForKey:@"PlayerViewControllerKey"];
  id v34 = objc_loadWeakRetained(v13);
  [v34 setAvPlayerViewController:v33];

  id v35 = objc_loadWeakRetained(v13);
  [v35 setMainAVPlayerViewController:v33];

  id v36 = objc_loadWeakRetained(v13);
  [v36 _setupPlayerViewController:v33];

  id v37 = objc_loadWeakRetained(v13);
  double v38 = [v37 _currentlyPlayingMultiviewInfo];

  if (v38)
  {
    id v39 = objc_loadWeakRetained(v13);
    [v39 multiviewPlaybackInfo];
    v41 = id v40 = v11;
    uint64_t v42 = [v41 indexOfObject:v38];

    id v11 = v40;
    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v43 = objc_loadWeakRetained(v13);
      id v44 = [v43 multiPlayerViewController];
      [v44 replacePlayerViewController:v33 atIndex:v42 animated:0 completion:0];

      id v11 = v40;
      [v38 setPlayer:v10];
      [v38 setPlayerViewController:v33];
    }
  }
  id v45 = objc_loadWeakRetained(v13);
  [v82 setDelegate:v45];

  id v46 = objc_loadWeakRetained(v13);
  [v46 setPlaybackContainerViewController:v82];

  id v47 = objc_loadWeakRetained(v13);
  BOOL v48 = [v82 presentingViewController];
  [v47 setPresentingViewController:v48];

  id v49 = objc_loadWeakRetained(v13);
  id v78 = v11;
  uint64_t v50 = [v11 currentMediaItem];
  [v49 _donateUserActivityForMediaItem:v50];

  id v51 = objc_loadWeakRetained(v13);
  [v51 _updateRequiresLinearPlayback];

  id v52 = objc_loadWeakRetained(v13);
  id v53 = [v52 mainLivePostPlayController];

  if (v53)
  {
    id v54 = objc_loadWeakRetained(v13);
    id v55 = [v54 mainLivePostPlayController];
    [v55 cleanup];

    id v56 = objc_loadWeakRetained(v13);
    [v56 setMainLivePostPlayController:0];
  }
  if (_os_feature_enabled_impl())
  {
    id v57 = +[VUIInterfaceFactory sharedInstance];
    id v58 = [v57 documentCreator];

    BOOL v59 = [v33 view];
    id v60 = [v58 initializeLivePostPlayControllerWithPlayer:v10 playerViewController:v33 presentationView:v59];

    id v61 = objc_loadWeakRetained(v13);
    [v61 setMainLivePostPlayController:v60];
  }
  id v62 = objc_loadWeakRetained(v13);
  BOOL v63 = [v62 stateMachine];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1000;
  v86[3] = &unk_1E6DF4A30;
  objc_copyWeak(v87, v13);
  [v63 executeBlockAfterCurrentStateTransition:v86];

  long long v64 = +[VUIPlaybackTabManager sharedInstance];
  id v65 = objc_loadWeakRetained(v13);
  [v64 setDelegate:v65];

  long long v66 = +[VUIPlaybackTabManager sharedInstance];
  LODWORD(v65) = [v66 isPlayerTabsEnabled];

  if (v65)
  {
    id v67 = +[VUIPlaybackTabManager sharedInstance];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1001;
    v84[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v85, v13);
    [v67 updatePlayerTabsExcludingCanonicals:0 completion:v84];

    objc_destroyWeak(&v85);
  }
  if (v83) {
    v83[2]();
  }
  id v68 = objc_loadWeakRetained(v13);
  long long v69 = [v68 multiPlayerViewController];
  if (v69) {
    long long v70 = @"Showing multiview playback fullscreen";
  }
  else {
    long long v70 = @"Showing video full screen";
  }
  char v71 = v70;

  objc_destroyWeak(v87);
  return v71;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1000(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained mainPlayer];
  uint64_t v2 = [v1 currentMediaItem];
  int v3 = [v2 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v3 addEndEventWithName:*MEMORY[0x1E4FAA388]];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1001(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupInfoTab];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateMultiviewButtonState];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1002(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [v6 objectForKey:@"CompletionKey"];
  id v8 = [v6 objectForKey:@"PlaylistsKey"];
  id v9 = [v6 objectForKey:@"PresentingViewControllerKey"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1003(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"CompletionKey"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1004(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = [WeakRetained avPlayerViewController];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  long long v17 = [WeakRetained avPlayerViewController];
  int v18 = [WeakRetained multiPlayerViewController];
  int v19 = [v18 conformsToProtocol:&unk_1F3FA57A0];

  if (v19)
  {
    int v20 = [WeakRetained multiPlayerViewController];
    [v17 setDelegate:v20];
  }
  id v21 = [WeakRetained playbackContainerViewController];
  id v22 = [WeakRetained multiPlayerViewController];
  [v21 embedMultiPlayerViewController:v22];

  id v23 = [WeakRetained multiPlayerViewController];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  id v29 = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14_1055;
  id v30 = &unk_1E6DF6510;
  id v24 = v17;
  id v31 = v24;
  objc_copyWeak(&v32, v13);
  [v23 exitFullscreenWithCompletion:&v27];

  id v25 = objc_loadWeakRetained(v13);
  objc_msgSend(v25, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 1, v27, v28, v29, v30);

  objc_destroyWeak(&v32);
  return @"Showing multiview playback";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14_1055(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 setDelegate:WeakRetained];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_1056(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKey:@"CompletionKey"];
  id v14 = [v12 objectForKeyedSubscript:@"PlayerViewControllerKey"];
  uint64_t v15 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v16 = [v15 playbackEndManager];
  [v16 removeAllPlayers];

  if (v14)
  {
    id v40 = v11;
    id v41 = v10;
    long long v17 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [v14 setDelegate:WeakRetained];

    id v19 = objc_loadWeakRetained((id *)(a1 + 40));
    [v19 _multiviewInfoForPlayerViewController:v14];
    v21 = int v20 = v13;

    [v21 player];
    v23 = id v22 = v9;
    [v23 setAllowsExternalPlayback:1];
    [v14 setUpdatesNowPlayingInfoCenter:1];
    [v14 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:2];
    id v24 = objc_loadWeakRetained((id *)(a1 + 40));
    [v24 setActivePlayer:v23];

    id v25 = objc_loadWeakRetained((id *)(a1 + 40));
    [v25 setMainPlayer:v23];

    id v26 = objc_loadWeakRetained((id *)(a1 + 40));
    [v26 setMainAVPlayerViewController:v14];

    id v27 = objc_loadWeakRetained((id *)(a1 + 40));
    [v27 setAvPlayerViewController:v14];

    id v28 = objc_loadWeakRetained((id *)(a1 + 40));
    id v29 = [v21 livePostPlayController];
    [v28 setMainLivePostPlayController:v29];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16_1057;
    aBlock[3] = &unk_1E6DF43D0;
    objc_copyWeak(v49, v17);
    id v30 = v21;
    id v47 = v30;
    id v39 = v20;
    id v48 = v20;
    id v31 = (void (**)(void))_Block_copy(aBlock);
    id v32 = v22;
    id v33 = [v22 currentState];
    LODWORD(v28) = [v33 isEqualToString:@"Showing multiview playback"];

    if (v28)
    {
      id v34 = objc_loadWeakRetained(v17);
      id v35 = [v34 playbackContainerViewController];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17_1058;
      v44[3] = &unk_1E6DF3DD0;
      id v45 = v31;
      [v35 presentPlayerViewController:v14 animated:1 completion:v44];
    }
    else
    {
      v31[2](v31);
    }

    objc_destroyWeak(v49);
    id v37 = @"Showing video full screen";
    id v9 = v32;
    id v11 = v40;
    id v10 = v41;
    id v13 = v39;
  }
  else
  {
    uint64_t v36 = *(void *)(a1 + 32);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18_1059;
    v42[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v43, (id *)(a1 + 40));
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, void, void, void *))(v36 + 16))(v36, 1, 1, 0, 1, 0, 0, v42);
    objc_destroyWeak(&v43);
    id v37 = @"Not showing anything";
  }

  return v37;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16_1057(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_msgSend(WeakRetained, "multiviewPlaybackInfo", 0);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        if (v9 != *(void **)(a1 + 32))
        {
          id v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v8) player];
          [v10 stop];

          id v11 = [v9 player];
          [v11 invalidate];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  id v12 = objc_loadWeakRetained(v2);
  id v13 = [v12 multiviewPlaybackInfo];
  [v13 removeAllObjects];

  id v14 = objc_loadWeakRetained(v2);
  uint64_t v15 = [v14 playbackContainerViewController];
  id v16 = (id)[v15 unembedMultiPlayerViewController];

  id v17 = objc_loadWeakRetained(v2);
  [v17 setMultiPlayerViewController:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17_1058(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18_1059(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMultiPlayerViewController:0];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_1060(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v33 = a2;
  id v32 = a3;
  id v31 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKey:@"PlaylistKey"];
  id v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  char v34 = objc_msgSend(v9, "vui_BOOLForKey:defaultValue:", @"AnimatedKey", 1);
  id v12 = objc_msgSend(v9, "vui_numberForKey:", @"IndexKey");
  id v13 = [v9 objectForKey:@"CompletionKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v15 = [WeakRetained multiviewPlaybackInfo];
  id v16 = v15;
  if (v12) {
    objc_msgSend(v15, "insertObject:atIndex:", v11, objc_msgSend(v12, "integerValue"));
  }
  else {
    [v15 addObject:v11];
  }

  id v17 = [v11 player];

  if (v17)
  {
    int v18 = +[VUIInterfaceFactory sharedInstance];
    long long v19 = [v18 playbackEndManager];
    long long v20 = [v11 player];
    [v19 monitor:v20];
  }
  id v21 = objc_loadWeakRetained((id *)(a1 + 48));
  [v21 _updateMultiviewReportingMetrics];

  long long v22 = [v10 currentMediaItem];
  id v23 = [v22 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];

  uint64_t v24 = [[VUIPlaybackStartupCoordinator alloc] initWithCanonicalID:v23 showCanonicalID:0 mediaType:@"SportingEvent" watchType:2 isRentAndWatchNow:0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  void v35[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_20;
  void v35[3] = &unk_1E6DF77F0;
  id v25 = v24;
  uint64_t v36 = v25;
  objc_copyWeak(&v41, (id *)(a1 + 48));
  id v26 = v11;
  id v37 = v26;
  char v42 = v34;
  id v27 = v13;
  id v40 = v27;
  id v28 = v12;
  uint64_t v29 = *(void *)(a1 + 32);
  id v38 = v28;
  uint64_t v39 = v29;
  [(VUIPlaybackStartupCoordinator *)v25 performPlaybackStartupFlowWithCompletion:v35];

  objc_destroyWeak(&v41);
  return @"Showing multiview playback";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_20(uint64_t a1, int a2)
{
  id v4 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v6 = WeakRetained;
  if (a2)
  {
    uint64_t v7 = [WeakRetained multiPlayerViewController];
    uint64_t v8 = [*(id *)(a1 + 40) playerViewController];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 80);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_21;
    v22[3] = &unk_1E6DF3DD0;
    id v23 = *(id *)(a1 + 64);
    [v7 addPlayerViewController:v8 animated:v9 completion:v22];
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      id v10 = [*(id *)(a1 + 56) multiviewPlaybackInfo];
      id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));

      id v12 = objc_loadWeakRetained(v4);
      id v13 = [v12 multiviewPlaybackInfo];
      objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
    }
    else
    {
      id v14 = objc_loadWeakRetained(v4);
      uint64_t v15 = [v14 multiviewPlaybackInfo];
      id v11 = [v15 lastObject];

      id v12 = objc_loadWeakRetained(v4);
      id v13 = [v12 multiviewPlaybackInfo];
      [v13 removeLastObject];
    }

    id v16 = [v11 player];

    if (v16)
    {
      id v17 = +[VUIInterfaceFactory sharedInstance];
      int v18 = [v17 playbackEndManager];
      long long v19 = [v11 player];
      [v18 remove:v19];
    }
    id v20 = objc_loadWeakRetained(v4);
    [v20 _updateMultiviewReportingMetrics];

    uint64_t v21 = *(void *)(a1 + 64);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_21(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v15 = [WeakRetained avPlayerViewController];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v16 = [WeakRetained multiPlayerViewController];
  int v17 = [v16 conformsToProtocol:&unk_1F3FA57A0];

  if (v17)
  {
    int v18 = [WeakRetained multiPlayerViewController];
    [v15 setDelegate:v18];
  }
  long long v19 = [WeakRetained playbackContainerViewController];
  id v20 = [WeakRetained multiPlayerViewController];
  [v19 embedMultiPlayerViewController:v20];

  [WeakRetained setActivePlayer:0];
  [WeakRetained setMainPlayer:0];
  [WeakRetained setMainAVPlayerViewController:0];
  [WeakRetained setAvPlayerViewController:0];
  [WeakRetained setMainLivePostPlayController:0];
  uint64_t v21 = [WeakRetained multiPlayerViewController];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_23;
  id v26[3] = &unk_1E6DF7840;
  id v22 = v15;
  id v27 = v22;
  objc_copyWeak(&v30, v13);
  id v23 = v9;
  id v28 = v23;
  id v24 = v12;
  id v29 = v24;
  [v21 exitFullscreenWithCompletion:v26];

  objc_destroyWeak(&v30);
  return @"Showing multiview playback";
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_23(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [v2 setDelegate:WeakRetained];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 postEvent:@"Add multiview playback" withContext:0 userInfo:v5];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = [v6 objectForKey:@"PlaylistKey"];
  uint64_t v8 = [v6 objectForKey:@"CompletionKey"];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v7)
  {
    v12[0] = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void, void *, void *))(v9 + 16))(v9, 0, v10, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v8);
  }

  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [v6 objectForKey:@"PlaylistKey"];
  id v10 = [v9 currentMediaItem];
  id v11 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];

  id v12 = objc_loadWeakRetained(v7);
  unint64_t v13 = [v12 indexOfMediaItemInMultiviewWithIdentifier:v11];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [WeakRetained multiviewPlaybackInfo];
    unint64_t v15 = [v14 count];

    if (v13 < v15)
    {
      id v16 = [WeakRetained multiviewPlaybackInfo];
      int v17 = [v16 objectAtIndex:v13];

      uint64_t v18 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"AnimatedKey", 1);
      long long v19 = [WeakRetained multiPlayerViewController];
      id v20 = [v17 playerViewController];
      [v19 removePlayerViewController:v20 animated:v18 completion:0];

      uint64_t v21 = [WeakRetained multiviewPlaybackInfo];
      [v21 removeObject:v17];

      id v22 = [v17 player];

      if (v22)
      {
        id v23 = +[VUIInterfaceFactory sharedInstance];
        id v24 = [v23 playbackEndManager];
        id v25 = [v17 player];
        [v24 remove:v25];
      }
      id v26 = [v17 player];
      [v26 stop];

      id v27 = [v17 player];
      [v27 invalidate];

      id v28 = objc_loadWeakRetained(v7);
      [v28 _updateMultiviewReportingMetrics];
    }
  }
  [WeakRetained _unmuteNextAvailableMultiviewPlayer];

  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = v5;
  [v8 stop];
  [v8 invalidate];
  id v9 = objc_loadWeakRetained(v6);
  unint64_t v10 = [v9 indexOfMediaItemInMultiviewWithPlayer:v8];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [WeakRetained multiviewPlaybackInfo];
    unint64_t v12 = [v11 count];

    if (v10 < v12)
    {
      unint64_t v13 = [WeakRetained multiviewPlaybackInfo];
      id v14 = [v13 objectAtIndex:v10];

      unint64_t v15 = [WeakRetained multiviewPlaybackInfo];
      [v15 removeObject:v14];

      id v16 = objc_loadWeakRetained(v6);
      [v16 _updateMultiviewReportingMetrics];

      int v17 = [v14 player];

      if (v17)
      {
        uint64_t v18 = +[VUIInterfaceFactory sharedInstance];
        long long v19 = [v18 playbackEndManager];
        id v20 = [v14 player];
        [v19 remove:v20];
      }
    }
  }
  uint64_t v21 = [WeakRetained multiviewPlaybackInfo];
  if ((unint64_t)[v21 count] <= 1) {
    id v22 = @"Showing video full screen";
  }
  else {
    id v22 = @"Showing multiview playback";
  }
  id v23 = v22;

  return v23;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [v7 objectForKey:@"PlaylistKey"];
  uint64_t v10 = objc_msgSend(v7, "vui_BOOLForKey:defaultValue:", @"AnimatedKey", 1);
  id v11 = objc_msgSend(v7, "vui_numberForKey:", @"IndexKey");

  uint64_t v12 = [v11 integerValue];
  unint64_t v13 = [WeakRetained multiviewPlaybackInfo];
  id v14 = [v13 objectAtIndex:v12];

  unint64_t v15 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v16 = [WeakRetained multiviewPlaybackInfo];
  [v16 setObject:v15 atIndexedSubscript:v12];

  int v17 = [WeakRetained multiPlayerViewController];
  uint64_t v18 = [v15 playerViewController];
  [v17 replacePlayerViewController:v18 atIndex:v12 animated:v10 completion:0];

  long long v19 = [v15 playerViewController];
  [WeakRetained _muteAllMultiviewPlayersExcept:v19];

  id v20 = [v14 player];
  [v20 stop];

  uint64_t v21 = [v14 player];
  [v21 invalidate];

  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"PlayerViewControllerKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _muteAllMultiviewPlayersExcept:v6];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v8 _multiviewInfoForPlayerViewController:v6];

  if ([v9 pausedDueToInterruption]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_29(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v49 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v11 objectForKey:@"PlayerViewControllerKey"];
  unint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v15 = [WeakRetained _multiviewInfoForPlayerViewController:v12];

  [v15 setContext:2];
  id v16 = [v15 player];
  [v16 setAllowsExternalPlayback:1];

  [v12 setUpdatesNowPlayingInfoCenter:1];
  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v18 = [v15 player];
  [v17 setActivePlayer:v18];

  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  id v20 = [v15 player];
  [v19 setMainPlayer:v20];

  id v21 = objc_loadWeakRetained((id *)(a1 + 40));
  [v21 setAvPlayerViewController:v12];

  id v22 = objc_loadWeakRetained((id *)(a1 + 40));
  [v22 setMainAVPlayerViewController:v12];

  id v23 = objc_loadWeakRetained((id *)(a1 + 40));
  id v24 = [v15 livePostPlayController];
  [v23 setMainLivePostPlayController:v24];

  id v25 = objc_loadWeakRetained((id *)(a1 + 40));
  id v26 = [v25 mainPlayer];
  id v27 = [v26 currentMediaItem];
  [v25 _showShareMediaMenuForMediaItem:v27];

  id v28 = objc_loadWeakRetained((id *)(a1 + 40));
  [v28 _muteAllMultiviewPlayersExcept:v12];

  [v12 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:2];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_30;
  v52[3] = &unk_1E6DF41E8;
  id v54 = *(id *)(a1 + 32);
  id v29 = v12;
  id v53 = v29;
  [v9 executeBlockAfterCurrentStateTransition:v52];
  id v30 = +[VUIPlaybackTabManager sharedInstance];
  id v31 = objc_loadWeakRetained(v13);
  id v32 = [v31 multiviewIdentifiers];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_31;
  v50[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v51, v13);
  [v30 updatePlayerTabsExcludingCanonicals:v32 completion:v50];

  id v33 = objc_loadWeakRetained(v13);
  [v29 setDelegate:v33];

  id v34 = objc_loadWeakRetained(v13);
  id v35 = [v34 playbackContainerViewController];
  id v36 = (id)[v35 unembedMultiPlayerViewController];

  id v37 = [v29 view];
  id v38 = [v37 window];
  [v38 bounds];
  double v40 = v39;
  double v42 = v41;

  id v43 = objc_loadWeakRetained(v13);
  id v44 = [v43 multiPlayerViewController];
  LODWORD(v38) = objc_msgSend(v44, "isSupportedScreenSize:", v40, v42);

  id v45 = objc_loadWeakRetained(v13);
  [v45 configureAudioSessionForBackgroundPlayback:0 usingPlaybackCategory:0 isMultiview:0];

  if (v38) {
    id v46 = @"Showing multiview playback fullscreen";
  }
  else {
    id v46 = @"Showing multiview playback fullscreen due to small screen size";
  }
  id v47 = v46;
  objc_destroyWeak(&v51);

  return v47;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_31(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMultiviewButtonState];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _setupInfoTab];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_32(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = [v12 objectForKey:@"PlaylistKey"];
  id v14 = [v12 objectForKey:@"CanPlayMediaKey"];
  unint64_t v15 = v14;
  if (v14) {
    int v16 = [v14 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v16) = 1;
  }
  char v41 = v16;
  id v43 = v11;
  uint64_t v40 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v18 = [WeakRetained longLoadingAlertController];
  id v19 = [v18 presentingViewController];
  [v19 dismissViewControllerAnimated:1 completion:0];

  from = (id *)(a1 + 40);
  id v20 = objc_loadWeakRetained((id *)(a1 + 40));
  [v20 setLongLoadingAlertController:0];

  id v21 = [v13 tvpPlaylist];
  id v22 = [v21 currentMediaItem];
  if ([v22 hasTrait:VUIMediaItemTraitIsSportingEvent])
  {
    id v23 = [v13 videosPlayables];
    id v24 = [v23 firstObject];
    [v24 metadata];
    double v39 = v15;
    id v25 = v13;
    id v26 = v12;
    id v27 = v9;
    id v29 = v28 = v10;
    id v30 = [v29 duration];

    id v10 = v28;
    id v9 = v27;
    id v12 = v26;
    unint64_t v13 = v25;
    unint64_t v15 = v39;

    if (!v30) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v31 = [v9 currentState];
  int v32 = [v31 isEqualToString:@"Showing multiview playback fullscreen"];

  if (v32)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_33;
    v50[3] = &unk_1E6DF3F90;
    objc_copyWeak(v53, from);
    id v51 = v12;
    id v33 = v43;
    id v52 = v43;
    [v9 executeBlockAfterCurrentStateTransition:v50];

    objc_destroyWeak(v53);
    goto LABEL_15;
  }
LABEL_10:
  id v33 = v43;
  if ((v41 & 1) == 0)
  {
    if ([v13 playbackContext] == 11) {
      uint64_t v34 = 4;
    }
    else {
      uint64_t v34 = 3;
    }
    id v35 = +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:v13 watchType:v34 isRentAndWatchNow:0];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_34;
    v44[3] = &unk_1E6DF7868;
    id v36 = v35;
    id v45 = v36;
    objc_copyWeak(&v49, from);
    id v48 = *(id *)(v40 + 32);
    id v46 = v13;
    id v47 = v9;
    [v36 performPlaybackStartupFlowWithCompletion:v44];

    objc_destroyWeak(&v49);
  }
LABEL_15:
  id v37 = [v9 currentState];

  return v37;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_33(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained stateMachine];
  [v4 postEvent:@"Dismiss multiview playback" withContext:0 userInfo:*(void *)(a1 + 32)];

  id v6 = objc_loadWeakRetained(v2);
  id v5 = [v6 stateMachine];
  [v5 postEvent:@"Media info did change" withContext:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 32)];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_34(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6, void *a7, void *a8)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v39 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v44 = a2;
    __int16 v45 = 2048;
    uint64_t v46 = a3;
    __int16 v47 = 2048;
    uint64_t v48 = a4;
    __int16 v49 = 2048;
    uint64_t v50 = a5;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Mediainfo changed startup coordinator finished startup flow.  startPlayback == %ld, isCoWatching == %ld, forceDownloadToStream == %ld, allowCellular == %ld", buf, 0x2Au);
  }
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_setExtrasButtonVisible:", 0, v39);

    uint64_t v19 = *(void *)(a1 + 56);
    id v20 = [*(id *)(a1 + 40) tvpPlaylist];
    id v21 = [v20 currentMediaItem];
    id v22 = (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);

    id v23 = objc_loadWeakRetained((id *)(a1 + 64));
    [v22 setDelegate:v23];

    id v24 = objc_loadWeakRetained((id *)(a1 + 64));
    [v24 setExtrasContext:v22];

    id v25 = *(void **)(a1 + 48);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1063;
    v41[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v42, (id *)(a1 + 64));
    [v25 executeBlockAfterCurrentStateTransition:v41];
    id v26 = [*(id *)(a1 + 40) tvpPlaylist];
    id v27 = [v26 currentMediaItem];
    id v28 = [v27 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v28 addEndEventWithName:*MEMORY[0x1E4FAA388]];

    id v29 = objc_loadWeakRetained((id *)(a1 + 64));
    id v30 = [v29 mainPlayer];

    id v31 = [*(id *)(a1 + 40) tvpPlaylist];
    [v30 setPlaylist:v31];

    int v32 = [v30 currentMediaItem];
    +[VUIMetricsMediaEvent recordPlayOfTVPMediaItem:v32];

    [v30 play];
    id v33 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v34 = [v15 sharedWatchId];
    id v35 = [v15 sharedWatchUrl];
    id v36 = [v30 playlist];
    id v37 = [v36 currentMediaItem];
    [v33 _updateActivityItemsConfigurationWithSharedWatchId:v34 sharedWatchUrl:v35 previewMetadata:v16 mediaItem:v37];

    objc_destroyWeak(&v42);
  }
  else
  {
    id v38 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "Not playing media item after media info changed since playback startup coordinator disallowed it", buf, 2u);
    }
    id v22 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v22, "_clearActivityItemsConfiguration", v39);
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1063(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained extrasContext];
  [v1 startIfNecessary];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"PlayerViewControllerKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 setDelegate:WeakRetained];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 configureAudioSessionForBackgroundPlayback:0 usingPlaybackCategory:0 isMultiview:1];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 _muteAllMultiviewPlayersExcept:v6];

  [v6 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return @"Showing multiview playback";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1065(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = [v8 objectForKey:@"AnimatedKey"];
  [v9 BOOLValue];

  id v10 = [v8 objectForKey:@"CompletionKey"];

  id v11 = [v7 currentState];
  [v11 isEqualToString:@"Showing error message on playback UI"];

  id v12 = [v7 currentState];
  if (([v12 isEqualToString:@"Showing video full screen with post play content on screen"] & 1) == 0)
  {
    unint64_t v13 = [v7 currentState];
    [v13 isEqualToString:@"Showing post play content without playback UI"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return @"Not showing anything";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1066(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = [a5 objectForKey:@"CompletionKey"];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

  return @"Waiting for AVPlayerViewController presentation to complete to dismiss";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1069(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [v6 objectForKey:@"AnimatedKey"];
  [v7 BOOLValue];

  id v8 = [v6 objectForKey:@"CompletionKey"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return @"Not showing anything";
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1070(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = [v12 objectForKey:@"CompletionKey"];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1071;
  id v20 = &unk_1E6DF4D78;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  id v14 = v13;
  id v21 = v14;
  [v9 executeBlockAfterCurrentStateTransition:&v17];
  id v15 = objc_msgSend(v9, "currentState", v17, v18, v19, v20);

  objc_destroyWeak(&v22);
  return v15;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1071(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPIPedBackgroundMediaController:0];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1072(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [v6 objectForKey:@"AnimatedKey"];
  [v7 BOOLValue];

  id v8 = [v6 objectForKey:@"CompletionKey"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return @"Not showing anything";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1073(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = [v8 objectForKey:@"AnimatedKey"];
  [v9 BOOLValue];

  id v10 = [v8 objectForKey:@"CompletionKey"];

  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v11 = @"Showing extras video picture in picture outside extras content";
  }
  else
  {
    id v11 = [v7 currentState];
  }

  return v11;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1074(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v15 = [WeakRetained savedErrorContext];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v17 = [v16 savedErrorUserInfo];

  uint64_t v18 = [v12 objectForKey:@"IsTestingITunesExtrasKey"];
  char v19 = [v18 BOOLValue];

  __int16 v49 = (void *)v15;
  if (v15 | v17)
  {
    id v20 = v12;
    id v21 = v11;
    id v22 = v9;
    id v23 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "An error occurred while the main AVPlayerViewController was being presented.  Posting error event again.", buf, 2u);
    }
    id v24 = objc_loadWeakRetained((id *)(a1 + 40));
    [v24 setSavedErrorContext:0];

    id v25 = objc_loadWeakRetained((id *)(a1 + 40));
    [v25 setSavedErrorUserInfo:0];

    id v26 = objc_loadWeakRetained((id *)(a1 + 40));
    id v27 = [v26 stateMachine];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1075;
    v54[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v57, v13);
    id v28 = v49;
    id v55 = v49;
    id v56 = (id)v17;
    [v27 executeBlockAfterCurrentStateTransition:v54];

    objc_destroyWeak(&v57);
    id v29 = @"Showing video full screen";
  }
  else
  {
    id v47 = v11;
    id v48 = v9;
    id v30 = objc_loadWeakRetained((id *)(a1 + 40));
    id v31 = [v30 mainPlayer];
    int v32 = [v31 state];
    id v33 = [MEMORY[0x1E4FA9D88] stopped];
    if (v32 != v33) {
      char v19 = 1;
    }

    if (v19)
    {
      id v34 = objc_loadWeakRetained((id *)(a1 + 40));
      id v35 = [v34 stateMachine];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1077;
      v50[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v51, v13);
      [v35 executeBlockAfterCurrentStateTransition:v50];

      id v36 = objc_loadWeakRetained(v13);
      id v37 = [v36 mainPlayer];
      id v38 = [v37 state];
      id v39 = [MEMORY[0x1E4FA9D88] playing];

      if (v38 == v39)
      {
        id v40 = objc_loadWeakRetained(v13);
        char v41 = [v40 mainPlayer];
        id v42 = [v41 currentMediaItem];
        [v40 _showShareMediaMenuForMediaItem:v42];
      }
      id v20 = v12;
      objc_destroyWeak(&v51);
      id v29 = @"Showing video full screen";
    }
    else
    {
      id v20 = v12;
      id v43 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v43, OS_LOG_TYPE_DEFAULT, "Dismissing main AVPlayerViewController since playback has stopped since being presented", buf, 2u);
      }
      id v44 = objc_loadWeakRetained((id *)(a1 + 40));
      __int16 v45 = [v44 stateMachine];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1076;
      v52[3] = &unk_1E6DF3DD0;
      id v53 = *(id *)(a1 + 32);
      [v45 executeBlockAfterCurrentStateTransition:v52];

      id v29 = @"Not showing anything";
    }
    id v22 = v48;
    id v21 = v47;
    id v28 = v49;
  }

  return v29;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1075(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Error did occur" withContext:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1076(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1077(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained extrasContext];
  [v1 startIfNecessary];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1078(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v15 = [WeakRetained savedErrorContext];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v17 = [v16 savedErrorUserInfo];

  if (v15 | v17)
  {
    uint64_t v18 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "An error occurred while the extras AVPlayerViewController was being presented.  Posting error event again.", buf, 2u);
    }
    id v19 = objc_loadWeakRetained(v13);
    [v19 setSavedErrorContext:0];

    id v20 = objc_loadWeakRetained(v13);
    [v20 setSavedErrorUserInfo:0];

    id v21 = objc_loadWeakRetained(v13);
    id v22 = [v21 stateMachine];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1079;
    v34[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v37, v13);
    id v35 = (id)v15;
    id v36 = (id)v17;
    [v22 executeBlockAfterCurrentStateTransition:v34];

    objc_destroyWeak(&v37);
    id v23 = @"Showing video full screen";
  }
  else
  {
    id v33 = v12;
    id v24 = v11;
    id v25 = v10;
    id v26 = v9;
    id v27 = objc_loadWeakRetained((id *)(a1 + 40));
    id v28 = [v27 extrasPlayer];
    id v29 = [v28 state];
    id v30 = [MEMORY[0x1E4FA9D88] stopped];

    if (v29 == v30)
    {
      id v31 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "Dismissing extras AVPlayerViewController because playback has stopped since being presented", buf, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = @"Showing video full screen";
    }
    id v9 = v26;
    id v10 = v25;
    id v11 = v24;
    id v12 = v33;
  }

  return v23;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1079(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Error did occur" withContext:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1080(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained stateMachine];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1081;
  v5[3] = &unk_1E6DF3DD0;
  id v6 = *(id *)(a1 + 32);
  [v3 executeBlockAfterCurrentStateTransition:v5];

  return @"Not showing anything";
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1081(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1082(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1083;
  v4[3] = &unk_1E6DF3DD0;
  id v5 = *(id *)(a1 + 32);
  [a2 executeBlockAfterCurrentStateTransition:v4];

  return @"Not showing anything";
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1083(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1084(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1085;
  v4[3] = &unk_1E6DF3DD0;
  id v5 = *(id *)(a1 + 32);
  [a2 executeBlockAfterCurrentStateTransition:v4];

  return @"Not showing anything";
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1085(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1086(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained _resetAutoPlayBingeWatchingQualifications];

  id v5 = objc_loadWeakRetained(a1);
  id v6 = [v5 avPlayerViewController];
  id v7 = objc_loadWeakRetained(a1);
  id v8 = [v7 extrasAVPlayerViewController];

  if (v6 == v8)
  {
    id v11 = @"Showing extras video picture in picture on extras content";
  }
  else
  {
    id v9 = [v3 currentState];
    char v10 = [v9 isEqualToString:@"Showing video full screen"];

    if (v10)
    {
      id v11 = @"Showing main video picture in picture";
    }
    else
    {
      id v11 = [v3 currentState];
    }
  }

  return v11;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1087(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKeyedSubscript:@"PlayerViewControllerKey"];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v8 = [WeakRetained _multiviewInfoForPlayerViewController:v6];

  [v8 setContext:3];
  id v9 = objc_loadWeakRetained(a1);
  [v9 _resetAutoPlayBingeWatchingQualifications];

  return @"Showing multiview playback in PIP";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1088(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pushMoreInfoControllerIfNeeded];

  return @"Showing extras video picture in picture outside extras content";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1089(uint64_t a1)
{
  return @"Showing main video picture in picture";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1090(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDismissalOperation:2];

  char v10 = [v8 objectForKeyedSubscript:@"PlayerViewControllerKey"];
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 setAvPlayerViewController:v10];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  [v12 _pushMoreInfoControllerIfNeeded];

  unint64_t v13 = [v7 currentState];
  if ([v13 isEqualToString:@"Showing multiview playback fullscreen"])
  {
    id v14 = @"Showing multiview playback fullscreen in PIP";
  }
  else
  {
    id v14 = [v7 currentState];
  }

  return v14;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1091(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
  id v4 = a2;
  v3(v2, 1, 0);
  id v5 = [v4 currentState];

  return v5;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1092(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained setDismissalOperation:2];

  id v9 = [v7 objectForKeyedSubscript:@"PlayerViewControllerKey"];
  id v10 = objc_loadWeakRetained(v6);
  [v10 setAvPlayerViewController:v9];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v9, VUIPlaybackManagerNotificationKeyPlayerViewController);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  id v12 = objc_loadWeakRetained(v6);
  [v12 _pushMoreInfoControllerIfNeeded];

  return @"Showing multiview playback in PIP";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14_1093()
{
  return @"Showing video full screen";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_1096(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v10 = [WeakRetained extrasAVPlayerViewController];

  id v11 = sLogObject_5;
  BOOL v12 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v10 == v7)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Stopping extras content playback because AVPlayerViewController was dismissed", buf, 2u);
    }
    unint64_t v13 = [v8 currentState];

    id v14 = objc_loadWeakRetained(v6);
    uint64_t v15 = [v14 extrasPlayer];
    [v15 stop];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Stopping main content playback because AVPlayerViewController was dismissed", buf, 2u);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1097;
    v17[3] = &unk_1E6DF3DD0;
    id v18 = *(id *)(a1 + 32);
    [v8 executeBlockAfterCurrentStateTransition:v17];

    unint64_t v13 = @"Not showing anything";
    id v14 = v18;
  }

  return v13;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1097(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1098()
{
  return @"Not showing anything";
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1101(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a2;
  id v7 = [a5 objectForKey:@"CompletionKey"];
  if (!os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1101_cold_1();
  if (v7) {
LABEL_3:
  }
    v7[2](v7, 0);
LABEL_4:
  id v8 = [v6 currentState];

  return v8;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1104(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v75 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = [v11 objectForKey:@"CompletionKey"];
  unint64_t v13 = [v9 currentState];
  id v14 = +[VUIApplicationRouter currentNavigationController];
  uint64_t v15 = [v14 topViewController];
  id v16 = [v15 presentedViewController];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v14 topViewController];
  }
  id v19 = v18;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = [v14 topViewController];
    [v20 dismissViewControllerAnimated:0 completion:0];

    uint64_t v21 = [v14 topViewController];

    id v19 = (void *)v21;
  }
  id v74 = v10;
  if (v19)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v23 = [WeakRetained playbackContainerViewController];

    if (v19 == v23)
    {
      uint64_t v24 = [v14 topViewController];

      id v19 = (void *)v24;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 dismissViewControllerAnimated:1 completion:0];
  }
  else if (v19)
  {
    goto LABEL_15;
  }
  id v25 = +[VUITVAppLauncher sharedInstance];
  id v26 = [v25 appWindow];

  id v19 = [v26 rootViewController];
  id v27 = [v19 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v27 dismissViewControllerAnimated:1 completion:0];
  }

LABEL_15:
  id v28 = (id *)(a1 + 32);
  id v29 = objc_loadWeakRetained(v28);
  [v29 setPresentingViewController:v19];

  LODWORD(v29) = +[VUIUtilities isSUIEnabled];
  id v30 = objc_loadWeakRetained(v28);
  id v31 = v30;
  if (v29) {
    uint64_t v32 = 2;
  }
  else {
    uint64_t v32 = 0;
  }
  [v30 setDismissalOperation:v32];

  if (!v19
    || (id v33 = objc_loadWeakRetained(v28),
        [v33 avPlayerViewController],
        id v34 = objc_claimAutoreleasedReturnValue(),
        v34,
        v33,
        !v34))
  {
    id v37 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1104_cold_1(v19 == 0, v37, v28);
      if (!v12) {
        goto LABEL_25;
      }
    }
    else if (!v12)
    {
LABEL_25:
      id v38 = v75;
      goto LABEL_42;
    }
    v12[2](v12, 0);
    goto LABEL_25;
  }
  id v35 = [v9 currentState];
  int v36 = [v35 isEqualToString:@"Showing main video picture in picture"];

  if (v36)
  {

    unint64_t v13 = @"Showing video full screen";
  }
  else
  {
    id v39 = [v9 currentState];
    int v40 = [v39 isEqualToString:@"Showing multiview playback in PIP"];

    if (v40) {
      unint64_t v13 = @"Showing multiview playback";
    }
    else {
      unint64_t v13 = @"Showing multiview playback fullscreen";
    }
  }
  id v41 = objc_loadWeakRetained(v28);
  id v42 = [v41 avPlayerViewController];
  id v43 = [v42 presentingViewController];

  if (!v43)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1106;
    aBlock[3] = &unk_1E6DF3DD0;
    id v81 = v12;
    id v73 = _Block_copy(aBlock);
    id v45 = objc_loadWeakRetained(v28);
    if ([v45 _isNewPostPlayEnabled])
    {
      id v46 = objc_loadWeakRetained(v28);
      id v47 = [v46 moreInfoCanonicalViewController];

      if (!v47)
      {
        id v48 = [v9 currentState];
        int v49 = [v48 isEqualToString:@"Showing multiview playback in PIP"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v50 = [v19 presentedViewController];
          int v71 = v49;
          id v51 = objc_loadWeakRetained(v28);
          id v52 = [v51 playbackContainerViewController];

          int v49 = v71;
          if (v50 == v52)
          {
            char v72 = objc_loadWeakRetained(v28);
            id v67 = [v72 playbackContainerViewController];
            id v68 = objc_loadWeakRetained(v28);
            long long v69 = [v68 avPlayerViewController];
            id v62 = v73;
            [v67 presentPlayerViewController:v69 animated:1 completion:v73];

            goto LABEL_49;
          }
        }
        id v53 = objc_loadWeakRetained(v28);
        id v54 = v53;
        if (v49)
        {
          id v55 = v53;
          id v56 = [v55 avPlayerViewController];
          char v72 = [v55 _multiviewInfoForPlayerViewController:v56];

          [v72 setContext:1];
          id v70 = objc_loadWeakRetained(v28);
          id v57 = [v70 playbackContainerViewController];
          id v58 = objc_loadWeakRetained(v28);
          BOOL v59 = [v58 multiPlayerViewController];
          [v57 embedMultiPlayerViewController:v59];

          id v60 = objc_loadWeakRetained(v28);
          id v61 = [v60 playbackContainerViewController];
          id v62 = v73;
          [v19 presentViewController:v61 animated:1 completion:v73];

LABEL_49:
          goto LABEL_41;
        }
        long long v66 = [v53 playbackContainerViewController];
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1107;
        v77[3] = &unk_1E6DF4D78;
        objc_copyWeak(&v79, v28);
        id v62 = v73;
        id v78 = v73;
        [v19 presentViewController:v66 animated:0 completion:v77];

        objc_destroyWeak(&v79);
LABEL_41:
        id v10 = v74;
        id v38 = v75;

        goto LABEL_42;
      }
    }
    else
    {
    }
    id v63 = objc_loadWeakRetained(v28);
    long long v64 = [v63 avPlayerViewController];
    id v62 = v73;
    [v19 presentViewController:v64 animated:1 completion:v73];

    goto LABEL_41;
  }
  id v44 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v44, OS_LOG_TYPE_DEFAULT, "Not presenting AVPlayerViewController since it is already being presented", buf, 2u);
  }
  id v10 = v74;
  id v38 = v75;
LABEL_42:

  return v13;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1106(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1107(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained playbackContainerViewController];
  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 avPlayerViewController];
  [v3 presentPlayerViewController:v5 animated:1 completion:*(void *)(a1 + 32)];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1108(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"CompletionKey"];
  id v9 = [v7 currentState];

  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  BOOL v12 = [WeakRetained extrasContext];
  unint64_t v13 = [v12 extrasRootViewController];

  id v14 = objc_loadWeakRetained(v10);
  [v14 setPresentingViewController:v13];

  id v15 = objc_loadWeakRetained(v10);
  [v15 setDismissalOperation:0];

  if (!v13
    || (id v16 = objc_loadWeakRetained(v10),
        [v16 avPlayerViewController],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    id v22 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1108_cold_1(v13 == 0, v22, v10);
      if (!v8) {
        goto LABEL_11;
      }
    }
    else if (!v8)
    {
      goto LABEL_11;
    }
    v8[2](v8, 0);
    goto LABEL_11;
  }

  id v18 = objc_loadWeakRetained(v10);
  id v19 = [v18 avPlayerViewController];
  id v20 = [v19 presentingViewController];

  if (v20)
  {
    uint64_t v21 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Not presenting AVPlayerViewController since it is already being presented", v28, 2u);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1109;
    aBlock[3] = &unk_1E6DF3DD0;
    id v30 = v8;
    id v23 = _Block_copy(aBlock);
    id v24 = objc_loadWeakRetained(v10);
    id v25 = [v24 avPlayerViewController];
    [v13 presentViewController:v25 animated:1 completion:v23];
  }
  id v9 = @"Showing video full screen";
LABEL_11:
  id v26 = objc_loadWeakRetained(v10);
  [v26 _resetAutoPlayBingeWatchingQualifications];

  return v9;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1109(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1110(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"CompletionKey"];
  id v9 = [v7 currentState];

  id v10 = +[VUITVAppLauncher sharedInstance];
  id v11 = [v10 appController];

  BOOL v12 = [v11 navigationController];
  unint64_t v13 = [v12 topViewController];

  id v14 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v14);
  [WeakRetained setPresentingViewController:v13];

  id v16 = objc_loadWeakRetained(v14);
  [v16 setDismissalOperation:0];

  if (!v13
    || (id v17 = objc_loadWeakRetained(v14),
        [v17 avPlayerViewController],
        id v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    id v23 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1108_cold_1(v13 == 0, v23, v14);
      if (!v8) {
        goto LABEL_11;
      }
    }
    else if (!v8)
    {
      goto LABEL_11;
    }
    v8[2](v8, 0);
    goto LABEL_11;
  }

  id v19 = objc_loadWeakRetained(v14);
  id v20 = [v19 avPlayerViewController];
  uint64_t v21 = [v20 presentingViewController];

  if (v21)
  {
    id v22 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Not presenting AVPlayerViewController since it is already being presented", v29, 2u);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1111;
    aBlock[3] = &unk_1E6DF3DD0;
    id v31 = v8;
    id v24 = _Block_copy(aBlock);
    id v25 = objc_loadWeakRetained(v14);
    id v26 = [v25 avPlayerViewController];
    [v13 presentViewController:v26 animated:1 completion:v24];
  }
  id v9 = @"Showing extras video full screen outside extras content";
LABEL_11:
  id v27 = objc_loadWeakRetained(v14);
  [v27 _resetAutoPlayBingeWatchingQualifications];

  return v9;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1111(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1112(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = [v7 currentState];
  id v10 = [v8 objectForKey:@"IsRestoringUserInterfaceDueToAirPlayStart"];

  char v11 = [v10 BOOLValue];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v13 = [WeakRetained activePlayer];
  uint64_t v14 = [v13 externalPlaybackType];

  id v15 = sLogObject_5;
  BOOL v16 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v14 != 1 || (v11 & 1) != 0)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Stopping playback because picture in picture is ending without going back to fullscreen playback", buf, 2u);
    }
    id v18 = objc_loadWeakRetained((id *)(a1 + 40));
    id v19 = [v18 stateMachine];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1114;
    v21[3] = &unk_1E6DF3DD0;
    id v17 = &v22;
    id v22 = *(id *)(a1 + 32);
    [v19 executeBlockAfterCurrentStateTransition:v21];

    id v9 = @"Not showing anything";
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "AirPlay was started while in PIP mode.  Restoring full screen user interface by manually posting PIP events", buf, 2u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1113;
    v23[3] = &unk_1E6DF3D58;
    id v17 = &v24;
    id v24 = v7;
    [v24 executeBlockAfterCurrentStateTransition:v23];
  }

  return v9;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1113(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v13 = @"IsRestoringUserInterfaceDueToAirPlayStart";
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v14[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v2 postEvent:@"Restore user interface for picture in picture stop" withContext:0 userInfo:v4];

  id v5 = *(void **)(a1 + 32);
  char v11 = @"IsRestoringUserInterfaceDueToAirPlayStart";
  uint64_t v12 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 postEvent:@"Will stop picture in picture" withContext:0 userInfo:v6];

  id v7 = *(void **)(a1 + 32);
  id v9 = @"IsRestoringUserInterfaceDueToAirPlayStart";
  uint64_t v10 = v3;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 postEvent:@"Did stop picture in picture" withContext:0 userInfo:v8];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1115(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"IsRestoringUserInterfaceDueToAirPlayStart"];
  char v9 = [v8 BOOLValue];

  uint64_t v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = [WeakRetained activePlayer];
  uint64_t v13 = [v12 externalPlaybackType];

  uint64_t v14 = sLogObject_5;
  BOOL v15 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v13 != 1 || (v9 & 1) != 0)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Stopping playback because picture in picture is ending without going back to fullscreen playback", buf, 2u);
    }
    id v17 = objc_loadWeakRetained(v10);
    id v18 = [v17 extrasPlayer];
    [v18 stop];

    id v16 = objc_loadWeakRetained(v10);
    [v16 setExtrasAVPlayerViewController:0];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "AirPlay was started while in PIP mode.  Restoring full screen user interface by manually posting PIP events", buf, 2u);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1116;
    v21[3] = &unk_1E6DF3D58;
    id v22 = v7;
    [v22 executeBlockAfterCurrentStateTransition:v21];
    id v16 = v22;
  }

  id v19 = [v7 currentState];

  return v19;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1116(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v13 = @"IsRestoringUserInterfaceDueToAirPlayStart";
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v14[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v2 postEvent:@"Restore user interface for picture in picture stop" withContext:0 userInfo:v4];

  id v5 = *(void **)(a1 + 32);
  char v11 = @"IsRestoringUserInterfaceDueToAirPlayStart";
  uint64_t v12 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 postEvent:@"Will stop picture in picture" withContext:0 userInfo:v6];

  id v7 = *(void **)(a1 + 32);
  char v9 = @"IsRestoringUserInterfaceDueToAirPlayStart";
  uint64_t v10 = v3;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 postEvent:@"Did stop picture in picture" withContext:0 userInfo:v8];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1117(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 currentState];
  id v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Finished restoring to full screen from picture in picture, updating extras", v33, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained avPlayerViewController];
  id v7 = [v6 view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v13 = [v12 extrasContext];
  if (objc_msgSend(v13, "shouldExtrasBeVisibleForSize:", v9, v11))
  {
    uint64_t v14 = +[VUIInterfaceFactory sharedInstance];
    BOOL v15 = [v14 groupActivitiesManager];
    uint64_t v16 = [v15 isSessionActive] ^ 1;
  }
  else
  {
    uint64_t v16 = 0;
  }

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  [v17 _setExtrasButtonVisible:v16];

  id v18 = objc_loadWeakRetained((id *)(a1 + 40));
  id v19 = [v18 featureMonitor];
  id v20 = [v19 featuresForType:2];
  uint64_t v21 = [v20 firstObject];

  if (v21)
  {
    if ([v21 isActive])
    {
      id v22 = objc_loadWeakRetained((id *)(a1 + 40));
      int v23 = [v22 configuredPostPlay];

      if (v23)
      {
        id v24 = objc_loadWeakRetained((id *)(a1 + 40));
        id v25 = [v24 postPlayView];
        if (v25)
        {
        }
        else
        {
          id v26 = objc_loadWeakRetained((id *)(a1 + 40));
          int v27 = [v26 _isNewPostPlayEnabled];

          if (!v27) {
            goto LABEL_15;
          }
        }
        id v28 = objc_loadWeakRetained((id *)(a1 + 40));
        id v29 = [v28 avPlayerViewController];
        id v30 = [v29 view];

        if (v30)
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

          uint64_t v3 = @"Showing video full screen with post play content on screen";
        }
      }
    }
  }
LABEL_15:
  id v31 = objc_loadWeakRetained((id *)(a1 + 40));
  [v31 _removeMoreInfoViewControllerIfNeeded];

  return v3;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1118(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  double v10 = [a2 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v12 = [WeakRetained activePlayer];

  if (v12 == v9)
  {
    uint64_t v13 = [v8 objectForKey:*MEMORY[0x1E4FAA3C8]];
    uint64_t v14 = [MEMORY[0x1E4FA9D88] stopped];

    if (v13 == v14)
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v16 = [v15 stateMachine];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1119;
      v18[3] = &unk_1E6DF3DD0;
      id v19 = *(id *)(a1 + 32);
      [v16 executeBlockAfterCurrentStateTransition:v18];

      double v10 = @"Not showing anything";
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return v10;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1119(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1120(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:*MEMORY[0x1E4FAA3C8]];
  id v9 = [v7 currentState];
  uint64_t v10 = [MEMORY[0x1E4FA9D88] loading];
  if (v8 == (void *)v10)
  {
  }
  else
  {
    double v11 = (void *)v10;
    id v12 = [MEMORY[0x1E4FA9D88] playing];

    if (v8 != v12) {
      goto LABEL_6;
    }
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1121;
  v14[3] = &unk_1E6DF3DD0;
  id v15 = *(id *)(a1 + 32);
  [v7 executeBlockAfterCurrentStateTransition:v14];

  id v9 = @"Showing video full screen";
LABEL_6:

  return v9;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1122(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a2;
  id v7 = [a5 objectForKey:*MEMORY[0x1E4FAA3C8]];
  id v8 = [v6 currentState];
  id v9 = [MEMORY[0x1E4FA9D88] stopped];

  if (v7 == v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1125;
    void v11[3] = &unk_1E6DF3D58;
    id v12 = v6;
    [v12 executeBlockAfterCurrentStateTransition:v11];
  }
  return v8;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1125(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Post play hide playback"];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1126(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v10 objectForKey:*MEMORY[0x1E4FAA3C8]];
  id v12 = [v8 currentState];
  uint64_t v13 = [v8 currentState];
  int v14 = [v13 isEqualToString:@"Showing long loading dialog"];

  if (v14)
  {
    id v15 = [v10 objectForKey:@"DidMainPlayerJustCompleteInitialLoadingKey"];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      id v17 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Player just completed initial loading; dismissing long loading dialog",
          buf,
          2u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      id v19 = [WeakRetained longLoadingAlertController];
      id v20 = [v19 presentingViewController];
      [v20 dismissViewControllerAnimated:1 completion:0];

      id v21 = objc_loadWeakRetained((id *)(a1 + 64));
      [v21 setLongLoadingAlertController:0];

      id v12 = @"Showing video full screen";
    }
  }
  id v22 = [MEMORY[0x1E4FA9D88] stopped];

  if (v11 == v22)
  {
    id v25 = objc_loadWeakRetained((id *)(a1 + 64));
    id v26 = [v25 mainPlayer];

    id v27 = objc_loadWeakRetained((id *)(a1 + 64));
    id v28 = v27;
    if (v26 != v9)
    {
      id v29 = [v27 extrasPlayer];

      if (v29 != v9) {
        goto LABEL_41;
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v24 = (uint64_t)v12;
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    uint64_t v24 = [v27 savedErrorContext];

    id v40 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v41 = [v40 savedErrorUserInfo];

    id v42 = [v8 currentState];
    locationa = (id *)v41;
    if ([v42 isEqualToString:@"Showing long loading dialog"])
    {

      if (v24 | v41)
      {
        id v43 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v43, OS_LOG_TYPE_DEFAULT, "An error occurred while the long loading dialog is being presented.  Not dismissing player", buf, 2u);
        }
LABEL_29:

        goto LABEL_40;
      }
    }
    else
    {
    }
    if (!v10
      || ([v10 objectForKeyedSubscript:*MEMORY[0x1E4FAA3B8]],
          id v44 = objc_claimAutoreleasedReturnValue(),
          id v45 = (void *)*MEMORY[0x1E4FAA220],
          v44,
          v44 != v45))
    {
      id v46 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v46, OS_LOG_TYPE_DEFAULT, "Will dismiss AVPlayerViewController controller since playback has stopped", buf, 2u);
      }
      id v47 = objc_loadWeakRetained((id *)(a1 + 64));
      id v48 = [v47 stateMachine];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1127;
      v67[3] = &unk_1E6DF3DD0;
      id v68 = *(id *)(a1 + 32);
      [v48 executeBlockAfterCurrentStateTransition:v67];

      id v12 = @"Not showing anything";
    }
    goto LABEL_29;
  }
  uint64_t v23 = [MEMORY[0x1E4FA9D88] playing];
  if (v11 == (void *)v23)
  {
    id v30 = objc_loadWeakRetained((id *)(a1 + 64));
    id v31 = [v30 mainPlayer];

    if (v31 != v9) {
      goto LABEL_41;
    }
    id v32 = objc_loadWeakRetained((id *)(a1 + 64));
    id v33 = [v32 featureMonitor];
    [v33 featuresForType:2];
    v34 = id location = (id *)(a1 + 64);
    uint64_t v24 = [v34 firstObject];

    id v35 = (id *)(a1 + 64);
    int v36 = objc_loadWeakRetained((id *)(a1 + 64));
    if ([v36 configuredPostPlay] && v24 && objc_msgSend((id)v24, "isActive"))
    {
      id v37 = [v8 currentState];

      if (v37 == @"Showing video full screen with post play content on screen")
      {
        id v35 = (id *)(a1 + 64);
        goto LABEL_36;
      }
      id v35 = (id *)(a1 + 64);
      id v38 = objc_loadWeakRetained(location);
      id v39 = [v38 postPlayView];
      if (v39)
      {
      }
      else
      {
        id v49 = objc_loadWeakRetained(location);
        int v50 = [v49 _isNewPostPlayEnabled];

        id v35 = (id *)(a1 + 64);
        if (!v50) {
          goto LABEL_36;
        }
      }
      id v51 = objc_loadWeakRetained(v35);
      id v52 = [v51 avPlayerViewController];
      int v36 = [v52 view];

      if (v36)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        id v12 = @"Showing video full screen with post play content on screen";
      }
      id v35 = (id *)(a1 + 64);
    }

LABEL_36:
    id v53 = objc_loadWeakRetained(v35);
    id v54 = [v53 mainPlayer];
    id v55 = [v54 currentMediaItem];
    [v53 _showShareMediaMenuForMediaItem:v55];

    id v56 = objc_loadWeakRetained(location);
    if ([v56 _shouldShowPerformanceDebugger])
    {
      id v57 = objc_loadWeakRetained(location);
      char v58 = [v57 hasPerformanceDebuggerAppeared];

      if (v58) {
        goto LABEL_40;
      }
      id v64 = objc_loadWeakRetained(location);
      BOOL v59 = [v64 mainPlayer];
      id v60 = [v59 currentMediaItem];
      id v56 = [v60 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];

      id v61 = objc_loadWeakRetained(location);
      [v61 _setupPerformanceDebugger:v56];

      id v62 = objc_loadWeakRetained(location);
      [v62 setHasPerformanceDebuggerAppeared:1];
    }
    goto LABEL_40;
  }
  uint64_t v24 = v23;
LABEL_40:

LABEL_41:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  return v12;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1127(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1128(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1131(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v13);
  id v15 = [WeakRetained activePlayer];

  if (v15 != v11) {
    goto LABEL_4;
  }
  int v16 = [v12 objectForKey:*MEMORY[0x1E4FAA3C8]];
  id v17 = [MEMORY[0x1E4FA9D88] stopped];

  if (v16 != v17)
  {

LABEL_4:
    id v18 = [v9 currentState];
    goto LABEL_5;
  }
  id v20 = objc_loadWeakRetained(v13);
  id v21 = [v20 mainAVPlayerViewController];
  [v20 setAvPlayerViewController:v21];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1132;
  v22[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v23, v13);
  [v9 executeBlockAfterCurrentStateTransition:v22];
  objc_destroyWeak(&v23);

  id v18 = @"Showing Extras content";
LABEL_5:

  return v18;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1132(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained backgroundAudioPlayer];
  [v1 play];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1133(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1136(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1139(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v12 = [WeakRetained activePlayer];

  if (v12 == v10)
  {
    uint64_t v13 = [v9 objectForKey:*MEMORY[0x1E4FAA3C8]];
    int v14 = [MEMORY[0x1E4FA9D88] stopped];

    if (v13 == v14)
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 48));
      int v16 = [v15 stateMachine];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1140;
      v19[3] = &unk_1E6DF3DD0;
      id v20 = *(id *)(a1 + 32);
      [v16 executeBlockAfterCurrentStateTransition:v19];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v17 = [v8 currentState];

  return v17;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1141(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = [a5 objectForKey:*MEMORY[0x1E4FAA3C8]];
  id v11 = v9;
  id v12 = [MEMORY[0x1E4FA9D88] stopped];
  if (v10 == v12)
  {
    uint64_t v13 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v14 = [v13 applicationState];

    if (v14 != 2)
    {
      id v27 = (id *)(a1 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v18 = [WeakRetained _multiviewInfoForPlayer:v11];

      id v29 = [v18 playerViewController];

      if (v29)
      {
        id v30 = objc_loadWeakRetained(v27);
        id v31 = [v30 multiPlayerViewController];
        id v32 = [v18 playerViewController];
        [v31 removePlayerViewController:v32 animated:1 completion:0];
      }
      id v33 = [v18 player];
      [v33 invalidate];

      id v34 = [MEMORY[0x1E4F1CA60] dictionary];
      id v35 = [v18 player];

      if (v35)
      {
        int v36 = [v18 player];
        [v34 setObject:v36 forKey:VUIPlaybackManagerNotificationKeyPlayer[0]];
      }
      id v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v38 = (void *)[v34 copy];
      [v37 postNotificationName:@"VUIMultiviewPlayerDidStopNotification" object:0 userInfo:v38];

      id v39 = objc_loadWeakRetained(v27);
      id v40 = [v39 multiviewPlaybackInfo];
      [v40 removeObject:v18];

      uint64_t v41 = [v18 player];

      if (v41)
      {
        id v42 = +[VUIInterfaceFactory sharedInstance];
        id v43 = [v42 playbackEndManager];
        id v44 = [v18 player];
        [v43 remove:v44];
      }
      id v45 = objc_loadWeakRetained(v27);
      [v45 _updateMultiviewReportingMetrics];

      goto LABEL_18;
    }
  }
  else
  {
  }
  id v15 = [MEMORY[0x1E4FA9D88] playing];

  if (v10 == v15)
  {
    id v21 = (id *)(a1 + 32);
    id v22 = objc_loadWeakRetained(v21);
    [v22 _updateMultiviewReportingMetrics];

    id v23 = objc_loadWeakRetained(v21);
    id v24 = [v23 mainPlayer];

    if (v24 != v11) {
      goto LABEL_19;
    }
    id v18 = objc_loadWeakRetained(v21);
    id v25 = [v18 mainPlayer];
    id v26 = [v25 currentMediaItem];
    [v18 _showShareMediaMenuForMediaItem:v26];
  }
  else
  {
    int v16 = [MEMORY[0x1E4FA9D88] paused];

    if (v10 != v16) {
      goto LABEL_19;
    }
    id v17 = objc_loadWeakRetained((id *)(a1 + 32));
    id v18 = [v17 _multiviewInfoForPlayer:v11];

    if ([v18 pausedDueToInterruption])
    {
      id v19 = [v18 player];
      uint64_t v20 = [v19 externalPlaybackType];

      if (v20)
      {
        [v11 play];
        [v18 setPausedDueToInterruption:0];
      }
    }
  }
LABEL_18:

LABEL_19:
  id v46 = [v8 currentState];

  return v46;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1142(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained avPlayerViewController];
  id v6 = [v5 view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = [v11 extrasContext];
  LODWORD(v5) = objc_msgSend(v12, "shouldExtrasBeVisibleForSize:", v8, v10);

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    uint64_t v3 = @"Showing Extras content";
  }
  else
  {
    uint64_t v13 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Not showing Extras because they cannot be displayed for the current view size", v15, 2u);
    }
  }
  return v3;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1143(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v15 = [WeakRetained stateMachine];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1144;
  id v22 = &unk_1E6DF6510;
  id v16 = v12;
  id v23 = v16;
  objc_copyWeak(&v24, v13);
  [v15 executeBlockAfterCurrentStateTransition:&v19];

  id v17 = objc_msgSend(v9, "currentState", v19, v20, v21, v22);
  objc_destroyWeak(&v24);

  return v17;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1144(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) objectForKey:@"MenuItemElementKey"];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"MenuItemIndexKey"];
  uint64_t v3 = [v2 unsignedIntegerValue];

  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained extrasContext];
  uint64_t v7 = [v6 selectedMainMenuIndex];

  if (v3 != v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 extrasContext];
    [v9 setClearsStackOnNextPush];

    id v10 = objc_loadWeakRetained(v4);
    id v11 = [v10 extrasContext];
    [v11 setSelectedMainMenuIndex:v3];

    [v12 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1145(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKey:@"ExtrasShouldBeVisibleKey"];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v9) {
      id v11 = @"YES";
    }
    int v15 = 138412290;
    id v16 = v11;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Extras should be visible?  %@", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setExtrasButtonVisible:v9];

  uint64_t v13 = [v7 currentState];

  return v13;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1146(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKey:@"ExtrasShouldBeVisibleKey"];
  int v9 = [v8 BOOLValue];

  id v10 = [v7 currentState];

  id v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = @"NO";
    if (v9) {
      id v12 = @"YES";
    }
    int v25 = 138412290;
    id v26 = v12;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Extras should be visible?  %@", (uint8_t *)&v25, 0xCu);
  }
  uint64_t v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v14 = [v13 applicationState];

  if (v14 == 2)
  {
    int v15 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring Extras visibility update since app is backgrounded.", (uint8_t *)&v25, 2u);
    }
  }
  else if (v9)
  {
    id v16 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained(v16);
    id v18 = [WeakRetained backgroundAudioPlayer];
    uint64_t v19 = [v18 state];
    uint64_t v20 = [MEMORY[0x1E4FA9D88] paused];

    if (v19 == v20)
    {
      id v21 = objc_loadWeakRetained(v16);
      id v22 = [v21 backgroundAudioPlayer];
      [v22 play];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v23 = objc_loadWeakRetained((id *)(a1 + 40));
    [v23 _setExtrasButtonVisible:0];

    id v10 = @"Showing video full screen";
  }
  return v10;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1147(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKey:@"ExtrasShouldBeVisibleKey"];
  int v9 = [v8 BOOLValue];

  id v10 = [v7 currentState];
  id v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = @"NO";
    if (v9) {
      id v12 = @"YES";
    }
    int v18 = 138412290;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Extras should be visible?  %@", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v14 = [v13 applicationState];

  if (v14 == 2)
  {
    int v15 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring Extras visibility update since app is backgrounded.", (uint8_t *)&v18, 2u);
    }
  }
  else if ((v9 & 1) == 0)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
    {

      id v10 = @"Showing extras video picture in picture outside extras content";
    }
    else
    {
      uint64_t v16 = [v7 currentState];

      id v10 = (__CFString *)v16;
    }
  }

  return v10;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1148(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v14 = [WeakRetained stateMachine];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1149;
  v17[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  [v14 executeBlockAfterCurrentStateTransition:v17];

  int v15 = [v9 currentState];
  objc_destroyWeak(&v18);

  return v15;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1149(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExtrasControlItem:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _mainPlayerViewControllerSetupControlItems];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setExtrasContext:0];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1150(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v15 = [WeakRetained stateMachine];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1151;
  v17[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v18, v13);
  [v15 executeBlockAfterCurrentStateTransition:v17];

  objc_destroyWeak(&v18);
  return @"Showing video full screen";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1151(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExtrasControlItem:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _mainPlayerViewControllerSetupControlItems];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setExtrasContext:0];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1152(uint64_t a1)
{
  return @"Showing video full screen";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1153(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained extrasPlayer];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  id v5 = objc_loadWeakRetained(v2);
  [v5 setExtrasPlayer:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 setExtrasAVPlayerViewController:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return @"Showing video full screen";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1154(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKey:@"IsBackgroundPlaybackKey"];
  LODWORD(a4) = [v13 BOOLValue];

  uint64_t v14 = [v12 objectForKey:@"PlaylistKey"];
  int v15 = [v9 currentState];
  uint64_t v16 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v18 = WeakRetained;
  if (a4)
  {
    uint64_t v19 = [WeakRetained backgroundAudioPlayer];

    if (!v19)
    {
      uint64_t v19 = [[VUIPlayer alloc] initWithName:@"Background audio player"];
      [(TVPPlayer *)v19 setReportingValueWithString:@"background" forKey:@"initiator"];
      id v20 = objc_loadWeakRetained(v16);
      [v20 setBackgroundAudioPlayer:v19];
    }
    id v21 = objc_loadWeakRetained(v16);
    uint64_t v22 = [v21 mainPlayer];
    -[TVPPlayer setAllowsCellularUsage:](v19, "setAllowsCellularUsage:", [(id)v22 allowsCellularUsage]);

    [v14 setRepeatMode:1];
    id v23 = [(TVPPlayer *)v19 playlist];
    LOBYTE(v22) = [v14 isEqualToPlaylist:v23];

    if ((v22 & 1) == 0) {
      [(TVPPlayer *)v19 setPlaylist:v14];
    }
    [(TVPPlayer *)v19 play];
  }
  else
  {
    id v45 = v15;
    id v24 = [WeakRetained activePlayer];
    [v24 stop];

    id v25 = objc_loadWeakRetained((id *)(a1 + 48));
    id v26 = [v25 backgroundAudioPlayer];
    [v26 stop];

    id v27 = objc_loadWeakRetained((id *)(a1 + 48));
    id v28 = [v27 extrasPlayer];

    if (!v28)
    {
      id v28 = [[VUIPlayer alloc] initWithName:@"Extras player"];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      [(TVPPlayer *)v28 setErrorBehavior:2];
      [(TVPPlayer *)v28 setReportingValueWithString:@"fullscreen" forKey:@"initiator"];
      id v29 = objc_loadWeakRetained((id *)(a1 + 48));
      [v29 setExtrasPlayer:v28];
    }
    id v30 = objc_loadWeakRetained((id *)(a1 + 48));
    id v31 = [v30 mainPlayer];
    -[TVPPlayer setAllowsCellularUsage:](v28, "setAllowsCellularUsage:", [v31 allowsCellularUsage]);

    id v46 = v14;
    [(TVPPlayer *)v28 setPlaylist:v14];
    id v32 = [v12 objectForKey:@"PresentingViewControllerKey"];
    id v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      id v35 = objc_loadWeakRetained((id *)(a1 + 48));
      [v35 extrasContext];
      uint64_t v44 = a1;
      id v36 = v12;
      id v37 = v11;
      id v38 = v10;
      id v40 = v39 = v9;
      id v34 = [v40 extrasRootViewController];

      id v9 = v39;
      id v10 = v38;
      id v11 = v37;
      id v12 = v36;
      a1 = v44;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v41 = objc_loadWeakRetained(v16);
    id v42 = [v41 stateMachine];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1161;
    v47[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v48, v16);
    [v42 executeBlockAfterCurrentStateTransition:v47];

    objc_destroyWeak(&v48);
    int v15 = @"Waiting for Extras AVPlayerViewController presentation to complete";
    uint64_t v14 = v46;
  }

  return v15;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1161(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained extrasPlayer];
  id v4 = [v3 currentMediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v5 addEndEventWithName:*MEMORY[0x1E4FAA388]];

  id v6 = objc_loadWeakRetained(v1);
  id v7 = [v6 extrasPlayer];
  [v6 setActivePlayer:v7];

  id v9 = objc_loadWeakRetained(v1);
  id v8 = [v9 extrasPlayer];
  [v8 play];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1162(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKey:@"IsBackgroundPlaybackKey"];
  LOBYTE(a4) = [v13 BOOLValue];

  uint64_t v14 = [v9 currentState];
  if ((a4 & 1) == 0)
  {
    int v15 = [v12 objectForKey:@"PlaylistKey"];
    uint64_t v41 = a1;
    uint64_t v16 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v18 = [WeakRetained extrasPlayer];
    uint64_t v19 = [v18 playlist];
    uint64_t v44 = [v19 currentMediaItem];

    id v42 = [v15 currentMediaItem];
    id v20 = objc_loadWeakRetained(v16);
    id v21 = [v20 extrasPlayer];
    uint64_t v22 = [v21 playlist];
    id v43 = v15;
    LODWORD(v15) = [v15 isEqualToPlaylist:v22];

    if (!v15) {
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v23 = v42;
    id v24 = [v44 clipTimeRange];
    id v25 = [v23 clipTimeRange];

    LODWORD(v23) = [v24 isEqual:v25];
    if (!v23)
    {
LABEL_9:
      id v40 = v11;
      id v29 = objc_loadWeakRetained(v16);
      id v30 = [v29 backgroundAudioPlayer];
      [v30 stop];

      id v31 = objc_loadWeakRetained(v16);
      id v27 = [v31 extrasPlayer];

      [v27 stop];
      [v27 setPlaylist:v43];
      id v32 = [v12 objectForKey:@"PresentingViewControllerKey"];
      id v33 = v32;
      if (v32)
      {
        id v28 = v32;
      }
      else
      {
        id v34 = objc_loadWeakRetained(v16);
        [v34 extrasContext];
        v36 = id v35 = v10;
        id v28 = [v36 extrasRootViewController];

        id v10 = v35;
      }

      (*(void (**)(void))(*(void *)(v41 + 32) + 16))();
      id v37 = objc_loadWeakRetained(v16);
      id v38 = [v37 stateMachine];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1164;
      v45[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v46, v16);
      [v38 executeBlockAfterCurrentStateTransition:v45];

      objc_destroyWeak(&v46);
      uint64_t v14 = @"Waiting for Extras AVPlayerViewController presentation to complete";
      id v11 = v40;
    }
    else
    {
LABEL_6:
      id v26 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Content is already being played in PIP.  Calling stopPictureInPicture to restore to fullscreen", buf, 2u);
      }
      id v27 = objc_loadWeakRetained(v16);
      id v28 = [v27 extrasAVPlayerViewController];
      [v28 stopPictureInPicture];
    }
  }
  return v14;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1164(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained extrasPlayer];
  id v4 = [v3 currentMediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v5 addEndEventWithName:*MEMORY[0x1E4FAA388]];

  id v6 = objc_loadWeakRetained(v1);
  id v7 = [v6 extrasPlayer];
  [v6 setActivePlayer:v7];

  id v9 = objc_loadWeakRetained(v1);
  id v8 = [v9 extrasPlayer];
  [v8 play];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1165(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Error occurred while view controller is being presented.  Will present error dialog when presentation completes", v17, 2u);
  }
  id v12 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v12);
  [WeakRetained setSavedErrorContext:v9];

  id v14 = objc_loadWeakRetained(v12);
  [v14 setSavedErrorUserInfo:v10];

  int v15 = [v8 currentState];

  return v15;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1166(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Error occurred while long loading dialog is being presented.  Will present error dialog when dialog is dismissed", v17, 2u);
  }
  id v12 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v12);
  [WeakRetained setSavedErrorContext:v9];

  id v14 = objc_loadWeakRetained(v12);
  [v14 setSavedErrorUserInfo:v10];

  int v15 = [v8 currentState];

  return v15;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1167(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4FAA3E8]];
  int v14 = [v13 BOOLValue];

  int v15 = [v9 currentState];
  uint64_t v16 = [v9 currentState];
  int v17 = [v16 isEqualToString:@"Showing video full screen with post play content on screen"];

  if (v17)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v19 = [WeakRetained featureMonitor];
    [v19 removeFeaturesMatching:&unk_1F3F3E210];

    int v15 = @"Showing video full screen";
  }
  id v20 = (id *)(a1 + 40);
  id v21 = objc_loadWeakRetained(v20);
  id v22 = [v21 activePlayer];
  if (v22 == v11) {
    int v23 = v14;
  }
  else {
    int v23 = 0;
  }

  if (v23 == 1)
  {
    id v37 = v11;
    id v38 = v10;
    id v24 = [v12 objectForKey:*MEMORY[0x1E4FAA260]];
    id v25 = objc_loadWeakRetained(v20);
    id v26 = [v25 activePlayer];
    id v27 = [v26 currentMediaItem];
    id v28 = [v27 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v28 addSingleShotEventWithName:*MEMORY[0x1E4FAA350] value:*MEMORY[0x1E4FAA398]];

    id v29 = [v9 currentState];
    int v30 = [v29 isEqualToString:@"Showing main video picture in picture"];
    id v31 = @"Showing error message on playback UI";
    if (v30) {
      id v31 = @"Showing error message without playback UI";
    }
    id v32 = v31;

    id v33 = objc_loadWeakRetained(v20);
    id v34 = [v33 stateMachine];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1171;
    v39[3] = &unk_1E6DF64E8;
    id v35 = v24;
    id v40 = v35;
    objc_copyWeak(&v42, v20);
    int v15 = v32;
    uint64_t v41 = v15;
    [v34 executeBlockAfterCurrentStateTransition:v39];

    objc_destroyWeak(&v42);
    id v11 = v37;
    id v10 = v38;
  }

  return v15;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1171(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1410];
  id v3 = +[VUILocalizationManager sharedInstance];
  id v4 = [v3 localizedStringForKey:@"OK"];
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1172;
  v108[3] = &unk_1E6DF78B8;
  id v109 = *(id *)(a1 + 32);
  from = (id *)(a1 + 48);
  objc_copyWeak(v110, (id *)(a1 + 48));
  id v5 = [v2 actionWithTitle:v4 style:0 handler:v108];

  uint64_t v84 = a1;
  id v6 = [*(id *)(a1 + 32) domain];
  LODWORD(v2) = [v6 isEqualToString:@"TVPlaybackErrorDomain"];

  if (!v2)
  {
    id v22 = 0;
    id v23 = 0;
    id v21 = 0;
    BOOL v83 = 0;
    id v8 = 0;
    goto LABEL_5;
  }
  id v7 = [*(id *)(a1 + 32) userInfo];
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F28568]];

  id v9 = [*(id *)(a1 + 32) userInfo];
  id v10 = [v9 objectForKey:*MEMORY[0x1E4F285A0]];

  if ([*(id *)(v84 + 32) code] == 825)
  {
    id v11 = +[VUILocalizationManager sharedInstance];
    uint64_t v12 = [v11 localizedStringForKey:@"CANNOT_STREAM_VIDEO_ALERT_TITLE"];

    uint64_t v13 = +[VUILocalizationManager sharedInstance];
    BOOL v83 = [v13 localizedStringForKey:@"CANNOT_STREAM_VIDEO_ALERT_MESSAGE"];

    int v14 = (void *)MEMORY[0x1E4FB1410];
    int v15 = +[VUILocalizationManager sharedInstance];
    uint64_t v16 = [v15 localizedStringForKey:@"CANNOT_STREAM_VIDEO_ALERT_ACTION_CLOSE"];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1186;
    v106[3] = &unk_1E6DF5380;
    objc_copyWeak(&v107, from);
    uint64_t v17 = [v14 actionWithTitle:v16 style:0 handler:v106];

    id v18 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v19 = +[VUILocalizationManager sharedInstance];
    id v20 = [v19 localizedStringForKey:@"CANNOT_STREAM_VIDEO_ALERT_ACTION_SETTINGS"];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1190;
    v104[3] = &unk_1E6DF5380;
    objc_copyWeak(&v105, from);
    id v21 = [v18 actionWithTitle:v20 style:0 handler:v104];

    objc_destroyWeak(&v105);
    objc_destroyWeak(&v107);
    id v22 = 0;
    id v23 = 0;
    id v5 = (void *)v17;
    id v8 = (void *)v12;
    goto LABEL_5;
  }
  if ([*(id *)(v84 + 32) code] != 824)
  {
    if ([*(id *)(v84 + 32) code] == 827)
    {
      id v46 = +[VUILocalizationManager sharedInstance];
      BOOL v83 = [v46 localizedStringForKey:@"AIRPLAY_CANNOT_STREAM_THIS_VIDEO_FORMAT_TO_DEVICE_MESSAGE"];
    }
    else
    {
      if ([*(id *)(v84 + 32) code] == 826)
      {
        id v47 = +[VUILocalizationManager sharedInstance];
        uint64_t v81 = [v47 localizedStringForKey:@"DIGITAL_ADAPTER_COMPATIBILITY_WARNING_TITLE"];

        id v48 = +[VUILocalizationManager sharedInstance];
        BOOL v83 = [v48 localizedStringForKey:@"DIGITAL_ADAPTER_COMPATIBILITY_WARNING_BODY"];

        id v49 = (void *)MEMORY[0x1E4FB1410];
        int v50 = +[VUILocalizationManager sharedInstance];
        id v51 = [v50 localizedStringForKey:@"DIGITAL_ADAPTER_COMPATIBILITY_WARNING_ACTION_DOWNLOAD"];
        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1249;
        v96[3] = &unk_1E6DF5380;
        objc_copyWeak(&v97, from);
        id v52 = [v49 actionWithTitle:v51 style:0 handler:v96];

        id v53 = (void *)MEMORY[0x1E4FB1410];
        id v54 = +[VUILocalizationManager sharedInstance];
        id v55 = [v54 localizedStringForKey:@"DIGITAL_ADAPTER_COMPATIBILITY_WARNING_ACTION_STREAM"];
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1253;
        v94[3] = &unk_1E6DF5380;
        objc_copyWeak(&v95, from);
        id v21 = [v53 actionWithTitle:v55 style:0 handler:v94];

        id v56 = (void *)MEMORY[0x1E4FB1410];
        id v57 = +[VUILocalizationManager sharedInstance];
        char v58 = [v57 localizedStringForKey:@"DIGITAL_ADAPTER_COMPATIBILITY_WARNING_ACTION_CANCEL"];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1257;
        v92[3] = &unk_1E6DF5380;
        objc_copyWeak(&v93, from);
        id v22 = [v56 actionWithTitle:v58 style:0 handler:v92];

        id v23 = v52;
        objc_destroyWeak(&v93);
        objc_destroyWeak(&v95);
        objc_destroyWeak(&v97);
        id v5 = v23;
        id v8 = (void *)v81;
        goto LABEL_5;
      }
      if ([*(id *)(v84 + 32) code] == 808)
      {
        id WeakRetained = objc_loadWeakRetained(from);
        id v63 = [WeakRetained activePlayer];
        id v64 = [v63 currentMediaItem];
        id v36 = [v64 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

        char v65 = [v36 isEqualToString:*MEMORY[0x1E4FAA200]];
        if (MGGetBoolAnswer())
        {
          long long v66 = +[VUILocalizationManager sharedInstance];
          uint64_t v39 = [v66 localizedStringForKey:@"CONNECT_TO_WLAN_TO_WATCH_ERROR_TITLE"];

          +[VUILocalizationManager sharedInstance];
          if (v65) {
            goto LABEL_13;
          }
          goto LABEL_46;
        }
        id v78 = +[VUILocalizationManager sharedInstance];
        uint64_t v39 = [v78 localizedStringForKey:@"CONNECT_TO_WIFI_TO_WATCH_ERROR_TITLE"];

        +[VUILocalizationManager sharedInstance];
        if (v65)
        {
          id v40 = LABEL_42:;
          [v40 localizedStringForKey:@"CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"];
          goto LABEL_43;
        }
        id v40 = LABEL_47:;
        [v40 localizedStringForKey:@"CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_MOVIE"];
        goto LABEL_43;
      }
      if ([*(id *)(v84 + 32) code] == 811)
      {
        id v46 = +[VUILocalizationManager sharedInstance];
        BOOL v83 = [v46 localizedStringForKey:@"ContentNotAuthorizedErrorDescription"];
      }
      else if ([*(id *)(v84 + 32) code] == 835)
      {
        id v46 = +[VUILocalizationManager sharedInstance];
        BOOL v83 = [v46 localizedStringForKey:@"SCREEN_BEING_RECORDED_ERROR_MESSAGE_BODY"];
      }
      else if ([*(id *)(v84 + 32) code] == 830)
      {
        id v46 = +[VUILocalizationManager sharedInstance];
        BOOL v83 = [v46 localizedStringForKey:@"AIRPLAY_HLS_RENTAL_ERROR_MESSAGE_BODY"];
      }
      else if ([*(id *)(v84 + 32) code] == 831)
      {
        id v46 = +[VUILocalizationManager sharedInstance];
        BOOL v83 = [v46 localizedStringForKey:@"AIRPLAY_RENTAL_DOWNLOAD_BEFORE_USE_MESSAGE"];
      }
      else
      {
        if ([*(id *)(v84 + 32) code] != 832)
        {
          if ([*(id *)(v84 + 32) code] != 807)
          {
            id v22 = 0;
            id v23 = 0;
            id v21 = 0;
            BOOL v83 = v10;
            goto LABEL_5;
          }
          id v79 = +[VUILocalizationManager sharedInstance];
          uint64_t v39 = [v79 localizedStringForKey:@"HDCP_PROTECTION_ERROR_TITLE"];

          id v80 = +[VUILocalizationManager sharedInstance];
          BOOL v83 = [v80 localizedStringForKey:@"HDCP_PROTECTION_ERROR_BODY"];

          goto LABEL_38;
        }
        id v46 = +[VUILocalizationManager sharedInstance];
        BOOL v83 = [v46 localizedStringForKey:@"AIRPLAY_RENTAL_WAIT_FOR_DOWNLOAD_BEFORE_USE_MESSAGE"];
      }
    }

    id v22 = 0;
    id v23 = 0;
    id v21 = 0;
    goto LABEL_5;
  }
  int v29 = MGGetBoolAnswer();
  int v30 = [*(id *)(v84 + 32) userInfo];
  id v31 = [v30 objectForKey:@"TVPlaybackCellularPlaybackProhibitedErrorReasonKey"];
  uint64_t v32 = [v31 integerValue];

  if (v32 == 1)
  {
    id v33 = objc_loadWeakRetained(from);
    id v34 = [v33 activePlayer];
    id v35 = [v34 currentMediaItem];
    id v36 = [v35 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

    char v37 = [v36 isEqualToString:*MEMORY[0x1E4FAA200]];
    if (v29)
    {
      id v38 = +[VUILocalizationManager sharedInstance];
      uint64_t v39 = [v38 localizedStringForKey:@"CANT_PLAYBACK_OVER_WLAN_ERROR_TITLE"];

      +[VUILocalizationManager sharedInstance];
      if (v37)
      {
        id v40 = LABEL_13:;
        [v40 localizedStringForKey:@"CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"];
        BOOL v83 = LABEL_43:;

LABEL_38:
        id v22 = 0;
        id v23 = 0;
        id v21 = 0;
        id v8 = (void *)v39;
        goto LABEL_5;
      }
      id v40 = LABEL_46:;
      [v40 localizedStringForKey:@"CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_MOVIE"];
      goto LABEL_43;
    }
    id v77 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    uint64_t v39 = [v77 localizedStringForKey:@"CANT_PLAYBACK_OVER_CELLULAR_NETWORK_ERROR_TITLE" value:0 table:@"VideosUIEmbedded"];

    +[VUILocalizationManager sharedInstance];
    if (v37) {
      goto LABEL_42;
    }
    goto LABEL_47;
  }
  BOOL v59 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  uint64_t v60 = [v59 localizedStringForKey:@"ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_TITLE" value:0 table:@"VideosUIEmbedded"];

  objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  if (v29) {
    id v61 = {;
  }
    [v61 localizedStringForKey:@"ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WLAN" value:0 table:@"VideosUIEmbedded"];
  }
  else {
    id v61 = {;
  }
    [v61 localizedStringForKey:@"ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WIFI" value:0 table:@"VideosUIEmbedded"];
  BOOL v83 = };

  id v67 = (void *)MEMORY[0x1E4FB1410];
  id v68 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  long long v69 = [v68 localizedStringForKey:@"ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1228;
  v102[3] = &unk_1E6DF5380;
  objc_copyWeak(&v103, from);
  id v70 = [v67 actionWithTitle:v69 style:0 handler:v102];

  int v71 = (void *)MEMORY[0x1E4FB1410];
  char v72 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  id v73 = [v72 localizedStringForKey:@"USE_CELLULAR_DATA_TO_STREAM_ONCE_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1232;
  v100[3] = &unk_1E6DF5380;
  objc_copyWeak(&v101, from);
  id v21 = [v71 actionWithTitle:v73 style:0 handler:v100];

  id v74 = (void *)MEMORY[0x1E4FB1410];
  id v75 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  uint64_t v76 = [v75 localizedStringForKey:@"DONT_ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1236;
  v98[3] = &unk_1E6DF5380;
  objc_copyWeak(&v99, from);
  id v22 = [v74 actionWithTitle:v76 style:0 handler:v98];

  id v23 = v70;
  objc_destroyWeak(&v99);
  objc_destroyWeak(&v101);
  objc_destroyWeak(&v103);
  id v5 = v23;
  id v8 = (void *)v60;
LABEL_5:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1285;
  aBlock[3] = &unk_1E6DF78E0;
  id v24 = v5;
  id v86 = v24;
  id v25 = v21;
  id v87 = v25;
  id v26 = v22;
  id v88 = v26;
  id v27 = v23;
  id v89 = v27;
  objc_copyWeak(&v91, from);
  id v90 = *(id *)(v84 + 40);
  id v28 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if ([v8 length] || objc_msgSend(v83, "length"))
  {
    v28[2](v28, v8, v83);
  }
  else
  {
    id v41 = objc_loadWeakRetained(from);
    id v42 = [v41 activePlayer];

    if (v42
      && ([v42 currentMediaItem],
          id v43 = objc_claimAutoreleasedReturnValue(),
          v43,
          v43))
    {
      uint64_t v44 = +[VUIPlaybackErrorMessage sharedInstance];
      id v45 = [v42 currentMediaItem];
      [v44 getLocalizedErrorMessageFor:v45 withError:*(void *)(v84 + 32) completion:v28];
    }
    else
    {
      uint64_t v44 = +[VUILocalizationManager sharedInstance];
      id v45 = [v44 localizedStringForKey:@"AV_PLAYBACK_ERROR"];
      v28[2](v28, v8, v45);
    }
  }
  objc_destroyWeak(&v91);

  objc_destroyWeak(v110);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1172(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) domain];
  if (([v2 isEqualToString:@"TVPlaybackErrorDomain"] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v3 = [*(id *)(a1 + 32) code];

  if (v3 != 813)
  {
LABEL_5:
    id v4 = 0;
    goto LABEL_6;
  }
  id v7 = @"PerformAuthAfterDismissingErrorKey";
  v8[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
LABEL_6:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained stateMachine];
  [v6 postEvent:@"Error alert dismissed" withContext:0 userInfo:v4];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1186(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Error alert dismissed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1190(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Error alert dismissed"];

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=USAGE"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1228(uint64_t a1)
{
  uint64_t v2 = +[VUIPlaybackSettings sharedSettings];
  [v2 setCellularDataPlaybackEnabled:1];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained stateMachine];
  [v3 postEvent:@"Play using cellular data button pressed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1232(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Play using cellular data button pressed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1236(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Error alert dismissed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1249(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Download compatible video button pressed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1253(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Force streaming video button pressed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1257(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Error alert dismissed"];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1285(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a2 message:a3 preferredStyle:1];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v15, "addAction:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v15, "addAction:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v15, "addAction:");
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v15, "setPreferredAction:");
  }
  id v4 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setErrorAlertController:v15];

  if (*(__CFString **)(a1 + 64) != @"Showing error message on playback UI") {
    goto LABEL_10;
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 72));
  id v10 = [v9 avPlayerViewController];
  id v11 = [v10 view];
  uint64_t v12 = [v11 window];

  if (v12)
  {
    id v6 = objc_loadWeakRetained(v4);
    uint64_t v13 = [v6 avPlayerViewController];
    int v14 = objc_msgSend(v13, "vui_viewControllerForFullScreenPresentation");
    [v14 presentViewController:v15 animated:1 completion:0];
  }
  else
  {
LABEL_10:
    id v6 = +[VUIApplicationRouter topPresentedViewController];
    if (!v6)
    {
      id v7 = +[VUITVAppLauncher sharedInstance];
      id v8 = [v7 appWindow];

      id v6 = [v8 rootViewController];
    }
    [v6 presentViewController:v15 animated:1 completion:0];
  }
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1291(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = [a2 currentState];
  if ([v8 isEqualToString:@"Showing error message on playback UI"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v10 = [WeakRetained avPlayerViewController];
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v12 = [v11 extrasAVPlayerViewController];

    if (v10 == v12)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
  }
  int v14 = [v7 objectForKey:@"PerformAuthAfterDismissingErrorKey"];
  char v15 = [v14 BOOLValue];

  uint64_t v16 = [v7 objectForKey:@"StartDownloadAfterDismissingDialogKey"];
  char v17 = [v16 BOOLValue];

  id v18 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v19 = [v18 activePlayer];
  id v20 = [v19 currentMediaItem];

  id v21 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Will dismiss AVPlayerViewController since error alert has been dismissed", buf, 2u);
  }
  id v22 = objc_loadWeakRetained((id *)(a1 + 56));
  id v23 = [v22 stateMachine];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1292;
  v27[3] = &unk_1E6DF7950;
  id v29 = *(id *)(a1 + 40);
  char v31 = v15;
  char v32 = v17;
  id v30 = *(id *)(a1 + 48);
  id v28 = v20;
  id v24 = v20;
  [v23 executeBlockAfterCurrentStateTransition:v27];

  uint64_t v13 = @"Not showing anything";
LABEL_8:
  id v25 = objc_loadWeakRetained((id *)(a1 + 56));
  [v25 setErrorAlertController:0];

  return v13;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1292(uint64_t a1)
{
  uint64_t v2 = +[VUIAppReviewManager sharedInstance];
  [v2 isFeatureEnabled:&__block_literal_global_1296];

  +[VideosUI markLastPlaybackEventasError];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1298;
  v4[3] = &unk_1E6DF7928;
  __int16 v7 = *(_WORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, void *))(v3 + 16))(v3, 1, 1, 0, 1, 1, 1, v4);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1294(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = +[VUIAppReviewManager sharedInstance];
    [v2 setLastPlaybackEvent:1];
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1298(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v1 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v1, OS_LOG_TYPE_DEFAULT, "Performing auth", buf, 2u);
    }
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:1 withCompletionHandler:&__block_literal_global_1302];
  }
  else if (*(unsigned char *)(a1 + 49))
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1303;
    v4[3] = &unk_1E6DF41E8;
    id v6 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1303(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1304(uint64_t a1, void *a2)
{
  id v2 = a2;
  dispatch_time_t v3 = +[VUIPlaybackSettings sharedSettings];
  [v3 setPreferAVAdapterCompatibility:1];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1307;
  v7[3] = &unk_1E6DF3D58;
  id v8 = v2;
  id v4 = v2;
  [v4 executeBlockAfterCurrentStateTransition:v7];
  id v5 = [v4 currentState];

  return v5;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1307(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = @"StartDownloadAfterDismissingDialogKey";
  v4[0] = MEMORY[0x1E4F1CC38];
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [*(id *)(a1 + 32) postEvent:@"Error alert dismissed" withContext:0 userInfo:v2];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1308(id *a1)
{
  id v2 = +[VUIPlaybackSettings sharedSettings];
  [v2 setPreferAVAdapterCompatibility:1];

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v4 = [WeakRetained activePlayer];
  id v5 = [v4 currentMediaItem];
  [v5 setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4FA9F10]];

  id v6 = objc_loadWeakRetained(a1);
  __int16 v7 = [v6 activePlayer];
  [v7 play];

  return @"Showing video full screen";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1309(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  int v14 = [WeakRetained mainPlayer];
  [v14 setAllowsCellularUsage:1];

  id v15 = objc_loadWeakRetained(a1);
  uint64_t v16 = [v15 extrasPlayer];
  [v16 setAllowsCellularUsage:1];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1310;
  v18[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v19, a1);
  [v9 executeBlockAfterCurrentStateTransition:v18];
  objc_destroyWeak(&v19);

  return @"Showing video full screen";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1310(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained activePlayer];
  [v1 play];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1311(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t, void))(v3 + 16);
  id v5 = a2;
  v4(v3, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performEnterBackgroundOperations];

  __int16 v7 = [v5 currentState];

  return v7;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1312(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performEnterBackgroundOperations];

  id v5 = [v3 currentState];

  return v5;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1313(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v48 = a3;
  id v49 = a4;
  id v10 = a5;
  id v11 = [v9 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained configuredPostPlay] & 1) == 0)
  {

    goto LABEL_28;
  }
  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  int v14 = [v13 activePlayer];
  uint64_t v15 = [v14 externalPlaybackType];

  if (!v15) {
    goto LABEL_28;
  }
  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  char v17 = [v16 activePlayer];
  id v47 = [v17 currentMediaItem];

  id v18 = [v47 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA100]];
  if (v18)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v19 = objc_loadWeakRetained((id *)(a1 + 40));
    id v20 = [v19 activePlayer];
    id v21 = [v20 playlist];
    id v22 = [v21 activeList];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v22);
          }
          if ([*(id *)(*((void *)&v53 + 1) + 8 * i) isEqualToMediaItem:v18])
          {

            id v26 = objc_loadWeakRetained((id *)(a1 + 40));
            id v27 = [v26 activePlayer];
            id v28 = [v27 playlist];
            uint64_t v46 = [v28 activeListIndex];

            id v29 = sLogObject_5;
            if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "removing post play item in playlist", buf, 2u);
            }
            id v22 = objc_loadWeakRetained((id *)(a1 + 40));
            id v30 = [v22 activePlayer];
            char v31 = [v30 playlist];
            [v31 removeItemAtIndex:v46 + 1];

            goto LABEL_17;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  id v32 = objc_loadWeakRetained((id *)(a1 + 40));
  id v33 = [v32 featureMonitor];
  id v34 = [v33 featuresForType:2];
  id v35 = [v34 firstObject];

  if (v35)
  {
    if ([v35 isActive])
    {
      id v36 = [v9 currentState];
      BOOL v37 = v36 == @"Showing video full screen with post play content on screen";

      if (!v37)
      {
        id v38 = objc_loadWeakRetained((id *)(a1 + 40));
        uint64_t v39 = [v38 postPlayView];
        if (v39)
        {

LABEL_24:
          id v42 = objc_loadWeakRetained((id *)(a1 + 40));
          id v43 = [v42 avPlayerViewController];
          uint64_t v44 = [v43 view];

          if (v44)
          {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

            id v11 = @"Showing video full screen with post play content on screen";
          }

          goto LABEL_27;
        }
        id v40 = objc_loadWeakRetained((id *)(a1 + 40));
        int v41 = [v40 _isNewPostPlayEnabled];

        if (v41) {
          goto LABEL_24;
        }
      }
    }
  }
LABEL_27:

LABEL_28:
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1314;
  v50[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v51, (id *)(a1 + 40));
  [v9 executeBlockAfterCurrentStateTransition:v50];
  objc_destroyWeak(&v51);

  return v11;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1314(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performEnterForegroundOperations];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1315(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained avPlayerViewController];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

  __int16 v7 = [v4 currentState];

  return v7;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1316(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1317;
  void v15[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v16, (id *)(a1 + 32));
  [v9 executeBlockAfterCurrentStateTransition:v15];
  id v13 = [v9 currentState];
  objc_destroyWeak(&v16);

  return v13;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1317(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performEnterForegroundOperations];
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1318(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained backgroundAudioPlayer];
  if (v6)
  {
    __int16 v7 = (void *)v6;
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 backgroundAudioPlayer];
    id v10 = [v9 state];
    id v11 = [MEMORY[0x1E4FA9D88] playing];

    if (v10 != v11) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained(v4);
    id v12 = [WeakRetained backgroundAudioPlayer];
    [v12 pause];
  }
LABEL_5:
  id v13 = [v3 currentState];

  return v13;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1319(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained avPlayerViewController];
  __int16 v7 = [v6 view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_loadWeakRetained(v3);
  id v13 = [v12 extrasContext];
  LODWORD(v7) = objc_msgSend(v13, "shouldExtrasBeVisibleForSize:", v9, v11);

  int v14 = [v4 currentState];

  if (!v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v22 = objc_loadWeakRetained(v3);
    [v22 _setExtrasButtonVisible:0];
    id v15 = v14;
    int v14 = @"Showing video full screen";
LABEL_6:

    goto LABEL_7;
  }
  id v15 = objc_loadWeakRetained(v3);
  uint64_t v16 = [v15 backgroundAudioPlayer];
  if (v16)
  {
    char v17 = (void *)v16;
    id v18 = objc_loadWeakRetained(v3);
    id v19 = [v18 backgroundAudioPlayer];
    id v20 = [v19 state];
    id v21 = [MEMORY[0x1E4FA9D88] paused];

    if (v20 != v21) {
      goto LABEL_8;
    }
    id v15 = objc_loadWeakRetained(v3);
    id v22 = [v15 backgroundAudioPlayer];
    [v22 play];
    goto LABEL_6;
  }
LABEL_7:

LABEL_8:
  return v14;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1320(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "external playback did change", buf, 2u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v15 = objc_msgSend(WeakRetained, "multiviewPlaybackInfo", 0);

  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v20 pausedDueToInterruption])
        {
          id v21 = [v20 player];
          [v21 play];

          [v20 setPausedDueToInterruption:0];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v17);
  }

  id v22 = [v9 currentState];

  return v22;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1321(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained activePlayer];
  __int16 v7 = [v6 currentMediaItem];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v8 = [v4 currentState];

  return v8;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1322(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 currentState];
  uint64_t v33 = a1;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setConfiguredPostPlay:1];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v7 = [v6 featureMonitor];
  double v8 = [v7 featuresForType:2];
  id v9 = [v8 firstObject];

  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [v10 featureMonitor];
  id v12 = [v11 featuresForType:3];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v19 = objc_loadWeakRetained(v4);
        id v20 = [v19 featureMonitor];
        [v20 deactivateFeature:v18 animated:0];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  if (v9)
  {
    if ([v9 isActive])
    {
      id v21 = objc_loadWeakRetained(v4);
      id v22 = [v21 activePlayer];
      uint64_t v23 = [v22 state];
      long long v24 = [MEMORY[0x1E4FA9D88] playing];

      if (v23 == v24)
      {
        id v25 = objc_loadWeakRetained(v4);
        int v26 = [v25 _isNewPostPlayEnabled];

        if (v26)
        {
          (*(void (**)(void))(*(void *)(v33 + 32) + 16))();
          long long v27 = v3;
        }
        else
        {
          id v28 = objc_loadWeakRetained(v4);
          id v29 = [v28 postPlayView];

          if (!v29) {
            goto LABEL_18;
          }
          id v30 = objc_loadWeakRetained(v4);
          char v31 = [v30 avPlayerViewController];
          long long v27 = [v31 view];

          if (!v27) {
            goto LABEL_17;
          }
          (*(void (**)(void))(*(void *)(v33 + 32) + 16))();
        }
        id v3 = @"Showing video full screen with post play content on screen";
LABEL_17:
      }
    }
  }
LABEL_18:

  return v3;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1323(uint64_t a1, void *a2)
{
  id v3 = [a2 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (![WeakRetained configuredPostPlay])
  {
LABEL_9:

    goto LABEL_10;
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [v5 activePlayer];
  __int16 v7 = [v6 state];
  double v8 = [MEMORY[0x1E4FA9D88] playing];

  if (v7 != v8) {
    goto LABEL_10;
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [v9 postPlayView];
  if (v10)
  {
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    int v12 = [v11 _isNewPostPlayEnabled];

    if (!v12) {
      goto LABEL_10;
    }
  }
  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = [v13 activePlayer];
  uint64_t v15 = [v14 externalPlaybackType];

  if (!v15)
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v17 = [v16 avPlayerViewController];
    id WeakRetained = [v17 view];

    if (WeakRetained)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      id v3 = @"Showing video full screen with post play content on screen";
    }
    goto LABEL_9;
  }
LABEL_10:
  return v3;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  __int16 v7 = [v6 objectForKey:@"PostPlaySlideOutAnimationKey"];

  if (v7)
  {
    double v8 = [v6 objectForKey:@"PostPlaySlideOutAnimationKey"];
    [v8 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _resetAutoPlayBingeWatchingQualifications];

  id v11 = objc_loadWeakRetained(v9);
  char v12 = [v11 _isNewPostPlayEnabled];

  if ((v12 & 1) == 0)
  {
    id v31 = v6;
    id v13 = objc_loadWeakRetained(v9);
    uint64_t v14 = [v13 activePlayer];
    uint64_t v15 = [v14 playlist];
    unint64_t v16 = [v15 activeListIndex];

    uint64_t v17 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Removing post play item from playlist", buf, 2u);
    }
    id v18 = objc_loadWeakRetained(v9);
    id v19 = [v18 activePlayer];
    id v20 = [v19 playlist];
    uint64_t v21 = [v20 nextMediaItem];
    if (!v21)
    {
      id v6 = v31;
      goto LABEL_10;
    }
    id v22 = (void *)v21;
    id v23 = objc_loadWeakRetained(v9);
    long long v24 = [v23 activePlayer];
    id v25 = [v24 playlist];
    int v26 = [v25 activeList];
    unint64_t v30 = [v26 count];

    unint64_t v27 = v16;
    BOOL v28 = v16 >= v30;
    id v6 = v31;
    if (!v28)
    {
      id v18 = objc_loadWeakRetained(v9);
      id v19 = [v18 activePlayer];
      id v20 = [v19 playlist];
      [v20 removeItemAtIndex:v27 + 1];
LABEL_10:
    }
  }

  return @"Showing video full screen";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1325(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v13 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v15 = [WeakRetained activePlayer];
  unint64_t v16 = [v15 currentMediaItem];

  uint64_t v68 = [v16 mediaItemMetadataForProperty:@"VUIMediaItemMetadataUpNextPostPlayMediaInfo"];
  uint64_t v17 = [v16 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA100]];
  id v18 = [v16 mediaItemMetadataForProperty:@"VUIContentMetadataPostPlayItemUpsellRouterDataSource"];
  long long v69 = [v16 mediaItemMetadataForProperty:@"VUIContentMetadataPostPlayItemMetrics"];
  if (v17)
  {
    long long v66 = v18;
    id v19 = [v17 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v19 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA370] date:0];
    char v65 = v19;
    [v19 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA388] date:0];
    id v20 = objc_loadWeakRetained(v13);
    uint64_t v21 = [v20 ratingView];

    if (v21)
    {
      id v22 = objc_loadWeakRetained(v13);
      id v23 = [v22 ratingView];
      [v23 removeFromSuperview];
    }
    id v24 = objc_loadWeakRetained(v13);
    [v24 setRatingImage:0];

    id v25 = objc_loadWeakRetained(v13);
    [v25 setRatingView:0];

    id v26 = objc_loadWeakRetained(v13);
    [v26 setPhotoSensitivityImage:0];

    id v27 = objc_loadWeakRetained(v13);
    BOOL v28 = [v27 productPlacementView];

    if (v28)
    {
      id v29 = objc_loadWeakRetained(v13);
      unint64_t v30 = [v29 productPlacementView];
      [v30 removeFromSuperview];
    }
    id v31 = objc_loadWeakRetained(v13);
    [v31 setProductPlacementImage:0];

    id v32 = objc_loadWeakRetained(v13);
    [v32 setProductPlacementView:0];

    id v33 = objc_loadWeakRetained(v13);
    long long v34 = objc_opt_new();
    [v33 setLogoImageDownloader:v34];

    if ([v10 isEqualToString:@"Post play item selected"])
    {
      if (v69)
      {
        long long v35 = [v69 objectForKeyedSubscript:@"VUIContentMetadataPostPlayItemMetricsClickDataKey"];
        long long v36 = +[VUIMetricsController sharedInstance];
        [v36 recordClick:v35];
      }
      id v37 = objc_loadWeakRetained(v13);
      [v37 _resetAutoPlayBingeWatchingQualifications];
    }
    id v38 = v12;
    id v67 = v11;
    uint64_t v39 = v10;
    id v40 = v9;
    int v41 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v41, OS_LOG_TYPE_DEFAULT, "Playing post play item from playlist", buf, 2u);
    }
    id v42 = (__CFString *)(id)*MEMORY[0x1E4FAA218];
    id v43 = objc_loadWeakRetained(v13);
    uint64_t v44 = [v43 postPlayView];
    int v45 = [v44 canAutoPlay];

    id v10 = v39;
    if ([v39 isEqualToString:@"Post play item selected"])
    {
      uint64_t v46 = VUIPostPlayReasonManualPlayOther;
      id v47 = &VUIPostPlayReasonManualUpNext;
      id v12 = v38;
    }
    else
    {
      int v58 = [v39 isEqualToString:@"Post play auto play timer did complete"];
      id v12 = v38;
      if (!v58)
      {
        id v57 = (void *)v68;
LABEL_24:
        +[VUIMetricsMediaEvent recordPlayOfTVPMediaItem:v17];
        if ([v57 playbackContext] == 11) {
          uint64_t v60 = 4;
        }
        else {
          uint64_t v60 = 3;
        }
        id v61 = +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:v57 watchType:v60 isRentAndWatchNow:0];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1326;
        v73[3] = &unk_1E6DF79A0;
        id v62 = v61;
        id v74 = v62;
        id v75 = v17;
        objc_copyWeak(&v77, v13);
        id v63 = v42;
        uint64_t v76 = v63;
        [v62 performPlaybackStartupFlowWithCompletion:v73];

        objc_destroyWeak(&v77);
        long long v55 = @"Showing video full screen";
        id v9 = v40;
        id v18 = v66;
        id v11 = v67;
        long long v56 = v65;
        goto LABEL_28;
      }
      uint64_t v46 = VUIPostPlayReasonAutomaticPlayOther;
      id v47 = VUIPostPlayReasonAutomaticUpNext;
    }
    id v57 = (void *)v68;
    if (v45) {
      uint64_t v46 = v47;
    }
    BOOL v59 = *v46;

    id v42 = v59;
    goto LABEL_24;
  }
  if (!v18)
  {
    long long v55 = @"Showing video full screen";
    id v57 = (void *)v68;
    goto LABEL_29;
  }
  id v48 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v49 = [v48 stateMachine];
  int v50 = v18;
  id v51 = (void *)v49;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1327;
  v70[3] = &unk_1E6DF4AD0;
  id v52 = v50;
  id v71 = v50;
  id v72 = *(id *)(a1 + 40);
  [v51 executeBlockAfterCurrentStateTransition:v70];

  if (v69)
  {
    long long v53 = [v69 objectForKeyedSubscript:@"VUIContentMetadataPostPlayItemMetricsClickDataKey"];
    long long v54 = +[VUIMetricsController sharedInstance];
    [v54 recordClick:v53];
  }
  long long v55 = @"Not showing anything";
  long long v56 = v71;
  id v57 = (void *)v68;
  id v18 = v52;
LABEL_28:

LABEL_29:
  return v55;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1326(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6, void *a7, void *a8)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 134218752;
    uint64_t v44 = (__CFString *)a2;
    __int16 v45 = 2048;
    uint64_t v46 = a3;
    __int16 v47 = 2048;
    uint64_t v48 = a4;
    __int16 v49 = 2048;
    uint64_t v50 = a5;
    _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Post-play startup coordinator finished startup flow.  startPlayback == %ld, isCoWatching == %ld, forceDownloadToStream == %ld, allowCellular == %ld", (uint8_t *)&v43, 0x2Au);
  }
  id v19 = sLogObject_5;
  BOOL v20 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v20)
    {
      LOWORD(v43) = 0;
      _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Playing post-play media item since playback startup coordinator allowed it", (uint8_t *)&v43, 2u);
      if (!a4)
      {
LABEL_6:
        if (a3)
        {
LABEL_7:
          uint64_t v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          id v22 = [v21 objectForKey:*MEMORY[0x1E4FB3DA8]];

          if (v22 && (objc_opt_respondsToSelector() & 1) != 0 && ([v22 BOOLValue] & 1) == 0)
          {
            int v23 = [v22 BOOLValue];
            id v24 = sLogObject_5;
            if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = @"paused";
              if (v23) {
                id v25 = @"playing";
              }
              int v43 = 138412290;
              uint64_t v44 = v25;
              _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Overriding initial playback state to %@ per user default", (uint8_t *)&v43, 0xCu);
            }
            if (!v23)
            {
              id v38 = sLogObject_5;
              if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v43) = 0;
                _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting next item in paused state", (uint8_t *)&v43, 2u);
              }
              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
              id v40 = [WeakRetained mainPlayer];
              [v40 pause];

              id v41 = objc_loadWeakRetained((id *)(a1 + 56));
              id v42 = [v41 mainPlayer];
              [v42 pause];

              int v31 = 0;
              goto LABEL_27;
            }
          }
          id v26 = sLogObject_5;
          if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v43) = 0;
            _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting next item in playing state", (uint8_t *)&v43, 2u);
          }
          id v27 = objc_loadWeakRetained((id *)(a1 + 56));
          BOOL v28 = [v27 mainPlayer];
          [v28 play];

LABEL_26:
          int v31 = 1;
LABEL_27:
          id v32 = (id *)(a1 + 56);
          id v33 = objc_loadWeakRetained((id *)(a1 + 56));
          long long v34 = [v33 activePlayer];
          [v34 changeMediaInDirection:0 reason:*(void *)(a1 + 48)];

          if (v31)
          {
            id v35 = objc_loadWeakRetained((id *)(a1 + 56));
            long long v36 = [v35 mainPlayer];
            [v36 play];
          }
          id v37 = objc_loadWeakRetained(v32);
          [v37 _notifyAVPlayerViewControllerDisplaySize];

          goto LABEL_30;
        }
LABEL_24:
        unint64_t v30 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "No GroupActivity is active.  Starting next item in playing state", (uint8_t *)&v43, 2u);
        }
        goto LABEL_26;
      }
    }
    else if (!a4)
    {
      goto LABEL_6;
    }
    id v29 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Forcing downloaded video to be streamed.  Removing previously added up next item", (uint8_t *)&v43, 2u);
    }
    [*(id *)(a1 + 40) setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4FA9F10]];
    if (a3) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
  if (v20)
  {
    LOWORD(v43) = 0;
    _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Not playing post-play media item since playback startup coordinator disallowed it", (uint8_t *)&v43, 2u);
  }
LABEL_30:
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1327(uint64_t a1)
{
  uint64_t v2 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Tear down playback and present post play upsell screen", buf, 2u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1328;
  aBlock[3] = &unk_1E6DF3D58;
  id v5 = *(id *)(a1 + 32);
  id v3 = _Block_copy(aBlock);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1328(uint64_t a1)
{
  id v2 = +[VUIPostPlayUpsellManager sharedInstance];
  [v2 handleRouterDataSourceIfNeeded:*(void *)(a1 + 32)];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1330(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v15 = [WeakRetained activePlayer];

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 40));
    id v17 = [v16 activePlayer];
    [v17 elapsedTime];
    double v19 = v18;

    BOOL v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v19];
    [v13 setObject:v20 forKey:VUIPlaybackManagerNotificationKeyElapsedTime];
  }
  uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v22 = VUIPlaybackManagerPostPlayPIPWillHideNotification[0];
  int v23 = (void *)[v13 copy];
  [v21 postNotificationName:v22 object:0 userInfo:v23];

  uint64_t v24 = *(void *)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1331;
  id v26[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v27, (id *)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void, void *))(v24 + 16))(v24, 1, 0, 1, 1, 0, 0, v26);
  objc_destroyWeak(&v27);

  return @"Showing post play content without playback UI";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1331(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained playbackContainerViewController];
  [v1 hidePictureInPictureWithCompletion:0];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1332(uint64_t a1)
{
  id v2 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up player because post play view was dimissed", v4, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return @"Not showing anything";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1333()
{
  return @"Playing background media in picture and picture";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1336(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPIPedBackgroundMediaController:0];

  return @"Not showing anything";
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1337(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKey:@"CompletionKey"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1338;
  v16[3] = &unk_1E6DF79F0;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v17 = *(id *)(a1 + 32);
  id v14 = v13;
  id v18 = v14;
  [v9 executeBlockAfterCurrentStateTransition:v16];

  objc_destroyWeak(&v19);
  return @"Transferring player to background media";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1338(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained playbackContainerViewController];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 mainAVPlayerViewController];

  id v7 = objc_loadWeakRetained(v2);
  [v6 setDelegate:v7];

  id v8 = objc_loadWeakRetained(v2);
  id v9 = [v8 activePlayer];

  uint64_t v10 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1339;
  v14[3] = &unk_1E6DF7750;
  objc_copyWeak(&v19, v2);
  id v18 = *(id *)(a1 + 40);
  id v11 = v4;
  id v15 = v11;
  id v12 = v6;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  (*(void (**)(uint64_t, void, void, uint64_t, void, void, void, void *))(v10 + 16))(v10, 0, 0, 1, 0, 0, 0, v14);

  objc_destroyWeak(&v19);
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1339(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained setPresentingViewController:0];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1340(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1343(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setLongLoadingAlertController:0];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1344;
  v16[3] = &unk_1E6DF5490;
  objc_copyWeak(&v18, a1);
  id v14 = v12;
  id v17 = v14;
  [v9 executeBlockAfterCurrentStateTransition:v16];

  objc_destroyWeak(&v18);
  return @"Showing video full screen";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1344(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained mainPlayer];
  id v5 = [v4 currentMediaItem];

  id v6 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataDeepLinkURL"];
  id v7 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataPlayableForDownload"];
  id v8 = objc_loadWeakRetained(v2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1345;
  v12[3] = &unk_1E6DF4B28;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  id v15 = v7;
  id v16 = v5;
  id v9 = v5;
  id v10 = v7;
  id v11 = v6;
  [v8 dismissPlaybackAnimated:1 leaveGroupActivitySession:1 completion:v12];
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1345(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = +[VUITVAppLauncher sharedInstance];
  [v2 openURL:*(void *)(a1 + 32) options:0];

  id v3 = [*(id *)(a1 + 40) objectForKey:@"StartDownloadAfterDismissingDialogKey"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = sLogObject_5;
    if (*(void *)(a1 + 48))
    {
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 56);
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Starting download for %@", (uint8_t *)&v8, 0xCu);
      }
      id v7 = [[VUIUniversalAssetController alloc] initWithVideosPlayable:*(void *)(a1 + 48)];
      [(VUIUniversalAssetController *)v7 startDownloadAllowingCellular:0 quality:2 shouldMarkAsDeletedOnCancellationOrFailure:1 prefer3DOrImmersiveDownload:1 completion:0];
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1345_cold_1(a1, v5);
    }
  }
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1347(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLongLoadingAlertController:0];

  id v15 = objc_loadWeakRetained(v13);
  uint64_t v16 = [v15 savedErrorContext];

  id v17 = objc_loadWeakRetained(v13);
  uint64_t v18 = [v17 savedErrorUserInfo];

  if (v16 | v18)
  {
    id v19 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "An error occurred while the long loading dialog was being presented.  Posting error event again.", buf, 2u);
    }
    id v20 = objc_loadWeakRetained(v13);
    [v20 setSavedErrorContext:0];

    id v21 = objc_loadWeakRetained(v13);
    [v21 setSavedErrorUserInfo:0];

    id v22 = objc_loadWeakRetained(v13);
    int v23 = [v22 stateMachine];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1348;
    v25[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v28, v13);
    id v26 = (id)v16;
    id v27 = (id)v18;
    [v23 executeBlockAfterCurrentStateTransition:v25];

    objc_destroyWeak(&v28);
  }

  return @"Showing video full screen";
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1348(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Error did occur" withContext:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (VUIPlayer)activePlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePlayer);
  return (VUIPlayer *)WeakRetained;
}

- (VUIPlayer)mainPlayer
{
  return self->_mainPlayer;
}

- (void)setMainPlayer:(id)a3
{
}

- (VUILivePostPlayController)mainLivePostPlayController
{
  return self->_mainLivePostPlayController;
}

- (void)setMainLivePostPlayController:(id)a3
{
}

- (VUIPlayer)backgroundAudioPlayer
{
  return self->_backgroundAudioPlayer;
}

- (void)setBackgroundAudioPlayer:(id)a3
{
}

- (NSMutableArray)multiviewPlaybackInfo
{
  return self->_multiviewPlaybackInfo;
}

- (void)setMultiviewPlaybackInfo:(id)a3
{
}

- (VUIPlayer)extrasPlayer
{
  return self->_extrasPlayer;
}

- (void)setExtrasPlayer:(id)a3
{
}

- (void)setStateMachine:(id)a3
{
}

- (VideosExtrasContext)extrasContext
{
  return self->_extrasContext;
}

- (void)setExtrasContext:(id)a3
{
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (AVPlayerViewController)mainAVPlayerViewController
{
  return self->_mainAVPlayerViewController;
}

- (void)setMainAVPlayerViewController:(id)a3
{
}

- (AVPlayerViewController)extrasAVPlayerViewController
{
  return self->_extrasAVPlayerViewController;
}

- (void)setExtrasAVPlayerViewController:(id)a3
{
}

- (VUIControllerPresenter)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (VUIControllerPresenter *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (int64_t)dismissalOperation
{
  return self->_dismissalOperation;
}

- (void)setDismissalOperation:(int64_t)a3
{
  self->_dismissalOperation = a3;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (NSDictionary)savedErrorUserInfo
{
  return self->_savedErrorUserInfo;
}

- (void)setSavedErrorUserInfo:(id)a3
{
}

- (id)savedErrorContext
{
  return self->_savedErrorContext;
}

- (void)setSavedErrorContext:(id)a3
{
}

- (OS_dispatch_queue)audioSessionSerialQueue
{
  return self->_audioSessionSerialQueue;
}

- (void)setAudioSessionSerialQueue:(id)a3
{
}

- (UIAlertController)errorAlertController
{
  return self->_errorAlertController;
}

- (void)setErrorAlertController:(id)a3
{
}

- (UIAlertController)longLoadingAlertController
{
  return self->_longLoadingAlertController;
}

- (void)setLongLoadingAlertController:(id)a3
{
}

- (VUIPlaybackContainerViewController)playbackContainerViewController
{
  return self->_playbackContainerViewController;
}

- (void)setPlaybackContainerViewController:(id)a3
{
}

- (VUIMultiPlayerViewController)multiPlayerViewController
{
  return self->_multiPlayerViewController;
}

- (void)setMultiPlayerViewController:(id)a3
{
}

- (VUIMultiPlayerDetailsViewController)multiPlayerDetailsViewController
{
  return self->_multiPlayerDetailsViewController;
}

- (void)setMultiPlayerDetailsViewController:(id)a3
{
}

- (NSDate)dateAppWasBackgrounded
{
  return self->_dateAppWasBackgrounded;
}

- (void)setDateAppWasBackgrounded:(id)a3
{
}

- (NSDate)datePlaybackWasPaused
{
  return self->_datePlaybackWasPaused;
}

- (void)setDatePlaybackWasPaused:(id)a3
{
}

- (NSTimer)pausedTooLongTimer
{
  return self->_pausedTooLongTimer;
}

- (void)setPausedTooLongTimer:(id)a3
{
}

- (BOOL)shouldRestartIfAppHasBeenBackgroundedTooLong
{
  return self->_shouldRestartIfAppHasBeenBackgroundedTooLong;
}

- (void)setShouldRestartIfAppHasBeenBackgroundedTooLong:(BOOL)a3
{
  self->_shouldRestartIfAppHasBeenBackgroundedTooLong = a3;
}

- (NSTimer)mainPlayerLongLoadingTimer
{
  return self->_mainPlayerLongLoadingTimer;
}

- (void)setMainPlayerLongLoadingTimer:(id)a3
{
}

- (BOOL)hasMainPlayerFinishedInitialLoading
{
  return self->_hasMainPlayerFinishedInitialLoading;
}

- (void)setHasMainPlayerFinishedInitialLoading:(BOOL)a3
{
  self->_hasMainPlayerFinishedInitialLoading = a3;
}

- (BOOL)isExperienceControllerPresented
{
  return self->_isExperienceControllerPresented;
}

- (void)setIsExperienceControllerPresented:(BOOL)a3
{
  self->_isExperienceControllerPresented = a3;
}

- (BOOL)isTrackingPlayerViewFrame
{
  return self->_trackingPlayerViewFrame;
}

- (void)setTrackingPlayerViewFrame:(BOOL)a3
{
  self->_trackingPlayerViewFrame = a3;
}

- (UIActivityItemsConfiguration)itemsConfiguration
{
  return self->_itemsConfiguration;
}

- (void)setItemsConfiguration:(id)a3
{
}

- (UIViewController)PIPedBackgroundMediaController
{
  return self->_PIPedBackgroundMediaController;
}

- (void)setPIPedBackgroundMediaController:(id)a3
{
}

- (VideosExtrasPresenter)extrasPresenter
{
  return self->_extrasPresenter;
}

- (void)setExtrasPresenter:(id)a3
{
}

- (VUINowPlayingFeatureMonitor)featureMonitor
{
  return self->_featureMonitor;
}

- (void)setFeatureMonitor:(id)a3
{
}

- (VUIPostPlayView)postPlayView
{
  return self->_postPlayView;
}

- (void)setPostPlayView:(id)a3
{
}

- (NSLayoutConstraint)postPlayTrailingConstraint
{
  return self->_postPlayTrailingConstraint;
}

- (void)setPostPlayTrailingConstraint:(id)a3
{
}

- (unint64_t)autoPlayedVideosCount
{
  return self->_autoPlayedVideosCount;
}

- (void)setAutoPlayedVideosCount:(unint64_t)a3
{
  self->_autoPlayedVideosCount = a3;
}

- (NSDate)initialPlaybackStartDate
{
  return self->_initialPlaybackStartDate;
}

- (void)setInitialPlaybackStartDate:(id)a3
{
}

- (BOOL)configuredPostPlay
{
  return self->_configuredPostPlay;
}

- (void)setConfiguredPostPlay:(BOOL)a3
{
  self->_configuredPostPlaCGFloat y = a3;
}

- (NSNumber)postPlayImpressionTime
{
  return self->_postPlayImpressionTime;
}

- (void)setPostPlayImpressionTime:(id)a3
{
}

- (NSDictionary)skipButtonImpressionMetrics
{
  return self->_skipButtonImpressionMetrics;
}

- (void)setSkipButtonImpressionMetrics:(id)a3
{
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (NSLayoutConstraint)skipCenterXConstraint
{
  return self->_skipCenterXConstraint;
}

- (void)setSkipCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)skipBottomConstraint
{
  return self->_skipBottomConstraint;
}

- (void)setSkipBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)skipTrailingConstraint
{
  return self->_skipTrailingConstraint;
}

- (void)setSkipTrailingConstraint:(id)a3
{
}

- (VUIPromoMetadataView)promoMetadataView
{
  return self->_promoMetadataView;
}

- (void)setPromoMetadataView:(id)a3
{
}

- (NSDictionary)upNextButtonImpressionMetrics
{
  return self->_upNextButtonImpressionMetrics;
}

- (void)setUpNextButtonImpressionMetrics:(id)a3
{
}

- (VUIVideoAdvisoryLogoImageDownloader)logoImageDownloader
{
  return self->_logoImageDownloader;
}

- (void)setLogoImageDownloader:(id)a3
{
}

- (UIImage)ratingImage
{
  return self->_ratingImage;
}

- (void)setRatingImage:(id)a3
{
}

- (UIImage)photoSensitivityImage
{
  return self->_photoSensitivityImage;
}

- (void)setPhotoSensitivityImage:(id)a3
{
}

- (UIImage)highMotionWarningImage
{
  return self->_highMotionWarningImage;
}

- (void)setHighMotionWarningImage:(id)a3
{
}

- (VUIAdditionalAdvisoryInfoView)hmwView
{
  return self->_hmwView;
}

- (void)setHmwView:(id)a3
{
}

- (VUIVideoAdvisoryView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
}

- (BOOL)shouldDisplayTVRatingWhenVideoBoundsIsAvailable
{
  return self->_shouldDisplayTVRatingWhenVideoBoundsIsAvailable;
}

- (void)setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:(BOOL)a3
{
  self->_shouldDisplayTVRatingWhenVideoBoundsIsAvailable = a3;
}

- (BOOL)shouldAnimateTVRatingView
{
  return self->_shouldAnimateTVRatingView;
}

- (void)setShouldAnimateTVRatingView:(BOOL)a3
{
  self->_shouldAnimateTVRatingView = a3;
}

- (UIVisualEffectView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIImage)productPlacementImage
{
  return self->_productPlacementImage;
}

- (void)setProductPlacementImage:(id)a3
{
}

- (VUIProductPlacementView)productPlacementView
{
  return self->_productPlacementView;
}

- (void)setProductPlacementView:(id)a3
{
}

- (BOOL)shouldDisplayProductPlacementWhenVideoBoundsIsAvailable
{
  return self->_shouldDisplayProductPlacementWhenVideoBoundsIsAvailable;
}

- (void)setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:(BOOL)a3
{
  self->_shouldDisplayProductPlacementWhenVideoBoundsIsAvailable = a3;
}

- (BOOL)shouldAnimateProductPlacementView
{
  return self->_shouldAnimateProductPlacementView;
}

- (void)setShouldAnimateProductPlacementView:(BOOL)a3
{
  self->_shouldAnimateProductPlacementView = a3;
}

- (NSString)postPlayItemId
{
  return self->_postPlayItemId;
}

- (void)setPostPlayItemId:(id)a3
{
}

- (UIViewController)moreInfoCanonicalViewController
{
  return self->_moreInfoCanonicalViewController;
}

- (void)setMoreInfoCanonicalViewController:(id)a3
{
}

- (BOOL)transportBarVisible
{
  return self->_transportBarVisible;
}

- (void)setTransportBarVisible:(BOOL)a3
{
  self->_transportBarVisible = a3;
}

- (AVControlItem)extrasControlItem
{
  return self->_extrasControlItem;
}

- (void)setExtrasControlItem:(id)a3
{
}

- (AVControlItem)multiViewControlItem
{
  return self->_multiViewControlItem;
}

- (void)setMultiViewControlItem:(id)a3
{
}

- (AVControlItem)shareControlItem
{
  return self->_shareControlItem;
}

- (void)setShareControlItem:(id)a3
{
}

- (VUIPerformanceDebuggerViewController)performanceDebuggerViewController
{
  return self->_performanceDebuggerViewController;
}

- (void)setPerformanceDebuggerViewController:(id)a3
{
}

- (NSTimer)clearPerformanceDebuggerTimer
{
  return self->_clearPerformanceDebuggerTimer;
}

- (void)setClearPerformanceDebuggerTimer:(id)a3
{
}

- (BOOL)hasPerformanceDebuggerAppeared
{
  return self->_hasPerformanceDebuggerAppeared;
}

- (void)setHasPerformanceDebuggerAppeared:(BOOL)a3
{
  self->_hasPerformanceDebuggerAppeared = a3;
}

- (VUITimedMetadataDebuggerViewController)timedMetadataDebuggerViewController
{
  return self->_timedMetadataDebuggerViewController;
}

- (void)setTimedMetadataDebuggerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataDebuggerViewController, 0);
  objc_storeStrong((id *)&self->_clearPerformanceDebuggerTimer, 0);
  objc_storeStrong((id *)&self->_performanceDebuggerViewController, 0);
  objc_storeStrong((id *)&self->_shareControlItem, 0);
  objc_storeStrong((id *)&self->_multiViewControlItem, 0);
  objc_storeStrong((id *)&self->_extrasControlItem, 0);
  objc_storeStrong((id *)&self->_moreInfoCanonicalViewController, 0);
  objc_storeStrong((id *)&self->_postPlayItemId, 0);
  objc_storeStrong((id *)&self->_productPlacementView, 0);
  objc_storeStrong((id *)&self->_productPlacementImage, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_hmwView, 0);
  objc_storeStrong((id *)&self->_highMotionWarningImage, 0);
  objc_storeStrong((id *)&self->_photoSensitivityImage, 0);
  objc_storeStrong((id *)&self->_ratingImage, 0);
  objc_storeStrong((id *)&self->_logoImageDownloader, 0);
  objc_storeStrong((id *)&self->_upNextButtonImpressionMetrics, 0);
  objc_storeStrong((id *)&self->_promoMetadataView, 0);
  objc_storeStrong((id *)&self->_skipTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_skipBottomConstraint, 0);
  objc_storeStrong((id *)&self->_skipCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_skipButtonImpressionMetrics, 0);
  objc_storeStrong((id *)&self->_postPlayImpressionTime, 0);
  objc_storeStrong((id *)&self->_initialPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_postPlayTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_postPlayView, 0);
  objc_storeStrong((id *)&self->_featureMonitor, 0);
  objc_storeStrong((id *)&self->_extrasPresenter, 0);
  objc_storeStrong((id *)&self->_PIPedBackgroundMediaController, 0);
  objc_storeStrong((id *)&self->_itemsConfiguration, 0);
  objc_storeStrong((id *)&self->_mainPlayerLongLoadingTimer, 0);
  objc_storeStrong((id *)&self->_pausedTooLongTimer, 0);
  objc_storeStrong((id *)&self->_datePlaybackWasPaused, 0);
  objc_storeStrong((id *)&self->_dateAppWasBackgrounded, 0);
  objc_storeStrong((id *)&self->_multiPlayerDetailsViewController, 0);
  objc_storeStrong((id *)&self->_multiPlayerViewController, 0);
  objc_storeStrong((id *)&self->_playbackContainerViewController, 0);
  objc_storeStrong((id *)&self->_longLoadingAlertController, 0);
  objc_storeStrong((id *)&self->_errorAlertController, 0);
  objc_storeStrong((id *)&self->_audioSessionSerialQueue, 0);
  objc_storeStrong(&self->_savedErrorContext, 0);
  objc_storeStrong((id *)&self->_savedErrorUserInfo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_extrasAVPlayerViewController, 0);
  objc_storeStrong((id *)&self->_mainAVPlayerViewController, 0);
  objc_storeStrong((id *)&self->_avPlayerViewController, 0);
  objc_storeStrong((id *)&self->_extrasContext, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_extrasPlayer, 0);
  objc_storeStrong((id *)&self->_multiviewPlaybackInfo, 0);
  objc_storeStrong((id *)&self->_backgroundAudioPlayer, 0);
  objc_storeStrong((id *)&self->_mainLivePostPlayController, 0);
  objc_storeStrong((id *)&self->_mainPlayer, 0);
  objc_destroyWeak((id *)&self->_activePlayer);
}

- (void)extrasContext:(uint64_t)a1 hadFatalError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Extras context had fatal error: %@", (uint8_t *)&v2, 0xCu);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_913_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to start download because no view controller could be found for preflight presentation", v2, v3, v4, v5, v6);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_913_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to start download because media item is missing adam ID", v2, v3, v4, v5, v6);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_921_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to start download because media entity or asset controller could not be found", v2, v3, v4, v5, v6);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Existing AVPlayerViewController reuse desired but cannot be reused since it is not presented", v2, v3, v4, v5, v6);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1101_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to restore AVPlayerViewController since PIP is not being shown", v2, v3, v4, v5, v6);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1104_cold_1(uint64_t a1, void *a2, id *a3)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(a3);
  uint8_t v6 = [WeakRetained avPlayerViewController];
  OUTLINED_FUNCTION_2_6(&dword_1E2BD7000, v7, v8, "Unable to restore AVPlayerViewController.  Presenting view controller is nil: %@, player view controller is nil: %@", v9, v10, v11, v12, 2u);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1108_cold_1(uint64_t a1, void *a2, id *a3)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(a3);
  uint8_t v6 = [WeakRetained avPlayerViewController];
  OUTLINED_FUNCTION_1_24();
  OUTLINED_FUNCTION_2_6(&dword_1E2BD7000, v7, v8, "Unable to restore AVPlayerViewController.  Presenting view controller is nil: %@, player view controller is nil: %@", v9, v10, v11, v12, v13);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1345_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Unable to start download for %@ because videos playable is nil", (uint8_t *)&v3, 0xCu);
}

@end