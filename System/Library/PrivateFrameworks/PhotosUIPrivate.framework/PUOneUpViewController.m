@interface PUOneUpViewController
+ (NSString)oneUpActivityTitle;
- (BOOL)_allowsShowingVisualIntelligenceForAsset:(id)a3;
- (BOOL)_allowsVisualLookupInInfoPanelMode;
- (BOOL)_canAdvertiseKeyCommands;
- (BOOL)_canAttemptNavigationToAssetDisplayDescriptor:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_didPlayCurrentLivePhoto;
- (BOOL)_hasShownRelevantTip;
- (BOOL)_isAccessoryAvailableForCurrentAsset;
- (BOOL)_isAccessoryVisible;
- (BOOL)_isAssetEligibleForTip:(id)a3;
- (BOOL)_isCameraDetailsAccessory;
- (BOOL)_isCurrentAssetAndInEditModeForAssetReference:(id)a3;
- (BOOL)_isDetailsAccessoryAvailableForAssetReference:(id)a3;
- (BOOL)_isDrivingScrubbing;
- (BOOL)_isIrisPlaying;
- (BOOL)_isLayoutAffectedBySpecChange:(id)a3;
- (BOOL)_isLocationFromProvider:(id)a3 overTileOfKind:(id)a4;
- (BOOL)_isLocationFromProvider:(id)a3 overTileOfKind:(id)a4 insetBy:(UIEdgeInsets)a5;
- (BOOL)_isLocationFromProviderInAccessoryArea:(id)a3;
- (BOOL)_isLocationFromProviderOverActionInfoItem:(id)a3;
- (BOOL)_isLocationFromProviderOverControl:(id)a3;
- (BOOL)_isLocationFromProviderOverImageSubject:(id)a3;
- (BOOL)_isLocationFromProviderOverInteractiveItem:(id)a3;
- (BOOL)_isLocationFromProviderOverInteractiveItemExcludingImageSubject:(id)a3;
- (BOOL)_isLocationFromProviderOverSyndicationAttributionPill:(id)a3;
- (BOOL)_isLocationFromProviderOverVisualSearch:(id)a3;
- (BOOL)_isPresentedForSecondScreen;
- (BOOL)_isSecondScreenBrowserVisible;
- (BOOL)_isTipPopoverVisible;
- (BOOL)_isVisualImageHasSubjectLiftedFromProvider:(id)a3;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateAccessoryView;
- (BOOL)_needsUpdateBarsController;
- (BOOL)_needsUpdateEditMode;
- (BOOL)_needsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets;
- (BOOL)_needsUpdateLayout;
- (BOOL)_needsUpdatePreferredContentSize;
- (BOOL)_needsUpdatePreloadInsets;
- (BOOL)_needsUpdateSpec;
- (BOOL)_needsUpdateTipsPopover;
- (BOOL)_needsUpdateUserActivity;
- (BOOL)_needsUpdateVideoPlayer;
- (BOOL)_prefersCompactLayoutForSplitScreen;
- (BOOL)_prefersFloatingInfoPanel;
- (BOOL)_prefersHomeIndicatorHidden;
- (BOOL)_requireUnlockedDeviceForAccessoryView;
- (BOOL)_shouldDisableTransitionsUntilAppeared;
- (BOOL)_shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:(id)a3;
- (BOOL)_shouldShowAccessoryAfterUnlock;
- (BOOL)_visualImageHasActiveTextSelectionFromProvider:(id)a3;
- (BOOL)_vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:(id)a3;
- (BOOL)_wantsShowInLibraryButtonForAllAssets;
- (BOOL)accessoryTileViewControllerShouldUseSquareImageWhenShowingAccessoryView:(id)a3;
- (BOOL)accessoryTileViewControllerWillHideNavigationBarWhenShowingAccessoryView:(id)a3;
- (BOOL)accessoryTileViewControllerWillHideToolbarWhenShowingAccessoryView:(id)a3;
- (BOOL)accessoryVisibilityInteractionController:(id)a3 canBeginAtLocationFromProvider:(id)a4;
- (BOOL)accessoryVisibilityInteractionController:(id)a3 isLocationFromProviderInAccessoryContent:(id)a4;
- (BOOL)allowsPreviewActions;
- (BOOL)analysisInteractionAllowedForImageAnalysisInteraction:(id)a3;
- (BOOL)appearanceTransitionAnimationsDisabled;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)doubleTapZoomController:(id)a3 canDoubleTapBeginAtLocationFromProvider:(id)a4;
- (BOOL)imageAnalysisInteractionShouldHighlightSubjectWhenAccessoryIsVisible:(id)a3;
- (BOOL)interactiveDismissalController:(id)a3 canBeginDismissalAtLocationFromProvider:(id)a4;
- (BOOL)isFloatingInfoPanelPresented;
- (BOOL)layout:(id)a3 canApplyInsetStylingToItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 isShowingInfoPanelForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldInitiallyZoomToFillForItemAtIndexPath:(id)a4 contentSize:(CGSize)a5 viewportSize:(CGSize)a6;
- (BOOL)layout:(id)a3 shouldMovePeopleRowForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldMoveProgressIndicatorForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowAccessoryForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowAttributionViewForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowBufferingIndicatorForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowCropButtonForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowPeopleRowForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowPlayButtonForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldShowVideoPlaceholderForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 shouldUseSquareImageInAccessoryForItemAtIndexPath:(id)a4;
- (BOOL)layout:(id)a3 wantsContentLegibilityTreatmentForItemAtIndexPath:(id)a4;
- (BOOL)layoutShouldShowReviewScreenScrubberBar:(id)a3;
- (BOOL)livePhotoVideoPlaybackTileViewControllerCanBeginPlaying:(id)a3 locationProvider:(id)a4;
- (BOOL)menuActionControllerPreventRevealInMomentAction:(id)a3;
- (BOOL)needsUpdateChromeViewController;
- (BOOL)oneUpAccessoryViewControllersManager:(id)a3 preventAlbumAttributionWidgetForAssetReference:(id)a4;
- (BOOL)oneUpAccessoryViewControllersManager:(id)a3 preventRevealInMomentActionForAssetReference:(id)a4;
- (BOOL)oneUpAccessoryViewControllersManagerRequestAccessoryDismissal:(id)a3;
- (BOOL)oneUpActionsControllerDismissPresentedViewController:(id)a3;
- (BOOL)oneUpActionsControllerIsDetailsAccessoryAvailable:(id)a3;
- (BOOL)oneUpActionsControllerPrefersInclusionAfterRemoval:(id)a3 forActionType:(unint64_t)a4;
- (BOOL)oneUpActionsControllerShouldAnimateViewControllerPresentation:(id)a3;
- (BOOL)oneUpBarsController:(id)a3 canShowCommentsForAsset:(id)a4;
- (BOOL)oneUpBarsController:(id)a3 isDetailsAccessoryAvailableForAssetReference:(id)a4;
- (BOOL)oneUpBarsController:(id)a3 shouldHideNavigationBarWhenShowingAccessoryViewForAssetReference:(id)a4;
- (BOOL)oneUpBarsController:(id)a3 shouldHideStatusBarWhenShowingAccessoryViewForAssetReference:(id)a4;
- (BOOL)oneUpBarsController:(id)a3 shouldHideToolbarWhenShowingAccessoryViewForAssetReference:(id)a4;
- (BOOL)oneUpBarsController:(id)a3 shouldTapBeginAtLocationFromProvider:(id)a4;
- (BOOL)oneUpChromeViewControllerIsDeviceUnlocked:(id)a3;
- (BOOL)oneUpGestureController:(id)a3 canBeginGestureAt:(id)a4;
- (BOOL)oneUpGestureController:(id)a3 canDoubleTapToZoomAtPoint:(id)a4;
- (BOOL)oneUpGestureController:(id)a3 canPerformSelectionAtPoint:(id)a4;
- (BOOL)oneUpGestureController:(id)a3 canTapToToggleChromeAtPoint:(id)a4;
- (BOOL)oneUpGestureRecognizerCoordinator:(id)a3 shouldAllowIrisGestureAtLocationFromProvider:(id)a4;
- (BOOL)overOneUpPresentationSessionPresentingViewControllerIsReady:(id)a3;
- (BOOL)playButtonTileViewControllerShouldShowPauseButton:(id)a3;
- (BOOL)playButtonTileViewControllerShouldShowPlayButtonWhileActivated:(id)a3;
- (BOOL)ppt_imageTileViewControllerShouldSignalDeferredProcessingDoneAndFinalImageDisplayed:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)pu_shouldOptOutFromChromelessBars;
- (BOOL)pu_wantsNavigationBarVisible;
- (BOOL)pu_wantsTabBarVisible;
- (BOOL)pu_wantsToolbarVisible;
- (BOOL)px_determinesPreferredStatusBarHidden;
- (BOOL)tilingViewCanBypass20069585Check:(id)a3;
- (BOOL)userTransformTileViewController:(id)a3 shouldReceiveTouchAtLocationFromProvider:(id)a4;
- (BOOL)videoTilesCanPlayVideo;
- (BOOL)wantsActionsMenu;
- (BOOL)wantsContentVisibleAfterUnregisteringWithAirPlayController:(id)a3;
- (BOOL)wantsSpotlightStyling;
- (BOOL)wasChromeVisibleBeforeZoomIn;
- (BOOL)xct_isCurrentImageDeferredProcessingFinished;
- (BOOL)xct_isCurrentImageFullQuality;
- (CGImage)livePhotoVideoPlaybackTileViewControllerCurrentGainMapImage:(id)a3 outGainMapAvailable:(BOOL *)a4 outGainMapValue:(float *)a5;
- (CGPoint)layout:(id)a3 accessoryOffsetForItemAtIndexPath:(id)a4;
- (CGPoint)layout:(id)a3 contentOffsetForItemAtIndexPath:(id)a4;
- (CGPoint)tilingView:(id)a3 initialVisibleOriginWithLayout:(id)a4;
- (CGRect)_currentFrameForTileController:(id)a3;
- (CGRect)layout:(id)a3 bestSquareRectForItemAtIndexPath:(id)a4;
- (CGRect)ppt_scrollableBoundsForTesting;
- (CGSize)_layoutReferenceSize;
- (CGSize)_pendingViewTransitionSize;
- (CGSize)layout:(id)a3 assetExplorerReviewScreenBadgeSizeForItemAtIndexPath:(id)a4;
- (CGSize)layout:(id)a3 badgeSizeForItemAtIndexPath:(id)a4 contentWidth:(double)a5;
- (CGSize)layout:(id)a3 loadingIndicatorSizeForItemAtIndexPath:(id)a4;
- (CGSize)layout:(id)a3 pixelSizeForItemAtIndexPath:(id)a4;
- (CGSize)preferredContentSizeOverride;
- (NSArray)_hiddenTilesController;
- (NSArray)_tileKindsToHide;
- (NSArray)assetUUIDsAllowedToHighlightText;
- (NSArray)textsToHighlight;
- (NSMutableSet)activeVideoTileControllers;
- (NSString)authenticationTitle;
- (NSString)passcodeAuthenticationReason;
- (NSString)ppt_assetUUIDNeedsDeferredProcessingFinishNotification;
- (NSString)presentedTipID;
- (NSString)uuidOfAssetPresentedInFloatingInfoPanel;
- (NSTimer)_chromeAutoHideTimer;
- (NSTimer)ppt_deferredProcessingWaitTimer;
- (NSTimer)xct_waitForDeferredProcessingTimer;
- (NSTimer)xct_waitForFullQualityImageTimer;
- (NSUserActivity)siriActionActivity;
- (OS_dispatch_queue)preheatAssetsQueue;
- (PUAccessoryContentViewController)currentFloatingInfoPanelAccessoryViewController;
- (PUAccessoryVisibilityInteractionController)_accessoryVisibilityInteractionController;
- (PUBrowsingBackgroundTileViewController)_backgroundTileViewController;
- (PUBrowsingOneUpVisibilityHelper)browsingOneUpVisibilityHelper;
- (PUBrowsingSession)browsingSession;
- (PUDisplayLocationProvider)lastLivePhotoGestureLocationProvider;
- (PUDoubleTapZoomController)_doubleTapZoomController;
- (PUInteractivePinchDismissalController)_interactivePinchDismissalController;
- (PUInteractiveSwipeDismissalController)_interactiveSwipeDismissalController;
- (PULoadingIndicatorController)loadingIndicatorController;
- (PUMenuActionController)menuActionController;
- (PUOneUpAccessoryViewControllersManager)_accessoryViewControllersManager;
- (PUOneUpActionsController)actionsController;
- (PUOneUpBarsController)_barsController;
- (PUOneUpChromeViewController)chromeViewController;
- (PUOneUpEventTracker)eventTracker;
- (PUOneUpFeedbackController)feedbackController;
- (PUOneUpGestureController)gestureController;
- (PUOneUpGestureRecognizerCoordinator)_gestureRecognizerCoordinator;
- (PUOneUpViewController)_mainOneUpForSecondScreenBrowser;
- (PUOneUpViewController)_secondScreenBrowser;
- (PUOneUpViewController)initWithBrowsingSession:(id)a3;
- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4;
- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4 initialActivity:(unint64_t)a5;
- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4 initialActivity:(unint64_t)a5 presentationOrigin:(int64_t)a6;
- (PUOneUpViewController)initWithCoder:(id)a3;
- (PUOneUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUOneUpViewControllerSpec)_spec;
- (PUOneUpVisualImageAnalyzingController)visualImageAnalyzingController;
- (PUOverOneUpPresentationSession)_overOneUpPresentationSession;
- (PUOverOneUpPresentationSession)ppt_overOneUpPresentationSession;
- (PUParallaxComputer)_parallaxComputer;
- (PUReviewScreenControlBarTileViewController)_reviewScreenControlBarTileViewController;
- (PUReviewScreenScrubberBarTileViewController)_reviewScreenScrubberBarTileViewController;
- (PUReviewScreenTopBarTileViewController)_reviewScreenTopBarTileViewController;
- (PUTilingView)_tilingView;
- (PXAssetActionManager)assetActionManager;
- (PXBoopableItemsProvider)boopableItemsProvider;
- (PXFloatingCardPresentationController)cardPresentationController;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIEdgeInsets)_layoutSafeAreaInsets;
- (UIEdgeInsets)layout:(id)a3 insetsWhenScaledToFitForItemAtIndexPath:(id)a4 inViewportSize:(CGSize)a5;
- (UIView)chromeView;
- (UIView)contentContainerView;
- (UIView)ppt_scrubberView;
- (double)_preloadInsetsBasedOffViewWidth;
- (double)alphaForReviewScreenBarsInLayout:(id)a3;
- (double)layout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4;
- (double)layout:(id)a3 leadingBadgesWidthForItemAtIndexPath:(id)a4 contentWidth:(double)a5;
- (double)layout:(id)a3 minimumItemHeightNeededInAccessoryForItemAtIndexPath:(id)a4;
- (double)layout:(id)a3 minimumVisibleAccessoryHeightForItemAtIndexPath:(id)a4;
- (double)layout:(id)a3 minimumVisibleContentHeightForItemAtIndexPath:(id)a4;
- (double)livePhotoVideoPlaybackTileViewControllerExtraMinimumTouchDuration:(id)a3 locationProvider:(id)a4;
- (double)oneUpActionsControllerBottomPaddingForPresentingToast:(id)a3;
- (double)playButtonTileViewController:(id)a3 delayForButtonAnimation:(BOOL)a4;
- (double)px_HDRFocus;
- (double)px_imageModulationIntensity;
- (double)tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:(id)a3;
- (id)_assetDisplayDescriptorForAsset:(id)a3;
- (id)_assetReferenceAtIndexPath:(id)a3 layout:(id)a4;
- (id)_assetViewModelAtIndexPath:(id)a3 layout:(id)a4;
- (id)_assetsToPrefetch;
- (id)_assetsToPrefetchUsingDataSource:(id)a3 startingAt:(id)a4 count:(int64_t)a5 reverseDirection:(BOOL)a6;
- (id)_contentTileControllerForAssetReference:(id)a3;
- (id)_cropButtonTileViewControllerForCurrentAsset;
- (id)_currentAccessoryViewController;
- (id)_currentAssetViewModel;
- (id)_currentContentTileController;
- (id)_currentPlaceholderSnapshotViewForTileController:(id)a3;
- (id)_leadingContentTileController;
- (id)_livePhotoBadge;
- (id)_newOneUpLayout;
- (id)_passthroughViews;
- (id)_presentedTileControllerForCurrentIndexPathWithKind:(id)a3;
- (id)_presentedTileControllerForIndexPath:(id)a3 kind:(id)a4;
- (id)_syndicationPillView;
- (id)_trailingContentTileController;
- (id)_userTransformTileControllerAtLocationFromProvider:(id)a3;
- (id)_userTransformTileViewControllerForCurrentAsset;
- (id)_videoPlayerAtIndexPath:(id)a3 layout:(id)a4;
- (id)accessoryTileViewControllerAccessoryViewController:(id)a3;
- (id)additionalContextMenuActionsForAttributionTileViewController:(id)a3;
- (id)barsControllerViewHostingGestureRecognizers:(id)a3;
- (id)browsingTileViewAnimator;
- (id)contentScrollView;
- (id)contentViewControllerForAirPlayController:(id)a3;
- (id)contentViewForImageAnalysisInteraction:(id)a3;
- (id)createAssetTransitionInfo;
- (id)currentImageAnalysisInteraction;
- (id)editActivityCompletion;
- (id)interactiveDismissalControllerDesignatedTileController:(id)a3;
- (id)irisImageTileViewController:(id)a3 delegateForGestureRecognizer:(id)a4;
- (id)keyCommands;
- (id)layout:(id)a3 modelTileTransformForItemAtIndexPath:(id)a4;
- (id)livePhotoVideoPlaybackTileViewControllerCurrentImage:(id)a3;
- (id)livePhotoVideoPlaybackTileViewControllerDisplayTileTransform:(id)a3;
- (id)oneUpChromeViewControllerExcludedMenuActionTypes:(id)a3;
- (id)oneUpChromeViewControllerFullSizeOneUpHostingView:(id)a3;
- (id)overOneUpPresentationSessionBrowserViewModel:(id)a3;
- (id)overOneUpPresentationSessionCreateIfNeeded:(BOOL)a3;
- (id)overOneUpPresentationSessionCurrentTileController:(id)a3;
- (id)ppt_deferredProcessingCompletionBlock;
- (id)presentationControllerForTipID:(id)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)pu_debugCurrentAsset;
- (id)pu_debugCurrentPrivacyController;
- (id)pu_debugCurrentViewModel;
- (id)pu_debugRows;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)sourceItemForTipID:(id)a3;
- (id)textsToHighlightForImageAnalysisInteraction:(id)a3;
- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5;
- (id)tilingView:(id)a3 scrollInfoWithLayout:(id)a4;
- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForLayoutInvalidationContext:(id)a4;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForReattachedTileControllers:(id)a4 context:(id)a5;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6;
- (id)tilingViewControllerTransition:(id)a3 tilingViewToTransferToEndPoint:(id)a4;
- (id)tipDismissedCompletion;
- (id)unlockDeviceHandlerWithActionType;
- (id)unlockDeviceStatus;
- (int)appearState;
- (int64_t)_accessoryContentKindForAsset:(id)a3;
- (int64_t)_accessoryContentKindForCurrentAsset;
- (int64_t)_insetModeForAsset:(id)a3;
- (int64_t)_windowInterfaceOrientation;
- (int64_t)detailsBecameVisibleSignPost;
- (int64_t)layout:(id)a3 insetModeForItemAtIndexPath:(id)a4;
- (int64_t)presentationOrigin;
- (int64_t)pu_preferredBarStyle;
- (int64_t)userTransformTileViewController:(id)a3 insetModeForItemAtIndexPath:(id)a4;
- (unint64_t)_initialActivity;
- (unint64_t)_options;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (unint64_t)touchingGestureRecognizerStateBeginID;
- (void)_abandonTileController:(id)a3;
- (void)_arrowKey:(id)a3;
- (void)_beginVKSubjectAnalyzingWithGestureRecognizer:(id)a3 beginID:(unint64_t)a4;
- (void)_browsingVideoPlayerDidPlayToEndTime:(id)a3;
- (void)_cancelTimedChromeAutoHide;
- (void)_chromeAutoHideTimerFired:(id)a3;
- (void)_configureAdoptedTileController:(id)a3;
- (void)_configureVitalityController;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_didEndTransition;
- (void)_dimFloatingInfoPanelAnimated:(BOOL)a3;
- (void)_dismissAnyPresentedTip;
- (void)_dismissFloatingInfoPanelAnimated:(BOOL)a3;
- (void)_dismissTipPopoverAnimated:(BOOL)a3;
- (void)_editAdjust:(id)a3;
- (void)_editCleanup:(id)a3;
- (void)_editCrop:(id)a3;
- (void)_editFilter:(id)a3;
- (void)_editStyles:(id)a3;
- (void)_handleDeferredProcessingFinishedForAssetUUID:(id)a3;
- (void)_handleSuggestedActionCompletedForTip:(id)a3 completion:(id)a4;
- (void)_handleTouchGesture:(id)a3;
- (void)_handleUnlockDeviceForActionType:(unint64_t)a3 success:(BOOL)a4;
- (void)_handleZoomOutCurrentAsset;
- (void)_hideChromeOnPlayButtonTapWithItemIsNowPlaying:(BOOL)a3 buttonIsOverlayed:(BOOL)a4;
- (void)_hideOverlays;
- (void)_informVKCOverlayToKickOffSubjectAnalyzing;
- (void)_invalidateAccessoryView;
- (void)_invalidateAssetActionManager;
- (void)_invalidateBarsControllers;
- (void)_invalidateCachedBoopableItemProvider;
- (void)_invalidateChromeViewController;
- (void)_invalidateEditMode;
- (void)_invalidateImageAnalysisInteractionAdditionalActionInfoEdgeInsets;
- (void)_invalidateInfoPanelLayoutAnimated:(BOOL)a3;
- (void)_invalidateLayout;
- (void)_invalidatePreferredContentSize;
- (void)_invalidatePreloadInsets;
- (void)_invalidateSpec;
- (void)_invalidateTipPopovers;
- (void)_invalidateUserActivity;
- (void)_invalidateVideoPlayer;
- (void)_isPresentedForPreviewDidChange;
- (void)_keyboardWillShow:(id)a3;
- (void)_notifyTileIsReadyWithTimeOut:(double)a3 completionHandler:(id)a4;
- (void)_performNavigationToAssetDisplayDescriptor:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)_preheatAdjacentAssetsForPhotosDetailsContext;
- (void)_presentAlertForUnplayableAssetReference:(id)a3;
- (void)_presentFloatingInfoPanelAnimated:(BOOL)a3;
- (void)_scheduleTimedChromeAutoHide;
- (void)_setAccessoryVisible:(BOOL)a3;
- (void)_setAccessoryVisible:(BOOL)a3 changeReason:(int64_t)a4;
- (void)_setBackgroundTileViewController:(id)a3;
- (void)_setChromeAutoHideTimer:(id)a3;
- (void)_setContentUnavailableConfiguration:(id)a3;
- (void)_setDidPlayCurrentLivePhoto:(BOOL)a3;
- (void)_setHasShownRelevantTip:(BOOL)a3;
- (void)_setHiddenTilesController:(id)a3;
- (void)_setInitialActivity:(unint64_t)a3;
- (void)_setIrisPlaying:(BOOL)a3;
- (void)_setLayoutReferenceSize:(CGSize)a3;
- (void)_setLayoutSafeAreaInsets:(UIEdgeInsets)a3;
- (void)_setMainOneUpForSecondScreenBrowser:(id)a3;
- (void)_setNeedsUpdateAccessoryView:(BOOL)a3;
- (void)_setNeedsUpdateBarsController:(BOOL)a3;
- (void)_setNeedsUpdateEditMode:(BOOL)a3;
- (void)_setNeedsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets:(BOOL)a3;
- (void)_setNeedsUpdateLayout:(BOOL)a3;
- (void)_setNeedsUpdatePreferredContentSize:(BOOL)a3;
- (void)_setNeedsUpdatePreloadInsets:(BOOL)a3;
- (void)_setNeedsUpdateSpec:(BOOL)a3;
- (void)_setNeedsUpdateTipPopovers:(BOOL)a3;
- (void)_setNeedsUpdateUserActivity:(BOOL)a3;
- (void)_setNeedsUpdateVideoPlayer:(BOOL)a3;
- (void)_setOverOneUpPresentationSession:(id)a3;
- (void)_setPendingViewTransitionSize:(CGSize)a3;
- (void)_setPrefersHomeIndicatorHidden:(BOOL)a3;
- (void)_setPreloadInsetsBasedOffViewWidth:(double)a3;
- (void)_setReviewScreenControlBarTileViewController:(id)a3;
- (void)_setReviewScreenScrubberBarTileViewController:(id)a3;
- (void)_setReviewScreenTopBarTileViewController:(id)a3;
- (void)_setSecondScreenBrowser:(id)a3;
- (void)_setShouldDisableTransitionsUntilAppeared:(BOOL)a3;
- (void)_setShouldShowAccessoryAfterUnlock:(BOOL)a3;
- (void)_setTileKindsToHide:(id)a3;
- (void)_setTilingView:(id)a3;
- (void)_setWindowInterfaceOrientation:(int64_t)a3;
- (void)_toggleAccessoryVisibility;
- (void)_toggleCommentsVisibility;
- (void)_toggleDetailsVisibility;
- (void)_unhideOverlays;
- (void)_updateAccessoryViewIfNeeded;
- (void)_updateActiveVideoTilesCanDisplayVideo;
- (void)_updateBackgroundTileViewController;
- (void)_updateBarsControllerIfNeeded;
- (void)_updateChromeViewControllerDismissalProgress;
- (void)_updateChromeViewControllerIfNeeded;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateEditModeIfNeeded;
- (void)_updateFloatingInfoPanel;
- (void)_updateFloatingInfoPanelIfNeeded;
- (void)_updateGestureController;
- (void)_updateIfNeeded;
- (void)_updateImageAnalysisInteractionAdditionalActionInfoEdgeInsetsIfNeeded;
- (void)_updateImageAnalysisInteractionDelegate;
- (void)_updateLayout:(id)a3;
- (void)_updateLayoutIfNeeded;
- (void)_updateLayoutReferenceSize;
- (void)_updateMergedVideoProviderEnabled;
- (void)_updatePreferredContentSizeIfNeeded;
- (void)_updatePrefersHomeIndicatorHidden;
- (void)_updatePreloadInsetsIfNeeded;
- (void)_updateReviewScreenBars;
- (void)_updateSpecIfNeeded;
- (void)_updateTipPopoversIfNeeded;
- (void)_updateUserActivityIfNeeded;
- (void)_updateVideoPlayerIfNeeded;
- (void)_updateViewModelWithCurrentScrollPosition;
- (void)_updateWindowInterfaceOrientation;
- (void)_willBeginTransition;
- (void)_xct_beginSignpostingForImageTileImageLoadingAndProcessing;
- (void)_xct_endSignpostingForImageDeferredProcessing;
- (void)_xct_endSignpostingForImageFullQuality;
- (void)_xct_endSignpostingForImageTileImageLoadingAndProcessing;
- (void)accessoryVisibilityInteractionController:(id)a3 setAccessoryVisible:(BOOL)a4 changeReason:(int64_t)a5;
- (void)accessoryVisibilityInteractionControllerDidEnd:(id)a3;
- (void)addAssetsToAlbum:(id)a3;
- (void)addAssetsToLastUsedAlbum:(id)a3;
- (void)airPlayControllerScreenAvailabilityChanged:(id)a3;
- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4;
- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4;
- (void)autoEnhanceAssets:(id)a3;
- (void)badgeTileViewController:(id)a3 presentViewController:(id)a4;
- (void)badgeVisibilityDidChange:(id)a3;
- (void)barsControllerContentGuideInsetsDidChange:(id)a3;
- (void)copy:(id)a3;
- (void)copyAdjustments:(id)a3;
- (void)copyAdjustmentsSkippingOptions:(id)a3;
- (void)createMenuActionControllerForManagerIfNeeded:(id)a3 withPresentingViewController:(id)a4 regionOfInterestProvider:(id)a5;
- (void)cropButtonTileViewController:(id)a3 didSelectAspectRatio:(CGSize)a4;
- (void)dealloc;
- (void)deleteAssets:(id)a3;
- (void)dismissPresentedViewController:(id)a3 presentMenuWithCompletion:(id)a4;
- (void)duplicateAssets:(id)a3;
- (void)favoriteAssets:(id)a3;
- (void)hideAssets:(id)a3;
- (void)imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange:(id)a3;
- (void)imageAnalysisInteractionSubjectInteractionInProgressDidChange:(id)a3;
- (void)imageTileViewController:(id)a3 didDisplayFullQualityImageWithDeferredProcessingFinished:(BOOL)a4;
- (void)interactiveDismissalControllerChangedIsHandlingDismissalInteraction:(id)a3;
- (void)irisImageTileViewControllerDidBeginHinting:(id)a3;
- (void)irisImageTileViewControllerDidBeginPlaying:(id)a3;
- (void)irisImageTileViewControllerDidEndPlaying:(id)a3;
- (void)irisImageTileViewControllerDidEndVitality:(id)a3;
- (void)layout:(id)a3 willApplyDisplayTileTransform:(id)a4 forItemAtIndexPath:(id)a5;
- (void)livePhotoVideoPlaybackTileViewControllerDidEndPlaying:(id)a3;
- (void)livePhotoVideoPlaybackTileViewControllerWillBeginPlaying:(id)a3;
- (void)loadView;
- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5;
- (void)navigateToAssetDisplayDescriptor:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)oneUpAccessoryViewControllersManagerInvalidateAccessoryLayout:(id)a3;
- (void)oneUpActionsController:(id)a3 zoomAtLocationProvider:(id)a4;
- (void)oneUpActionsControllerToggleChromeVisibility:(id)a3;
- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6;
- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4;
- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4 options:(unint64_t)a5;
- (void)oneUpBarsController:(id)a3 didTapPlayPauseButton:(BOOL)a4;
- (void)oneUpBarsControllerDidChangeShowingPlayPauseButton:(id)a3;
- (void)oneUpBarsControllerDidTapTitle:(id)a3;
- (void)oneUpBarsControllerWillPresentActionsMenu:(id)a3 completionHandler:(id)a4;
- (void)oneUpChromeViewControllerAdditionalActionInfoEdgeInsetsDidChange:(id)a3;
- (void)oneUpChromeViewControllerLegibilityInsetsDidChange:(id)a3;
- (void)oneUpChromeViewControllerRequestDeviceUnlock:(id)a3 for:(unint64_t)a4;
- (void)overOneUpPresentationSession:(id)a3 didPresent:(id)a4;
- (void)overOneUpPresentationSessionDidFinish:(id)a3;
- (void)pasteAdjustments:(id)a3;
- (void)playButtonTileViewControllerDidTapButton:(id)a3;
- (void)ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout:(double)a3 handler:(id)a4;
- (void)ppt_notifyWhenVKAnalysisIsReadyWithTimeout:(double)a3 handler:(id)a4;
- (void)ppt_playCurrentLivePhotoWithCompletionHandler:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)prepareTipPopover:(id)a3 tipID:(id)a4;
- (void)presentErrorFromLoadingIndicator:(id)a3;
- (void)presentPeopleViewController:(id)a3;
- (void)printAssets:(id)a3;
- (void)purgeIfPossible;
- (void)pushPeopleViewController:(id)a3;
- (void)restoreAssets:(id)a3;
- (void)restoreAssetsWithoutConfirmation:(id)a3;
- (void)revertAdjustments:(id)a3;
- (void)rotateAssetsClockwise:(id)a3;
- (void)rotateAssetsCounterclockwise:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowsPreviewActions:(BOOL)a3;
- (void)setAppearState:(int)a3;
- (void)setAppearanceTransitionAnimationsDisabled:(BOOL)a3;
- (void)setAssetUUIDsAllowedToHighlightText:(id)a3;
- (void)setBoopableItemsProvider:(id)a3;
- (void)setBrowsingOneUpVisibilityHelper:(id)a3;
- (void)setCardPresentationController:(id)a3;
- (void)setCurrentFloatingInfoPanelAccessoryViewController:(id)a3;
- (void)setDetailsBecameVisibleSignPost:(int64_t)a3;
- (void)setEditActivityCompletion:(id)a3;
- (void)setLastLivePhotoGestureLocationProvider:(id)a3;
- (void)setNeedsUpdateChromeViewController:(BOOL)a3;
- (void)setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:(id)a3;
- (void)setPpt_deferredProcessingCompletionBlock:(id)a3;
- (void)setPpt_deferredProcessingWaitTimer:(id)a3;
- (void)setPreferredContentSizeOverride:(CGSize)a3;
- (void)setPresentedTipID:(id)a3;
- (void)setSiriActionActivity:(id)a3;
- (void)setTextsToHighlight:(id)a3;
- (void)setTipDismissedCompletion:(id)a3;
- (void)setTouchingGestureRecognizerStateBeginID:(unint64_t)a3;
- (void)setUnlockDeviceHandlerWithActionType:(id)a3;
- (void)setUnlockDeviceStatus:(id)a3;
- (void)setUuidOfAssetPresentedInFloatingInfoPanel:(id)a3;
- (void)setWasChromeVisibleBeforeZoomIn:(BOOL)a3;
- (void)setXct_waitForDeferredProcessingTimer:(id)a3;
- (void)setXct_waitForFullQualityImageTimer:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)shareAssets:(id)a3;
- (void)showDetailsViewForImageAnalysisInteraction:(id)a3;
- (void)tilingViewControllerTransition:(id)a3 abandonTilingView:(id)a4 toEndPoint:(id)a5;
- (void)tilingViewControllerTransition:(id)a3 adoptTilingView:(id)a4 fromEndPoint:(id)a5 isCancelingTransition:(BOOL)a6 animationSetupCompletionHandler:(id)a7;
- (void)tipPopoverDidDismissWithTipID:(id)a3;
- (void)tipPopoverDidPresentWithTipID:(id)a3;
- (void)toggleEditor:(id)a3;
- (void)togglePlayback:(id)a3;
- (void)toggleViewer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)trashAssets:(id)a3;
- (void)trashAssetsWithoutConfirmation:(id)a3;
- (void)userTransformTileViewController:(id)a3 didChangeIsUserInteracting:(BOOL)a4;
- (void)validateCommand:(id)a3;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUOneUpViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDsAllowedToHighlightText, 0);
  objc_storeStrong((id *)&self->_textsToHighlight, 0);
  objc_storeStrong((id *)&self->_xct_waitForDeferredProcessingTimer, 0);
  objc_storeStrong((id *)&self->_xct_waitForFullQualityImageTimer, 0);
  objc_storeStrong(&self->_ppt_deferredProcessingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_ppt_deferredProcessingWaitTimer, 0);
  objc_storeStrong((id *)&self->_ppt_assetUUIDNeedsDeferredProcessingFinishNotification, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_lastLivePhotoGestureLocationProvider, 0);
  objc_storeStrong((id *)&self->_uuidOfAssetPresentedInFloatingInfoPanel, 0);
  objc_destroyWeak((id *)&self->_currentFloatingInfoPanelAccessoryViewController);
  objc_storeStrong((id *)&self->_visualImageAnalyzingController, 0);
  objc_storeStrong(&self->_tipDismissedCompletion, 0);
  objc_storeStrong((id *)&self->_presentedTipID, 0);
  objc_storeStrong((id *)&self->_activeVideoTileControllers, 0);
  objc_storeStrong((id *)&self->_browsingOneUpVisibilityHelper, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorController, 0);
  objc_storeStrong((id *)&self->__accessoryVisibilityInteractionController, 0);
  objc_storeStrong((id *)&self->__accessoryViewControllersManager, 0);
  objc_storeStrong((id *)&self->__parallaxComputer, 0);
  objc_storeStrong((id *)&self->__overOneUpPresentationSession, 0);
  objc_storeStrong((id *)&self->__tileKindsToHide, 0);
  objc_storeStrong((id *)&self->__hiddenTilesController, 0);
  objc_storeStrong((id *)&self->__chromeAutoHideTimer, 0);
  objc_destroyWeak((id *)&self->__mainOneUpForSecondScreenBrowser);
  objc_storeStrong((id *)&self->__secondScreenBrowser, 0);
  objc_storeStrong((id *)&self->__reviewScreenTopBarTileViewController, 0);
  objc_storeStrong((id *)&self->__reviewScreenControlBarTileViewController, 0);
  objc_storeStrong((id *)&self->__reviewScreenScrubberBarTileViewController, 0);
  objc_storeStrong((id *)&self->__backgroundTileViewController, 0);
  objc_storeStrong((id *)&self->__gestureRecognizerCoordinator, 0);
  objc_storeStrong((id *)&self->__doubleTapZoomController, 0);
  objc_storeStrong((id *)&self->__interactivePinchDismissalController, 0);
  objc_storeStrong((id *)&self->__interactiveSwipeDismissalController, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->__barsController, 0);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_preheatAssetsQueue, 0);
  objc_storeStrong(&self->_editActivityCompletion, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->cardPresentationController, 0);
  objc_storeStrong((id *)&self->_menuActionController, 0);
  objc_storeStrong((id *)&self->_scrubbingIdentifier, 0);
}

- (void)setPreferredContentSizeOverride:(CGSize)a3
{
  self->_preferredContentSizeOverride = a3;
}

- (CGSize)preferredContentSizeOverride
{
  double width = self->_preferredContentSizeOverride.width;
  double height = self->_preferredContentSizeOverride.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAssetUUIDsAllowedToHighlightText:(id)a3
{
}

- (NSArray)assetUUIDsAllowedToHighlightText
{
  return self->_assetUUIDsAllowedToHighlightText;
}

- (void)setTextsToHighlight:(id)a3
{
}

- (NSArray)textsToHighlight
{
  return self->_textsToHighlight;
}

- (PUMenuActionController)menuActionController
{
  return self->_menuActionController;
}

- (int64_t)presentationOrigin
{
  return self->_presentationOrigin;
}

- (void)setAllowsPreviewActions:(BOOL)a3
{
  self->_allowsPreviewActions = a3;
}

- (BOOL)allowsPreviewActions
{
  return self->_allowsPreviewActions;
}

- (BOOL)appearanceTransitionAnimationsDisabled
{
  return self->_appearanceTransitionAnimationsDisabled;
}

- (void)setXct_waitForDeferredProcessingTimer:(id)a3
{
}

- (NSTimer)xct_waitForDeferredProcessingTimer
{
  return self->_xct_waitForDeferredProcessingTimer;
}

- (void)setXct_waitForFullQualityImageTimer:(id)a3
{
}

- (NSTimer)xct_waitForFullQualityImageTimer
{
  return self->_xct_waitForFullQualityImageTimer;
}

- (void)setPpt_deferredProcessingCompletionBlock:(id)a3
{
}

- (id)ppt_deferredProcessingCompletionBlock
{
  return self->_ppt_deferredProcessingCompletionBlock;
}

- (void)setPpt_deferredProcessingWaitTimer:(id)a3
{
}

- (NSTimer)ppt_deferredProcessingWaitTimer
{
  return self->_ppt_deferredProcessingWaitTimer;
}

- (void)setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:(id)a3
{
}

- (NSString)ppt_assetUUIDNeedsDeferredProcessingFinishNotification
{
  return self->_ppt_assetUUIDNeedsDeferredProcessingFinishNotification;
}

- (void)setWasChromeVisibleBeforeZoomIn:(BOOL)a3
{
  self->_wasChromeVisibleBeforeZoomIn = a3;
}

- (BOOL)wasChromeVisibleBeforeZoomIn
{
  return self->_wasChromeVisibleBeforeZoomIn;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setLastLivePhotoGestureLocationProvider:(id)a3
{
}

- (PUDisplayLocationProvider)lastLivePhotoGestureLocationProvider
{
  return self->_lastLivePhotoGestureLocationProvider;
}

- (void)setTouchingGestureRecognizerStateBeginID:(unint64_t)a3
{
  self->_touchingGestureRecognizerStateBeginID = a3;
}

- (unint64_t)touchingGestureRecognizerStateBeginID
{
  return self->_touchingGestureRecognizerStateBeginID;
}

- (void)setUuidOfAssetPresentedInFloatingInfoPanel:(id)a3
{
}

- (NSString)uuidOfAssetPresentedInFloatingInfoPanel
{
  return self->_uuidOfAssetPresentedInFloatingInfoPanel;
}

- (void)setCurrentFloatingInfoPanelAccessoryViewController:(id)a3
{
}

- (PUAccessoryContentViewController)currentFloatingInfoPanelAccessoryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentFloatingInfoPanelAccessoryViewController);
  return (PUAccessoryContentViewController *)WeakRetained;
}

- (PUOneUpVisualImageAnalyzingController)visualImageAnalyzingController
{
  return self->_visualImageAnalyzingController;
}

- (void)setDetailsBecameVisibleSignPost:(int64_t)a3
{
  self->_detailsBecameVisibleSignPost = a3;
}

- (int64_t)detailsBecameVisibleSignPost
{
  return self->_detailsBecameVisibleSignPost;
}

- (void)setTipDismissedCompletion:(id)a3
{
}

- (id)tipDismissedCompletion
{
  return self->_tipDismissedCompletion;
}

- (void)setPresentedTipID:(id)a3
{
}

- (NSString)presentedTipID
{
  return self->_presentedTipID;
}

- (NSMutableSet)activeVideoTileControllers
{
  return self->_activeVideoTileControllers;
}

- (void)setBrowsingOneUpVisibilityHelper:(id)a3
{
}

- (PUBrowsingOneUpVisibilityHelper)browsingOneUpVisibilityHelper
{
  return self->_browsingOneUpVisibilityHelper;
}

- (BOOL)_prefersHomeIndicatorHidden
{
  return self->__prefersHomeIndicatorHidden;
}

- (void)setBoopableItemsProvider:(id)a3
{
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setSiriActionActivity:(id)a3
{
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)_setDidPlayCurrentLivePhoto:(BOOL)a3
{
  self->__didPlayCurrentLivePhoto = a3;
}

- (BOOL)_didPlayCurrentLivePhoto
{
  return self->__didPlayCurrentLivePhoto;
}

- (PUOneUpEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PULoadingIndicatorController)loadingIndicatorController
{
  return self->_loadingIndicatorController;
}

- (void)_setShouldShowAccessoryAfterUnlock:(BOOL)a3
{
  self->__shouldShowAccessoryAfterUnlock = a3;
}

- (BOOL)_shouldShowAccessoryAfterUnlock
{
  return self->__shouldShowAccessoryAfterUnlock;
}

- (PUAccessoryVisibilityInteractionController)_accessoryVisibilityInteractionController
{
  return self->__accessoryVisibilityInteractionController;
}

- (PUOneUpAccessoryViewControllersManager)_accessoryViewControllersManager
{
  return self->__accessoryViewControllersManager;
}

- (PUParallaxComputer)_parallaxComputer
{
  return self->__parallaxComputer;
}

- (void)_setShouldDisableTransitionsUntilAppeared:(BOOL)a3
{
  self->__shouldDisableTransitionsUntilAppeared = a3;
}

- (BOOL)_shouldDisableTransitionsUntilAppeared
{
  return self->__shouldDisableTransitionsUntilAppeared;
}

- (BOOL)_isIrisPlaying
{
  return self->__isIrisPlaying;
}

- (void)_setPreloadInsetsBasedOffViewWidth:(double)a3
{
  self->__preloadInsetsBasedOffViewWidth = a3;
}

- (double)_preloadInsetsBasedOffViewWidth
{
  return self->__preloadInsetsBasedOffViewWidth;
}

- (void)_setPendingViewTransitionSize:(CGSize)a3
{
  self->__pendingViewTransitionSize = a3;
}

- (CGSize)_pendingViewTransitionSize
{
  double width = self->__pendingViewTransitionSize.width;
  double height = self->__pendingViewTransitionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setInitialActivity:(unint64_t)a3
{
  self->__initialActivity = a3;
}

- (unint64_t)_initialActivity
{
  return self->__initialActivity;
}

- (void)_setOverOneUpPresentationSession:(id)a3
{
}

- (PUOverOneUpPresentationSession)_overOneUpPresentationSession
{
  return self->__overOneUpPresentationSession;
}

- (void)_setTileKindsToHide:(id)a3
{
}

- (void)_setHiddenTilesController:(id)a3
{
}

- (NSArray)_hiddenTilesController
{
  return self->__hiddenTilesController;
}

- (void)_setChromeAutoHideTimer:(id)a3
{
}

- (NSTimer)_chromeAutoHideTimer
{
  return self->__chromeAutoHideTimer;
}

- (BOOL)_prefersCompactLayoutForSplitScreen
{
  return self->__prefersCompactLayoutForSplitScreen;
}

- (BOOL)_isPresentedForSecondScreen
{
  return self->__isPresentedForSecondScreen;
}

- (void)_setMainOneUpForSecondScreenBrowser:(id)a3
{
}

- (PUOneUpViewController)_mainOneUpForSecondScreenBrowser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__mainOneUpForSecondScreenBrowser);
  return (PUOneUpViewController *)WeakRetained;
}

- (PUOneUpViewController)_secondScreenBrowser
{
  return self->__secondScreenBrowser;
}

- (int64_t)_windowInterfaceOrientation
{
  return self->__windowInterfaceOrientation;
}

- (void)_setReviewScreenTopBarTileViewController:(id)a3
{
}

- (PUReviewScreenTopBarTileViewController)_reviewScreenTopBarTileViewController
{
  return self->__reviewScreenTopBarTileViewController;
}

- (void)_setReviewScreenControlBarTileViewController:(id)a3
{
}

- (PUReviewScreenControlBarTileViewController)_reviewScreenControlBarTileViewController
{
  return self->__reviewScreenControlBarTileViewController;
}

- (void)_setReviewScreenScrubberBarTileViewController:(id)a3
{
}

- (PUReviewScreenScrubberBarTileViewController)_reviewScreenScrubberBarTileViewController
{
  return self->__reviewScreenScrubberBarTileViewController;
}

- (void)_setBackgroundTileViewController:(id)a3
{
}

- (PUBrowsingBackgroundTileViewController)_backgroundTileViewController
{
  return self->__backgroundTileViewController;
}

- (PUOneUpGestureRecognizerCoordinator)_gestureRecognizerCoordinator
{
  return self->__gestureRecognizerCoordinator;
}

- (PUDoubleTapZoomController)_doubleTapZoomController
{
  return self->__doubleTapZoomController;
}

- (PUInteractivePinchDismissalController)_interactivePinchDismissalController
{
  return self->__interactivePinchDismissalController;
}

- (PUInteractiveSwipeDismissalController)_interactiveSwipeDismissalController
{
  return self->__interactiveSwipeDismissalController;
}

- (PUOneUpFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (PUOneUpGestureController)gestureController
{
  return self->_gestureController;
}

- (PUOneUpChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (PUOneUpBarsController)_barsController
{
  return self->__barsController;
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (int)appearState
{
  return self->_appearState;
}

- (UIEdgeInsets)_layoutSafeAreaInsets
{
  double top = self->__layoutSafeAreaInsets.top;
  double left = self->__layoutSafeAreaInsets.left;
  double bottom = self->__layoutSafeAreaInsets.bottom;
  double right = self->__layoutSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)_layoutReferenceSize
{
  double width = self->__layoutReferenceSize.width;
  double height = self->__layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PUOneUpViewControllerSpec)_spec
{
  return self->__spec;
}

- (void)_setHasShownRelevantTip:(BOOL)a3
{
  self->__hasShownRelevantTip = a3;
}

- (BOOL)_hasShownRelevantTip
{
  return self->__hasShownRelevantTip;
}

- (void)_setNeedsUpdateTipPopovers:(BOOL)a3
{
  self->__needsUpdateTipsPopover = a3;
}

- (BOOL)_needsUpdateTipsPopover
{
  return self->__needsUpdateTipsPopover;
}

- (void)_setNeedsUpdateAccessoryView:(BOOL)a3
{
  self->__needsUpdateAccessoryView = a3;
}

- (BOOL)_needsUpdateAccessoryView
{
  return self->__needsUpdateAccessoryView;
}

- (void)_setNeedsUpdateUserActivity:(BOOL)a3
{
  self->__needsUpdateUserActivity = a3;
}

- (BOOL)_needsUpdateUserActivity
{
  return self->__needsUpdateUserActivity;
}

- (void)_setNeedsUpdateVideoPlayer:(BOOL)a3
{
  self->__needsUpdateVideoPlayer = a3;
}

- (BOOL)_needsUpdateVideoPlayer
{
  return self->__needsUpdateVideoPlayer;
}

- (void)_setNeedsUpdatePreferredContentSize:(BOOL)a3
{
  self->__needsUpdatePreferredContentSize = a3;
}

- (BOOL)_needsUpdatePreferredContentSize
{
  return self->__needsUpdatePreferredContentSize;
}

- (void)setNeedsUpdateChromeViewController:(BOOL)a3
{
  self->_needsUpdateChromeViewController = a3;
}

- (BOOL)needsUpdateChromeViewController
{
  return self->_needsUpdateChromeViewController;
}

- (void)_setNeedsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets:(BOOL)a3
{
  self->__needsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets = a3;
}

- (BOOL)_needsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets
{
  return self->__needsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets;
}

- (void)_setNeedsUpdateEditMode:(BOOL)a3
{
  self->__needsUpdateEditMode = a3;
}

- (BOOL)_needsUpdateEditMode
{
  return self->__needsUpdateEditMode;
}

- (void)_setNeedsUpdateLayout:(BOOL)a3
{
  self->__needsUpdateLayout = a3;
}

- (BOOL)_needsUpdateLayout
{
  return self->__needsUpdateLayout;
}

- (void)_setNeedsUpdatePreloadInsets:(BOOL)a3
{
  self->__needsUpdatePreloadInsets = a3;
}

- (BOOL)_needsUpdatePreloadInsets
{
  return self->__needsUpdatePreloadInsets;
}

- (void)_setNeedsUpdateBarsController:(BOOL)a3
{
  self->__needsUpdateBarsController = a3;
}

- (BOOL)_needsUpdateBarsController
{
  return self->__needsUpdateBarsController;
}

- (void)_setNeedsUpdateSpec:(BOOL)a3
{
  self->__needsUpdateSpec = a3;
}

- (BOOL)_needsUpdateSpec
{
  return self->__needsUpdateSpec;
}

- (OS_dispatch_queue)preheatAssetsQueue
{
  return self->_preheatAssetsQueue;
}

- (unint64_t)_options
{
  return self->__options;
}

- (void)setEditActivityCompletion:(id)a3
{
}

- (id)editActivityCompletion
{
  return self->_editActivityCompletion;
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (PUOneUpActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setCardPresentationController:(id)a3
{
}

- (PXFloatingCardPresentationController)cardPresentationController
{
  return self->cardPresentationController;
}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  v16 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!v16)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 7077, @"Invalid parameter not satisfying: %@", @"assetHandler" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 7078, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_3:
  v8 = [(PUOneUpViewController *)self browsingSession];
  v9 = [v8 viewModel];
  v10 = [v9 currentAssetReference];
  v11 = [v10 asset];

  id v12 = v11;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v13 = v12;

    if (v13) {
      v16[2](v16, v13, 1);
    }
  }
  else
  {

    id v13 = 0;
  }
  v7[2](v7);
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  v16 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!v16)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 7064, @"Invalid parameter not satisfying: %@", @"assetCollectionHandler" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 7065, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_3:
  v8 = [(PUOneUpViewController *)self browsingSession];
  v9 = [v8 viewModel];
  v10 = [v9 currentAssetReference];
  v11 = [v10 assetCollection];

  id v12 = v11;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v13 = v12;

    if (v13) {
      v16[2](v16, v13, 1);
    }
  }
  else
  {

    id v13 = 0;
  }
  v7[2](v7);
}

- (BOOL)xct_isCurrentImageDeferredProcessingFinished
{
  v2 = [(PUOneUpViewController *)self _currentContentTileController];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 isDeferredProcessingFinished];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)xct_isCurrentImageFullQuality
{
  v2 = [(PUOneUpViewController *)self _currentContentTileController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 isDisplayingFullQualityImage];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)_xct_endSignpostingForImageDeferredProcessing
{
  char v3 = [(PUOneUpViewController *)self xct_waitForDeferredProcessingTimer];
  int v4 = [v3 isValid];

  if (v4)
  {
    v5 = [(PUOneUpViewController *)self xct_waitForDeferredProcessingTimer];
    [v5 invalidate];

    v6 = PLOneUpGetLog();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", "", buf, 2u);
    }

    v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp (+ Deferred Processing done) stop. (forced to end)", v8, 2u);
    }
  }
  [(PUOneUpViewController *)self setXct_waitForDeferredProcessingTimer:0];
}

- (void)_xct_endSignpostingForImageFullQuality
{
  char v3 = [(PUOneUpViewController *)self xct_waitForFullQualityImageTimer];
  int v4 = [v3 isValid];

  if (v4)
  {
    v5 = [(PUOneUpViewController *)self xct_waitForFullQualityImageTimer];
    [v5 invalidate];

    v6 = PLOneUpGetLog();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", "", buf, 2u);
    }

    v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp stop. (forced to end)", v8, 2u);
    }
  }
  [(PUOneUpViewController *)self setXct_waitForFullQualityImageTimer:0];
}

- (void)_xct_endSignpostingForImageTileImageLoadingAndProcessing
{
  [(PUOneUpViewController *)self _xct_endSignpostingForImageFullQuality];
  [(PUOneUpViewController *)self _xct_endSignpostingForImageDeferredProcessing];
}

- (void)_xct_beginSignpostingForImageTileImageLoadingAndProcessing
{
  [(PUOneUpViewController *)self _xct_endSignpostingForImageTileImageLoadingAndProcessing];
  char v3 = PLOneUpGetLog();
  int v4 = [(PUOneUpViewController *)self _currentContentTileController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", "", buf, 2u);
    }
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", "", buf, 2u);
    }
    v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp start.", buf, 2u);
    }

    if ([v4 isDisplayingFullQualityImage])
    {
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", "", buf, 2u);
      }
      v6 = PLOneUpGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp stop.", buf, 2u);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F1CB00];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke;
      v20[3] = &unk_1E5F2D570;
      v21 = v3;
      id v12 = [v11 scheduledTimerWithTimeInterval:0 repeats:v20 block:3.0];
      [(PUOneUpViewController *)self setXct_waitForFullQualityImageTimer:v12];

      v6 = v21;
    }

    if (![v4 isDeferredProcessingFinished])
    {
      id v13 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke_1021;
      v18 = &unk_1E5F2D570;
      v19 = v3;
      v14 = [v13 scheduledTimerWithTimeInterval:0 repeats:&v15 block:3.0];
      -[PUOneUpViewController setXct_waitForDeferredProcessingTimer:](self, "setXct_waitForDeferredProcessingTimer:", v14, v15, v16, v17, v18);

      v7 = v19;
      goto LABEL_23;
    }
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", "", buf, 2u);
    }
    v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "1Up signpost: timeToSharp (+ Deferred Processing done) stop.";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      goto LABEL_21;
    }
  }
  else
  {
    v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "1Up signpost: no contentTileController or not image tile when 1Up did appear";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_1AE9F8000, v9, v10, v8, buf, 2u);
    }
  }
LABEL_23:
}

void __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", "", buf, 2u);
  }
  v5 = PLOneUpGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp stop. (time's up)", v6, 2u);
  }
}

void __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke_1021(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", "", buf, 2u);
  }
  v5 = PLOneUpGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp (+ Deferred Processing done) stop. (time's up)", v6, 2u);
  }
}

- (void)_invalidateCachedBoopableItemProvider
{
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (activityItemsConfiguration_onceToken != -1) {
    dispatch_once(&activityItemsConfiguration_onceToken, &__block_literal_global_1015);
  }
  id v3 = [(PUOneUpViewController *)self browsingSession];
  int v4 = [v3 viewModel];

  if ([v4 contentPrivacyState] != 1)
  {
    v7 = [v4 currentAssetReference];
    v8 = [v7 asset];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = v8;

      if (v9)
      {
        os_log_type_t v10 = [(PUOneUpViewController *)self boopableItemsProvider];

        if (!v10)
        {
          v11 = (void *)activityItemsConfiguration_boopLog;
          if (os_log_type_enabled((os_log_t)activityItemsConfiguration_boopLog, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = v11;
            id v13 = [v9 uuid];
            *(_DWORD *)buf = 138543362;
            v24 = v13;
            _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Creating boopable item provider for 1up asset %{public}@", buf, 0xCu);
          }
          id v14 = objc_alloc_init(MEMORY[0x1E4F90018]);
          [(PUOneUpViewController *)self setBoopableItemsProvider:v14];

          id v22 = v9;
          uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          uint64_t v16 = [(PUOneUpViewController *)self boopableItemsProvider];
          [v16 setAssets:v15];

          v17 = [MEMORY[0x1E4F91288] defaultManager];
          v18 = [v17 imageProviderForAsset:v9];

          v19 = [(PUOneUpViewController *)self boopableItemsProvider];
          [v19 setImagePreviewMediaProvider:v18];
        }
        v6 = [(PUOneUpViewController *)self boopableItemsProvider];
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    v20 = activityItemsConfiguration_boopLog;
    if (os_log_type_enabled((os_log_t)activityItemsConfiguration_boopLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "Couldn't create an 1up boopable item provider because the current asset is not a PHAsset: %@", buf, 0xCu);
    }
    id v9 = 0;
    v6 = 0;
    goto LABEL_19;
  }
  v5 = activityItemsConfiguration_boopLog;
  if (os_log_type_enabled((os_log_t)activityItemsConfiguration_boopLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Couldn't create an 1up boopable item provider because 1up is currently locked", buf, 2u);
  }
  v6 = 0;
LABEL_20:

  return (UIActivityItemsConfigurationReading *)v6;
}

void __51__PUOneUpViewController_activityItemsConfiguration__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "BoopActivityItems");
  v1 = (void *)activityItemsConfiguration_boopLog;
  activityItemsConfiguration_boopLog = (uint64_t)v0;
}

- (void)_updateUserActivityIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdateUserActivity])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateUserActivity:0];
    id v3 = [(PUOneUpViewController *)self browsingSession];
    int v4 = [v3 viewModel];

    if (([v4 isScrubbing] & 1) == 0)
    {
      v5 = [v4 currentAssetReference];
      v6 = [v5 asset];
      v7 = v6;
      if (v6)
      {
        v8 = [v6 creationDate];
        [v8 timeIntervalSinceNow];
        double v10 = v9;
        if (objc_msgSend(MEMORY[0x1E4F22488], "px_allowsDonationsForCurrentProcess"))
        {
          BOOL v11 = v10 <= 0.0 && v10 >= -86400.0;
          if (([(PUOneUpViewController *)self _options] & 0x2000) != 0) {
            BOOL v11 = 0;
          }
        }
        else
        {
          BOOL v11 = 0;
        }
        id v12 = (void *)MEMORY[0x1E4F22488];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __52__PUOneUpViewController__updateUserActivityIfNeeded__block_invoke_2;
        v13[3] = &unk_1E5F28160;
        v13[4] = self;
        id v14 = v7;
        BOOL v16 = v11;
        id v15 = v5;
        objc_msgSend(v12, "px_requestActivityWithActivityType:titleProvider:completionBlock:", @"com.apple.mobileslideshow.oneUp", &__block_literal_global_996, v13);
      }
    }
  }
}

void __52__PUOneUpViewController__updateUserActivityIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) browsingSession];
  v5 = [v4 viewModel];
  v6 = [v5 currentAssetReference];
  v7 = [v6 asset];

  if ([v7 isEqual:*(void *)(a1 + 40)])
  {
    [v3 setEligibleForSearch:*(unsigned __int8 *)(a1 + 56)];
    [v3 _setEligibleForPrediction:*(unsigned __int8 *)(a1 + 56)];
    [v3 setEligibleForHandoff:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [v3 setRequiredUserInfoKeys:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v3, "px_setPersistentIdentifierFromAsset:", *(void *)(a1 + 40));
    }
    double v9 = [*(id *)(a1 + 48) assetCollection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v9;
      id v10 = v9;
      v26[0] = @"selectedUUIDs";
      v20 = [*(id *)(a1 + 40) uuid];
      uint64_t v25 = v20;
      BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      v27[0] = v11;
      v26[1] = @"collectionType";
      id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "assetCollectionType"));
      v27[1] = v12;
      v26[2] = @"collectionSubtype";
      id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "assetCollectionSubtype"));
      v27[2] = v13;
      v26[3] = @"albumUUID";
      id v14 = [v10 uuid];
      v27[3] = v14;
      v26[4] = @"timestamp";
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      v27[4] = v15;
      BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
      [v3 setUserInfo:v16];

      if (!PLIsMobileSlideShow())
      {
        double v9 = v21;
        goto LABEL_10;
      }
      v17 = [*(id *)(a1 + 32) view];
      v18 = [v17 window];
      v19 = [v18 windowScene];
      [v19 setUserActivity:v3];

      double v9 = v21;
    }
    else
    {
      v23 = @"selectedUUIDs";
      id v10 = [*(id *)(a1 + 40) uuid];
      id v22 = v10;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      v24 = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v3 setUserInfo:v18];
    }

LABEL_10:
    [*(id *)(a1 + 32) setSiriActionActivity:v3];
    [v3 becomeCurrent];
  }
}

NSString *__52__PUOneUpViewController__updateUserActivityIfNeeded__block_invoke()
{
  return +[PUOneUpViewController oneUpActivityTitle];
}

- (void)_invalidateUserActivity
{
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  id v23 = a5;
  id v8 = a4;
  double v9 = [(PUOneUpViewController *)self browsingSession];
  id v10 = [v9 viewModel];
  BOOL v11 = [v10 currentAssetReference];
  id v12 = [v11 asset];

  id v13 = [v8 error];

  if (v13)
  {
    id v14 = [v12 uuid];
    int v15 = [v23 isEqual:v14];

    if (v15)
    {
      BOOL v16 = [PUEditingErrorPresentationController alloc];
      id v17 = v12;
      v18 = v17;
      if (v17)
      {
        if ([v17 conformsToProtocol:&unk_1F07DC5A8])
        {
LABEL_5:
          v19 = [(PUEditingErrorPresentationController *)v16 initWithError:v13 forAsset:v18];

          v20 = [(PUErrorPresentationController *)v19 alertControllerWithCompletion:&__block_literal_global_984];
          [(PUOneUpViewController *)self presentViewController:v20 animated:1 completion:0];

          goto LABEL_6;
        }
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        id v22 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
        [v21 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6837, @"%@ should conform to protocol %@, but %@ doesn't", @"asset", @"PUEditableAsset", v22 object file lineNumber description];
      }
      else
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6837, @"%@ should conform to protocol %@, but it is nil", @"asset", @"PUEditableAsset" object file lineNumber description];
      }

      goto LABEL_5;
    }
  }
LABEL_6:
}

- (id)_assetDisplayDescriptorForAsset:(id)a3
{
  id v3 = a3;
  int v4 = [[PUAssetReference alloc] initWithAsset:v3 assetCollection:0 indexPath:0 dataSourceIdentifier:0];

  v5 = +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:v4];

  return v5;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = [a3 asset];
  double v9 = [(PUOneUpViewController *)self _assetDisplayDescriptorForAsset:v8];

  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  BOOL v11 = [MEMORY[0x1E4F8FFA0] sharedInstance];
  [v11 defaultNavigationTimeoutDuration];
  id v12 = objc_msgSend(v10, "dateWithTimeIntervalSinceNow:");

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PUOneUpViewController_navigateToDestination_options_completionHandler___block_invoke;
  v14[3] = &unk_1E5F2DB20;
  id v15 = v7;
  id v13 = v7;
  [(PUOneUpViewController *)self navigateToAssetDisplayDescriptor:v9 beforeDate:v12 completionHandler:v14];
}

uint64_t __73__PUOneUpViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 7
    && ([v4 asset], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [v4 asset];
    id v7 = [(PUOneUpViewController *)self _assetDisplayDescriptorForAsset:v6];

    LODWORD(v8) = [(PUOneUpViewController *)self _canAttemptNavigationToAssetDisplayDescriptor:v7];
    unint64_t v8 = v8;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)_cropButtonTileViewControllerForCurrentAsset
{
  id v4 = [(PUOneUpViewController *)self _presentedTileControllerForCurrentIndexPathWithKind:PUTileKindCropButton];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = (objc_class *)objc_opt_class();
      unint64_t v8 = NSStringFromClass(v7);
      double v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6804, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self _presentedTileControllerForCurrentIndexPathWithKind:PUTileKindCropButton]", v8, v9 object file lineNumber description];
    }
  }
  return v4;
}

- (id)_userTransformTileViewControllerForCurrentAsset
{
  id v4 = [(PUOneUpViewController *)self _presentedTileControllerForCurrentIndexPathWithKind:PUTileKindUserTransform];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = (objc_class *)objc_opt_class();
      unint64_t v8 = NSStringFromClass(v7);
      double v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6800, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self _presentedTileControllerForCurrentIndexPathWithKind:PUTileKindUserTransform]", v8, v9 object file lineNumber description];
    }
  }
  return v4;
}

- (void)_informVKCOverlayToKickOffSubjectAnalyzing
{
  uint64_t v3 = +[PUOneUpSettings sharedInstance];
  int v4 = [v3 allowsVisualIntelligenceRemoveBackground];

  if (v4)
  {
    id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
    [v5 beginImageSubjectAnalysisIfNecessary];
  }
}

- (BOOL)_isLocationFromProviderOverSyndicationAttributionPill:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [(PUOneUpViewController *)self _tilingView];
  [v4 locationInView:v5];
  double v7 = v6 + -0.5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PUOneUpViewController__isLocationFromProviderOverSyndicationAttributionPill___block_invoke;
  v13[3] = &unk_1E5F27EE8;
  double v9 = v8 + -0.5;
  double v16 = v6;
  double v17 = v8;
  id v10 = v5;
  id v14 = v10;
  id v15 = &v18;
  objc_msgSend(v10, "enumeratePresentedTileControllersInRect:usingBlock:", v13, v7, v9, 1.0, 1.0);
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __79__PUOneUpViewController__isLocationFromProviderOverSyndicationAttributionPill___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  double v6 = [v11 reuseIdentifier];
  int v7 = [v6 isEqualToString:@"PUSyndicationAttributionTileReuseIdentifier"];

  double v8 = v11;
  if (v7)
  {
    double v9 = [v11 view];
    objc_msgSend(v9, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
    id v10 = objc_msgSend(v9, "hitTest:withEvent:", 0);
    if (v10 && v10 != v9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    *a4 = 1;

    double v8 = v11;
  }
}

- (void)_configureVitalityController
{
  id v5 = [(PUOneUpViewController *)self _tilingView];
  objc_msgSend(v5, "setCanDriveVitality:", -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen") ^ 1);
  if ([(PUOneUpViewController *)self _isIrisPlaying]) {
    uint64_t IsVideoAutoplayEnabled = 0;
  }
  else {
    uint64_t IsVideoAutoplayEnabled = PXPreferencesIsVideoAutoplayEnabled();
  }
  id v4 = objc_msgSend(v5, "is_vitalityController");
  [v4 setEnabled:IsVideoAutoplayEnabled];
}

- (void)livePhotoVideoPlaybackTileViewControllerDidEndPlaying:(id)a3
{
  id v4 = a3;
  [(PUOneUpViewController *)self _setIrisPlaying:0];
  [(PUOneUpViewController *)self _setDidPlayCurrentLivePhoto:1];
  id v5 = [v4 browsingViewModel];

  double v6 = [v5 currentAssetReference];
  id v11 = [v6 asset];

  int v7 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  double v8 = [(PUOneUpViewController *)self lastLivePhotoGestureLocationProvider];
  uint64_t v9 = [v7 imageSubjectExistsAtLocation:v8];

  id v10 = [(PUOneUpViewController *)self eventTracker];
  [v10 logUserDidPlayLivePhoto:v11 pressOnSubject:v9];

  [(PUOneUpViewController *)self _invalidateTipPopovers];
  [(PUOneUpViewController *)self _updateTipPopoversIfNeeded];
  [(PUOneUpViewController *)self setLastLivePhotoGestureLocationProvider:0];
}

- (void)livePhotoVideoPlaybackTileViewControllerWillBeginPlaying:(id)a3
{
  id v4 = a3;
  [(PUOneUpViewController *)self _setIrisPlaying:1];
  id v5 = [v4 browsingViewModel];

  double v6 = [v5 currentAssetReference];
  id v12 = [v6 asset];

  int v7 = [(PUOneUpViewController *)self _currentAssetViewModel];
  double Current = CFAbsoluteTimeGetCurrent();
  [v7 focusValueAtZeroTimestamp];
  double v10 = Current - v9;
  id v11 = [(PUOneUpViewController *)self eventTracker];
  [v11 logUserWillPlayLivePhoto:v12 firstTimeWaitDuration:v10];

  [v7 setFocusValueAtZeroTimestamp:-1.0];
  [(PUOneUpViewController *)self _invalidateTipPopovers];
  [(PUOneUpViewController *)self _updateTipPopoversIfNeeded];
}

- (CGImage)livePhotoVideoPlaybackTileViewControllerCurrentGainMapImage:(id)a3 outGainMapAvailable:(BOOL *)a4 outGainMapValue:(float *)a5
{
  double v8 = [a3 browsingViewModel];
  double v9 = [v8 currentAssetReference];

  double v10 = [(PUOneUpViewController *)self _tilingView];
  id v11 = [v9 indexPath];
  id v12 = [v9 dataSourceIdentifier];
  id v13 = [v10 presentedTileControllerWithIndexPath:v11 kind:@"PUTileKindItemContent" dataSourceIdentifier:v12];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = 0;
    id v15 = 0;
    int v17 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v14 = v13;
  id v15 = (CGImage *)[v14 gainMapImage];
  [v14 gainMapValue];
  int v17 = v16;
  char v18 = [v14 gainMapImageIsAvailable];

  if (a4) {
LABEL_5:
  }
    *a4 = v18;
LABEL_6:
  if (a5) {
    *(_DWORD *)a5 = v17;
  }

  return v15;
}

- (id)livePhotoVideoPlaybackTileViewControllerCurrentImage:(id)a3
{
  id v4 = [a3 browsingViewModel];
  id v5 = [v4 currentAssetReference];

  double v6 = [(PUOneUpViewController *)self _tilingView];
  int v7 = [v5 indexPath];
  double v8 = [v5 dataSourceIdentifier];
  double v9 = [v6 presentedTileControllerWithIndexPath:v7 kind:@"PUTileKindItemContent" dataSourceIdentifier:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [v9 image];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)livePhotoVideoPlaybackTileViewControllerDisplayTileTransform:(id)a3
{
  id v4 = [a3 browsingViewModel];
  id v5 = [v4 currentAssetReference];

  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    double v6 = [(PUOneUpViewController *)self _mainOneUpForSecondScreenBrowser];
  }
  else
  {
    double v6 = self;
  }
  int v7 = v6;
  double v8 = [(PUOneUpViewController *)v6 _tilingView];
  double v9 = [v5 indexPath];
  uint64_t v10 = PUTileKindUserTransform;
  id v11 = [v5 dataSourceIdentifier];
  id v12 = [v8 presentedTileControllerWithIndexPath:v9 kind:v10 dataSourceIdentifier:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v12 displayTileTransform];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)livePhotoVideoPlaybackTileViewControllerCanBeginPlaying:(id)a3 locationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PUOneUpViewController *)self _interactivePinchDismissalController];
  if ([v8 isHandlingDismissalInteraction])
  {
    int v9 = 0;
  }
  else
  {
    uint64_t v10 = [(PUOneUpViewController *)self _interactiveSwipeDismissalController];
    int v9 = [v10 isHandlingDismissalInteraction] ^ 1;
  }
  id v11 = +[PUOneUpSettings sharedInstance];
  if ([v11 allowVisualIntelligence])
  {
    BOOL v12 = [(PUOneUpViewController *)self _isLocationFromProvider:v7 overTileOfKind:@"PUTileKindItemContent"];

    if (v12)
    {
      id v13 = +[PUOneUpSettings sharedInstance];
      int v14 = [v13 allowsVisualIntelligenceRemoveBackground];

      if (v14)
      {
        if (!v9
          || [(PUOneUpViewController *)self _vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:v7])
        {
          goto LABEL_16;
        }
LABEL_15:
        if ([(PUOneUpViewController *)self _isLocationFromProviderOverInteractiveItem:v7])
        {
          goto LABEL_16;
        }
LABEL_17:
        int v15 = ![(PUOneUpViewController *)self _isLocationFromProviderOverControl:v7];
        goto LABEL_18;
      }
      if (v9) {
        goto LABEL_15;
      }
    }
    else if (v9)
    {
      goto LABEL_17;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_17;
    }
  }
LABEL_16:
  int v15 = 0;
LABEL_18:
  uint64_t v20 = [v6 browsingViewModel];
  int v16 = [v20 currentAssetReference];
  int v17 = [v16 pxAssetReference];
  char v18 = [v17 asset];

  int v19 = PXContentSyndicationShouldShowAttributionViewForAsset() ^ 1;
  LOBYTE(v20) = v19 & v15;
  if ((v19 & 1) == 0 && v15) {
    LODWORD(v20) = ![(PUOneUpViewController *)self _isLocationFromProviderOverSyndicationAttributionPill:v7];
  }
  char v21 = [(PUOneUpViewController *)self _tilingView];
  [v7 locationInView:v21];
  v24 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v21, v22, v23);
  [(PUOneUpViewController *)self setLastLivePhotoGestureLocationProvider:v24];

  return (char)v20;
}

- (double)livePhotoVideoPlaybackTileViewControllerExtraMinimumTouchDuration:(id)a3 locationProvider:(id)a4
{
  id v5 = a4;
  id v6 = +[PUOneUpSettings sharedInstance];
  int v7 = [v6 allowVisualIntelligence];

  double v8 = 0.0;
  if (v7
    && [(PUOneUpViewController *)self _isLocationFromProviderOverImageSubject:v5])
  {
    if ([(PUOneUpViewController *)self _isLocationFromProviderOverInteractiveItemExcludingImageSubject:v5])
    {
      double v8 = 0.0;
    }
    else
    {
      double v8 = 0.4;
    }
  }

  return v8;
}

- (void)cropButtonTileViewController:(id)a3 didSelectAspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v22 = [(PUOneUpViewController *)self browsingSession];
  int v7 = [v22 viewModel];
  double v8 = [v7 currentAssetReference];
  if (v8)
  {
    [MEMORY[0x1E4F903D8] signalDidQuickCrop];
    int v9 = [v7 assetViewModelForAssetReference:v8];
    uint64_t v10 = [v9 modelTileTransform];

    id v11 = [v8 asset];
    double v12 = (double)(unint64_t)[v11 pixelWidth];
    id v13 = [v8 asset];
    double v14 = (double)(unint64_t)[v13 pixelHeight];

    int v15 = [(PUOneUpViewController *)self view];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;

    uint64_t v20 = -[PUQuickCropContext initWithTileTransform:renderedImageSize:boundingSize:selectedAspectRatio:]([PUQuickCropContext alloc], "initWithTileTransform:renderedImageSize:boundingSize:selectedAspectRatio:", v10, v12, v14, v17, v19, width, height);
    char v21 = [(PUOneUpViewController *)self actionsController];
    [v21 performQuickCropActionWithContext:v20];
  }
}

- (id)additionalContextMenuActionsForAttributionTileViewController:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  [(PUOneUpViewController *)self createMenuActionControllerForManagerIfNeeded:0 withPresentingViewController:self regionOfInterestProvider:0];
  id v5 = [(PUOneUpViewController *)self menuActionController];
  id v6 = [v5 contextMenuActionIfAvailableForActionType:55];

  if (v6)
  {
    id v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = (objc_class *)objc_opt_class();
      double v14 = NSStringFromClass(v13);
      int v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6619, @"%@ should be an instance inheriting from %@, but it is %@", @"removeSuggestionMenuElement", v14, v15 object file lineNumber description];
    }
    objc_msgSend(v7, "setAttributes:", objc_msgSend(v7, "attributes") & 0xFFFFFFFFFFFFFFFDLL);
    v16[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    double v8 = 0;
  }
  if (v8) {
    int v9 = v8;
  }
  else {
    int v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

- (id)oneUpChromeViewControllerExcludedMenuActionTypes:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = v4;
  unint64_t options = self->__options;
  if ((options & 0x10) != 0)
  {
    [v4 addObject:*MEMORY[0x1E4F90D80]];
    unint64_t options = self->__options;
    if ((options & 0x200000) == 0)
    {
LABEL_3:
      if ((options & 0x400000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((options & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:*MEMORY[0x1E4F90CB0]];
  if ((self->__options & 0x400000) != 0) {
LABEL_4:
  }
    [v5 addObject:*MEMORY[0x1E4F90CA0]];
LABEL_5:
  return v5;
}

- (id)oneUpChromeViewControllerFullSizeOneUpHostingView:(id)a3
{
  uint64_t v3 = [(PUOneUpViewController *)self view];
  id v4 = [v3 superview];

  return v4;
}

- (void)oneUpChromeViewControllerAdditionalActionInfoEdgeInsetsDidChange:(id)a3
{
  [(PUOneUpViewController *)self _invalidateImageAnalysisInteractionAdditionalActionInfoEdgeInsets];
  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (void)oneUpChromeViewControllerLegibilityInsetsDidChange:(id)a3
{
  uint64_t v3 = [(PUOneUpViewController *)self _tilingView];
  id v4 = [v3 layout];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  [v5 invalidatePrimaryContentTiles];
}

- (void)_handleUnlockDeviceForActionType:(unint64_t)a3 success:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    id v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = PXUnlockDeviceActionTypeDescription();
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Failed to unlock device to perform action: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v7 = [(PUOneUpViewController *)self chromeViewController];
  [v7 invalidateIsDeviceUnlocked];

  double v8 = [(PUOneUpViewController *)self chromeViewController];
  [v8 updateIsDeviceUnlockedIfNeeded];
}

- (void)oneUpChromeViewControllerRequestDeviceUnlock:(id)a3 for:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PUOneUpViewController *)self unlockDeviceHandlerWithActionType];

  if (v7)
  {
    objc_initWeak(&location, self);
    double v8 = [(PUOneUpViewController *)self unlockDeviceHandlerWithActionType];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__PUOneUpViewController_oneUpChromeViewControllerRequestDeviceUnlock_for___block_invoke;
    v9[3] = &unk_1E5F28118;
    objc_copyWeak(v10, &location);
    v10[1] = (id)a4;
    ((void (**)(void, void *, unint64_t))v8)[2](v8, v9, a4);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __74__PUOneUpViewController_oneUpChromeViewControllerRequestDeviceUnlock_for___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleUnlockDeviceForActionType:*(void *)(a1 + 40) success:a2];
}

- (BOOL)oneUpChromeViewControllerIsDeviceUnlocked:(id)a3
{
  id v4 = [(PUOneUpViewController *)self unlockDeviceStatus];

  if (!v4) {
    return 1;
  }
  id v5 = [(PUOneUpViewController *)self unlockDeviceStatus];
  char v6 = v5[2]();

  return v6;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(PUOneUpViewController *)self browsingSession];
  int v9 = [v8 viewModel];
  id v10 = [v9 currentAssetReference];

  v30.receiver = self;
  v30.super_class = (Class)PUOneUpViewController;
  uint64_t v11 = -[PUOneUpViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v30, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  double v12 = (void *)[v11 mutableCopy];

  id v13 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  double v14 = [v13 accessoryViewControllerForAssetReference:v10];

  if (v14)
  {
    int v15 = objc_msgSend(v14, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v7, x, y);
    [v12 addObjectsFromArray:v15];
  }
  double v16 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v7, x, y);
  if (![(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:v16])
  {
    double v17 = [v10 asset];
    double v18 = [v10 assetCollection];
    id v19 = objc_alloc_init(MEMORY[0x1E4F900D0]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = *MEMORY[0x1E4F90E68];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
      v28[3] = &unk_1E5F2BE60;
      id v29 = v17;
      [v19 registerItemForIdentifier:v20 loadHandler:v28];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = *MEMORY[0x1E4F90E70];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2;
      v26 = &unk_1E5F2BE60;
      id v27 = v18;
      [v19 registerItemForIdentifier:v21 loadHandler:&v23];
    }
    objc_msgSend(v12, "addObject:", v19, v23, v24, v25, v26);
  }
  return v12;
}

id __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)pu_debugRows
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];

  char v6 = [v5 assetViewModelForCurrentAssetReference];
  id v7 = [v6 videoPlayer];
  double v8 = [v7 playerItem];
  int v9 = v8;
  if (v8)
  {
    id v10 = (void *)MEMORY[0x1E4F940F8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__PUOneUpViewController_pu_debugRows__block_invoke;
    v23[3] = &unk_1E5F2BE60;
    id v24 = v8;
    uint64_t v11 = objc_msgSend(v10, "pu_rowWithTitle:output:", @"Print Video Information", v23);
    [v3 addObject:v11];
  }
  id v12 = [v6 asset];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v13 = v12;

    if (!v13) {
      goto LABEL_9;
    }
    double v14 = objc_msgSend(v13, "px_coreDataBrowserURL");
    int v15 = (void *)MEMORY[0x1E4F940F8];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __37__PUOneUpViewController_pu_debugRows__block_invoke_2;
    uint64_t v21 = &unk_1E5F2C248;
    id v22 = v14;
    id v12 = v14;
    double v16 = objc_msgSend(v15, "pu_rowWithTitle:action:", @"Core Data Browser", &v18);
    objc_msgSend(v3, "addObject:", v16, v18, v19, v20, v21);
  }
  else
  {
    id v13 = 0;
  }

LABEL_9:
  return v3;
}

id __37__PUOneUpViewController_pu_debugRows__block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [MEMORY[0x1E4F8CC38] debugDescriptionForPlayerItem:*(void *)(a1 + 32)];
  id v3 = [v1 stringWithFormat:@"Video Playback Information\n\n%@", v2];

  return v3;
}

void __37__PUOneUpViewController_pu_debugRows__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (id)pu_debugCurrentPrivacyController
{
  id v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 privacyController];

  return v3;
}

- (id)pu_debugCurrentViewModel
{
  id v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 viewModel];

  return v3;
}

- (id)pu_debugCurrentAsset
{
  id v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 viewModel];
  id v4 = [v3 currentAssetReference];

  id v5 = [v4 asset];

  return v5;
}

- (void)ppt_notifyWhenVKAnalysisIsReadyWithTimeout:(double)a3 handler:(id)a4
{
  double v8 = (void (**)(id, void))a4;
  char v6 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ppt_notifyWhenVKAnalysisIsReadyWithTimeout:completionHandler:", v8, a3);
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

- (void)ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout:(double)a3 handler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    double v8 = [(PUOneUpViewController *)self _tilingView];
    [v8 layoutIfNeeded];

    int v9 = [(PUOneUpViewController *)self browsingSession];
    id v10 = [v9 viewModel];

    uint64_t v11 = [v10 currentAssetReference];
    id v12 = [v11 asset];

    if (objc_opt_respondsToSelector()) {
      char v13 = [v12 needsDeferredProcessing];
    }
    else {
      char v13 = 1;
    }
    if (fmin(a3, 60.0) <= 0.0)
    {
      v7[2](v7, 1);
      uint64_t v20 = PLOneUpGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "Deferred Processing: zero timeout is not allowed.", buf, 2u);
      }

      goto LABEL_16;
    }
    double v14 = [(PUOneUpViewController *)self ppt_deferredProcessingCompletionBlock];

    if (v14)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6408, @"Should not request notification, when a request is already on going" object file lineNumber description];

      if (v13) {
        goto LABEL_8;
      }
    }
    else if (v13)
    {
LABEL_8:
      [(PUOneUpViewController *)self setPpt_deferredProcessingCompletionBlock:v7];
      int v15 = [v12 uuid];
      [(PUOneUpViewController *)self setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:v15];

      objc_initWeak(location, self);
      double v16 = (void *)MEMORY[0x1E4F1CB00];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke_2;
      v22[3] = &unk_1E5F2E530;
      objc_copyWeak(&v23, location);
      double v17 = objc_msgSend(v16, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, v22, a3);
      [(PUOneUpViewController *)self setPpt_deferredProcessingWaitTimer:v17];

      uint64_t v18 = PLOneUpGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = [v12 uuid];
        *(_DWORD *)buf = 138412290;
        id v27 = v19;
        _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEBUG, "Deferred Processing (PPT): ===> DP callback installed for %@", buf, 0xCu);
      }
      objc_destroyWeak(&v23);
      objc_destroyWeak(location);
      goto LABEL_16;
    }
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke;
    location[4] = &unk_1E5F2EBA0;
    uint64_t v25 = v7;
    px_dispatch_on_main_queue();

LABEL_16:
  }
}

uint64_t __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_msgSend(WeakRetained, "ppt_deferredProcessingCompletionBlock");

  id v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setPpt_deferredProcessingCompletionBlock:", 0);

  id v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setPpt_deferredProcessingWaitTimer:", 0);

  id v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:", 0);

  id v7 = PLOneUpGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "Deferred Processing (PPT): !!! time out. Has to debug why this happens.", buf, 2u);
  }

  if (v3)
  {
    id v8 = v3;
    px_dispatch_on_main_queue();
  }
}

uint64_t __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke_786(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ppt_playCurrentLivePhotoWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v5 = [(PUOneUpViewController *)self _currentContentTileController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6392, @"unexpected class %@", v5 object file lineNumber description];
  }
  objc_msgSend(v5, "ppt_playLivePhotoWithCompletionHandler:", v7);
}

- (PUOverOneUpPresentationSession)ppt_overOneUpPresentationSession
{
  return (PUOverOneUpPresentationSession *)[(PUOneUpViewController *)self overOneUpPresentationSessionCreateIfNeeded:1];
}

- (UIView)ppt_scrubberView
{
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled]) {
    [(PUOneUpViewController *)self chromeViewController];
  }
  else {
  id v3 = [(PUOneUpViewController *)self _barsController];
  }
  id v4 = objc_msgSend(v3, "ppt_scrubberView");

  return (UIView *)v4;
}

- (CGRect)ppt_scrollableBoundsForTesting
{
  id v3 = [(PUOneUpViewController *)self _tilingView];
  id v4 = [(PUOneUpViewController *)self navigationController];
  id v5 = [v4 navigationBar];
  [v5 frame];
  double v7 = v6;

  id v8 = [(PUOneUpViewController *)self navigationController];
  int v9 = [v8 toolbar];
  [v9 frame];
  double v11 = v10;

  id v12 = [v3 superview];
  [v3 frame];
  objc_msgSend(v12, "convertRect:toView:", 0);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [v3 adjustedContentInset];
  double v23 = v7 + v22;
  double v25 = v11 + v24;
  double v26 = v14 + v21 + 24.0;
  double v27 = v16 + v23;
  double v28 = v18 - (v21 + 24.0 + v21 + 24.0);
  double v29 = v20 - (v23 + v25);

  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUOneUpViewController *)self presentedViewController];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 prepareForDismissingForced:v3];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)purgeIfPossible
{
  BOOL v3 = [(PUOneUpViewController *)self _currentAccessoryViewController];
  if ([v3 conformsToProtocol:&unk_1F0863008])
  {
    id v4 = [(PUOneUpViewController *)self _currentAccessoryViewController];
  }
  else
  {
    id v4 = 0;
  }

  [v4 purgeIfPossible];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUOneUpViewController *)self _tilingView];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PUOneUpViewController_settings_changedValueForKey___block_invoke;
  v11[3] = &unk_1E5F280F0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateAllTileControllersUsingBlock:v11];
}

void __53__PUOneUpViewController_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F090E408]) {
    [v3 settings:*(void *)(a1 + 32) changedValueForKey:*(void *)(a1 + 40)];
  }
}

- (void)_notifyTileIsReadyWithTimeOut:(double)a3 completionHandler:(id)a4
{
  id v10 = (void (**)(id, void))a4;
  id v6 = [(PUOneUpViewController *)self _tilingView];
  [v6 layoutIfNeeded];

  id v7 = [(PUOneUpViewController *)self _currentContentTileController];
  id v8 = v7;
  if (fmin(a3, 0.5) <= 0.0 || v7 == 0)
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    objc_msgSend(v7, "notifyWhenReadyForDisplayWithTimeOut:completionHandler:", v10);
  }
}

- (void)_performNavigationToAssetDisplayDescriptor:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 6242, @"Invalid parameter not satisfying: %@", @"beforeDate != nil" object file lineNumber description];
  }
  id v12 = objc_alloc_init(PUAssetDisplayDescriptorNavigationRequest);
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceReferenceDate];
  double v15 = v14;
  [v13 timeIntervalSinceReferenceDate];
  double v17 = v15 - v16;
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke;
  v29[3] = &unk_1E5F293F8;
  v33[1] = *(id *)&v17;
  id v18 = v10;
  id v30 = v18;
  id v19 = v13;
  id v31 = v19;
  objc_copyWeak(v33, &location);
  id v20 = v11;
  id v32 = v20;
  [(PUAssetDisplayDescriptorNavigationRequest *)v12 setCompletionHandler:v29];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_768;
  v24[3] = &unk_1E5F2DEB0;
  double v21 = v12;
  double v25 = v21;
  double v26 = self;
  id v22 = v9;
  id v27 = v22;
  double v28 = v17;
  [(PUAssetDisplayDescriptorNavigationRequest *)v21 performChanges:v24];

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v5 = COERCE_DOUBLE(a3);
  id v6 = PLOneUpGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double v7 = *(double *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    double v32 = v7;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "Completed navigationRequest with timeOut: %f", buf, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    id v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v32 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Navigation unsuccessful: %@", buf, 0xCu);
    }
  }
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  double v10 = *(double *)(a1 + 64);
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  double v12 = v11;
  [v9 timeIntervalSinceReferenceDate];
  double v14 = v12 - v13;
  if (v10 >= v14) {
    double v15 = v14;
  }
  else {
    double v15 = v10;
  }
  double v16 = PLOneUpGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [v9 timeIntervalSinceReferenceDate];
    double v18 = v17;
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    id v19 = @"NO";
    double v21 = v18 - v20;
    if (v15 < 0.0) {
      id v19 = @"YES";
    }
    *(_DWORD *)buf = 134218242;
    double v32 = v21;
    __int16 v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Navigation request took %f seconds to complete. Timed Out: %@.", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_766;
  v26[3] = &unk_1E5F2C638;
  id v27 = v9;
  id v23 = *(id *)(a1 + 48);
  char v30 = a2;
  double v28 = v5;
  id v29 = v23;
  id v24 = *(id *)&v5;
  id v25 = v9;
  [WeakRetained _notifyTileIsReadyWithTimeOut:v26 completionHandler:v15];
}

uint64_t __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_768(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) browsingSession];
  id v4 = [v3 viewModel];
  [v2 setViewModel:v4];

  double v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 48) assetReference];
  [v5 setTargetAssetReference:v6];

  double v7 = [*(id *)(a1 + 48) modifiedAfterDate];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 48) modifiedAfterDate];
    [v8 setTargetModificationDate:v9];
  }
  double v10 = *(void **)(a1 + 48);
  if (v10)
  {
    [v10 videoSeekTime];
    if ((v18 & 0x100000000) != 0)
    {
      double v11 = *(void **)(a1 + 32);
      double v12 = *(void **)(a1 + 48);
      if (v12)
      {
        [v12 videoSeekTime];
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
      }
      [v11 setTargetSeekTime:&v14];
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setTimeOut:", *(double *)(a1 + 56), v14, v15, v16, v17, v18, v19);
}

uint64_t __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_766(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = PLOneUpGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v9 = 134217984;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Tile readiness notification took %f.", (uint8_t *)&v9, 0xCu);
  }
  if ((a2 & 1) == 0)
  {
    double v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Tile readiness notification failed.", (uint8_t *)&v9, 2u);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  }
  return result;
}

- (BOOL)_canAttemptNavigationToAssetDisplayDescriptor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v6 = [v5 viewModel];
  double v7 = [v6 assetsDataSource];

  if (!v7)
  {
    id v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = [(PUOneUpViewController *)self browsingSession];
      uint64_t v10 = [(PUOneUpViewController *)self browsingSession];
      uint64_t v11 = [v10 viewModel];
      int v18 = 138412546;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      double v21 = v11;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "assetsDataSource is unexpectedly nil. browsingSession: %@, viewModel: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  double v12 = [v4 assetReference];
  uint64_t v13 = [v7 couldAssetReferenceAppear:v12];
  uint64_t v14 = PLOneUpGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [NSNumber numberWithBool:v13];
    uint64_t v16 = [NSNumber numberWithInt:v12 != 0];
    int v18 = 138412546;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    double v21 = v16;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEBUG, "Can attempt navigation? %@, assetReference?: %@", (uint8_t *)&v18, 0x16u);
  }
  return v13;
}

- (void)navigateToAssetDisplayDescriptor:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = PLOneUpGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v12 = @"YES";
    if (!v10) {
      double v12 = @"NO";
    }
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "Navigating to assetDisplayDescriptor: %@, completionHandler?: %@", (uint8_t *)&v14, 0x16u);
  }

  if (v8)
  {
    if ([(PUOneUpViewController *)self _canAttemptNavigationToAssetDisplayDescriptor:v8])
    {
      [(PUOneUpViewController *)self _performNavigationToAssetDisplayDescriptor:v8 beforeDate:v9 completionHandler:v10];
    }
    else if (v10)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUAssetDisplayDescriptorNavigationErrorDomain" code:1 userInfo:0];
      v10[2](v10, 0, v13);
    }
  }
  else if (v10)
  {
    v10[2](v10, 1, 0);
  }
}

- (void)oneUpAccessoryViewControllersManagerInvalidateAccessoryLayout:(id)a3
{
}

- (BOOL)oneUpAccessoryViewControllersManagerRequestAccessoryDismissal:(id)a3
{
  return 1;
}

- (BOOL)oneUpAccessoryViewControllersManager:(id)a3 preventAlbumAttributionWidgetForAssetReference:(id)a4
{
  return ([(PUOneUpViewController *)self _options] >> 23) & 1;
}

- (BOOL)oneUpAccessoryViewControllersManager:(id)a3 preventRevealInMomentActionForAssetReference:(id)a4
{
  return ([(PUOneUpViewController *)self _options] >> 4) & 1;
}

- (BOOL)accessoryTileViewControllerShouldUseSquareImageWhenShowingAccessoryView:(id)a3
{
  id v4 = a3;
  double v5 = [(PUOneUpViewController *)self _spec];
  int v6 = [v5 prefersSquareImageInDetails];

  if (v6)
  {
    if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled]
      && ([MEMORY[0x1E4F90300] sharedInstance],
          double v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 enableSideCommentsInLandscape],
          v7,
          (v8 & 1) != 0))
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      uint64_t v10 = [v4 assetReference];
      uint64_t v11 = [v10 asset];
      BOOL v9 = !+[PUCommentsViewController canShowCommentsForAsset:v11];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)accessoryTileViewControllerWillHideNavigationBarWhenShowingAccessoryView:(id)a3
{
  id v4 = [a3 assetReference];
  double v5 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  int v6 = [v5 shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:v4];

  if (v6) {
    BOOL v7 = ![(PUOneUpViewController *)self _isCurrentAssetAndInEditModeForAssetReference:v4];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)accessoryTileViewControllerWillHideToolbarWhenShowingAccessoryView:(id)a3
{
  id v4 = [a3 assetReference];
  double v5 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  char v6 = [v5 shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:v4];

  return v6;
}

- (id)accessoryTileViewControllerAccessoryViewController:(id)a3
{
  id v4 = [a3 assetReference];
  double v5 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  char v6 = [v5 accessoryViewControllerForAssetReference:v4];

  return v6;
}

- (id)irisImageTileViewController:(id)a3 delegateForGestureRecognizer:(id)a4
{
  id v5 = a4;
  char v6 = [(PUOneUpViewController *)self _gestureRecognizerCoordinator];
  [v6 addIrisGestureRecognizer:v5];

  return [(PUOneUpViewController *)self _gestureRecognizerCoordinator];
}

- (void)irisImageTileViewControllerDidEndVitality:(id)a3
{
  id v5 = [a3 asset];
  id v4 = [(PUOneUpViewController *)self eventTracker];
  [v4 logVitalityDidEndForLivePhoto:v5];
}

- (void)irisImageTileViewControllerDidEndPlaying:(id)a3
{
  id v4 = a3;
  [(PUOneUpViewController *)self _setIrisPlaying:0];
  [(PUOneUpViewController *)self _setDidPlayCurrentLivePhoto:1];
  id v6 = [v4 asset];

  id v5 = [(PUOneUpViewController *)self eventTracker];
  [v5 logUserDidPlayLivePhoto:v6];

  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (void)irisImageTileViewControllerDidBeginPlaying:(id)a3
{
  id v9 = a3;
  id v4 = [v9 assetViewModel];
  id v5 = [v4 irisPlayer];
  id v6 = [v5 player];
  if ([v6 currentPlaybackStyle] == 1)
  {
    [(PUOneUpViewController *)self _setIrisPlaying:1];
    BOOL v7 = [v9 asset];
    char v8 = [(PUOneUpViewController *)self eventTracker];
    [v8 logUserWillPlayLivePhoto:v7];
  }
}

- (void)irisImageTileViewControllerDidBeginHinting:(id)a3
{
  id v4 = [(PUOneUpViewController *)self _barsController];
  id v5 = [v4 tapGestureRecognizer];
  objc_msgSend(v5, "pu_cancel");

  id v7 = [(PUOneUpViewController *)self _doubleTapZoomController];
  id v6 = [v7 doubleTapGestureRecognizer];
  objc_msgSend(v6, "pu_cancel");
}

- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [v9 executedAction];
  double v12 = [(PUOneUpViewController *)self undoManager];
  [v11 registerWithUndoManager:v12];

  uint64_t v13 = [(PUOneUpViewController *)self _tilingView];
  [v13 layoutIfNeeded];
  int v14 = [(PUOneUpViewController *)self _currentContentTileController];
  if (v14)
  {
    double v125 = a5;
    id v15 = [(PUOneUpViewController *)self _tilingView];
    __int16 v16 = [v15 layout];

    uint64_t v17 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v18 = [v17 viewModel];

    uint64_t v19 = [v18 assetsDataSource];
    v146 = v18;
    v142 = [v18 currentAssetReference];
    v143 = v19;
    objc_msgSend(v19, "indexPathForAssetReference:");
    v141 = v144 = v16;
    __int16 v20 = objc_msgSend(v16, "layoutInfoForTileWithIndexPath:kind:");
    double v21 = [v9 containerView];
    uint64_t v22 = [v9 fromView];
    id v23 = [v9 snapshotView];
    [v23 frame];
    v139 = (void *)v22;
    objc_msgSend(v21, "convertRect:fromView:", v22);
    double v129 = v24;
    double v26 = v25;
    CGFloat v126 = v25;
    double v28 = v27;
    double v30 = v29;
    objc_msgSend(v23, "setFrame:");
    [v21 addSubview:v23];
    [v20 frame];
    double v32 = v31;
    CGFloat v133 = v33;
    CGFloat v135 = v31;
    double v34 = v33;
    double v36 = v35;
    CGFloat v130 = v37;
    CGFloat v131 = v35;
    double v38 = v37;
    v39 = [v20 coordinateSystem];
    v40 = [v13 contentCoordinateSystem];
    double v41 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v39, v40, v32, v34);
    double v43 = v42;

    v44 = [(PUOneUpViewController *)self view];
    objc_msgSend(v44, "convertRect:fromView:", v13, v41, v43, v36, v38);
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;

    v53 = [(PUOneUpViewController *)self view];
    objc_msgSend(v21, "convertRect:fromView:", v53, v46, v48, v50, v52);
    CGFloat v147 = v54;
    CGFloat v127 = v56;
    CGFloat v128 = v55;
    CGFloat v58 = v57;

    v59 = [(PUOneUpViewController *)self view];
    v140 = v21;
    objc_msgSend(v21, "convertRect:toView:", v59, v26, v28, v129, v30);
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;

    v68 = [(PUOneUpViewController *)self view];
    objc_msgSend(v13, "convertRect:fromView:", v68, v61, v63, v65, v67);
    double v70 = v69;
    double v72 = v71;
    CGFloat v74 = v73;
    CGFloat v76 = v75;

    v77 = [v13 contentCoordinateSystem];
    v78 = [v20 coordinateSystem];
    double v79 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v77, v78, v70, v72);
    CGFloat v81 = v80;

    v137 = v23;
    uint64_t v82 = [v23 contentMode];
    long long v184 = 0u;
    long long v185 = 0u;
    long long v183 = 0u;
    CGFloat v83 = v30;
    CGFloat v84 = v58;
    PUAffineTransformToMatchRect((uint64_t)&v183, v126, v28, v129, v83, v147, v128, v127, v58);
    long long v181 = 0u;
    long long v182 = 0u;
    long long v180 = 0u;
    double matched = PUAffineTransformToMatchRect((uint64_t)&v180, v135, v133, v131, v130, v79, v81, v74, v76);
    BOOL v86 = v82 == 2;
    v145 = v10;
    if (v82 == 2)
    {
      PXRectGetCenter();
      long long v87 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v177 = *MEMORY[0x1E4F1DAB8];
      long long v178 = v87;
      long long v179 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v99 = v20;
      double v96 = v74;
      double v98 = v76;
    }
    else
    {
      objc_msgSend(v20, "center", matched);
      double v92 = v91;
      double v94 = v93;
      [v20 size];
      double v96 = v95;
      double v98 = v97;
      long long v177 = v180;
      long long v178 = v181;
      long long v179 = v182;
      v99 = v20;
      double v100 = v92;
      double v101 = v94;
    }
    uint64_t v102 = objc_msgSend(v99, "layoutInfoWithCenter:size:transform:", &v177, v100, v101, v96, v98);
    v103 = v20;
    v104 = [MEMORY[0x1E4F1CA48] array];
    [v104 addObject:v14];
    v105 = [(PUOneUpViewController *)self _backgroundTileViewController];
    if (v105 && [v9 shouldHideBackground]) {
      [v104 addObject:v105];
    }
    if ([v104 count]) {
      [v13 detachTileControllers:v104];
    }
    v136 = (void *)v102;
    [v14 applyLayoutInfo:v102];
    if ([v9 shouldHideBackground])
    {
      v106 = [v105 presentationLayoutInfo];
      [v106 layoutInfoWithAlpha:0.0];
      v108 = BOOL v107 = v86;

      [v105 applyLayoutInfo:v108];
      BOOL v86 = v107;
    }
    v134 = v105;
    v109 = v13;
    [(PUOneUpViewController *)self _hideOverlays];
    v110 = [v9 transitionInfo];
    v111 = v110;
    v112 = (void *)&unk_1AEFF7000;
    if (v110)
    {
      if (([v110 allowAutoPlay] & 1) == 0)
      {
        [v146 assetViewModelForCurrentAssetReference];
        v114 = BOOL v113 = v86;
        v115 = [v114 videoPlayer];
        v175[0] = MEMORY[0x1E4F143A8];
        v175[1] = 3221225472;
        v175[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke;
        v175[3] = &unk_1E5F2ED10;
        id v176 = v115;
        id v116 = v115;
        [v116 performChanges:v175];

        BOOL v86 = v113;
        v112 = &unk_1AEFF7000;
      }
      [v14 adoptAssetTransitionInfo:v111];
    }
    v117 = +[PUInterfaceManager beginDisablingUserInteractionForReason:10];
    [v14 startSuppressingAnimatedUpdatesWithReason:@"one-up transition"];
    [v14 viewControllerTransitionWillBegin];
    v132 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v157 = MEMORY[0x1E4F143A8];
    uint64_t v158 = v112[59];
    v159 = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2;
    v160 = &unk_1E5F280A0;
    id v161 = v9;
    id v162 = v146;
    BOOL v174 = v86;
    id v163 = v137;
    CGFloat v167 = v147;
    CGFloat v168 = v128;
    CGFloat v169 = v127;
    CGFloat v170 = v84;
    long long v171 = v183;
    long long v172 = v184;
    long long v173 = v185;
    v138 = v111;
    id v164 = v14;
    id v165 = v103;
    v166 = self;
    id v148 = v9;
    v149[0] = MEMORY[0x1E4F143A8];
    v149[1] = v158;
    v149[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_4;
    v149[3] = &unk_1E5F280C8;
    v118 = v109;
    id v150 = v109;
    id v151 = v104;
    id v152 = v163;
    id v153 = v139;
    id v154 = v164;
    id v155 = v117;
    id v10 = v145;
    id v156 = v145;
    id v119 = v117;
    id v120 = v139;
    id v121 = v163;
    id v122 = v104;
    id v123 = v103;
    id v124 = v146;
    [v132 animateWithDuration:&v157 animations:v149 completion:v125];

    uint64_t v13 = v118;
    id v9 = v148;
  }
  else
  {
    v88 = [(PUOneUpViewController *)self navigationController];
    v89 = [v88 topViewController];

    if (v89 == self) {
      id v90 = (id)[v88 popViewControllerAnimated:0];
    }
    if (v10) {
      (*((void (**)(id, BOOL))v10 + 2))(v10, v89 == self);
    }
  }
}

uint64_t __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:1 reason:@"Starting 1-Up asset transition"];
}

void __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) animationBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) animationBlock];
    v3[2]();
  }
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_3;
  v7[3] = &unk_1E5F2ED10;
  id v8 = v4;
  [v8 performChanges:v7];
  if (*(unsigned char *)(a1 + 160))
  {
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 128);
    v6[0] = *(_OWORD *)(a1 + 112);
    v6[1] = v5;
    v6[2] = *(_OWORD *)(a1 + 144);
    [*(id *)(a1 + 48) setTransform:v6];
  }
  [*(id *)(a1 + 48) setAlpha:0.0];
  [*(id *)(a1 + 56) applyLayoutInfo:*(void *)(a1 + 64)];
  [*(id *)(a1 + 72) _unhideOverlays];
}

void __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  long long v5 = objc_alloc_init(PUTileReattachmentContext);
  [(PUTileReattachmentContext *)v5 setTransitioningOverOneUp:1];
  [*(id *)(a1 + 32) reattachTileControllers:*(void *)(a1 + 40) withContext:v5];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) stopSuppressingAnimatedUpdatesWithReason:@"one-up transition"];
  [*(id *)(a1 + 64) viewControllerTransitionDidEnd];
  +[PUInterfaceManager endDisablingUserInteraction:*(void *)(a1 + 72)];
  uint64_t v4 = *(void *)(a1 + 80);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
}

uint64_t __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1 changeReason:5];
}

- (id)createAssetTransitionInfo
{
  id v2 = [(PUOneUpViewController *)self _currentContentTileController];
  id v3 = [v2 generateAssetTransitionInfo];

  return v3;
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4 options:(unint64_t)a5
{
  char v63 = a5;
  id v65 = a3;
  id v8 = a4;
  id v9 = [(PUOneUpViewController *)self _currentContentTileController];
  id v10 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v11 = [v10 viewModel];
  double v12 = [v11 currentAssetReference];

  double v60 = v12;
  uint64_t v13 = [v12 asset];
  double v62 = (void (**)(void, void))v8;
  BOOL v14 = [v13 playbackStyle] == 4 || objc_msgSend(v13, "playbackStyle") == 5;
  if ((v63 & 2) != 0 && v14)
  {
    id v15 = v9;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        __int16 v16 = [v15 view];
        uint64_t v17 = [v16 snapshotViewAfterScreenUpdates:0];

        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke;
        v68[3] = &unk_1E5F296C0;
        id v69 = v17;
        id v70 = v13;
        id v18 = v17;
        uint64_t v19 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v68];

        goto LABEL_10;
      }
      double v55 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v58 = (objc_class *)objc_opt_class();
      double v57 = NSStringFromClass(v58);
      v59 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
      [v55 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 5866, @"%@ should be an instance inheriting from %@, but it is %@", @"tileController", v57, v59 object file lineNumber description];
    }
    else
    {
      double v55 = [MEMORY[0x1E4F28B00] currentHandler];
      double v56 = (objc_class *)objc_opt_class();
      double v57 = NSStringFromClass(v56);
      [v55 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 5866, @"%@ should be an instance inheriting from %@, but it is nil", @"tileController", v57 object file lineNumber description];
    }

    goto LABEL_8;
  }
  uint64_t v19 = [v9 generateAssetTransitionInfo];
LABEL_10:
  if (objc_opt_respondsToSelector())
  {
    __int16 v20 = [v65 toViewController];
    if (objc_opt_respondsToSelector())
    {
      double v21 = [v20 oneUpAssetTransition:v65 adjustTransitionInfo:v19];
      uint64_t v22 = v21;
      if (v21)
      {
        id v23 = v21;

        uint64_t v19 = v23;
      }
    }
  }
  double v24 = [v19 snapshotView];
  double v61 = v9;
  if (v24)
  {
    [(PUOneUpViewController *)self _currentFrameForTileController:v9];
    objc_msgSend(v24, "setFrame:");
    [v24 setContentMode:2];
    [v24 setClipsToBounds:1];
    double v25 = [v9 layoutInfo];
    [v25 cornerRadius];
    double v27 = v26;
    double v28 = [v24 layer];
    [v28 setCornerRadius:v27];

    double v29 = [v9 layoutInfo];
    double v30 = [v29 cornerCurve];
    double v31 = [v24 layer];
    [v31 setCornerCurve:v30];

    id v32 = v24;
  }
  else
  {
    id v32 = [(PUOneUpViewController *)self _currentPlaceholderSnapshotViewForTileController:v9];
    double v33 = [v19 image];
    [v32 setImage:v33];
    [v32 setClipsToBounds:1];
    [v9 layoutInfo];
    double v34 = v19;
    double v35 = v13;
    v37 = double v36 = v9;
    [v37 cornerRadius];
    double v39 = v38;
    v40 = [v32 layer];
    [v40 setCornerRadius:v39];

    double v41 = [v36 layoutInfo];
    double v42 = [v41 cornerCurve];
    double v43 = [v32 layer];
    [v43 setCornerCurve:v42];

    [v32 setContentMode:2];
    v44 = [(PUOneUpViewController *)self _tilingView];
    if ([v44 shouldDisplayHDR]) {
      uint64_t v45 = 2;
    }
    else {
      uint64_t v45 = 0;
    }
    uint64_t v13 = v35;
    uint64_t v19 = v34;
    double v24 = 0;
    [v32 setPreferredImageDynamicRange:v45];
  }
  double v46 = [v19 imageLayerModulator];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke_2;
  v66[3] = &unk_1E5F2D330;
  id v47 = v32;
  id v67 = v47;
  [v46 performChanges:v66];

  if (v63)
  {
    double v48 = [(PUOneUpViewController *)self _trailingContentTileController];
    uint64_t v50 = [v48 generateAssetTransitionInfo];
    [(PUOneUpViewController *)self _leadingContentTileController];
    double v51 = v64 = v13;
    double v52 = [v51 generateAssetTransitionInfo];
    v53 = [(PUOneUpViewController *)self view];
    double v54 = (void *)v50;
    double v49 = +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:0 fromView:v53 snapshotView:v47 transitionInfo:v19 trailingAssetTransitionInfo:v50 leadingAssetTransitionInfo:v52];

    uint64_t v13 = v64;
  }
  else
  {
    double v48 = [(PUOneUpViewController *)self view];
    double v49 = +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:0 fromView:v48 snapshotView:v47 transitionInfo:v19];
  }

  if (v62) {
    ((void (**)(void, void *))v62)[2](v62, v49);
  }
}

void __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSnapshotView:v3];
  [v4 setAsset:*(void *)(a1 + 40)];
}

void __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layer];
  [v3 setLayer:v4];
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
}

- (void)_didEndTransition
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUOneUpViewController *)self _userTransformTileViewControllerForCurrentAsset];
  [v3 zoomOutAnimated:0];

  id v4 = [(PUOneUpViewController *)self browsingSession];
  long long v5 = [v4 viewModel];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__PUOneUpViewController__didEndTransition__block_invoke;
  v11[3] = &unk_1E5F2ED10;
  id v6 = v5;
  id v12 = v6;
  [v6 performChanges:v11];
  [(PUOneUpViewController *)self _unhideOverlays];
  id v7 = [(PUOneUpViewController *)self _tilingView];
  id v8 = [(PUOneUpViewController *)self _currentContentTileController];
  if ([v8 isDetached])
  {
    id v9 = objc_alloc_init(PUTileReattachmentContext);
    [(PUTileReattachmentContext *)v9 setTransitioningOverOneUp:1];
    v13[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v7 reattachTileControllers:v10 withContext:v9];
  }
  [v7 layoutIfNeeded];
}

uint64_t __42__PUOneUpViewController__didEndTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1 changeReason:5];
}

- (void)_willBeginTransition
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUOneUpViewController *)self _tilingView];
  if ([(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 1) {
    [(PUOneUpViewController *)self _setAccessoryVisible:0];
  }
  [(PUOneUpViewController *)self _hideOverlays];
  uint64_t v4 = [(PUOneUpViewController *)self _currentContentTileController];
  long long v5 = (void *)v4;
  if (v4)
  {
    v9[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v3 detachTileControllers:v6];

    id v7 = [v5 presentationLayoutInfo];
    id v8 = [v7 layoutInfoWithAlpha:0.0];
    [v5 applyLayoutInfo:v8];
  }
  [v3 layoutIfNeeded];
}

- (void)_unhideOverlays
{
  id v4 = [(PUOneUpViewController *)self _tilingView];
  id v3 = [(PUOneUpViewController *)self _hiddenTilesController];
  if ([v3 count])
  {
    [v4 reattachTileControllers:v3 withContext:0];
    [(PUOneUpViewController *)self _setHiddenTilesController:0];
    [v4 layoutIfNeeded];
  }
}

- (void)_hideOverlays
{
  id v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  uint64_t v5 = [(PUOneUpViewController *)v2 _tilingView];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    double v28 = v4;
    id v7 = [v4 currentAssetReference];
    id v8 = [v7 indexPath];
    double v27 = v7;
    id v9 = [v7 dataSourceIdentifier];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v11 = [(PUOneUpViewController *)v2 _tileKindsToHide];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v26 = v2;
      BOOL v14 = 0;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          uint64_t v17 = v14;
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v11);
          }
          BOOL v14 = [v6 presentedTileControllerWithIndexPath:v8 kind:*(void *)(*((void *)&v33 + 1) + 8 * i) dataSourceIdentifier:v9];

          if (v14 && ([v14 isDetached] & 1) == 0) {
            [v10 addObject:v14];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);

      id v2 = v26;
    }

    [(PUOneUpViewController *)v2 _setHiddenTilesController:v10];
    [v6 detachTileControllers:v10];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          double v24 = [v23 presentationLayoutInfo];
          double v25 = [v24 layoutInfoWithAlpha:0.0];

          [v23 applyLayoutInfo:v25];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    id v4 = v28;
  }
}

- (NSArray)_tileKindsToHide
{
  v7[8] = *MEMORY[0x1E4F143B8];
  tileKindsToHide = self->__tileKindsToHide;
  if (!tileKindsToHide)
  {
    v7[0] = PUTileKindBadge;
    v7[1] = PUTileKindAccessory;
    v7[2] = PUTileKindPlayButton;
    v7[3] = PUTileKindProgressIndicator;
    void v7[4] = PUTileKindBufferingIndicator;
    v7[5] = PUTileKindLoadingIndicator;
    v7[6] = PUTileKindAssetExplorerReviewScreenBadge;
    v7[7] = PUTileKindAssetExplorerReviewScreenProgressIndicator;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:8];
    uint64_t v5 = self->__tileKindsToHide;
    self->__tileKindsToHide = v4;

    tileKindsToHide = self->__tileKindsToHide;
  }
  return tileKindsToHide;
}

- (CGRect)_currentFrameForTileController:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(PUOneUpViewController *)self _tilingView];
    id v6 = [v4 presentationLayoutInfo];

    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = [v6 coordinateSystem];
    __int16 v16 = [v5 contentCoordinateSystem];
    double v17 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v15, v16, v8, v10);
    double v19 = v18;

    uint64_t v20 = [(PUOneUpViewController *)self view];
    objc_msgSend(v20, "convertRect:fromView:", v5, v17, v19, v12, v14);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (id)_currentPlaceholderSnapshotViewForTileController:(id)a3
{
  if (a3)
  {
    -[PUOneUpViewController _currentFrameForTileController:](self, "_currentFrameForTileController:");
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)_leadingContentTileController
{
  uint64_t v3 = [(PUOneUpViewController *)self browsingSession];
  double v4 = [v3 viewModel];
  double v5 = [v4 leadingAssetReference];

  double v6 = [(PUOneUpViewController *)self _contentTileControllerForAssetReference:v5];

  return v6;
}

- (id)_trailingContentTileController
{
  uint64_t v3 = [(PUOneUpViewController *)self browsingSession];
  double v4 = [v3 viewModel];
  double v5 = [v4 trailingAssetReference];

  double v6 = [(PUOneUpViewController *)self _contentTileControllerForAssetReference:v5];

  return v6;
}

- (id)_contentTileControllerForAssetReference:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(PUOneUpViewController *)self _tilingView];
    double v6 = [v4 indexPath];
    double v7 = [v4 dataSourceIdentifier];

    double v8 = [v5 presentedTileControllerWithIndexPath:v6 kind:@"PUTileKindItemContent" dataSourceIdentifier:v7];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)_currentContentTileController
{
  uint64_t v3 = [(PUOneUpViewController *)self _tilingView];
  id v4 = [(PUOneUpViewController *)self browsingSession];
  double v5 = [v4 viewModel];
  double v6 = [v5 currentAssetReference];

  double v7 = [v6 indexPath];
  double v8 = [v6 dataSourceIdentifier];
  double v9 = [v3 presentedTileControllerWithIndexPath:v7 kind:@"PUTileKindItemContent" dataSourceIdentifier:v8];

  return v9;
}

- (void)overOneUpPresentationSessionDidFinish:(id)a3
{
  [(PUOneUpViewController *)self _setOverOneUpPresentationSession:0];
  id v4 = [(PUOneUpViewController *)self browsingSession];
  double v5 = [v4 viewModel];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PUOneUpViewController_overOneUpPresentationSessionDidFinish___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  id v8 = v5;
  id v6 = v5;
  [v6 performChanges:v7];
}

uint64_t __63__PUOneUpViewController_overOneUpPresentationSessionDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPresentingOverOneUp:0];
}

- (void)overOneUpPresentationSession:(id)a3 didPresent:(id)a4
{
  id v4 = [(PUOneUpViewController *)self browsingSession];
  double v5 = [v4 viewModel];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PUOneUpViewController_overOneUpPresentationSession_didPresent___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  id v8 = v5;
  id v6 = v5;
  [v6 performChanges:v7];
}

uint64_t __65__PUOneUpViewController_overOneUpPresentationSession_didPresent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPresentingOverOneUp:1];
}

- (BOOL)overOneUpPresentationSessionPresentingViewControllerIsReady:(id)a3
{
  id v4 = [(PUOneUpViewController *)self parentViewController];

  if (!v4 || ([(PUOneUpViewController *)self isBeingDismissed] & 1) != 0) {
    return 0;
  }
  id v6 = [(PUOneUpViewController *)self _tilingView];
  BOOL v5 = v6 != 0;

  return v5;
}

- (id)overOneUpPresentationSessionBrowserViewModel:(id)a3
{
  uint64_t v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  return v4;
}

- (id)_presentedTileControllerForIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUOneUpViewController *)self browsingSession];
  double v9 = [v8 viewModel];

  double v10 = [v9 assetsDataSource];
  double v11 = [(PUOneUpViewController *)self _tilingView];
  double v12 = [v10 identifier];
  double v13 = [v11 presentedTileControllerWithIndexPath:v7 kind:v6 dataSourceIdentifier:v12];

  return v13;
}

- (id)_presentedTileControllerForCurrentIndexPathWithKind:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUOneUpViewController *)self browsingSession];
  id v6 = [v5 viewModel];

  id v7 = [v6 assetsDataSource];
  id v8 = [v6 currentAssetReference];
  double v9 = [v7 indexPathForAssetReference:v8];
  double v10 = [(PUOneUpViewController *)self _presentedTileControllerForIndexPath:v9 kind:v4];

  return v10;
}

- (id)overOneUpPresentationSessionCurrentTileController:(id)a3
{
  return [(PUOneUpViewController *)self _presentedTileControllerForCurrentIndexPathWithKind:@"PUTileKindItemContent"];
}

- (id)overOneUpPresentationSessionCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUOneUpViewController *)self _overOneUpPresentationSession];
  if (!v5 && v3)
  {
    id v6 = [PUOneUpActivitySharingActionPerformer alloc];
    id v7 = [(PUOneUpViewController *)self actionsController];
    id v8 = [(PUOneUpActivitySharingActionPerformer *)v6 initWithActionsController:v7];

    BOOL v5 = [[PUOverOneUpPresentationSession alloc] initWithActivitySharingActionPerformer:v8];
    [(PUOverOneUpPresentationSession *)v5 setDelegate:self];
    double v9 = [(PUOneUpViewController *)self _barsController];
    [(PUOverOneUpPresentationSession *)v5 setBarsDelegate:v9];

    [(PUOneUpViewController *)self _setOverOneUpPresentationSession:v5];
  }
  return v5;
}

- (void)accessoryVisibilityInteractionController:(id)a3 setAccessoryVisible:(BOOL)a4 changeReason:(int64_t)a5
{
  BOOL v5 = a4;
  id v7 = +[PUInterfaceManager currentTheme];
  id v8 = [v7 photoBrowserChromeVisibleBackgroundColor];
  double v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    double v11 = [(PUOneUpViewController *)self _currentAssetViewModel];
    double v12 = [v11 modelTileTransform];
    int v13 = [v12 hasUserZoomedIn];

    if (v13)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __99__PUOneUpViewController_accessoryVisibilityInteractionController_setAccessoryVisible_changeReason___block_invoke;
      v16[3] = &unk_1E5F2ED10;
      id v17 = v11;
      [v17 performChanges:v16];

LABEL_11:
      return;
    }
    if (v5)
    {
      if ([(PUOneUpViewController *)self _shouldShowAccessoryAfterUnlock]
        || [(PUOneUpViewController *)self _requireUnlockedDeviceForAccessoryView]&& ([(PUOneUpViewController *)self unlockDeviceStatus], v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(), char v15 = v14[2](), v14, (v15 & 1) == 0))
      {
        [(PUOneUpViewController *)self _setShouldShowAccessoryAfterUnlock:1];
        goto LABEL_11;
      }
    }
    else
    {
      [(PUOneUpViewController *)self _setShouldShowAccessoryAfterUnlock:0];
    }
    [(PUOneUpViewController *)self _setAccessoryVisible:v5 changeReason:2];
    goto LABEL_11;
  }
}

uint64_t __99__PUOneUpViewController_accessoryVisibilityInteractionController_setAccessoryVisible_changeReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsResetVisualImageInteraction:1 reason:1];
}

- (BOOL)accessoryVisibilityInteractionController:(id)a3 isLocationFromProviderInAccessoryContent:(id)a4
{
  return [(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:a4];
}

- (void)accessoryVisibilityInteractionControllerDidEnd:(id)a3
{
  if ([(PUOneUpViewController *)self _shouldShowAccessoryAfterUnlock])
  {
    [(PUOneUpViewController *)self _setShouldShowAccessoryAfterUnlock:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke;
    aBlock[3] = &unk_1E5F2CEE8;
    aBlock[4] = self;
    id v4 = _Block_copy(aBlock);
    BOOL v5 = [(PUOneUpViewController *)self unlockDeviceHandlerWithActionType];

    if (v5)
    {
      id v6 = [(PUOneUpViewController *)self unlockDeviceHandlerWithActionType];
      ((void (**)(void, void *, void))v6)[2](v6, v4, 0);
    }
  }
  id v7 = [(PUOneUpViewController *)self _currentAssetViewModel];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke_2;
  v9[3] = &unk_1E5F2ED10;
  id v10 = v7;
  id v8 = v7;
  [v8 performChanges:v9];
}

uint64_t __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _setAccessoryVisible:1];
  }
  return result;
}

uint64_t __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsResetVisualImageInteraction:1 reason:2];
}

- (BOOL)accessoryVisibilityInteractionController:(id)a3 canBeginAtLocationFromProvider:(id)a4
{
  BOOL v5 = [(PUOneUpViewController *)self browsingSession];
  id v6 = [v5 viewModel];

  id v7 = [v6 currentAssetReference];
  id v8 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  double v9 = [v7 asset];
  uint64_t v10 = [v8 accessoryViewTypeForAsset:v9];

  double v11 = [v6 assetViewModelForAssetReference:v7];
  int v12 = [v11 isInEditMode] ^ 1;

  if (v10 == 3) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  if (v10) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)doubleTapZoomController:(id)a3 canDoubleTapBeginAtLocationFromProvider:(id)a4
{
  id v5 = a4;
  id v6 = +[PUOneUpSettings sharedInstance];
  int v7 = [v6 doubleTapZoomAreaExcludesBars];

  if (v7
    && ([(PUOneUpViewController *)self _barsController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isLocationFromProviderInBarsArea:v5],
        v8,
        (v9 & 1) != 0)
    || [(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:v5]|| [(PUOneUpViewController *)self _isLocationFromProviderOverControl:v5])
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    double v11 = [(PUOneUpViewController *)self _currentAssetViewModel];
    int v10 = [v11 isInEditMode] ^ 1;
  }
  return v10;
}

- (BOOL)oneUpGestureController:(id)a3 canPerformSelectionAtPoint:(id)a4
{
  id v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];

  if (v5) {
    char v6 = [v5 isInSelectionMode];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)oneUpGestureController:(id)a3 canTapToToggleChromeAtPoint:(id)a4
{
  id v5 = a4;
  if ([(PUOneUpViewController *)self _isVisualImageHasSubjectLiftedFromProvider:v5]|| [(PUOneUpViewController *)self _isLocationFromProviderOverVisualSearch:v5])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v7 = [(PUOneUpViewController *)self _currentAssetViewModel];
    int v6 = [v7 isAccessoryViewVisible] ^ 1;
  }
  return v6;
}

- (BOOL)oneUpGestureController:(id)a3 canDoubleTapToZoomAtPoint:(id)a4
{
  id v5 = a4;
  int v6 = [(PUOneUpViewController *)self chromeViewController];
  [v6 contentDecorationAdditionalInsets];
  BOOL v7 = -[PUOneUpViewController _isLocationFromProvider:overTileOfKind:insetBy:](self, "_isLocationFromProvider:overTileOfKind:insetBy:", v5, @"PUTileKindItemContent");

  if (!v7) {
    return 0;
  }
  if ([(PUOneUpViewController *)self _prefersFloatingInfoPanel]) {
    return 1;
  }
  return ![(PUOneUpViewController *)self _isAccessoryVisible];
}

- (BOOL)oneUpGestureController:(id)a3 canBeginGestureAt:(id)a4
{
  id v5 = a4;
  int v6 = [(PUOneUpViewController *)self chromeViewController];
  int v7 = [v6 shouldAllowGestureToBeginAt:v5];

  if (!v7
    || -[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v5)|| -[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v5)|| (-[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel"), v8 = objc_claimAutoreleasedReturnValue(), char v9 = [v8 isInEditMode], v8, (v9 & 1) != 0)|| -[PUOneUpViewController _isLocationFromProviderOverActionInfoItem:](self, "_isLocationFromProviderOverActionInfoItem:", v5)|| -[PUOneUpViewController _visualImageHasActiveTextSelectionFromProvider:](self, "_visualImageHasActiveTextSelectionFromProvider:", v5))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    BOOL v10 = ![(PUOneUpViewController *)self _isVisualImageHasSubjectLiftedFromProvider:v5];
  }

  return v10;
}

- (BOOL)oneUpGestureRecognizerCoordinator:(id)a3 shouldAllowIrisGestureAtLocationFromProvider:(id)a4
{
  id v5 = a4;
  if ([(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = ![(PUOneUpViewController *)self _isLocationFromProviderOverControl:v5];
  }
  int v7 = +[PUOneUpSettings sharedInstance];
  if (![v7 allowVisualIntelligence]
    || ![(PUOneUpViewController *)self _isLocationFromProvider:v5 overTileOfKind:@"PUTileKindItemContent"])
  {
    goto LABEL_15;
  }
  if (([v7 allowsVisualIntelligenceRemoveBackground] & 1) == 0)
  {
    if (!v6)
    {
LABEL_12:
      LOBYTE(v6) = 0;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = ![(PUOneUpViewController *)self _isLocationFromProviderOverInteractiveItem:v5];
    goto LABEL_15;
  }
  id v8 = [(PUOneUpViewController *)self browsingSession];
  char v9 = [v8 viewModel];
  BOOL v10 = [v9 currentAssetReference];
  double v11 = [v10 asset];
  BOOL v12 = [(PUOneUpViewController *)self _allowsShowingVisualIntelligenceForAsset:v11];

  if (!v12)
  {
    if (!v6) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v6)
  {
    if (![(PUOneUpViewController *)self _vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:v5])goto LABEL_14; {
    goto LABEL_12;
    }
  }
LABEL_15:

  return v6;
}

- (BOOL)_isSecondScreenBrowserVisible
{
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen]) {
    return 0;
  }
  id v4 = [(PUOneUpViewController *)self _secondScreenBrowser];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)airPlayControllerScreenAvailabilityChanged:(id)a3
{
  if (![a3 screenAvailability]) {
    [(PUOneUpViewController *)self _setSecondScreenBrowser:0];
  }
  [(PUOneUpViewController *)self _invalidateBarsControllers];
  [(PUOneUpViewController *)self _updateBarsControllerIfNeeded];
  [(PUOneUpViewController *)self _invalidateChromeViewController];
  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (BOOL)wantsContentVisibleAfterUnregisteringWithAirPlayController:(id)a3
{
  return ([(PUOneUpViewController *)self _options] >> 2) & 1;
}

- (id)contentViewControllerForAirPlayController:(id)a3
{
  id v4 = [(PUOneUpViewController *)self _secondScreenBrowser];
  if (!v4)
  {
    id v5 = [(PUOneUpViewController *)self browsingSession];
    id v4 = [[PUOneUpViewController alloc] initWithBrowsingSession:v5 options:514];
    [(PUOneUpViewController *)v4 _setMainOneUpForSecondScreenBrowser:self];
    [(PUOneUpViewController *)self _setSecondScreenBrowser:v4];
  }
  return v4;
}

- (void)badgeTileViewController:(id)a3 presentViewController:(id)a4
{
}

- (void)badgeVisibilityDidChange:(id)a3
{
  [(PUOneUpViewController *)self _invalidateTipPopovers];
  [(PUOneUpViewController *)self _updateTipPopoversIfNeeded];
}

- (void)dismissPresentedViewController:(id)a3 presentMenuWithCompletion:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F903D8];
  id v6 = a4;
  id v7 = [v5 livePhotosTipID];
  [(PUOneUpViewController *)self _handleSuggestedActionCompletedForTip:v7 completion:v6];
}

- (void)_dismissAnyPresentedTip
{
  if ([(PUOneUpViewController *)self _isTipPopoverVisible])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F903D8];
    presentedTipID = self->_presentedTipID;
    [v3 setTip:presentedTipID isPresentable:0];
  }
}

- (void)_handleSuggestedActionCompletedForTip:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(void))a4;
  if ([(NSString *)self->_presentedTipID isEqualToString:v9])
  {
    [(PUOneUpViewController *)self _setHasShownRelevantTip:1];
    [MEMORY[0x1E4F903D8] setTipActionPerformed:v9];
    id v7 = _Block_copy(v6);
    id tipDismissedCompletion = self->_tipDismissedCompletion;
    self->_id tipDismissedCompletion = v7;
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (BOOL)playButtonTileViewControllerShouldShowPlayButtonWhileActivated:(id)a3
{
  id v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];
  id v6 = [v5 reviewScreenBarsModel];

  if (v6) {
    return 1;
  }
  id v8 = [(PUOneUpViewController *)self browsingSession];
  id v9 = [v8 viewModel];
  BOOL v10 = [v9 currentAssetReference];

  double v11 = [v10 asset];
  BOOL v12 = [v10 assetCollection];
  char v13 = [(PUOneUpViewController *)self browsingSession];
  BOOL v14 = [v13 actionManager];
  char v15 = [v14 shouldEnableActionType:51 onAsset:v11 inAssetCollection:v12];

  if (v15)
  {
    char v7 = 1;
  }
  else
  {
    __int16 v16 = [(PUOneUpViewController *)self browsingSession];
    id v17 = [v16 actionManager];
    char v7 = [v17 shouldEnableActionType:52 onAsset:v11 inAssetCollection:v12];
  }
  return v7;
}

- (BOOL)playButtonTileViewControllerShouldShowPauseButton:(id)a3
{
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];
  id v5 = [v4 reviewScreenBarsModel];
  BOOL v6 = v5 != 0;

  return v6;
}

- (double)playButtonTileViewController:(id)a3 delayForButtonAnimation:(BOOL)a4
{
  double v4 = 0.0;
  if (a4)
  {
    BOOL v6 = [a3 assetViewModel];
    char v7 = [v6 videoPlayer];

    if ([v7 isAtEnd]
      && [(PUOneUpViewController *)self _shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:v7])
    {
      id v8 = +[PUOneUpSettings sharedInstance];
      [v8 chromeDefaultAnimationDuration];
      double v4 = v9 + 0.3;
    }
  }
  return v4;
}

- (void)playButtonTileViewControllerDidTapButton:(id)a3
{
  double v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];
  BOOL v6 = [v5 assetViewModelForCurrentAssetReference];
  char v7 = [v6 videoPlayer];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __66__PUOneUpViewController_playButtonTileViewControllerDidTapButton___block_invoke;
  v9[3] = &unk_1E5F2ECC8;
  id v10 = v7;
  double v11 = self;
  id v8 = v7;
  [v8 performChanges:v9];
}

uint64_t __66__PUOneUpViewController_playButtonTileViewControllerDidTapButton___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isPlaybackDesired];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setDesiredPlayState:2 reason:@"Play button tile was tapped"];
  }
  else
  {
    if ([v3 isAtEnd]) {
      [*(id *)(a1 + 32) rewindExistingPlayer];
    }
    [*(id *)(a1 + 32) setDesiredPlayState:4 reason:@"Play button tile was tapped"];
    [*(id *)(a1 + 32) setActivated:1];
  }
  double v4 = *(void **)(a1 + 40);
  return [v4 _hideChromeOnPlayButtonTapWithItemIsNowPlaying:v2 ^ 1u buttonIsOverlayed:1];
}

- (void)imageTileViewController:(id)a3 didDisplayFullQualityImageWithDeferredProcessingFinished:(BOOL)a4
{
  BOOL v4 = a4;
  [(PUOneUpViewController *)self _xct_endSignpostingForImageFullQuality];
  if (v4)
  {
    [(PUOneUpViewController *)self _xct_endSignpostingForImageDeferredProcessing];
  }
}

- (BOOL)ppt_imageTileViewControllerShouldSignalDeferredProcessingDoneAndFinalImageDisplayed:(id)a3
{
  BOOL v4 = [a3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  [(PUOneUpViewController *)self _layoutReferenceSize];
  double v10 = v9;
  double v12 = v11;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  return v8 + 3.0 >= v12 * *(double *)&PUMainScreenScale_screenScale
      || v6 + 3.0 >= v10 * *(double *)&PUMainScreenScale_screenScale;
}

- (BOOL)userTransformTileViewController:(id)a3 shouldReceiveTouchAtLocationFromProvider:(id)a4
{
  id v5 = a4;
  if ([(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:v5])
  {
    goto LABEL_5;
  }
  if ([(PUOneUpViewController *)self _isLocationFromProviderOverControl:v5]) {
    goto LABEL_5;
  }
  double v6 = [(PUOneUpViewController *)self _currentAssetViewModel];
  char v7 = [v6 isInEditMode];

  if ((v7 & 1) != 0
    || ([(PUOneUpViewController *)self _currentAssetViewModel],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isAccessoryViewVisible],
        v8,
        (v9 & 1) != 0))
  {
LABEL_5:
    LOBYTE(v10) = 0;
  }
  else
  {
    BOOL v10 = ![(PUOneUpViewController *)self _isLocationFromProviderOverVisualSearch:v5];
  }

  return v10;
}

- (void)userTransformTileViewController:(id)a3 didChangeIsUserInteracting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    char v7 = [(PUOneUpViewController *)self gestureController];
    [v7 cancelGestures];
  }
  double v8 = [v6 assetViewModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __84__PUOneUpViewController_userTransformTileViewController_didChangeIsUserInteracting___block_invoke;
  v10[3] = &unk_1E5F2E120;
  id v11 = v8;
  BOOL v12 = v4;
  id v9 = v8;
  [v9 performChanges:v10];
}

uint64_t __84__PUOneUpViewController_userTransformTileViewController_didChangeIsUserInteracting___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserTransformingTile:*(unsigned __int8 *)(a1 + 40)];
}

- (int64_t)userTransformTileViewController:(id)a3 insetModeForItemAtIndexPath:(id)a4
{
  id v5 = [a3 assetViewModel];
  id v6 = [v5 asset];
  int64_t v7 = [(PUOneUpViewController *)self _insetModeForAsset:v6];

  return v7;
}

- (BOOL)_isCurrentAssetAndInEditModeForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self browsingSession];
  id v6 = [v5 viewModel];

  int64_t v7 = [v6 currentAssetReference];
  id v8 = [v7 asset];
  id v9 = [v4 asset];
  if (v8 == v9)
  {

    goto LABEL_5;
  }
  BOOL v10 = v9;
  char v11 = [v8 isEqual:v9];

  if (v11)
  {
LABEL_5:
    char v13 = [v6 assetViewModelForAssetReference:v4];
    char v12 = [v13 isInEditMode];

    goto LABEL_6;
  }
  char v12 = 0;
LABEL_6:

  return v12;
}

- (void)oneUpBarsControllerWillPresentActionsMenu:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F903D8];
  id v6 = a4;
  id v7 = [v5 actionsMenuTipID];
  [(PUOneUpViewController *)self _handleSuggestedActionCompletedForTip:v7 completion:v6];
}

- (BOOL)oneUpBarsController:(id)a3 shouldHideStatusBarWhenShowingAccessoryViewForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PUOneUpViewController *)self _spec];
  int v7 = [v6 hideStatusBarWhenShowingAccessoryView];

  if (v7)
  {
    id v8 = [v5 asset];
    BOOL v9 = +[PUCommentsViewController canShowCommentsForAsset:v8];

    BOOL v10 = !v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)oneUpBarsController:(id)a3 shouldHideNavigationBarWhenShowingAccessoryViewForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  int v7 = [v6 shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:v5];

  if (v7) {
    BOOL v8 = ![(PUOneUpViewController *)self _isCurrentAssetAndInEditModeForAssetReference:v5];
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)oneUpBarsController:(id)a3 shouldHideToolbarWhenShowingAccessoryViewForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  char v7 = [v6 shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:v5];

  return v7;
}

- (BOOL)oneUpBarsController:(id)a3 shouldTapBeginAtLocationFromProvider:(id)a4
{
  id v5 = a4;
  presentedTipID = self->_presentedTipID;
  char v7 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
  LODWORD(presentedTipID) = [(NSString *)presentedTipID isEqualToString:v7];

  if (presentedTipID
    && [(PUOneUpViewController *)self _isLocationFromProvider:v5 overTileOfKind:PUTileKindSyndicationAttribution])
  {
    BOOL v8 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
    [(PUOneUpViewController *)self _handleSuggestedActionCompletedForTip:v8 completion:0];
  }
  if ([(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:v5]|| [(PUOneUpViewController *)self _isLocationFromProviderOverControl:v5])
  {
    int v9 = 0;
  }
  else
  {
    BOOL v10 = [(PUOneUpViewController *)self _currentAssetViewModel];
    int v9 = [v10 isInEditMode] ^ 1;
  }
  char v11 = +[PUOneUpSettings sharedInstance];
  int v12 = [v11 allowVisualIntelligence];

  if (!v12)
  {
    LOBYTE(v13) = v9;
    goto LABEL_18;
  }
  char v13 = +[PUOneUpSettings sharedInstance];
  if (![v13 allowsVisualIntelligenceVisualLookupInfoPanelMode])
  {

    if (!v9)
    {
LABEL_17:
      LOBYTE(v13) = 0;
      goto LABEL_18;
    }
LABEL_15:
    if (![(PUOneUpViewController *)self _isLocationFromProviderOverActionInfoItem:v5]&& ![(PUOneUpViewController *)self _visualImageHasActiveTextSelectionFromProvider:v5])
    {
      LODWORD(v13) = ![(PUOneUpViewController *)self _isVisualImageHasSubjectLiftedFromProvider:v5];
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  BOOL v14 = [(PUOneUpViewController *)self _isAccessoryVisible];

  LOBYTE(v13) = 0;
  if (!v14 && ((v9 ^ 1) & 1) == 0) {
    goto LABEL_15;
  }
LABEL_18:

  return (char)v13;
}

- (BOOL)oneUpBarsController:(id)a3 canShowCommentsForAsset:(id)a4
{
  id v5 = a4;
  id v6 = [(PUOneUpViewController *)self _spec];
  if ([v6 allowAccessoryVisibility]) {
    BOOL v7 = +[PUCommentsViewController canShowCommentsForAsset:v5];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isDetailsAccessoryAvailableForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  id v6 = [v4 asset];

  LOBYTE(v4) = [v5 accessoryViewTypeForAsset:v6] != 0;
  return (char)v4;
}

- (BOOL)oneUpBarsController:(id)a3 isDetailsAccessoryAvailableForAssetReference:(id)a4
{
  return [(PUOneUpViewController *)self _isDetailsAccessoryAvailableForAssetReference:a4];
}

- (void)oneUpBarsControllerDidTapTitle:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PUOneUpViewController_oneUpBarsControllerDidTapTitle___block_invoke;
  aBlock[3] = &unk_1E5F2CEE8;
  aBlock[4] = self;
  id v4 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  id v5 = [(PUOneUpViewController *)self unlockDeviceHandlerWithActionType];

  if (v5)
  {
    id v6 = [(PUOneUpViewController *)self unlockDeviceHandlerWithActionType];
    ((void (**)(void, void (**)(void *, uint64_t), void))v6)[2](v6, v4, 0);
  }
  else
  {
    v4[2](v4, 1);
  }
}

void __56__PUOneUpViewController_oneUpBarsControllerDidTapTitle___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = +[PUOneUpSettings sharedInstance];
    uint64_t v4 = [v3 titleTapAction];

    if (v4 == 2)
    {
      BOOL v10 = *(void **)(a1 + 32);
      [v10 _toggleDetailsVisibility];
    }
    else if (v4 == 1)
    {
      id v5 = [*(id *)(a1 + 32) browsingSession];
      id v6 = [v5 viewModel];
      id v11 = [v6 currentAssetReference];

      BOOL v7 = [*(id *)(a1 + 32) _accessoryViewControllersManager];
      BOOL v8 = [v7 accessoryViewControllerForAssetReference:v11];

      int v9 = [*(id *)(a1 + 32) navigationController];
      [v9 pushViewController:v8 animated:1];
    }
  }
}

- (void)oneUpBarsController:(id)a3 didTapPlayPauseButton:(BOOL)a4
{
}

- (void)oneUpBarsControllerDidChangeShowingPlayPauseButton:(id)a3
{
  [(PUOneUpViewController *)self _invalidateSpec];
  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (void)barsControllerContentGuideInsetsDidChange:(id)a3
{
  [(PUOneUpViewController *)self _invalidateLayout];
  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (id)barsControllerViewHostingGestureRecognizers:(id)a3
{
  uint64_t v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];
  char v6 = [v5 isPresentedForPreview];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(PUOneUpViewController *)self _tilingView];
  }
  return v7;
}

- (void)_updateChromeViewControllerDismissalProgress
{
  BOOL v3 = [(PUOneUpViewController *)self _interactivePinchDismissalController];
  [v3 dismissalInteractionProgress];
  double v5 = v4;

  char v6 = [(PUOneUpViewController *)self _interactiveSwipeDismissalController];
  [v6 dismissalInteractionProgress];
  double v8 = v7;

  int v9 = [(PUOneUpViewController *)self _interactivePinchDismissalController];
  if ([v9 isHandlingDismissalInteraction])
  {
    uint64_t v10 = 1;
  }
  else
  {
    id v11 = [(PUOneUpViewController *)self _interactiveSwipeDismissalController];
    uint64_t v10 = [v11 isHandlingDismissalInteraction];
  }
  if (v5 < v8) {
    double v5 = v8;
  }

  id v12 = [(PUOneUpViewController *)self chromeViewController];
  [v12 updateDismissalStateWithIsInteractivelyDismissing:v10 dismissalProgress:v5];
}

- (void)interactiveDismissalControllerChangedIsHandlingDismissalInteraction:(id)a3
{
  id v4 = a3;
  double v5 = [(PUOneUpViewController *)self _currentAssetViewModel];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __93__PUOneUpViewController_interactiveDismissalControllerChangedIsHandlingDismissalInteraction___block_invoke;
  id v11 = &unk_1E5F2ECC8;
  id v12 = v5;
  id v13 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 performChanges:&v8];
  [(PUOneUpViewController *)self _updateChromeViewControllerDismissalProgress];
}

uint64_t __93__PUOneUpViewController_interactiveDismissalControllerChangedIsHandlingDismissalInteraction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) isHandlingDismissalInteraction];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setIsBeingDismissed:v2];
}

- (BOOL)interactiveDismissalController:(id)a3 canBeginDismissalAtLocationFromProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUOneUpViewController *)self _currentAssetViewModel];
  if ([v8 isInEditMode])
  {
    int v9 = 0;
LABEL_3:

    goto LABEL_9;
  }
  char v10 = [v8 isAccessoryViewVisible];

  if ((v10 & 1) == 0
    && ![(PUOneUpViewController *)self _isLocationFromProviderInAccessoryArea:v6]&& ![(PUOneUpViewController *)self _isLocationFromProviderOverControl:v6]&& ![(PUOneUpViewController *)self _isIrisPlaying])
  {
    uint64_t v8 = [(PUOneUpViewController *)self browsingSession];
    id v17 = [v8 viewModel];
    int v9 = [v17 isInSelectionMode] ^ 1;

    goto LABEL_3;
  }
  int v9 = 0;
LABEL_9:
  id v11 = [(PUOneUpViewController *)self _interactivePinchDismissalController];

  BOOL v12 = v11 == v7;
  if (v11 == v7) {
    LOBYTE(v13) = 0;
  }
  else {
    LOBYTE(v13) = v9;
  }
  if (v12 && v9)
  {
    BOOL v14 = [(PUOneUpViewController *)self _currentAssetViewModel];
    char v15 = [v14 modelTileTransform];
    int v13 = [v15 hasUserZoomedIn] ^ 1;
  }
  return v13;
}

- (id)interactiveDismissalControllerDesignatedTileController:(id)a3
{
  id v4 = [(PUOneUpViewController *)self browsingSession];
  double v5 = [v4 viewModel];

  id v6 = [v5 assetsDataSource];
  id v7 = [v5 currentAssetReference];
  uint64_t v8 = [v6 indexPathForAssetReference:v7];
  if (v8)
  {
    int v9 = [(PUOneUpViewController *)self _tilingView];
    char v10 = [v6 identifier];
    id v11 = [v9 presentedTileControllerWithIndexPath:v8 kind:@"PUTileKindItemContent" dataSourceIdentifier:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)layout:(id)a3 shouldShowAttributionViewForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataSource];
  uint64_t v8 = [v7 assetReferenceAtIndexPath:v6];

  int v9 = [(PUOneUpViewController *)self browsingSession];
  char v10 = [v9 viewModel];
  id v11 = [v10 assetViewModelForAssetReference:v8];

  uint64_t v12 = [v11 fetchAssetSyndicationState];
  BOOL v14 = v12 == 4 || (v12 & 0xFFFFFFFFFFFFFFFELL) == 2;

  return v14;
}

- (CGRect)layout:(id)a3 bestSquareRectForItemAtIndexPath:(id)a4
{
  CGFloat v6 = *MEMORY[0x1E4F91340];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F91340] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F91340] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F91340] + 24);
  id v9 = a4;
  char v10 = [a3 dataSource];
  id v11 = [v10 assetReferenceAtIndexPath:v9];

  uint64_t v12 = [v11 asset];
  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v12 bestCropRectForAspectRatio:0 verticalContentMode:2 cropMode:1.0],
          CGFloat x = v31.origin.x,
          CGFloat y = v31.origin.y,
          CGFloat width = v31.size.width,
          CGFloat height = v31.size.height,
          !CGRectIsEmpty(v31)))
    {
      CGFloat v7 = height;
      CGFloat v8 = width;
      CGFloat v5 = y;
      CGFloat v6 = x;
    }
    else
    {
      id v17 = PLOneUpGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "Can't get a non-empty bestSquareRect by bestCropRectForAspectRatio:bestCropRectForAspectRatio:...", buf, 2u);
      }

      CGFloat v18 = (double)(unint64_t)[v12 pixelWidth];
      unint64_t v19 = [v12 pixelHeight];
      v32.origin.CGFloat x = 0.0;
      v32.origin.CGFloat y = 0.0;
      v32.size.CGFloat width = v18;
      v32.size.CGFloat height = (double)v19;
      if (!CGRectIsEmpty(v32))
      {
        PXRectWithAspectRatioFittingRect();
        PXRectNormalize();
        CGFloat v6 = v20;
        CGFloat v5 = v21;
        CGFloat v8 = v22;
        CGFloat v7 = v23;
      }
    }
  }
  else
  {
    double v24 = PXAssertGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v29[0] = 0;
      _os_log_error_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_ERROR, "asset of assetReference is nil for bestSquareRectForItemAtIndexPath:", (uint8_t *)v29, 2u);
    }
  }
  double v25 = v6;
  double v26 = v5;
  double v27 = v8;
  double v28 = v7;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (BOOL)layout:(id)a3 shouldInitiallyZoomToFillForItemAtIndexPath:(id)a4 contentSize:(CGSize)a5 viewportSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  id v12 = a4;
  int v13 = [a3 dataSource];
  BOOL v14 = [v13 assetReferenceAtIndexPath:v12];

  char v15 = [(PUOneUpViewController *)self browsingSession];
  __int16 v16 = [v15 viewModel];

  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    id v17 = [v16 assetViewModelForAssetReference:v14];
    if (![v16 isFillScreenModeEnabled]
      || ([v17 isUserTransformingTile] & 1) != 0
      || ([v17 modelTileTransform],
          CGFloat v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 hasUserInput],
          v18,
          v19))
    {
      char v20 = [v16 isPresentedForPreview];
LABEL_13:
      BOOL v23 = v20;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_14;
  }
  double v21 = [v14 asset];
  if ([v21 mediaType] != 2)
  {

LABEL_10:
    id v17 = [MEMORY[0x1E4F903D0] sharedInstance];
    double v24 = [(PUOneUpViewController *)self _spec];
    uint64_t v25 = [v24 tileInitialContentMode];

    if (v25 != 2)
    {
      if (v25)
      {
        BOOL v23 = 0;
        goto LABEL_16;
      }
      char v20 = objc_msgSend(v17, "shouldInitiallyZoomContentWithSize:toFillViewWithSize:", v9, v8, width, height);
      goto LABEL_13;
    }
LABEL_14:
    BOOL v23 = 1;
    goto LABEL_16;
  }
  char v22 = [v16 isPresentedForPreview];

  if (v22) {
    goto LABEL_10;
  }
  BOOL v23 = 0;
LABEL_17:

  return v23;
}

- (BOOL)layout:(id)a3 shouldShowVideoPlaceholderForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUOneUpViewController *)self _isSecondScreenBrowserVisible])
  {
    double v8 = [(PUOneUpViewController *)self _videoPlayerAtIndexPath:v7 layout:v6];
    char v9 = [v8 isPlaybackDesired];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (CGPoint)layout:(id)a3 accessoryOffsetForItemAtIndexPath:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  CGFloat v5 = [(PUOneUpViewController *)self _assetViewModelAtIndexPath:a4 layout:a3];
  [v5 contentOffset];
  double v7 = v6;
  [v5 preferredContentOffset];
  double v9 = v8;
  if (layout_accessoryOffsetForItemAtIndexPath__onceToken != -1) {
    dispatch_once(&layout_accessoryOffsetForItemAtIndexPath__onceToken, &__block_literal_global_723);
  }
  [(id)layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter setInputValue:v7 - v9];
  [(id)layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter outputValue];
  double v11 = v10;

  double v12 = v4;
  double v13 = v11;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

void __66__PUOneUpViewController_layout_accessoryOffsetForItemAtIndexPath___block_invoke()
{
  os_log_t v0 = +[PUSoftClampValueFilter scrollViewFilter];
  [v0 setMinimumValue:0.0];
  [v0 setMaximumValue:INFINITY];
  v1 = (void *)layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter;
  layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter = (uint64_t)v0;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v10 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 conformsToProtocol:&unk_1F0818320])
  {
    CGFloat v5 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
    double v6 = [v5 assetReferenceForAccessoryViewController:v4];

    double v7 = [v6 indexPath];
    if (v7)
    {
      double v8 = [(PUOneUpViewController *)self _tilingView];
      double v9 = [v8 layout];

      [v9 invalidateAccessoryForItemAtIndexPath:v7 withOptions:2];
    }
  }
}

- (BOOL)layout:(id)a3 shouldUseSquareImageInAccessoryForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PUOneUpViewController *)self _spec];
  int v9 = [v8 prefersSquareImageInDetails];

  if (v9)
  {
    objc_super v10 = [(PUOneUpViewController *)self _currentAssetViewModel];
    double v11 = [v10 modelTileTransform];
    int v12 = [v11 hasUserZoomedIn];

    if (![MEMORY[0x1E4F90300] isOneUpRefreshEnabled]
      || ([MEMORY[0x1E4F90300] sharedInstance],
          double v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 enableSideCommentsInLandscape],
          v13,
          (v14 & 1) == 0))
    {
      char v15 = [(PUOneUpViewController *)self _assetReferenceAtIndexPath:v7 layout:v6];
      __int16 v16 = [v15 asset];
      v12 |= +[PUCommentsViewController canShowCommentsForAsset:v16];
    }
    char v17 = v12 ^ 1;
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (double)layout:(id)a3 minimumItemHeightNeededInAccessoryForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 visibleRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  __int16 v16 = [(PUOneUpViewController *)self _assetReferenceAtIndexPath:v7 layout:v6];

  char v17 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  CGFloat v18 = [v17 accessoryViewControllerForAssetReference:v16];

  if (v18)
  {
    [v18 preferredContentSize];
    double v20 = v19;
  }
  else
  {
    double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v25.origin.CGFloat x = v9;
  v25.origin.CGFloat y = v11;
  v25.size.double width = v13;
  v25.size.double height = v15;
  double Height = CGRectGetHeight(v25);
  [v6 contentGuideInsets];
  if (Height - v22 - v20 >= 0.0) {
    double v23 = Height - v22 - v20;
  }
  else {
    double v23 = 0.0;
  }

  return v23;
}

- (double)layout:(id)a3 minimumVisibleAccessoryHeightForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 visibleRect];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double MinY = CGRectGetMinY(v31);
  CGFloat v13 = +[PUOneUpSettings sharedInstance];
  [v13 accessoryInitialTopPosition];
  double v15 = v14;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v32);

  char v17 = [(PUOneUpViewController *)self _spec];
  int v18 = [v17 prefersSquareImageInDetails];

  if (v18)
  {
    double AspectRatio = PURectGetAspectRatio(x, y, width, height);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v20 = CGRectGetMinY(v33);
    double v21 = 0.0;
    if (AspectRatio <= 1.0)
    {
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      double v21 = CGRectGetWidth(v34);
    }
    double v22 = v20 + v21;
  }
  else
  {
    double v22 = MinY + v15 * v16;
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v35);
  [v7 contentGuideInsets];
  double v25 = MaxY - v24 - v22;
  double v26 = [(PUOneUpViewController *)self _assetReferenceAtIndexPath:v6 layout:v7];

  double v27 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  double v28 = [v27 accessoryViewControllerForAssetReference:v26];

  [v28 preferredContentSize];
  if (v25 >= v29) {
    double v25 = v29;
  }

  return v25;
}

- (double)layout:(id)a3 minimumVisibleContentHeightForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[PUOneUpSettings sharedInstance];
  [v8 minimumVisibleContentHeight];
  double v10 = v9;

  if (([MEMORY[0x1E4F90300] isOneUpRefreshEnabled] & 1) == 0)
  {
    CGFloat v11 = [(PUOneUpViewController *)self _assetReferenceAtIndexPath:v7 layout:v6];
    double v12 = [v11 asset];

    if (+[PUCommentsViewController canShowCommentsForAsset:v12])
    {
      CGFloat v13 = +[PUOneUpSettings sharedInstance];
      [v13 minimumVisibleCommentedContentHeight];
      double v10 = v14;
    }
  }

  return v10;
}

- (BOOL)layout:(id)a3 isShowingInfoPanelForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    BOOL v8 = 0;
  }
  else
  {
    double v9 = [(PUOneUpViewController *)self _assetViewModelAtIndexPath:v7 layout:v6];
    BOOL v10 = [(PUOneUpViewController *)self _prefersFloatingInfoPanel];
    CGFloat v11 = [v9 asset];
    int64_t v12 = [(PUOneUpViewController *)self _accessoryContentKindForAsset:v11];

    char v13 = [v9 isAccessoryViewVisible];
    if (v12 == 1) {
      char v14 = v13;
    }
    else {
      char v14 = 0;
    }
    BOOL v8 = v14 & v10;
  }
  return v8;
}

- (BOOL)layout:(id)a3 shouldShowAccessoryForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    double v9 = [(PUOneUpViewController *)self _assetViewModelAtIndexPath:v7 layout:v6];
    if ([v9 isAccessoryViewVisible]) {
      BOOL v8 = ![(PUOneUpViewController *)self _prefersFloatingInfoPanel];
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (CGPoint)layout:(id)a3 contentOffsetForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    BOOL v10 = [(PUOneUpViewController *)self _assetViewModelAtIndexPath:v7 layout:v6];
    [v10 contentOffset];
    double v8 = v11;
    double v9 = v12;
  }
  double v13 = v8;
  double v14 = v9;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)layout:(id)a3 willApplyDisplayTileTransform:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    double v11 = [(PUOneUpViewController *)self _assetViewModelAtIndexPath:v10 layout:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __81__PUOneUpViewController_layout_willApplyDisplayTileTransform_forItemAtIndexPath___block_invoke;
    v13[3] = &unk_1E5F2ECC8;
    id v14 = v11;
    id v15 = v9;
    id v12 = v11;
    [v12 performChanges:v13];
  }
}

uint64_t __81__PUOneUpViewController_layout_willApplyDisplayTileTransform_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSecondDisplayTileTransform:*(void *)(a1 + 40)];
}

- (id)layout:(id)a3 modelTileTransformForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [v6 dataSource];
    double v11 = [(PUOneUpViewController *)self browsingSession];
    id v12 = [v11 viewModel];
    double v13 = [v12 assetsDataSource];

    id v14 = [v10 assetReferenceAtIndexPath:v7];
    if (v10 != v13)
    {
      uint64_t v15 = [v13 assetReferenceForAssetReference:v14];

      id v14 = (void *)v15;
    }
    if (v14)
    {
      double v16 = [(PUOneUpViewController *)self browsingSession];
      char v17 = [v16 viewModel];
      int v18 = [v17 assetViewModelForAssetReference:v14];

      double v19 = [v18 modelTileTransform];
      if ([v18 isAccessoryViewVisible]
        && ![(PUOneUpViewController *)self _prefersFloatingInfoPanel])
      {
        [v18 accessoryViewVisibilityFraction];
        [v19 scale];
        PXFloatByLinearlyInterpolatingFloats();
        double v21 = v20;
        [v19 normalizedTranslation];
        PXPointByLinearlyInterpolatingPoints();
        uint64_t v24 = objc_msgSend(v19, "copyWithScale:normalizedTranslation:", v21, v22, v23);

        double v19 = (void *)v24;
      }
    }
    else
    {
      double v19 = 0;
    }
  }
  else
  {
    double v19 = 0;
  }
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    [v19 scale];
    if (v25 < 1.0)
    {

      double v19 = 0;
    }
  }

  return v19;
}

- (CGSize)layout:(id)a3 loadingIndicatorSizeForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataSource];
  id v8 = [(PUOneUpViewController *)self browsingSession];
  id v9 = [v8 viewModel];
  id v10 = [v7 assetReferenceAtIndexPath:v6];

  double v11 = [v9 assetViewModelForAssetReference:v10];

  id v12 = [(PUOneUpViewController *)self loadingIndicatorController];
  uint64_t v13 = [v12 loadingIndicatorStyleForAssetViewModel:v11];

  if (v13)
  {
    +[PULoadingIndicatorTileViewController loadingIndicatorTileSizeForStyle:v13];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v18 = v15;
  double v19 = v17;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (BOOL)layout:(id)a3 shouldShowBufferingIndicatorForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dataSource];
  id v7 = [v6 assetAtIndexPath:v5];

  LOBYTE(v5) = +[PUBufferingIndicatorTileViewController canShowBufferingIndicatorTileForAsset:v7];
  return (char)v5;
}

- (BOOL)layout:(id)a3 shouldMovePeopleRowForItemAtIndexPath:(id)a4
{
  id v7 = a4;
  id v8 = [a3 dataSource];
  if (!v8)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    double v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4756, @"%@ should be an instance inheriting from %@, but it is nil", @"layout.dataSource", v17 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    double v18 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v18);
    double v19 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4756, @"%@ should be an instance inheriting from %@, but it is %@", @"layout.dataSource", v17, v19 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  id v9 = [v8 assetAtIndexPath:v7];

  id v10 = [(PUOneUpViewController *)self browsingSession];
  double v11 = [v10 viewModel];

  id v12 = [v11 assetSharedViewModelForAsset:v9];
  BOOL v13 = +[PURenderIndicatorTileViewController wantsRenderViewForTypeOfProcessingNeeded:](PURenderIndicatorTileViewController, "wantsRenderViewForTypeOfProcessingNeeded:", [v12 deferredProcessingNeeded]);

  return v13;
}

- (BOOL)layout:(id)a3 shouldShowPeopleRowForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((PLIsMobileSlideShow() & 1) == 0 && !PLIsCamera())
  {
    BOOL v16 = 0;
    goto LABEL_10;
  }
  id v9 = [v7 dataSource];
  if (!v9)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    double v19 = (objc_class *)objc_opt_class();
    double v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4748, @"%@ should be an instance inheriting from %@, but it is nil", @"layout.dataSource", v20 object file lineNumber description];
LABEL_13:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    double v21 = (objc_class *)objc_opt_class();
    double v20 = NSStringFromClass(v21);
    double v22 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4748, @"%@ should be an instance inheriting from %@, but it is %@", @"layout.dataSource", v20, v22 object file lineNumber description];

    goto LABEL_13;
  }
LABEL_5:
  id v10 = [(PUOneUpViewController *)self browsingSession];
  double v11 = [v10 viewModel];
  id v12 = [v9 assetReferenceAtIndexPath:v8];
  BOOL v13 = [v11 assetViewModelForAssetReference:v12];

  int v14 = [(PUOneUpViewController *)self _options];
  char v15 = [v13 isAccessoryViewVisible];
  if ((*(void *)&v14 & 0x400000) != 0) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15;
  }

LABEL_10:
  return v16;
}

- (BOOL)layout:(id)a3 shouldMoveProgressIndicatorForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUOneUpViewController *)self browsingSession];
  id v9 = [v8 viewModel];

  id v10 = [(PUOneUpViewController *)self _spec];
  if ([v10 shouldDisplaySelectionIndicators])
  {
    BOOL v11 = 1;
LABEL_7:

    goto LABEL_8;
  }
  char v12 = [v9 isInSelectionMode];

  if ((v12 & 1) == 0)
  {
    BOOL v13 = [(PUOneUpViewController *)self browsingSession];
    int v14 = [v13 importStatusManager];

    if (!v14)
    {
      BOOL v11 = 0;
      goto LABEL_8;
    }
    id v10 = [v6 dataSource];
    char v15 = [(PUOneUpViewController *)self browsingSession];
    BOOL v16 = [v15 viewModel];
    double v17 = [v10 assetReferenceAtIndexPath:v7];
    double v18 = [v16 assetViewModelForAssetReference:v17];

    BOOL v11 = [v18 importState] != 0;
    goto LABEL_7;
  }
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (double)alphaForReviewScreenBarsInLayout:(id)a3
{
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];
  int v5 = [v4 isChromeVisible];

  double result = 0.0;
  if (v5) {
    return 1.0;
  }
  return result;
}

- (BOOL)layoutShouldShowReviewScreenScrubberBar:(id)a3
{
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  int v5 = [v4 currentAssetReference];
  id v6 = [v5 asset];
  BOOL v7 = [v6 playbackStyle] == 4;

  return v7;
}

- (BOOL)layout:(id)a3 shouldShowCropButtonForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUOneUpViewController *)self _spec];
  int v9 = [v8 shouldShowCropButton];

  if (v9)
  {
    id v10 = [v6 dataSource];
    BOOL v11 = [v10 assetAtIndexPath:v7];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v12 = v11;

      if (v12)
      {
        LOBYTE(v9) = +[PUCropButtonTileViewController shouldShowCropButtonTileForAsset:v12];
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      id v12 = 0;
    }
    LOBYTE(v9) = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (BOOL)layout:(id)a3 shouldShowPlayButtonForItemAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v5 dataSource];
    int v9 = [v8 assetAtIndexPath:v6];
    BOOL v7 = (objc_opt_respondsToSelector() & 1) != 0 && [v9 playbackStyle] == 4;
  }
  return v7;
}

- (CGSize)layout:(id)a3 assetExplorerReviewScreenBadgeSizeForItemAtIndexPath:(id)a4
{
  +[PUAssetExplorerReviewScreenBadgeTileViewController badgeTileSize];
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (double)layout:(id)a3 leadingBadgesWidthForItemAtIndexPath:(id)a4 contentWidth:(double)a5
{
  id v8 = a4;
  int v9 = [a3 dataSource];
  id v10 = [v9 assetReferenceAtIndexPath:v8];

  BOOL v11 = [(PUOneUpViewController *)self browsingSession];
  id v12 = [v11 viewModel];
  BOOL v13 = [v12 assetViewModelForAssetReference:v10];

  +[PUBadgeTileViewController leadingBadgesSizeForAssetViewModel:v13 contentWidth:a5];
  double v15 = v14;

  return v15;
}

- (CGSize)layout:(id)a3 badgeSizeForItemAtIndexPath:(id)a4 contentWidth:(double)a5
{
  id v8 = a4;
  int v9 = [a3 dataSource];
  id v10 = [v9 assetReferenceAtIndexPath:v8];

  BOOL v11 = [(PUOneUpViewController *)self browsingSession];
  id v12 = [v11 viewModel];
  BOOL v13 = [v12 assetViewModelForAssetReference:v10];

  +[PUBadgeTileViewController badgeTileSizeForAssetViewModel:v13 contentWidth:a5];
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (BOOL)layout:(id)a3 canApplyInsetStylingToItemAtIndexPath:(id)a4
{
  double v4 = [(PUOneUpViewController *)self browsingSession];
  double v5 = [v4 viewModel];
  char v6 = [v5 isChromeVisible];

  return v6;
}

- (UIEdgeInsets)layout:(id)a3 insetsWhenScaledToFitForItemAtIndexPath:(id)a4 inViewportSize:(CGSize)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PUOneUpViewController *)self browsingSession];
  BOOL v11 = [v10 viewModel];

  id v12 = [v8 dataSource];
  if (!v12)
  {
    double v38 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    [v38 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4594, @"%@ should be an instance inheriting from %@, but it is nil", @"layout.dataSource", v40 object file lineNumber description];
LABEL_23:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v38 = [MEMORY[0x1E4F28B00] currentHandler];
    double v41 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v41);
    double v42 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v38 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4594, @"%@ should be an instance inheriting from %@, but it is %@", @"layout.dataSource", v40, v42 object file lineNumber description];

    goto LABEL_23;
  }
LABEL_3:
  BOOL v13 = [v12 assetAtIndexPath:v9];
  if (![MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    [v8 visibleRect];
    if ((PXSizeIsEmpty() & 1) != 0
      || (PXSizeGetAspectRatio(), [v13 aspectRatio], !PXFloatEqualToFloatWithTolerance()))
    {
      [v8 contentSafeInsets];
      double v18 = v24;
      double v17 = v25;
      double v16 = v26;
      double v15 = v27;
    }
    else
    {
      double v18 = *MEMORY[0x1E4FB2848];
      double v17 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v16 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    goto LABEL_20;
  }
  int64_t v14 = [(PUOneUpViewController *)self _insetModeForAsset:v13];
  if (!v14) {
    goto LABEL_13;
  }
  if (v14 == 2)
  {
    double v19 = [(PUOneUpViewController *)self chromeViewController];
    [(PUOneUpViewController *)self _layoutReferenceSize];
    objc_msgSend(v19, "contentGuideInsetsForViewSize:");
    goto LABEL_15;
  }
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  if (v14 != 1) {
    goto LABEL_16;
  }
  if (([v11 isChromeVisible] & 1) == 0)
  {
LABEL_13:
    double v18 = *MEMORY[0x1E4F91320];
    double v17 = *(double *)(MEMORY[0x1E4F91320] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F91320] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F91320] + 24);
    goto LABEL_16;
  }
  double v19 = [(PUOneUpViewController *)self chromeViewController];
  [(PUOneUpViewController *)self _layoutReferenceSize];
  objc_msgSend(v19, "toolbarInsetsForViewSize:");
LABEL_15:
  double v18 = v20;
  double v17 = v21;
  double v16 = v22;
  double v15 = v23;

LABEL_16:
  double v28 = [v12 assetReferenceAtIndexPath:v9];
  double v29 = [v11 assetViewModelForAssetReference:v28];
  if ([v29 isAccessoryViewVisible]
    && ![(PUOneUpViewController *)self _prefersFloatingInfoPanel])
  {
    [v29 accessoryViewVisibilityFraction];
    PXEdgeInsetsByLinearlyInterpolatingInsets();
    double v18 = v30;
    double v17 = v31;
    double v16 = v32;
    double v15 = v33;
  }

LABEL_20:
  double v34 = v18;
  double v35 = v17;
  double v36 = v16;
  double v37 = v15;
  result.double right = v37;
  result.double bottom = v36;
  result.double left = v35;
  result.double top = v34;
  return result;
}

- (BOOL)layout:(id)a3 wantsContentLegibilityTreatmentForItemAtIndexPath:(id)a4
{
  double v4 = [(PUOneUpViewController *)self chromeViewController];
  char v5 = [v4 wantsContentLegibilityTreatment];

  return v5;
}

- (CGSize)layout:(id)a3 pixelSizeForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  char v6 = [a3 dataSource];
  BOOL v7 = [v6 assetAtIndexPath:v5];

  double v8 = (double)(unint64_t)[v7 pixelWidth];
  double v9 = (double)(unint64_t)[v7 pixelHeight];

  double v10 = v8;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (double)layout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v7 = a4;
  double v8 = [a3 dataSource];
  double v9 = [v8 assetAtIndexPath:v7];

  [v9 aspectRatio];
  double v11 = *(double *)&v10;
  BOOL v12 = (v10 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v13 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (v10 >= 0)
  {
    BOOL v13 = 0;
    BOOL v12 = 0;
  }
  if ((v10 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
    BOOL v12 = 1;
  }
  int v14 = (v10 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v12;
  if ((v10 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000) {
    int v14 = 1;
  }
  if ((v14 | v13) == 1)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4577, @"Asset:%@ must provide a valid aspect ratio, got:%f.", v9, *(void *)&v11 object file lineNumber description];
  }
  return v11;
}

- (int64_t)layout:(id)a3 insetModeForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataSource];
  double v8 = [v7 assetAtIndexPath:v6];

  int64_t v9 = [(PUOneUpViewController *)self _insetModeForAsset:v8];
  return v9;
}

- (void)imageAnalysisInteractionSubjectInteractionInProgressDidChange:(id)a3
{
  if ([a3 isSubjectInteractionInProgress])
  {
    id v4 = [(PUOneUpViewController *)self gestureController];
    [v4 cancelGestures];
  }
}

- (BOOL)imageAnalysisInteractionShouldHighlightSubjectWhenAccessoryIsVisible:(id)a3
{
  return [(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 1;
}

- (id)textsToHighlightForImageAnalysisInteraction:(id)a3
{
  id v4 = [(PUOneUpViewController *)self textsToHighlight];
  if ([v4 count])
  {
    id v5 = [(PUOneUpViewController *)self assetUUIDsAllowedToHighlightText];
    if ([v5 count])
    {
      id v6 = [(PUOneUpViewController *)self browsingSession];
      uint64_t v7 = [v6 viewModel];
      double v8 = [(id)v7 currentAssetReference];
      int64_t v9 = [v8 asset];

      uint64_t v10 = [v9 uuid];
      LOBYTE(v7) = [v5 containsObject:v10];

      if ((v7 & 1) == 0)
      {

        id v4 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  return v4;
}

- (void)imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange__onceToken != -1)
  {
    dispatch_once(&imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange__onceToken, &__block_literal_global_50045);
    id v3 = v4;
  }
  if ([v3 isDrivingLivePhotoPlayback]) {
    [(id)analysisControllers addObject:v4];
  }
  else {
    [(id)analysisControllers removeObject:v4];
  }
}

void __85__PUOneUpViewController_imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = (void *)analysisControllers;
  analysisControllers = v0;
}

- (void)showDetailsViewForImageAnalysisInteraction:(id)a3
{
  if (![(PUOneUpViewController *)self _isAccessoryVisible])
  {
    [(PUOneUpViewController *)self _toggleDetailsVisibility];
  }
}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  id v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];
  id v6 = [v5 currentAssetReference];

  uint64_t v7 = [(PUOneUpViewController *)self _tilingView];
  double v8 = [v6 indexPath];
  int64_t v9 = [v6 dataSourceIdentifier];
  uint64_t v10 = [v7 presentedTileControllerWithIndexPath:v8 kind:@"PUTileKindItemContent" dataSourceIdentifier:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = [v10 viewIfLoaded];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (BOOL)analysisInteractionAllowedForImageAnalysisInteraction:(id)a3
{
  id v4 = [a3 assetViewModel];
  id v5 = [v4 asset];

  if ([(PUOneUpViewController *)self _allowsShowingVisualIntelligenceForAsset:v5])
  {
    id v6 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v7 = [v6 viewModel];
    double v8 = [v7 currentAssetReference];
    int64_t v9 = [v8 asset];
    id v10 = v5;
    id v11 = v9;
    if (v10 == v11)
    {
      BOOL v13 = 1;
    }
    else
    {
      uint64_t v12 = [v10 isContentEqualTo:v11];
      if (!v12) {
        uint64_t v12 = [v11 isContentEqualTo:v10];
      }
      BOOL v13 = v12 == 2;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self _tilingView];

  if (v5 == v4)
  {
    id v6 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v7 = [v6 viewModel];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __54__PUOneUpViewController_scrollViewDidEndDecelerating___block_invoke;
    v10[3] = &unk_1E5F2ED10;
    id v8 = v7;
    id v11 = v8;
    [v8 performChanges:v10];
    if ([(PUOneUpViewController *)self _isAccessoryVisible]
      && [(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 1)
    {
      [(PUOneUpEventTracker *)self->_eventTracker logInfoPanelShownAndSwipeToNewAsset];
    }
    int64_t v9 = objc_msgSend(v4, "is_scrollViewDelegate");
    [v9 scrollViewDidEndDecelerating:v4];
  }
}

uint64_t __54__PUOneUpViewController_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsScrolling:0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUOneUpViewController *)self _tilingView];

  if (v7 == v6)
  {
    if (!v4)
    {
      id v8 = [(PUOneUpViewController *)self browsingSession];
      int64_t v9 = [v8 viewModel];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__PUOneUpViewController_scrollViewDidEndDragging_willDecelerate___block_invoke;
      v12[3] = &unk_1E5F2ED10;
      id v13 = v9;
      id v10 = v9;
      [v10 performChanges:v12];
    }
    id v11 = objc_msgSend(v6, "is_scrollViewDelegate");
    [v11 scrollViewDidEndDragging:v6 willDecelerate:v4];
  }
}

uint64_t __65__PUOneUpViewController_scrollViewDidEndDragging_willDecelerate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsScrolling:0];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  id v9 = [(PUOneUpViewController *)self _tilingView];

  id v10 = v12;
  if (v9 == v12)
  {
    id v11 = objc_msgSend(v12, "is_scrollViewDelegate");
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

    id v10 = v12;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self _tilingView];

  if (v5 == v4)
  {
    [(PUOneUpViewController *)self _updateViewModelWithCurrentScrollPosition];
    id v6 = [(PUOneUpViewController *)self browsingSession];
    id v7 = [v6 viewModel];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __53__PUOneUpViewController_scrollViewWillBeginDragging___block_invoke;
    v10[3] = &unk_1E5F2ED10;
    id v11 = v7;
    id v8 = v7;
    [v8 performChanges:v10];
    if ([(PUOneUpViewController *)self _isTipPopoverVisible])
    {
      [(PUOneUpViewController *)self _setHasShownRelevantTip:1];
      [(PUOneUpViewController *)self _invalidateTipPopovers];
      [(PUOneUpViewController *)self _updateTipPopoversIfNeeded];
    }
    id v9 = objc_msgSend(v4, "is_scrollViewDelegate");
    [v9 scrollViewWillBeginDragging:v4];
  }
}

uint64_t __53__PUOneUpViewController_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsScrolling:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v11 = a3;
  id v4 = [(PUOneUpViewController *)self _tilingView];

  id v5 = v11;
  if (v4 == v11)
  {
    if (UIAccessibilityIsVoiceOverRunning())
    {
      id v6 = [(PUOneUpViewController *)self browsingSession];
      id v7 = [v6 viewModel];
      char v8 = [v7 isScrolling];
    }
    else
    {
      char v8 = 0;
    }
    if ([v11 isDragging] & 1) != 0 || (v8)
    {
      if (![(PUOneUpViewController *)self _isDrivingScrubbing])
      {
LABEL_13:
        id v10 = objc_msgSend(v11, "is_scrollViewDelegate");
        [v10 scrollViewDidScroll:v11];

        id v5 = v11;
        goto LABEL_14;
      }
    }
    else
    {
      char v9 = [v11 isDecelerating];
      if (![(PUOneUpViewController *)self _isDrivingScrubbing]
        || (v9 & 1) == 0 && !objc_msgSend(v11, "pu_isPerformingScrollTest"))
      {
        goto LABEL_13;
      }
    }
    [(PUOneUpViewController *)self _updateViewModelWithCurrentScrollPosition];
    goto LABEL_13;
  }
LABEL_14:
}

- (CGPoint)tilingView:(id)a3 initialVisibleOriginWithLayout:(id)a4
{
  id v6 = a4;
  id v7 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v8 = [v7 viewModel];
  char v9 = [(id)v8 assetsDataSource];

  id v10 = [v6 dataSource];
  LOBYTE(v8) = [v10 isEqual:v9];

  if ((v8 & 1) == 0)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4403, @"Invalid parameter not satisfying: %@", @"[[layout dataSource] isEqual:assetsDataSource]" object file lineNumber description];
  }
  id v11 = [(PUOneUpViewController *)self browsingSession];
  id v12 = [v11 viewModel];
  id v13 = [v12 currentAssetReference];

  int v14 = [v9 indexPathForAssetReference:v13];
  if (v14 || ([v9 firstItemIndexPath], (int v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v6 visibleRectForScrollingToItemAtIndexPath:v14 scrollPosition:0];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  }

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (id)tilingView:(id)a3 scrollInfoWithLayout:(id)a4
{
  id v5 = a4;
  id v6 = [(PUOneUpViewController *)self browsingSession];
  id v7 = [v6 viewModel];
  uint64_t v8 = [v7 assetsDataSource];
  char v9 = [v8 isEmpty];

  if (v9) {
    +[PUTilingScrollInfo scrollInfoWithScrollDirections:0];
  }
  else {
  id v10 = [v5 preferredScrollInfo];
  }

  return v10;
}

- (void)presentPeopleViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self navigationController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)pushPeopleViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:1];

  id v6 = [(PUOneUpViewController *)self navigationController];
  [v6 pushViewController:v4 animated:1];
}

- (BOOL)tilingViewCanBypass20069585Check:(id)a3
{
  id v3 = [(PUOneUpViewController *)self _currentAssetViewModel];
  char v4 = [v3 isInEditMode];

  return v4;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForLayoutInvalidationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUOneUpViewController *)self _shouldDisableTransitionsUntilAppeared])
  {
    uint64_t v8 = 0;
  }
  else
  {
    char v9 = [(PUOneUpViewController *)self browsingSession];
    id v10 = [v9 viewModel];

    id v11 = [v6 layout];
    uint64_t v8 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForLayoutInvalidationContext:v7 layout:v11 tilingView:v6 viewModel:v10];
  }
  return v8;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForReattachedTileControllers:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if ([v7 isTransitioningOverOneUp])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForReattachedTileControllers:v6 context:v7];
  }

  return v8;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  if (a6 <= 0.0)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", 0, a3, a6, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  }
  return v6;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  return +[PUOneUpAssetsDataSourceConverter defaultConverter];
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = [(PUOneUpViewController *)self browsingSession];
  double v15 = [v14 viewModel];
  double v16 = [v15 currentAssetReference];

  double v17 = +[PUTileTransitionCoordinator browsingTileTransitionCoordinatorForTransitionFromLayout:v12 toLayout:v11 withTilingView:v13 anchorAssetReference:v16 context:v10];

  return v17;
}

- (void)presentErrorFromLoadingIndicator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PUOneUpViewController *)self browsingSession];
    id v6 = [v5 viewModel];

    id v7 = [v6 assetViewModelForCurrentAssetReference];
    uint64_t v8 = [v7 asset];
    char v9 = [[PUOneUpLoadingErrorPresentationController alloc] initWithError:v4 forAsset:v8];
    [(PUErrorPresentationController *)v9 setRadarComponentID:@"512768" name:@"Photos Backend (New Bugs)" version:@"all"];
    id v10 = [(PUErrorPresentationController *)v9 alertControllerWithCompletion:0];
    [(PUOneUpViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v6 = PLOneUpGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Attempted to present an error from the loading indicator, but the error was nil. Skipping.", v11, 2u);
    }
  }
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(PUOneUpViewController *)self browsingSession];
  double v15 = [v14 viewModel];

  double v16 = [v15 assetsDataSource];
  if (([v13 isEqual:v16] & 1) == 0)
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4087, @"Invalid parameter not satisfying: %@", @"[dataSource isEqual:assetsDataSource]" object file lineNumber description];
  }
  BOOL v113 = v11;
  if ([v12 isEqualToString:@"PUTileKindItemContent"])
  {
    double v17 = self;
    double v18 = [(PUOneUpViewController *)self browsingSession];
    double v19 = [v18 contentTileProvider];

    v106 = v16;
    uint64_t v20 = [v16 assetReferenceAtIndexPath:v11];
    double v21 = v15;
    double v22 = (void *)v20;
    v108 = v21;
    double v23 = [v21 assetViewModelForAssetReference:v20];
    double v24 = [v22 asset];
    double v25 = [v19 tileControllerForAsset:v24 viewModel:v23 tilingView:v10];
    if ([v23 isUpdatingDisplayedContent])
    {
      objc_initWeak(location, v23);
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke;
      v128[3] = &unk_1E5F2D898;
      objc_copyWeak(&v129, location);
      [v25 notifyWhenReadyForDisplayWithTimeOut:v128 completionHandler:3.0];
      objc_destroyWeak(&v129);
      objc_destroyWeak(location);
    }

    double v16 = v106;
    double v15 = v108;
    self = v17;
    double v26 = v25;
LABEL_14:
    [(PUOneUpViewController *)self _configureAdoptedTileController:v26];
    if (v26) {
      goto LABEL_15;
    }
    goto LABEL_67;
  }
  if ([v12 isEqualToString:PUTileKindUserTransform])
  {
    id v27 = [v16 assetReferenceAtIndexPath:v11];
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUUserTransformTileReuseIdentifier"];
    [v15 assetViewModelForAssetReference:v27];
    double v29 = v28 = v16;
    [v26 setAssetViewModel:v29];
    [v26 setBrowsingViewModel:v15];
LABEL_12:

    double v16 = v28;
LABEL_13:

    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindPlayButton])
  {
    id v27 = [v16 assetReferenceAtIndexPath:v11];
    [v15 assetViewModelForAssetReference:v27];
    double v29 = v28 = v16;
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUPlayButtonViewReuseIdentifier"];
    [v26 setBrowsingViewModel:v15];
    double v30 = v26;
LABEL_11:
    [v30 setAssetViewModel:v29];
    goto LABEL_12;
  }
  if ([v12 isEqualToString:PUTileKindBackground])
  {
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUBackgroundTileReuseIdentifier"];
    [v26 setViewModel:v15];
    [(PUOneUpViewController *)self _setBackgroundTileViewController:v26];
    [(PUOneUpViewController *)self _updateBackgroundTileViewController];
    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindBadge])
  {
    id v27 = [v16 assetReferenceAtIndexPath:v11];
    [v15 assetViewModelForAssetReference:v27];
    double v29 = v28 = v16;
    double v30 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUBadgeTileReuseIdentifier"];
    double v26 = v30;
    goto LABEL_11;
  }
  if ([v12 isEqualToString:PUTileKindAssetExplorerReviewScreenBadge])
  {
    double v32 = [v16 assetReferenceAtIndexPath:v11];
    [(PUOneUpViewController *)self browsingSession];
    v34 = double v33 = v16;
    [v34 actionManager];
    double v35 = v109 = v10;

    double v36 = [v109 dequeueTileControllerWithReuseIdentifier:@"PUAssetExplorerReviewScreenBadgeTileReuseIdentifier"];
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_2;
    v123[3] = &unk_1E5F2D098;
    id v37 = v36;
    id v124 = v37;
    id v125 = v15;
    id v126 = v32;
    CGFloat v127 = v35;
    id v38 = v35;
    id v27 = v32;
    [v37 performChanges:v123];
    uint64_t v39 = v15;
    v40 = v127;
    id v41 = v37;

    double v15 = v39;
    double v26 = v41;
    double v16 = v33;

    double v42 = v124;
LABEL_26:

    id v10 = v109;
    goto LABEL_13;
  }
  if ([v12 isEqualToString:PUTileKindSelectionIndicator])
  {
    double v43 = [v16 assetReferenceAtIndexPath:v11];
    [(PUOneUpViewController *)self browsingSession];
    uint64_t v45 = v44 = v16;
    [v45 actionManager];
    double v46 = v109 = v10;

    id v47 = [v109 dequeueTileControllerWithReuseIdentifier:@"PUSelectionIndicatorTileReuseIdentifier"];
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_3;
    v118[3] = &unk_1E5F2D098;
    id v48 = v47;
    id v119 = v48;
    id v120 = v15;
    id v121 = v43;
    id v122 = v46;
    id v38 = v46;
    id v27 = v43;
    [v48 performChanges:v118];
    double v49 = v15;
    uint64_t v50 = v122;
    id v51 = v48;

    double v15 = v49;
    double v26 = v51;
    double v16 = v44;

    double v42 = v119;
    goto LABEL_26;
  }
  if ([v12 isEqualToString:PUTileKindAssetExplorerReviewScreenProgressIndicator])
  {
    v110 = [v16 assetAtIndexPath:v11];
    [v15 assetSharedViewModelForAsset:v110];
    v53 = double v52 = v16;
    [v52 assetReferenceAtIndexPath:v11];
    v55 = double v54 = v10;
    [v15 assetViewModelForAssetReference:v55];
    id v102 = v13;
    v57 = double v56 = v15;
    CGFloat v58 = [v57 videoPlayer];
    double v26 = [v54 dequeueTileControllerWithReuseIdentifier:@"PUAssetExplorerReviewScreenProgressIndicatorTileReuseIdentifier"];
    [v26 setAssetSharedViewModel:v53];
    [v26 setVideoPlayer:v58];

    double v15 = v56;
    id v13 = v102;

    id v10 = v54;
    double v16 = v52;

    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindReviewScreenTopBar])
  {
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUReviewScreenTopBarTileReuseIdentifier"];
    [(PUOneUpViewController *)self _setReviewScreenTopBarTileViewController:v26];
LABEL_35:
    [v26 setBrowsingViewModel:v15];
    [(PUOneUpViewController *)self _updateReviewScreenBars];
    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindReviewScreenControlBar])
  {
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUReviewScreenControlBarTileReuseIdentifier"];
    [(PUOneUpViewController *)self _setReviewScreenControlBarTileViewController:v26];
    goto LABEL_35;
  }
  if ([v12 isEqualToString:PUTileKindReviewScreenScrubberBar])
  {
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUReviewScreenScrubberBarTileReuseIdentifier"];
    [(PUOneUpViewController *)self _setReviewScreenScrubberBarTileViewController:v26];
    goto LABEL_35;
  }
  if ([v12 isEqualToString:PUTileKindProgressIndicator])
  {
    v104 = [v16 assetAtIndexPath:v11];
    uint64_t v60 = objc_msgSend(v15, "assetSharedViewModelForAsset:");
    id v61 = v11;
    double v62 = (void *)v60;
    BOOL v107 = v16;
    [v16 assetReferenceAtIndexPath:v61];
    v64 = char v63 = v15;
    id v65 = [v63 assetViewModelForAssetReference:v64];
    double v66 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUProgressIndicatorTileReuseIdentifier"];
    [v66 setAssetViewModel:v65];
    v111 = v63;
    [v66 setBrowsingViewModel:v63];
    [v66 setAssetSharedViewModel:v62];
    objc_initWeak(location, self);
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_4;
    v116[3] = &unk_1E5F28050;
    objc_copyWeak(&v117, location);
    double v26 = v66;
    [v66 setErrorPresenter:v116];
    objc_destroyWeak(&v117);
    objc_destroyWeak(location);

LABEL_38:
    double v16 = v107;
    double v15 = v111;
    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindPeople])
  {
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUPeopleTileReuseIdentifier"];
    id v27 = [v16 assetAtIndexPath:v11];
    [v26 setDisplayAsset:v27];
    [v26 setPeopleDelegate:self];
    goto LABEL_13;
  }
  id v105 = v12;
  if ([v12 isEqualToString:PUTileKindRenderIndicator])
  {
    id v67 = [v16 assetAtIndexPath:v11];
    [v15 assetSharedViewModelForAsset:v67];
    id v69 = v68 = v16;
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PURenderIndicatorTileReuseIdentifier"];
    [v26 setAssetSharedViewModel:v69];
    [(PUOneUpViewController *)self undoManager];
    v71 = id v70 = v10;
    [v26 setUndoManager:v71];

    id v10 = v70;
    double v16 = v68;

    id v12 = v105;
    goto LABEL_14;
  }
  BOOL v107 = v16;
  v111 = v15;
  double v101 = self;
  id v103 = v13;
  if ([v12 isEqualToString:PUTileKindImportStatusIndicator])
  {
    double v72 = v16;
    double v73 = [v16 assetReferenceAtIndexPath:v11];
    CGFloat v74 = [v15 assetViewModelForAssetReference:v73];
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUImportStatusIndicatorTileReuseIdentifier"];
    [v26 setAssetViewModel:v74];
LABEL_45:

    double v16 = v72;
    id v13 = v103;
    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindBufferingIndicator])
  {
    double v75 = [v16 assetReferenceAtIndexPath:v11];
    CGFloat v76 = [v15 assetViewModelForAssetReference:v75];
    v77 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUBufferingIndicatorTileReuseIdentifier"];
    [v77 setAssetViewModel:v76];
    v78 = [(PUOneUpViewController *)v101 browsingSession];
    double v79 = [v78 mergedVideoProvider];
    [v77 setMergedVideoProvider:v79];

    [v77 setBrowsingViewModel:v111];
    objc_initWeak(location, v101);
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_5;
    v114[3] = &unk_1E5F28078;
    objc_copyWeak(&v115, location);
    double v26 = v77;
    [v77 setErrorAlertControllerDisplayer:v114];
    objc_destroyWeak(&v115);
    objc_destroyWeak(location);

LABEL_48:
    id v13 = v103;
    self = v101;
    goto LABEL_38;
  }
  if ([v12 isEqualToString:PUTileKindLoadingIndicator])
  {
    double v80 = [v16 assetReferenceAtIndexPath:v11];
    CGFloat v81 = [v15 assetViewModelForAssetReference:v80];
    id v82 = v10;
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PULoadingIndicatorTileReuseIdentifier"];
    CGFloat v83 = [(PUOneUpViewController *)self loadingIndicatorController];
    objc_msgSend(v26, "setStyle:", objc_msgSend(v83, "loadingIndicatorStyleForAssetViewModel:", v81));

    id v10 = v82;
    double v15 = v111;

    double v16 = v107;
LABEL_51:

    goto LABEL_14;
  }
  if ([v12 isEqualToString:PUTileKindAccessory])
  {
    double v72 = v16;
    double v73 = [v16 assetReferenceAtIndexPath:v11];
    CGFloat v74 = [v15 assetViewModelForAssetReference:v73];
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUAccessoryTileReuseIdentifier"];
    [v26 setAssetViewModel:v74];
    [v26 setAssetReference:v73];
    goto LABEL_45;
  }
  if ([v12 isEqualToString:PUTileKindVideoPlaceholder])
  {
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUVideoPlaceholderTileReuseIdentifier"];
    goto LABEL_48;
  }
  if ([v12 isEqualToString:PUTileKindLivePhotoVideoPlaybackOverlay])
  {
    CGFloat v84 = [v10 dequeueTileControllerWithReuseIdentifier:@"PULivePhotoVideoPlaybackTileReuseIdentifier"];
    [v84 setBrowsingViewModel:v15];
    v85 = [(PUOneUpViewController *)v101 browsingSession];
    BOOL v86 = [v85 mergedVideoProvider];
    [v84 setMergedVideoProvider:v86];

    objc_msgSend(v84, "setIsPresentedForSecondScreen:", -[PUOneUpViewController _isPresentedForSecondScreen](v101, "_isPresentedForSecondScreen"));
    double v26 = v84;
    [v84 setDelegate:v101];
    long long v87 = [(PUOneUpViewController *)v101 _tilingView];
    v88 = [v87 window];

    if (!v88)
    {
      v89 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v90 = [v89 windows];
      v88 = [v90 firstObject];
    }
    double v91 = objc_msgSend(v88, "px_imageModulationManager");
    [v84 setImageModulationManager:v91];

    goto LABEL_48;
  }
  if ([v12 isEqualToString:PUTileKindSyndicationAttribution])
  {
    double v92 = [v16 assetReferenceAtIndexPath:v11];
    double v93 = [v15 assetViewModelForAssetReference:v92];
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUSyndicationAttributionTileReuseIdentifier"];
    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_63:
        [v26 setAssetViewModel:v93];
        [v26 setDelegate:self];

        id v13 = v103;
        goto LABEL_38;
      }
      double v96 = [MEMORY[0x1E4F28B00] currentHandler];
      v99 = (objc_class *)objc_opt_class();
      double v98 = NSStringFromClass(v99);
      double v100 = objc_msgSend(v26, "px_descriptionForAssertionMessage");
      [v96 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4289, @"%@ should be an instance inheriting from %@, but it is %@", @"[tilingView dequeueTileControllerWithReuseIdentifier:PUSyndicationAttributionTileReuseIdentifier]", v98, v100 object file lineNumber description];
    }
    else
    {
      double v96 = [MEMORY[0x1E4F28B00] currentHandler];
      double v97 = (objc_class *)objc_opt_class();
      double v98 = NSStringFromClass(v97);
      [v96 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4289, @"%@ should be an instance inheriting from %@, but it is nil", @"[tilingView dequeueTileControllerWithReuseIdentifier:PUSyndicationAttributionTileReuseIdentifier]", v98 object file lineNumber description];
    }

    goto LABEL_63;
  }
  if ([v12 isEqualToString:PUTileKindCropButton])
  {
    double v80 = [v16 assetReferenceAtIndexPath:v11];
    double v94 = [v15 assetViewModelForAssetReference:v80];
    double v26 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUCropButtonTileReuseIdentifier"];
    [v26 setDelegate:self];
    [v26 setAssetViewModel:v94];
    [v26 setBrowsingViewModel:v15];

    double v16 = v107;
    goto LABEL_51;
  }
  [(PUOneUpViewController *)self _configureAdoptedTileController:0];
LABEL_67:
  double v95 = [MEMORY[0x1E4F28B00] currentHandler];
  [v95 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 4308, @"Invalid parameter not satisfying: %@", @"tileController != nil" object file lineNumber description];

  double v26 = 0;
LABEL_15:

  return v26;
}

void __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateDisplayedContent];
}

uint64_t __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setBrowsingViewModel:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAssetReference:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 setActionManager:v3];
}

uint64_t __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setBrowsingViewModel:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAssetReference:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setActionManager:v2];
}

void __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentErrorFromLoadingIndicator:v3];
}

void __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a2 message:a3 preferredStyle:1];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  id v5 = PULocalizedString(@"PUPHOTOBROWSER_FAILURE_OK_BUTTON");
  id v6 = [v4 actionWithTitle:v5 style:0 handler:0];
  [v8 addAction:v6];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentViewController:v8 animated:1 completion:0];
}

- (BOOL)_allowsVisualLookupInInfoPanelMode
{
  id v3 = +[PUOneUpSettings sharedInstance];
  int v4 = [v3 allowsVisualIntelligenceVisualLookupInfoPanelMode];

  if (!v4) {
    return 0;
  }
  id v5 = [(PUOneUpViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];
  id v7 = [(PUOneUpViewController *)self browsingSession];
  id v8 = [v7 viewModel];
  uint64_t v9 = [v8 horizontalSizeClass];

  if (v6) {
    BOOL v10 = v9 == 1;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10;

  return v11;
}

- (BOOL)_allowsShowingVisualIntelligenceForAsset:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PUOneUpViewController *)self presentationOrigin];
  uint64_t v6 = +[PUOneUpSettings sharedInstance];
  int v7 = [v6 allowsVisualIntelligenceInVideoFrame];

  int v8 = [MEMORY[0x1E4F908E8] canRequestVKImageAnalysisForAsset:v4];
  if ((v8 & 1) == 0 && v7) {
    int v8 = [v4 mediaType] == 2;
  }
  uint64_t v9 = +[PUOneUpSettings sharedInstance];
  if ([v9 allowVisualIntelligence])
  {
    unsigned int v10 = v8 & ~[(PUOneUpViewController *)self _isPresentedForSecondScreen];
    if (v5 == 13) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v10;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)passcodeAuthenticationReason
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 viewModel];
  id v4 = [v3 currentAssetReference];
  int64_t v5 = [v4 pxAssetReference];

  uint64_t v6 = [v5 assetCollection];
  objc_msgSend(v6, "px_isHiddenSmartAlbum");
  objc_msgSend(v6, "px_isRecentlyDeletedSmartAlbum");
  objc_msgSend(v6, "px_isRecoveredSmartAlbum");
  int v7 = PXLocalizedString();

  return (NSString *)v7;
}

- (NSString)authenticationTitle
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 viewModel];
  id v4 = [v3 currentAssetReference];
  int64_t v5 = [v4 pxAssetReference];

  uint64_t v6 = [v5 assetCollection];
  objc_msgSend(v6, "px_isHiddenSmartAlbum");
  objc_msgSend(v6, "px_isRecentlyDeletedSmartAlbum");
  objc_msgSend(v6, "px_isRecoveredSmartAlbum");
  int v7 = PXLocalizedString();

  return (NSString *)v7;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(PUOneUpViewController *)self _invalidateInfoPanelLayoutAnimated:1];
}

- (void)_handleDeferredProcessingFinishedForAssetUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(PUOneUpViewController *)self ppt_deferredProcessingCompletionBlock];
  if (v5)
  {
    uint64_t v6 = [(PUOneUpViewController *)self ppt_assetUUIDNeedsDeferredProcessingFinishNotification];
    int v7 = [v4 isEqualToString:v6];

    if (v7)
    {
      [(PUOneUpViewController *)self setPpt_deferredProcessingCompletionBlock:0];
      int v8 = [(PUOneUpViewController *)self ppt_deferredProcessingWaitTimer];
      [v8 invalidate];

      [(PUOneUpViewController *)self setPpt_deferredProcessingWaitTimer:0];
      [(PUOneUpViewController *)self setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:0];
      uint64_t v9 = PLOneUpGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "Deferred Processing: Notify DP is done and final image is loaded/displayed (asset: %@).", buf, 0xCu);
      }

      id v10 = v5;
      px_dispatch_on_main_queue();
    }
  }
}

uint64_t __71__PUOneUpViewController__handleDeferredProcessingFinishedForAssetUUID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_assetsToPrefetchUsingDataSource:(id)a3 startingAt:(id)a4 count:(int64_t)a5 reverseDirection:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__50152;
  double v23 = __Block_byref_object_dispose__50153;
  id v24 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PUOneUpViewController__assetsToPrefetchUsingDataSource_startingAt_count_reverseDirection___block_invoke;
  v14[3] = &unk_1E5F28028;
  id v11 = v9;
  id v15 = v11;
  double v16 = &v19;
  double v17 = v25;
  int64_t v18 = a5;
  [v11 enumerateIndexPathsStartingAtIndexPath:v10 reverseDirection:v6 usingBlock:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v25, 8);

  return v12;
}

void __92__PUOneUpViewController__assetsToPrefetchUsingDataSource_startingAt_count_reverseDirection___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) assetAtIndexPath:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 <= (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

- (id)_assetsToPrefetch
{
  objc_super v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  uint64_t v5 = [v4 assetsDataSource];
  id v6 = [v4 currentAssetReference];
  int v7 = [v5 indexPathForAssetReference:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v7)
  {
    id v9 = [(PUOneUpViewController *)self _assetsToPrefetchUsingDataSource:v5 startingAt:v7 count:3 reverseDirection:1];
    id v10 = [(PUOneUpViewController *)self _assetsToPrefetchUsingDataSource:v5 startingAt:v7 count:3 reverseDirection:0];
    [v8 addObjectsFromArray:v9];
    [v8 addObjectsFromArray:v10];
  }
  return v8;
}

- (void)_preheatAdjacentAssetsForPhotosDetailsContext
{
  objc_initWeak(&location, self);
  preheatAssetsQueue = self->_preheatAssetsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke;
  v4[3] = &unk_1E5F2E530;
  objc_copyWeak(&v5, &location);
  dispatch_async(preheatAssetsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__50152;
  uint64_t v13 = __Block_byref_object_dispose__50153;
  id v14 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke_2;
  id v6 = &unk_1E5F28000;
  int v7 = &v9;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_sync(MEMORY[0x1E4F14428], &v3);
  v1 = (void *)MEMORY[0x1E4F90518];
  uint64_t v2 = objc_msgSend((id)v10[5], "allObjects", v3, v4, v5, v6, v7);
  [v1 photosDetailsContextPreheatForAssets:v2];

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v9, 8);
}

void __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _assetsToPrefetch];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 currentAssetDidChange])
  {
    [(PUOneUpViewController *)self _invalidateAssetActionManager];
    [(PUOneUpViewController *)self _invalidateBarsControllers];
    [(PUOneUpViewController *)self _invalidateChromeViewController];
  }
  if ([v7 isPresentedForPreviewDidChange]) {
    [(PUOneUpViewController *)self _isPresentedForPreviewDidChange];
  }
  if ([v7 imageAnalysisInteractionDidChange])
  {
    [(PUOneUpViewController *)self _invalidateImageAnalysisInteractionAdditionalActionInfoEdgeInsets];
    [(PUOneUpViewController *)self _updateImageAnalysisInteractionDelegate];
  }
  id v8 = [(PUOneUpViewController *)self _tilingView];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 layout];
    id v11 = (id)objc_opt_class();
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    id v12 = v11;

    uint64_t v13 = [(PUOneUpViewController *)self browsingSession];
    id v14 = [v13 viewModel];
    double v49 = [v14 assetsDataSource];

    uint64_t v15 = [v6 currentAssetReference];
    id v47 = (void *)v15;
    if (([v7 assetsDataSourceDidChange] & 1) != 0
      || ([v12 dataSource],
          double v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 isEqual:v49],
          v16,
          (v17 & 1) == 0))
    {
      id v19 = [(PUOneUpViewController *)self _newOneUpLayout];

      uint64_t v20 = [v6 assetViewModelForAssetReference:v15];
      if ([v20 isUpdatingDisplayedContent])
      {
        uint64_t v21 = objc_alloc_init(PUTilingLayoutTransitionContext);
        [(PUTilingLayoutTransitionContext *)v21 setIsUpdatingDisplayedContent:1];
        double v22 = [v20 displayedContentUpdateGroup];
        [(PUTilingLayoutTransitionContext *)v21 setDisplayedContentUpdateGroup:v22];
      }
      else
      {
        uint64_t v21 = 0;
      }
      [v9 transitionToLayout:v19 withContext:v21 animationSetupCompletionHandler:0];
      int64_t v18 = v9;
      [v9 layoutIfNeeded];
      [(PUOneUpViewController *)self _preheatAdjacentAssetsForPhotosDetailsContext];
    }
    else
    {
      int64_t v18 = v9;
      id v19 = v12;
    }
    double v23 = [v7 assetViewModelChangesByAssetReference];
    uint64_t v80 = 0;
    CGFloat v81 = &v80;
    uint64_t v82 = 0x2020000000;
    char v83 = 0;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x2020000000;
    char v79 = 0;
    uint64_t v72 = 0;
    double v73 = &v72;
    uint64_t v74 = 0x2020000000;
    char v75 = 0;
    uint64_t v68 = 0;
    id v69 = &v68;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    char v24 = [v6 accessoryViewsDefaultVisibility];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke;
    v57[3] = &unk_1E5F27FD8;
    id v25 = v6;
    id v58 = v25;
    char v67 = v24;
    id v26 = v19;
    id v59 = v26;
    char v63 = &v68;
    id v27 = v18;
    id v60 = v27;
    id v46 = v47;
    id v61 = v46;
    double v62 = self;
    double v64 = &v76;
    id v65 = &v72;
    double v66 = &v80;
    [v23 enumerateKeysAndObjectsUsingBlock:v57];
    v44 = v23;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_3;
    aBlock[3] = &unk_1E5F2ECC8;
    id v28 = v25;
    id v55 = v28;
    double v56 = self;
    id v48 = (void (**)(void))_Block_copy(aBlock);
    if (*((unsigned char *)v77 + 24))
    {
      uint64_t v9 = v18;
      double v29 = v26;
      -[PUOneUpViewController setWasChromeVisibleBeforeZoomIn:](self, "setWasChromeVisibleBeforeZoomIn:", objc_msgSend(v28, "isChromeVisible", v44));
LABEL_21:
      v48[2]();
      goto LABEL_24;
    }
    uint64_t v9 = v18;
    double v29 = v26;
    if (*((unsigned char *)v73 + 24))
    {
      [(PUOneUpViewController *)self _handleZoomOutCurrentAsset];
    }
    else if (*((unsigned char *)v81 + 24))
    {
      goto LABEL_21;
    }
LABEL_24:
    if (*((unsigned char *)v69 + 24)) {
      [(PUOneUpViewController *)self _invalidateTipPopovers];
    }
    if ([(PUOneUpViewController *)self _isDrivingScrubbing]) {
      goto LABEL_39;
    }
    if ([v7 currentAssetDidChange])
    {
      if (!v29)
      {
LABEL_39:
        if ([v7 chromeVisibilityDidChange])
        {
          [(PUOneUpViewController *)self _invalidateSpec];
          [(PUOneUpViewController *)self _updatePrefersHomeIndicatorHidden];
          [(PUOneUpViewController *)self _invalidateTipPopovers];
          [(PUOneUpViewController *)self _updateGestureController];
        }
        if ([v7 isInteractingWithVideoScrubberDidChange]) {
          [(PUOneUpViewController *)self _invalidateLayout];
        }
        if ([v7 secondScreenSizeDidChange]
          && ![(PUOneUpViewController *)self _isPresentedForSecondScreen])
        {
          [(PUOneUpViewController *)self _invalidateSpec];
        }
        if ([v7 currentAssetDidChange])
        {
          [(PUOneUpViewController *)self _invalidateEditMode];
          [(PUOneUpViewController *)self _invalidatePreferredContentSize];
          [(PUOneUpViewController *)self _invalidateVideoPlayer];
          [(PUOneUpViewController *)self _invalidateUserActivity];
          [(PUOneUpViewController *)self _invalidateCachedBoopableItemProvider];
          if ([(PUOneUpViewController *)self isFloatingInfoPanelPresented])
          {
            if ([v7 currentAssetTransitionProgressDidChange])
            {
              [(PUOneUpViewController *)self _dimFloatingInfoPanelAnimated:1];
              objc_initWeak(&location, self);
              double v42 = [MEMORY[0x1E4F912C0] sharedScheduler];
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_5;
              v51[3] = &unk_1E5F2E530;
              objc_copyWeak(&v52, &location);
              [v42 dispatchOnMainThreadWhenNotScrolling:v51];

              objc_destroyWeak(&v52);
              objc_destroyWeak(&location);
            }
            else if (![(PUOneUpViewController *)self _isDrivingScrubbing])
            {
              [(PUOneUpViewController *)self _updateFloatingInfoPanelIfNeeded];
            }
          }
          [(PUOneUpViewController *)self _setDidPlayCurrentLivePhoto:0];
          if ([v28 browsingSpeedRegime] <= 0) {
            [(PUOneUpViewController *)self _preheatAdjacentAssetsForPhotosDetailsContext];
          }
        }
        if ([v7 presentingOverOneUpDidChange]) {
          [(PUOneUpViewController *)self _invalidateVideoPlayer];
        }
        if ([v7 browsingSpeedRegimeDidChange]) {
          [(PUOneUpViewController *)self _invalidatePreloadInsets];
        }
        if (([v7 currentAssetDidChange] & 1) != 0
          || [v7 currentAssetTransitionProgressDidChange])
        {
          [(PUOneUpViewController *)self px_setNeedsHDRFocusUpdate];
        }
        if ([v7 reviewScreenBarsModelDidChange]) {
          [(PUOneUpViewController *)self _updateReviewScreenBars];
        }
        if (([v7 videoOverlayPlayStateDidChange] & 1) != 0
          || [v7 isScrubbingActivationDidChange])
        {
          [(PUOneUpViewController *)self _invalidateLayout];
        }
        if ([v7 isScrubbingDidChange])
        {
          double v43 = [(PUOneUpViewController *)self _currentAssetViewModel];
          if ([v43 isAccessoryViewVisible]
            && [(PUOneUpViewController *)self _prefersFloatingInfoPanel])
          {
            if ([v28 isScrubbing])
            {
              [(PUOneUpViewController *)self _dismissFloatingInfoPanelAnimated:1];
            }
            else
            {
              [(PUOneUpViewController *)self _presentFloatingInfoPanelAnimated:1];
              [(PUOneUpViewController *)self _invalidateInfoPanelLayoutAnimated:1];
            }
          }
          if ([(PUOneUpViewController *)self _isTipPopoverVisible]) {
            [(PUOneUpViewController *)self _setHasShownRelevantTip:1];
          }
          [(PUOneUpViewController *)self _invalidateUserActivity];
          [(PUOneUpViewController *)self _invalidateCachedBoopableItemProvider];
          [(PUOneUpViewController *)self _invalidateTipPopovers];
        }
        if ([v7 contentPrivacyStateDidChange])
        {
          [(PUOneUpViewController *)self _invalidateSpec];
          [(PUOneUpViewController *)self _invalidateBarsControllers];
          if ([v28 contentPrivacyState] == 1) {
            [(PUOneUpViewController *)self _dismissFloatingInfoPanelAnimated:0];
          }
        }
        if (([v7 systemAuthenticationTypeDidChange] & 1) != 0
          || [v7 wantsContentUnavailableUnlockButtonVisibleDidChange])
        {
          [(PUOneUpViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
        }
        if ([v7 isInSelectionModeDidChange]) {
          [(PUOneUpViewController *)self _invalidateLayout];
        }

        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&v72, 8);
        _Block_object_dispose(&v76, 8);
        _Block_object_dispose(&v80, 8);

        goto LABEL_86;
      }
    }
    else
    {
      char v30 = [v7 currentAssetTransitionProgressDidChange];
      if (v29) {
        char v31 = v30;
      }
      else {
        char v31 = 0;
      }
      if ((v31 & 1) == 0) {
        goto LABEL_39;
      }
    }
    uint64_t v50 = v28;
    double v32 = [v28 currentAssetReference];
    double v33 = [v49 indexPathForAssetReference:v32];
    if (v33)
    {
      [v50 currentAssetTransitionProgress];
      objc_msgSend(v29, "visibleRectForItemAtIndexPath:transitionProgress:", v33);
      double v35 = v34;
      double v37 = v36;
      id v38 = [v29 coordinateSystem];
      uint64_t v39 = [v27 contentCoordinateSystem];
      if (PUCanConvertFromCoordinateSystemToCoordinateSystem(v38, v39))
      {
        double v40 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v38, v39, v35, v37);
        objc_msgSend(v27, "setContentOffset:animated:", objc_msgSend(v50, "assetChangesShouldAnimate"), v40, v41);
        objc_msgSend(v27, "px_cancelScrollGesture");
      }

      double v29 = v26;
    }

    id v28 = v50;
    goto LABEL_39;
  }
LABEL_86:
  [(PUOneUpViewController *)self _updateIfNeeded];
}

void __45__PUOneUpViewController_viewModel_didChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v69 = [v6 countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v75;
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v66 = v71;
    id v67 = v6;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v75 != v68) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", v5, v66);
        if ([v10 focusValueChanged])
        {
          [v11 focusValue];
          if (fabs(v12) >= 1.0)
          {
            uint64_t v13 = [v11 modelTileTransform];
            if (v13 || *(unsigned __int8 *)(a1 + 104) != [v11 isAccessoryViewVisible])
            {

LABEL_15:
              v70[0] = MEMORY[0x1E4F143A8];
              v70[1] = 3221225472;
              v71[0] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_2;
              v71[1] = &unk_1E5F2E120;
              id v72 = v11;
              char v73 = *(unsigned char *)(a1 + 104);
              [v72 performChanges:v70];

              goto LABEL_16;
            }
            if (!*(unsigned char *)(a1 + 104))
            {
              [v11 contentOffset];
              if (v15 != v7 || v14 != v8) {
                goto LABEL_15;
              }
            }
          }
        }
LABEL_16:
        if ([v10 badgeInfoChanged])
        {
          double v16 = [v5 indexPath];
          [*(id *)(a1 + 40) invalidateBadgeSizeForItemAtIndexPath:v16];
        }
        if ([v10 modelTileTransformChanged])
        {
          char v17 = [v5 indexPath];
          [*(id *)(a1 + 40) invalidateModelTileTransformForItemAtIndexPath:v17];
          int64_t v18 = [v11 modelTileTransform];
          if ([v18 hasUserZoomedIn])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
            if ([v18 hasUserZoomedIn])
            {
              id v19 = +[PUOneUpSettings sharedInstance];
              int v20 = [v19 allowFullsizeJPEGDisplay];

              id v6 = v67;
              if (v20)
              {
                uint64_t v21 = *(void **)(a1 + 48);
                double v22 = [v5 dataSourceIdentifier];
                double v23 = [v21 presentedTileControllerWithIndexPath:v17 kind:@"PUTileKindItemContent" dataSourceIdentifier:v22];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v23 setShouldUseFullSizeImageData:1];
                }

                id v6 = v67;
              }
            }
          }
        }
        if ([v5 isEqual:*(void *)(a1 + 56)]
          && ([*(id *)(a1 + 32) isAnimatingPresentationSize] & 1) == 0
          && [*(id *)(a1 + 64) appearState] == 2)
        {
          if ([v10 isZoomedInChanged])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v11 isZoomedIn];
            *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v11 isZoomedIn] ^ 1;
          }
          if ([v11 isZoomedIn]
            && [v11 isUserTransformingTile])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
          }
        }
        if ([v10 contentOffsetChanged])
        {
          uint64_t v24 = [v11 lastContentOffsetChangeReason];
          BOOL v25 = ([v11 isLastAccessoryViewVisibilityChangeReasonUserAction] & 1) != 0
             || [v11 lastAccessoryViewVisibilityChangeReason] == 3;
          [v11 focusValue];
          if (fabs(v26) < 1.0 && (v24 == 3 || v24 == 1 && v25))
          {
            [v11 contentOffsetOverrideFactor];
            if (v27 < 1.0) {
              uint64_t v28 = 2;
            }
            else {
              uint64_t v28 = 0;
            }
          }
          else
          {
            uint64_t v28 = 0;
          }
          double v29 = [v5 indexPath];
          [*(id *)(a1 + 40) invalidateContentOffsetForItemAtIndexPath:v29 withOptions:v28];
        }
        if ([v10 accessoryViewVisibilityChanged])
        {
          char v30 = [v5 indexPath];
          char v31 = [v5 asset];
          BOOL v32 = +[PUCommentsViewController canShowCommentsForAsset:v31];

          if (v32)
          {
            double v33 = [MEMORY[0x1E4F90540] sharedInstance];
            int v34 = [v33 captionWidgetEnableDirectAttachToMaster];

            LODWORD(v33) = [v11 isAccessoryViewVisible];
            int v35 = [v11 isLastAccessoryViewVisibilityChangeReasonUserAction];
            uint64_t v36 = 5;
            if ((v33 & v34) != 0) {
              uint64_t v36 = 1;
            }
            if (v35) {
              uint64_t v37 = v36;
            }
            else {
              uint64_t v37 = 1;
            }
          }
          else
          {
            uint64_t v37 = 0;
          }
          [*(id *)(a1 + 40) invalidateAccessoryForItemAtIndexPath:v30 withOptions:v37];
          [*(id *)(a1 + 64) _invalidateAccessoryView];
          [*(id *)(a1 + 64) _invalidateTipPopovers];
        }
        if ([v10 isVisualSearchCardShowingChanged]
          && [*(id *)(a1 + 64) _prefersFloatingInfoPanel]
          && [v11 isAccessoryViewVisible])
        {
          int v38 = [v11 isVisualSearchCardShowing];
          uint64_t v39 = *(void **)(a1 + 64);
          if (v38) {
            [v39 _dismissFloatingInfoPanelAnimated:1];
          }
          else {
            [v39 _presentFloatingInfoPanelAnimated:1];
          }
        }
        if ([v10 visualImageAnalysisChanged]) {
          [*(id *)(a1 + 64) _invalidateTipPopovers];
        }
        double v40 = [v10 videoPlayerChange];
        int v41 = [v40 desiredPlayStateDidChange];

        if (v41)
        {
          double v42 = [v5 indexPath];
          [*(id *)(a1 + 40) invalidateVideoPlaceholderForItemAtIndexPath:v42];
        }
        double v43 = [v10 videoPlayerChange];
        if ([v43 playStateDidChange])
        {
        }
        else
        {
          v44 = [v10 videoPlayerChange];
          int v45 = [v44 isPlayableDidChange];

          if (!v45) {
            goto LABEL_73;
          }
        }
        id v46 = [v11 videoPlayer];
        if ([v46 playState] != 5) {
          goto LABEL_72;
        }
        id v47 = [v11 videoPlayer];
        if ([v47 isPlayable])
        {

LABEL_72:
          goto LABEL_73;
        }
        double v54 = [v11 videoPlayer];
        uint64_t v55 = [v54 desiredPlayState];

        if (v55 == 1) {
          [*(id *)(a1 + 64) _presentAlertForUnplayableAssetReference:v5];
        }
LABEL_73:
        id v48 = [v10 videoPlayerChange];
        int v49 = [v48 isActivatedDidChange];

        if (v49) {
          [*(id *)(a1 + 64) _invalidateBarsControllers];
        }
        if ([v10 isInEditModeChanged])
        {
          [*(id *)(a1 + 64) _invalidateBarsControllers];
          [*(id *)(a1 + 64) _invalidateEditMode];
        }
        if ([v10 saveStateChanged])
        {
          uint64_t v50 = [*(id *)(a1 + 32) currentAssetReference];
          if ([v5 isEqual:v50])
          {
            char v51 = [*(id *)(a1 + 64) _isPresentedForSecondScreen];

            if (v51) {
              goto LABEL_90;
            }
            uint64_t v50 = [*(id *)(a1 + 32) assetViewModelForAssetReference:v5];
            id v52 = [*(id *)(a1 + 64) _currentContentTileController];
            if (v52)
            {
              uint64_t v53 = [v50 saveState];
              [v52 setShouldPreserveCurrentContent:v53 == 1];
              if ((unint64_t)(v53 - 2) >= 3)
              {
                BOOL v56 = v53 == 1;
                id v6 = v67;
                if (v56) {
                  [v50 willUpdateDisplayedContent];
                }
              }
              else
              {
                [v50 didUpdateDisplayedContent];
                id v6 = v67;
              }
            }
          }
        }
LABEL_90:
        if ([v10 importStateChanged])
        {
          double v57 = *(void **)(a1 + 40);
          id v58 = [v5 indexPath];
          [v57 invalidateProgressIndicatorForItemAtIndexPath:v58];
        }
        id v59 = [*(id *)(a1 + 64) loadingIndicatorController];
        int v60 = [v59 shouldInvalidateLoadingIndicatorForAssetViewModelChange:v10];

        if (v60)
        {
          id v61 = *(void **)(a1 + 40);
          double v62 = [v5 indexPath];
          [v61 invalidateLoadingIndicatorForItemAtIndexPath:v62];
        }
        if (objc_msgSend(v10, "PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged"))
        {
          char v63 = *(void **)(a1 + 64);
          double v64 = [v5 asset];
          id v65 = [v64 uuid];
          [v63 _handleDeferredProcessingFinishedForAssetUUID:v65];
        }
      }
      uint64_t v69 = [v6 countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v69);
  }
}

void __45__PUOneUpViewController_viewModel_didChange___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isChromeVisible])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = +[PUOneUpSettings sharedInstance];
    BOOL v4 = PUShouldAutoHideChrome(v2, [v3 chromeAutoHideBehaviorOnZoom]);

    if (([*(id *)(a1 + 40) _options] & 0x4000) == 0)
    {
      char v5 = [*(id *)(a1 + 32) isInSelectionMode];
      if (v4 && (v5 & 1) == 0 && ![*(id *)(a1 + 32) videoOverlayPlayState])
      {
        id v6 = *(void **)(a1 + 32);
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_4;
        v7[3] = &unk_1E5F2ED10;
        id v8 = v6;
        [v8 performChanges:v7];
      }
    }
  }
}

void __45__PUOneUpViewController_viewModel_didChange___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFloatingInfoPanelIfNeeded];
}

uint64_t __45__PUOneUpViewController_viewModel_didChange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:0 changeReason:2];
}

uint64_t __45__PUOneUpViewController_viewModel_didChange___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAccessoryViewVisible:*(unsigned __int8 *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 resetContentOffset];
  }
  return result;
}

- (double)tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:(id)a3
{
  int v3 = objc_msgSend(MEMORY[0x1E4F90300], "isOneUpRefreshEnabled", a3);
  double result = 1.0;
  if (v3) {
    return 0.25;
  }
  return result;
}

- (void)tilingViewControllerTransition:(id)a3 adoptTilingView:(id)a4 fromEndPoint:(id)a5 isCancelingTransition:(BOOL)a6 animationSetupCompletionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  double v15 = [(PUOneUpViewController *)self _tilingView];

  if (v15)
  {
    double v29 = [MEMORY[0x1E4F28B00] currentHandler];
    char v30 = [(PUOneUpViewController *)self _tilingView];
    [v29 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 3532, @"adopting tiling %@ from %@ will override current tiling view %@", v12, v13, v30 object file lineNumber description];
  }
  [(PUOneUpViewController *)self _setTilingView:v12];
  tilingView = self->__tilingView;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke;
  v35[3] = &unk_1E5F27FB0;
  v35[4] = self;
  [(PUTilingView *)tilingView enumerateAllTileControllersUsingBlock:v35];
  char v17 = [v12 layout];
  char v31 = v13;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  id v19 = [(PUOneUpViewController *)self browsingSession];
  int v20 = [v19 viewModel];
  uint64_t v21 = [v20 assetsDataSource];
  double v22 = [v18 assetReference];
  double v23 = [v21 assetReferenceForAssetReference:v22];

  if (v23)
  {
    uint64_t v24 = [(PUOneUpViewController *)self browsingSession];
    BOOL v25 = [v24 viewModel];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke_2;
    v32[3] = &unk_1E5F2ECC8;
    id v33 = v25;
    id v34 = v23;
    id v26 = v25;
    [v26 performChanges:v32];
  }
  id v27 = [(PUOneUpViewController *)self _newOneUpLayout];
  uint64_t v28 = objc_alloc_init(PUTilingLayoutTransitionContext);
  [(PUTilingLayoutTransitionContext *)v28 setIsViewControllerTransition:1];
  [(PUTilingLayoutTransitionContext *)v28 setCancelingTransition:v8];
  [v12 transitionToLayout:v27 withContext:v28 animationSetupCompletionHandler:v14];

  [v12 layoutIfNeeded];
}

uint64_t __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureAdoptedTileController:a2];
}

uint64_t __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40) transitionProgress:@"OneUp Presentation" transitionDriverIdentifier:0 animated:0.0];
}

- (void)tilingViewControllerTransition:(id)a3 abandonTilingView:(id)a4 toEndPoint:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PUOneUpViewController *)self _tilingView];

  if (v10 != v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [(PUOneUpViewController *)self _tilingView];
    [v11 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 3522, @"tiling view %@ to abandon to %@ isn't the current tiling view %@", v8, v9, v12 object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __85__PUOneUpViewController_tilingViewControllerTransition_abandonTilingView_toEndPoint___block_invoke;
  v13[3] = &unk_1E5F27FB0;
  void v13[4] = self;
  [v8 enumerateAllTileControllersUsingBlock:v13];
  [(PUOneUpViewController *)self _setTilingView:0];
}

uint64_t __85__PUOneUpViewController_tilingViewControllerTransition_abandonTilingView_toEndPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _abandonTileController:a2];
}

- (id)tilingViewControllerTransition:(id)a3 tilingViewToTransferToEndPoint:(id)a4
{
  id v6 = a4;
  double v7 = [(PUOneUpViewController *)self _tilingView];
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 3517, @"no tiling view to transfer to %@", v6 object file lineNumber description];
  }
  return v7;
}

- (void)_editCrop:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:25];
}

- (void)_editCleanup:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:23];
}

- (void)_editStyles:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:24];
}

- (void)_editFilter:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:22];
}

- (void)_editAdjust:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:16];
}

- (void)_arrowKey:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(PUOneUpViewController *)self viewIfLoaded];
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 effectiveUserInterfaceLayoutDirection];
    double v7 = [v12 input];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4FB2B90]];

    if (v8)
    {
      id v9 = [(PUOneUpViewController *)self actionsController];
      if (v6 == 1)
      {
LABEL_4:
        [v9 jumpToPreviousAsset];
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      id v10 = [v12 input];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4FB2B78]];

      if (!v11) {
        goto LABEL_9;
      }
      id v9 = [(PUOneUpViewController *)self actionsController];
      if (v6 != 1) {
        goto LABEL_4;
      }
    }
    [v9 jumpToNextAsset];
    goto LABEL_8;
  }
LABEL_9:
}

- (id)keyCommands
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(PUOneUpViewController *)self _canAdvertiseKeyCommands])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B90] modifierFlags:0 action:sel__arrowKey_];
    [v3 addObject:v4];

    char v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B78] modifierFlags:0 action:sel__arrowKey_];
    [v3 addObject:v5];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "setWantsPriorityOverSystemBehavior:", 1, (void)v30);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v8);
    }

    int v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0x100000 action:sel_toggleViewer_];
    [v6 addObject:v11];

    id v12 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"[" modifierFlags:0x100000 action:sel_toggleViewer_];
    [v6 addObject:v12];

    id v13 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_toggleViewer_];
    [v6 addObject:v13];

    id v14 = [(PUOneUpViewController *)self _currentAssetViewModel];
    double v15 = [v14 asset];

    id v16 = v15;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    char v18 = [v17 isSpatialMedia];
    if ((v18 & 1) == 0)
    {
      id v19 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"a" modifierFlags:0 action:sel__editAdjust_];
      [v6 addObject:v19];

      id v20 = v16;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      double v22 = [v21 fetchSmartStyleExtendedProperties];

      int v23 = [v22 originallySmartStyleable];
      if (v23) {
        uint64_t v24 = @"s";
      }
      else {
        uint64_t v24 = @"f";
      }
      BOOL v25 = &selRef__editStyles_;
      if (!v23) {
        BOOL v25 = &selRef__editFilter_;
      }
      id v26 = objc_msgSend(MEMORY[0x1E4FB18D0], "keyCommandWithInput:modifierFlags:action:", v24, 0, *v25, (void)v30);
      [v6 addObject:v26];

      id v27 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"r" modifierFlags:0 action:sel__editCleanup_];
      [v6 addObject:v27];

      uint64_t v28 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"c" modifierFlags:0 action:sel__editCrop_];
      [v6 addObject:v28];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)_canAdvertiseKeyCommands
{
  id v3 = [(PUOneUpViewController *)self browsingSession];
  BOOL v4 = [v3 viewModel];
  char v5 = [v4 isPresentingOverOneUp];

  id v6 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v7 = [v6 viewModel];
  uint64_t v8 = [v7 assetViewModelForCurrentAssetReference];
  char v9 = [v8 isInEditMode];

  return (v5 | v9) ^ 1;
}

- (void)copy:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:30];
}

- (void)printAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:31];
}

- (void)addAssetsToLastUsedAlbum:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:61];
}

- (void)addAssetsToAlbum:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:60];
}

- (void)duplicateAssets:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PUOneUpViewController *)self browsingSession];
  char v5 = [v4 viewModel];
  id v6 = [v5 currentAssetReference];

  if (v6
    && ([v6 assetCollection], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v8 = (void *)v7,
        [v6 asset],
        char v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    id v10 = [v6 assetCollection];
    id v17 = v10;
    int v11 = [v6 asset];
    id v16 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    v18[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

    id v14 = [(PUOneUpViewController *)self actionsController];
    [v14 performDuplicateActionWithAssetsByAssetCollection:v13];
  }
  else
  {
    id v13 = PLOneUpGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_FAULT, "Attempted to duplicate assets but there is no current asset reference", v15, 2u);
    }
  }
}

- (void)favoriteAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performToggleFavoriteAction];
}

- (void)hideAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:37];
}

- (void)deleteAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:10];
}

- (void)restoreAssetsWithoutConfirmation:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:14];
}

- (void)restoreAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:13];
}

- (void)trashAssetsWithoutConfirmation:(id)a3
{
  BOOL v4 = [(PUOneUpViewController *)self actionsController];
  int v5 = [v4 canPerformSimpleActionWithActionType:9];

  id v6 = [(PUOneUpViewController *)self actionsController];
  id v9 = v6;
  if (v5)
  {
    uint64_t v7 = 9;
  }
  else
  {
    int v8 = [v6 canPerformSimpleActionWithActionType:56];

    id v6 = [(PUOneUpViewController *)self actionsController];
    id v9 = v6;
    if (v8) {
      uint64_t v7 = 56;
    }
    else {
      uint64_t v7 = 10;
    }
  }
  [v6 performSimpleActionWithActionType:v7];
}

- (void)trashAssets:(id)a3
{
  BOOL v4 = [(PUOneUpViewController *)self actionsController];
  int v5 = [v4 canPerformSimpleActionWithActionType:1];

  id v6 = [(PUOneUpViewController *)self actionsController];
  id v10 = v6;
  if (v5)
  {
    uint64_t v7 = 1;
  }
  else
  {
    int v8 = [v6 canPerformSimpleActionWithActionType:8];

    id v6 = [(PUOneUpViewController *)self actionsController];
    id v10 = v6;
    if (v8)
    {
      uint64_t v7 = 8;
    }
    else
    {
      int v9 = [v6 canPerformSimpleActionWithActionType:55];

      id v6 = [(PUOneUpViewController *)self actionsController];
      id v10 = v6;
      if (v9) {
        uint64_t v7 = 55;
      }
      else {
        uint64_t v7 = 10;
      }
    }
  }
  [v6 performSimpleActionWithActionType:v7];
}

- (void)shareAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:32];
}

- (void)revertAdjustments:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:21];
}

- (void)pasteAdjustments:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:20];
}

- (void)copyAdjustmentsSkippingOptions:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:19];
}

- (void)copyAdjustments:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:18];
}

- (void)autoEnhanceAssets:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:17];
}

- (void)rotateAssetsClockwise:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:27];
}

- (void)rotateAssetsCounterclockwise:(id)a3
{
  BOOL v4 = [(PUOneUpViewController *)self actionsController];
  int v5 = [v4 canPerformSimpleActionWithActionType:13];

  id v6 = [(PUOneUpViewController *)self actionsController];
  id v8 = v6;
  if (v5) {
    uint64_t v7 = 13;
  }
  else {
    uint64_t v7 = 26;
  }
  [v6 performSimpleActionWithActionType:v7];
}

- (void)toggleEditor:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 performSimpleActionWithActionType:15];
}

- (void)toggleViewer:(id)a3
{
}

- (void)togglePlayback:(id)a3
{
  id v3 = [(PUOneUpViewController *)self actionsController];
  [v3 togglePlayback];
}

- (void)validateCommand:(id)a3
{
  id v17 = a3;
  if ((char *)[v17 action] != sel_toggleViewer_
    || ([v17 title],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        !v6))
  {
    if ((char *)[v17 action] == sel_toggleInspector_)
    {
      [(PUOneUpViewController *)self _isAccessoryVisible];
      goto LABEL_14;
    }
    if ((char *)[v17 action] == sel_togglePlayback_)
    {
      int v9 = [(PUOneUpViewController *)self _currentAssetViewModel];
      id v10 = [v9 videoPlayer];
      [v10 isPlaybackDesired];
    }
    else if ((char *)[v17 action] == sel_hideAssets_)
    {
      int v9 = [(PUOneUpViewController *)self _currentAssetViewModel];
      id v10 = [v9 asset];
      [v10 isHidden];
    }
    else
    {
      if ((char *)[v17 action] == sel_addAssetsToLastUsedAlbum_)
      {
        int v11 = [(PUOneUpViewController *)self _currentAssetViewModel];
        id v12 = [v11 asset];

        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }

        int v9 = [v13 photoLibrary];

        id v10 = [MEMORY[0x1E4F8FF68] commandTitleWithPhotoLibrary:v9];
        [v17 setDiscoverabilityTitle:v10];
        goto LABEL_25;
      }
      if ((char *)[v17 action] != sel_favoriteAssets_)
      {
        if ((char *)[v17 action] == sel_rotateAssetsCounterclockwise_)
        {
          double v15 = [(PUOneUpViewController *)self actionsController];
          int v16 = [v15 canPerformSimpleActionWithActionType:13];

          if (!v16)
          {
            uint64_t v7 = @"MENU_ITEM_TITLE_ROTATE_COUNTERCLOCKWISE";
            goto LABEL_12;
          }
        }
        else
        {
          if ((char *)[v17 action] != sel_trashAssetsWithoutConfirmation_) {
            goto LABEL_27;
          }
          BOOL v4 = [(PUOneUpViewController *)self actionsController];
          [v4 canPerformSimpleActionWithActionType:8];
        }
LABEL_14:
        uint64_t v8 = PXLocalizedString();
        goto LABEL_15;
      }
      int v9 = [(PUOneUpViewController *)self _currentAssetViewModel];
      id v10 = [v9 asset];
      [v10 isFavorite];
    }
    id v14 = PXLocalizedString();
    [v17 setDiscoverabilityTitle:v14];

LABEL_25:
    goto LABEL_26;
  }
  uint64_t v7 = @"MENU_ITEM_TITLE_CLOSE_VIEWER";
LABEL_12:
  uint64_t v8 = PULocalizedString(v7);
LABEL_15:
  int v9 = (void *)v8;
  [v17 setDiscoverabilityTitle:v8];
LABEL_26:

LABEL_27:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__arrowKey_ == a3)
  {
    uint64_t v7 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v8 = [v7 viewModel];
    int v9 = [v8 assetViewModelForCurrentAssetReference];
    char v10 = [v9 isInEditMode];

    if (v10) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (sel_toggleInspector_ == a3)
  {
    if (![(PUOneUpViewController *)self _isAccessoryAvailableForCurrentAsset]) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (sel_togglePlayback_ == a3)
  {
    int v11 = [(PUOneUpViewController *)self _barsController];
    char v12 = [v11 allowShowingPlayPauseButton];
    goto LABEL_31;
  }
  if (sel_toggleEditor_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 15;
LABEL_30:
    char v12 = [v13 canPerformSimpleActionWithActionType:v14];
LABEL_31:
    char v15 = v12;

    if (v15) {
      goto LABEL_32;
    }
LABEL_34:
    BOOL v16 = 0;
    goto LABEL_35;
  }
  if (sel_toggleViewer_ == a3)
  {
    id v17 = [(PUOneUpViewController *)self presentedViewController];

    if (!v17) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (sel_rotateAssetsCounterclockwise_ == a3)
  {
    id v19 = [(PUOneUpViewController *)self actionsController];
    char v20 = [v19 canPerformSimpleActionWithActionType:13];

    if (v20) {
      goto LABEL_32;
    }
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 26;
    goto LABEL_30;
  }
  if (sel_rotateAssetsClockwise_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 27;
    goto LABEL_30;
  }
  if (sel_shareAssets_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 32;
    goto LABEL_30;
  }
  if (sel_trashAssets_ == a3)
  {
    id v21 = [(PUOneUpViewController *)self actionsController];
    char v22 = [v21 canPerformSimpleActionWithActionType:1];

    if (v22) {
      goto LABEL_32;
    }
    int v23 = [(PUOneUpViewController *)self actionsController];
    char v24 = [v23 canPerformSimpleActionWithActionType:10];

    if (v24) {
      goto LABEL_32;
    }
    BOOL v25 = [(PUOneUpViewController *)self actionsController];
    char v26 = [v25 canPerformSimpleActionWithActionType:8];

    if (v26) {
      goto LABEL_32;
    }
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 55;
    goto LABEL_30;
  }
  if (sel_trashAssetsWithoutConfirmation_ == a3)
  {
    id v27 = [(PUOneUpViewController *)self actionsController];
    char v28 = [v27 canPerformSimpleActionWithActionType:9];

    if (v28) {
      goto LABEL_32;
    }
    double v29 = [(PUOneUpViewController *)self actionsController];
    char v30 = [v29 canPerformSimpleActionWithActionType:10];

    if (v30) {
      goto LABEL_32;
    }
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 56;
    goto LABEL_30;
  }
  if (sel_hideAssets_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 37;
    goto LABEL_30;
  }
  if (sel_favoriteAssets_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 41;
    goto LABEL_30;
  }
  if (sel_duplicateAssets_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 38;
    goto LABEL_30;
  }
  if (sel_addAssetsToAlbum_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 60;
    goto LABEL_30;
  }
  if (sel_addAssetsToLastUsedAlbum_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 61;
    goto LABEL_30;
  }
  if (sel_printAssets_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 31;
    goto LABEL_30;
  }
  if (sel_copy_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 30;
    goto LABEL_30;
  }
  if (sel_copyAdjustments_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 18;
    goto LABEL_30;
  }
  if (sel_copyAdjustmentsSkippingOptions_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 19;
    goto LABEL_30;
  }
  if (sel_pasteAdjustments_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 20;
    goto LABEL_30;
  }
  if (sel_revertAdjustments_ == a3)
  {
    id v13 = [(PUOneUpViewController *)self actionsController];
    int v11 = v13;
    uint64_t v14 = 21;
    goto LABEL_30;
  }
  v31.receiver = self;
  v31.super_class = (Class)PUOneUpViewController;
  if (![(PUOneUpViewController *)&v31 canPerformAction:a3 withSender:v6]) {
    goto LABEL_34;
  }
LABEL_32:
  BOOL v16 = [(PUOneUpViewController *)self appearState] == 2;
LABEL_35:

  return v16;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)menuActionControllerPreventRevealInMomentAction:(id)a3
{
  return (LOBYTE(self->__options) >> 4) & 1;
}

- (void)createMenuActionControllerForManagerIfNeeded:(id)a3 withPresentingViewController:(id)a4 regionOfInterestProvider:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  menuActionController = self->_menuActionController;
  if (!menuActionController)
  {
    int v11 = objc_alloc_init(PUMenuActionController);
    char v12 = self->_menuActionController;
    self->_menuActionController = v11;

    [(PUMenuActionController *)self->_menuActionController setDelegate:self];
    menuActionController = self->_menuActionController;
  }
  id v13 = [(PUOneUpViewController *)self browsingSession];
  [(PUMenuActionController *)menuActionController setBrowsingSession:v13];

  [(PUMenuActionController *)self->_menuActionController setPresentingViewController:v8];
  [(PUMenuActionController *)self->_menuActionController setRegionOfInterestProvider:v9];
  [(PUMenuActionController *)self->_menuActionController setPhotosUICoreActionManager:v15];
  uint64_t v14 = [(PUMenuActionController *)self->_menuActionController actions];
  [(PUOneUpViewController *)self px_setPreviewActionMenus:v14];
}

- (void)setAppearanceTransitionAnimationsDisabled:(BOOL)a3
{
  if (self->_appearanceTransitionAnimationsDisabled != a3)
  {
    self->_appearanceTransitionAnimationsDisabled = a3;
    if (a3) {
      [(PUOneUpViewController *)self _setShouldDisableTransitionsUntilAppeared:1];
    }
  }
}

- (BOOL)oneUpActionsControllerIsDetailsAccessoryAvailable:(id)a3
{
  BOOL v4 = [(PUOneUpViewController *)self browsingSession];
  int v5 = [v4 viewModel];
  id v6 = [v5 currentAssetReference];

  if (v6) {
    BOOL v7 = [(PUOneUpViewController *)self _isDetailsAccessoryAvailableForAssetReference:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)oneUpActionsControllerPrefersInclusionAfterRemoval:(id)a3 forActionType:(unint64_t)a4
{
  if (a4 != 41) {
    return 0;
  }
  BOOL v4 = [(PUOneUpViewController *)self browsingSession];
  int v5 = [v4 viewModel];
  id v6 = [v5 currentAssetReference];

  BOOL v7 = [v6 pxAssetReference];
  id v8 = [v7 assetCollection];

  LOBYTE(v7) = objc_msgSend(v8, "px_isFavoritesSmartAlbum");
  return (char)v7;
}

- (double)oneUpActionsControllerBottomPaddingForPresentingToast:(id)a3
{
  return 180.0;
}

- (id)_userTransformTileControllerAtLocationFromProvider:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__50152;
  id v15 = __Block_byref_object_dispose__50153;
  id v16 = 0;
  int v5 = [(PUOneUpViewController *)self _tilingView];
  if (v5)
  {
    [v4 locationInView:v5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __76__PUOneUpViewController__userTransformTileControllerAtLocationFromProvider___block_invoke;
    v10[3] = &unk_1E5F27F88;
    void v10[4] = &v11;
    objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v10, v6 + -1.0, v7 + -1.0, 2.0, 2.0);
  }
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __76__PUOneUpViewController__userTransformTileControllerAtLocationFromProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)oneUpActionsController:(id)a3 zoomAtLocationProvider:(id)a4
{
  id v6 = a4;
  int v5 = -[PUOneUpViewController _userTransformTileControllerAtLocationFromProvider:](self, "_userTransformTileControllerAtLocationFromProvider:");
  if ([v5 isZoomedIn])
  {
    [(PUOneUpViewController *)self _handleZoomOutCurrentAsset];
    [v5 zoomOutAnimated:1];
  }
  else
  {
    [v5 zoomInOnLocationFromProvider:v6];
  }
}

- (void)oneUpActionsControllerToggleChromeVisibility:(id)a3
{
  id v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  if ([v4 isChromeVisible]
    && ([v4 assetsDataSource],
        int v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEmpty],
        v5,
        v6))
  {
    id v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring user action to toggle chrome because chrome cannot be hidden while the assets data source is empty.", buf, 2u);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__PUOneUpViewController_oneUpActionsControllerToggleChromeVisibility___block_invoke;
    v8[3] = &unk_1E5F2ED10;
    id v9 = v4;
    [v9 performChanges:v8];
    id v7 = v9;
  }
}

uint64_t __70__PUOneUpViewController_oneUpActionsControllerToggleChromeVisibility___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 isChromeVisible] ^ 1;
  return [v1 setChromeVisible:v2 changeReason:1];
}

- (BOOL)oneUpActionsControllerShouldAnimateViewControllerPresentation:(id)a3
{
  return [(PUOneUpViewController *)self _initialActivity] == 0;
}

- (BOOL)oneUpActionsControllerDismissPresentedViewController:(id)a3
{
  BOOL v4 = [(PUOneUpViewController *)self _isTipPopoverVisible];
  if (v4)
  {
    [(PUOneUpViewController *)self _dismissTipPopoverAnimated:1];
    [(PUOneUpViewController *)self _setHasShownRelevantTip:1];
    [(PUOneUpViewController *)self _invalidateTipPopovers];
    [(PUOneUpViewController *)self _updateTipPopoversIfNeeded];
  }
  return v4;
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return [MEMORY[0x1E4F90300] isOneUpRefreshEnabled] ^ 1;
}

- (int64_t)pu_preferredBarStyle
{
  uint64_t v2 = [(PUOneUpViewController *)self _barsController];
  int64_t v3 = [v2 preferredBarStyle];

  return v3;
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (BOOL)pu_wantsToolbarVisible
{
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled]) {
    return 0;
  }
  BOOL v4 = [(PUOneUpViewController *)self _barsController];
  char v5 = [v4 wantsToolbarVisible];

  return v5;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  uint64_t v2 = [(PUOneUpViewController *)self _barsController];
  char v3 = [v2 wantsNavigationBarVisible];

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewController;
  if ([(PUOneUpViewController *)&v7 prefersStatusBarHidden]) {
    return 1;
  }
  BOOL v4 = [(PUOneUpViewController *)self _barsController];
  if ([v4 prefersStatusBarHidden])
  {
    char v3 = 1;
  }
  else
  {
    char v5 = [(PUOneUpViewController *)self chromeViewController];
    char v3 = [v5 prefersStatusBarHidden];
  }
  return v3;
}

- (BOOL)px_determinesPreferredStatusBarHidden
{
  return 1;
}

- (BOOL)_isLayoutAffectedBySpecChange:(id)a3
{
  id v3 = a3;
  if (([v3 shouldUseContentGuideInsetsChanged] & 1) != 0
    || ([v3 shouldUseUserTransformTilesChanged] & 1) != 0
    || ([v3 shouldDisplayBadgesChanged] & 1) != 0
    || ([v3 shouldDisplayAssetExplorerReviewScreenBadgesChanged] & 1) != 0
    || ([v3 shouldDisplayPlayButtonsChanged] & 1) != 0
    || ([v3 shouldDisplayProgressIndicatorsChanged] & 1) != 0
    || ([v3 progressIndicatorSizeChanged] & 1) != 0
    || ([v3 progressIndicatorContentInsetsChanged] & 1) != 0
    || ([v3 bufferingIndicatorSizeChanged] & 1) != 0
    || ([v3 renderIndicatorSizeChanged] & 1) != 0
    || ([v3 canDisplayLoadingIndicatorsChanged] & 1) != 0
    || ([v3 shouldUseCompactCommentsTitleChanged] & 1) != 0
    || ([v3 tileInitialContentModeChanged] & 1) != 0
    || ([v3 traitCollectionChanged] & 1) != 0
    || ([v3 shouldPinContentToTopChanged] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 shouldLayoutReviewScreenControlBarVerticallyChanged];
  }

  return v4;
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  if ([v5 contentLockingChanged]) {
    [(PUOneUpViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  }
  if (([v5 shouldPlaceButtonsInNavigationBarChanged] & 1) != 0
    || ([v5 shouldUseCompactTitleViewChanged] & 1) != 0
    || ([v5 maximumToolbarHeightChanged] & 1) != 0
    || ([v5 shouldUseCompactCommentsTitleChanged] & 1) != 0
    || ([v5 shouldPlaceScrubberInScrubberBarChanged] & 1) != 0
    || [v5 contentLockingChanged])
  {
    [(PUOneUpViewController *)self _invalidateBarsControllers];
  }
  if (([v5 backgroundColorOverrideChanged] & 1) != 0
    || [v5 shouldDisplayEmptyPlaceholderChanged])
  {
    [(PUOneUpViewController *)self _updateBackgroundTileViewController];
  }
  if (([v5 shouldLayoutReviewScreenControlBarVerticallyChanged] & 1) != 0
    || [v5 shouldCounterrotateReviewScreenBarsChanged])
  {
    [(PUOneUpViewController *)self _updateReviewScreenBars];
  }
  if ([(PUOneUpViewController *)self _isLayoutAffectedBySpecChange:v5]) {
    [(PUOneUpViewController *)self _invalidateLayout];
  }
  if ([v5 hideScrubberWhenShowingAccessoryView]) {
    [(PUOneUpViewController *)self _invalidateChromeViewController];
  }
  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (id)_syndicationPillView
{
  id v3 = [(PUOneUpViewController *)self browsingSession];
  char v4 = [v3 viewModel];

  id v5 = [v4 assetsDataSource];
  int v6 = [v4 currentAssetReference];
  objc_super v7 = [v5 indexPathForAssetReference:v6];
  id v8 = [(PUOneUpViewController *)self _tilingView];
  uint64_t v9 = PUTileKindSyndicationAttribution;
  char v10 = [v5 identifier];
  uint64_t v11 = [v8 presentedTileControllerWithIndexPath:v7 kind:v9 dataSourceIdentifier:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = 0;
    goto LABEL_10;
  }
  char v12 = [v11 pillView];
  id v13 = [v12 superview];
  if (v13)
  {
    uint64_t v14 = [v12 window];
    if (v14)
    {
      id v15 = (void *)v14;
      char v16 = [v12 isHidden];

      if ((v16 & 1) == 0)
      {
        id v13 = v12;
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v13 = 0;
  }
LABEL_9:

LABEL_10:
  return v13;
}

- (id)_passthroughViews
{
  id v3 = [(PUOneUpViewController *)self navigationController];
  char v4 = [v3 navigationBar];

  id v5 = [(PUOneUpViewController *)self navigationController];
  int v6 = [v5 toolbar];

  objc_super v7 = [(PUOneUpViewController *)self view];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  uint64_t v9 = v8;
  if (v4) {
    [v8 addObject:v4];
  }
  if (v6) {
    [v9 addObject:v6];
  }
  if (v7) {
    [v9 addObject:v7];
  }

  return v9;
}

- (void)tipPopoverDidDismissWithTipID:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4F903D8];
  id v5 = a3;
  int v6 = [v4 quickCropTipID];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(PUOneUpViewController *)self _cropButtonTileViewControllerForCurrentAsset];
    [v8 setPresentingTip:0];
  }
  id tipDismissedCompletion = (void (**)(void))self->_tipDismissedCompletion;
  if (tipDismissedCompletion)
  {
    tipDismissedCompletion[2]();
    id v10 = self->_tipDismissedCompletion;
    self->_id tipDismissedCompletion = 0;
  }
  [(PUOneUpBarsController *)self->__barsController setPresentedTipID:0];
  presentedTipID = self->_presentedTipID;
  self->_presentedTipID = 0;
}

- (void)tipPopoverDidPresentWithTipID:(id)a3
{
  id v9 = a3;
  char v4 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
  int v5 = [v9 isEqualToString:v4];

  if (v5)
  {
    [MEMORY[0x1E4F903D8] signalSyndicatedPhotosPresented];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F903D8] quickCropTipID];
    int v7 = [v9 isEqualToString:v6];

    if (v7)
    {
      id v8 = [(PUOneUpViewController *)self _cropButtonTileViewControllerForCurrentAsset];
      [v8 setPresentingTip:1];
    }
  }
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUOneUpViewController *)self _passthroughViews];
  [v6 setPassthroughViews:v8];

  id v9 = [MEMORY[0x1E4F903D8] infoPanelTipID];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [(PUOneUpViewController *)self _barsController];
    char v12 = [v11 barButtonItemToggleDetails];

    if (v12) {
      [v6 setBarButtonItem:v12];
    }
    goto LABEL_17;
  }
  id v13 = [MEMORY[0x1E4F903D8] livePhotosTipID];
  int v14 = [v7 isEqualToString:v13];

  if (v14)
  {
    char v12 = [(PUOneUpViewController *)self _livePhotoBadge];
    if (!v12)
    {
LABEL_17:

      [(PUOneUpBarsController *)self->__barsController setPresentedTipID:v7];
      objc_storeStrong((id *)&self->_presentedTipID, a4);
      goto LABEL_18;
    }
    [v6 setSourceView:v12];
    id v15 = [v6 sourceView];
    [v12 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    char v24 = [v12 superview];
    objc_msgSend(v15, "convertRect:fromCoordinateSpace:", v24, v17, v19, v21, v23);
    objc_msgSend(v6, "setSourceRect:");

LABEL_7:
    [v6 setPermittedArrowDirections:1];
    goto LABEL_17;
  }
  BOOL v25 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
  int v26 = [v7 isEqualToString:v25];

  if (v26)
  {
    char v12 = [(PUOneUpViewController *)self _syndicationPillView];
    if (v12)
    {
      [v6 setSourceView:v12];
      id v27 = [v6 sourceView];
      [v12 frame];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      uint64_t v36 = [v12 superview];
      objc_msgSend(v27, "convertRect:fromCoordinateSpace:", v36, v29, v31, v33, v35);
      objc_msgSend(v6, "setSourceRect:");
    }
    goto LABEL_17;
  }
  uint64_t v37 = [MEMORY[0x1E4F903D8] actionsMenuTipID];
  int v38 = [v7 isEqualToString:v37];

  if (v38)
  {
    uint64_t v39 = [(PUOneUpViewController *)self _barsController];
    char v12 = [v39 barButtonItemActionsMenu];

    if (!v12) {
      goto LABEL_17;
    }
    [v6 setBarButtonItem:v12];
    [v6 popoverLayoutMargins];
    objc_msgSend(v6, "setPopoverLayoutMargins:");
    goto LABEL_7;
  }
  double v40 = [MEMORY[0x1E4F903D8] quickCropTipID];
  int v41 = [v7 isEqualToString:v40];

  if (v41)
  {
    double v42 = [(PUOneUpViewController *)self _cropButtonTileViewControllerForCurrentAsset];
    char v12 = [v42 cropButton];

    if (v12)
    {
      [v6 setSourceView:v12];
      double v43 = [v6 sourceView];
      [v12 frame];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      id v52 = [v12 superview];
      objc_msgSend(v43, "convertRect:fromCoordinateSpace:", v52, v45, v47, v49, v51);
      objc_msgSend(v6, "setSourceRect:");

      uint64_t v53 = [v12 overrideUserInterfaceStyle];
      double v54 = [v6 traitOverrides];
      [v54 setUserInterfaceStyle:v53];
    }
    goto LABEL_17;
  }
  uint64_t v55 = PLOneUpGetLog();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    int v56 = 138543874;
    uint64_t v57 = objc_opt_class();
    __int16 v58 = 2048;
    id v59 = self;
    __int16 v60 = 2112;
    id v61 = v7;
    _os_log_impl(&dword_1AE9F8000, v55, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Invalid tip ID %@", (uint8_t *)&v56, 0x20u);
  }

LABEL_18:
}

- (id)sourceItemForTipID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F903D8] infoPanelTipID];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [(PUOneUpViewController *)self _barsController];
    uint64_t v8 = [v7 barButtonItemToggleDetails];
LABEL_3:
    id v9 = (void *)v8;

    goto LABEL_9;
  }
  int v10 = [MEMORY[0x1E4F903D8] livePhotosTipID];
  int v11 = [v4 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = [(PUOneUpViewController *)self _livePhotoBadge];
LABEL_8:
    id v9 = (void *)v12;
    goto LABEL_9;
  }
  id v13 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
  int v14 = [v4 isEqualToString:v13];

  if (v14)
  {
    uint64_t v12 = [(PUOneUpViewController *)self _syndicationPillView];
    goto LABEL_8;
  }
  double v16 = [MEMORY[0x1E4F903D8] actionsMenuTipID];
  int v17 = [v4 isEqualToString:v16];

  if (v17)
  {
    id v7 = [(PUOneUpViewController *)self _barsController];
    uint64_t v8 = [v7 barButtonItemActionsMenu];
    goto LABEL_3;
  }
  double v18 = [MEMORY[0x1E4F903D8] quickCropTipID];
  int v19 = [v4 isEqualToString:v18];

  if (v19)
  {
    id v7 = [(PUOneUpViewController *)self _cropButtonTileViewControllerForCurrentAsset];
    uint64_t v8 = [v7 cropButton];
    goto LABEL_3;
  }
  double v20 = PXAssertGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138412290;
    id v22 = v4;
    _os_log_error_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "No source item for tip ID: %@", (uint8_t *)&v21, 0xCu);
  }

  id v9 = 0;
LABEL_9:

  return v9;
}

- (id)presentationControllerForTipID:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F903D8] infoPanelTipID];
  if ([v4 isEqualToString:v5])
  {
    int v6 = [(PUOneUpViewController *)self _barsController];
    id v7 = [v6 barButtonItemToggleDetails];

    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v8 = [MEMORY[0x1E4F903D8] livePhotosTipID];
  int v9 = [v4 isEqualToString:v8];

  if (v9)
  {
    int v10 = [(PUOneUpViewController *)self browsingSession];
    int v11 = [v10 viewModel];

    uint64_t v12 = [v11 assetsDataSource];
    id v13 = [v11 currentAssetReference];
    int v14 = [v12 indexPathForAssetReference:v13];
    id v15 = [(PUOneUpViewController *)self _tilingView];
    uint64_t v16 = PUTileKindBadge;
    int v17 = [v12 identifier];
    double v18 = [v15 presentedTileControllerWithIndexPath:v14 kind:v16 dataSourceIdentifier:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v19 = [v18 view];

      if (v19)
      {
        double v20 = self;

        goto LABEL_22;
      }
    }

    goto LABEL_13;
  }
  int v21 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
  if ([v4 isEqualToString:v21])
  {
    id v22 = [(PUOneUpViewController *)self _syndicationPillView];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v23 = [MEMORY[0x1E4F903D8] actionsMenuTipID];
  if (([v4 isEqualToString:v23] & 1) == 0)
  {

    goto LABEL_19;
  }
  char v24 = [(PUOneUpViewController *)self _barsController];
  BOOL v25 = [v24 barButtonItemActionsMenu];

  if (!v25)
  {
LABEL_19:
    int v26 = [MEMORY[0x1E4F903D8] quickCropTipID];
    if ([v4 isEqualToString:v26])
    {
      id v27 = [(PUOneUpViewController *)self _cropButtonTileViewControllerForCurrentAsset];
      double v28 = [v27 cropButton];

      if (v28) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    int v11 = PLOneUpGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543618;
      uint64_t v31 = objc_opt_class();
      __int16 v32 = 2048;
      double v33 = self;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Failed to present tip view controller", (uint8_t *)&v30, 0x16u);
    }
LABEL_13:

    double v20 = 0;
    goto LABEL_22;
  }
LABEL_21:
  double v20 = self;
LABEL_22:

  return v20;
}

- (id)_videoPlayerAtIndexPath:(id)a3 layout:(id)a4
{
  id v4 = [(PUOneUpViewController *)self _assetViewModelAtIndexPath:a3 layout:a4];
  int v5 = [v4 videoPlayer];

  return v5;
}

- (id)_assetViewModelAtIndexPath:(id)a3 layout:(id)a4
{
  int v5 = [(PUOneUpViewController *)self _assetReferenceAtIndexPath:a3 layout:a4];
  int v6 = [(PUOneUpViewController *)self browsingSession];
  id v7 = [v6 viewModel];
  uint64_t v8 = [v7 assetViewModelForAssetReference:v5];

  return v8;
}

- (id)_currentAssetViewModel
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 viewModel];

  id v4 = [v3 currentAssetReference];
  int v5 = [v3 assetViewModelForAssetReference:v4];

  return v5;
}

- (id)_assetReferenceAtIndexPath:(id)a3 layout:(id)a4
{
  id v5 = a3;
  int v6 = [a4 dataSource];
  id v7 = [v6 assetReferenceAtIndexPath:v5];

  return v7;
}

- (BOOL)videoTilesCanPlayVideo
{
  if ([(PUOneUpViewController *)self _isPresentedForSecondScreen]) {
    return 1;
  }
  id v4 = [(PUOneUpViewController *)self _secondScreenBrowser];
  BOOL v3 = v4 == 0;

  return v3;
}

- (void)_updateActiveVideoTilesCanDisplayVideo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUOneUpViewController *)self videoTilesCanPlayVideo];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(PUOneUpViewController *)self activeVideoTileControllers];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setCanPlayVideo:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_setSecondScreenBrowser:(id)a3
{
  uint64_t v5 = (PUOneUpViewController *)a3;
  if (self->__secondScreenBrowser != v5)
  {
    uint64_t v16 = v5;
    objc_storeStrong((id *)&self->__secondScreenBrowser, a3);
    [(PUOneUpViewController *)self _updateActiveVideoTilesCanDisplayVideo];
    uint64_t v6 = [(PUOneUpViewController *)self _tilingView];
    uint64_t v7 = [v6 layout];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    long long v10 = [(PUOneUpViewController *)self browsingSession];
    long long v11 = [v10 viewModel];

    long long v12 = [v11 assetsDataSource];
    char v13 = [v12 isEmpty];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = [v11 currentAssetReference];
      id v15 = [v14 indexPath];
      [v9 invalidateVideoPlaceholderForItemAtIndexPath:v15];
    }
    [(PUOneUpViewController *)self _invalidateChromeViewController];

    uint64_t v5 = v16;
  }
}

- (double)px_imageModulationIntensity
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  BOOL v3 = [v2 viewModel];
  if ([v3 isPresentedForPreview]) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }

  return v4;
}

- (double)px_HDRFocus
{
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PUOneUpViewController_px_HDRFocus__block_invoke;
  aBlock[3] = &unk_1E5F27F60;
  void aBlock[4] = &v15;
  BOOL v3 = (void (**)(void *, void *, double))_Block_copy(aBlock);
  double v4 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v5 = [v4 viewModel];

  [v5 currentAssetTransitionProgress];
  double v7 = v6;
  uint64_t v8 = [v5 leadingAssetReference];
  v3[2](v3, v8, (0.5 - v7) * 0.666666687);

  id v9 = [v5 currentAssetReference];
  double v10 = fabs(v7);
  v3[2](v3, v9, (v10 + v10) / -3.0 + 1.0);

  long long v11 = [v5 trailingAssetReference];
  v3[2](v3, v11, (v7 + 0.5) * 0.666666687);

  double v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __36__PUOneUpViewController_px_HDRFocus__block_invoke(uint64_t a1, void *a2, double a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F902A0];
    double v6 = [a2 asset];
    [v5 HDRValueForAsset:v6];
    double v8 = v7;

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    double v10 = *(double *)(v9 + 24);
    if (v10 < v8 * a3) {
      double v10 = v8 * a3;
    }
    *(double *)(v9 + 24) = v10;
  }
}

- (BOOL)_requireUnlockedDeviceForAccessoryView
{
  return 0;
}

- (id)_currentAccessoryViewController
{
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  double v4 = [v3 viewModel];
  uint64_t v5 = [v4 currentAssetReference];

  double v6 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  double v7 = [v6 accessoryViewControllerForAssetReference:v5 createIfNeeded:0];

  return v7;
}

- (void)_setAccessoryVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  int v5 = a3;
  double v7 = [(PUOneUpViewController *)self browsingSession];
  double v8 = [v7 viewModel];

  if ([v8 accessoryViewsDefaultVisibility] != v5)
  {
    if (v5)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke;
      v15[3] = &unk_1E5F2ED10;
      id v16 = v8;
      [v16 performChanges:v15];
      if ([(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 1)
      {
        [(PUOneUpViewController *)self _setHasShownRelevantTip:1];
        uint64_t v9 = (void *)MEMORY[0x1E4F903D8];
        double v10 = [MEMORY[0x1E4F903D8] infoPanelTipID];
        [v9 setTipActionPerformed:v10];
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke_2;
    v11[3] = &unk_1E5F2D968;
    char v14 = v5;
    id v12 = v8;
    int64_t v13 = a4;
    [v12 performChanges:v11];
  }
}

uint64_t __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1];
}

uint64_t __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessoryViewsDefaultVisibility:*(unsigned __int8 *)(a1 + 48) changeReason:*(void *)(a1 + 40)];
}

- (void)_setAccessoryVisible:(BOOL)a3
{
}

- (BOOL)_isTipPopoverVisible
{
  return self->_presentedTipID != 0;
}

- (BOOL)_isAccessoryVisible
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  BOOL v3 = [v2 viewModel];

  LOBYTE(v2) = [v3 accessoryViewsDefaultVisibility];
  return (char)v2;
}

- (BOOL)_isAccessoryAvailableForCurrentAsset
{
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  double v4 = [v3 viewModel];
  int v5 = [v4 currentAssetReference];
  double v6 = [v5 asset];

  double v7 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  uint64_t v8 = [v7 accessoryViewTypeForAsset:v6];

  if (v8)
  {
    uint64_t v9 = [(PUOneUpViewController *)self actionsController];
    int v10 = [v9 canPerformSimpleActionWithActionType:13] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (int64_t)_accessoryContentKindForAsset:(id)a3
{
  id v4 = a3;
  int v5 = [(PUOneUpViewController *)self _spec];
  int v6 = [v5 allowAccessoryVisibility];

  if (v6)
  {
    if (+[PUCommentsViewController canShowCommentsForAsset:v4])
    {
      int64_t v7 = 2;
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_accessoryContentKindForCurrentAsset
{
  BOOL v3 = [(PUOneUpViewController *)self _spec];
  int v4 = [v3 allowAccessoryVisibility];

  if (!v4) {
    return 0;
  }
  int v5 = [(PUOneUpViewController *)self browsingSession];
  int v6 = [v5 viewModel];
  int64_t v7 = [v6 currentAssetReference];
  uint64_t v8 = [v7 asset];

  if (+[PUCommentsViewController canShowCommentsForAsset:v8])
  {
    int64_t v9 = 2;
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (void)_toggleCommentsVisibility
{
  if ([(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 2)
  {
    [(PUOneUpViewController *)self _toggleAccessoryVisibility];
  }
  else
  {
    BOOL v3 = PLOneUpGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "couldn't toggle comments", v4, 2u);
    }
  }
}

- (void)_toggleDetailsVisibility
{
  if ([(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 1)
  {
    [(PUOneUpViewController *)self _toggleAccessoryVisibility];
  }
  else
  {
    BOOL v3 = PLOneUpGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "couldn't toggle details", v4, 2u);
    }
  }
}

- (void)_updateAccessoryViewIfNeeded
{
  if (![(PUOneUpViewController *)self _needsUpdateAccessoryView]) {
    return;
  }
  [(PUOneUpViewController *)self _setNeedsUpdateAccessoryView:0];
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  int v4 = [v3 viewModel];
  id v20 = [v4 currentAssetReference];

  int v5 = [(PUOneUpViewController *)self _currentAssetViewModel];
  if ([(PUOneUpViewController *)self _prefersFloatingInfoPanel])
  {
    if (![v5 isAccessoryViewVisible])
    {
      [(PUOneUpViewController *)self _dismissFloatingInfoPanelAnimated:1];
      goto LABEL_24;
    }
    int v6 = [v20 indexPath];
    int64_t v7 = [(PUOneUpViewController *)self _tilingView];
    uint64_t v8 = [v7 layout];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v6) {
      [v8 invalidateAccessoryForItemAtIndexPath:v6 withOptions:5];
    }
    [(PUOneUpViewController *)self _presentFloatingInfoPanelAnimated:1];
  }
  else
  {
    [(PUOneUpViewController *)self _dismissFloatingInfoPanelAnimated:1];
    int64_t v9 = [MEMORY[0x1E4F90540] sharedInstance];
    int v10 = [v9 captionWidgetEnableDirectAttachToMaster];

    LODWORD(v9) = [v5 isAccessoryViewVisible];
    int v11 = [v5 isLastAccessoryViewVisibilityChangeReasonUserAction];
    uint64_t v12 = 5;
    if ((v9 & v10) != 0) {
      uint64_t v12 = 1;
    }
    if (v11) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 1;
    }
    char v14 = [(PUOneUpViewController *)self _spec];
    int v15 = [v14 hideScrubberWhenShowingAccessoryView];

    if (v15) {
      [(PUOneUpViewController *)self _invalidateBarsControllers];
    }
    int v6 = [v20 indexPath];
    id v16 = [(PUOneUpViewController *)self _tilingView];
    uint64_t v17 = [v16 layout];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v6) {
      [v17 invalidateAccessoryForItemAtIndexPath:v6 withOptions:v13];
    }
    uint64_t v18 = [(PUOneUpViewController *)self _spec];
    int v19 = [v18 hideBadgesWhenShowingAccessoryView];

    if (v19) {
      [(PUOneUpViewController *)self _invalidateLayout];
    }
  }
LABEL_24:
}

- (void)_updateImageAnalysisInteractionDelegate
{
  id v3 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  [v3 setDelegate:self];
}

- (BOOL)_prefersFloatingInfoPanel
{
  id v3 = [(PUOneUpViewController *)self _spec];
  char v4 = [v3 prefersFloatingInfoPanel];

  if ([(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset] == 1) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)_invalidateInfoPanelLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(PUOneUpViewController *)self currentFloatingInfoPanelAccessoryViewController];
  int v5 = [(PUOneUpViewController *)self cardPresentationController];
  int v6 = [v5 isPresenting];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    id v7 = v11;
    uint64_t v8 = [v7 composition];
    int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F90528]) initWithPhotosDetailsUIViewController:v7 widgetComposition:v8];

    int v10 = [(PUOneUpViewController *)self cardPresentationController];
    [v10 setLayout:v9 animated:v3];
  }
}

- (void)_dimFloatingInfoPanelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUOneUpViewController *)self cardPresentationController];
  int v6 = [v5 isPresenting];

  if (v6)
  {
    id v7 = [(PUOneUpViewController *)self cardPresentationController];
    [v7 dimAnimated:v3];
  }
}

- (BOOL)isFloatingInfoPanelPresented
{
  uint64_t v2 = [(PUOneUpViewController *)self cardPresentationController];
  char v3 = [v2 isPresenting];

  return v3;
}

- (void)_dismissFloatingInfoPanelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUOneUpViewController *)self cardPresentationController];
  int v6 = [v5 isPresenting];

  if (v6)
  {
    [(PUOneUpViewController *)self setCurrentFloatingInfoPanelAccessoryViewController:0];
    [(PUOneUpViewController *)self setUuidOfAssetPresentedInFloatingInfoPanel:0];
    id v7 = [(PUOneUpViewController *)self cardPresentationController];
    [v7 dismissAnimated:v3];
  }
}

- (void)_presentFloatingInfoPanelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [MEMORY[0x1E4F903D0] sharedInstance];
  if (([v14 hideFloatingInfoPanel] & 1) == 0)
  {
    int v5 = [(PUOneUpViewController *)self cardPresentationController];
    char v6 = [v5 isPresenting];

    if (v6) {
      return;
    }
    id v7 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v8 = [v7 viewModel];
    id v14 = [v8 currentAssetReference];

    int64_t v9 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
    int v10 = [v9 createAccessoryViewControllerForAssetReference:v14];

    if (v10)
    {
      objc_msgSend(v10, "setContentInsets:changeReason:", 1, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [(PUOneUpViewController *)self setCurrentFloatingInfoPanelAccessoryViewController:v10];
      id v11 = [v14 asset];
      uint64_t v12 = [v11 uuid];
      [(PUOneUpViewController *)self setUuidOfAssetPresentedInFloatingInfoPanel:v12];

      uint64_t v13 = [(PUOneUpViewController *)self cardPresentationController];
      [v13 presentViewController:v10 animated:v3];
    }
  }
}

- (void)_updateFloatingInfoPanel
{
  [(PUOneUpViewController *)self _dismissFloatingInfoPanelAnimated:0];
  [(PUOneUpViewController *)self _presentFloatingInfoPanelAnimated:0];
  [(PUOneUpViewController *)self _invalidateInfoPanelLayoutAnimated:1];
}

- (void)_updateFloatingInfoPanelIfNeeded
{
  if ([(PUOneUpViewController *)self isFloatingInfoPanelPresented])
  {
    BOOL v3 = [(PUOneUpViewController *)self browsingSession];
    char v4 = [v3 viewModel];
    int v5 = [v4 currentAssetReference];
    char v6 = [v5 asset];
    id v10 = [v6 uuid];

    id v7 = [(PUOneUpViewController *)self uuidOfAssetPresentedInFloatingInfoPanel];
    if (v7 == v10)
    {
    }
    else
    {
      uint64_t v8 = v7;
      char v9 = [v7 isEqualToString:v10];

      if ((v9 & 1) == 0) {
        [(PUOneUpViewController *)self _updateFloatingInfoPanel];
      }
    }
  }
}

- (BOOL)_isCameraDetailsAccessory
{
  int64_t v3 = [(PUOneUpViewController *)self presentationOrigin];
  int64_t v4 = [(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset];
  return v3 == 37 && v4 == 1;
}

- (BOOL)wantsActionsMenu
{
  if (self->_wantsActionsMenu) {
    return 1;
  }
  int64_t v4 = [MEMORY[0x1E4F90108] sharedInstance];
  uint64_t v5 = [v4 actionsMenuLocation];
  int v6 = v5 == 1;
  id v7 = [(PUOneUpViewController *)self traitCollection];
  if ([v7 userInterfaceIdiom] == 1) {
    int v18 = [v4 enableActionsMenuOnPad];
  }
  else {
    int v18 = 0;
  }

  uint64_t v8 = [(PUOneUpViewController *)self traitCollection];
  if ([v8 userInterfaceIdiom]) {
    int v9 = 0;
  }
  else {
    int v9 = [v4 enableActionsMenuOnPhone];
  }

  id v10 = [(PUOneUpViewController *)self browsingSession];
  id v11 = [v10 viewModel];
  uint64_t v12 = [v11 currentAssetReference];
  uint64_t v13 = [v12 assetCollection];

  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v14 = 0;
    goto LABEL_16;
  }
  id v14 = v13;

  if (v5 != 1 || !v14)
  {
LABEL_16:
    if (v6 && v18 | v9)
    {
      unint64_t v15 = [(PUOneUpViewController *)self _options];
      BOOL v17 = ([(PUOneUpViewController *)self _options] & 8) == 0 && v15 != 0x20000;
      self->_wantsActionsMenu = v17;
    }
    goto LABEL_25;
  }
  if ((objc_msgSend(v14, "px_isRecentlyDeletedSmartAlbum") & 1) == 0)
  {
    int v6 = objc_msgSend(v14, "px_isRecoveredSmartAlbum") ^ 1;
    goto LABEL_16;
  }
LABEL_25:

  return self->_wantsActionsMenu;
}

- (void)_toggleAccessoryVisibility
{
  uint64_t v3 = [(PUOneUpViewController *)self _isAccessoryVisible] ^ 1;
  [(PUOneUpViewController *)self _setAccessoryVisible:v3];
}

- (void)_presentAlertForUnplayableAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUOneUpViewController *)self browsingSession];
  int v6 = [v5 viewModel];

  char v7 = [(PUOneUpViewController *)self _options];
  uint64_t v8 = [v4 asset];
  uint64_t v9 = [v8 mediaType];

  if ((v7 & 2) == 0 && v9 == 2 && ([v6 isPresentedForPreview] & 1) == 0)
  {
    id v10 = [v6 currentAssetReference];
    if ([v10 isEqual:v4])
    {
      id v11 = [v6 assetViewModelForAssetReference:v4];
      uint64_t v12 = [v11 videoPlayer];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke;
      v21[3] = &unk_1E5F2ED10;
      id v22 = v11;
      id v13 = v11;
      [v12 performChanges:v21];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_2;
      v19[3] = &unk_1E5F2ED10;
      id v20 = v6;
      [v20 performChanges:v19];
      objc_initWeak(&location, self);
      dispatch_time_t v14 = dispatch_time(0, 400000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_3;
      block[3] = &unk_1E5F2E4E8;
      id v16 = v4;
      objc_copyWeak(&v17, &location);
      dispatch_after(v14, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
  }
}

void __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) videoPlayer];
  [v1 setDesiredPlayState:1 reason:@"Pausing to display alert for unplayable asset"];
}

uint64_t __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1 changeReason:4];
}

void __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8FFE8];
  uint64_t v3 = [*(id *)(a1 + 32) asset];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_4;
  v4[3] = &unk_1E5F27F38;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 presentAlertForAsset:v3 type:1 alertControllerPresenter:v4 completionHandler:0];

  objc_destroyWeak(&v5);
}

uint64_t __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentViewController:v3 animated:1 completion:0];

  return 1;
}

- (void)_beginVKSubjectAnalyzingWithGestureRecognizer:(id)a3 beginID:(unint64_t)a4
{
  id v6 = a3;
  char v7 = +[PUOneUpSettings sharedInstance];
  int v8 = [v7 allowsVisualIntelligenceRemoveBackground];

  if (v8)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    dispatch_time_t v9 = dispatch_time(0, 150000000);
    id v10 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PUOneUpViewController__beginVKSubjectAnalyzingWithGestureRecognizer_beginID___block_invoke;
    block[3] = &unk_1E5F27F10;
    objc_copyWeak(&v12, &location);
    v13[1] = (id)a4;
    objc_copyWeak(v13, &from);
    dispatch_after(v9, v10, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __79__PUOneUpViewController__beginVKSubjectAnalyzingWithGestureRecognizer_beginID___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained touchingGestureRecognizerStateBeginID] == *(void *)(a1 + 48))
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = [v3 state];

    if (v4 != 1) {
      return;
    }
    id v5 = objc_loadWeakRetained(v2);
    [v5 _informVKCOverlayToKickOffSubjectAnalyzing];

    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _dismissAnyPresentedTip];
  }
}

- (void)_handleTouchGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(PUOneUpViewController *)self _updateViewModelWithCurrentScrollPosition];
    [(PUOneUpViewController *)self setTouchingGestureRecognizerStateBeginID:[(PUOneUpViewController *)self touchingGestureRecognizerStateBeginID] + 1];
    [(PUOneUpViewController *)self _beginVKSubjectAnalyzingWithGestureRecognizer:v4 beginID:[(PUOneUpViewController *)self touchingGestureRecognizerStateBeginID]];
  }
}

- (BOOL)_isLocationFromProviderOverInteractiveItemExcludingImageSubject:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  if (([v5 textExistsAtLocation:v4] & 1) != 0
    || ([v5 dataDetectorExistsAtLocation:v4] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 actionInfoItemExistsAtLocation:v4];
  }

  return v6;
}

- (BOOL)_isLocationFromProviderOverImageSubject:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v6 = [v5 imageSubjectExistsAtLocation:v4];

  return v6;
}

- (BOOL)_isLocationFromProviderOverVisualSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v6 = [v5 visualSearchExistsAtLocation:v4];

  return v6;
}

- (BOOL)_vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v6 = [v5 hostView];
  if (v6)
  {
    if ([v5 isVisualIntelligenceOverlayInitialized])
    {
      [v4 locationInView:v6];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      if ([v5 imageInteractionHasAnalysisAndSubjectLiftingEnabled])
      {
        id v11 = [v5 assetViewModel];
        char v12 = [v11 hasVisualAnalysisFailed];

        if ((v12 & 1) == 0)
        {
          if (([v5 isImageSubjectAnalyzingFinished] & 1) == 0
            && ([v5 isImageSubjectAnalysisAvailable] & 1) == 0)
          {
            [v6 bounds];
            v16.double x = v8;
            v16.double y = v10;
            char v13 = CGRectContainsPoint(v17, v16);
            goto LABEL_12;
          }
          if ([v5 isImageSubjectAnalysisAvailable])
          {
            char v13 = [v5 imageSubjectExistsAtLocation:v4];
LABEL_12:
            BOOL v14 = v13;
            goto LABEL_10;
          }
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)_isVisualImageHasSubjectLiftedFromProvider:(id)a3
{
  id v3 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v4 = [v3 subjectHighlightActive];

  return v4;
}

- (BOOL)_visualImageHasActiveTextSelectionFromProvider:(id)a3
{
  id v3 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v4 = [v3 hasActiveTextSelection];

  return v4;
}

- (BOOL)_isLocationFromProviderOverActionInfoItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v6 = [v5 actionInfoItemExistsAtLocation:v4];

  return v6;
}

- (BOOL)_isLocationFromProviderOverInteractiveItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
  char v6 = [v5 interactiveItemExistsAtLocation:v4];

  return v6;
}

- (id)currentImageAnalysisInteraction
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 viewModel];
  id v4 = [v3 imageAnalysisInteraction];

  return v4;
}

- (BOOL)_isLocationFromProvider:(id)a3 overTileOfKind:(id)a4 insetBy:(UIEdgeInsets)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [(PUOneUpViewController *)self browsingSession];
  CGFloat v10 = [v9 viewModel];

  id v11 = [v10 assetsDataSource];
  char v12 = [v10 currentAssetReference];
  char v13 = [v11 indexPathForAssetReference:v12];
  BOOL v14 = [(PUOneUpViewController *)self _tilingView];
  unint64_t v15 = [v11 identifier];
  CGPoint v16 = [v14 presentedTileControllerWithIndexPath:v13 kind:v8 dataSourceIdentifier:v15];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGRect v17 = [v16 view];
    if (v17)
    {
      [v7 locationInView:v17];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      id v22 = objc_msgSend(v17, "hitTest:withEvent:", 0);
      if (v22)
      {
        if (PXEdgeInsetsIsZero())
        {
          BOOL v23 = 1;
        }
        else
        {
          [v17 bounds];
          PXEdgeInsetsInsetRect();
          v25.double x = v19;
          v25.double y = v21;
          BOOL v23 = CGRectContainsPoint(v26, v25);
        }
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)_isLocationFromProvider:(id)a3 overTileOfKind:(id)a4
{
  return -[PUOneUpViewController _isLocationFromProvider:overTileOfKind:insetBy:](self, "_isLocationFromProvider:overTileOfKind:insetBy:", a3, a4, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

- (BOOL)_isLocationFromProviderOverControl:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  CGFloat v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [(PUOneUpViewController *)self _tilingView];
  [v4 locationInView:v5];
  double v7 = v6 + -0.5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __60__PUOneUpViewController__isLocationFromProviderOverControl___block_invoke;
  v13[3] = &unk_1E5F27EE8;
  double v9 = v8 + -0.5;
  double v16 = v6;
  double v17 = v8;
  id v10 = v5;
  id v14 = v10;
  unint64_t v15 = &v18;
  objc_msgSend(v10, "enumeratePresentedTileControllersInRect:usingBlock:", v13, v7, v9, 1.0, 1.0);
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __60__PUOneUpViewController__isLocationFromProviderOverControl___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v7 = v11;
  if ((isKindOfClass & 1) == 0)
  {
    double v8 = [v11 view];
    objc_msgSend(v8, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
    double v9 = objc_msgSend(v8, "hitTest:withEvent:", 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
    else if (v9 && v9 != v8)
    {
      id v10 = [v11 reuseIdentifier];
      if (([v10 isEqualToString:@"PUProgressIndicatorTileReuseIdentifier"] & 1) != 0
        || [v10 isEqualToString:@"PUSyndicationAttributionTileReuseIdentifier"])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    double v7 = v11;
  }
}

- (BOOL)_isLocationFromProviderInAccessoryArea:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v5 = [(PUOneUpViewController *)self _tilingView];
  [v4 locationInView:v5];
  double v7 = v6 + -0.5;
  double v9 = v8 + -0.5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __64__PUOneUpViewController__isLocationFromProviderInAccessoryArea___block_invoke;
  v13[3] = &unk_1E5F2BB60;
  unint64_t v15 = &v16;
  id v10 = v4;
  id v14 = v10;
  objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v13, v7, v9, 1.0, 1.0);
  char v11 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __64__PUOneUpViewController__isLocationFromProviderInAccessoryArea___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  double v7 = [a3 tileKind];
  char v8 = [v7 isEqualToString:@"PUTileKindItemContent"];

  if (v8)
  {
    char v9 = 0;
    id v10 = v13;
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
    *a4 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v10 = v13;
  if (isKindOfClass)
  {
    int v12 = [v13 isLocationFromProviderInContentArea:*(void *)(a1 + 32)];
    id v10 = v13;
    if (v12)
    {
      char v9 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (BOOL)_shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self browsingSession];
  double v6 = [v5 viewModel];

  double v7 = [v6 currentAssetReference];
  char v8 = [v6 assetViewModelForAssetReference:v7];
  id v9 = [v8 videoPlayer];

  if (v9 == v4 && [v6 lastChromeVisibilityChangeReason] == 4)
  {
    id v10 = [v6 lastChromeVisibilityChangeContext];
    char v11 = [v10 isEqual:v7];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_keyboardWillShow:(id)a3
{
  id rect_8 = a3;
  id v4 = [(PUOneUpViewController *)self currentFloatingInfoPanelAccessoryViewController];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(PUOneUpViewController *)self view];
    double v6 = [rect_8 userInfo];
    double v7 = [v6 objectForKey:*MEMORY[0x1E4FB2BD8]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    uint64_t v16 = [v5 window];
    objc_msgSend(v5, "convertRect:fromView:", v16, v9, v11, v13, v15);
    CGFloat rect = v17;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    [v5 safeAreaInsets];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [v5 bounds];
    double MaxY = CGRectGetMaxY(v38);
    v39.origin.double x = rect;
    v39.origin.double y = v19;
    v39.size.CGFloat width = v21;
    v39.size.CGFloat height = v23;
    double v33 = MaxY - CGRectGetMinY(v39);
    if (v29 >= v33) {
      double v34 = v29;
    }
    else {
      double v34 = v33;
    }
    objc_msgSend(v4, "setMaxVisibleContentInsetsWhenInEdit:", v25, v27, v34, v31, *(void *)&rect);
  }
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    id v5 = [v4 actionType];
    uint64_t v6 = PUAssetActionTypeForPXAssetActionType(v5);

    double v7 = [(PUOneUpViewController *)self chromeViewController];
    double v8 = [v7 oneUpActionsControllerPopoverSourceViewWithActionType:v6];

    double v9 = [(PUOneUpViewController *)self chromeViewController];
    [v9 oneUpActionsControllerPopoverSourceRectIn:v8 actionType:v6];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v29.origin.double x = v11;
    v29.origin.double y = v13;
    v29.size.CGFloat width = v15;
    v29.size.CGFloat height = v17;
    if (CGRectIsNull(v29))
    {
      [v8 bounds];
      double v11 = v18;
      double v13 = v19;
      double v15 = v20;
      double v17 = v21;
    }
    double v22 = (void *)MEMORY[0x1E4F908D0];
    if (v8)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F908D0], "popoverPresenterWithViewController:sourceView:sourceRect:", self, v8, v11, v13, v15, v17);
      goto LABEL_9;
    }
  }
  else
  {
    double v24 = [(PUOneUpViewController *)self _barsController];
    double v25 = [v4 actionType];
    double v8 = [v24 sourceItemForActionType:v25];

    double v22 = (void *)MEMORY[0x1E4F908D0];
    if (v8)
    {
      uint64_t v23 = [MEMORY[0x1E4F908D0] popoverPresenterWithViewController:self sourceItem:v8];
      goto LABEL_9;
    }
  }
  uint64_t v23 = [v22 defaultPresenterWithViewController:self];
LABEL_9:
  double v26 = (void *)v23;

  return v26;
}

- (int64_t)_insetModeForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v6 = [v5 viewModel];
  char v7 = [v6 isPresentedForPreview];

  if (v7)
  {
    int64_t v8 = 0;
    goto LABEL_21;
  }
  id v9 = v4;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v10 = 0;
    goto LABEL_9;
  }
  id v10 = v9;

  if (!v10)
  {
LABEL_9:
    LODWORD(v11) = 0;
    goto LABEL_10;
  }
  if (([v10 mediaSubtypes] & 4) != 0) {
    LODWORD(v11) = 1;
  }
  else {
    unint64_t v11 = ((unint64_t)[v10 mediaSubtypes] >> 19) & 1;
  }
LABEL_10:
  double v12 = [(PUOneUpViewController *)self traitCollection];
  if ([v12 verticalSizeClass] == 2)
  {
    double v13 = [(PUOneUpViewController *)self traitCollection];
    uint64_t v14 = [v13 horizontalSizeClass];

    if (v14 == 2)
    {
      double v15 = [MEMORY[0x1E4F90300] sharedInstance];
      uint64_t v16 = [v15 regularSizeClassInsetMode];
      goto LABEL_17;
    }
  }
  else
  {
  }
  double v17 = [MEMORY[0x1E4F90300] sharedInstance];
  double v15 = v17;
  if (v11) {
    uint64_t v16 = [v17 screenshotInsetMode];
  }
  else {
    uint64_t v16 = [v17 insetMode];
  }
LABEL_17:
  unint64_t v18 = v16;

  if (v18 >= 2) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = 2;
  }

LABEL_21:
  return v8;
}

- (void)_handleZoomOutCurrentAsset
{
  id v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  if ([(PUOneUpViewController *)self wasChromeVisibleBeforeZoomIn]
    && ([v4 isChromeVisible] & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PUOneUpViewController__handleZoomOutCurrentAsset__block_invoke;
    v5[3] = &unk_1E5F2ED10;
    id v6 = v4;
    [v6 performChanges:v5];
  }
}

uint64_t __51__PUOneUpViewController__handleZoomOutCurrentAsset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1 changeReason:2];
}

- (id)browsingTileViewAnimator
{
  uint64_t v2 = [(PUOneUpViewController *)self browsingSession];
  id v3 = [v2 tileAnimator];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_livePhotoBadge
{
  id v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  id v5 = [v4 assetsDataSource];
  id v6 = [v4 currentAssetReference];
  char v7 = [v5 indexPathForAssetReference:v6];
  int64_t v8 = [(PUOneUpViewController *)self _tilingView];
  uint64_t v9 = PUTileKindBadge;
  id v10 = [v5 identifier];
  unint64_t v11 = [v8 presentedTileControllerWithIndexPath:v7 kind:v9 dataSourceIdentifier:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v12 = [v11 livePhotoBadgeContainerView];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (PXAssetActionManager)assetActionManager
{
  assetActionManager = self->_assetActionManager;
  if (!assetActionManager)
  {
    id v4 = [(PUOneUpViewController *)self browsingSession];
    id v5 = [v4 dataSourceManager];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v7 = [v4 dataSourceManager];
    if ((isKindOfClass & 1) != 0
      || (objc_opt_class(),
          char v8 = objc_opt_isKindOfClass(),
          v7,
          [v4 dataSourceManager],
          char v7 = objc_claimAutoreleasedReturnValue(),
          (v8 & 1) != 0))
    {
      uint64_t v9 = [v7 photosDataSource];
    }
    else
    {
      objc_opt_class();
      char v26 = objc_opt_isKindOfClass();

      if ((v26 & 1) == 0) {
        goto LABEL_17;
      }
      char v7 = [v4 dataSourceManager];
      double v27 = [v7 dataSourceManagers];
      double v28 = [v27 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v28 photosDataSource];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    if (v9)
    {
      id v10 = (id)[objc_alloc(MEMORY[0x1E4F90468]) initWithPhotosDataSource:v9];
      id v11 = [v4 viewModel];
      double v12 = [v11 currentAssetReference];
      double v13 = [v12 indexPath];
      uint64_t v14 = [v13 section];
      if (v14 >= [v9 numberOfSections])
      {
        double v22 = 0;
LABEL_29:

        goto LABEL_30;
      }
      id v37 = v11;
      id v38 = v10;
      double v15 = [v12 indexPath];
      uint64_t v16 = [v15 item];
      double v17 = [v12 indexPath];
      uint64_t v18 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v17, "section"));

      if (v16 < v18)
      {
        double v19 = [v12 indexPath];
        double v13 = [v9 assetReferenceAtIndexPath:v19];

        BOOL v20 = [(PUOneUpViewController *)self wantsSpotlightStyling];
        double v21 = (Class *)0x1E4F90450;
        if (!v20) {
          double v21 = (Class *)0x1E4F90430;
        }
        double v22 = (void *)[objc_alloc(*v21) initWithSelectedObjectReference:v13 dataSourceManager:v38];
        uint64_t v23 = [(PUOneUpViewController *)self browsingSession];
        double v24 = [v23 actionManager];

        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
          id v25 = v24;
        }
        else {
          id v25 = 0;
        }

        double v31 = [v25 underlyingActionManager];
        objc_opt_class();
        char v32 = objc_opt_isKindOfClass();

        if (v32)
        {
          double v33 = [v25 underlyingActionManager];
          [v22 setAdditionalPropertiesFromActionManager:v33];
        }
        id v11 = v37;
        id v10 = v38;
        goto LABEL_29;
      }
      double v22 = 0;
      id v11 = v37;
      id v10 = v38;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
LABEL_17:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = 0;
      double v22 = 0;
LABEL_32:
      [v22 setPerformerDelegate:self];
      double v34 = self->_assetActionManager;
      self->_assetActionManager = (PXAssetActionManager *)v22;
      id v35 = v22;

      assetActionManager = self->_assetActionManager;
      goto LABEL_33;
    }
    id v10 = v4;
    CGRect v29 = [v10 viewModel];
    double v30 = [v29 currentAssetReference];
    double v12 = [v30 asset];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v11 = v12;

      if (!v11)
      {
        uint64_t v9 = 0;
        double v22 = 0;
        goto LABEL_31;
      }
      double v12 = [v10 importController];
      double v22 = PXCreateImportAssetActionManager();
      uint64_t v9 = 0;
    }
    else
    {
      id v11 = 0;
      uint64_t v9 = 0;
      double v22 = 0;
    }
    goto LABEL_30;
  }
LABEL_33:
  return assetActionManager;
}

- (void)_invalidateAssetActionManager
{
  assetActionManager = self->_assetActionManager;
  self->_assetActionManager = 0;
}

- (void)_browsingVideoPlayerDidPlayToEndTime:(id)a3
{
  id v4 = [a3 object];
  if ([(PUOneUpViewController *)self _shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:v4])
  {
    id v5 = [(PUOneUpViewController *)self browsingSession];
    id v6 = [v5 viewModel];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PUOneUpViewController__browsingVideoPlayerDidPlayToEndTime___block_invoke;
    v8[3] = &unk_1E5F2ED10;
    id v9 = v6;
    id v7 = v6;
    [v7 performChanges:v8];
  }
}

uint64_t __62__PUOneUpViewController__browsingVideoPlayerDidPlayToEndTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1];
}

- (void)_abandonTileController:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v6 setDelegate:0];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    [v4 setDelegate:0];
    [v4 setPresentingDelegate:0];
    [v4 setBrowsingViewModel:0];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PUOneUpViewController *)self activeVideoTileControllers];
    [v5 removeObject:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    [v6 setPresentingDelegate:0];
  }
  [v6 setBrowsingViewModel:0];
LABEL_6:
}

- (void)_configureAdoptedTileController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 setDelegate:self];
    id v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_9:
    [v4 setDelegate:self];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v11 = [(PUOneUpViewController *)self activeVideoTileControllers];
    [v11 addObject:v5];

    objc_msgSend(v5, "setCanPlayVideo:", -[PUOneUpViewController videoTilesCanPlayVideo](self, "videoTilesCanPlayVideo"));
    objc_msgSend(v5, "setIsOnSecondScreen:", -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"));
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v6 = v4;
  id v5 = v6;
LABEL_6:
  [v6 setPresentingDelegate:self];
LABEL_7:
  id v7 = [(PUOneUpViewController *)self browsingSession];
  char v8 = [v7 viewModel];
  [v5 setBrowsingViewModel:v8];

LABEL_10:
  BOOL v9 = [(PUOneUpViewController *)self _isPresentedForSecondScreen];
  id v12 = v4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v12;
  }
  else {
    id v10 = 0;
  }

  [v10 setIsOnPrimaryDisplay:!v9];
}

- (void)_hideChromeOnPlayButtonTapWithItemIsNowPlaying:(BOOL)a3 buttonIsOverlayed:(BOOL)a4
{
  if (a3 && a4)
  {
    id v5 = [(PUOneUpViewController *)self browsingSession];
    id v6 = [v5 viewModel];

    id v7 = [v6 currentAssetReference];
    char v8 = +[PUOneUpSettings sharedInstance];
    BOOL v9 = PUShouldAutoHideChrome(v6, [v8 chromeAutoHideBehaviorOnPlayButton]);

    id v10 = [v7 indexPath];
    id v11 = [(PUOneUpViewController *)self _tilingView];
    id v12 = [v11 layout];

    double v13 = [(PUOneUpViewController *)self _videoPlayerAtIndexPath:v10 layout:v12];

    if (v9 && (![(PUOneUpViewController *)self _isSecondScreenBrowserVisible] || !v13))
    {
      uint64_t v14 = [(PUOneUpViewController *)self _barsController];
      char v15 = [v14 disableChromeHiding];

      if ((v15 & 1) == 0)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        void v16[2] = __90__PUOneUpViewController__hideChromeOnPlayButtonTapWithItemIsNowPlaying_buttonIsOverlayed___block_invoke;
        v16[3] = &unk_1E5F2ECC8;
        id v17 = v6;
        id v18 = v7;
        [v17 performChanges:v16];
      }
    }
  }
}

uint64_t __90__PUOneUpViewController__hideChromeOnPlayButtonTapWithItemIsNowPlaying_buttonIsOverlayed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:0 changeReason:4 context:*(void *)(a1 + 40)];
}

- (void)_chromeAutoHideTimerFired:(id)a3
{
  [(PUOneUpViewController *)self _setChromeAutoHideTimer:0];
  id v4 = [(PUOneUpViewController *)self browsingSession];
  id v5 = [v4 viewModel];

  if (PUShouldAutoHideChrome(v5, 1))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PUOneUpViewController__chromeAutoHideTimerFired___block_invoke;
    _OWORD v6[3] = &unk_1E5F2ED10;
    id v7 = v5;
    [v7 performChanges:v6];
  }
}

uint64_t __51__PUOneUpViewController__chromeAutoHideTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:0 changeReason:3];
}

- (void)_cancelTimedChromeAutoHide
{
  id v3 = [(PUOneUpViewController *)self _chromeAutoHideTimer];
  [v3 invalidate];

  [(PUOneUpViewController *)self _setChromeAutoHideTimer:0];
}

- (void)_scheduleTimedChromeAutoHide
{
  id v3 = +[PUOneUpSettings sharedInstance];
  [v3 chromeAutoHideDelay];
  double v5 = v4;

  id v6 = [(PUOneUpViewController *)self _chromeAutoHideTimer];

  if (!v6 && v5 > 0.0)
  {
    id v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__chromeAutoHideTimerFired_ selector:0 userInfo:0 repeats:v5];
    [(PUOneUpViewController *)self _setChromeAutoHideTimer:v7];
  }
}

- (void)_updateImageAnalysisInteractionAdditionalActionInfoEdgeInsetsIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets:0];
    id v3 = [(PUOneUpViewController *)self chromeViewController];
    [v3 additionalActionInfoEdgeInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    id v12 = [(PUOneUpViewController *)self currentImageAnalysisInteraction];
    objc_msgSend(v12, "setAdditionalActionInfoEdgeInsets:", v5, v7, v9, v11);
  }
}

- (void)_invalidateImageAnalysisInteractionAdditionalActionInfoEdgeInsets
{
}

- (void)_updateEditModeIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdateEditMode])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateEditMode:0];
    id v3 = [(PUOneUpViewController *)self browsingSession];
    double v4 = [v3 viewModel];

    double v5 = [v4 currentAssetReference];
    if (v5)
    {
      double v6 = [v4 currentAssetReference];
      double v7 = [v4 assetViewModelForAssetReference:v6];

      int v8 = [v7 isInEditMode];
      double v9 = [(PUOneUpViewController *)self _tilingView];
      double v10 = [v5 indexPath];
      uint64_t v11 = PUTileKindUserTransform;
      id v12 = [v5 dataSourceIdentifier];
      double v13 = [v9 presentedTileControllerWithIndexPath:v10 kind:v11 dataSourceIdentifier:v12];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
      id v17 = v14;

      uint64_t v15 = v8 ^ 1u;
    }
    else
    {
      id v17 = 0;
      uint64_t v15 = 1;
    }
    uint64_t v16 = [(PUOneUpViewController *)self _tilingView];
    [v16 setScrollEnabled:v15];

    [v17 setUserInteractionEnabled:v15];
  }
}

- (void)_invalidateEditMode
{
}

- (void)_updateReviewScreenBars
{
  id v3 = [(PUOneUpViewController *)self browsingSession];
  double v4 = [v3 viewModel];
  double v5 = [v4 reviewScreenBarsModel];

  double v6 = [(PUOneUpViewController *)self _reviewScreenControlBarTileViewController];
  [v6 setBarsModel:v5];

  double v7 = [(PUOneUpViewController *)self _reviewScreenTopBarTileViewController];
  [v7 setBarsModel:v5];

  int v8 = [(PUOneUpViewController *)self _reviewScreenScrubberBarTileViewController];
  [v8 setBarsModel:v5];

  double v9 = [(PUOneUpViewController *)self _spec];
  LOBYTE(v8) = [v9 shouldLayoutReviewScreenControlBarVertically];
  char v10 = [v9 shouldCounterrotateReviewScreenBars];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PUOneUpViewController__updateReviewScreenBars__block_invoke;
  v11[3] = &__block_descriptor_34_e42_v16__0___PUMutableReviewScreenBarsModel__8l;
  char v12 = (char)v8;
  char v13 = v10;
  [v5 performChanges:v11];
}

void __48__PUOneUpViewController__updateReviewScreenBars__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  [v4 setUseVerticalControlLayout:v3];
  [v4 setShouldBarsCounterrotate:*(unsigned __int8 *)(a1 + 33)];
}

- (BOOL)_wantsShowInLibraryButtonForAllAssets
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (([(PUOneUpViewController *)self _options] & 0x8000) != 0) {
    return 1;
  }
  uint64_t v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];
  double v5 = [v4 currentAssetReference];

  if (v5)
  {
    double v6 = [(PUOneUpViewController *)self browsingSession];
    double v7 = [v6 actionManager];

    v11[0] = v5;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    char v9 = [v7 canPerformAction:40 onAllAssetReferences:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (UIView)chromeView
{
  uint64_t v2 = [(PUOneUpViewController *)self chromeViewController];
  uint64_t v3 = [v2 view];

  return (UIView *)v3;
}

- (void)_updateChromeViewControllerIfNeeded
{
  if ([(PUOneUpViewController *)self needsUpdateChromeViewController])
  {
    [(PUOneUpViewController *)self setNeedsUpdateChromeViewController:0];
    uint64_t v3 = [(PUOneUpViewController *)self _spec];
    uint64_t v4 = [v3 hideScrubberWhenShowingAccessoryView];
    double v5 = [(PUOneUpViewController *)self chromeViewController];
    [v5 setHideScrubberWhenAccessoryIsVisible:v4];

    uint64_t ShouldShowAirPlayButton = _ShouldShowAirPlayButton();
    double v7 = [(PUOneUpViewController *)self chromeViewController];
    [v7 setWantsAirPlayButton:ShouldShowAirPlayButton];

    BOOL v8 = [(PUOneUpViewController *)self _wantsShowInLibraryButtonForAllAssets];
    char v9 = [(PUOneUpViewController *)self chromeViewController];
    [v9 setWantsShowInLibraryButton:v8];

    BOOL v10 = [(PUOneUpViewController *)self _isSecondScreenBrowserVisible];
    id v11 = [(PUOneUpViewController *)self chromeViewController];
    [v11 setIsDisplayingContentOnSecondScreen:v10];
  }
}

- (void)_updateBackgroundTileViewController
{
  id v17 = [(PUOneUpViewController *)self _backgroundTileViewController];
  uint64_t v3 = [(PUOneUpViewController *)self _spec];
  uint64_t v4 = [v3 backgroundColorOverride];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [(PUOneUpViewController *)self chromeViewController];
    id v6 = [v7 backgroundColorOverride];
  }
  uint64_t v8 = [v3 shouldDisplayEmptyPlaceholder];
  [v17 setBackgroundColorOverride:v6];
  [v17 setShouldDisplayEmptyPlaceholder:v8];
  char v9 = [(PUOneUpViewController *)self browsingSession];
  BOOL v10 = [v9 emptyPlaceholderTitle];
  [v17 setEmptyPlaceholderCustomTitle:v10];

  id v11 = [(PUOneUpViewController *)self browsingSession];
  char v12 = [v11 emptyPlaceholderSubtitle];
  [v17 setEmptyPlaceholderCustomSubtitle:v12];

  if ([(PUOneUpViewController *)self wantsSpotlightStyling])
  {
    char v13 = [(PUOneUpViewController *)self view];
    id v14 = [v13 traitCollection];
    if ([v14 userInterfaceIdiom]) {
      uint64_t v15 = 8;
    }
    else {
      uint64_t v15 = 18;
    }

    uint64_t v16 = [MEMORY[0x1E4FB14C8] effectWithStyle:v15];
    [v17 setVisualEffect:v16];
  }
}

- (void)_setContentUnavailableConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController _setContentUnavailableConfiguration:](&v7, sel__setContentUnavailableConfiguration_);
  if (a3)
  {
    double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else
  {
    double v5 = 0;
  }
  id v6 = [(PUOneUpViewController *)self view];
  [v6 setBackgroundColor:v5];

  if (a3) {
}
  }

- (void)_updateGestureController
{
  id v7 = [(PUOneUpViewController *)self gestureController];
  uint64_t v3 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v4 = [v3 viewModel];
  int v5 = [v4 isChromeVisible];

  if (v5)
  {
    id v6 = [(PUOneUpViewController *)self chromeViewController];
    [v6 contentGuideInsets];
    objc_msgSend(v7, "setInteractionInsets:");
  }
  else
  {
    objc_msgSend(v7, "setInteractionInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  int v5 = [(PUOneUpViewController *)self _spec];
  uint64_t v6 = [v5 isContentLocked];

  id v7 = [(PUOneUpViewController *)self _tilingView];
  [v7 setHidden:v6];

  uint64_t v8 = v6 ^ 1;
  char v9 = [(PUOneUpViewController *)self _tilingView];
  [v9 setUserInteractionEnabled:v8];

  if (v8)
  {
    [(PUOneUpViewController *)self _setContentUnavailableConfiguration:0];
  }
  else
  {
    objc_initWeak(&location, self);
    BOOL v10 = (void *)MEMORY[0x1E4FB13F0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke;
    v23[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v24, &location);
    id v11 = [v10 actionWithHandler:v23];
    char v12 = [(PUOneUpViewController *)self browsingSession];
    char v13 = [v12 privacyController];
    [v13 authenticationType];

    id v14 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v15 = [v14 viewModel];
    [v15 wantsContentUnavailableUnlockButtonVisible];

    uint64_t v16 = PXContentLockedPlaceholderConfiguration();
    id v17 = [v16 updatedConfigurationForState:v4];
    [(PUOneUpViewController *)self _setContentUnavailableConfiguration:v17];

    id v18 = [(PUOneUpViewController *)self browsingSession];
    double v19 = [v18 viewModel];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke_2;
    v21[3] = &unk_1E5F2ED10;
    id v20 = v19;
    id v22 = v20;
    [v20 performChanges:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained browsingSession];
  uint64_t v3 = [v2 privacyController];
  id v4 = objc_loadWeakRetained(v1);
  [v3 performUserAuthenticationIfNeededFromContext:v4];
}

uint64_t __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:1 changeReason:7];
}

- (void)_updateLayoutIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdateLayout])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateLayout:0];
    uint64_t v3 = [(PUOneUpViewController *)self _tilingView];
    id v4 = [v3 layout];

    [(PUOneUpViewController *)self _updateLayout:v4];
  }
}

- (void)_invalidateAccessoryView
{
}

- (void)_invalidateChromeViewController
{
}

- (void)_invalidateLayout
{
}

- (void)_updateViewModelWithCurrentScrollPosition
{
  id v4 = [(PUOneUpViewController *)self _tilingView];
  int v5 = [v4 layout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v7 = [v6 viewModel];
    uint64_t v8 = [(id)v7 assetsDataSource];

    char v9 = [v5 dataSource];
    LOBYTE(v7) = [v9 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 1755, @"Invalid parameter not satisfying: %@", @"[[oneUpLayout dataSource] isEqual:assetsDataSource]" object file lineNumber description];
    }
    BOOL v10 = [v5 indexPathOfCurrentItem];
    if (v10)
    {
      [v5 transitionProgress];
      uint64_t v12 = v11;
      char v13 = [v8 assetReferenceAtIndexPath:v10];
      if (!v13)
      {
        double v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 1761, @"Invalid parameter not satisfying: %@", @"assetReference != nil" object file lineNumber description];
      }
      id v14 = [(PUOneUpViewController *)self browsingSession];
      uint64_t v15 = [v14 viewModel];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__PUOneUpViewController__updateViewModelWithCurrentScrollPosition__block_invoke;
      v20[3] = &unk_1E5F2DEB0;
      id v21 = v15;
      id v22 = v13;
      uint64_t v24 = v12;
      uint64_t v23 = self;
      id v16 = v13;
      id v17 = v15;
      [v17 performChanges:v20];
    }
  }
}

uint64_t __66__PUOneUpViewController__updateViewModelWithCurrentScrollPosition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40) transitionProgress:*(void *)(*(void *)(a1 + 48) + 976) transitionDriverIdentifier:0 animated:*(double *)(a1 + 56)];
}

- (BOOL)_isDrivingScrubbing
{
  uint64_t v2 = self;
  uint64_t v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];
  int v5 = [v4 transitionDriverIdentifier];
  LOBYTE(v2) = [v5 isEqualToString:v2->_scrubbingIdentifier];

  return (char)v2;
}

- (void)_updateBarsControllerIfNeeded
{
  if (![(PUOneUpViewController *)self _needsUpdateBarsController]) {
    return;
  }
  [(PUOneUpViewController *)self _setNeedsUpdateBarsController:0];
  id v46 = [(PUOneUpViewController *)self _spec];
  unint64_t v3 = [(PUOneUpViewController *)self _options];
  id v4 = [(PUOneUpViewController *)self browsingSession];
  int v5 = [v4 viewModel];

  uint64_t v6 = +[PUOneUpSettings sharedInstance];
  unsigned int v7 = [v46 shouldPlaceButtonsInNavigationBar];
  unsigned int v43 = [v46 shouldUseCompactTitleView];
  unsigned int v42 = [v46 shouldUseCompactCommentsTitle];
  [v46 maximumToolbarHeight];
  double v9 = v8;
  [v46 maximumAccessoryToolbarHeight];
  double v11 = v10;
  BOOL v12 = 0;
  if ([v46 allowProgrammaticNavBackButton])
  {
    char v13 = [(PUOneUpViewController *)self navigationController];
    id v14 = [v13 viewControllers];
    uint64_t v15 = [v14 firstObject];
    if (v15 == self)
    {
      id v16 = [(PUOneUpViewController *)self navigationController];
      id v17 = [v16 presentingViewController];
      BOOL v12 = v17 != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  BOOL v41 = v12;
  uint64_t v18 = 0;
  unsigned int v44 = v7;
  if ([v5 isPresentedForPreview]) {
    goto LABEL_11;
  }
  double v19 = v46;
  if ((v3 & 0x800) == 0)
  {
    uint64_t v18 = [v46 isContentLocked] ^ 1;
LABEL_11:
    double v19 = v46;
  }
  unsigned int v20 = [v19 shouldShowTitleView];
  if ((v3 & 0x1000) != 0) {
    unsigned int v21 = 0;
  }
  else {
    unsigned int v21 = v20;
  }
  unsigned int v40 = v21;
  unsigned int ShouldShowAirPlayButton = _ShouldShowAirPlayButton();
  id v22 = [v5 currentAssetReference];
  uint64_t v23 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
  uint64_t v24 = [v22 asset];
  uint64_t v25 = [v23 accessoryViewTypeForAsset:v24];

  if ([v46 allowTapOnTitle])
  {
    BOOL v27 = [v6 titleTapAction] == 2 && v25 == 2;
    BOOL v38 = v27;
  }
  else
  {
    BOOL v38 = 0;
  }
  double v28 = [v22 asset];
  double v45 = v6;
  CGRect v29 = v5;
  if ([v28 mediaType] == 2) {
    unsigned int v37 = [v28 canPlayLoopingVideo] ^ 1;
  }
  else {
    unsigned int v37 = 0;
  }
  uint64_t v30 = [v28 playbackStyle];
  unsigned int v36 = [v46 shouldDisableNavigationBarsVisibility];
  uint64_t v31 = [v46 shouldPlaceScrubberInScrubberBar];
  char v32 = [(PUOneUpViewController *)self _spec];
  int v33 = [v32 hideScrubberWhenShowingAccessoryView];

  if (v33)
  {
    double v34 = [v29 assetViewModelForAssetReference:v22];
    uint64_t v18 = v18 & ~[v34 isAccessoryViewVisible];
  }
  id v35 = [(PUOneUpViewController *)self _barsController];
  [v35 setShouldShowMuteButton:v30 == 4];
  [v35 setShouldPlaceButtonsInNavigationBar:v44];
  [v35 setShouldUseCompactTitleView:v43];
  [v35 setShouldUseCompactCommentsTitle:v42];
  [v35 setMaximumToolbarHeight:v9];
  [v35 setMaximumAccessoryToolbarHeight:v11];
  [v35 setShouldShowProgrammaticNavBackButton:v41];
  [v35 setShouldShowAirPlayButton:ShouldShowAirPlayButton];
  [v35 setShouldShowScrubber:v18];
  [v35 setShouldShowTitleView:v40];
  [v35 setAllowTapOnTitle:v38];
  [v35 setAllowShowingPlayPauseButton:v37];
  [v35 setDisableShowingNavigationBars:v36];
  [v35 setShouldPlaceScrubberInScrubberBar:v31];
  [v35 setDisableChromeHiding:(v3 >> 14) & 1];
  [v35 setWantsShowInLibraryButton:(v3 >> 15) & 1];
  objc_msgSend(v35, "setIsInCompactLayoutStyle:", objc_msgSend(v46, "isInCompactLayoutStyle"));
}

- (void)_invalidateBarsControllers
{
}

- (void)_updateVideoPlayerIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdateVideoPlayer])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateVideoPlayer:0];
    unint64_t v3 = [(PUOneUpViewController *)self browsingSession];
    id v4 = [v3 viewModel];

    int v5 = [v4 currentAssetReference];
    uint64_t v6 = [v4 assetViewModelForAssetReference:v5];

    unsigned int v7 = [v6 asset];
    char v8 = [v4 isPresentingOverOneUp];
    double v9 = [v6 videoPlayer];
    if ((v8 & 1) == 0)
    {
      if ([v7 canPlayLoopingVideo])
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        id v10[2] = __51__PUOneUpViewController__updateVideoPlayerIfNeeded__block_invoke;
        v10[3] = &unk_1E5F2ED10;
        id v11 = v9;
        [v11 performChanges:v10];
      }
    }
  }
}

uint64_t __51__PUOneUpViewController__updateVideoPlayerIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:3 reason:@"1-Up view controller triggering looping video playback"];
}

- (void)_invalidateVideoPlayer
{
}

- (void)_updatePreferredContentSizeIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdatePreferredContentSize])
  {
    [(PUOneUpViewController *)self _setNeedsUpdatePreferredContentSize:0];
    [(PUOneUpViewController *)self preferredContentSizeOverride];
    if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v6 = [(PUOneUpViewController *)self browsingSession];
      id v25 = [v6 viewModel];

      unsigned int v7 = [v25 currentAssetReference];
      char v8 = [v7 asset];

      if (v8)
      {
        [v8 aspectRatio];
        double v10 = v9;
      }
      else
      {
        double v10 = 1.0;
      }
      id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v11 bounds];
      double v16 = PURectWithAspectRatioFittingRect(1.0, v12, v13, v14, v15);
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;

      PURectWithAspectRatioFittingRect(v10, v16, v18, v20, v22);
      -[PUOneUpViewController setPreferredContentSize:](self, "setPreferredContentSize:", v23, v24);
    }
    else
    {
      [(PUOneUpViewController *)self preferredContentSizeOverride];
      -[PUOneUpViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (void)_invalidatePreferredContentSize
{
}

- (void)_updateSpecIfNeeded
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(PUOneUpViewController *)self _needsUpdateSpec])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateSpec:0];
    double v3 = [(PUOneUpViewController *)self traitCollection];
    [(PUOneUpViewController *)self _layoutReferenceSize];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    BOOL v37 = [(PUOneUpViewController *)self _isPresentedForSecondScreen];
    BOOL v8 = [(PUOneUpViewController *)self _prefersCompactLayoutForSplitScreen];
    double v9 = [(PUOneUpViewController *)self browsingSession];
    double v10 = [v9 viewModel];

    char v11 = [v10 isPresentedForPreview];
    char v12 = [v10 isChromeVisible];
    CGFloat v13 = [(PUOneUpViewController *)self _secondScreenBrowser];
    if (v13 && ![(PUOneUpViewController *)self _isPresentedForSecondScreen])
    {
      [v10 secondScreenSize];
      uint64_t v14 = v16;
      uint64_t v15 = v17;
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F1DB30];
      uint64_t v15 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
    }

    CGFloat v18 = [(PUOneUpViewController *)self _barsController];
    char v19 = [v18 isShowingPlayPauseButton];

    BOOL v20 = [v10 contentPrivacyState] == 1;
    double v21 = [(PUOneUpViewController *)self unlockDeviceStatus];

    if (v21)
    {
      CGFloat v22 = [(PUOneUpViewController *)self unlockDeviceStatus];
      int v23 = v22[2]();
    }
    else
    {
      int v23 = 1;
    }
    double v24 = PLUIGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = @"NO";
      if (v23) {
        id v25 = @"YES";
      }
      char v36 = v23;
      BOOL v26 = v20;
      char v27 = v19;
      double v28 = v3;
      char v29 = v12;
      char v30 = v11;
      BOOL v31 = v8;
      char v32 = v25;
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v32;
      _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_INFO, "PUOneUpViewController: shouldDisplayPeopleRow: %@", buf, 0xCu);

      BOOL v8 = v31;
      char v11 = v30;
      char v12 = v29;
      double v3 = v28;
      char v19 = v27;
      BOOL v20 = v26;
      LOBYTE(v23) = v36;
    }

    int v33 = [(PUOneUpViewController *)self _spec];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __44__PUOneUpViewController__updateSpecIfNeeded__block_invoke;
    v38[3] = &unk_1E5F27EA0;
    char v45 = v11;
    BOOL v46 = v37;
    uint64_t v41 = v14;
    uint64_t v42 = v15;
    char v47 = v12;
    BOOL v48 = v20;
    char v49 = v19;
    id v39 = v33;
    id v40 = v3;
    BOOL v50 = v8;
    uint64_t v43 = v5;
    uint64_t v44 = v7;
    char v51 = v23;
    id v34 = v3;
    id v35 = v33;
    [v35 performChanges:v38];
  }
}

uint64_t __44__PUOneUpViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentedForPreview:*(unsigned __int8 *)(a1 + 80)];
  [*(id *)(a1 + 32) setPresentedForSecondScreen:*(unsigned __int8 *)(a1 + 81)];
  objc_msgSend(*(id *)(a1 + 32), "setSecondScreenSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [*(id *)(a1 + 32) setChromeVisible:*(unsigned __int8 *)(a1 + 82)];
  [*(id *)(a1 + 32) setContentLocked:*(unsigned __int8 *)(a1 + 83)];
  [*(id *)(a1 + 32) setShowingPlayPauseButtonInBars:*(unsigned __int8 *)(a1 + 84)];
  [*(id *)(a1 + 32) setTraitCollection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPrefersCompactLayoutForSplitScreen:*(unsigned __int8 *)(a1 + 85)];
  if (*(double *)(a1 + 64) != *MEMORY[0x1E4F1DB30] || *(double *)(a1 + 72) != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    objc_msgSend(*(id *)(a1 + 32), "setLayoutReferenceSize:");
  }
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 86);
  return [v3 setShouldDisplayPeopleRow:v4];
}

- (void)_invalidateSpec
{
}

- (void)_dismissTipPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUOneUpViewController *)self _isTipPopoverVisible])
  {
    [(PUOneUpViewController *)self dismissViewControllerAnimated:v3 completion:0];
    [MEMORY[0x1E4F903D8] setTip:self->_presentedTipID isPresentable:0];
    [(PUOneUpBarsController *)self->__barsController setPresentedTipID:0];
    presentedTipID = self->_presentedTipID;
    self->_presentedTipID = 0;

    id tipDismissedCompletion = self->_tipDismissedCompletion;
    self->_id tipDismissedCompletion = 0;

    uint64_t v7 = (void *)MEMORY[0x1E4F903D8];
    [v7 setTipsPresentationDelegate:0];
  }
}

- (void)_updateTipPopoversIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdateTipsPopover])
  {
    [(PUOneUpViewController *)self _setNeedsUpdateTipPopovers:0];
    BOOL v3 = [(PUOneUpViewController *)self browsingSession];
    uint64_t v4 = [v3 viewModel];

    uint64_t v5 = [v4 assetViewModelForCurrentAssetReference];
    uint64_t v6 = [v4 assetsDataSource];
    uint64_t v7 = [v4 currentAssetReference];
    uint64_t v8 = [v7 asset];
    double v9 = [v5 badgeInfoPromise];
    double v10 = v9;
    if (v9) {
      [v9 badgeInfo];
    }

    int v64 = [v4 isChromeVisible];
    BOOL v59 = [(PUOneUpViewController *)self _isIrisPlaying];
    char v11 = [(PUOneUpViewController *)self traitCollection];
    uint64_t v58 = [v11 userInterfaceIdiom];

    char v12 = [(PUOneUpViewController *)self view];
    CGFloat v13 = [v12 window];
    uint64_t v57 = [v13 _toWindowOrientation];

    if ([v4 isScrolling]) {
      int v56 = 1;
    }
    else {
      int v56 = [v4 isScrubbing];
    }
    if ([(PUOneUpViewController *)self appearState] == 2) {
      int v55 = [v4 isPresentedForPreview];
    }
    else {
      int v55 = 1;
    }
    BOOL v14 = [(PUOneUpViewController *)self _isAccessoryVisible];
    uint64_t v15 = [(PUOneUpViewController *)self _barsController];
    uint64_t v16 = [v15 barButtonItemToggleDetails];

    if (PXAssetBadgeInfoIsActionable()) {
      int v53 = PXAssetBadgeInfoIsActionableDisabled() ^ 1;
    }
    else {
      int v53 = 0;
    }
    uint64_t v17 = [(PUOneUpViewController *)self _barsController];
    CGFloat v18 = [v17 barButtonItemActionsMenu];
    BOOL v52 = v18 != 0;

    __int16 v60 = (void *)v8;
    if (PXContentSyndicationShouldShowAttributionViewForAsset())
    {
      char v19 = [(PUOneUpViewController *)self _syndicationPillView];
      BOOL v51 = v19 != 0;
    }
    else
    {
      BOOL v51 = 0;
    }
    BOOL v20 = [v5 asset];
    BOOL v54 = [(PUOneUpViewController *)self _isAssetEligibleForTip:v20];

    char v63 = v5;
    double v21 = [v5 visualImageAnalysis];
    unsigned int v22 = [v21 hasVisualSearchResults];

    id v61 = v7;
    uint64_t v62 = v6;
    if (v7)
    {
      int v23 = [v6 indexPathForAssetReference:v7];
      double v24 = [(PUOneUpViewController *)self _tilingView];
      uint64_t v25 = PUTileKindBadge;
      BOOL v26 = [v6 identifier];
      char v27 = [v24 presentedTileControllerWithIndexPath:v23 kind:v25 dataSourceIdentifier:v26];

      int v28 = [v27 isActive];
    }
    else
    {
      int v28 = 0;
    }
    char v29 = [(PUOneUpViewController *)self _cropButtonTileViewControllerForCurrentAsset];
    char v30 = [v29 cropButton];

    uint64_t v31 = 0;
    BOOL v33 = v57 == 1 || v58 == 1;
    if ((v56 | v55 | (v59 || v14)) == 1)
    {
      int v34 = 0;
      BOOL v35 = 0;
      BOOL v36 = 0;
      uint64_t v37 = 0;
    }
    else
    {
      int v34 = 0;
      BOOL v35 = 0;
      BOOL v36 = 0;
      uint64_t v37 = 0;
      if (v33)
      {
        int v34 = ![(PUOneUpViewController *)self _hasShownRelevantTip];
        if (v16) {
          int v38 = v64 & v34;
        }
        else {
          int v38 = 0;
        }
        uint64_t v31 = v38 & v54 & v22;
        if ((v64 & v34) == 1)
        {
          BOOL v35 = v52;
          uint64_t v37 = [(PUOneUpViewController *)self _didPlayCurrentLivePhoto] & v28 & v53;
          int v34 = 1;
          BOOL v36 = v51;
        }
        else
        {
          BOOL v35 = 0;
          BOOL v36 = 0;
          uint64_t v37 = 0;
        }
      }
    }
    unsigned int v39 = v34 & ~v64;
    if (v30) {
      uint64_t v40 = v39;
    }
    else {
      uint64_t v40 = 0;
    }
    uint64_t v41 = (void *)MEMORY[0x1E4F903D8];
    uint64_t v42 = [MEMORY[0x1E4F903D8] infoPanelTipID];
    [v41 setTip:v42 isPresentable:v31];

    uint64_t v43 = (void *)MEMORY[0x1E4F903D8];
    uint64_t v44 = [MEMORY[0x1E4F903D8] livePhotosTipID];
    [v43 setTip:v44 isPresentable:v37];

    char v45 = (void *)MEMORY[0x1E4F903D8];
    BOOL v46 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
    [v45 setTip:v46 isPresentable:v36];

    char v47 = (void *)MEMORY[0x1E4F903D8];
    BOOL v48 = [MEMORY[0x1E4F903D8] actionsMenuTipID];
    [v47 setTip:v48 isPresentable:v35];

    char v49 = (void *)MEMORY[0x1E4F903D8];
    BOOL v50 = [MEMORY[0x1E4F903D8] quickCropTipID];
    [v49 setTip:v50 isPresentable:v40];
  }
}

- (void)_invalidateTipPopovers
{
}

- (void)_updatePreloadInsetsIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdatePreloadInsets])
  {
    [(PUOneUpViewController *)self _setNeedsUpdatePreloadInsets:0];
    BOOL v3 = [(PUOneUpViewController *)self browsingSession];
    id v14 = [v3 viewModel];

    if ([v14 browsingSpeedRegime] == 2 || objc_msgSend(v14, "isPresentedForPreview"))
    {
      double v5 = *MEMORY[0x1E4FB2848];
      double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    else
    {
      uint64_t v8 = [(PUOneUpViewController *)self view];
      [v8 bounds];
      double v10 = v9;

      float v11 = v10;
      double v12 = floorf(v11 * 0.5);
      if (v12 < 100.0) {
        double v12 = 100.0;
      }
      double v6 = -v12;
      double v7 = 0.0;
      double v4 = -v12;
      double v5 = 0.0;
    }
    CGFloat v13 = [(PUOneUpViewController *)self _tilingView];
    objc_msgSend(v13, "setLoadingInsets:", v5, v4, v7, v6);
  }
}

- (void)_invalidatePreloadInsets
{
}

- (void)_updateLayout:(id)a3
{
  id v128 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_67;
  }
  double v4 = [(PUOneUpViewController *)self _spec];
  CGFloat v127 = +[PUOneUpSettings sharedInstance];
  int v5 = [MEMORY[0x1E4F90300] isOneUpRefreshEnabled];
  double v6 = [(PUOneUpViewController *)self browsingSession];
  double v7 = [v6 viewModel];

  id v126 = [(PUOneUpViewController *)self _currentAssetViewModel];
  double v8 = *MEMORY[0x1E4FB2848];
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (v5)
  {
    double v12 = [(PUOneUpViewController *)self browsingSession];
    CGFloat v13 = [v12 viewModel];
    char v14 = [v13 isPresentedForPreview];

    if (v14) {
      goto LABEL_8;
    }
    uint64_t v15 = [(PUOneUpViewController *)self chromeViewController];
    [(PUOneUpViewController *)self _layoutReferenceSize];
    objc_msgSend(v15, "contentGuideInsetsForViewSize:");
  }
  else
  {
    if (![v4 shouldUseContentGuideInsets]) {
      goto LABEL_8;
    }
    uint64_t v15 = [(PUOneUpViewController *)self _barsController];
    [v15 contentGuideInsets];
  }

LABEL_8:
  uint64_t v16 = [(PUOneUpViewController *)self chromeViewController];
  [v16 contentDecorationAdditionalInsets];
  double v123 = v18;
  double v124 = v17;
  double v121 = v20;
  double v122 = v19;

  [(PUOneUpViewController *)self px_safeAreaInsets];
  UIEdgeInsetsMax();
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  char v29 = [(PUOneUpViewController *)self browsingSession];
  char v30 = [v29 viewModel];
  char v31 = [v30 isPresentedForPreview];

  if (v31)
  {
LABEL_13:
    double v118 = v10;
    double v119 = v11;
    double v116 = v8;
    double v117 = v9;
    goto LABEL_14;
  }
  uint64_t v32 = [v127 scaleToFitBehavior];
  switch(v32)
  {
    case 3:
      [v127 minimumContentInset];
      UIEdgeInsetsMax();
      double v22 = v70;
      double v24 = v71;
      double v26 = v72;
      double v28 = v73;
      double v118 = v72;
      double v119 = v73;
      double v116 = v70;
      double v117 = v71;
      break;
    case 2:
      double v118 = v26;
      double v119 = v28;
      double v116 = v22;
      double v117 = v24;
      break;
    case 1:
      BOOL v33 = [(PUOneUpViewController *)self view];
      [v33 safeAreaInsets];
      double v116 = v34;
      double v117 = v35;
      double v118 = v36;
      double v119 = v37;

      break;
    default:
      goto LABEL_13;
  }
LABEL_14:
  id v125 = v7;
  uint64_t v38 = [v7 videoOverlayPlayState];
  unsigned int v39 = [v4 shouldDisplayBadges];
  BOOL v40 = v38 == 0;
  if (v38) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = v39;
  }
  unsigned int v112 = [v4 shouldUseUserTransformTiles];
  int v42 = [v4 shouldDisplayPlayButtons];
  uint64_t v43 = (double *)MEMORY[0x1E4F1DB30];
  if (v42)
  {
    [v4 playButtonSize];
    double v114 = v45;
    double v115 = v44;
  }
  else
  {
    double v114 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v115 = *MEMORY[0x1E4F1DB30];
  }
  if (![v4 shouldDisplayProgressIndicators] || v38)
  {
    double v110 = v43[1];
    double v111 = *v43;
  }
  else
  {
    [v4 progressIndicatorSize];
    double v110 = v47;
    double v111 = v46;
  }
  if ([v4 shouldDisplayPeopleRow])
  {
    [v4 peopleRowSize];
    double v108 = v49;
    double v109 = v48;
  }
  else
  {
    double v108 = v43[1];
    double v109 = *v43;
  }
  if ([v4 shouldDisplayProgressIndicators] && !v38)
  {
    [v4 progressIndicatorContentInsets];
    double v8 = v50;
    double v9 = v51;
    double v10 = v52;
    double v11 = v53;
  }
  if ([v4 shouldDisplayProgressIndicators])
  {
    [v4 renderIndicatorSize];
    double v106 = v55;
    double v107 = v54;
  }
  else
  {
    double v106 = v43[1];
    double v107 = *v43;
  }
  BOOL v113 = [v4 traitCollection];
  double v120 = v24;
  if (![v4 shouldDisplayBufferingIndicators] || v38)
  {
    double v102 = *v43;
    double v98 = v43[1];
  }
  else
  {
    [v4 bufferingIndicatorSize];
    double v102 = v56;
    double v98 = v57;
  }
  int v58 = [v4 canDisplayLoadingIndicators];
  [v4 secondScreenSize];
  double v96 = v60;
  double v97 = v59;
  [v127 interpageSpacing];
  double v62 = v61;
  unsigned int v103 = [v4 shouldPinContentToTop];
  if ([v4 shouldDisplayAssetExplorerReviewScreenProgressIndicators])
  {
    [v4 assetExplorerReviewScreenProgressIndicatorSize];
    double v104 = v64;
    double v105 = v63;
  }
  else
  {
    double v104 = v43[1];
    double v105 = *v43;
  }
  unsigned int v101 = [v4 shouldDisplayReviewScreenBars];
  unsigned int v100 = [v4 shouldLayoutReviewScreenControlBarVertically];
  int64_t v99 = [(PUOneUpViewController *)self _windowInterfaceOrientation];
  int v65 = [v126 isAccessoryViewVisible];
  if (!v5)
  {
    double v95 = 0;
    double v93 = 0.0;
    double v94 = 0.0;
    if (!v41) {
      goto LABEL_56;
    }
    goto LABEL_52;
  }
  double v66 = [(PUOneUpViewController *)self traitCollection];
  unint64_t v67 = [v66 userInterfaceStyle];

  if (v67 >= 2)
  {
    if (v67 != 2)
    {
      double v95 = 0;
      goto LABEL_51;
    }
    uint64_t v68 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v69 = [MEMORY[0x1E4F90300] sharedInstance];
    [v69 insetContentBorderOpacityDarkMode];
  }
  else
  {
    uint64_t v68 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v69 = [MEMORY[0x1E4F90300] sharedInstance];
    [v69 insetContentBorderOpacityLightMode];
  }
  double v95 = objc_msgSend(v68, "colorWithAlphaComponent:");

LABEL_51:
  long long v74 = [MEMORY[0x1E4F90300] sharedInstance];
  [v74 insetContentCornerRadius];
  double v94 = v75;

  long long v76 = [MEMORY[0x1E4F90300] sharedInstance];
  [v76 insetContentBorderWidth];
  double v93 = v77;

  if (!v41) {
    goto LABEL_56;
  }
LABEL_52:
  if (v65)
  {
    uint64_t v78 = [(PUOneUpViewController *)self _spec];
    int v79 = [v78 hideBadgesWhenShowingAccessoryView] ^ 1;
  }
  else
  {
    int v79 = 1;
  }
  uint64_t v41 = v79 & ~v5;
LABEL_56:
  uint64_t v80 = v58 & v40;
  unsigned int v92 = [v4 shouldDisplayAssetExplorerReviewScreenBadges] & v40;
  BOOL v81 = (([v4 shouldDisplaySelectionIndicators] & 1) != 0
      || [v125 isInSelectionMode])
     && v38 == 0;
  uint64_t v82 = [(PUOneUpViewController *)self browsingSession];
  char v83 = [v82 importStatusManager];
  if (v83) {
    BOOL v84 = v38 == 0;
  }
  else {
    BOOL v84 = 0;
  }

  if ([v4 shouldDisplaySyndicationAttribution])
  {
    v85 = [MEMORY[0x1E4F90090] sharedInstance];
    uint64_t v86 = [v85 showSyndicated1upPillUI] & v40 & v41;
  }
  else
  {
    uint64_t v86 = 0;
  }
  BOOL v87 = v38 != 0;
  v88 = (void *)MEMORY[0x1E4F90300];
  id v89 = v128;
  id v90 = [v88 sharedInstance];
  [v90 insetContentCornerRadius];
  objc_msgSend(v89, "setInsetContentCornerRadius:");

  double v91 = [MEMORY[0x1E4F90300] sharedInstance];
  [v91 minimumMarginForInsetContent];
  objc_msgSend(v89, "setMinimumMarginForInsetContent:");

  [v89 setUseBackgroundTile:1];
  [v89 setUseBadgeTiles:v41];
  [v89 setUseUserTransformTiles:v112];
  objc_msgSend(v89, "setContentGuideInsets:", v22, v120, v26, v28);
  objc_msgSend(v89, "setContentSafeInsets:", v116, v117, v118, v119);
  objc_msgSend(v89, "setContentDecorationAdditionalInsets:", v124, v123, v122, v121);
  objc_msgSend(v89, "setPlayButtonSize:", v115, v114);
  objc_msgSend(v89, "setProgressIndicatorSize:", v111, v110);
  objc_msgSend(v89, "setProgressIndicatorContentInsets:", v8, v9, v10, v11);
  objc_msgSend(v89, "setPeopleRowSize:", v109, v108);
  objc_msgSend(v89, "setBufferingIndicatorSize:", v102, v98);
  objc_msgSend(v89, "setRenderIndicatorSize:", v107, v106);
  [v89 setCanDisplayLoadingIndicators:v80];
  [v89 setTraitCollection:v113];
  objc_msgSend(v89, "setDisplaySizeForInsetMatching:", v97, v96);
  objc_msgSend(v89, "setInterpageSpacing:", v62, 0.0);
  objc_msgSend(v89, "setInterSectionSpacing:", v62, 0.0);
  [v89 setShouldPinContentToTop:v103];
  [v89 setUseAssetExplorerReviewScreenBadgeTiles:v92];
  [v89 setUseSelectionIndicatorTiles:v81];
  [v89 setUseImportStatusIndicatorTiles:v84];
  objc_msgSend(v89, "setAssetExplorerReviewScreenProgressIndicatorSize:", v105, v104);
  [v89 setUseReviewScreenBars:v101];
  [v89 setUseVerticalReviewScreenControlBarLayout:v100];
  [v89 setWindowInterfaceOrientation:v99];
  [v89 setShouldHideMainContent:v87];
  [v89 setUseSyndicationAttributionTile:v86];
  [v89 setInsetContentBorderColor:v95];
  [v89 setInsetContentCornerRadius:v94];
  [v89 setInsetContentBorderWidth:v93];

LABEL_67:
}

- (id)_newOneUpLayout
{
  BOOL v3 = [PUOneUpTilingLayout alloc];
  double v4 = [(PUOneUpViewController *)self browsingSession];
  int v5 = [v4 viewModel];
  double v6 = [v5 assetsDataSource];
  double v7 = [(PUSectionedTilingLayout *)v3 initWithDataSource:v6];

  [(PUOneUpTilingLayout *)v7 setDelegate:self];
  double v8 = [(PUOneUpViewController *)self _parallaxComputer];
  [(PUOneUpTilingLayout *)v7 setParallaxComputer:v8];

  [(PUOneUpViewController *)self _updateLayout:v7];
  return v7;
}

- (void)_setIrisPlaying:(BOOL)a3
{
  if (self->__isIrisPlaying != a3)
  {
    int v5 = [(PUOneUpViewController *)self _currentAssetViewModel];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __41__PUOneUpViewController__setIrisPlaying___block_invoke;
    v30[3] = &unk_1E5F2E120;
    id v6 = v5;
    id v31 = v6;
    BOOL v32 = a3;
    [v6 performChanges:v30];
    self->__isIrisPlaying = a3;
    [(PUOneUpViewController *)self _configureVitalityController];
    if (self->__isIrisPlaying)
    {
      double v7 = [(PUOneUpViewController *)self browsingSession];
      double v8 = [v7 viewModel];

      double v9 = +[PUOneUpSettings sharedInstance];
      BOOL v10 = PUShouldAutoHideChrome(v8, [v9 chromeAutoHideBehaviorOnLivePhoto]);

      if (v10)
      {
        double v11 = [v8 currentAssetReference];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        double v26 = __41__PUOneUpViewController__setIrisPlaying___block_invoke_2;
        double v27 = &unk_1E5F2ECC8;
        id v28 = v8;
        id v29 = v11;
        id v12 = v11;
        [v28 performChanges:&v24];
      }
      CGFloat v13 = [(PUOneUpViewController *)self _barsController];
      char v14 = [v13 tapGestureRecognizer];
      objc_msgSend(v14, "pu_cancel");

      uint64_t v15 = [(PUOneUpViewController *)self _doubleTapZoomController];
      uint64_t v16 = [v15 doubleTapGestureRecognizer];
      objc_msgSend(v16, "pu_cancel");

      double v17 = [(PUOneUpViewController *)self _accessoryVisibilityInteractionController];
      double v18 = [v17 panGestureRecognizer];
      objc_msgSend(v18, "pu_cancel");

      double v19 = [(PUOneUpViewController *)self gestureController];
      [v19 cancelGestures];

      double v20 = +[PUOneUpSettings sharedInstance];
      LODWORD(v18) = [v20 lockScrollDuringLivePhotoPlayback];

      if (v18)
      {
        double v21 = [(PUOneUpViewController *)self browsingSession];
        double v22 = [v21 viewModel];
        [v22 currentAssetTransitionProgress];
        if (PXFloatApproximatelyEqualToFloat())
        {
          double v23 = [(PUOneUpViewController *)self _tilingView];
          objc_msgSend(v23, "px_cancelScrollGesture");
        }
      }
    }
  }
}

uint64_t __41__PUOneUpViewController__setIrisPlaying___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsIrisPlaying:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __41__PUOneUpViewController__setIrisPlaying___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:0 changeReason:6 context:*(void *)(a1 + 40)];
}

- (void)_updateMergedVideoProviderEnabled
{
  BOOL v3 = [(PUOneUpViewController *)self appearState] == 2;
  id v5 = [(PUOneUpViewController *)self browsingSession];
  double v4 = [v5 mergedVideoProvider];
  [v4 setIsEnabled:v3];
}

- (void)setAppearState:(int)a3
{
  if (self->_appearState != a3)
  {
    self->_appearState = a3;
    [(PUOneUpViewController *)self _updateMergedVideoProviderEnabled];
  }
}

- (void)setUnlockDeviceStatus:(id)a3
{
  if (self->_unlockDeviceStatus != a3)
  {
    id v4 = a3;
    id v5 = (void *)[v4 copy];
    id unlockDeviceStatus = self->_unlockDeviceStatus;
    self->_id unlockDeviceStatus = v5;

    double v7 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
    [v7 setUnlockDeviceStatus:v4];

    id v8 = [(PUOneUpViewController *)self chromeViewController];
    [v8 invalidateIsDeviceUnlocked];
  }
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  if (self->_unlockDeviceHandlerWithActionType != a3)
  {
    id v4 = a3;
    id v5 = (void *)[v4 copy];
    id unlockDeviceHandlerWithActionType = self->_unlockDeviceHandlerWithActionType;
    self->_id unlockDeviceHandlerWithActionType = v5;

    id v7 = [(PUOneUpViewController *)self _accessoryViewControllersManager];
    [v7 setUnlockDeviceHandlerWithActionType:v4];
  }
}

- (void)_isPresentedForPreviewDidChange
{
  BOOL v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];
  int v5 = [v4 isPresentedForPreview];

  id v6 = [(PUOneUpViewController *)self view];
  [v6 setUserInteractionEnabled:v5 ^ 1u];

  if ((v5 & 1) == 0)
  {
    id v7 = [(PUOneUpViewController *)self _currentAssetViewModel];
    id v8 = [v7 videoPlayer];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke;
    v16[3] = &unk_1E5F2ED10;
    id v17 = v8;
    id v9 = v8;
    [v9 performChanges:v16];
  }
  [(PUOneUpViewController *)self _invalidateSpec];
  [(PUOneUpViewController *)self _invalidatePreferredContentSize];
  [(PUOneUpViewController *)self _invalidateBarsControllers];
  [(PUOneUpViewController *)self _invalidatePreloadInsets];
  [(PUOneUpViewController *)self _invalidateLayout];
  BOOL v10 = [(PUOneUpViewController *)self _barsController];
  [v10 invalidateViewHostingGestureRecognizers];

  [(PUOneUpViewController *)self _updateIfNeeded];
  [(PUOneUpViewController *)self px_setNeedsImageModulationIntensityUpdate];
  [(PUOneUpViewController *)self _updatePrefersHomeIndicatorHidden];
  double v11 = [(PUOneUpViewController *)self _currentAssetViewModel];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke_2;
  v13[3] = &unk_1E5F2E120;
  id v14 = v11;
  char v15 = v5;
  id v12 = v11;
  [v12 performChanges:v13];
}

uint64_t __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:1];
}

uint64_t __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPresentedForPreview:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_setLayoutSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->__layoutSafeAreaInsets.left != a3.left
    || self->__layoutSafeAreaInsets.top != a3.top
    || self->__layoutSafeAreaInsets.right != a3.right
    || self->__layoutSafeAreaInsets.bottom != a3.bottom)
  {
    self->__layoutSafeAreaInsets = a3;
    [(PUOneUpViewController *)self _invalidateLayout];
    id v7 = [(PUOneUpViewController *)self _barsController];
    [v7 invalidateContentGuideInsets];
  }
}

- (void)_setWindowInterfaceOrientation:(int64_t)a3
{
  if (self->__windowInterfaceOrientation != a3)
  {
    self->__windowInterfaceOrientation = a3;
    id v4 = [(PUOneUpViewController *)self _spec];
    int v5 = [v4 shouldDisplayReviewScreenBars];

    if (v5) {
      [(PUOneUpViewController *)self _invalidateLayout];
    }
    id v6 = [(PUOneUpViewController *)self _barsController];
    [v6 invalidateContentGuideInsets];
  }
}

- (void)_updateWindowInterfaceOrientation
{
  BOOL v3 = [(PUOneUpViewController *)self view];
  id v6 = [v3 window];

  if ([v6 isRotating]) {
    uint64_t v4 = [v6 _toWindowOrientation];
  }
  else {
    uint64_t v4 = [v6 _windowInterfaceOrientation];
  }
  uint64_t v5 = v4;
  if (v4 || (uint64_t v5 = [v6 _windowInterfaceOrientation]) != 0) {
    [(PUOneUpViewController *)self _setWindowInterfaceOrientation:v5];
  }
}

- (void)_setLayoutReferenceSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.width != self->__layoutReferenceSize.width || a3.height != self->__layoutReferenceSize.height)
  {
    self->__layoutReferenceSize = a3;
    [(PUOneUpViewController *)self _invalidateSpec];
    id v7 = [(PUOneUpViewController *)self _barsController];
    [v7 invalidateViewControllerView];

    [(PUOneUpViewController *)self _updateIfNeeded];
    if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
    {
      id v8 = [(PUOneUpViewController *)self browsingSession];
      id v9 = [v8 viewModel];

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __49__PUOneUpViewController__setLayoutReferenceSize___block_invoke;
      v11[3] = &unk_1E5F2A1D0;
      id v12 = v9;
      CGFloat v13 = width;
      CGFloat v14 = height;
      id v10 = v9;
      [v10 performChanges:v11];
    }
  }
}

uint64_t __49__PUOneUpViewController__setLayoutReferenceSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSecondScreenSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_updateLayoutReferenceSize
{
  [(PUOneUpViewController *)self _pendingViewTransitionSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id v10 = [(PUOneUpViewController *)self view];
    [v10 bounds];
    double v7 = v11;
    double v9 = v12;
  }
  else
  {
    [(PUOneUpViewController *)self _pendingViewTransitionSize];
    double v7 = v6;
    double v9 = v8;
  }
  -[PUOneUpViewController _setLayoutReferenceSize:](self, "_setLayoutReferenceSize:", v7, v9);
}

- (void)_setTilingView:(id)a3
{
  uint64_t v5 = (PUTilingView *)a3;
  p_tilingView = &self->__tilingView;
  tilingView = self->__tilingView;
  if (tilingView != v5)
  {
    [(PUTilingView *)tilingView setTileSource:0];
    [(PUTilingView *)*p_tilingView setTileTransitionDelegate:0];
    [(PUTilingView *)*p_tilingView setScrollDelegate:0];
    [(PUTilingView *)*p_tilingView setDelegate:0];
    objc_storeStrong((id *)&self->__tilingView, a3);
    if ((PLIsSpotlight() & 1) == 0)
    {
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v16[0] = *MEMORY[0x1E4F1DAB8];
      v16[1] = v8;
      void v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(PUTilingView *)v5 setTransform:v16];
      double v9 = [(PUOneUpViewController *)self contentContainerView];
      [v9 bounds];
      -[PUTilingView setFrame:](v5, "setFrame:");
    }
    [(PUTilingView *)*p_tilingView setTileSource:self];
    [(PUTilingView *)*p_tilingView setTileTransitionDelegate:self];
    [(PUTilingView *)*p_tilingView setScrollDelegate:self];
    [(PUTilingView *)*p_tilingView setDelegate:self];
    [(PUTilingView *)*p_tilingView setAccessibilityIdentifier:@"OneUpMainPagingView"];
    [(PUTilingView *)*p_tilingView setShowsHorizontalScrollIndicator:0];
    [(PUTilingView *)*p_tilingView setShowsVerticalScrollIndicator:0];
    [(PUTilingView *)*p_tilingView _setAutoScrollEnabled:0];
    [(PUOneUpViewController *)self _invalidatePreloadInsets];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUBackgroundTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUUserTransformTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUBadgeTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUPlayButtonViewReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUProgressIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUPeopleTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PURenderIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUImportStatusIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUBufferingIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PULoadingIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUAccessoryTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUVideoPlaceholderTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUAssetExplorerReviewScreenBadgeTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUSelectionIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUAssetExplorerReviewScreenProgressIndicatorTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUReviewScreenTopBarTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUReviewScreenControlBarTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUReviewScreenScrubberBarTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PULivePhotoVideoPlaybackTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUSyndicationAttributionTileReuseIdentifier"];
    [(PUTilingView *)*p_tilingView registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUCropButtonTileReuseIdentifier"];
    id v10 = [(PUOneUpViewController *)self _interactiveSwipeDismissalController];
    [v10 invalidateDelegateData];

    double v11 = [(PUOneUpViewController *)self _interactivePinchDismissalController];
    [v11 invalidateDelegateData];

    double v12 = [(PUOneUpViewController *)self _barsController];
    [v12 invalidateViewHostingGestureRecognizers];

    CGFloat v13 = [(PUOneUpViewController *)self _gestureRecognizerCoordinator];
    [v13 invalidateViewHostingGestureRecognizers];

    CGFloat v14 = [(PUOneUpViewController *)self _doubleTapZoomController];
    [v14 invalidateViewHostingGestureRecognizers];

    char v15 = [(PUOneUpViewController *)self _accessoryVisibilityInteractionController];
    [v15 invalidateViewHostingGestureRecognizers];

    [(PUOneUpViewController *)self _configureVitalityController];
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUOneUpViewController *)self _needsUpdateSpec]
    || [(PUOneUpViewController *)self _needsUpdateBarsController]
    || [(PUOneUpViewController *)self _needsUpdatePreloadInsets]
    || [(PUOneUpViewController *)self _needsUpdateLayout]
    || [(PUOneUpViewController *)self _needsUpdateEditMode]
    || [(PUOneUpViewController *)self _needsUpdatePreferredContentSize]
    || [(PUOneUpViewController *)self _needsUpdateVideoPlayer]
    || [(PUOneUpViewController *)self _needsUpdateTipsPopover]
    || [(PUOneUpViewController *)self _needsUpdateUserActivity]
    || [(PUOneUpViewController *)self _needsUpdateAccessoryView]
    || [(PUOneUpViewController *)self needsUpdateChromeViewController])
  {
    return 1;
  }
  return [(PUOneUpViewController *)self _needsUpdateImageAnalysisInteractionAdditionalActionInfoEdgeInsets];
}

- (void)_updateIfNeeded
{
  if ([(PUOneUpViewController *)self _needsUpdate])
  {
    [(PUOneUpViewController *)self _updateSpecIfNeeded];
    [(PUOneUpViewController *)self _updateAccessoryViewIfNeeded];
    [(PUOneUpViewController *)self _updateBarsControllerIfNeeded];
    [(PUOneUpViewController *)self _updatePreloadInsetsIfNeeded];
    [(PUOneUpViewController *)self _updateLayoutIfNeeded];
    [(PUOneUpViewController *)self _updateEditModeIfNeeded];
    [(PUOneUpViewController *)self _updatePreferredContentSizeIfNeeded];
    [(PUOneUpViewController *)self _updateVideoPlayerIfNeeded];
    [(PUOneUpViewController *)self _updateTipPopoversIfNeeded];
    [(PUOneUpViewController *)self _updateUserActivityIfNeeded];
    [(PUOneUpViewController *)self _updateChromeViewControllerIfNeeded];
    [(PUOneUpViewController *)self _updateImageAnalysisInteractionAdditionalActionInfoEdgeInsetsIfNeeded];
    if ([(PUOneUpViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUOneUpViewController.m" lineNumber:1100 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_setPrefersHomeIndicatorHidden:(BOOL)a3
{
  if (self->__prefersHomeIndicatorHidden != a3)
  {
    self->__prefersHomeIndicatorHidden = a3;
    [(PUOneUpViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

- (void)_updatePrefersHomeIndicatorHidden
{
  double v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];

  -[PUOneUpViewController _setPrefersHomeIndicatorHidden:](self, "_setPrefersHomeIndicatorHidden:", ([v4 isPresentedForPreview] | objc_msgSend(v4, "isChromeVisible")) ^ 1);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PUOneUpViewController *)self _updateWindowInterfaceOrientation];
}

- (id)contentScrollView
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v100.receiver = self;
  v100.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewWillTransitionToSize:withTransitionCoordinator:](&v100, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUOneUpViewController _setPendingViewTransitionSize:](self, "_setPendingViewTransitionSize:", width, height);
  [(PUOneUpViewController *)self _updateLayoutReferenceSize];
  [(PUOneUpViewController *)self _updateWindowInterfaceOrientation];
  long long v8 = (void *)MEMORY[0x1E4F903D8];
  double v9 = [MEMORY[0x1E4F903D8] infoPanelTipID];
  [v8 setTip:v9 isPresentable:0];

  id v10 = (void *)MEMORY[0x1E4F903D8];
  double v11 = [MEMORY[0x1E4F903D8] livePhotosTipID];
  [v10 setTip:v11 isPresentable:0];

  double v12 = (void *)MEMORY[0x1E4F903D8];
  CGFloat v13 = [MEMORY[0x1E4F903D8] actionsMenuTipID];
  [v12 setTip:v13 isPresentable:0];

  CGFloat v14 = (void *)MEMORY[0x1E4F903D8];
  char v15 = [MEMORY[0x1E4F903D8] syndicatedPhotosTipID];
  [v14 setTip:v15 isPresentable:0];

  uint64_t v16 = (void *)MEMORY[0x1E4F903D8];
  id v17 = [MEMORY[0x1E4F903D8] quickCropTipID];
  [v16 setTip:v17 isPresentable:0];

  double v18 = [(PUOneUpViewController *)self browsingSession];
  double v19 = [v18 viewModel];

  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v98[3] = &unk_1E5F2ED10;
  id v20 = v19;
  id v99 = v20;
  [v20 performChanges:v98];
  double v21 = [(PUOneUpViewController *)self _spec];
  int v22 = [v21 shouldCounterrotateReviewScreenBars];

  if (v22)
  {
    uint64_t v68 = v7;
    double v23 = [(PUOneUpViewController *)self _reviewScreenTopBarTileViewController];
    double v66 = [(PUOneUpViewController *)self _reviewScreenControlBarTileViewController];
    uint64_t v24 = [v66 view];
    unint64_t v67 = v23;
    uint64_t v25 = [v23 view];
    double v26 = [v24 snapshotViewAfterScreenUpdates:0];
    double v27 = [v25 snapshotViewAfterScreenUpdates:0];
    id v28 = [(PUOneUpViewController *)self view];
    [v28 bounds];
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;

    uint64_t v65 = v30;
    UIRectGetCenter();
    uint64_t v63 = v38;
    uint64_t v64 = v37;
    unsigned int v39 = [(PUOneUpViewController *)self view];
    BOOL v40 = [v39 window];
    uint64_t v41 = [v40 _toWindowOrientation];

    int v42 = [(PUOneUpViewController *)self view];
    uint64_t v43 = [v42 window];
    uint64_t v44 = [v43 _fromWindowOrientation];

    double v45 = 0.0;
    double v46 = 0.0;
    if (v41 != 1)
    {
      if (v41 == 3)
      {
        double v46 = 1.57079633;
      }
      else if (v41 == 4)
      {
        double v46 = -1.57079633;
      }
      else
      {
        double v46 = 3.14159265;
        if (v41 != 2) {
          double v46 = 0.0;
        }
      }
    }
    if (v44 != 1)
    {
      switch(v44)
      {
        case 3:
          double v45 = 1.57079633;
          break;
        case 4:
          double v45 = -1.57079633;
          break;
        case 2:
          double v45 = 3.14159265;
          break;
        default:
          double v45 = 0.0;
          break;
      }
    }
    double v48 = v45 - v46;
    double v49 = objc_alloc_init(PUReviewScreenBarsSnapshot);
    [(PUReviewScreenBarsSnapshot *)v49 addSubview:v26];
    [(PUReviewScreenBarsSnapshot *)v49 addSubview:v27];
    double v50 = [(PUOneUpViewController *)self view];
    [v50 addSubview:v49];

    double v51 = (void *)MEMORY[0x1E4FB1EB0];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v85[3] = &unk_1E5F27E50;
    double v52 = v49;
    uint64_t v91 = v65;
    uint64_t v92 = v32;
    uint64_t v93 = v34;
    uint64_t v94 = v36;
    uint64_t v95 = v64;
    uint64_t v96 = v63;
    uint64_t v86 = v52;
    id v87 = v26;
    id v53 = v24;
    double v97 = v45;
    id v88 = v53;
    id v89 = v27;
    id v54 = v25;
    id v90 = v54;
    id v55 = v27;
    id v56 = v26;
    [v51 performWithoutAnimation:v85];
    [v53 setHidden:1];
    [v54 setHidden:1];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v79[3] = &unk_1E5F27E78;
    double v82 = v48;
    double v83 = width;
    double v84 = height;
    uint64_t v80 = v52;
    BOOL v81 = self;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
    v73[3] = &unk_1E5F28D48;
    id v74 = v20;
    double v75 = v80;
    id v76 = v53;
    id v77 = v54;
    uint64_t v78 = self;
    id v57 = v54;
    id v58 = v53;
    double v59 = v80;
    [v68 animateAlongsideTransition:v79 completion:v73];

    id v7 = v68;
    double v47 = v67;
  }
  else
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
    v72[3] = &unk_1E5F2B9D0;
    v72[4] = self;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_7;
    v69[3] = &unk_1E5F28AE8;
    id v70 = v20;
    double v71 = self;
    [v7 animateAlongsideTransition:v72 completion:v69];
    double v47 = v70;
  }

  double v60 = [(PUOneUpViewController *)self view];
  double v61 = [v60 window];
  if ((unint64_t)([v61 _toWindowOrientation] - 3) <= 1
    && [(PUOneUpViewController *)self _isAccessoryVisible])
  {
    int64_t v62 = [(PUOneUpViewController *)self _accessoryContentKindForCurrentAsset];

    if (v62 == 1) {
      [(PUOneUpEventTracker *)self->_eventTracker logInfoPanelRotatedToHorizontalView];
    }
  }
  else
  {
  }
  [(PUOneUpViewController *)self _updateIfNeeded];
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingPresentationSize:1];
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  [*(id *)(a1 + 48) bounds];
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  [*(id *)(a1 + 48) center];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  CGAffineTransformMakeRotation(&v8, -*(double *)(a1 + 120));
  uint64_t v2 = *(void **)(a1 + 40);
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];
  [*(id *)(a1 + 64) bounds];
  objc_msgSend(*(id *)(a1 + 56), "setBounds:");
  [*(id *)(a1 + 64) center];
  objc_msgSend(*(id *)(a1 + 56), "setCenter:");
  CGAffineTransformMakeRotation(&v6, -*(double *)(a1 + 120));
  double v3 = *(void **)(a1 + 56);
  CGAffineTransform v5 = v6;
  return [v3 setTransform:&v5];
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setZRotation:*(double *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56) * 0.5, *(double *)(a1 + 64) * 0.5);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _invalidateInfoPanelLayoutAnimated:1];
}

void __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
  v3[3] = &unk_1E5F2ED10;
  id v4 = v2;
  [v4 performChanges:v3];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) setHidden:0];
  [*(id *)(a1 + 56) setHidden:0];
  [*(id *)(a1 + 64) _invalidateTipPopovers];
  [*(id *)(a1 + 64) _updateTipPopoversIfNeeded];
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateInfoPanelLayoutAnimated:1];
}

void __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_8;
  v4[3] = &unk_1E5F2ED10;
  id v5 = v2;
  [v5 performChanges:v4];
  double v3 = [*(id *)(a1 + 40) _barsController];
  [v3 invalidateContentGuideInsets];

  [*(id *)(a1 + 40) _invalidateTipPopovers];
  [*(id *)(a1 + 40) _invalidateLayout];
  [*(id *)(a1 + 40) _updateTipPopoversIfNeeded];
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingPresentationSize:0];
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingPresentationSize:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)wantsSpotlightStyling
{
  uint64_t v2 = [(PUOneUpViewController *)self _spec];
  char v3 = [v2 shouldUseSpotlightStyling];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v21 traitCollectionDidChange:v4];
  id v5 = [(PUOneUpViewController *)self traitCollection];
  CGAffineTransform v6 = [(PUOneUpViewController *)self browsingSession];
  CGAffineTransform v7 = [v6 viewModel];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __50__PUOneUpViewController_traitCollectionDidChange___block_invoke;
  double v18 = &unk_1E5F2ECC8;
  id v19 = v7;
  id v8 = v5;
  id v20 = v8;
  id v9 = v7;
  [v9 performChanges:&v15];
  id v10 = [(PUOneUpViewController *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  uint64_t v12 = [v8 horizontalSizeClass];
  uint64_t v13 = [v4 horizontalSizeClass];
  if (v11 == 1 && v12 != v13)
  {
    [(PUOneUpViewController *)self _invalidateBarsControllers];
    [(PUOneUpViewController *)self _invalidateAccessoryView];
    [(PUOneUpViewController *)self _setAccessoryVisible:0];
  }
  uint64_t v14 = [v4 userInterfaceStyle];
  if (v14 != [v8 userInterfaceStyle]) {
    [(PUOneUpViewController *)self _invalidateLayout];
  }
  [(PUOneUpViewController *)self _invalidateSpec];
  [(PUOneUpViewController *)self _updateIfNeeded];
}

uint64_t __50__PUOneUpViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = PXUserInterfaceSizeClassFromUITraitCollection();
  char v3 = *(void **)(a1 + 32);
  return [v3 setHorizontalSizeClass:v2];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v9 viewWillLayoutSubviews];
  char v3 = [(PUOneUpViewController *)self _barsController];
  [v3 updateIfNeeded];

  id v4 = [(PUOneUpViewController *)self view];
  [v4 safeAreaInsets];
  [(PUOneUpViewController *)self _setLayoutSafeAreaInsets:"_setLayoutSafeAreaInsets:"];

  -[PUOneUpViewController _setPendingViewTransitionSize:](self, "_setPendingViewTransitionSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(PUOneUpViewController *)self _updateLayoutReferenceSize];
  id v5 = [(PUOneUpViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  [(PUOneUpViewController *)self _preloadInsetsBasedOffViewWidth];
  if (v7 != v8)
  {
    [(PUOneUpViewController *)self _setPreloadInsetsBasedOffViewWidth:v7];
    [(PUOneUpViewController *)self _invalidatePreloadInsets];
    [(PUOneUpViewController *)self _updatePreloadInsetsIfNeeded];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v20 viewDidDisappear:a3];
  id v4 = PLOneUpGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEBUG, "1Up signpost: 1Up viewController viewDidDisappear", v19, 2u);
  }

  [(PUOneUpViewController *)self _xct_endSignpostingForImageTileImageLoadingAndProcessing];
  id v5 = [(PUOneUpViewController *)self presentedViewController];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ([(PUOneUpViewController *)self _isPresentedForSecondScreen]
      || (isKindOfClass & 1) != 0)
    {
      goto LABEL_10;
    }
  }
  else if ([(PUOneUpViewController *)self _isPresentedForSecondScreen])
  {
    goto LABEL_10;
  }
  double v7 = [(PUOneUpViewController *)self browsingSession];
  double v8 = [v7 viewModel];
  char v9 = [v8 isPresentedForPreview];

  if ((v9 & 1) == 0)
  {
    id v10 = +[PHAirPlayScreenController sharedInstance];
    [v10 unregisterContentProvider:self];
  }
LABEL_10:
  uint64_t v11 = [MEMORY[0x1E4F91280] defaultManager];
  [v11 unregisterObserver:self];

  uint64_t v12 = [(PUOneUpViewController *)self eventTracker];
  [v12 logViewControllerDidDisappear:self];

  uint64_t v13 = PXContentPrivacyNavigationStateFromViewController();
  if (v13 == 2)
  {
    uint64_t v14 = [(PUOneUpViewController *)self navigationController];
    uint64_t v15 = [v14 viewControllers];
    BOOL v16 = [v15 count] != 1;

    uint64_t v13 = 2 * v16;
  }
  id v17 = [(PUOneUpViewController *)self browsingSession];
  double v18 = [v17 privacyController];
  [v18 viewDidDisappearForAuthenticationContext:self withNavigationState:v13];

  [(PUOneUpViewController *)self setAppearState:0];
  [(PUOneUpViewController *)self _updateIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v9 viewWillDisappear:a3];
  id v4 = [(PUOneUpViewController *)self browsingOneUpVisibilityHelper];
  [v4 setIsOneUpVisible:0];

  id v5 = [(PUOneUpViewController *)self visualImageAnalyzingController];
  [v5 setIsEnabled:0];

  [(PUOneUpViewController *)self _cancelTimedChromeAutoHide];
  [(PUOneUpViewController *)self setAppearState:3];
  [(PUOneUpViewController *)self _updateIfNeeded];
  if ([(PUOneUpViewController *)self _isTipPopoverVisible]) {
    [(PUOneUpViewController *)self _dismissTipPopoverAnimated:0];
  }
  [MEMORY[0x1E4F903D8] setTipsPresentationDelegate:0];
  double v6 = [(PUOneUpViewController *)self view];
  double v7 = [v6 window];
  double v8 = [v7 windowScene];
  [v8 setUserActivity:0];

  PXUnregisterAppIntentsViewAnnotationDelegate();
}

- (BOOL)_isAssetEligibleForTip:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (objc_msgSend(v4, "px_isScreenshot")) {
      LOBYTE(v5) = 0;
    }
    else {
      int v5 = objc_msgSend(v4, "px_isScreenRecording") ^ 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v45.receiver = self;
  v45.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v45 viewDidAppear:a3];
  id v4 = PLOneUpGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEBUG, "1Up signpost: 1Up viewController viewDidAppear", buf, 2u);
  }

  [(PUOneUpViewController *)self _xct_beginSignpostingForImageTileImageLoadingAndProcessing];
  int v5 = [(PUOneUpViewController *)self browsingOneUpVisibilityHelper];
  [v5 setIsOneUpVisible:1];

  double v6 = [(PUOneUpViewController *)self visualImageAnalyzingController];
  [v6 setIsEnabled:1];

  double v7 = [(PUOneUpViewController *)self browsingSession];
  double v8 = [v7 viewModel];
  char v9 = [v8 isPresentedForPreview];

  BOOL v10 = [(PUOneUpViewController *)self _isPresentedForSecondScreen];
  if (!v10 && (v9 & 1) == 0)
  {
    uint64_t v11 = +[PHAirPlayScreenController sharedInstance];
    [v11 registerContentProvider:self];
  }
  uint64_t v12 = [MEMORY[0x1E4F91280] defaultManager];
  [v12 registerObserver:self];

  [(PUOneUpViewController *)self _scheduleTimedChromeAutoHide];
  uint64_t v13 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v14 = [v13 viewModel];

  uint64_t v15 = [v14 assetViewModelForCurrentAssetReference];
  BOOL v16 = [v15 asset];
  BOOL v17 = [v16 playbackStyle] == 5;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __39__PUOneUpViewController_viewDidAppear___block_invoke;
  v38[3] = &unk_1E5F27E28;
  id v18 = v14;
  id v39 = v18;
  BOOL v40 = self;
  BOOL v42 = v10;
  BOOL v43 = v17;
  id v19 = v15;
  id v41 = v19;
  [v18 performChanges:v38];
  [(PUOneUpViewController *)self _setShouldDisableTransitionsUntilAppeared:0];
  objc_super v20 = [(PUOneUpViewController *)self eventTracker];
  [v20 logViewControllerDidAppear:self];

  [(PUOneUpViewController *)self setAppearState:2];
  [(PUOneUpViewController *)self _invalidateTipPopovers];
  [(PUOneUpViewController *)self _invalidateUserActivity];
  [(PUOneUpViewController *)self _invalidateCachedBoopableItemProvider];
  [(PUOneUpViewController *)self _updateIfNeeded];
  uint64_t v21 = [(PUOneUpViewController *)self editActivityCompletion];
  int v22 = (void *)v21;
  if (self->_actionTypeToPerformInViewDidAppear)
  {
    double v23 = [(PUOneUpViewController *)self actionsController];
    [v23 performSimpleActionWithActionType:self->_actionTypeToPerformInViewDidAppear];

    self->_actionTypeToPerformInViewDidAppear = 0;
    if (v22)
    {
      uint64_t v24 = [(PUOneUpViewController *)self navigationController];
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      uint64_t v34 = __39__PUOneUpViewController_viewDidAppear___block_invoke_3;
      uint64_t v35 = &unk_1E5F2EA60;
      id v36 = v24;
      id v37 = v22;
      id v25 = v24;
      objc_msgSend(v25, "ppt_performBlockAfterNextNavigationAnimation:", &v32);

LABEL_10:
      -[PUOneUpViewController setEditActivityCompletion:](self, "setEditActivityCompletion:", 0, v32, v33, v34, v35);
    }
  }
  else if (v21)
  {
    goto LABEL_10;
  }
  BOOL v26 = [(PUOneUpViewController *)self _isAssetEligibleForTip:v16];
  double v27 = [(PUOneUpViewController *)self _barsController];
  id v28 = [v27 barButtonItemToggleDetails];

  if (v28 && v26) {
    [MEMORY[0x1E4F903D8] signalOneUpPhotoOpened];
  }
  +[PUPhotoEditViewController preheatEditDependenciesIfNeeded];
  uint64_t v29 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v30 = [v29 privacyController];
  [v30 viewDidAppearForAuthenticationContext:self];

  uint64_t v31 = [(PUOneUpViewController *)self view];
  PXAppIntentsRegisterViewAnnotationView();

  PXRegisterAppIntentsViewAnnotationDelegate();
}

void __39__PUOneUpViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimatingPresentationSize:0];
  uint64_t v2 = [*(id *)(a1 + 40) _spec];
  if ([v2 shouldAutoplayOnAppear] && !*(unsigned char *)(a1 + 56))
  {

    goto LABEL_6;
  }
  int v3 = *(unsigned __int8 *)(a1 + 57);

  if (v3)
  {
LABEL_6:
    id v4 = [*(id *)(a1 + 48) videoPlayer];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__PUOneUpViewController_viewDidAppear___block_invoke_2;
    v7[3] = &unk_1E5F2ED10;
    id v8 = v4;
    id v5 = v4;
    [v5 performChanges:v7];
    double v6 = [*(id *)(a1 + 48) irisPlayer];
    [v6 playPreviewHintWhenReady];
  }
}

void __39__PUOneUpViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "px_descendantViewControllerWithClass:", objc_opt_class());
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ppt_setEditIsReadyNotificationBlock:", *(void *)(a1 + 40));
}

uint64_t __39__PUOneUpViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:4 reason:@"1-Up configured to auto-play on appearance."];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewWillAppear:](&v25, sel_viewWillAppear_);
  [(PUOneUpViewController *)self _updateLayoutReferenceSize];
  [(PUOneUpViewController *)self _updateWindowInterfaceOrientation];
  [(PUOneUpViewController *)self _invalidateSpec];
  id v5 = [(PUOneUpViewController *)self _barsController];
  [v5 invalidateViewControllerView];
  if (([(PUOneUpViewController *)self isBeingPresented] & 1) != 0
    || [(PUOneUpViewController *)self isMovingToParentViewController])
  {
    [(PUOneUpViewController *)self _invalidateBarsControllers];
  }
  [(PUOneUpViewController *)self _updateIfNeeded];
  [v5 updateIfNeeded];
  double v6 = [(PUOneUpViewController *)self _spec];
  uint64_t v7 = v3 & ~[v6 shouldDisableNavigationBarsVisibility];

  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v7];
  [v5 invalidateViewControllerView];
  [v5 updateIfNeeded];
  id v8 = [(PUOneUpViewController *)self _interactiveSwipeDismissalController];
  [v8 invalidateDelegateData];

  char v9 = [(PUOneUpViewController *)self _interactivePinchDismissalController];
  [v9 invalidateDelegateData];

  BOOL v10 = [(PUOneUpViewController *)self browsingSession];
  uint64_t v11 = [v10 viewModel];
  uint64_t v12 = [v11 currentAssetReference];
  uint64_t v13 = [v11 assetViewModelForAssetReference:v12];
  uint64_t v14 = [v13 irisPlayer];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __40__PUOneUpViewController_viewWillAppear___block_invoke;
  v21[3] = &unk_1E5F2E908;
  id v22 = v11;
  double v23 = self;
  id v24 = v14;
  id v15 = v14;
  id v16 = v11;
  [v16 performChanges:v21];
  unint64_t v17 = [(PUOneUpViewController *)self _initialActivity];
  if (v17 == 2)
  {
    id v18 = [(PUOneUpViewController *)self actionsController];
    [v18 performSimpleActionWithActionType:49];
  }
  else if (v17 == 1)
  {
    self->_actionTypeToPerformInViewDidAppear = 15;
  }
  id v19 = [(PUOneUpViewController *)self _interactivePinchDismissalController];
  [v19 viewControllerWillAppear];

  objc_super v20 = [(PUOneUpViewController *)self _interactiveSwipeDismissalController];
  [v20 viewControllerWillAppear];

  [MEMORY[0x1E4F903D8] setTipsPresentationDelegate:self];
  [(PUOneUpViewController *)self _setInitialActivity:0];
  [(PUOneUpViewController *)self setAppearState:1];
}

void __40__PUOneUpViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVideoContentAllowed:1 forReason:@"OneUpVisibility"];
  [*(id *)(a1 + 32) setIsAnimatingPresentationSize:1];
  id v2 = [*(id *)(a1 + 40) _spec];
  if (![v2 shouldAutoplayOnAppear])
  {

    goto LABEL_5;
  }
  char v3 = [*(id *)(a1 + 40) _isPresentedForSecondScreen];

  if (v3)
  {
LABEL_5:
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __40__PUOneUpViewController_viewWillAppear___block_invoke_3;
    uint64_t v12 = &unk_1E5F2ED10;
    id v5 = &v13;
    id v6 = v8;
    id v13 = v6;
    uint64_t v7 = &v9;
    goto LABEL_6;
  }
  id v4 = *(void **)(a1 + 48);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __40__PUOneUpViewController_viewWillAppear___block_invoke_2;
  unint64_t v17 = &unk_1E5F2ED10;
  id v5 = &v18;
  id v6 = v4;
  id v18 = v6;
  uint64_t v7 = &v14;
LABEL_6:
  objc_msgSend(v6, "performChanges:", v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
}

void __40__PUOneUpViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) player];
  [v1 prepareForHintWhenReady];
}

uint64_t __40__PUOneUpViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:0];
}

- (void)viewDidLoad
{
  v53[4] = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v52 viewDidLoad];
  char v3 = [(PUOneUpViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v3 bounds];
  id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v5;

  [(UIView *)self->_contentContainerView setAutoresizingMask:18];
  [v3 addSubview:self->_contentContainerView];
  if (![(PUOneUpViewController *)self _isPresentedForSecondScreen]) {
    [(PUOneUpViewController *)self px_enableImageModulation];
  }
  if (([(PUOneUpViewController *)self _options] & 1) == 0)
  {
    id v7 = [(PUOneUpViewController *)self _newOneUpLayout];
    id v8 = [PUTilingView alloc];
    [v3 bounds];
    uint64_t v9 = -[PUTilingView initWithFrame:layout:](v8, "initWithFrame:layout:", v7);
    [(PUTilingView *)v9 setAutoresizingMask:18];
    uint64_t v10 = [(PUOneUpViewController *)self contentContainerView];
    [v10 addSubview:v9];

    uint64_t v11 = [(PUOneUpViewController *)self browsingSession];
    [v11 configureTilingView:v9];
    if (![(PUOneUpViewController *)self _isPresentedForSecondScreen]) {
      [(PUTilingView *)v9 configureDynamicRangeProperties];
    }
    [(PUOneUpViewController *)self _setTilingView:v9];
    [(PUOneUpViewController *)self _updateLayoutReferenceSize];
  }
  uint64_t v12 = +[PURootSettings sharedInstance];
  [v12 addDeferredKeyObserver:self];

  id v13 = +[PUIrisSettings sharedInstance];
  [v13 addDeferredKeyObserver:self];

  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    uint64_t v14 = [PUOneUpGestureController alloc];
    uint64_t v15 = [(PUOneUpViewController *)self actionsController];
    id v16 = [(PUOneUpGestureController *)v14 initWithView:v3 actionsController:v15];
    gestureController = self->_gestureController;
    self->_gestureController = v16;

    [(PUOneUpGestureController *)self->_gestureController setDelegate:self];
    id v18 = [PUOneUpFeedbackController alloc];
    id v19 = [(PUOneUpViewController *)self browsingSession];
    objc_super v20 = [v19 viewModel];
    uint64_t v21 = [(PUOneUpFeedbackController *)v18 initWithViewModel:v20];
    feedbackController = self->_feedbackController;
    self->_feedbackController = v21;
  }
  double v23 = [(PUOneUpViewController *)self chromeViewController];

  if (v23)
  {
    id v24 = [(PUOneUpViewController *)self view];
    objc_super v25 = [(PUOneUpViewController *)self chromeViewController];
    BOOL v26 = [v25 view];

    double v27 = [(PUOneUpViewController *)self chromeViewController];
    [v27 willMoveToParentViewController:self];

    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 addSubview:v26];
    objc_super v45 = (void *)MEMORY[0x1E4F28DC8];
    double v50 = [v26 leadingAnchor];
    double v49 = [v24 leadingAnchor];
    double v48 = [v50 constraintEqualToAnchor:v49];
    v53[0] = v48;
    double v47 = [v26 trailingAnchor];
    double v46 = [v24 trailingAnchor];
    uint64_t v44 = [v47 constraintEqualToAnchor:v46];
    v53[1] = v44;
    id v28 = [v26 topAnchor];
    [v24 topAnchor];
    uint64_t v29 = v51 = v3;
    uint64_t v30 = [v28 constraintEqualToAnchor:v29];
    v53[2] = v30;
    uint64_t v31 = [v26 bottomAnchor];
    uint64_t v32 = [v24 bottomAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32];
    v53[3] = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
    [v45 activateConstraints:v34];

    char v3 = v51;
    uint64_t v35 = [(PUOneUpViewController *)self chromeViewController];
    [(PUOneUpViewController *)self addChildViewController:v35];

    id v36 = [(PUOneUpViewController *)self chromeViewController];
    [v36 didMoveToParentViewController:self];
LABEL_13:

    goto LABEL_14;
  }
  id v37 = [(PUOneUpViewController *)self navigationController];
  id v24 = [v37 navigationBar];

  uint64_t v38 = [v24 standardAppearance];
  [v24 setScrollEdgeAppearance:v38];

  id v39 = [(PUOneUpViewController *)self navigationController];
  BOOL v26 = [v39 toolbar];

  BOOL v40 = [v26 standardAppearance];
  [v26 setScrollEdgeAppearance:v40];

  if (([(PUOneUpViewController *)self _options] & 0x100000) != 0)
  {
    id v36 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v36 configureWithOpaqueBackground];
    id v41 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v36 setBackgroundColor:v41];

    [v24 setScrollEdgeAppearance:v36];
    id v42 = objc_alloc_init(MEMORY[0x1E4FB1DF8]);
    [v42 configureWithOpaqueBackground];
    BOOL v43 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v42 setBackgroundColor:v43];

    [v26 setScrollEdgeAppearance:v42];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(PUOneUpViewController *)self setView:v3];
}

- (void)dealloc
{
  PXUnregisterPreferencesObserver();
  [(PUTilingView *)self->__tilingView setDelegate:0];
  id v3 = [(PUOneUpViewController *)self browsingSession];
  id v4 = [v3 viewModel];
  char v5 = [v4 isPresentedForPreview];

  if (![(PUOneUpViewController *)self _isPresentedForSecondScreen] && (v5 & 1) == 0)
  {
    id v6 = +[PHAirPlayScreenController sharedInstance];
    [v6 unregisterContentProvider:self];
  }
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewController;
  [(PUOneUpViewController *)&v7 dealloc];
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3
{
  return [(PUOneUpViewController *)self initWithBrowsingSession:a3 options:0];
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4 initialActivity:(unint64_t)a5 presentationOrigin:(int64_t)a6
{
  id v12 = a3;
  if (!v12)
  {
    double v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2, self, @"PUOneUpViewController.m", 449, @"Invalid parameter not satisfying: %@", @"browsingSession != nil" object file lineNumber description];
  }
  v83.receiver = self;
  v83.super_class = (Class)PUOneUpViewController;
  id v13 = [(PUOneUpViewController *)&v83 initWithNibName:0 bundle:0];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->__unint64_t options = a4;
    v13->__initialActivitdouble y = a5;
    uint64_t v15 = px_dispatch_queue_create_serial();
    preheatAssetsQueue = v14->_preheatAssetsQueue;
    v14->_preheatAssetsQueue = (OS_dispatch_queue *)v15;

    PXRegisterPreferencesObserver();
    unint64_t v17 = [(PUOneUpViewController *)v14 navigationItem];
    objc_msgSend(v17, "px_setPreferredLargeTitleDisplayMode:", 2);

    id v18 = [[PUOneUpViewControllerSpec alloc] initWithOptions:a4];
    spec = v14->__spec;
    v14->__spec = v18;

    [(PUViewControllerSpec *)v14->__spec registerChangeObserver:v14];
    v14->__needsUpdateSpec = 1;
    objc_super v20 = [(id)objc_opt_class() description];
    uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
    id v22 = [v21 UUIDString];
    uint64_t v23 = [v20 stringByAppendingString:v22];
    scrubbingIdentifier = v14->_scrubbingIdentifier;
    v14->_scrubbingIdentifier = (NSString *)v23;

    p_browsingSession = &v14->_browsingSession;
    objc_storeStrong((id *)&v14->_browsingSession, a3);
    v14->_presentationOrigin = a6;
    BOOL v26 = [(PUBrowsingSession *)v14->_browsingSession viewModel];
    [v26 registerChangeObserver:v14];
    double v27 = [(PUOneUpViewController *)v14 traitCollection];
    objc_msgSend(v26, "setHorizontalSizeClass:", objc_msgSend(v27, "horizontalSizeClass"));

    [(PUOneUpViewController *)v14 _preheatAdjacentAssetsForPhotosDetailsContext];
    id v28 = +[PUOneUpSettings sharedInstance];
    int v29 = [v28 allowVisualIntelligence];

    if ((a4 & 0x40000) == 0 && v29)
    {
      uint64_t v30 = [[PUOneUpVisualImageAnalyzingController alloc] initWithBrowsingViewModel:v26];
      visualImageAnalyzingController = v14->_visualImageAnalyzingController;
      v14->_visualImageAnalyzingController = v30;
    }
    uint64_t v32 = objc_alloc_init(PULoadingIndicatorController);
    loadingIndicatorController = v14->_loadingIndicatorController;
    v14->_loadingIndicatorController = v32;

    v14->__needsUpdateLayout = 1;
    v14->__isPresentedForSecondScreen = (a4 & 2) != 0;
    v14->__prefersCompactLayoutForSplitScreen = (a4 & 0x400) != 0;
    if ((a4 & 2) == 0)
    {
      uint64_t v34 = PUOneUpEventTrackerCreate(v26, a6);
      eventTracker = v14->_eventTracker;
      v14->_eventTracker = (PUOneUpEventTracker *)v34;

      id v36 = objc_alloc_init(PUInteractiveSwipeDismissalController);
      interactiveSwipeDismissalController = v14->__interactiveSwipeDismissalController;
      v14->__interactiveSwipeDismissalController = v36;

      [(PUInteractiveDismissalController *)v14->__interactiveSwipeDismissalController setDelegate:v14];
      uint64_t v38 = objc_alloc_init(PUInteractivePinchDismissalController);
      interactivePinchDismissalController = v14->__interactivePinchDismissalController;
      v14->__interactivePinchDismissalController = v38;

      [(PUInteractiveDismissalController *)v14->__interactivePinchDismissalController setDelegate:v14];
      if ([(PUOneUpViewController *)v14 wantsSpotlightStyling])
      {
        uint64_t v40 = 1;
      }
      else if ((a4 & 0x20000) != 0)
      {
        uint64_t v40 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v40 = 3;
        }
        else {
          uint64_t v40 = 0;
        }
      }
      id v41 = [[PUOneUpDefaultActionsController alloc] initWithBrowsingSession:v12 viewController:v14];
      [(PUOneUpDefaultActionsController *)v41 setDelegate:v14];
      [(PUOneUpDefaultActionsController *)v41 setAssetActionManagerSource:v14];
      p_actionsController = &v14->_actionsController;
      objc_storeStrong((id *)&v14->_actionsController, v41);
      if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
      {
        BOOL v43 = [[PUOneUpChromeViewController alloc] initWithBrowsingSession:v12 actionsController:*p_actionsController];
        chromeViewController = v14->_chromeViewController;
        v14->_chromeViewController = v43;

        [(PUOneUpChromeViewController *)v14->_chromeViewController setDelegate:v14];
        [(PUOneUpViewController *)v14 _invalidateChromeViewController];
      }
      else
      {
        objc_super v45 = [[PUOneUpBarsController alloc] initWithStyle:v40 browsingSession:*p_browsingSession viewController:v14 actionsController:*p_actionsController delegate:v14];
        barsController = v14->__barsController;
        v14->__barsController = v45;

        v14->__needsUpdateBarsController = 1;
        double v47 = objc_alloc_init(PUDoubleTapZoomController);
        doubleTapZoomController = v14->__doubleTapZoomController;
        v14->__doubleTapZoomController = v47;

        [(PUDoubleTapZoomController *)v14->__doubleTapZoomController setDelegate:v14];
      }
      double v49 = [(PUOneUpViewController *)v14 _spec];
      int v50 = [v49 allowAccessoryVisibility];

      if (v50)
      {
        double v51 = objc_alloc_init(PUAccessoryVisibilityInteractionController);
        accessoryVisibilityInteractionController = v14->__accessoryVisibilityInteractionController;
        v14->__accessoryVisibilityInteractionController = v51;

        [(PUAccessoryVisibilityInteractionController *)v14->__accessoryVisibilityInteractionController setDelegate:v14];
        [(PUAccessoryVisibilityInteractionController *)v14->__accessoryVisibilityInteractionController setBrowsingSession:v12];
        id v53 = [PUOneUpAccessoryViewControllersManager alloc];
        id v54 = *p_browsingSession;
        id v55 = [(PUOneUpViewController *)v14 _spec];
        uint64_t v56 = [(PUOneUpAccessoryViewControllersManager *)v53 initWithBrowsingSession:v54 spec:v55];
        accessoryViewControllersManager = v14->__accessoryViewControllersManager;
        v14->__accessoryViewControllersManager = (PUOneUpAccessoryViewControllersManager *)v56;

        id v58 = v14->__accessoryViewControllersManager;
        double v59 = [(PUOneUpViewController *)v14 unlockDeviceStatus];
        [(PUOneUpAccessoryViewControllersManager *)v58 setUnlockDeviceStatus:v59];

        [(PUOneUpAccessoryViewControllersManager *)v14->__accessoryViewControllersManager setDelegate:v14];
        uint64_t v60 = [objc_alloc(MEMORY[0x1E4F90218]) initWithContainerViewController:v14];
        cardPresentationController = v14->cardPresentationController;
        v14->cardPresentationController = (PXFloatingCardPresentationController *)v60;

        [(PXFloatingCardPresentationController *)v14->cardPresentationController setDelegate:v14];
      }
      int64_t v62 = objc_alloc_init(PUOneUpGestureRecognizerCoordinator);
      gestureRecognizerCoordinator = v14->__gestureRecognizerCoordinator;
      v14->__gestureRecognizerCoordinator = v62;

      [(PUOneUpGestureRecognizerCoordinator *)v14->__gestureRecognizerCoordinator setOneUpBarsController:v14->__barsController];
      [(PUOneUpGestureRecognizerCoordinator *)v14->__gestureRecognizerCoordinator setDoubleTapZoomController:v14->__doubleTapZoomController];
      [(PUOneUpGestureRecognizerCoordinator *)v14->__gestureRecognizerCoordinator setBrowsingSession:*p_browsingSession];
      [(PUOneUpGestureRecognizerCoordinator *)v14->__gestureRecognizerCoordinator setDelegate:v14];
      uint64_t v64 = [(PUOneUpGestureRecognizerCoordinator *)v14->__gestureRecognizerCoordinator touchingGestureRecognizer];
      [v64 addTarget:v14 action:sel__handleTouchGesture_];
    }
    unint64_t v65 = a4 & 2;
    double v66 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v66 addObserver:v14 selector:sel__browsingVideoPlayerDidPlayToEndTime_ name:PUBrowsingVideoPlayerDidPlayToEndTimeNotification object:0];

    unint64_t v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v67 addObserver:v14 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    uint64_t v68 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v68 addObserver:v14 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v69 = +[PUOneUpSettings sharedInstance];
    int v70 = [v69 allowParallax];

    if (v70 && !UIAccessibilityIsReduceMotionEnabled())
    {
      double v71 = objc_alloc_init(PUParallaxComputer);
      parallaxComputer = v14->__parallaxComputer;
      v14->__parallaxComputer = v71;

      double v73 = v14->__parallaxComputer;
      id v74 = +[PUOneUpSettings sharedInstance];
      -[PUParallaxComputer setModel:](v73, "setModel:", [v74 parallaxModel]);

      double v75 = v14->__parallaxComputer;
      id v76 = +[PUOneUpSettings sharedInstance];
      [v76 parallaxFactor];
      [(PUParallaxComputer *)v75 setParallaxFactor:v77 / 100.0];

      [(PUParallaxComputer *)v14->__parallaxComputer setAxis:1];
    }
    uint64_t v78 = [[PUBrowsingOneUpVisibilityHelper alloc] initWithBrowsingViewModel:v26 isPresentedForSecondScreen:v65 != 0];
    [(PUOneUpViewController *)v14 setBrowsingOneUpVisibilityHelper:v78];

    int v79 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeVideoTileControllers = v14->_activeVideoTileControllers;
    v14->_activeVideoTileControllers = v79;

    v14->_preferredContentSizeOverride = (CGSize)*MEMORY[0x1E4F1DB30];
    v14->__needsUpdatePreferredContentSize = 1;
    [(PUOneUpViewController *)v14 _updateImageAnalysisInteractionDelegate];
  }
  return v14;
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4 initialActivity:(unint64_t)a5
{
  return [(PUOneUpViewController *)self initWithBrowsingSession:a3 options:a4 initialActivity:a5 presentationOrigin:0];
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4
{
  return [(PUOneUpViewController *)self initWithBrowsingSession:a3 options:a4 initialActivity:0];
}

- (PUOneUpViewController)initWithCoder:(id)a3
{
  return [(PUOneUpViewController *)self initWithBrowsingSession:0 options:0];
}

- (PUOneUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(PUOneUpViewController *)self initWithBrowsingSession:0 options:0];
}

+ (NSString)oneUpActivityTitle
{
  if (oneUpActivityTitle_onceToken != -1) {
    dispatch_once(&oneUpActivityTitle_onceToken, &__block_literal_global_986);
  }
  id v2 = (void *)oneUpActivityTitle_oneUpActivityTitle;
  return (NSString *)v2;
}

void __43__PUOneUpViewController_oneUpActivityTitle__block_invoke()
{
  uint64_t v0 = px_deferredLocalizedStringWithFormat();
  id v1 = (void *)oneUpActivityTitle_oneUpActivityTitle;
  oneUpActivityTitle_oneUpActivityTitle = v0;
}

@end