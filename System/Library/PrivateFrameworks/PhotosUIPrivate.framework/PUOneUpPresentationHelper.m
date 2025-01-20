@interface PUOneUpPresentationHelper
- (BOOL)_handleInteractivePresentationWithBlock:(id)a3;
- (BOOL)_isEndingPresentation;
- (BOOL)_isPerformingNonAnimatedPush;
- (BOOL)_needsUpdateAssetReferencesDisplayedInTilingView;
- (BOOL)_prepareDismissalForced:(BOOL)a3;
- (BOOL)_shouldAutoplayOnNavigation;
- (BOOL)_shouldPauseLibraryChanges;
- (BOOL)cachesScrubberView;
- (BOOL)canDismissOneUpViewController;
- (BOOL)canPresentOneUpViewControllerAnimated:(BOOL)a3;
- (BOOL)dismissOneUpViewControllerForced:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handlePresentingPanGestureRecognizer:(id)a3;
- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3;
- (BOOL)isOneUpPresented;
- (BOOL)isReadyToAdoptTilingView:(id)a3 fromEndPoint:(id)a4;
- (BOOL)pausingPhotoLibraryChanges;
- (BOOL)shouldStartPreviewingSimultaneouslyWithGestureRecognizer:(id)a3;
- (BOOL)tilingViewControllerTransitionUsesTransientTilingView:(id)a3;
- (BOOL)xrOSNotificationModeEnabled;
- (CGAffineTransform)_tilingViewTransitionTransform;
- (NSSet)_assetReferencesDisplayedInTilingView;
- (PHPhotoLibrary)pausedPhotoLibrary;
- (PUBrowsingSession)browsingSession;
- (PUChangeDirectionValueFilter)_panDirectionValueFilter;
- (PUOneUpPresentationHelper)init;
- (PUOneUpPresentationHelper)initWithBrowsingSessionCreationBlock:(id)a3;
- (PUOneUpPresentationHelper)initWithPhotosDataSource:(id)a3;
- (PUOneUpPresentationHelperAssetDisplayDelegate)assetDisplayDelegate;
- (PUOneUpPresentationHelperDelegate)delegate;
- (PUOneUpPresentationHelperTestingDelegate)testingDelegate;
- (PUOneUpViewController)_oneUpViewController;
- (PUPinchedTileTracker)_pinchedTileTracker;
- (PUTilingView)_disappearingTilingView;
- (PUTilingView)_tilingView;
- (PUTilingView)_transitioningTilingView;
- (PXAssetReference)lastViewedAssetReference;
- (PXPhotosDataSource)photosDataSource;
- (PXRegionOfInterest)layoutRegionOfInterest;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (UIViewController)presentingViewController;
- (UIViewController)topmostPresentedViewController;
- (double)pinchedTiledTracker:(id)a3 initialAspectRatioForTileWithLayoutInfo:(id)a4;
- (double)tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:(id)a3;
- (id)_browsingSessionCreateIfNeeded:(BOOL)a3;
- (id)_browsingSessionCreationBlock;
- (id)_createBrowsingSession;
- (id)_createOneUpViewControllerWithBrowsingSession:(id)a3 options:(unint64_t)a4 activity:(unint64_t)a5 editActivityCompletion:(id)a6;
- (id)_currentTilingViewControllerTransition;
- (id)_newCollapsedLayout;
- (id)_transitionHostingView;
- (id)cameraPreviewTransitionDelegateWithSourceRect:(CGRect)a3 sourceImage:(id)a4;
- (id)libraryChangePauseToken;
- (id)pinchedTiledTracker:(id)a3 finalLayoutInfoForTileWithLayoutInfo:(id)a4;
- (id)previewPresentationTransitioningDelegateForPosition:(CGPoint)a3 inSourceView:(id)a4;
- (id)previewViewControllerForItemAtIndexPath:(id)a3 allowingActions:(BOOL)a4;
- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5;
- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForReattachedTileControllers:(id)a4 context:(id)a5;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForUpdateWithItems:(id)a4;
- (id)tilingViewControllerTransition:(id)a3 tilingViewToTransferToEndPoint:(id)a4;
- (id)tilingViewControllerTransitionTilingViewHostView:(id)a3;
- (id)unlockDeviceHandlerWithActionType;
- (id)unlockDeviceStatus;
- (int64_t)_currentNavigationControllerOperation;
- (int64_t)_presentationEndTimeoutIdentifier;
- (int64_t)_presentationOrigin;
- (int64_t)_state;
- (int64_t)tilingViewControllerTransitionPreferredBarStyle:(id)a3;
- (int64_t)transitionType;
- (void)_cleanUpAfterTilingViewTransitionAnimated:(BOOL)a3 transitionAborted:(BOOL)a4;
- (void)_cleanupOneUpViewControllerForDismissalIfNeeded;
- (void)_configureNavigationController:(id)a3;
- (void)_didFinishTransitioningFromOneUp;
- (void)_didFinishTransitioningToOneUp;
- (void)_disappearingTilingView:(id)a3 animationCompleted:(BOOL)a4;
- (void)_ensureRegistrationWithPresentingViewController;
- (void)_handleTap:(id)a3;
- (void)_handleTileControllerAnimationEnd;
- (void)_invalidateAssetReferencesDisplayedInTilingView;
- (void)_invalidatePresentationInfo;
- (void)_navigateToAssetAtIndexPath:(id)a3 inBrowsingSession:(id)a4;
- (void)_presentOneUpViewController:(id)a3 animated:(BOOL)a4 interactiveMode:(int64_t)a5 completion:(id)a6;
- (void)_presentationEndDidTimeOut:(int64_t)a3;
- (void)_setAssetReferencesDisplayedInTilingView:(id)a3;
- (void)_setBrowsingSession:(id)a3;
- (void)_setDisappearingTilingView:(id)a3;
- (void)_setEndingPresentation:(BOOL)a3;
- (void)_setIsPerformingNonAnimatedPush:(BOOL)a3;
- (void)_setNeedsUpdateAssetReferencesDisplayedInTilingView:(BOOL)a3;
- (void)_setOneUpViewController:(id)a3;
- (void)_setPanDirectionValueFilter:(id)a3;
- (void)_setPinchedTileTracker:(id)a3;
- (void)_setPresentationEndTimeoutIdentifier:(int64_t)a3;
- (void)_setShouldPauseLibraryChanges:(BOOL)a3;
- (void)_setState:(int64_t)a3;
- (void)_setTapGestureRecognizer:(id)a3;
- (void)_setTilingView:(id)a3;
- (void)_setTransitioningTilingView:(id)a3;
- (void)_throwOnSetStateFromIdleToTransitioningToOneUp:(int64_t)a3;
- (void)_throwOnSetStateFromTransitionedToOneUpToPreparingTransitionToOneUp:(int64_t)a3;
- (void)_updateAssetReferencesDisplayedInTilingView;
- (void)_updateLayout;
- (void)_updateLayout:(id)a3;
- (void)_updatePresentationInfoIfNeeded;
- (void)_updateTapGestureRecognizer;
- (void)cancelCommitTransitionForPreviewViewController:(id)a3 completion:(id)a4;
- (void)commitPreviewViewController:(id)a3;
- (void)commitPreviewViewController:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)interactiveTileTracker:(id)a3 didStopTrackingTileController:(id)a4;
- (void)interactiveTileTracker:(id)a3 willStartTrackingTileController:(id)a4;
- (void)photosPreviewPresentationController:(id)a3 willPresentPreviewViewController:(id)a4;
- (void)presentOneUpViewControllerAnimated:(BOOL)a3 interactiveMode:(int64_t)a4;
- (void)presentOneUpViewControllerAnimated:(BOOL)a3 interactiveMode:(int64_t)a4 activity:(unint64_t)a5 editActivityCompletion:(id)a6;
- (void)presentOneUpViewControllerFromAssetAtIndexPath:(id)a3 animated:(BOOL)a4 interactiveMode:(int64_t)a5 activity:(unint64_t)a6 editActivityCompletion:(id)a7;
- (void)presentingViewControllerViewDidDisappear:(BOOL)a3;
- (void)presentingViewControllerViewWillAppear:(BOOL)a3;
- (void)presentingViewControllerViewWillDisappear:(BOOL)a3;
- (void)setAssetDisplayDelegate:(id)a3;
- (void)setCachesScrubberView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutRegionOfInterest:(id)a3;
- (void)setLibraryChangePauseToken:(id)a3;
- (void)setPausedPhotoLibrary:(id)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setTestingDelegate:(id)a3;
- (void)setUnlockDeviceHandlerWithActionType:(id)a3;
- (void)setUnlockDeviceStatus:(id)a3;
- (void)setXrOSNotificationModeEnabled:(BOOL)a3;
- (void)set_presentationOrigin:(int64_t)a3;
- (void)tilingView:(id)a3 didStopUsingTileController:(id)a4;
- (void)tilingViewControllerTransition:(id)a3 abandonTilingView:(id)a4 toEndPoint:(id)a5;
- (void)tilingViewControllerTransition:(id)a3 adoptTilingView:(id)a4 fromEndPoint:(id)a5 isCancelingTransition:(BOOL)a6 animationSetupCompletionHandler:(id)a7;
- (void)tilingViewControllerTransitionWasAborted:(id)a3;
- (void)tilingViewDidEndAnimatingTileControllers:(id)a3;
@end

@implementation PUOneUpPresentationHelper

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(PUOneUpPresentationHelper *)self _state];
  if (v3)
  {
    v6 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
    v7 = objc_msgSend(v6, "pu_navigationTransition");
    v8 = [v6 navigationController];
    v9 = objc_msgSend(v8, "pu_currentNavigationTransition");

    if (v7 != v9) {
      [(PUOneUpPresentationHelper *)self _setAssetReferencesDisplayedInTilingView:0];
    }
    if (v5 == 3)
    {
      int64_t v10 = [(PUOneUpPresentationHelper *)self _presentationOrigin];
      [MEMORY[0x1E4F8FF88] transitionPreparationDidBegin:2 fromOrigin:v10 transitionObject:self];
    }
  }
  self->_isPresentingViewControllerAppearingWithIdleState = v5 == 0;
}

- (void)_didFinishTransitioningFromOneUp
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(PUOneUpPresentationHelper *)self _state] == 4)
  {
    [(PUOneUpPresentationHelper *)self _setState:5];
    BOOL v3 = [(PUOneUpPresentationHelper *)self _tilingView];
    char v4 = [v3 isAnyTileControllerAnimating];

    if ((v4 & 1) == 0) {
      [(PUOneUpPresentationHelper *)self _handleTileControllerAnimationEnd];
    }
  }
  else if ([(PUOneUpPresentationHelper *)self _state] == 3 {
         && !self->_isPresentingViewControllerAppearingWithIdleState)
  }
  {
    int64_t v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(PUOneUpPresentationHelper *)self presentingViewController];
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller did appear without the one-up presentation helper being cleaned up appropriately. Recovering from that state, but this should be avoided. (%@)", (uint8_t *)&v7, 0xCu);
    }
    [(PUOneUpPresentationHelper *)self _cleanupOneUpViewControllerForDismissalIfNeeded];
  }
  self->_isPresentingViewControllerAppearingWithIdleState = 0;
}

- (int64_t)_state
{
  return self->__state;
}

- (void)_updatePresentationInfoIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_needsUpdateFlags.presentationInfo) {
    return;
  }
  self->_needsUpdateFlags.presentationInfo = 0;
  BOOL v3 = [(PUOneUpPresentationHelper *)self delegate];
  char v4 = [v3 oneUpPresentationHelperViewController:self];
  int64_t v5 = [v4 navigationController];
  if (!v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      v13 = v5;
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "1-up presentation currently requires the containing navigation controller (%@) to be a PUNavigationController subclass (in order to support custom navigation transitions). Falling back to modal presentation of 1-up from %@ to fail gracefully, but animations or presence of tabs might not work as expected. See <rdar://problem/41422833>.", (uint8_t *)&v12, 0x16u);
    }

LABEL_8:
    uint64_t v6 = 2;
    goto LABEL_9;
  }
  uint64_t v6 = 1;
LABEL_9:
  v8 = objc_msgSend(v4, "px_splitViewController");

  if (v8) {
    int64_t v9 = 2;
  }
  else {
    int64_t v9 = v6;
  }
  if (self->_delegateFlags.respondsToTransitionTypeWithProposedTransitionType) {
    int64_t v9 = [v3 oneUpPresentationHelper:self transitionTypeWithProposedTransitionType:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  +[PUTilingViewTransitionHelper unregisterTransitionEndPoint:self forViewController:WeakRetained];

  id v11 = objc_storeWeak((id *)&self->_presentingViewController, v4);
  +[PUTilingViewTransitionHelper registerTransitionEndPoint:self forViewController:v4];

  self->_transitionType = v9;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTransitionTypeWithProposedTransitionType = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWillPresentOneUpViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidDismissOneUpViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToOriginalViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToStateDidChange = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewHostingTilingView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToScrollView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreferredBarStyle = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldLeaveContentOnSecondScreen = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDisableFinalFadeoutAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreviewScrubberDidBecomeAvailable = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldAutoPlay = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreventRevealInMomentAction = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreventHideAssetAction = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreferredPresentationOrientation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToEnableFreezeLayoutOnOrientationChange = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToAdditionalOptions = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWantsShowInLibraryButton = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToSearchContext = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreventPeopleOrnament = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreventAlbumAttributionWidget = objc_opt_respondsToSelector() & 1;
    [(PUOneUpPresentationHelper *)self _invalidatePresentationInfo];
    [(PUOneUpPresentationHelper *)self _updatePresentationInfoIfNeeded];
  }
}

- (void)_updateLayout
{
  BOOL v3 = [(PUOneUpPresentationHelper *)self _tilingView];
  id v4 = [v3 layout];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PUOneUpPresentationHelper *)self _updateLayout:v4];
  }
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (void)setAssetDisplayDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetDisplayDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_assetDisplayDelegate, obj);
    self->_assetDisplayDelegateFlags.respondsToRegionOfInterestForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToCurrentImageForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToShouldHideAssetReferences = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToScrollAssetReferenceToVisible = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToShouldDisableScroll = objc_opt_respondsToSelector() & 1;
  }
}

- (PUOneUpPresentationHelper)initWithBrowsingSessionCreationBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 169, @"Invalid parameter not satisfying: %@", @"browsingSessionCreationBlock" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpPresentationHelper;
  uint64_t v6 = [(PUOneUpPresentationHelper *)&v12 init];
  int v7 = v6;
  if (v6)
  {
    v6->_needsUpdateFlags.presentationInfo = 1;
    uint64_t v8 = [v5 copy];
    id browsingSessionCreationBlock = v7->__browsingSessionCreationBlock;
    v7->__id browsingSessionCreationBlock = (id)v8;
  }
  return v7;
}

- (PUOneUpPresentationHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpPresentationHelperDelegate *)WeakRetained;
}

- (void)_invalidatePresentationInfo
{
  self->_needsUpdateFlags.presentationInfo = 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_layoutRegionOfInterest, 0);
  objc_storeStrong((id *)&self->__panDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__pinchedTileTracker, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__oneUpViewController, 0);
  objc_storeStrong((id *)&self->__assetReferencesDisplayedInTilingView, 0);
  objc_storeStrong((id *)&self->__transitioningTilingView, 0);
  objc_destroyWeak((id *)&self->__disappearingTilingView);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong(&self->__browsingSessionCreationBlock, 0);
  objc_storeStrong(&self->_libraryChangePauseToken, 0);
  objc_storeStrong((id *)&self->_pausedPhotoLibrary, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_destroyWeak((id *)&self->_assetDisplayDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

- (void)setTestingDelegate:(id)a3
{
}

- (PUOneUpPresentationHelperTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (PUOneUpPresentationHelperTestingDelegate *)WeakRetained;
}

- (void)setLayoutRegionOfInterest:(id)a3
{
}

- (PXRegionOfInterest)layoutRegionOfInterest
{
  return self->_layoutRegionOfInterest;
}

- (void)set_presentationOrigin:(int64_t)a3
{
  self->__presentationOrigin = a3;
}

- (int64_t)_presentationOrigin
{
  return self->__presentationOrigin;
}

- (void)_setIsPerformingNonAnimatedPush:(BOOL)a3
{
  self->__isPerformingNonAnimatedPush = a3;
}

- (BOOL)_isPerformingNonAnimatedPush
{
  return self->__isPerformingNonAnimatedPush;
}

- (void)_setPanDirectionValueFilter:(id)a3
{
}

- (PUChangeDirectionValueFilter)_panDirectionValueFilter
{
  return self->__panDirectionValueFilter;
}

- (void)_setPinchedTileTracker:(id)a3
{
}

- (PUPinchedTileTracker)_pinchedTileTracker
{
  return self->__pinchedTileTracker;
}

- (void)_setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (PUOneUpViewController)_oneUpViewController
{
  return self->__oneUpViewController;
}

- (NSSet)_assetReferencesDisplayedInTilingView
{
  return self->__assetReferencesDisplayedInTilingView;
}

- (void)_setNeedsUpdateAssetReferencesDisplayedInTilingView:(BOOL)a3
{
  self->__needsUpdateAssetReferencesDisplayedInTilingView = a3;
}

- (BOOL)_needsUpdateAssetReferencesDisplayedInTilingView
{
  return self->__needsUpdateAssetReferencesDisplayedInTilingView;
}

- (PUTilingView)_transitioningTilingView
{
  return self->__transitioningTilingView;
}

- (void)_setDisappearingTilingView:(id)a3
{
}

- (PUTilingView)_disappearingTilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__disappearingTilingView);
  return (PUTilingView *)WeakRetained;
}

- (id)_browsingSessionCreationBlock
{
  return self->__browsingSessionCreationBlock;
}

- (void)setLibraryChangePauseToken:(id)a3
{
}

- (id)libraryChangePauseToken
{
  return self->_libraryChangePauseToken;
}

- (void)setPausedPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)pausedPhotoLibrary
{
  return self->_pausedPhotoLibrary;
}

- (BOOL)_shouldPauseLibraryChanges
{
  return self->__shouldPauseLibraryChanges;
}

- (void)_setPresentationEndTimeoutIdentifier:(int64_t)a3
{
  self->__presentationEndTimeoutIdentifier = a3;
}

- (int64_t)_presentationEndTimeoutIdentifier
{
  return self->__presentationEndTimeoutIdentifier;
}

- (BOOL)_isEndingPresentation
{
  return self->__isEndingPresentation;
}

- (void)setXrOSNotificationModeEnabled:(BOOL)a3
{
  self->_xrOSNotificationModeEnabled = a3;
}

- (BOOL)xrOSNotificationModeEnabled
{
  return self->_xrOSNotificationModeEnabled;
}

- (void)setCachesScrubberView:(BOOL)a3
{
  self->_cachesScrubberView = a3;
}

- (BOOL)cachesScrubberView
{
  return self->_cachesScrubberView;
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (void)setUnlockDeviceStatus:(id)a3
{
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (PUOneUpPresentationHelperAssetDisplayDelegate)assetDisplayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetDisplayDelegate);
  return (PUOneUpPresentationHelperAssetDisplayDelegate *)WeakRetained;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)_setBrowsingSession:(id)a3
{
}

- (void)tilingViewDidEndAnimatingTileControllers:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpPresentationHelper *)self _tilingView];

  if (v5 == v4)
  {
    [(PUOneUpPresentationHelper *)self _handleTileControllerAnimationEnd];
  }
}

- (void)tilingView:(id)a3 didStopUsingTileController:(id)a4
{
  [(PUOneUpPresentationHelper *)self _invalidateAssetReferencesDisplayedInTilingView];
  [(PUOneUpPresentationHelper *)self _updateAssetReferencesDisplayedInTilingView];
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForReattachedTileControllers:(id)a4 context:(id)a5
{
  return +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForReattachedTileControllers:a4 context:a5];
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  return +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", a4.size.width != a5.size.width, a3, a4.origin.x, a4.origin.y);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForUpdateWithItems:(id)a4
{
  return +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForUpdates];
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  return +[PUAssetsDataSourceConverter defaultConverter];
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    __int16 v14 = [v10 fixedCoordinateSystem];
    v15 = objc_alloc_init(PUSingleAssetLayoutTransitionCoordinator);
    [(PUSingleAssetLayoutTransitionCoordinator *)v15 setFixedCoordinateSystem:v14];
  }
  else
  {
    uint64_t v16 = [(PUOneUpPresentationHelper *)self browsingSession];
    v17 = [v16 viewModel];
    __int16 v14 = [v17 currentAssetReference];

    v15 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForTransitionFromLayout:v11 toLayout:v12 withTilingView:v10 anchorAssetReference:v14 context:v13];
  }

  return v15;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (![a5 isEqualToString:@"PUTileKindItemContent"]) {
    goto LABEL_6;
  }
  v30 = a2;
  __int16 v14 = [(PUOneUpPresentationHelper *)self browsingSession];
  v15 = [v14 contentTileProvider];

  uint64_t v16 = [v13 assetReferenceAtIndexPath:v12];
  v17 = [(PUOneUpPresentationHelper *)self browsingSession];
  v18 = [v17 viewModel];
  v19 = [v18 assetViewModelForAssetReference:v16];

  v20 = [v16 asset];
  v21 = [v15 tileControllerForAsset:v20 viewModel:v19 tilingView:v11];

  if (self->_assetDisplayDelegateFlags.respondsToCurrentImageForAssetReference)
  {
    v22 = [(PUOneUpPresentationHelper *)self assetDisplayDelegate];
    v23 = [v22 oneUpPresentationHelper:self currentImageForAssetReference:v16];

    if (v23)
    {
      [v21 setPreloadedImage:v23];
    }
  }
  v24 = [(PUOneUpPresentationHelper *)self presentingViewController];
  v25 = [v24 viewIfLoaded];
  [v25 bounds];
  objc_msgSend(v21, "setExpectedPresentationSize:", v26, v27);

  a2 = v30;
  if (!v21)
  {
LABEL_6:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 2040, @"Invalid parameter not satisfying: %@", @"tileController != nil" object file lineNumber description];

    v21 = 0;
  }

  return v21;
}

- (double)tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:(id)a3
{
  return 0.25;
}

- (void)tilingViewControllerTransitionWasAborted:(id)a3
{
}

- (int64_t)tilingViewControllerTransitionPreferredBarStyle:(id)a3
{
  if (self->_delegateFlags.respondsToPreferredBarStyle)
  {
    id v4 = [(PUOneUpPresentationHelper *)self delegate];
    uint64_t v5 = [v4 oneUpPresentationHelperPreferredBarStyle:self];
  }
  else
  {
    id v4 = [(PUOneUpPresentationHelper *)self presentingViewController];
    uint64_t v5 = objc_msgSend(v4, "pu_preferredBarStyle");
  }
  int64_t v6 = v5;

  return v6;
}

- (BOOL)tilingViewControllerTransitionUsesTransientTilingView:(id)a3
{
  return 1;
}

- (void)tilingViewControllerTransition:(id)a3 adoptTilingView:(id)a4 fromEndPoint:(id)a5 isCancelingTransition:(BOOL)a6 animationSetupCompletionHandler:(id)a7
{
  BOOL v8 = a6;
  id v29 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v13)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1964, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];
  }
  uint64_t v16 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
  if (v16)
  {
  }
  else if (![(PUOneUpPresentationHelper *)self _state])
  {
    goto LABEL_13;
  }
  v17 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
  char v18 = [v14 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    double v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
    [v27 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1970, @"unexpected end point %@ with oneUpViewController %@", v14, v28 object file lineNumber description];
  }
  if ([(PUOneUpPresentationHelper *)self _state] != 5)
  {
    if (v8) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    int64_t v20 = [(PUOneUpPresentationHelper *)self _presentationOrigin];
    [MEMORY[0x1E4F8FF88] transitionAnimationDidBegin:v19 fromOrigin:v20 transitionObject:self];
    [(PUOneUpPresentationHelper *)self _setState:4];
  }
LABEL_13:
  v21 = [(PUOneUpPresentationHelper *)self _tilingView];

  if (v21)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    double v26 = [(PUOneUpPresentationHelper *)self _tilingView];
    [v25 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1980, @"adopting tiling %@ from %@ will override current tiling view %@", v13, v14, v26 object file lineNumber description];
  }
  [(PUOneUpPresentationHelper *)self _setTilingView:v13];
  [(PUOneUpPresentationHelper *)self _setTransitioningTilingView:v13];
  id v22 = [(PUOneUpPresentationHelper *)self _newCollapsedLayout];
  v23 = objc_alloc_init(PUTilingLayoutTransitionContext);
  [(PUTilingLayoutTransitionContext *)v23 setIsViewControllerTransition:1];
  [(PUTilingLayoutTransitionContext *)v23 setCancelingTransition:v8];
  [v13 transitionToLayout:v22 withContext:v23 animationSetupCompletionHandler:v15];
  [v13 layoutIfNeeded];
  [(PUOneUpPresentationHelper *)self _invalidateAssetReferencesDisplayedInTilingView];
  [(PUOneUpPresentationHelper *)self _updateAssetReferencesDisplayedInTilingView];
}

- (BOOL)isReadyToAdoptTilingView:(id)a3 fromEndPoint:(id)a4
{
  id v4 = [(PUOneUpPresentationHelper *)self presentingViewController];
  uint64_t v5 = [v4 viewIfLoaded];
  int64_t v6 = [v5 window];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)tilingViewControllerTransition:(id)a3 abandonTilingView:(id)a4 toEndPoint:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PUOneUpPresentationHelper *)self _tilingView];

  if (v10 != v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [(PUOneUpPresentationHelper *)self _tilingView];
    [v12 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1951, @"tiling view %@ to abandon to %@ isn't the current tiling view %@", v8, v9, v13 object file lineNumber description];
  }
  [(PUOneUpPresentationHelper *)self _setTilingView:0];
  id v11 = PLOneUpGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "Updating state from tilingViewControllerTransition", buf, 2u);
  }

  [(PUOneUpPresentationHelper *)self _setState:2];
}

- (id)tilingViewControllerTransition:(id)a3 tilingViewToTransferToEndPoint:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "unexpected end point %@ with oneUpViewController %@", buf, 0x16u);
    }
  }
  id v10 = [(PUOneUpPresentationHelper *)self _tilingView];
  if (!v10)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1946, @"no tiling view to transfer to %@ (state = %ti)", v6, -[PUOneUpPresentationHelper _state](self, "_state") object file lineNumber description];
  }
  return v10;
}

- (id)tilingViewControllerTransitionTilingViewHostView:(id)a3
{
  id v4 = a3;
  if (!self->_delegateFlags.respondsToViewHostingTilingView
    || ([(PUOneUpPresentationHelper *)self delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 oneUpPresentationHelperViewHostingTilingView:self],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    BOOL v7 = [(PUOneUpPresentationHelper *)self presentingViewController];
    id v6 = [v7 view];
  }
  return v6;
}

- (id)pinchedTiledTracker:(id)a3 finalLayoutInfoForTileWithLayoutInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(PUOneUpPresentationHelper *)self _currentTilingViewControllerTransition];
  if ([v6 hasStarted])
  {
    BOOL v7 = [(PUOneUpPresentationHelper *)self _transitioningTilingView];
    char v8 = [v7 layout];
    id v9 = [v5 indexPath];
    id v10 = [v5 tileKind];
    id v11 = [v8 layoutInfoForTileWithIndexPath:v9 kind:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (double)pinchedTiledTracker:(id)a3 initialAspectRatioForTileWithLayoutInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 dataSourceIdentifier];
  id v9 = [(PUOneUpPresentationHelper *)self browsingSession];
  uint64_t v10 = [v9 viewModel];
  id v11 = [(id)v10 assetsDataSource];

  id v12 = [v11 identifier];
  LOBYTE(v10) = [v12 isEqualToString:v8];

  if (v10)
  {
    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v13 = [v6 tilingView];
  id v14 = [v13 layout];
  id v11 = [v14 dataSource];

  objc_opt_class();
  double v15 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  __int16 v16 = [v11 identifier];
  int v17 = [v16 isEqualToString:v8];

  if (!v17) {
    goto LABEL_9;
  }
  if (v11)
  {
LABEL_8:
    uint64_t v18 = [v7 indexPath];
    uint64_t v19 = [v11 assetAtIndexPath:v18];

    [v19 aspectRatio];
    double v15 = v20;

LABEL_9:
  }

  return v15;
}

- (void)interactiveTileTracker:(id)a3 didStopTrackingTileController:(id)a4
{
  if (self->_assetDisplayDelegateFlags.respondsToShouldDisableScroll)
  {
    id v5 = [(PUOneUpPresentationHelper *)self assetDisplayDelegate];
    [v5 oneUpPresentationHelper:self shouldDisableScroll:0];
  }
}

- (void)interactiveTileTracker:(id)a3 willStartTrackingTileController:(id)a4
{
  if (self->_assetDisplayDelegateFlags.respondsToShouldDisableScroll)
  {
    id v5 = [(PUOneUpPresentationHelper *)self assetDisplayDelegate];
    [v5 oneUpPresentationHelper:self shouldDisableScroll:1];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  id v6 = [(PUOneUpPresentationHelper *)self _tapGestureRecognizer];

  if (v6 == v5)
  {
    *((unsigned char *)v13 + 24) = 0;
    id v7 = [(PUOneUpPresentationHelper *)self _tilingView];
    if (!v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1863, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];
    }
    [v5 locationInView:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PUOneUpPresentationHelper_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E5F27F88;
    v11[4] = &v12;
    objc_msgSend(v7, "enumeratePresentedTileControllersInRect:usingBlock:", v11);
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __58__PUOneUpPresentationHelper_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 tileKind];
  int v7 = [v6 isEqualToString:@"PUTileKindItemContent"];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)photosPreviewPresentationController:(id)a3 willPresentPreviewViewController:(id)a4
{
  id v8 = a4;
  id v5 = [(PUOneUpPresentationHelper *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(PUOneUpPresentationHelper *)self delegate];
    [v7 oneUpPresentationHelper:self willPresentOneUpPreviewViewController:v8];
  }
}

- (BOOL)_shouldAutoplayOnNavigation
{
  if (!self->_delegateFlags.respondsToShouldAutoPlay) {
    return 0;
  }
  v2 = self;
  BOOL v3 = [(PUOneUpPresentationHelper *)self delegate];
  LOBYTE(v2) = [v3 oneUpPresentationHelperShouldAutoPlay:v2];

  return (char)v2;
}

- (void)_navigateToAssetAtIndexPath:(id)a3 inBrowsingSession:(id)a4
{
  id v6 = a3;
  int v7 = [a4 viewModel];
  id v8 = [v7 assetsDataSource];
  id v9 = [v8 assetReferenceAtIndexPath:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke;
  v12[3] = &unk_1E5F2E908;
  id v13 = v7;
  id v14 = v9;
  char v15 = self;
  id v10 = v9;
  id v11 = v7;
  [v11 performChanges:v12];
}

void __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) _shouldAutoplayOnNavigation])
  {
    v2 = [*(id *)(a1 + 32) assetViewModelForAssetReference:*(void *)(a1 + 40)];
    BOOL v3 = [v2 videoPlayer];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke_2;
    v5[3] = &unk_1E5F2ED10;
    id v6 = v3;
    id v4 = v3;
    [v4 performChanges:v5];
  }
}

uint64_t __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:3 reason:@"One Up presentation helper asked to auto-play after navigating to asset"];
}

- (id)cameraPreviewTransitionDelegateWithSourceRect:(CGRect)a3 sourceImage:(id)a4
{
  return 0;
}

- (id)previewPresentationTransitioningDelegateForPosition:(CGPoint)a3 inSourceView:(id)a4
{
  id v5 = objc_alloc_init(PUPhotosPreviewTransitionDelegate);
  [(PUPhotosPreviewTransitionDelegate *)v5 setPhotosPreviewingDelegate:self];
  return v5;
}

- (BOOL)shouldStartPreviewingSimultaneouslyWithGestureRecognizer:(id)a3
{
  return 0;
}

- (void)commitPreviewViewController:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PUOneUpPresentationHelper *)self canPresentOneUpViewControllerAnimated:0])
  {
    id v8 = v6;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = v8;

      if (v9)
      {
        [(PUOneUpPresentationHelper *)self _setIsPerformingNonAnimatedPush:1];
        id v10 = (void *)MEMORY[0x1E4FB1EC0];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke;
        v12[3] = &unk_1E5F2EBC8;
        void v12[4] = self;
        id v11 = v9;
        id v13 = v11;
        id v14 = v7;
        [v10 _performWithoutDeferringTransitions:v12];

        goto LABEL_10;
      }
    }
    else
    {
    }
    id v11 = 0;
    goto LABEL_10;
  }
  id v11 = PXAssertGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v16 = "-[PUOneUpPresentationHelper commitPreviewViewController:completion:]";
    _os_log_error_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "%s attempt to commit previewViewController failed", buf, 0xCu);
  }
LABEL_10:
}

void __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke(id *a1)
{
  v2 = PLOneUpGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Updating state from commitPreviewViewController", buf, 2u);
  }

  [a1[4] _setState:1];
  [a1[5] setAppearanceTransitionAnimationsDisabled:1];
  BOOL v3 = [a1[5] browsingSession];
  id v4 = [v3 viewModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_437;
  v11[3] = &unk_1E5F2ED10;
  id v12 = v3;
  id v5 = v3;
  [v4 performChanges:v11];

  id v7 = a1[4];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_2;
  v8[3] = &unk_1E5F2EBC8;
  v8[4] = v7;
  id v9 = v6;
  id v10 = a1[6];
  [v7 _presentOneUpViewController:v9 animated:0 interactiveMode:0 completion:v8];
}

void __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_437(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewModel];
  [v1 setIsPresentedForPreview:0];
}

uint64_t __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setIsPerformingNonAnimatedPush:0];
  [*(id *)(a1 + 40) setAppearanceTransitionAnimationsDisabled:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)commitPreviewViewController:(id)a3
{
}

- (void)cancelCommitTransitionForPreviewViewController:(id)a3 completion:(id)a4
{
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    if ([(PUOneUpPresentationHelper *)self _state] == 2) {
      [(PUOneUpPresentationHelper *)self _didFinishTransitioningToOneUp];
    }
    goto LABEL_9;
  }
  id v9 = v7;
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = (objc_class *)objc_opt_class();
    char v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1734, @"%@ should be an instance inheriting from %@, but it is nil", @"viewController", v15 object file lineNumber description];
LABEL_12:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v16 = (objc_class *)objc_opt_class();
    char v15 = NSStringFromClass(v16);
    uint64_t v17 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1734, @"%@ should be an instance inheriting from %@, but it is %@", @"viewController", v15, v17 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_6:
  id v10 = [v9 browsingSession];
  id v11 = [v10 viewModel];
  id v12 = [v11 videoPlayer];

  if ([v12 isPlaybackDesired])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__PUOneUpPresentationHelper_didDismissPreviewViewController_committing___block_invoke;
    v18[3] = &unk_1E5F2ED10;
    id v19 = v12;
    [v19 performChanges:v18];
  }
LABEL_9:
}

uint64_t __72__PUOneUpPresentationHelper_didDismissPreviewViewController_committing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:1 reason:@"1-Up preview has been dismissed"];
}

- (id)previewViewControllerForItemAtIndexPath:(id)a3 allowingActions:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = [(PUOneUpPresentationHelper *)self _createBrowsingSession];
    [(PUOneUpPresentationHelper *)self _navigateToAssetAtIndexPath:v6 inBrowsingSession:v7];

    if (self->_delegateFlags.respondsToAdditionalOptions)
    {
      id v8 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v9 = [v8 oneUpPresentationHelperAdditionalOptions:self];
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (self->_delegateFlags.respondsToShouldLeaveContentOnSecondScreen)
    {
      id v11 = [(PUOneUpPresentationHelper *)self delegate];
      int v12 = [v11 oneUpPresentationHelperShouldLeaveContentOnSecondScreen:self];

      if (v12) {
        v9 |= 4uLL;
      }
    }
    id v10 = [(PUOneUpPresentationHelper *)self _createOneUpViewControllerWithBrowsingSession:v7 options:v9 activity:0 editActivityCompletion:0];
    id v13 = [v7 viewModel];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__PUOneUpPresentationHelper_previewViewControllerForItemAtIndexPath_allowingActions___block_invoke;
    v16[3] = &unk_1E5F2ED10;
    id v17 = v7;
    id v14 = v7;
    [v13 performChanges:v16];

    [v10 setAllowsPreviewActions:v4];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __85__PUOneUpPresentationHelper_previewViewControllerForItemAtIndexPath_allowingActions___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewModel];
  [v1 setIsPresentedForPreview:1];
}

- (id)_createOneUpViewControllerWithBrowsingSession:(id)a3 options:(unint64_t)a4 activity:(unint64_t)a5 editActivityCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (self->_delegateFlags.respondsToPreventRevealInMomentAction)
  {
    int v12 = [(PUOneUpPresentationHelper *)self delegate];
    int v13 = [v12 oneUpPresentationHelperPreventRevealInMomentAction:self];

    if (v13) {
      a4 |= 0x10uLL;
    }
  }
  if (self->_delegateFlags.respondsToWantsShowInLibraryButton)
  {
    id v14 = [(PUOneUpPresentationHelper *)self delegate];
    int v15 = [v14 oneUpPresentationHelperWantsShowInLibraryButton:self];

    if (v15) {
      a4 |= 0x8000uLL;
    }
  }
  if (self->_delegateFlags.respondsToPreventHideAssetAction)
  {
    __int16 v16 = [(PUOneUpPresentationHelper *)self delegate];
    int v17 = [v16 oneUpPresentationHelperPreventHideAssetAction:self];

    if (v17) {
      a4 |= 0x200000uLL;
    }
  }
  if (self->_delegateFlags.respondsToPreventPeopleOrnament)
  {
    uint64_t v18 = [(PUOneUpPresentationHelper *)self delegate];
    int v19 = [v18 oneUpPresentationHelperPreventPeopleOrnament:self];

    if (v19) {
      a4 |= 0x400000uLL;
    }
  }
  if (self->_delegateFlags.respondsToPreventAlbumAttributionWidget)
  {
    double v20 = [(PUOneUpPresentationHelper *)self delegate];
    int v21 = [v20 oneUpPresentationHelperPreventAlbumAttributionWidget:self];

    if (v21) {
      a4 |= 0x800000uLL;
    }
  }
  id v22 = [[PUOneUpViewController alloc] initWithBrowsingSession:v10 options:a4 initialActivity:a5 presentationOrigin:[(PUOneUpPresentationHelper *)self _presentationOrigin]];
  if ([(PUOneUpPresentationHelper *)self xrOSNotificationModeEnabled])
  {
    PXVisionScaledSize();
    -[PUOneUpViewController setPreferredContentSizeOverride:](v22, "setPreferredContentSizeOverride:");
  }
  [(PUOneUpViewController *)v22 setEditActivityCompletion:v11];
  v23 = [(PUOneUpPresentationHelper *)self unlockDeviceStatus];
  [(PUOneUpViewController *)v22 setUnlockDeviceStatus:v23];

  v24 = [(PUOneUpPresentationHelper *)self unlockDeviceHandlerWithActionType];
  [(PUOneUpViewController *)v22 setUnlockDeviceHandlerWithActionType:v24];

  if (self->_delegateFlags.respondsToSearchContext)
  {
    v25 = [(PUOneUpPresentationHelper *)self delegate];
    double v26 = [v25 oneUpPresentationHelperSearchQueryMatchInfo:self];

    double v27 = [v26 ocrTexts];
    [(PUOneUpViewController *)v22 setTextsToHighlight:v27];

    v28 = [v26 ocrAssetUUIDs];
    [(PUOneUpViewController *)v22 setAssetUUIDsAllowedToHighlightText:v28];
  }
  else
  {
    if (!self->_delegateFlags.respondsToTextsToHighlight) {
      goto LABEL_23;
    }
    double v26 = [(PUOneUpPresentationHelper *)self delegate];
    v28 = [v26 oneUpPresentationHelperTextsToHighlight:self];
    [(PUOneUpViewController *)v22 setTextsToHighlight:v28];
  }

LABEL_23:
  if (self->_delegateFlags.respondsToAssetUUIDsAllowedToHighlightText)
  {
    id v29 = [(PUOneUpPresentationHelper *)self delegate];
    v30 = [v29 oneUpPresentationHelperAssetUUIDsAllowedToHighlightText:self];
    [(PUOneUpViewController *)v22 setAssetUUIDsAllowedToHighlightText:v30];
  }
  return v22;
}

- (void)_didFinishTransitioningToOneUp
{
  [(PUOneUpPresentationHelper *)self _setState:3];
  int64_t v3 = [(PUOneUpPresentationHelper *)self _presentationOrigin];
  BOOL v4 = (void *)MEMORY[0x1E4F8FF88];
  [v4 transitionAnimationDidEnd:1 fromOrigin:v3 transitionObject:self];
}

- (void)_disappearingTilingView:(id)a3 animationCompleted:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(PUOneUpPresentationHelper *)self _disappearingTilingView];

  if (v6 == v5)
  {
    [(PUOneUpPresentationHelper *)self _setDisappearingTilingView:0];
    [(PUOneUpPresentationHelper *)self _setState:0];
  }
}

- (void)_cleanUpAfterTilingViewTransitionAnimated:(BOOL)a3 transitionAborted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(PUOneUpPresentationHelper *)self _presentationOrigin];
  [MEMORY[0x1E4F8FF88] transitionAnimationDidEnd:2 fromOrigin:v7 transitionObject:self];
  if (v4) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 6;
  }
  [(PUOneUpPresentationHelper *)self _setState:v8];
  uint64_t v9 = [(PUOneUpPresentationHelper *)self _tilingView];
  v34 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
  [(PUOneUpPresentationHelper *)self _setTilingView:0];
  [(PUOneUpPresentationHelper *)self _setTransitioningTilingView:0];
  [(PUOneUpPresentationHelper *)self _setAssetReferencesDisplayedInTilingView:0];
  [(PUOneUpPresentationHelper *)self _setOneUpViewController:0];
  id v10 = [v9 layout];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  v33 = v11;
  uint64_t v12 = [v11 assetReference];
  int v13 = (void *)v12;
  id v14 = 0;
  if (self->_delegateFlags.respondsToScrollView && v12)
  {
    int v15 = [(PUOneUpPresentationHelper *)self delegate];
    id v14 = [v15 oneUpPresentationHelper:self presentingScrollViewForAssetReference:v13];
  }
  __int16 v16 = [(PUOneUpPresentationHelper *)self layoutRegionOfInterest];
  int v17 = v16;
  if (v14
    || ([v16 containingScrollViews],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        [v18 firstObject],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v18,
        v14))
  {
    [v14 _removeScrollViewScrollObserver:self];
    objc_msgSend(v9, "px_transferToSuperview:", v14);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v19 = [v17 containingScrollViews];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * i) _removeScrollViewScrollObserver:self];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v20);
  }

  [(PUOneUpPresentationHelper *)self _setDisappearingTilingView:v9];
  [v9 setUserInteractionEnabled:0];
  if (v5)
  {
    if (self->_delegateFlags.respondsToDisableFinalFadeoutAnimation)
    {
      v23 = [(PUOneUpPresentationHelper *)self delegate];
      int v24 = [v23 oneUpPresentationHelperDisableFinalFadeoutAnimation:self];

      int v25 = v24 ^ 1;
    }
    else
    {
      int v25 = 1;
    }
  }
  else
  {
    int v25 = 0;
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke;
  aBlock[3] = &unk_1E5F2ED10;
  id v26 = v9;
  id v39 = v26;
  double v27 = (void (**)(void))_Block_copy(aBlock);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke_2;
  v35[3] = &unk_1E5F27D48;
  id v28 = v26;
  id v36 = v28;
  objc_copyWeak(&v37, &location);
  id v29 = (void (**)(void *, uint64_t))_Block_copy(v35);
  if (v25)
  {
    v30 = (void *)MEMORY[0x1E4FB1EB0];
    v31 = +[PUOneUpSettings sharedInstance];
    [v31 finalFadeOutDuration];
    objc_msgSend(v30, "animateWithDuration:animations:completion:", v27, v29);
  }
  else
  {
    v27[2](v27);
    v29[2](v29, 1);
  }
  if (self->_delegateFlags.respondsToDidDismissOneUpViewController)
  {
    v32 = [(PUOneUpPresentationHelper *)self delegate];
    [v32 oneUpPresentationHelper:self didDismissOneUpViewController:v34];
  }
  [(PUOneUpPresentationHelper *)self setLayoutRegionOfInterest:0];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

uint64_t __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _disappearingTilingView:*(void *)(a1 + 32) animationCompleted:a2];
}

- (void)_updateAssetReferencesDisplayedInTilingView
{
  if ([(PUOneUpPresentationHelper *)self _needsUpdateAssetReferencesDisplayedInTilingView])
  {
    [(PUOneUpPresentationHelper *)self _setNeedsUpdateAssetReferencesDisplayedInTilingView:0];
    int64_t v3 = [(PUOneUpPresentationHelper *)self browsingSession];
    BOOL v4 = [v3 viewModel];
    BOOL v5 = [v4 assetsDataSource];

    id v6 = [v5 identifier];
    int64_t v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:3];
    uint64_t v8 = [(PUOneUpPresentationHelper *)self _transitioningTilingView];
    [v8 bounds];
    CGRect v21 = CGRectInset(v20, 1.0, 1.0);
    double x = v21.origin.x;
    double y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__PUOneUpPresentationHelper__updateAssetReferencesDisplayedInTilingView__block_invoke;
    v16[3] = &unk_1E5F27D20;
    id v17 = v6;
    id v18 = v5;
    id v19 = v7;
    id v13 = v7;
    id v14 = v5;
    id v15 = v6;
    objc_msgSend(v8, "enumeratePresentedTileControllersInRect:usingBlock:", v16, x, y, width, height);
    [(PUOneUpPresentationHelper *)self _setAssetReferencesDisplayedInTilingView:v13];
  }
}

void __72__PUOneUpPresentationHelper__updateAssetReferencesDisplayedInTilingView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v5 tileKind];
  if (![v6 isEqualToString:@"PUTileKindItemContent"])
  {
LABEL_8:

    goto LABEL_9;
  }
  int64_t v7 = [v5 dataSourceIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if (([v13 isActive] & 1) != 0
      || ([v13 layoutInfo],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [v9 alpha],
          double v11 = v10,
          v9,
          v11 == 1.0))
    {
      id v6 = [v5 indexPath];
      uint64_t v12 = [*(id *)(a1 + 40) assetReferenceAtIndexPath:v6];
      if (v12) {
        [*(id *)(a1 + 48) addObject:v12];
      }

      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)_invalidateAssetReferencesDisplayedInTilingView
{
  if (![(PUOneUpPresentationHelper *)self _needsUpdateAssetReferencesDisplayedInTilingView])
  {
    [(PUOneUpPresentationHelper *)self _setNeedsUpdateAssetReferencesDisplayedInTilingView:1];
  }
}

- (void)_handleTap:(id)a3
{
  id v5 = a3;
  id v6 = [(PUOneUpPresentationHelper *)self _tapGestureRecognizer];

  if (v6 == v5 && [v5 state] == 3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__47581;
    id v15 = __Block_byref_object_dispose__47582;
    id v16 = 0;
    int64_t v7 = [(PUOneUpPresentationHelper *)self _tilingView];
    if (!v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1490, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];
    }
    [v5 locationInView:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__PUOneUpPresentationHelper__handleTap___block_invoke;
    v10[3] = &unk_1E5F27F88;
    v10[4] = &v11;
    objc_msgSend(v7, "enumeratePresentedTileControllersInRect:usingBlock:", v10);
    uint64_t v8 = v12[5];
    if (v8) {
      [(PUOneUpPresentationHelper *)self presentOneUpViewControllerFromAssetAtIndexPath:v8 animated:1 interactiveMode:0 activity:0 editActivityCompletion:0];
    }

    _Block_object_dispose(&v11, 8);
  }
}

void __40__PUOneUpPresentationHelper__handleTap___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v6 = [v11 tileKind];
  int v7 = [v6 isEqualToString:@"PUTileKindItemContent"];

  if (v7)
  {
    uint64_t v8 = [v11 indexPath];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (void)_updateTapGestureRecognizer
{
  if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
  {
    int64_t v3 = [(PUOneUpPresentationHelper *)self delegate];
    uint64_t v4 = [v3 oneUpPresentationHelperViewHostingGestureRecognizers:self];
  }
  else
  {
    int64_t v3 = [(PUOneUpPresentationHelper *)self presentingViewController];
    if (![v3 isViewLoaded])
    {
      id v5 = 0;
      BOOL v6 = 0;
      goto LABEL_9;
    }
    uint64_t v4 = [v3 view];
  }
  id v5 = (void *)v4;

  if (!v5)
  {
    BOOL v6 = 0;
    goto LABEL_10;
  }
  int64_t v3 = [(PUOneUpPresentationHelper *)self _tilingView];
  BOOL v6 = v3 != 0;
LABEL_9:

LABEL_10:
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  CGRect v20 = __Block_byref_object_copy__47581;
  CGRect v21 = __Block_byref_object_dispose__47582;
  id v22 = [(PUOneUpPresentationHelper *)self _tapGestureRecognizer];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PUOneUpPresentationHelper__updateTapGestureRecognizer__block_invoke;
  aBlock[3] = &unk_1E5F2E0D0;
  id v7 = v5;
  id v15 = self;
  id v16 = &v17;
  id v14 = v7;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = v8;
  if (v6)
  {
    double v10 = [(id)v18[5] view];

    if (v10) {
      v9[2](v9);
    }
    if (!v18[5])
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
      uint64_t v12 = (void *)v18[5];
      v18[5] = v11;

      [(id)v18[5] setDelegate:self];
      [v7 addGestureRecognizer:v18[5]];
      [(PUOneUpPresentationHelper *)self _setTapGestureRecognizer:v18[5]];
    }
  }
  else
  {
    v8[2](v8);
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __56__PUOneUpPresentationHelper__updateTapGestureRecognizer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeGestureRecognizer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDelegate:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  int64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  return [v4 _setTapGestureRecognizer:0];
}

- (id)_newCollapsedLayout
{
  int64_t v3 = [(PUOneUpPresentationHelper *)self browsingSession];
  uint64_t v4 = [v3 viewModel];

  id v5 = [v4 currentAssetReference];
  BOOL v6 = [v4 assetsDataSource];
  id v7 = [v6 assetReferenceForAssetReference:v5];
  uint64_t v8 = [(PUTilingLayout *)[PUSingleAssetLayout alloc] initWithDataSource:v6];
  [(PUSingleAssetLayout *)v8 setAssetReference:v7];
  [(PUOneUpPresentationHelper *)self _updateLayout:v8];

  return v8;
}

- (int64_t)_currentNavigationControllerOperation
{
  int64_t v2 = [(PUOneUpPresentationHelper *)self _state];
  if ((unint64_t)(v2 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1AEFF8100[v2 - 1];
  }
}

- (id)_currentTilingViewControllerTransition
{
  int64_t v3 = [(PUOneUpPresentationHelper *)self presentingViewController];
  uint64_t v4 = [v3 navigationController];
  id v5 = objc_msgSend(v4, "pu_currentInteractiveTransition");

  if (!v5)
  {
    BOOL v6 = [(PUOneUpPresentationHelper *)self presentingViewController];
    id v7 = [v6 presentedViewController];
    id v5 = objc_msgSend(v7, "pu_modalTransition");

    if (!v5)
    {
      uint64_t v8 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
      uint64_t v9 = [v8 navigationController];
      id v5 = objc_msgSend(v9, "pu_modalTransition");
    }
  }
  if (([v5 conformsToProtocol:&unk_1F08AD778] & 1) == 0)
  {

    id v5 = 0;
  }
  return v5;
}

- (void)_updateLayout:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1327, @"Invalid parameter not satisfying: %@", @"[layout isKindOfClass:[PUSingleAssetLayout class]]" object file lineNumber description];
  }
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v73 = *MEMORY[0x1E4FB2848];
  long long v74 = v10;
  double v70 = 0.0;
  double v71 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v72 = _Q0;
  id v16 = [v5 assetReference];
  if (!v16)
  {
    CGRect v20 = 0;
    uint64_t v33 = 0;
    v34 = 0;
    double v35 = 0.0;
    double v36 = 1.0;
    double v37 = 1.0;
    double v38 = 0.0;
    double v39 = 0.0;
    goto LABEL_19;
  }
  uint64_t v17 = [(PUOneUpPresentationHelper *)self assetDisplayDelegate];
  if ([(PUOneUpPresentationHelper *)self _state] == 4
    && self->_assetDisplayDelegateFlags.respondsToScrollAssetReferenceToVisible)
  {
    [v17 oneUpPresentationHelper:self scrollAssetReferenceToVisible:v16];
  }
  id v18 = [(PUOneUpPresentationHelper *)self _transitionHostingView];
  if (!self->_assetDisplayDelegateFlags.respondsToRegionOfInterestForAssetReference)
  {
    if (objc_opt_respondsToSelector())
    {
      [v17 oneUpPresentationHelper:self rectForAssetReference:v16 cropInsets:&v73 contentsRect:&v70];
      double x = v40;
      double y = v41;
      double width = v42;
      double height = v43;
    }
    long long v44 = [(PUOneUpPresentationHelper *)self presentingViewController];
    v45 = [v44 view];
    objc_msgSend(v18, "convertRect:fromCoordinateSpace:", v45, x, y, width, height);
    CGFloat v22 = v46;
    CGFloat v24 = v47;
    CGFloat v26 = v48;
    CGFloat v28 = v49;

    CGRect v20 = 0;
    goto LABEL_17;
  }
  uint64_t v19 = [v17 oneUpPresentationHelper:self regionOfInterestForAssetReference:v16 cropInsets:&v73];
  CGRect v20 = v19;
  if (v19)
  {
    [v19 rectInCoordinateSpace:v18];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [v20 imageContentsRect];
    double v70 = v29;
    double v71 = v30;
    *(void *)&long long v72 = v31;
    *((void *)&v72 + 1) = v32;
  }
  else
  {
    [v18 bounds];
    PXPointDenormalize();
    PXRectWithCenterAndSize();
    CGFloat v22 = v50;
    CGFloat v24 = v51;
    CGFloat v26 = v52;
    CGFloat v28 = v53;
  }
  v54 = [v20 imageViewSpec];
  long long v44 = v54;
  if (!v54)
  {
LABEL_17:
    uint64_t v33 = 0;
    v34 = 0;
    double v39 = 0.0;
    goto LABEL_18;
  }
  [v54 cornerRadius];
  double v39 = v55;
  v34 = [v44 cornerCurve];
  uint64_t v33 = [v44 cornerMask];
LABEL_18:

  memset(&v69, 0, sizeof(v69));
  [(PUOneUpPresentationHelper *)self _tilingViewTransitionTransform];
  [v18 bounds];
  CGAffineTransform v68 = v69;
  CGRect v78 = CGRectApplyAffineTransform(v77, &v68);
  CGAffineTransformMakeTranslation(&t2, -v78.origin.x, -v78.origin.y);
  CGAffineTransform t1 = v69;
  CGAffineTransformConcat(&v68, &t1, &t2);
  CGAffineTransform v69 = v68;
  v79.origin.double x = v22;
  v79.origin.double y = v24;
  v79.size.double width = v26;
  v79.size.double height = v28;
  CGRect v80 = CGRectApplyAffineTransform(v79, &v68);
  double x = v80.origin.x;
  double y = v80.origin.y;
  double width = v80.size.width;
  double height = v80.size.height;

  double v38 = v70;
  double v35 = v71;
  double v36 = *((double *)&v72 + 1);
  double v37 = *(double *)&v72;
LABEL_19:
  objc_msgSend(v5, "setContentsRect:", v38, v35, v37, v36);
  objc_msgSend(v5, "setAssetRect:", x, y, width, height);
  objc_msgSend(v5, "setCropInsets:", v73, v74);
  [v5 setCornerRadius:v39];
  [v5 setCornerCurve:v34];
  [v5 setCornerMask:v33];
  [(PUOneUpPresentationHelper *)self setLayoutRegionOfInterest:v20];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v56 = [v20 containingScrollViews];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v63 != v59) {
          objc_enumerationMutation(v56);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * i) _addScrollViewScrollObserver:self];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v58);
  }
}

- (void)_setAssetReferencesDisplayedInTilingView:(id)a3
{
  id v5 = (NSSet *)a3;
  BOOL v6 = v5;
  if (self->__assetReferencesDisplayedInTilingView != v5)
  {
    uint64_t v9 = v5;
    BOOL v7 = -[NSSet isEqualToSet:](v5, "isEqualToSet:");
    BOOL v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->__assetReferencesDisplayedInTilingView, a3);
      BOOL v6 = v9;
      if (self->_assetDisplayDelegateFlags.respondsToShouldHideAssetReferences)
      {
        uint64_t v8 = [(PUOneUpPresentationHelper *)self assetDisplayDelegate];
        [v8 oneUpPresentationHelper:self shouldHideAssetReferences:v9];

        BOOL v6 = v9;
      }
    }
  }
}

- (void)_setTransitioningTilingView:(id)a3
{
  BOOL v6 = (PUTilingView *)a3;
  transitioningTilingView = self->__transitioningTilingView;
  if (transitioningTilingView != v6)
  {
    long long v10 = v6;
    if (transitioningTilingView)
    {
      uint64_t v8 = [(PUTilingView *)transitioningTilingView tileUseDelegate];

      if (v8 != self)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1299, @"currently, only PUOneUpPresentationHelper is expecting to be a tileUseDelegate" object file lineNumber description];
      }
    }
    [(PUTilingView *)self->__transitioningTilingView setTileUseDelegate:0];
    objc_storeStrong((id *)&self->__transitioningTilingView, a3);
    [(PUTilingView *)self->__transitioningTilingView setTileUseDelegate:self];
    [(PUOneUpPresentationHelper *)self _updateAssetReferencesDisplayedInTilingView];
    BOOL v6 = v10;
  }
}

- (void)_setOneUpViewController:(id)a3
{
  BOOL v6 = (PUOneUpViewController *)a3;
  if (self->__oneUpViewController != v6)
  {
    objc_storeStrong((id *)&self->__oneUpViewController, a3);
    id v5 = [(PUOneUpViewController *)v6 browsingSession];
    [(PUOneUpPresentationHelper *)self _setBrowsingSession:v5];
  }
}

- (void)_setTilingView:(id)a3
{
  id v5 = (PUTilingView *)a3;
  tilingView = self->__tilingView;
  if (tilingView != v5)
  {
    BOOL v7 = v5;
    [(PUTilingView *)tilingView setUserInteractionEnabled:1];
    [(PUTilingView *)self->__tilingView setTileSource:0];
    [(PUTilingView *)self->__tilingView setTileTransitionDelegate:0];
    objc_storeStrong((id *)&self->__tilingView, a3);
    [(PUTilingView *)self->__tilingView setUserInteractionEnabled:0];
    [(PUTilingView *)self->__tilingView setTileSource:self];
    [(PUTilingView *)self->__tilingView setTileTransitionDelegate:self];
    [(PUOneUpPresentationHelper *)self _updateTapGestureRecognizer];
    id v5 = v7;
  }
}

- (void)_ensureRegistrationWithPresentingViewController
{
  int64_t v3 = [(PUOneUpPresentationHelper *)self presentingViewController];
  id v5 = v3;
  if (v3)
  {
    +[PUTilingViewTransitionHelper registerTransitionEndPoint:self forViewController:v3];
    int64_t v3 = v5;
  }
  uint64_t v4 = [v3 splitViewController];
  if (v4) {
    +[PUTilingViewTransitionHelper registerTransitionEndPoint:self forViewController:v4];
  }
}

- (id)_transitionHostingView
{
  int64_t v3 = [(PUOneUpPresentationHelper *)self presentingViewController];
  if ([(PUOneUpPresentationHelper *)self transitionType] == 2)
  {
LABEL_2:
    uint64_t v4 = [v3 viewIfLoaded];
    id v5 = [v4 window];

    while (1)
    {
      if (objc_msgSend(v3, "px_oneUpPresentationStyle") == 1)
      {
        if (v5) {
          goto LABEL_15;
        }
        BOOL v6 = PXAssertGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_fault_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_FAULT, "no window found to present 1-up full screen", v9, 2u);
        }
      }
      uint64_t v7 = [v3 parentViewController];
      if (!v7)
      {
        if ([v3 modalPresentationStyle] != 3) {
          break;
        }
        uint64_t v7 = [v3 presentingViewController];
        if (!v7) {
          break;
        }
      }

      int64_t v3 = (void *)v7;
      if (!v5) {
        goto LABEL_2;
      }
    }
  }
  id v5 = [v3 view];
LABEL_15:

  return v5;
}

- (void)_presentationEndDidTimeOut:(int64_t)a3
{
  if ([(PUOneUpPresentationHelper *)self _presentationEndTimeoutIdentifier] == a3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"One-up presentation took too long to end, this shouldn't happen. (state = %li)", -[PUOneUpPresentationHelper _state](self, "_state")];
    PLSimulateCrash();

    [(PUOneUpPresentationHelper *)self _cleanupOneUpViewControllerForDismissalIfNeeded];
  }
}

- (void)_setShouldPauseLibraryChanges:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->__shouldPauseLibraryChanges != a3)
  {
    BOOL v3 = a3;
    self->__shouldPauseLibraryChanges = a3;
    id v5 = [(PUOneUpPresentationHelper *)self libraryChangePauseToken];

    if (v5)
    {
      BOOL v6 = [(PUOneUpPresentationHelper *)self pausedPhotoLibrary];
      uint64_t v7 = [(PUOneUpPresentationHelper *)self libraryChangePauseToken];
      objc_msgSend(v6, "px_endPausingChanges:", v7);

      [(PUOneUpPresentationHelper *)self setPausedPhotoLibrary:0];
      [(PUOneUpPresentationHelper *)self setLibraryChangePauseToken:0];
    }
    if (v3)
    {
      uint64_t v8 = [(PUOneUpPresentationHelper *)self browsingSession];
      uint64_t v9 = [v8 viewModel];
      long long v10 = [v9 currentAssetReference];
      uint64_t v11 = [v10 asset];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;
      id v14 = [v13 photoLibrary];
      id v15 = v14;
      if (v14)
      {
        id v16 = objc_msgSend(v14, "px_beginPausingChangesWithTimeout:identifier:", @"PUOneUpPresentationHelper", 30.0);
        [(PUOneUpPresentationHelper *)self setLibraryChangePauseToken:v16];

        [(PUOneUpPresentationHelper *)self setPausedPhotoLibrary:v15];
      }
      else
      {
        uint64_t v17 = PLUIGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "_setShouldPauseLibraryChanges:YES called, but no PhotoLibrary available for displayAsset: %@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
}

- (void)_setEndingPresentation:(BOOL)a3
{
  if (self->__isEndingPresentation != a3)
  {
    BOOL v3 = a3;
    self->__isEndingPresentation = a3;
    id v5 = (void *)([(PUOneUpPresentationHelper *)self _presentationEndTimeoutIdentifier]+ 1);
    [(PUOneUpPresentationHelper *)self _setPresentationEndTimeoutIdentifier:v5];
    if (v3)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v6 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke;
      block[3] = &unk_1E5F2B980;
      objc_copyWeak(v8, &location);
      v8[1] = v5;
      dispatch_after(v6, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(v8);
      objc_destroyWeak(&location);
    }
  }
}

void __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke_2;
  v3[3] = &unk_1E5F2B980;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentationEndDidTimeOut:*(void *)(a1 + 40)];
}

- (void)_handleTileControllerAnimationEnd
{
  if ([(PUOneUpPresentationHelper *)self _state] == 5)
  {
    [(PUOneUpPresentationHelper *)self _cleanUpAfterTilingViewTransitionAnimated:1 transitionAborted:0];
  }
}

- (void)_throwOnSetStateFromIdleToTransitioningToOneUp:(int64_t)a3
{
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  dispatch_time_t v6 = [NSNumber numberWithInteger:self->__state];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  [v8 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1147, @"invalid one-up presentation helper state transition: %@ -> %@", v6, v7 object file lineNumber description];
}

- (void)_throwOnSetStateFromTransitionedToOneUpToPreparingTransitionToOneUp:(int64_t)a3
{
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  dispatch_time_t v6 = [NSNumber numberWithInteger:self->__state];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  [v8 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1143, @"invalid one-up presentation helper state transition: %@ -> %@", v6, v7 object file lineNumber description];
}

- (void)_setState:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int64_t state = self->__state;
  if (state == a3)
  {
    PLOneUpGetLog();
    id v5 = (PUBrowsingSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v6 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      double v30 = v6;
      _os_log_impl(&dword_1AE9F8000, &v5->super, OS_LOG_TYPE_DEFAULT, "Attempting to set state with same value: %@", buf, 0xCu);
    }
    goto LABEL_49;
  }
  if (a3 == 1)
  {
    uint64_t v9 = PLOneUpGetLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      long long v10 = v9;
      os_signpost_type_t v11 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, v11, 0xEEEEB0B5B2B2EEEELL, "presenting", "", buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (a3 != 7)
  {
    if (a3 != 3) {
      goto LABEL_13;
    }
    uint64_t v9 = PLOneUpGetLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      long long v10 = v9;
      os_signpost_type_t v11 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_11;
    }
LABEL_12:

    int64_t state = self->__state;
LABEL_13:
    switch(state)
    {
      case 0:
        if (a3 != 1) {
          goto LABEL_32;
        }
        break;
      case 1:
        if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 2) {
          goto LABEL_25;
        }
        break;
      case 2:
        if ((unint64_t)(a3 - 3) >= 2) {
          goto LABEL_25;
        }
        break;
      case 3:
        if (a3 != 4)
        {
          if (a3 == 1) {
            [(PUOneUpPresentationHelper *)self _throwOnSetStateFromTransitionedToOneUpToPreparingTransitionToOneUp:1];
          }
          goto LABEL_32;
        }
        break;
      case 4:
        if (a3 != 2 && a3 != 5) {
          goto LABEL_25;
        }
        break;
      case 5:
        if ((unint64_t)a3 > 6 || ((1 << a3) & 0x46) == 0) {
          goto LABEL_32;
        }
        break;
      case 6:
        if ((unint64_t)a3 >= 2) {
          goto LABEL_32;
        }
        break;
      case 7:
        break;
      default:
LABEL_25:
        if (!a3 && state == 2) {
          [(PUOneUpPresentationHelper *)self _throwOnSetStateFromIdleToTransitioningToOneUp:0];
        }
LABEL_32:
        uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
        id v13 = [NSNumber numberWithInteger:self->__state];
        id v14 = [NSNumber numberWithInteger:a3];
        [v12 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 1082, @"invalid one-up presentation helper state transition: %@ -> %@", v13, v14 object file lineNumber description];

        break;
    }
  }
  id v15 = PLOneUpGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [NSNumber numberWithInteger:self->__state];
    uint64_t v17 = [NSNumber numberWithInteger:a3];
    *(_DWORD *)buf = 138412546;
    double v30 = v16;
    __int16 v31 = 2112;
    uint64_t v32 = v17;
    _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "Committing change from old state: %@ to new state: %@", buf, 0x16u);
  }
  uint64_t v18 = 0;
  self->__int64_t state = a3;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x16) != 0) {
    uint64_t v18 = [(PUOneUpPresentationHelper *)self _isPerformingNonAnimatedPush] ^ 1;
  }
  [(PUOneUpPresentationHelper *)self _setShouldPauseLibraryChanges:v18];
  id v5 = self->_browsingSession;
  uint64_t v19 = [(PUBrowsingSession *)v5 viewModel];
  if ([(PUOneUpPresentationHelper *)self isOneUpPresented])
  {
    PLIsCamera();
    char v20 = 1;
  }
  else
  {
    int64_t v21 = [(PUOneUpPresentationHelper *)self _state];
    char v22 = PLIsCamera();
    if (v21 == 5) {
      char v20 = 1;
    }
    else {
      char v20 = v22 ^ 1;
    }
    if ((v22 & 1) == 0 && v21 != 5) {
      char v20 = [(PUOneUpPresentationHelper *)self _state] == 6;
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __39__PUOneUpPresentationHelper__setState___block_invoke;
  v25[3] = &unk_1E5F2BD48;
  id v23 = v19;
  id v26 = v23;
  char v27 = v20;
  char v28 = v18;
  [v23 performChanges:v25];
  [(PUOneUpPresentationHelper *)self _setEndingPresentation:(unint64_t)(self->__state - 5) < 3];
  if (self->_delegateFlags.respondsToStateDidChange)
  {
    CGFloat v24 = [(PUOneUpPresentationHelper *)self delegate];
    [v24 oneUpPresentationHelperStateDidChange:self];
  }
LABEL_49:
}

uint64_t __39__PUOneUpPresentationHelper__setState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVideoContentAllowed:*(unsigned __int8 *)(a1 + 40) forReason:@"OneUpIsPresented"];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 41);
  return [v2 setAnimating:v3 transitionWithIdentifier:@"OneUp"];
}

- (BOOL)_handleInteractivePresentationWithBlock:(id)a3
{
  id v5 = (void (**)(id, void *, void *, void *))a3;
  dispatch_time_t v6 = [(PUOneUpPresentationHelper *)self _currentTilingViewControllerTransition];
  uint64_t v7 = v6;
  if (v6 && [v6 isTransitionPaused])
  {
    id v8 = [(PUOneUpPresentationHelper *)self _transitioningTilingView];
    if (!v8)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 998, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke;
    aBlock[3] = &unk_1E5F2D8C0;
    id v9 = v7;
    id v17 = v9;
    long long v10 = _Block_copy(aBlock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke_2;
    v14[3] = &unk_1E5F2E1C0;
    v14[4] = self;
    id v15 = v9;
    os_signpost_type_t v11 = _Block_copy(v14);
    v5[2](v5, v8, v10, v11);
  }
  return v7 != 0;
}

uint64_t __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) updatePausedTransitionWithProgress:a2 interactionProgress:a2];
}

uint64_t __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0 && [*(id *)(a1 + 32) _state] != 1)
  {
    uint64_t v4 = PLOneUpGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v6 = 0;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Interactive transition was terminated while in preparing state", v6, 2u);
    }

    [*(id *)(a1 + 32) _setState:4];
  }
  return [*(id *)(a1 + 40) resumeTransition:a2];
}

- (BOOL)handlePresentingPanGestureRecognizer:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PUOneUpPresentationHelper_handlePresentingPanGestureRecognizer___block_invoke;
  v7[3] = &unk_1E5F27CF8;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(PUOneUpPresentationHelper *)self _handleInteractivePresentationWithBlock:v7];

  return (char)self;
}

void __66__PUOneUpPresentationHelper_handlePresentingPanGestureRecognizer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  uint64_t v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) _panDirectionValueFilter];
  if (!v9)
  {
    id v9 = objc_alloc_init(PUChangeDirectionValueFilter);
    [(PUChangeDirectionValueFilter *)v9 setMinimumChangeValue:15.0];
    [*(id *)(a1 + 32) _setPanDirectionValueFilter:v9];
  }
  [*(id *)(a1 + 40) translationInView:v15];
  [(PUValueFilter *)v9 setInputValue:-v10];
  [(PUValueFilter *)v9 outputValue];
  double v12 = v11;
  uint64_t v13 = [*(id *)(a1 + 40) state];
  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == 2)
    {
      v14.n128_u64[0] = 0;
      if (v12 >= 0.0) {
        v14.n128_f64[0] = 1.0;
      }
      v7[2](v7, v14);
    }
  }
  else
  {
    v8[2](v8, v12 >= 0.0);
    [*(id *)(a1 + 32) _setPanDirectionValueFilter:0];
  }
}

- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PUOneUpPresentationHelper_handlePresentingPinchGestureRecognizer___block_invoke;
  v7[3] = &unk_1E5F27CF8;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(PUOneUpPresentationHelper *)self _handleInteractivePresentationWithBlock:v7];

  return (char)self;
}

void __68__PUOneUpPresentationHelper_handlePresentingPinchGestureRecognizer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  uint64_t v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) _pinchedTileTracker];
  if (!v9)
  {
    id v9 = [[PUPinchedTileTracker alloc] initWithPinchGestureRecognizer:*(void *)(a1 + 40) tilingView:v10 direction:1];
    [(PUPinchedTileTracker *)v9 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) _setPinchedTileTracker:v9];
  }
  [(PUInteractiveTileTracker *)v9 update];
  if ([(PUInteractiveTileTracker *)v9 shouldEnd])
  {
    v8[2](v8, [(PUInteractiveTileTracker *)v9 shouldFinish]);
    [*(id *)(a1 + 32) _setPinchedTileTracker:0];
  }
  else
  {
    [(PUInteractiveTileTracker *)v9 progress];
    v7[2](v7);
  }
}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  if ([(PUOneUpPresentationHelper *)self _state] == 2) {
    [(PUOneUpPresentationHelper *)self _didFinishTransitioningToOneUp];
  }
  self->_isPresentingViewControllerAppearingWithIdleState = 0;
}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  if ([(PUOneUpPresentationHelper *)self _isEndingPresentation]) {
    [(PUOneUpPresentationHelper *)self _cleanupOneUpViewControllerForDismissalIfNeeded];
  }
  self->_isPresentingViewControllerAppearingWithIdleState = 0;
}

- (void)_cleanupOneUpViewControllerForDismissalIfNeeded
{
  int64_t v3 = [(PUOneUpPresentationHelper *)self _state];
  if ((unint64_t)(v3 - 2) < 3)
  {
    [(PUOneUpPresentationHelper *)self _setState:4];
    [(PUOneUpPresentationHelper *)self _setState:5];
LABEL_8:
    [(PUOneUpPresentationHelper *)self _cleanUpAfterTilingViewTransitionAnimated:0 transitionAborted:0];
    goto LABEL_9;
  }
  if (v3 == 5) {
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    id v4 = PLOneUpGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to clean up while preparing the transition", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PUOneUpPresentationHelper__cleanupOneUpViewControllerForDismissalIfNeeded__block_invoke;
    block[3] = &unk_1E5F2E530;
    objc_copyWeak(&v8, buf);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
LABEL_9:
  id v5 = [(PUOneUpPresentationHelper *)self _disappearingTilingView];
  dispatch_time_t v6 = v5;
  if (v5)
  {
    [v5 removeFromSuperview];
    [(PUOneUpPresentationHelper *)self _disappearingTilingView:v6 animationCompleted:1];
  }
}

void __76__PUOneUpPresentationHelper__cleanupOneUpViewControllerForDismissalIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupOneUpViewControllerForDismissalIfNeeded];
}

- (BOOL)dismissOneUpViewControllerForced:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
  if (!v8) {
    goto LABEL_27;
  }
  BOOL v9 = [(PUOneUpPresentationHelper *)self _prepareDismissalForced:v5];
  if (v5 || v9)
  {
    if (!v4) {
      [(PUOneUpPresentationHelper *)self _cleanupOneUpViewControllerForDismissalIfNeeded];
    }
    double v11 = [(PUOneUpPresentationHelper *)self presentingViewController];
    double v12 = [v11 navigationController];
    if (v12) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    __n128 v14 = objc_msgSend(v11, "px_splitViewController");

    if (v14) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v13;
    }
    if (self->_delegateFlags.respondsToTransitionTypeWithProposedTransitionType)
    {
      id v16 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v15 = [v16 oneUpPresentationHelper:self transitionTypeWithProposedTransitionType:v15];
    }
    switch(v15)
    {
      case 2:
        objc_msgSend(v11, "pu_dismissViewControllerAnimated:interactive:completion:", v4, 0, 0);
        break;
      case 1:
        if (!v12)
        {
          int64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:a2, self, @"PUOneUpPresentationHelper.m", 814, @"Invalid parameter not satisfying: %@", @"navigationController != nil" object file lineNumber description];
        }
        uint64_t v18 = [v12 topViewController];

        if (v18 == v8)
        {
          objc_msgSend(v12, "pu_popViewControllerAnimated:interactive:", v4, 0);
          break;
        }
        id v17 = PLUIGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v12 childViewControllers];
          *(_DWORD *)buf = 138412546;
          id v23 = v8;
          __int16 v24 = 2112;
          double v25 = v19;
          _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "attempting to pop oneUpViewController:%@ that isn't part of the navigation controller's children:%@", buf, 0x16u);
        }
        goto LABEL_25;
      case 0:
        id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"PUOneUpPresentationHelper.m" lineNumber:810 description:@"undefined transition type"];
LABEL_25:

        break;
    }

LABEL_27:
    BOOL v10 = 1;
    goto LABEL_28;
  }
  BOOL v10 = 0;
LABEL_28:

  return v10;
}

- (BOOL)_prepareDismissalForced:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
  BOOL v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PUOneUpPresentationHelper__prepareDismissalForced___block_invoke;
    v11[3] = &__block_descriptor_33_e26_B16__0__UIViewController_8l;
    BOOL v12 = v3;
    int v6 = objc_msgSend(v4, "pl_visitControllerHierarchyWithBlock:", v11);
    char v7 = v6;
    if ([v5 conformsToProtocol:&unk_1F08626D8])
    {
      id v8 = [v5 overOneUpPresentationSessionCreateIfNeeded:0];
      BOOL v9 = v8;
      if (v8) {
        char v7 = 0;
      }
      else {
        char v7 = v6;
      }
      if (v8 && ((v6 ^ 1) & 1) == 0) {
        char v7 = [v8 prepareForDismissingForced:v3];
      }
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

uint64_t __53__PUOneUpPresentationHelper__prepareDismissalForced___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F07DFE40]) {
    uint64_t v4 = [v3 prepareForDismissingForced:*(unsigned __int8 *)(a1 + 32)];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)canDismissOneUpViewController
{
  return [(PUOneUpPresentationHelper *)self _prepareDismissalForced:0];
}

- (void)presentOneUpViewControllerFromAssetAtIndexPath:(id)a3 animated:(BOOL)a4 interactiveMode:(int64_t)a5 activity:(unint64_t)a6 editActivityCompletion:(id)a7
{
  BOOL v9 = a4;
  id v14 = a7;
  if (a3)
  {
    id v12 = a3;
    uint64_t v13 = [(PUOneUpPresentationHelper *)self browsingSession];
    [(PUOneUpPresentationHelper *)self _navigateToAssetAtIndexPath:v12 inBrowsingSession:v13];
  }
  [(PUOneUpPresentationHelper *)self presentOneUpViewControllerAnimated:v9 interactiveMode:a5 activity:a6 editActivityCompletion:v14];
}

- (void)presentOneUpViewControllerAnimated:(BOOL)a3 interactiveMode:(int64_t)a4
{
}

- (void)presentOneUpViewControllerAnimated:(BOOL)a3 interactiveMode:(int64_t)a4 activity:(unint64_t)a5 editActivityCompletion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  if ([(PUOneUpPresentationHelper *)self canPresentOneUpViewControllerAnimated:v8])
  {
    double v11 = [(PUOneUpPresentationHelper *)self delegate];
    uint64_t v12 = [v11 oneUpPresentationOrigin:self];

    [(PUOneUpPresentationHelper *)self set_presentationOrigin:v12];
    [MEMORY[0x1E4F8FF88] transitionPreparationDidBegin:1 fromOrigin:v12 transitionObject:self];
    uint64_t v13 = (void *)*MEMORY[0x1E4FB2608];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke;
    v62[3] = &unk_1E5F2E0A8;
    v62[4] = self;
    v62[5] = v12;
    [v13 installCACommitCompletionBlock:v62];
    id v14 = [(PUOneUpPresentationHelper *)self _disappearingTilingView];

    if (v14)
    {
      uint64_t v15 = [(PUOneUpPresentationHelper *)self _disappearingTilingView];
      [v15 removeFromSuperview];

      [(PUOneUpPresentationHelper *)self _setDisappearingTilingView:0];
    }
    unint64_t v48 = a5;
    id v16 = PLOneUpGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Updating state from presentOneUpViewControllerAnimated", (uint8_t *)&buf, 2u);
    }

    [(PUOneUpPresentationHelper *)self _setState:1];
    id v17 = [(PUOneUpPresentationHelper *)self browsingSession];
    id v18 = [(PUOneUpPresentationHelper *)self _oneUpViewController];
    double v50 = [(PUOneUpPresentationHelper *)self presentingViewController];
    [(PUOneUpPresentationHelper *)self _ensureRegistrationWithPresentingViewController];
    uint64_t v19 = [v17 viewModel];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_314;
    v59[3] = &unk_1E5F2ECC8;
    id v20 = v19;
    id v60 = v20;
    id v21 = v17;
    id v61 = v21;
    [v20 performChanges:v59];
    char v22 = [(PUOneUpPresentationHelper *)self _tilingView];
    int64_t v49 = a4;
    if (self->_delegateFlags.respondsToAdditionalOptions)
    {
      id v23 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v24 = [v23 oneUpPresentationHelperAdditionalOptions:self];
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (self->_delegateFlags.respondsToShouldLeaveContentOnSecondScreen)
    {
      double v25 = [(PUOneUpPresentationHelper *)self delegate];
      int v26 = [v25 oneUpPresentationHelperShouldLeaveContentOnSecondScreen:self];

      if (v26) {
        v24 |= 4uLL;
      }
    }
    if (v8 || v18)
    {
      id v29 = [(PUOneUpPresentationHelper *)self _newCollapsedLayout];
      if (v22)
      {
        double v30 = [(PUTilingView *)v22 tileTransitionDelegate];
        if (!v8) {
          [(PUTilingView *)v22 setTileTransitionDelegate:0];
        }
        [(PUTilingView *)v22 transitionToLayout:v29];
        [(PUTilingView *)v22 layoutIfNeeded];
        [(PUTilingView *)v22 setTileTransitionDelegate:v30];
      }
      else
      {
        double v30 = [v50 view];
        __int16 v31 = [(PUOneUpPresentationHelper *)self _transitionHostingView];
        [v31 bounds];
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        memset(&buf, 0, sizeof(buf));
        [(PUOneUpPresentationHelper *)self _tilingViewTransitionTransform];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v55 = 0u;
        v63.origin.double x = v33;
        v63.origin.double y = v35;
        v63.size.double width = v37;
        v63.size.double height = v39;
        CGRectGetMidX(v63);
        v64.origin.double x = v33;
        v64.origin.double y = v35;
        v64.size.double width = v37;
        v64.size.double height = v39;
        CGRectGetMidY(v64);
        PXAffineTransformOffsetFixpoint();
        memset(&v54, 0, sizeof(v54));
        v65.origin.double x = v33;
        v65.origin.double y = v35;
        v65.size.double width = v37;
        v65.size.double height = v39;
        CGRect v66 = CGRectApplyAffineTransform(v65, &v54);
        double v47 = v31;
        objc_msgSend(v30, "convertRect:fromCoordinateSpace:", v31, v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
        char v22 = -[PUTilingView initWithFrame:layout:]([PUTilingView alloc], "initWithFrame:layout:", v29, v40, v41, v42, v43);
        CGAffineTransform v54 = buf;
        CGAffineTransformInvert(&v53, &v54);
        [(PUTilingView *)v22 setTransform:&v53];
        if ((v24 & 0x10000) != 0)
        {
          double v46 = [(PUOneUpPresentationHelper *)self presentingViewController];
          long long v44 = [v46 traitCollection];
          -[PUTilingView setOverrideUserInterfaceStyle:](v22, "setOverrideUserInterfaceStyle:", [v44 userInterfaceStyle]);
        }
        if ((v24 & 2) == 0) {
          [(PUTilingView *)v22 configureDynamicRangeProperties];
        }
        [v30 addSubview:v22];
        v45 = [(PUOneUpPresentationHelper *)self browsingSession];
        [v45 configureTilingView:v22];
        [(PUOneUpPresentationHelper *)self _setTilingView:v22];
        [(PUOneUpPresentationHelper *)self _setTransitioningTilingView:v22];
      }
      if (!v18)
      {
        id v18 = [(PUOneUpPresentationHelper *)self _createOneUpViewControllerWithBrowsingSession:v21 options:v24 | 1 activity:v48 editActivityCompletion:v10];
      }
      [(PUOneUpPresentationHelper *)self _presentOneUpViewController:v18 animated:1 interactiveMode:v49 completion:0];
    }
    else
    {
      if (v22)
      {
        char v27 = [(PUOneUpPresentationHelper *)self _createOneUpViewControllerWithBrowsingSession:v21 options:v24 | 1 activity:v48 editActivityCompletion:v10];
        char v28 = [v27 tilingViewControllerTransitionTilingViewHostView:0];
        [v28 bounds];
        -[PUTilingView setFrame:](v22, "setFrame:");
        [(PUTilingView *)v22 setAutoresizingMask:18];
        [v28 addSubview:v22];
        [(PUOneUpPresentationHelper *)self _setTilingView:0];
        [v27 tilingViewControllerTransition:0 adoptTilingView:v22 fromEndPoint:0 isCancelingTransition:0 animationSetupCompletionHandler:0];
      }
      else
      {
        char v27 = [(PUOneUpPresentationHelper *)self _createOneUpViewControllerWithBrowsingSession:v21 options:v24 activity:v48 editActivityCompletion:v10];
        [v27 setAppearanceTransitionAnimationsDisabled:1];
      }
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_2;
      v51[3] = &unk_1E5F2ED10;
      id v18 = v27;
      id v52 = v18;
      [(PUOneUpPresentationHelper *)self _presentOneUpViewController:v18 animated:0 interactiveMode:v49 completion:v51];
      id v29 = v52;
    }
  }
}

uint64_t __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F8FF88] transitionAnimationDidBegin:1 fromOrigin:*(void *)(a1 + 40) transitionObject:*(void *)(a1 + 32)];
}

uint64_t __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_314(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isChromeVisible] & 1) == 0)
  {
    dispatch_time_t v2 = [*(id *)(a1 + 40) dataSourceManager];
    id v3 = [v2 assetsDataSource];
    int v4 = [v3 isEmpty];

    if (v4) {
      [*(id *)(a1 + 32) setChromeVisible:1];
    }
  }
  BOOL v5 = *(void **)(a1 + 32);
  return [v5 setIsPresentedForPreview:0];
}

uint64_t __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppearanceTransitionAnimationsDisabled:0];
}

- (CGAffineTransform)_tilingViewTransitionTransform
{
  BOOL v5 = [(PUOneUpPresentationHelper *)self _transitionHostingView];
  int v6 = v5;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  if (v5) {
    [v5 transform];
  }
  char v7 = [(PUOneUpPresentationHelper *)self presentingViewController];
  BOOL respondsToPreferredPresentationOrientation = self->_delegateFlags.respondsToPreferredPresentationOrientation;
  uint64_t v9 = [v7 supportedInterfaceOrientations];
  if (respondsToPreferredPresentationOrientation && v9 == 2)
  {
    id v10 = [(PUOneUpPresentationHelper *)self delegate];
    uint64_t v11 = [v10 oneUpPresentationHelperPreferredPresentationOrientation:self];

    switch(v11)
    {
      case 0:
      case 1:
        uint64_t v12 = MEMORY[0x1E4F1DAB8];
        long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&retstr->c = v13;
        long long v14 = *(_OWORD *)(v12 + 32);
        goto LABEL_11;
      case 2:
        CGFloat v15 = 3.14159265;
        goto LABEL_10;
      case 3:
        CGFloat v15 = -1.57079633;
        goto LABEL_10;
      case 4:
        CGFloat v15 = 1.57079633;
LABEL_10:
        CGAffineTransformMakeRotation(&v19, v15);
        long long v16 = *(_OWORD *)&v19.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
        *(_OWORD *)&retstr->c = v16;
        long long v14 = *(_OWORD *)&v19.tx;
LABEL_11:
        *(_OWORD *)&retstr->tdouble x = v14;
        break;
      default:
        break;
    }
    UIIntegralTransform();
    long long v17 = *(_OWORD *)&v19.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v19.tx;
  }

  return result;
}

- (BOOL)canPresentOneUpViewControllerAnimated:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(PUOneUpPresentationHelper *)self _state];
  if ((unint64_t)(v6 - 1) >= 4)
  {
    id v3 = [(PUOneUpPresentationHelper *)self presentingViewController];
    char v7 = objc_msgSend(v3, "px_canPresentViewControllerAnimated:", v4);
  }
  else
  {
    char v7 = 0;
  }
  if ((unint64_t)(v6 - 1) >= 3)
  {
    if (v6 == 4) {
      return v7;
    }

    if (v7) {
      return v7;
    }
  }
  else if (v7)
  {
    return v7;
  }
  BOOL v8 = PXAssertGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[PUOneUpPresentationHelper _state](self, "_state"));
    uint64_t v11 = [NSNumber numberWithBool:v4];
    uint64_t v12 = NSNumber;
    long long v13 = [(PUOneUpPresentationHelper *)self presentingViewController];
    long long v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "px_isVisible"));
    CGFloat v15 = [(PUOneUpPresentationHelper *)self presentingViewController];
    long long v16 = [v15 presentedViewController];
    int v18 = 138413058;
    CGAffineTransform v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = (id)objc_opt_class();
    id v17 = v25;
    _os_log_fault_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_FAULT, "Unable to present 1-Up. State: %@, Animated?: %@, Visible?: %@, PresentedViewController?: %@", (uint8_t *)&v18, 0x2Au);
  }
  return v7;
}

- (void)_configureNavigationController:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_delegateFlags.respondsToEnableFreezeLayoutOnOrientationChange)
  {
    BOOL v5 = [(PUOneUpPresentationHelper *)self delegate];
    uint64_t v6 = [v5 oneUpPresentationHelperEnableFreezeLayoutOnOrientationChange:self];

    [v12 _setAllowsFreezeLayoutForOrientationChangeOnDismissal:v6];
    id v4 = v12;
  }
  [v4 setModalPresentationStyle:0];
  char v7 = [(PUOneUpPresentationHelper *)self delegate];
  BOOL v8 = v7;
  if (self->_delegateFlags.respondsToAdditionalOptions
    && ([v7 oneUpPresentationHelperAdditionalOptions:self] & 0x10000) != 0)
  {
    uint64_t v9 = [(PUOneUpPresentationHelper *)self presentingViewController];
    id v10 = [v9 traitCollection];
    objc_msgSend(v12, "setOverrideUserInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));
  }
  if (self->_delegateFlags.respondsToOriginalViewController)
  {
    uint64_t v11 = [v8 oneUpPresentationHelperOriginalViewController:self];
  }
  else
  {
    uint64_t v11 = 0;
  }
  [v12 setViewControllerForStatusBarStyleWhenDisappearing:v11];
}

- (void)_presentOneUpViewController:(id)a3 animated:(BOOL)a4 interactiveMode:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (void (**)(void))a6;
  [(PUOneUpPresentationHelper *)self _setOneUpViewController:v11];
  long long v13 = [(PUOneUpPresentationHelper *)self presentingViewController];
  if (!v13)
  {
    CGFloat v37 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpPresentationHelper.m", 437, @"presentingViewController is nil when presenting 1Up (int64_t state = %ti)", -[PUOneUpPresentationHelper _state](self, "_state"));
  }
  long long v14 = [v13 navigationController];
  int64_t v15 = [(PUOneUpPresentationHelper *)self transitionType];
  if (self->_delegateFlags.respondsToWillPresentOneUpViewController)
  {
    long long v16 = [(PUOneUpPresentationHelper *)self delegate];
    [v16 oneUpPresentationHelper:self willPresentOneUpViewController:v11];
  }
  if (!v8)
  {
    id v17 = PLOneUpGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "Updating state from _presentOneUpViewController", buf, 2u);
    }

    [(PUOneUpPresentationHelper *)self _setState:2];
  }
  if (a5) {
    int v18 = (PUNavigationController *)v8;
  }
  else {
    int v18 = 0;
  }
  if (v15 == 2)
  {
    __int16 v20 = [[PUTilingViewModalTransition alloc] initWithEndPoint:self];
    id v21 = v18;
    int v18 = [[PUNavigationController alloc] initWithRootViewController:v11];
    [(PUOneUpPresentationHelper *)self _configureNavigationController:v18];
    [MEMORY[0x1E4F903C8] viewController:v13 willPresentOneUpInViewController:v18];
    objc_msgSend(v13, "pu_presentViewController:transition:animated:interactive:completion:", v18, v20, v8, v21, v12);

    LODWORD(v18) = v21;
    goto LABEL_36;
  }
  if (v15 == 1)
  {
    SEL v42 = a2;
    __int16 v20 = [[PUTilingViewNavigationTransition alloc] initWithEndPoint:self];
    if (!v14)
    {
      unsigned int v39 = v18;
      int64_t v40 = a5;
      double v41 = v12;
      __int16 v22 = [NSString stringWithFormat:@"here is presentingViewController's hierarchy :\n - %@\n", v13];
      uint64_t v23 = [v13 parentViewController];
      if (v23)
      {
        __int16 v24 = (void *)v23;
        do
        {
          id v25 = [v22 stringByAppendingFormat:@" - %@\n", v24];

          uint64_t v26 = [v24 parentViewController];

          __int16 v22 = v25;
          __int16 v24 = (void *)v26;
        }
        while (v26);
      }
      else
      {
        id v25 = v22;
      }
      char v27 = PLOneUpGetLog();
      char v28 = (void *)&unk_1AEFEB000;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v29 = [MEMORY[0x1E4FB1438] sharedApplication];
        double v30 = objc_msgSend(v29, "px_firstKeyWindow");
        __int16 v31 = [v30 recursiveDescription];
        *(_DWORD *)CGAffineTransform buf = 138412290;
        long long v44 = v31;
        _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_ERROR, "navigationController is nil when presenting 1Up, view hierarchy => %@", buf, 0xCu);

        char v28 = &unk_1AEFEB000;
      }

      double v32 = PLOneUpGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CGAffineTransform buf = v28[429];
        long long v44 = v25;
        _os_log_impl(&dword_1AE9F8000, v32, OS_LOG_TYPE_ERROR, "navigationController is nil when presenting 1Up, presentingViewController's VC hierarchy: %@", buf, 0xCu);
      }

      CGFloat v33 = PLOneUpGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        double v34 = [MEMORY[0x1E4FB1EC0] _printHierarchy];
        *(_DWORD *)CGAffineTransform buf = v28[429];
        long long v44 = v34;
        _os_log_impl(&dword_1AE9F8000, v33, OS_LOG_TYPE_ERROR, "navigationController is nil when presenting 1Up, main window hierarchy: %@", buf, 0xCu);
      }
      CGFloat v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:v42, self, @"PUOneUpPresentationHelper.m", 477, @"navigationController is nil when presenting 1Up (int64_t state = %ti, presentingVC = %@)\n presentingViewController's VC hierarchy: %@", -[PUOneUpPresentationHelper _state](self, "_state"), v13, v25 object file lineNumber description];

      a5 = v40;
      id v12 = v41;
      long long v14 = 0;
      int v18 = (PUNavigationController *)v39;
    }
    objc_msgSend(v14, "pu_pushViewController:withTransition:animated:isInteractive:", v11, v20, v8, v18);
    if (v12 && v8)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      int v38 = (int)v18;
      int v18 = (PUNavigationController *)objc_claimAutoreleasedReturnValue();
      [(PUNavigationController *)v18 handleFailureInMethod:v42 object:self file:@"PUOneUpPresentationHelper.m" lineNumber:481 description:@"_presentOneUpViewController does not support completion handlers for navigation transitions when animated"];

      LODWORD(v18) = v38;
    }
    else if (!v12)
    {
      goto LABEL_36;
    }
    if (!v8) {
      v12[2](v12);
    }
  }
  else
  {
    if (!v15)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      int v19 = (int)v18;
      int v18 = (PUNavigationController *)objc_claimAutoreleasedReturnValue();
      [(PUNavigationController *)v18 handleFailureInMethod:a2 object:self file:@"PUOneUpPresentationHelper.m" lineNumber:456 description:@"undefined transition type"];

      LODWORD(v18) = v19;
    }
    __int16 v20 = 0;
  }
LABEL_36:
  if (v18)
  {
    if (a5 == 2) {
      uint64_t v36 = 30;
    }
    else {
      uint64_t v36 = 0;
    }
    [(PUTilingViewModalTransition *)v20 pauseTransitionWithOptions:v36];
  }
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (UIViewController)topmostPresentedViewController
{
  dispatch_time_t v2 = [(PUOneUpPresentationHelper *)self presentingViewController];
  id v3 = objc_msgSend(v2, "px_topmostPresentedViewController");
  id v4 = v3;
  if (!v3) {
    id v3 = v2;
  }
  BOOL v5 = v3;

  return v5;
}

- (UIViewController)presentingViewController
{
  [(PUOneUpPresentationHelper *)self _updatePresentationInfoIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (BOOL)pausingPhotoLibraryChanges
{
  dispatch_time_t v2 = [(PUOneUpPresentationHelper *)self pausedPhotoLibrary];
  BOOL v3 = v2 != 0;

  return v3;
}

- (PXAssetReference)lastViewedAssetReference
{
  dispatch_time_t v2 = [(PUOneUpPresentationHelper *)self browsingSession];
  BOOL v3 = [v2 viewModel];
  id v4 = [v3 lastViewedAssetReference];
  BOOL v5 = [v4 pxAssetReference];

  return (PXAssetReference *)v5;
}

- (BOOL)isOneUpPresented
{
  return (unint64_t)([(PUOneUpPresentationHelper *)self _state] - 1) < 4;
}

- (id)_createBrowsingSession
{
  if (PLIsCamera()
    && ([MEMORY[0x1E4F902D0] sharedInstance],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 externalOneUpForceEnable],
        v3,
        v4))
  {
    BOOL v5 = +[PUImportBrowsingSession withDeviceMedia];
  }
  else
  {
    uint64_t v6 = [(PUOneUpPresentationHelper *)self _browsingSessionCreationBlock];
    BOOL v5 = v6[2]();
  }
  if (self->_delegateFlags.respondsToSearchContext)
  {
    char v7 = [(PUOneUpPresentationHelper *)self delegate];
    BOOL v8 = [v7 oneUpPresentationHelperSearchQueryMatchInfo:self];
    uint64_t v9 = [v5 viewModel];
    [v9 setSearchQueryMatchInfo:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (self->_delegateFlags.respondsToMatchedSceneIdentifiers)
    {
      id v11 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v12 = [v11 oneUpPresentationHelperMatchedSceneIdentifiers:self];
      long long v13 = (void *)v12;
      if (v12) {
        long long v14 = (void *)v12;
      }
      else {
        long long v14 = v10;
      }
      id v58 = v14;
    }
    else
    {
      id v58 = 0;
    }
    long long v56 = v5;
    if (self->_delegateFlags.respondsToMatchedAudioIdentifiers)
    {
      int64_t v15 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v16 = [v15 oneUpPresentationHelperMatchedAudioIdentifiers:self];
      id v17 = (void *)v16;
      if (v16) {
        int v18 = (void *)v16;
      }
      else {
        int v18 = v10;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    if (self->_delegateFlags.respondsToMatchedHumanActionIdentifiers)
    {
      __int16 v20 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v21 = [v20 oneUpPresentationHelperMatchedHumanActionIdentifiers:self];
      __int16 v22 = (void *)v21;
      if (v21) {
        uint64_t v23 = (void *)v21;
      }
      else {
        uint64_t v23 = v10;
      }
      id v57 = v23;
    }
    else
    {
      id v57 = 0;
    }
    if (self->_delegateFlags.respondsToMatchedPersonLocalIdentifiers)
    {
      __int16 v24 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v25 = [v24 oneUpPresentationHelperMatchedPersonLocalIdentifiers:self];
      uint64_t v26 = (void *)v25;
      if (v25) {
        char v27 = (void *)v25;
      }
      else {
        char v27 = v10;
      }
      id v28 = v27;
    }
    else
    {
      id v28 = 0;
    }
    if (self->_delegateFlags.respondsToTextsToHighlight)
    {
      id v29 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v30 = [v29 oneUpPresentationHelperTextsToHighlight:self];
      __int16 v31 = (void *)v30;
      if (v30) {
        double v32 = (void *)v30;
      }
      else {
        double v32 = v10;
      }
      id v33 = v32;
    }
    else
    {
      id v33 = 0;
    }
    if (self->_delegateFlags.respondsToAssetUUIDsAllowedToHighlightText)
    {
      double v34 = [(PUOneUpPresentationHelper *)self delegate];
      uint64_t v35 = [v34 oneUpPresentationHelperAssetUUIDsAllowedToHighlightText:self];
      uint64_t v36 = (void *)v35;
      if (v35) {
        CGFloat v37 = (void *)v35;
      }
      else {
        CGFloat v37 = v10;
      }
      id v38 = v37;
    }
    else
    {
      id v38 = 0;
    }
    CGAffineTransform v54 = [v33 firstObject];
    id v39 = objc_alloc(MEMORY[0x1E4F90648]);
    int64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v58];
    long long v55 = v28;
    double v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v28];
    SEL v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v19];
    double v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v57];
    long long v44 = (void *)[v39 initWithLocalizedQueryString:v54 matchedSceneIdentifiers:v40 personLocalIdentifiers:v41 audioIdentifiers:v42 humanActionIdentifiers:v43 ocrTexts:v33 ocrAssetUUIDS:v38 queryEmbedding:0 countOfQueryTerms:0];
    BOOL v5 = v56;
    [v56 viewModel];
    v45 = CGAffineTransform v53 = v33;
    [v45 setSearchQueryMatchInfo:v44];

    BOOL v8 = v19;
    char v7 = v58;

    uint64_t v9 = v57;
  }

  double v46 = [(PUOneUpPresentationHelper *)self presentingViewController];
  if (v46)
  {
    while (1)
    {
      double v47 = [v46 viewIfLoaded];
      unint64_t v48 = [v47 window];

      if (v48) {
        break;
      }
      uint64_t v49 = [v46 parentViewController];

      double v46 = (void *)v49;
      if (!v49) {
        goto LABEL_47;
      }
    }
  }
  else
  {
LABEL_47:
    unint64_t v48 = 0;
  }
  PFProcessIsLaunchedToExecuteTests();
  double v50 = [v5 contentTileProvider];
  [v50 setWindow:v48];

  double v51 = [(PUOneUpPresentationHelper *)self testingDelegate];
  [v51 oneUpPresentationHelperDidCreateBrowsingSession:self];

  return v5;
}

- (id)_browsingSessionCreateIfNeeded:(BOOL)a3
{
  browsingSession = self->_browsingSession;
  if (browsingSession) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = [(PUOneUpPresentationHelper *)self _createBrowsingSession];
    char v7 = self->_browsingSession;
    self->_browsingSession = v6;

    browsingSession = self->_browsingSession;
  }
  return browsingSession;
}

- (PUBrowsingSession)browsingSession
{
  return (PUBrowsingSession *)[(PUOneUpPresentationHelper *)self _browsingSessionCreateIfNeeded:1];
}

- (void)dealloc
{
  BOOL v3 = [(UITapGestureRecognizer *)self->__tapGestureRecognizer view];
  [v3 removeGestureRecognizer:self->__tapGestureRecognizer];

  [(UITapGestureRecognizer *)self->__tapGestureRecognizer setDelegate:0];
  id v4 = self->_libraryChangePauseToken;
  if (v4)
  {
    BOOL v5 = self->_pausedPhotoLibrary;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PUOneUpPresentationHelper_dealloc__block_invoke;
    block[3] = &unk_1E5F2ECC8;
    uint64_t v9 = v5;
    id v10 = v4;
    uint64_t v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpPresentationHelper;
  [(PUOneUpPresentationHelper *)&v7 dealloc];
}

uint64_t __36__PUOneUpPresentationHelper_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_endPausingChanges:", *(void *)(a1 + 40));
}

- (void)setPhotosDataSource:(id)a3
{
  BOOL v5 = (PXPhotosDataSource *)a3;
  if (self->_photosDataSource != v5)
  {
    BOOL v8 = v5;
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    uint64_t v6 = [(PUOneUpPresentationHelper *)self browsingSession];
    objc_super v7 = [v6 dataSourceManager];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setPhotosDataSource:v8];
    }

    BOOL v5 = v8;
  }
}

- (PUOneUpPresentationHelper)initWithPhotosDataSource:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PUOneUpPresentationHelper_initWithPhotosDataSource___block_invoke;
  v9[3] = &unk_1E5F285C8;
  objc_copyWeak(&v10, &location);
  uint64_t v6 = [(PUOneUpPresentationHelper *)self initWithBrowsingSessionCreationBlock:v9];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photosDataSource, a3);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

PUBrowsingSession *__54__PUOneUpPresentationHelper_initWithPhotosDataSource___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [PUPhotoKitDataSourceManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained photosDataSource];
  id v5 = [(PUPhotoKitDataSourceManager *)v2 initWithPhotosDataSource:v4];

  uint64_t v6 = objc_alloc_init(PUPhotoKitMediaProvider);
  objc_super v7 = objc_alloc_init(PUPhotoKitAssetActionManager);
  [(PUPhotoKitAssetActionManager *)v7 setDataSourceManager:v5];
  BOOL v8 = [[PUBrowsingSession alloc] initWithDataSourceManager:v5 actionManager:v7 mediaProvider:v6];

  return v8;
}

- (PUOneUpPresentationHelper)init
{
  return [(PUOneUpPresentationHelper *)self initWithBrowsingSessionCreationBlock:0];
}

@end