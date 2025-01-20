@interface PXCuratedLibraryUIViewController
- ($0AC6E346AE4835514AAA8AC86D8F4844)trackedScrollContext;
- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)_handleGestureForFilterTipController;
- (BOOL)_handleHoverWithHitTestResult:(id)a3;
- (BOOL)_handleTapOnTitleWithHitTestResult:(id)a3;
- (BOOL)_handleTapToToggleChromeWithGestureRecognizer:(id)a3;
- (BOOL)_handleTapWithHitTestResult:(id)a3 keyModifierFlags:(int64_t)a4;
- (BOOL)_presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4;
- (BOOL)_requestExpansionAnimated:(BOOL)a3;
- (BOOL)_scrollToNextSectionInDirection:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)_shouldExposeCursorAnimations;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResetToInitialState;
- (BOOL)canShowFooter;
- (BOOL)didAppearInitially;
- (BOOL)dragController:(id)a3 shouldResizeCancelledPreviewForAssetReference:(id)a4;
- (BOOL)dragController:(id)a3 shouldSelectRearrangedAssetReferences:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isCollapsed;
- (BOOL)isGridViewReady;
- (BOOL)isInUnselectedTab;
- (BOOL)isResetToInitialState;
- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 allowsMultiSelectMenuForInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 commitPreviewForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentationShouldPreventShowInAllPhotosAction:(id)a3;
- (BOOL)ppt_dismiss;
- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3;
- (BOOL)pu_shouldOptOutFromChromelessBars;
- (BOOL)scrollViewControllerShouldScrollToTop:(id)a3;
- (BOOL)swipeSelectionManager:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4;
- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3;
- (CGRect)_rectForEllipsisActionPerformerButton;
- (NSObject)previousSelectedObject;
- (PHPhotoLibrary)photoLibrary;
- (PXActionManager)assetActionManager;
- (PXAssetReference)navigatedAssetReference;
- (PXAssetReference)preferredFocusAssetReference;
- (PXAssetSelectionUserActivityController)userActivityController;
- (PXBannerView)bannerView;
- (PXBoopableItemsProvider)boopableItemsProvider;
- (PXCPLStatusController)statusController;
- (PXCPLUIStatusProvider)cplUIStatusProvider;
- (PXChangeDirectionNumberFilter)backNavigationGestureDirectionFilter;
- (PXCuratedLibraryBarsController)barsController;
- (PXCuratedLibraryFilterTipController)filterTipController;
- (PXCuratedLibraryFilterToggleButtonController)filterButtonController;
- (PXCuratedLibrarySecondaryToolbarController)secondaryToolbarController;
- (PXCuratedLibrarySkimmingController)skimmingController;
- (PXCuratedLibraryUIViewController)initWithCoder:(id)a3;
- (PXCuratedLibraryUIViewController)initWithConfiguration:(id)a3;
- (PXCuratedLibraryUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXCuratedLibraryUIViewController)initWithPhotoLibrary:(id)a3;
- (PXCuratedLibraryUIViewController)initWithPhotoLibrary:(id)a3 initialZoomLevel:(int64_t)a4;
- (PXCuratedLibraryViewConfiguration)configuration;
- (PXCuratedLibraryViewDelegate)delegate;
- (PXCuratedLibraryViewProvider)viewProvider;
- (PXCuratedLibraryViewProvider)viewProviderIfLoaded;
- (PXCuratedLibraryViewUpdateDelegate)updateDelegate;
- (PXCuratedLibraryZoomLevelControl)zoomLevelControl;
- (PXCuratedLibraryZoomLevelPinchFilter)zoomLevelPinchFilter;
- (PXGAXResponder)axNextResponder;
- (PXGTransition)backNavigationTransition;
- (PXGView)gridView;
- (PXLibraryFilterState)libraryFilterState;
- (PXMoviePresenter)moviePresenter;
- (PXPhotosCloseButtonController)closeButtonController;
- (PXPhotosDragController)dragController;
- (PXPhotosDragController)emptyPlaceholderDragController;
- (PXPhotosPointerController)pointerController;
- (PXProgrammaticNavigationRequest)initialNavigationRequest;
- (PXRelaxedScreenEdgePanGestureRecognizer)screenEdgePanGestureRecognizer;
- (PXSelectionContainer)selectionContainer;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXSimpleIndexPath)_indexPathForAssetAtLocation:(SEL)a3 withPadding:(CGPoint)a4 forSwipeSelectionManager:(UIEdgeInsets)a5;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4;
- (PXStatusController)emptyPlaceholderStatusController;
- (PXSwipeSelectionManager)swipeSelectionManager;
- (PXTouchingUIGestureRecognizer)skimmingTouchGesture;
- (PXViewControllerDismissalInteractionController)dismissalInteractionController;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIEdgeInsets)legibilityClipInsets;
- (UIEdgeInsets)minimumContentOverlayInsets;
- (UIHoverGestureRecognizer)hoverGesture;
- (UIPanGestureRecognizer)panGesture;
- (UIPinchGestureRecognizer)pinchGesture;
- (UITapGestureRecognizer)pressGesture;
- (UITapGestureRecognizer)tapGesture;
- (UIView)legibilityContainerView;
- (UIView)secondaryToolbarContainerView;
- (id)_assetCollectionReferenceForGroup:(id)a3;
- (id)_bestHitTestResultForCursorAtLocation:(CGPoint)a3;
- (id)_buttonForEllipsisButtonAction;
- (id)_buttonHitTestResultAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)_createPreviewViewForAssetReference:(id)a3;
- (id)_createPreviewViewForHitTestResult:(id)a3;
- (id)_dominantAssetCollectionReferenceForSkimming;
- (id)_emptyPlaceholderMessageTextAttributesFromTextProperties:(id)a3;
- (id)_hitTestAssetReferenceAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)_hitTestResultAtLocation:(CGPoint)a3 withPadding:(UIEdgeInsets)a4 swipeSelectionManager:(id)a5;
- (id)_regionOfInterestForAssetReference:(id)a3 image:(id *)a4;
- (id)_scrollView;
- (id)_toolbarButtonConfigurationWithSymbolName:(id)a3;
- (id)assetReferenceForIndexPath:(id)a3;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)barsControllerActionsForSelectionContextMenu:(id)a3;
- (id)dragController:(id)a3 draggableAssetReferenceAtLocation:(CGPoint)a4;
- (id)dragController:(id)a3 dropTargetAssetReferenceForLocation:(CGPoint)a4;
- (id)dragController:(id)a3 regionOfInterestForAssetReference:(id)a4 image:(id *)a5;
- (id)dragControllerAssetReferenceForBeginningSession:(id)a3;
- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 previewForDismissingToSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5;
- (id)oneUpPresentation:(id)a3 previewForHighlightingSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 secondaryIdentifiersForConfiguration:(id)a4;
- (id)oneUpPresentationActionManagerForPreviewing:(id)a3;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (id)passthroughViewsForTipForController:(id)a3;
- (id)pointerController:(id)a3 identifierForRegionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (id)pointerController:(id)a3 regionOfInterestForCursorAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (id)pointerController:(id)a3 viewForCursorInteractionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (id)preferredFocusEnvironments;
- (id)presentationEnvironmentForStatusController:(id)a3;
- (id)pu_debugCurrentlySelectedAssets;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)px_navigationDestination;
- (id)sourceItemForTipID:(id)a3;
- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(PXSimpleIndexPath *)a4 toIndexPath:(PXSimpleIndexPath *)a5;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)targetedPreviewForAssetReference:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (int64_t)pointerController:(id)a3 interactionOptionsForRegionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (int64_t)preferredStatusBarStyle;
- (int64_t)userInterfaceFeature;
- (int64_t)zoomLevelBeforeBackNavigationTransition;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_addContentView:(id)a3;
- (void)_conditionallyUpdateEmptyPlaceholder;
- (void)_createAnimationForSkimmingWithDuration:(double)a3 indicatorsDidChangeVisibility:(BOOL)a4;
- (void)_handleHover:(id)a3;
- (void)_handleHoverWithHitTestResults:(id)a3 hoverGesture:(id)a4;
- (void)_handleNavigationRequestConditionCompletionForNavigationRequest:(id)a3 withAssetReference:(id)a4;
- (void)_handlePan:(id)a3;
- (void)_handlePinch:(id)a3;
- (void)_handlePress:(id)a3;
- (void)_handleScreenEdgePan:(id)a3;
- (void)_handleScrollToRevealInfo:(id)a3 inGroup:(id)a4;
- (void)_handleShowAlternateUIForGroup:(id)a3;
- (void)_handleShowDefaultUIForGroup:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_handleTapWithHitTestResults:(id)a3 tapGesture:(id)a4;
- (void)_hideNavigationBarItems:(BOOL)a3;
- (void)_invalidateBannerView;
- (void)_invalidateEmptyPlaceholder;
- (void)_navigateToInitialScrollPositionForNavigationRequest:(id)a3;
- (void)_navigateToRevealAssetForNavigationRequest:(id)a3;
- (void)_navigateToZoomLevelForNavigationRequest:(id)a3 successHandler:(id)a4;
- (void)_prepareGestureRecognizers;
- (void)_presentOneUpForSingleSelectedAssetWithActivity:(unint64_t)a3;
- (void)_requestExpansionForSelectionIfNeeded;
- (void)_requestExpansionIfNeededForInteractionWithAssetReference:(id)a3 animated:(BOOL)a4;
- (void)_requestFocusUpdateForCursorAsset;
- (void)_requestFocusUpdateWithAssetReference:(id)a3;
- (void)_rescheduleNavigationRequest:(id)a3;
- (void)_saveCurrentAllPhotosScrollPosition;
- (void)_scrollLibraryViewToInitialPositionWithCompletionHandler:(id)a3;
- (void)_scrollToBottomAnimated:(BOOL)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setContentUnavailableConfiguration:(id)a3;
- (void)_setWantsOptionalChromeVisible:(BOOL)a3 changeReason:(int64_t)a4;
- (void)_updateAllowDisplayCompositing;
- (void)_updateBackgroundColor;
- (void)_updateBannerView;
- (void)_updateDismissalInteractionControllerProperties;
- (void)_updateDrawerButtonVisibility;
- (void)_updateEmptyPlaceholder;
- (void)_updateIsModalInPresentation;
- (void)_updateSecondaryToolbar;
- (void)_updateSecondaryToolbarAccessoryViewStyles;
- (void)_updateSecondaryToolbarAccessoryViews;
- (void)_updateSecondaryToolbarLegibilityGradient;
- (void)_updateSecondaryToolbarStyle;
- (void)_updateSkimmingSlideshowEnabled;
- (void)_updateStatusBarStyle;
- (void)_updateTrackedScrollLevelIfNeeded;
- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4;
- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4;
- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)cancelSelectMode:(id)a3;
- (void)curatedLibraryActionPerformer:(id)a3 contentFilterStateChanged:(id)a4;
- (void)curatedLibraryActionPerformer:(id)a3 libraryFilterStateChanged:(id)a4;
- (void)curatedLibraryActionPerformer:(id)a3 presentContextMenuActionsWithPerformers:(id)a4;
- (void)curatedLibraryActionPerformer:(id)a3 presentShareSheetWithSharingContext:(id)a4;
- (void)curatedLibraryBarsControllerDidUpdateBars:(id)a3;
- (void)deselectAll:(id)a3;
- (void)didDismissTipForController:(id)a3;
- (void)dragController:(id)a3 draggedAssetReferencesDidChange:(id)a4;
- (void)dragController:(id)a3 isDragSessionActiveDidChange:(BOOL)a4;
- (void)footerControllerRevealFooter:(id)a3;
- (void)invalidateBoopableItemsProvider;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)navigateToSegment:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
- (void)oneUpPresentation:(id)a3 willEndPreviewingForContextMenuInteraction:(id)a4 configuration:(id)a5;
- (void)oneUpPresentation:(id)a3 willStartPreviewingForContextMenuInteraction:(id)a4;
- (void)openParentWithCommandUpArrow:(id)a3;
- (void)openSelectionWithCommandDownArrow:(id)a3;
- (void)photosCloseButtonControllerHandleAction:(id)a3;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)pointerController:(id)a3 didExitRegionWithRect:(CGRect)a4 inCoordinateSpace:(id)a5;
- (void)pointerController:(id)a3 willEnterRegionWithRect:(CGRect)a4 inCoordinateSpace:(id)a5;
- (void)ppt_navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 completionHandler:(id)a6;
- (void)preparePresentationEnvironmentForBannerView:(id)a3 actionIdentifier:(id)a4 completionHandler:(id)a5;
- (void)prepareTipPopover:(id)a3 tipID:(id)a4;
- (void)px_containedViewControllerModalStateChanged;
- (void)px_didTransitionBars;
- (void)px_navigateToStateAllowingTabSwitchingWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)px_willTransitionBars;
- (void)resetToInitialStateWithCompletionHandler:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)secondaryToolbarControllerSetNeedsUpdate:(id)a3;
- (void)setAxNextResponder:(id)a3;
- (void)setBackNavigationGestureDirectionFilter:(id)a3;
- (void)setBackNavigationTransition:(id)a3;
- (void)setBoopableItemsProvider:(id)a3;
- (void)setCanShowFooter:(BOOL)a3;
- (void)setCplUIStatusProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAppearInitially:(BOOL)a3;
- (void)setEmptyPlaceholderDragController:(id)a3;
- (void)setEmptyPlaceholderStatusController:(id)a3;
- (void)setInitialNavigationRequest:(id)a3;
- (void)setIsCollapsed:(BOOL)a3;
- (void)setIsGridViewReady:(BOOL)a3;
- (void)setIsInUnselectedTab:(BOOL)a3;
- (void)setLegibilityClipInsets:(UIEdgeInsets)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setMinimumContentOverlayInsets:(UIEdgeInsets)a3;
- (void)setMoviePresenter:(id)a3;
- (void)setNavigatedAssetReference:(id)a3;
- (void)setPreferredFocusAssetReference:(id)a3;
- (void)setPreviousSelectedObject:(id)a3;
- (void)setSharedLibraryStatusProvider:(id)a3;
- (void)setStatusController:(id)a3;
- (void)setTrackedScrollContext:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setZoomLevelBeforeBackNavigationTransition:(int64_t)a3;
- (void)skimmingController:(id)a3 willHideSkimmingHintsForAssetCollectionReference:(id)a4 animationDuration:(double)a5;
- (void)skimmingController:(id)a3 willShowSkimmingHintsForAssetCollectionReference:(id)a4 animationDuration:(double)a5;
- (void)skimmingController:(id)a3 willStartSkimmingAssetCollectionReference:(id)a4 animationDuration:(double)a5;
- (void)skimmingControllerDidStopSkimming:(id)a3 animationDuration:(double)a4;
- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4;
- (void)splitViewController:(id)a3 willChangeSidebarVisibility:(BOOL)a4;
- (void)statusController:(id)a3 configurationDidChange:(id)a4;
- (void)swipeSelectionManager:(id)a3 extendSelectionInDirection:(unint64_t)a4;
- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3;
- (void)swipeSelectionManagerDidAutoScroll:(id)a3;
- (void)toggleEditMode:(id)a3;
- (void)toggleFilter:(id)a3;
- (void)toggleViewMode:(id)a3;
- (void)toggleViewer:(id)a3;
- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3;
- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willPresentTipForController:(id)a3;
- (void)zoomIn:(id)a3;
- (void)zoomLevelControl:(id)a3 didTapOnAlreadySelectedZoomLevel:(int64_t)a4;
- (void)zoomOut:(id)a3;
@end

@implementation PXCuratedLibraryUIViewController

- (UIView)secondaryToolbarContainerView
{
  return self->_secondaryToolbarContainerView;
}

- (void)setMinimumContentOverlayInsets:(UIEdgeInsets)a3
{
  self->_minimumContentOverlayInsets = a3;
}

- (PXCuratedLibraryViewProvider)viewProvider
{
  viewProvider = self->_viewProvider;
  if (!viewProvider)
  {
    v4 = [PXCuratedLibraryViewProvider alloc];
    v5 = [(PXCuratedLibraryUIViewController *)self configuration];
    v6 = [(UIViewController *)self px_extendedTraitCollection];
    v7 = [(PXCuratedLibraryViewProvider *)v4 initWithConfiguration:v5 extendedTraitCollection:v6];
    v8 = self->_viewProvider;
    self->_viewProvider = v7;

    [(PXCuratedLibraryViewProvider *)self->_viewProvider setAxNextResponder:self];
    v9 = [(PXCuratedLibraryViewProvider *)self->_viewProvider viewModel];
    [v9 performInitialChanges:&__block_literal_global_79888];
    [v9 registerChangeObserver:self context:PXCuratedLibraryViewModelObserverContext_79884];
    v10 = [v9 styleGuide];
    [v10 registerChangeObserver:self context:PXCuratedLibraryStyleGuideObserverContext];

    v11 = [v9 zoomablePhotosViewModel];
    [v11 registerChangeObserver:self context:PXZoomablePhotosViewModelObservationContext];

    v12 = [v9 cplUIStatusProvider];
    [(PXCuratedLibraryUIViewController *)self setCplUIStatusProvider:v12];

    viewProvider = self->_viewProvider;
  }
  return viewProvider;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

void __84__PXCuratedLibraryUIViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsSelecting:0];
  [v2 setIsNavigating:1];
  [v2 resetAllPhotosContentFilterState];
}

- (void)curatedLibraryBarsControllerDidUpdateBars:(id)a3
{
  id v4 = [(PXCuratedLibraryUIViewController *)self updateDelegate];
  [v4 curatedLibraryViewDidUpdateBars:self];
}

- (PXCuratedLibraryViewUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (PXCuratedLibraryViewUpdateDelegate *)WeakRetained;
}

- (void)_updateSecondaryToolbar
{
  v3 = [(PXCuratedLibraryUIViewController *)self secondaryToolbarController];
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  v5 = [v4 viewModel];
  v6 = +[PXCuratedLibrarySettings sharedInstance];
  if (![v6 showSecondaryToolbar])
  {

    goto LABEL_6;
  }
  int v7 = [v5 wantsZoomControlVisible];

  if (!v7)
  {
LABEL_6:
    [v3 setContentView:0];
    goto LABEL_16;
  }
  v8 = [v5 configuration];
  uint64_t v9 = [v8 secondaryToolbarStyle];

  [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarLegibilityGradient];
  v10 = +[PXCuratedLibrarySettings sharedInstance];
  int v11 = [v10 secondaryToolbarAlwaysVisible];

  if (v11)
  {
    v12 = [(PXCuratedLibraryUIViewController *)self zoomLevelControl];
    v13 = v3;
    v14 = v12;
LABEL_14:
    [v13 setContentView:v14];
    goto LABEL_15;
  }
  v12 = [v4 viewModel];
  int v15 = [v12 isSelecting];
  v16 = [v12 currentContentFilterState];
  int v17 = [v16 isFiltering];

  if (v9) {
    int v18 = 0;
  }
  else {
    int v18 = v17;
  }
  if ((v15 & 1) != 0 || v18)
  {
    v13 = v3;
    v14 = 0;
    goto LABEL_14;
  }
  v19 = [(PXCuratedLibraryUIViewController *)self zoomLevelControl];
  [v3 setContentView:v19];

LABEL_15:
LABEL_16:
  [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarStyle];
  v20 = [(PXCuratedLibraryUIViewController *)self gridView];
  v21 = [v20 scrollViewController];
  [v3 setContentScrollViewController:v21];

  [v3 updateIfNeeded];
  v22 = (double *)MEMORY[0x1E4FB2848];
  [v3 containerViewAdditionalEdgeInsets];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v54 = v29;
  [v3 containerViewAdditionalEdgeInsetsWhenVisible:1];
  double v53 = v30;
  v31 = [(PXCuratedLibraryUIViewController *)self navigationController];
  double v32 = 0.0;
  if (([v31 isToolbarHidden] & 1) == 0)
  {
    v33 = [(PXCuratedLibraryUIViewController *)self navigationController];
    v34 = [v33 toolbar];
    [v34 bounds];
    double v32 = v35;
  }
  double v36 = *v22;
  double v37 = v22[1];
  double v38 = v22[3];

  v39 = [(PXCuratedLibraryUIViewController *)self view];
  [v39 safeAreaInsets];
  double v41 = v40;

  v42 = [(PXCuratedLibraryUIViewController *)self emptyPlaceholderStatusController];

  if (v42)
  {
    double v43 = v22[2];
    double v44 = v38;
    double v28 = v43;
    double v26 = v37;
    double v24 = v36;
  }
  else
  {
    double v45 = v41 - v32;
    double v44 = v54;
    double v43 = v53 + v45;
  }
  v46 = [(PXCuratedLibraryUIViewController *)self gridView];
  objc_msgSend(v46, "setAdditionalSafeAreaInsets:", v24, v26, v28, v44);

  v47 = [(PXCuratedLibraryUIViewController *)self gridView];
  objc_msgSend(v47, "setMinimumSafeAreaInsets:", v36, v37, v43, v38);

  v48 = [v4 viewModel];
  v49 = [v48 styleGuide];
  uint64_t v50 = [v49 secondaryToolbarPlacement];

  v51 = [v4 footerController];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __59__PXCuratedLibraryUIViewController__updateSecondaryToolbar__block_invoke;
  v55[3] = &unk_1E5DB7138;
  id v56 = v3;
  uint64_t v57 = v50;
  double v58 = v24;
  double v59 = v26;
  double v60 = v28;
  double v61 = v44;
  id v52 = v3;
  [v51 performChanges:v55];
}

- (PXGView)gridView
{
  id v2 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  v3 = [v2 gridView];

  return (PXGView *)v3;
}

- (PXCuratedLibraryViewProvider)viewProviderIfLoaded
{
  return self->_viewProvider;
}

- (void)_updateSecondaryToolbarStyle
{
  v3 = [(PXCuratedLibraryUIViewController *)self secondaryToolbarController];
  if (v3)
  {
    id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    v5 = [v4 viewModel];

    [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarAccessoryViewStyles];
    [v5 secondaryToolbarVisibility];
    double v7 = v6;
    v8 = [v3 contentView];

    double v9 = 0.0001;
    if (v7 >= 0.0001) {
      double v9 = v7;
    }
    if (!v8) {
      double v9 = 0.0;
    }
    [v3 setAlpha:v9];
    PXFloatApproximatelyEqualToFloat();
  }
}

- (PXCuratedLibrarySecondaryToolbarController)secondaryToolbarController
{
  return self->_secondaryToolbarController;
}

- (void)_updateSecondaryToolbarAccessoryViewStyles
{
  v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v3 viewModel];

  id v4 = +[PXCuratedLibraryFilterToggleButtonController foregroundColorOverLegibilityGradient:](PXCuratedLibraryFilterToggleButtonController, "foregroundColorOverLegibilityGradient:", [v5 secondaryToolbarLegibilityGradientIsVisible]);
  [(PXPhotosCloseButtonController *)self->_closeButtonController setForegroundColor:v4];
}

- (void)_updateSecondaryToolbarLegibilityGradient
{
  if ([(PXCuratedLibraryUIViewController *)self isViewLoaded])
  {
    v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v4 = [v3 viewModel];
    id v5 = [v4 configuration];
    uint64_t v6 = [v5 secondaryToolbarStyle];

    if (v6) {
      uint64_t v7 = [(PXCuratedLibraryUIViewController *)self isCollapsed] ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [(PXCuratedLibraryUIViewController *)self secondaryToolbarController];
    [v8 setLegibilityGradientEnabled:v7];
  }
}

- (BOOL)isCollapsed
{
  return self->_isCollapsed;
}

- (PXCuratedLibraryZoomLevelControl)zoomLevelControl
{
  return self->_zoomLevelControl;
}

- (PXStatusController)emptyPlaceholderStatusController
{
  return self->_emptyPlaceholderStatusController;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  [(PXCuratedLibraryUIViewController *)self minimumContentOverlayInsets];
  UIEdgeInsetsMax();
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController _setContentOverlayInsets:](&v4, sel__setContentOverlayInsets_);
}

- (UIEdgeInsets)minimumContentOverlayInsets
{
  double top = self->_minimumContentOverlayInsets.top;
  double left = self->_minimumContentOverlayInsets.left;
  double bottom = self->_minimumContentOverlayInsets.bottom;
  double right = self->_minimumContentOverlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v4 viewLayoutMarginsDidChange];
  v3 = [(PXCuratedLibraryUIViewController *)self secondaryToolbarController];
  [v3 updateIfNeeded];
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v11 = a3;
  objc_super v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v4 viewModel];
  uint64_t v6 = [(UIViewController *)self px_oneUpPresentation];
  [v6 invalidatePresentingGeometry];

  uint64_t v7 = [(PXCuratedLibraryUIViewController *)self skimmingController];
  [v7 contentViewDidScroll];

  id v8 = [v4 videoPlaybackController];
  [v8 visibleRectDidChange];

  double v9 = [(PXCuratedLibraryUIViewController *)self hoverGesture];
  objc_msgSend(v9, "px_cancel");

  [v11 visibleOrigin];
  if (v10 < 0.0 && ([v11 isManuallyChanging] & 1) == 0 && objc_msgSend(v5, "zoomLevel") == 4)
  {
    [v11 contentBounds];
    PXSizeIsEmpty();
  }
  if ([v11 isDragging]) {
    [(PXCuratedLibraryUIViewController *)self _setWantsOptionalChromeVisible:0 changeReason:2];
  }
}

- (PXCuratedLibrarySkimmingController)skimmingController
{
  if (!self->_skimmingController)
  {
    v3 = +[PXCuratedLibrarySettings sharedInstance];
    int v4 = [v3 enableSkimmingInYears];

    if (v4)
    {
      id v5 = [PXCuratedLibraryAssetCollectionSkimmingModel alloc];
      uint64_t v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
      uint64_t v7 = [v6 viewModel];
      id v8 = [(PXCuratedLibraryAssetCollectionSkimmingModel *)v5 initWithViewModel:v7];

      double v9 = [[PXCuratedLibrarySkimmingController alloc] initWithSkimmingModel:v8];
      skimmingController = self->_skimmingController;
      self->_skimmingController = v9;

      [(PXCuratedLibrarySkimmingController *)self->_skimmingController setDelegate:self];
      [(PXCuratedLibraryUIViewController *)self _updateSkimmingSlideshowEnabled];
      objc_initWeak(&location, self);
      id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v12 = *MEMORY[0x1E4FB25D0];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke;
      v24[3] = &unk_1E5DCFD58;
      objc_copyWeak(&v25, &location);
      id v13 = (id)[v11 addObserverForName:v12 object:0 queue:0 usingBlock:v24];
      uint64_t v14 = *MEMORY[0x1E4FB24E8];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_2;
      v22[3] = &unk_1E5DCFD58;
      objc_copyWeak(&v23, &location);
      id v15 = (id)[v11 addObserverForName:v14 object:0 queue:0 usingBlock:v22];
      uint64_t v16 = *MEMORY[0x1E4FB2498];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_3;
      v20[3] = &unk_1E5DCFD58;
      objc_copyWeak(&v21, &location);
      id v17 = (id)[v11 addObserverForName:v16 object:0 queue:0 usingBlock:v20];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&location);
    }
  }
  int v18 = self->_skimmingController;
  return v18;
}

- (UIHoverGestureRecognizer)hoverGesture
{
  return self->_hoverGesture;
}

- (void)_updateEmptyPlaceholder
{
  if ([(PXCuratedLibraryUIViewController *)self isViewLoaded])
  {
    int v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v5 = [v4 viewModel];
    if ([v5 shouldShowEmptyPlaceholder])
    {
      uint64_t v6 = [(PXCuratedLibraryUIViewController *)self emptyPlaceholderStatusController];

      if (!v6)
      {
        uint64_t v7 = [v4 gridView];
        [v7 removeFromSuperview];

        [(PXCuratedLibraryUIViewController *)self _setObservableScrollView:0 forEdges:5];
        id v8 = objc_alloc_init(PXStatusController);
        [(PXStatusController *)v8 setDelegate:self];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke;
        aBlock[3] = &unk_1E5DD0D90;
        double v9 = v8;
        double v41 = v9;
        v42 = self;
        SEL v43 = a2;
        double v10 = (void (**)(void))_Block_copy(aBlock);
        id v11 = [(PXCuratedLibraryUIViewController *)self sharedLibraryStatusProvider];
        int v12 = [v11 hasSharedLibraryOrPreview];

        if (v12)
        {
          id v13 = objc_alloc_init(PXStatusViewModel);
          [(PXStatusController *)v9 setViewModel:v13];
          uint64_t v14 = [(PXCuratedLibraryUIViewController *)self libraryFilterState];
          uint64_t v15 = [v14 viewMode];

          if ((unint64_t)(v15 - 1) >= 2)
          {
            if (!v15) {
              v10[2](v10);
            }
          }
          else
          {
            uint64_t v16 = [(PXStatusController *)v9 configuration];
            id v17 = [v16 secondaryTextProperties];
            int v18 = [(PXCuratedLibraryUIViewController *)self _emptyPlaceholderMessageTextAttributesFromTextProperties:v17];

            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke_3;
            v37[3] = &unk_1E5DCE7F8;
            id v38 = v18;
            uint64_t v39 = v15;
            id v19 = v18;
            [(PXStatusViewModel *)v13 performChanges:v37];
          }
        }
        else
        {
          v10[2](v10);
        }
        double v27 = [v5 assetsDataSourceManager];
        double v28 = [v27 dataSourceForZoomLevel:4];
        double v29 = [v28 firstAssetCollection];

        double v30 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v29 displayTitleInfo:0];
        v31 = [PXPhotosDragController alloc];
        double v32 = [(PXCuratedLibraryUIViewController *)self view];
        v33 = [v5 selectionManager];
        v34 = [(PXPhotosDragController *)v31 initWithContentView:v32 selectionManager:v33 assetCollectionActionManager:v30 delegate:self];
        [(PXCuratedLibraryUIViewController *)self setEmptyPlaceholderDragController:v34];

        [(PXCuratedLibraryUIViewController *)self setEmptyPlaceholderStatusController:v9];
        double v35 = [(PXStatusController *)v9 configuration];
        [(PXCuratedLibraryUIViewController *)self _setContentUnavailableConfiguration:v35];
      }
    }
    else if (([v5 libraryState] & 2) != 0)
    {
      id v21 = [v4 gridView];
      v22 = [v21 superview];

      if (!v22)
      {
        [(PXCuratedLibraryUIViewController *)self _setContentUnavailableConfiguration:0];
        [(PXCuratedLibraryUIViewController *)self _invalidateEmptyPlaceholder];
        id v23 = [v4 gridView];
        [(PXCuratedLibraryUIViewController *)self _addContentView:v23];

        double v24 = [v4 gridView];
        id v25 = [v24 scrollViewController];
        id v26 = [v25 scrollView];

        [(PXCuratedLibraryUIViewController *)self _setObservableScrollView:v26 forEdges:5];
      }
    }
    else
    {
      v20 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        __int16 v36 = 0;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "Not showing empty placeholder or grid: No results.", (uint8_t *)&v36, 2u);
      }
    }
  }
}

- (void)_updateBannerView
{
  id v42 = [(PXCuratedLibraryUIViewController *)self navigationController];
  int v4 = [v42 navigationBar];
  id v5 = [v42 topViewController];
  uint64_t v6 = [v5 view];

  uint64_t v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v8 = [v7 viewModel];
  double v9 = [v8 bannerViewConfiguration];

  if (!v9
    || ([v6 window], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v11 = (void *)v10,
        [(PXCuratedLibraryUIViewController *)self view],
        int v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v6 != v12))
  {
    id v13 = [(PXBannerView *)self->_bannerView superview];

    if (!v13) {
      goto LABEL_7;
    }
    [v4 setScrollEdgeAppearance:0];
    [(PXBannerView *)self->_bannerView removeFromSuperview];
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  bannerView = self->_bannerView;
  if (!bannerView)
  {
    uint64_t v16 = [(PXCuratedLibraryUIViewController *)self navigationController];

    if (!v16)
    {
      id v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryUIViewController.m" lineNumber:703 description:@"Nil navigation controller!"];
    }
    uint64_t v39 = [PXBannerView alloc];
    double v41 = [(PXCuratedLibraryUIViewController *)self navigationController];
    double v40 = [v41 navigationBar];
    [v40 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    id v25 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v26 = [v25 viewModel];
    double v27 = [v26 specManager];
    double v28 = [v27 spec];
    double v29 = [v28 allPhotosFloatingHeaderSpec];
    [v29 contentPadding];
    v34 = -[PXBannerView initWithFrame:padding:](v39, "initWithFrame:padding:", v18, v20, v22, v24, v30, v31, v32, v33);
    double v35 = self->_bannerView;
    self->_bannerView = v34;

    [(PXBannerView *)self->_bannerView setDelegate:self];
    bannerView = self->_bannerView;
  }
  [(PXBannerView *)bannerView setConfiguration:v9];
  [(PXCuratedLibraryUIViewController *)self _hideNavigationBarItems:1];
  __int16 v36 = [(PXBannerView *)self->_bannerView superview];

  if (!v36)
  {
    [(PXBannerView *)self->_bannerView layoutIfNeeded];
    double v37 = [v4 standardAppearance];
    [v4 setScrollEdgeAppearance:v37];

    [v4 addSubview:self->_bannerView];
    uint64_t v14 = 1;
LABEL_6:
    [(PXCuratedLibraryUIViewController *)self _hideNavigationBarItems:v14];
  }
LABEL_7:
}

- (void)setEmptyPlaceholderDragController:(id)a3
{
}

- (void)_invalidateEmptyPlaceholder
{
  [(PXCuratedLibraryUIViewController *)self setEmptyPlaceholderStatusController:0];
  [(PXCuratedLibraryUIViewController *)self setStatusController:0];
  v3 = [(PXCuratedLibraryUIViewController *)self emptyPlaceholderDragController];
  [v3 removeFromView];

  [(PXCuratedLibraryUIViewController *)self setEmptyPlaceholderDragController:0];
}

- (void)setStatusController:(id)a3
{
}

- (void)setEmptyPlaceholderStatusController:(id)a3
{
}

- (PXPhotosDragController)emptyPlaceholderDragController
{
  return self->_emptyPlaceholderDragController;
}

- (void)_setContentUnavailableConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v4 _setContentUnavailableConfiguration:a3];
  [(PXCuratedLibraryUIViewController *)self _updateBackgroundColor];
}

- (int64_t)userInterfaceFeature
{
  return 4;
}

- (void)px_willTransitionBars
{
  id v2 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v2 setShouldWorkaround18475431:1];
}

- (void)px_didTransitionBars
{
  id v2 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v2 setShouldWorkaround18475431:0];
}

uint64_t __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resetColumns];
}

uint64_t __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ensureLastSectionHasContent];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v17 viewDidAppear:a3];
  objc_super v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v4 viewModel];
  [v5 performChanges:&__block_literal_global_286];
  uint64_t v6 = [v4 videoPlaybackController];
  [v6 setIsContentViewVisible:1];
  [v6 setIsOneUpVisible:0];
  objc_initWeak(&location, self);
  uint64_t v7 = +[PXPreloadScheduler sharedScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_2;
  v14[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v15, &location);
  [v7 scheduleMainQueueTask:v14];

  id v8 = [(PXCuratedLibraryUIViewController *)self userActivityController];
  [v8 setActive:1];

  double v9 = [v4 eventTracker];
  [v9 logViewControllerDidAppear:self];

  uint64_t v10 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  [v10 setCuratedLibraryIsVisible:1];

  [(PXCuratedLibraryUIViewController *)self _invalidateBannerView];
  id v11 = [(PXCuratedLibraryUIViewController *)self view];
  PXAppIntentsRegisterViewAnnotationView(v11);

  PXRegisterAppIntentsViewAnnotationDelegate(self);
  int v12 = +[PXPreloadScheduler sharedScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_3;
  v13[3] = &unk_1E5DD36F8;
  v13[4] = self;
  [v12 scheduleTaskAfterCATransactionCommits:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (PXAssetSelectionUserActivityController)userActivityController
{
  return self->_userActivityController;
}

- (void)setIsCollapsed:(BOOL)a3
{
  if (self->_isCollapsed != a3)
  {
    BOOL v3 = a3;
    self->_isCollapsed = a3;
    [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarLegibilityGradient];
    if (v3)
    {
      id v4 = +[PXGridTipsHelper filterAllPhotosTipID];
      +[PXGridTipsHelper setTip:v4 isPresentable:0];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v7 viewWillAppear:a3];
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v4 viewModel];
  [v5 performChanges:&__block_literal_global_282_79845];
  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self barsController];
  [v6 updateIfNeeded];

  [(PXCuratedLibraryUIViewController *)self _updateDrawerButtonVisibility];
}

- (PXCuratedLibraryBarsController)barsController
{
  return self->_barsController;
}

- (void)secondaryToolbarControllerSetNeedsUpdate:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v36 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_79884 != a5)
  {
    if ((void *)PXSharedLibraryStatusProviderObservationContext_79848 != a5)
    {
      if ((void *)PXLibraryFilterStateObservationContext_79849 != a5)
      {
        if ((void *)PXCuratedLibraryStyleGuideObserverContext == a5)
        {
          if ((a4 & 4) != 0)
          {
            double v31 = [(PXCuratedLibraryUIViewController *)self viewIfLoaded];
            [v31 setNeedsLayout];
          }
        }
        else if ((void *)PXZoomablePhotosViewModelObservationContext == a5)
        {
          if ((a4 & 2) != 0)
          {
            double v32 = [(PXCuratedLibraryUIViewController *)self viewProvider];
            double v33 = [v32 viewModel];
            v34 = [v33 singleSelectedAssetReference];
            [(PXCuratedLibraryUIViewController *)self _requestFocusUpdateWithAssetReference:v34];
          }
        }
        else
        {
          if ((void *)PXCPLUIStatusProviderObservationContext_79781 != a5)
          {
            double v35 = [MEMORY[0x1E4F28B00] currentHandler];
            [v35 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryUIViewController.m" lineNumber:487 description:@"Code which should be unreachable has been reached"];

            abort();
          }
          [(PXCuratedLibraryUIViewController *)self _conditionallyUpdateEmptyPlaceholder];
        }
        goto LABEL_47;
      }
      if ((a4 & 1) == 0) {
        goto LABEL_47;
      }
    }
LABEL_46:
    [(PXCuratedLibraryUIViewController *)self _invalidateSecondaryToolbar];
    [(PXCuratedLibraryUIViewController *)self _invalidateEmptyPlaceholder];
    [(PXCuratedLibraryUIViewController *)self _updateEmptyPlaceholder];
    goto LABEL_47;
  }
  if (a4)
  {
    [(PXCuratedLibraryUIViewController *)self _invalidateSecondaryToolbar];
    double v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    uint64_t v10 = [v9 layout];
    [v10 clearLastVisibleAreaAnchoringInformation];

    [(PXCuratedLibraryUIViewController *)self invalidateBoopableItemsProvider];
    [(PXCuratedLibraryUIViewController *)self _requestExpansionForSelectionIfNeeded];
  }
  if ((a4 & 0x804) != 0) {
    [(PXCuratedLibraryUIViewController *)self _updateTrackedScrollLevelIfNeeded];
  }
  if ((a4 & 4) != 0)
  {
    id v11 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    int v12 = [v11 viewModel];
    id v13 = [v12 singleSelectedAssetReference];
    [(PXCuratedLibraryUIViewController *)self _requestFocusUpdateWithAssetReference:v13];
  }
  if ((a4 & 0x1000000040) != 0) {
    [(PXCuratedLibraryUIViewController *)self _updateEmptyPlaceholder];
  }
  if ((a4 & 0x1001000000) != 0) {
    [(PXCuratedLibraryUIViewController *)self _updateStatusBarStyle];
  }
  if ((a4 & 0x2000) != 0)
  {
    uint64_t v14 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v15 = [v14 viewModel];
    uint64_t v16 = [v15 zoomLevelTransitionPhase];

    if (!v16) {
      [(PXCuratedLibraryUIViewController *)self _updateSkimmingSlideshowEnabled];
    }
  }
  if ((a4 & 0x400000) != 0)
  {
    objc_super v17 = [(PXCuratedLibraryUIViewController *)self viewIfLoaded];
    [v17 setNeedsLayout];

    if ((a4 & 0x10000000) == 0)
    {
LABEL_23:
      if ((a4 & 0x20000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_37;
    }
  }
  else if ((a4 & 0x10000000) == 0)
  {
    goto LABEL_23;
  }
  double v18 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  double v19 = [v18 viewModel];
  double v20 = [v19 cplUIStatusProvider];

  [(PXCuratedLibraryUIViewController *)self setCplUIStatusProvider:v20];
  [(PXCuratedLibraryUIViewController *)self _conditionallyUpdateEmptyPlaceholder];

  if ((a4 & 0x20000000) == 0)
  {
LABEL_24:
    if ((a4 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_37:
  double v21 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  double v22 = [v21 viewModel];

  if ([v22 wantsSidebarVisible]
    && [v22 sidebarCanBecomeVisible])
  {
    double v23 = [(UIViewController *)self px_splitViewController];
    [v23 toggleSidebarVisibilityAnimated];
  }
  if ((a4 & 8) == 0)
  {
LABEL_25:
    if ((a4 & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_41:
  double v24 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v25 = [v24 viewModel];
  id v26 = [v25 selectionSnapshot];
  int v27 = [v26 isEmptySelectionAvoided];

  if (v27)
  {
    double v28 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    double v29 = [v28 viewModel];
    double v30 = [v29 singleSelectedAssetReference];
    [(PXCuratedLibraryUIViewController *)self _requestFocusUpdateWithAssetReference:v30];
  }
  [(PXCuratedLibraryUIViewController *)self _requestExpansionForSelectionIfNeeded];
  if ((a4 & 0x200000000) != 0) {
LABEL_26:
  }
    [(PXCuratedLibraryUIViewController *)self _invalidateIsModalInPresentation];
LABEL_27:
  if ((a4 & 0x2400000000) != 0) {
    [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarStyle];
  }
  if ((a4 & 0x102000000) != 0) {
    [(PXCuratedLibraryUIViewController *)self _invalidateSecondaryToolbar];
  }
  if ((a4 & 0x10000000000) != 0) {
    [(PXCuratedLibraryUIViewController *)self _updateAllowDisplayCompositing];
  }
  if ((a4 & 2) != 0) {
    goto LABEL_46;
  }
LABEL_47:
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  [v3 didLayoutAnchorView];

  [(PXCuratedLibraryUIViewController *)self _updateDrawerButtonVisibility];
  [(PXCuratedLibraryUIViewController *)self _invalidateBannerView];
  [(PXCuratedLibraryUIViewController *)self _updateEmptyPlaceholder];
}

- (void)traitCollectionDidChange:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PXCuratedLibraryUIViewController;
  id v4 = a3;
  [(PXCuratedLibraryUIViewController *)&v15 traitCollectionDidChange:v4];
  id v5 = [(PXCuratedLibraryUIViewController *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PXCuratedLibraryUIViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
  objc_super v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v8 = [v7 viewModel];
  uint64_t v9 = [v8 zoomLevel];

  if (v9 == 1)
  {
    uint64_t v10 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v11 = [v10 gridView];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__PXCuratedLibraryUIViewController_traitCollectionDidChange___block_invoke;
    v14[3] = &unk_1E5DD36F8;
    void v14[4] = self;
    [v11 installLayoutCompletionHandler:v14];
  }
  int v12 = [(PXCuratedLibraryUIViewController *)self traitCollection];
  id v13 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  [v13 setTraitCollection:v12];
}

- (PXCuratedLibraryFilterTipController)filterTipController
{
  return self->_filterTipController;
}

- (void)_updateDrawerButtonVisibility
{
  id v3 = [(UIViewController *)self px_splitViewController];
  if (v3)
  {
    id v18 = v3;
    id v4 = [(PXCuratedLibraryUIViewController *)self navigationController];
    id v5 = [v4 topViewController];
    int v6 = [v5 view];

    int v7 = [v18 isSidebarVisible];
    id v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    uint64_t v9 = [v8 viewModel];
    int v10 = [v9 wantsNavigationBarVisible];

    id v11 = [v8 viewModel];
    int v12 = [v11 shouldShowEmptyPlaceholder];

    id v13 = [v6 window];
    if (v13)
    {
      uint64_t v14 = [(PXCuratedLibraryUIViewController *)self view];
      uint64_t v15 = (v6 == v14) & ~v7 & v10 & (v12 ^ 1u);
    }
    else
    {
      uint64_t v15 = 0;
    }

    if ([v18 displayModeButtonVisibility] != v15)
    {
      [v18 setDisplayModeButtonVisibility:v15];
      uint64_t v16 = [(PXCuratedLibraryUIViewController *)self navigationController];
      objc_super v17 = [v16 navigationBar];
      [v17 setNeedsLayout];
    }
    id v3 = v18;
  }
}

- (void)_invalidateBannerView
{
  [(PXBannerView *)self->_bannerView removeFromSuperview];
  bannerView = self->_bannerView;
  self->_bannerView = 0;

  [(PXCuratedLibraryUIViewController *)self _updateBannerView];
}

- (void)_prepareGestureRecognizers
{
  id v24 = [(PXCuratedLibraryUIViewController *)self gridView];
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];
  id v5 = [v4 actionManager];
  int v6 = [v5 isActionTypeAllowed:@"PXCuratedLibraryActionHover"];

  if (v6)
  {
    int v7 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel__handleHover_];
    [(UIHoverGestureRecognizer *)v7 setDelegate:self];
    hoverGesture = self->_hoverGesture;
    self->_hoverGesture = v7;
    uint64_t v9 = v7;

    [v24 addGestureRecognizer:v9];
  }
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [v10 setDelegate:self];
  [v10 setCancelsTouchesInView:0];
  objc_storeStrong((id *)&self->_tapGesture, v10);
  [v24 addGestureRecognizer:v10];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handlePress_];
  [v11 setAllowedPressTypes:&unk_1F02D3E50];
  [v11 setDelegate:self];
  objc_storeStrong((id *)&self->_pressGesture, v11);
  [v24 addGestureRecognizer:v11];
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__handlePinch_];
  [v12 _setEndsOnSingleTouch:1];
  [v12 setDelegate:self];
  objc_storeStrong((id *)&self->_pinchGesture, v12);
  [v24 addGestureRecognizer:v12];
  id v13 = [[PXRelaxedScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:sel__handleScreenEdgePan_];
  screenEdgePanGestureRecognizer = self->_screenEdgePanGestureRecognizer;
  self->_screenEdgePanGestureRecognizer = v13;

  uint64_t v15 = +[PXCuratedLibrarySettings sharedInstance];
  [v15 swipeBackGestureMinAngle];
  -[PXRelaxedScreenEdgePanGestureRecognizer setMinAngleToEdge:](self->_screenEdgePanGestureRecognizer, "setMinAngleToEdge:");

  uint64_t v16 = +[PXCuratedLibrarySettings sharedInstance];
  [v16 swipeBackGestureMinTranslation];
  -[PXRelaxedScreenEdgePanGestureRecognizer setMinTranslation:](self->_screenEdgePanGestureRecognizer, "setMinTranslation:");

  [(PXRelaxedScreenEdgePanGestureRecognizer *)self->_screenEdgePanGestureRecognizer setDelegate:self];
  if ([v24 effectiveUserInterfaceLayoutDirection] == 1) {
    [(PXRelaxedScreenEdgePanGestureRecognizer *)self->_screenEdgePanGestureRecognizer setEdges:8];
  }
  [v24 addGestureRecognizer:self->_screenEdgePanGestureRecognizer];
  objc_super v17 = +[PXCuratedLibrarySettings sharedInstance];
  int v18 = [v17 enableSkimmingInYears];

  if (v18)
  {
    double v19 = [[PXTouchingUIGestureRecognizer alloc] initWithTarget:0 action:0];
    [(PXTouchingUIGestureRecognizer *)v19 setDelegate:self];
    [(PXTouchingUIGestureRecognizer *)v19 setTouchDelegate:self];
    [(PXTouchingUIGestureRecognizer *)v19 setCancelsTouchesInView:0];
    [(PXTouchingUIGestureRecognizer *)v19 setMaximumTouchMovement:5.0];
    [v24 addGestureRecognizer:v19];
    skimmingTouchGesture = self->_skimmingTouchGesture;
    self->_skimmingTouchGesture = v19;
    double v21 = v19;

    double v22 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePan_];
    [(UIPanGestureRecognizer *)v22 setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v22 setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v22 setDelegate:self];
    [(PXTouchingUIGestureRecognizer *)v21 maximumTouchMovement];
    -[UIPanGestureRecognizer _setHysteresis:](v22, "_setHysteresis:");
    [(UIPanGestureRecognizer *)v22 requireGestureRecognizerToFail:self->_screenEdgePanGestureRecognizer];
    [v24 addGestureRecognizer:v22];
    panGesture = self->_panGesture;
    self->_panGesture = v22;
  }
}

uint64_t __92__PXCuratedLibraryUIViewController__navigateToZoomLevelForNavigationRequest_successHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

uint64_t __51__PXCuratedLibraryUIViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsAppearing:1];
}

uint64_t __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDidAppearInitially:1];
}

uint64_t __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsAppearing:0];
}

- (id)_toolbarButtonConfigurationWithSymbolName:(id)a3
{
  id v3 = [MEMORY[0x1E4FB14D0] photosViewRoundedAccessoryConfigurationWithSymbolName:a3];
  uint64_t v4 = PXCuratedLibraryToolbarBackdropGroupName;
  id v5 = [v3 background];
  [v5 _setVisualEffectGroupName:v4];

  return v3;
}

- (void)_updateSecondaryToolbarAccessoryViews
{
  if ([(PXCuratedLibraryUIViewController *)self didAppearInitially]) {
    goto LABEL_3;
  }
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v4 = [v3 viewModel];
  id v5 = [v4 configuration];
  int v6 = [v5 isExpandedInitially];

  if (v6)
  {
LABEL_3:
    int v7 = [(PXCuratedLibraryUIViewController *)self configuration];
    uint64_t v8 = [v7 secondaryToolbarStyle];

    if (v8 == 1)
    {
      uint64_t v9 = [(PXCuratedLibraryUIViewController *)self filterButtonController];
      id v13 = [v9 button];

      int v10 = [(PXCuratedLibraryUIViewController *)self closeButtonController];
      id v11 = [v10 button];
    }
    else
    {
      id v13 = 0;
      id v11 = 0;
    }
    int v12 = [(PXCuratedLibraryUIViewController *)self secondaryToolbarController];
    [v12 setLeadingAccessoryView:v13];
    [v12 setTrailingAccessoryView:v11];
    [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarAccessoryViewStyles];
  }
}

- (BOOL)didAppearInitially
{
  return self->_didAppearInitially;
}

- (PXCuratedLibraryViewConfiguration)configuration
{
  return self->_configuration;
}

- (PXCuratedLibraryFilterToggleButtonController)filterButtonController
{
  filterButtonController = self->_filterButtonController;
  if (!filterButtonController)
  {
    uint64_t v4 = [(PXCuratedLibraryUIViewController *)self _toolbarButtonConfigurationWithSymbolName:@"line.3.horizontal.decrease"];
    id v5 = [PXCuratedLibraryFilterToggleButtonController alloc];
    int v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    int v7 = [v6 viewModel];
    uint64_t v8 = [(PXCuratedLibraryFilterToggleButtonController *)v5 initWithViewModel:v7 buttonConfiguration:v4];
    uint64_t v9 = self->_filterButtonController;
    self->_filterButtonController = v8;

    filterButtonController = self->_filterButtonController;
  }
  return filterButtonController;
}

- (PXPhotosCloseButtonController)closeButtonController
{
  closeButtonController = self->_closeButtonController;
  if (!closeButtonController)
  {
    uint64_t v4 = [(PXCuratedLibraryUIViewController *)self _toolbarButtonConfigurationWithSymbolName:@"xmark"];
    id v5 = [[PXPhotosCloseButtonController alloc] initWithButtonConfiguration:v4];
    int v6 = self->_closeButtonController;
    self->_closeButtonController = v5;

    [(PXPhotosCloseButtonController *)self->_closeButtonController setDelegate:self];
    closeButtonController = self->_closeButtonController;
  }
  return closeButtonController;
}

- (PXCuratedLibraryUIViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryUIViewController;
  id v5 = [(PXCuratedLibraryUIViewController *)&v14 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (PXCuratedLibraryViewConfiguration *)v6;

    uint64_t v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    legibilityContainerView = v5->_legibilityContainerView;
    v5->_legibilityContainerView = v8;

    [(UIView *)v5->_legibilityContainerView setClipsToBounds:1];
    [(UIView *)v5->_legibilityContainerView setUserInteractionEnabled:0];
    uint64_t v10 = [v4 photoLibrary];
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v10;

    [(UIViewController *)v5 px_enableExtendedTraitCollection];
    int v12 = [(UIViewController *)v5 px_extendedTraitCollection];
    objc_msgSend(v4, "swift_propagateEnvironmentValuesToExtendedTraitCollection:", v12);
  }
  return v5;
}

uint64_t __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addContentView:(id)a3
{
  id v4 = a3;
  id v11 = [(PXCuratedLibraryUIViewController *)self view];
  [v11 bounds];
  objc_msgSend(v4, "setFrame:");
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v6 = [v5 viewModel];
  int v7 = [v6 specManager];
  uint64_t v8 = [v7 spec];
  uint64_t v9 = [v8 backgroundColor];
  [v4 setBackgroundColor:v9];

  [v4 setAutoresizingMask:18];
  uint64_t v10 = [(PXCuratedLibraryUIViewController *)self legibilityContainerView];
  [v11 insertSubview:v4 belowSubview:v10];
}

- (void)_requestExpansionForSelectionIfNeeded
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v4 viewModel];

  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (([v5 isExpanded] & 1) == 0 && objc_msgSend(v5, "isSelecting")) {
      [(PXCuratedLibraryUIViewController *)self _requestExpansionAnimated:1];
    }
    uint64_t v8 = [v5 selectionSnapshot];
    if ([v5 isExpanded]) {
      goto LABEL_21;
    }
    if (![v8 isAnyItemSelected]) {
      goto LABEL_21;
    }
    uint64_t v9 = [(PXCuratedLibraryUIViewController *)self previousSelectedObject];
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v10 = (void *)v9;
    id v11 = [v8 firstObject];
    id v12 = [(PXCuratedLibraryUIViewController *)self previousSelectedObject];
    if (v11 == v12)
    {

LABEL_20:
      goto LABEL_21;
    }
    id v13 = v12;
    char v14 = [v11 isEqual:v12];

    if (v14)
    {
LABEL_21:
      double v21 = [v8 firstObject];
      [(PXCuratedLibraryUIViewController *)self setPreviousSelectedObject:v21];

      goto LABEL_22;
    }
    uint64_t v10 = [v8 dataSource];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v8)
        {
LABEL_13:
          [v8 firstSelectedIndexPath];
LABEL_19:
          double v20 = [v10 assetReferenceAtItemIndexPath:v22];
          [(PXCuratedLibraryUIViewController *)self _requestExpansionIfNeededForInteractionWithAssetReference:v20 animated:1];

          goto LABEL_20;
        }
LABEL_18:
        memset(v22, 0, sizeof(v22));
        goto LABEL_19;
      }
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      int v18 = (objc_class *)objc_opt_class();
      objc_super v17 = NSStringFromClass(v18);
      double v19 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
      [v15 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 1337, @"%@ should be an instance inheriting from %@, but it is %@", @"snapshot.dataSource", v17, v19 object file lineNumber description];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = (objc_class *)objc_opt_class();
      objc_super v17 = NSStringFromClass(v16);
      [v15 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 1337, @"%@ should be an instance inheriting from %@, but it is nil", @"snapshot.dataSource", v17 object file lineNumber description];
    }

    if (v8) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
LABEL_22:
}

- (void)viewDidLoad
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v106.receiver = self;
  v106.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v106 viewDidLoad];
  id v3 = [(PXCuratedLibraryUIViewController *)self view];
  id v4 = [(PXCuratedLibraryUIViewController *)self legibilityContainerView];
  [v3 addSubview:v4];

  v94 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v94 viewModel];
  v92 = [v5 styleGuide];
  uint64_t v6 = [v5 sharedLibraryStatusProvider];
  sharedLibraryStatusProvider = self->_sharedLibraryStatusProvider;
  self->_sharedLibraryStatusProvider = v6;

  [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider registerChangeObserver:self context:PXSharedLibraryStatusProviderObservationContext_79848];
  uint64_t v8 = [v5 libraryFilterState];
  libraryFilterState = self->_libraryFilterState;
  self->_libraryFilterState = v8;

  [(PXLibraryFilterState *)self->_libraryFilterState registerChangeObserver:self context:PXLibraryFilterStateObservationContext_79849];
  [(PXCuratedLibraryUIViewController *)self _updateBackgroundColor];
  v96 = [(PXCuratedLibraryUIViewController *)self gridView];
  [(PXCuratedLibraryUIViewController *)self _updateEmptyPlaceholder];
  [(UIViewController *)self px_enableOneUpPresentation];
  uint64_t v10 = [(UIViewController *)self px_oneUpPresentation];
  [v10 setDelegate:self];

  [(PXCuratedLibraryUIViewController *)self _prepareGestureRecognizers];
  id v11 = [v96 scrollViewController];
  v95 = [v11 scrollView];

  id v12 = [[PXPhotosPointerController alloc] initWithContentView:v95 delegate:self];
  pointerController = self->_pointerController;
  self->_pointerController = v12;

  char v14 = [PXSwipeSelectionManager alloc];
  uint64_t v15 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v16 = [v15 viewModel];
  objc_super v17 = [v16 selectionManager];
  int v18 = [(PXSwipeSelectionManager *)v14 initWithSelectionManager:v17 scrollView:v95];
  swipeSelectionManager = self->_swipeSelectionManager;
  self->_swipeSelectionManager = v18;

  [(PXSwipeSelectionManager *)self->_swipeSelectionManager setDelegate:self];
  double v20 = [(UIViewController *)self px_oneUpPresentation];
  v93 = [v20 contextMenuInteraction];

  [v96 addInteraction:v93];
  [(UIViewController *)self px_enableBarAppearance];
  double v21 = [[PXCuratedLibraryBarsController alloc] initWithCuratedLibraryViewController:self viewModel:v5];
  barsController = self->_barsController;
  self->_barsController = v21;

  [(PXCuratedLibraryBarsController *)self->_barsController setDelegate:self];
  double v23 = [v5 configuration];
  LODWORD(v16) = [v23 enableSecondaryToolbarContainerView];

  if (v16)
  {
    id v24 = [PXHitTestTransparentView alloc];
    id v25 = [(PXCuratedLibraryUIViewController *)self view];
    [v25 bounds];
    id v26 = -[PXHitTestTransparentView initWithFrame:](v24, "initWithFrame:");
    secondaryToolbarContainerView = self->_secondaryToolbarContainerView;
    self->_secondaryToolbarContainerView = v26;
  }
  double v28 = [PXCuratedLibrarySecondaryToolbarController alloc];
  double v29 = self->_secondaryToolbarContainerView;
  if (v29)
  {
    double v30 = self->_secondaryToolbarContainerView;
  }
  else
  {
    double v30 = [(PXCuratedLibraryUIViewController *)self view];
  }
  BOOL v31 = v29 == 0;
  double v32 = [(PXCuratedLibraryUIViewController *)self legibilityContainerView];
  double v33 = [(PXCuratedLibrarySecondaryToolbarController *)v28 initWithContainerView:v30 legibilityContainerView:v32 viewModel:v5];
  secondaryToolbarController = self->_secondaryToolbarController;
  self->_secondaryToolbarController = v33;

  if (v31) {
  [(PXSecondaryToolbarController *)self->_secondaryToolbarController setUpdateDelegate:self];
  }
  double v35 = [v5 assetsDataSourceManager];
  id v36 = [v35 dataSourceForZoomLevel:4];
  v91 = [v36 firstAssetCollection];

  v90 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v91 displayTitleInfo:0];
  double v37 = [PXPhotosDragController alloc];
  id v38 = [(PXCuratedLibraryUIViewController *)self gridView];
  uint64_t v39 = [v5 selectionManager];
  double v40 = [(PXPhotosDragController *)v37 initWithContentView:v38 selectionManager:v39 assetCollectionActionManager:v90 delegate:self];
  dragController = self->_dragController;
  self->_dragController = v40;

  id v42 = [[PXCuratedLibraryZoomLevelControl alloc] initWithViewModel:v5 styleGuide:v92];
  zoomLevelControl = self->_zoomLevelControl;
  self->_zoomLevelControl = v42;

  [(PXCuratedLibraryZoomLevelControl *)self->_zoomLevelControl setDelegate:self];
  [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbar];
  [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarAccessoryViews];
  double v44 = [PXAssetSelectionUserActivityController alloc];
  double v45 = [v5 selectionManager];
  v46 = [(PXAssetSelectionUserActivityController *)v44 initWithSelectionManager:v45];
  userActivityController = self->_userActivityController;
  self->_userActivityController = v46;

  v48 = [v96 scrollViewController];
  [v48 registerObserver:self];

  v49 = [v94 footerController];
  [v49 setDelegate:self];

  uint64_t v50 = objc_alloc_init(PXCuratedLibraryZoomLevelPinchFilter);
  zoomLevelPinchFilter = self->_zoomLevelPinchFilter;
  self->_zoomLevelPinchFilter = v50;

  id v52 = [v5 actionManager];
  [v52 setPerformerDelegate:self];

  double v53 = [v5 configuration];
  LOBYTE(v44) = [v53 allowedInteractiveDismissBehaviors] == 0;

  if ((v44 & 1) == 0)
  {
    double v54 = [[PXViewControllerDismissalInteractionController alloc] initWithViewController:self];
    dismissalInteractionController = self->_dismissalInteractionController;
    self->_dismissalInteractionController = v54;

    [(PXCuratedLibraryUIViewController *)self _updateDismissalInteractionControllerProperties];
  }
  objc_initWeak(&location, self);
  id v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v57 = PXCuratedLibrarySaveCurrentAllPhotosScrollPositionNotificationName;
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke;
  v103[3] = &unk_1E5DCFD58;
  v87 = &v104;
  objc_copyWeak(&v104, &location);
  id v58 = (id)[v56 addObserverForName:v57 object:0 queue:0 usingBlock:v103];

  [(PXCuratedLibraryUIViewController *)self _updateAllowDisplayCompositing];
  [(PXCuratedLibraryUIViewController *)self setIsGridViewReady:1];
  double v59 = [(PXCuratedLibraryUIViewController *)self initialNavigationRequest];
  v89 = [v59 destination];
  if ([v89 type] == 1 && !objc_msgSend(v89, "revealMode", &v104)
    || !v59
    || ![(PXCuratedLibraryUIViewController *)self routingOptionsForDestination:v89])
  {
    double v60 = [[PXProgrammaticNavigationDestination alloc] initWithType:1 revealMode:3];
    double v61 = +[PXCuratedLibrarySettings sharedInstance];
    if ([v61 launchToSavedAllPhotosScrollPosition])
    {
      v62 = [v61 savedAllPhotosScrollPositionAnchorAssetIdentifier];
      BOOL v63 = v62 == 0;

      if (!v63)
      {
        v64 = [PXProgrammaticNavigationDestination alloc];
        v65 = [v61 savedAllPhotosScrollPositionAnchorAssetIdentifier];
        uint64_t v66 = [(PXProgrammaticNavigationDestination *)v64 initWithType:5 revealMode:2 assetUUID:v65 assetCollectionUUID:0];

        double v60 = (PXProgrammaticNavigationDestination *)v66;
      }
    }
    v67 = [[PXProgrammaticNavigationRequest alloc] initWithDestination:v60 options:0 completionHandler:0];

    double v59 = v67;
  }
  -[PXCuratedLibraryUIViewController setInitialNavigationRequest:](self, "setInitialNavigationRequest:", 0, v87);
  PXProgrammaticNavigationRequestExecute(v59, self);
  v68 = [(UIViewController *)self px_splitViewController];
  [v68 registerChangeObserver:self];
  v69 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  v70 = [v69 viewModel];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke_2;
  v101[3] = &unk_1E5DCF3F0;
  id v71 = v68;
  id v102 = v71;
  [v70 performChanges:v101];

  v72 = [PXCuratedLibraryFilterTipController alloc];
  v73 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  v74 = [v73 viewModel];
  v75 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  v76 = [v75 layout];
  v77 = [(PXCuratedLibraryFilterTipController *)v72 initWithViewModel:v74 layout:v76];
  filterTipController = self->_filterTipController;
  self->_filterTipController = v77;

  [(PXCuratedLibraryFilterTipController *)self->_filterTipController setDelegate:self];
  v79 = [(PXCuratedLibraryUIViewController *)self traitCollection];
  [(PXCuratedLibraryFilterTipController *)self->_filterTipController setTraitCollection:v79];

  +[PXGridTipsHelper setTipsPresentationDelegate:self];
  v80 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0x100000 action:sel_openParentWithCommandUpArrow_];
  [(PXCuratedLibraryUIViewController *)self addKeyCommand:v80];

  v81 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0x100000 action:sel_openSelectionWithCommandDownArrow_];
  [(PXCuratedLibraryUIViewController *)self addKeyCommand:v81];

  v82 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_cancelSelectMode_];
  [(PXCuratedLibraryUIViewController *)self addKeyCommand:v82];

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v83 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager keyCommandsForSelectionExtension];
  uint64_t v84 = [v83 countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (v84)
  {
    uint64_t v85 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v98 != v85) {
          objc_enumerationMutation(v83);
        }
        [(PXCuratedLibraryUIViewController *)self addKeyCommand:*(void *)(*((void *)&v97 + 1) + 8 * i)];
      }
      uint64_t v84 = [v83 countByEnumeratingWithState:&v97 objects:v107 count:16];
    }
    while (v84);
  }

  objc_destroyWeak(v88);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v4 viewWillLayoutSubviews];
  id v3 = [(PXCuratedLibraryUIViewController *)self view];
  [v3 bounds];

  [(PXCuratedLibraryUIViewController *)self legibilityClipInsets];
  PXEdgeInsetsInsetRect();
}

- (UIView)legibilityContainerView
{
  return self->_legibilityContainerView;
}

- (PXViewControllerDismissalInteractionController)dismissalInteractionController
{
  return self->_dismissalInteractionController;
}

- (UIEdgeInsets)legibilityClipInsets
{
  double top = self->_legibilityClipInsets.top;
  double left = self->_legibilityClipInsets.left;
  double bottom = self->_legibilityClipInsets.bottom;
  double right = self->_legibilityClipInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_updateBackgroundColor
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  objc_super v4 = [v3 viewModel];
  id v5 = [v4 specManager];
  id v9 = [v5 spec];

  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self _contentUnavailableConfiguration];

  if (v6) {
    [v9 contentUnavailableBackgroundColor];
  }
  else {
  char v7 = [v9 backgroundColor];
  }
  uint64_t v8 = [(PXCuratedLibraryUIViewController *)self view];
  [v8 setBackgroundColor:v7];
}

void __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 completionHandler];
  id v8 = (id)v6;
  if (a2) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v5);
}

- (void)setPreviousSelectedObject:(id)a3
{
}

- (void)setIsGridViewReady:(BOOL)a3
{
  self->_isGridViewReady = a3;
}

- (void)setInitialNavigationRequest:(id)a3
{
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v7 = [v6 viewModel];
  uint64_t v8 = [v7 zoomLevel];
  if ((unint64_t)(v5 - 2) >= 5)
  {
    if (v5 == 1)
    {
      uint64_t v11 = v8;

      if (v11)
      {
        unsigned int v9 = 1;
        goto LABEL_5;
      }
    }
    else
    {
    }
    if (![v4 isTargetingAsset] || (objc_msgSend(v4, "isTargetingAlbum") & 1) != 0)
    {
      unsigned int v9 = 0;
      goto LABEL_5;
    }
    id v12 = [v4 assetCollection];
    uint64_t v6 = v12;
    if (v12)
    {
      unsigned int v9 = objc_msgSend(v12, "px_isAllPhotosSmartAlbum");
      goto LABEL_4;
    }
  }
  else
  {
  }
  unsigned int v9 = 1;
LABEL_4:

LABEL_5:
  return v9;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [[PXProgrammaticNavigationRequest alloc] initWithDestination:v8 options:a4 completionHandler:v9];
  uint64_t v11 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v12 = [v11 viewModel];
  [v12 performChanges:&__block_literal_global_549];

  if ([v8 isTargetingAsset])
  {
    [(PXCuratedLibraryUIViewController *)self _navigateToRevealAssetForNavigationRequest:v10];
  }
  else if ([v8 revealMode] == 3)
  {
    [(PXCuratedLibraryUIViewController *)self _navigateToInitialScrollPositionForNavigationRequest:v10];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__PXCuratedLibraryUIViewController_navigateToDestination_options_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5DD3128;
    id v14 = v9;
    [(PXCuratedLibraryUIViewController *)self _navigateToZoomLevelForNavigationRequest:v10 successHandler:v13];
  }
}

- (PXProgrammaticNavigationRequest)initialNavigationRequest
{
  return self->_initialNavigationRequest;
}

- (PXCuratedLibraryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibraryViewDelegate *)WeakRetained;
}

- (void)_updateDismissalInteractionControllerProperties
{
  id v7 = [(PXCuratedLibraryUIViewController *)self dismissalInteractionController];
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v4 = [v3 viewModel];

  uint64_t v5 = [v4 configuration];
  unint64_t v6 = [v5 allowedInteractiveDismissBehaviors];

  [v7 setSwipeDownAllowed:v6 & 1];
  [v7 setSwipeUpAllowed:(v6 >> 1) & 1];
}

- (void)_updateAllowDisplayCompositing
{
  id v6 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v3 = [v6 viewModel];
  uint64_t v4 = [v3 isFullyExpanded] ^ 1;
  uint64_t v5 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v5 setDisableMetalViewDisplayCompositing:v4];
}

- (void)_navigateToZoomLevelForNavigationRequest:(id)a3 successHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(PXCuratedLibraryUIViewController *)self isGridViewReady])
  {
    id v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v9 = [v8 viewModel];

    uint64_t v10 = [v9 zoomLevel];
    uint64_t v11 = [v6 destination];
    uint64_t v12 = 1;
    switch([v11 type])
    {
      case 1:

        uint64_t v12 = v10;
        if (!v10) {
          goto LABEL_7;
        }
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        uint64_t v12 = 2;
        goto LABEL_10;
      case 4:
        uint64_t v12 = 3;
        goto LABEL_10;
      case 5:
      case 6:
        uint64_t v12 = 4;
LABEL_10:

LABEL_11:
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __92__PXCuratedLibraryUIViewController__navigateToZoomLevelForNavigationRequest_successHandler___block_invoke;
        v13[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
        void v13[4] = v12;
        [v9 performChanges:v13];
        if (v12 == v10) {
          v7[2](v7);
        }
        else {
          dispatch_async(MEMORY[0x1E4F14428], v7);
        }

        break;
      default:

LABEL_7:
        PXAssertGetLog();
    }
  }
  else
  {
    [(PXCuratedLibraryUIViewController *)self _rescheduleNavigationRequest:v6];
  }
}

void __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke_2;
  v2[3] = &unk_1E5DD3158;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _scrollLibraryViewToInitialPositionWithCompletionHandler:v2];
}

- (void)_scrollLibraryViewToInitialPositionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(PXCuratedLibraryUIViewController *)self isGridViewReady])
  {
    uint64_t v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v6 = [v5 assetsDataSourceManager];
    [v6 performChanges:&__block_literal_global_437];
    id v7 = [(PXCuratedLibraryUIViewController *)self gridView];
    id v8 = [v7 scrollViewController];
    [v8 stopScrollingAndZoomingAnimations];

    id v9 = [v5 layout];
    uint64_t v10 = [v9 createAnchorForScrollingToInitialPosition];
    id v11 = (id)[v10 autoInvalidate];

    uint64_t v12 = [v5 viewModel];
    if ([v12 zoomLevel] == 4)
    {
      id v13 = [v12 zoomablePhotosViewModel];
      [v13 performChanges:&__block_literal_global_440];
    }
    if (v4)
    {
      uint64_t v14 = [(PXCuratedLibraryUIViewController *)self gridView];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E5DD3128;
      id v16 = v4;
      [v14 installLayoutCompletionHandler:v15];
    }
    goto LABEL_9;
  }
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Can't scroll library view to initial position");
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
LABEL_9:
  }
}

- (BOOL)isGridViewReady
{
  return self->_isGridViewReady;
}

- (void)_navigateToInitialScrollPositionForNavigationRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke;
  v6[3] = &unk_1E5DD32A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXCuratedLibraryUIViewController *)self _navigateToZoomLevelForNavigationRequest:v5 successHandler:v6];
}

- (void)setDidAppearInitially:(BOOL)a3
{
  if (self->_didAppearInitially != a3)
  {
    self->_didAppearInitially = a3;
    [(PXCuratedLibraryUIViewController *)self _updateSecondaryToolbarAccessoryViews];
  }
}

- (void)_updateSkimmingSlideshowEnabled
{
  id v3 = +[PXCuratedLibrarySettings sharedInstance];
  uint64_t v4 = [v3 enableSlideshowInYears];

  if (v4)
  {
    id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v6 = [v5 viewModel];
    id v7 = [v6 specManager];
    id v8 = [v7 spec];
    int v9 = [v8 allowsSlideshowInYears];

    if (v9)
    {
      uint64_t v10 = [(PXCuratedLibraryUIViewController *)self viewProvider];
      id v11 = [v10 layout];

      if ([v11 presentedZoomLevel] == 1)
      {
        uint64_t v12 = [v11 libraryBodyLayout];
        id v13 = [v12 composition];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v15 = [v11 libraryBodyLayout];
          id v16 = [v15 composition];

          uint64_t v17 = [v16 presentedNumberOfColumns];
          if (v17 != 1) {
            goto LABEL_8;
          }
        }
      }
      if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
LABEL_8:
      }
        uint64_t v4 = 0;
      else {
        uint64_t v4 = !UIAccessibilityIsReduceMotionEnabled();
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  id v18 = [(PXCuratedLibraryUIViewController *)self skimmingController];
  [v18 setSkimmingSlideshowEnabled:v4];
}

void __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) splitBehavior] == 2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) isSidebarVisible] ^ 1;
  }
  [v4 setSidebarCanBecomeVisible:v3];
}

- (void)setCplUIStatusProvider:(id)a3
{
  id v5 = (PXCPLUIStatusProvider *)a3;
  cplUIStatusProvider = self->_cplUIStatusProvider;
  id v8 = v5;
  if (cplUIStatusProvider != v5)
  {
    [(PXCPLUIStatusProvider *)cplUIStatusProvider unregisterChangeObserver:self context:PXCPLUIStatusProviderObservationContext_79781];
    objc_storeStrong((id *)&self->_cplUIStatusProvider, a3);
    [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider registerChangeObserver:self context:PXCPLUIStatusProviderObservationContext_79781];
    id v7 = [(PXCuratedLibraryUIViewController *)self statusController];
    [v7 setStatusProvider:v8];
  }
}

- (PXCPLStatusController)statusController
{
  return self->_statusController;
}

void __48__PXCuratedLibraryUIViewController_viewProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setCplActionManagerClass:objc_opt_class()];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryToolbarContainerView, 0);
  objc_storeStrong((id *)&self->_legibilityContainerView, 0);
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_filterTipController, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusController, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_previousSelectedObject, 0);
  objc_storeStrong((id *)&self->_initialNavigationRequest, 0);
  objc_storeStrong((id *)&self->_zoomLevelPinchFilter, 0);
  objc_storeStrong((id *)&self->_pointerController, 0);
  objc_storeStrong((id *)&self->_preferredFocusAssetReference, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backNavigationTransition, 0);
  objc_storeStrong((id *)&self->_backNavigationGestureDirectionFilter, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_skimmingTouchGesture, 0);
  objc_storeStrong((id *)&self->_pressGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_hoverGesture, 0);
  objc_storeStrong((id *)&self->_dismissalInteractionController, 0);
  objc_storeStrong((id *)&self->_zoomLevelControl, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderDragController, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_skimmingController, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_closeButtonController, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
}

- (BOOL)canShowFooter
{
  return self->_canShowFooter;
}

- (void)setMoviePresenter:(id)a3
{
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)setBoopableItemsProvider:(id)a3
{
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setLibraryFilterState:(id)a3
{
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXCPLUIStatusProvider)cplUIStatusProvider
{
  return self->_cplUIStatusProvider;
}

- (NSObject)previousSelectedObject
{
  return self->_previousSelectedObject;
}

- (void)setIsInUnselectedTab:(BOOL)a3
{
  self->_isInUnselectedTab = a3;
}

- (PXCuratedLibraryZoomLevelPinchFilter)zoomLevelPinchFilter
{
  return self->_zoomLevelPinchFilter;
}

- (PXPhotosPointerController)pointerController
{
  return self->_pointerController;
}

- (void)setPreferredFocusAssetReference:(id)a3
{
}

- (PXAssetReference)preferredFocusAssetReference
{
  return self->_preferredFocusAssetReference;
}

- (PXAssetReference)navigatedAssetReference
{
  return self->_navigatedAssetReference;
}

- (PXSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (void)setTrackedScrollContext:(id)a3
{
  self->_trackedScrollContext = ($7112E6B4DD103BEC9D79B647C3B0BF46)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)trackedScrollContext
{
  p_trackedScrollContext = &self->_trackedScrollContext;
  int64_t zoomLevel = self->_trackedScrollContext.zoomLevel;
  int64_t scrollRegime = p_trackedScrollContext->scrollRegime;
  result.var1 = scrollRegime;
  result.var0 = zoomLevel;
  return result;
}

- (PXRelaxedScreenEdgePanGestureRecognizer)screenEdgePanGestureRecognizer
{
  return self->_screenEdgePanGestureRecognizer;
}

- (void)setBackNavigationTransition:(id)a3
{
}

- (PXGTransition)backNavigationTransition
{
  return self->_backNavigationTransition;
}

- (void)setZoomLevelBeforeBackNavigationTransition:(int64_t)a3
{
  self->_zoomLevelBeforeBackNavigationTransition = a3;
}

- (int64_t)zoomLevelBeforeBackNavigationTransition
{
  return self->_zoomLevelBeforeBackNavigationTransition;
}

- (void)setBackNavigationGestureDirectionFilter:(id)a3
{
}

- (PXChangeDirectionNumberFilter)backNavigationGestureDirectionFilter
{
  return self->_backNavigationGestureDirectionFilter;
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (PXTouchingUIGestureRecognizer)skimmingTouchGesture
{
  return self->_skimmingTouchGesture;
}

- (UITapGestureRecognizer)pressGesture
{
  return self->_pressGesture;
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (PXPhotosDragController)dragController
{
  return self->_dragController;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setAxNextResponder:(id)a3
{
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (PXBannerView)bannerView
{
  return self->_bannerView;
}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 4043, @"Invalid parameter not satisfying: %@", @"assetHandler" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 4044, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  int v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v10 = [v9 viewModel];
  [v10 selectionSnapshot];
  objc_claimAutoreleasedReturnValue();

  id v11 = [v9 layout];
  [v11 visibleRect];
  [v11 safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

void __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchSelectedObjects];
  uint64_t v3 = (void *)[v2 mutableCopy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5DB73D0;
  id v10 = v3;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5DB7380;
  id v8 = *(id *)(a1 + 48);
  [v6 enumerateObjectsUsingBlock:v7];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v5;

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
      if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(a1 + 32) removeObjectAtIndex:v4];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

void __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v4;

    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 3998, @"Invalid parameter not satisfying: %@", @"assetCollectionHandler" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 3999, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  int v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v10 = [v9 viewModel];
  [v10 selectionSnapshot];
  objc_claimAutoreleasedReturnValue();

  id v11 = [v9 layout];
  [v11 visibleRect];
  [v11 safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

void __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchSelectedObjects];
  id v3 = (void *)[v2 mutableCopy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5DB7358;
  id v10 = v3;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5DB7380;
  id v8 = *(id *)(a1 + 48);
  [v6 enumerateObjectsUsingBlock:v7];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v5;

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
      if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(a1 + 32) removeObjectAtIndex:v4];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

void __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v4;

    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

- (void)preparePresentationEnvironmentForBannerView:(id)a3 actionIdentifier:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = +[PXViewControllerPresenter defaultPresenterWithViewController:self];
  id v8 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  if ([v8 isPresentingTipView])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __115__PXCuratedLibraryUIViewController_preparePresentationEnvironmentForBannerView_actionIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_1E5DD3280;
    id v11 = v6;
    id v10 = v7;
    [v8 dismissTipViewWithCompletion:v9];
  }
  else
  {
    (*((void (**)(id, void *, void))v6 + 2))(v6, v7, 0);
  }
}

uint64_t __115__PXCuratedLibraryUIViewController_preparePresentationEnvironmentForBannerView_actionIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)invalidateBoopableItemsProvider
{
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  id v3 = [(PXCuratedLibraryUIViewController *)self boopableItemsProvider];

  if (!v3)
  {
    id v4 = objc_alloc_init(PXBoopableItemsProvider);
    [(PXCuratedLibraryUIViewController *)self setBoopableItemsProvider:v4];

    id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v6 = [v5 viewModel];
    id v7 = [v6 selectionManager];
    id v8 = [(PXCuratedLibraryUIViewController *)self boopableItemsProvider];
    [v8 setSelectionManager:v7];

    int v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v10 = [v9 mediaProvider];
    id v11 = [(PXCuratedLibraryUIViewController *)self boopableItemsProvider];
    [v11 setImagePreviewMediaProvider:v10];
  }
  return (UIActivityItemsConfigurationReading *)[(PXCuratedLibraryUIViewController *)self boopableItemsProvider];
}

- (PXSelectionContainer)selectionContainer
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [(PXCuratedLibraryUIViewController *)self undoManager];
  id v5 = [v3 selectionContainerWithUndoManager:v4];

  return (PXSelectionContainer *)v5;
}

- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4
{
  [(PXCuratedLibraryUIViewController *)self _updateDrawerButtonVisibility];
  [(PXCuratedLibraryUIViewController *)self _updateBannerView];
}

- (void)splitViewController:(id)a3 willChangeSidebarVisibility:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v8 = [v7 viewModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PXCuratedLibraryUIViewController_splitViewController_willChangeSidebarVisibility___block_invoke;
  v10[3] = &unk_1E5DB7330;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [v8 performChanges:v10];
}

void __84__PXCuratedLibraryUIViewController_splitViewController_willChangeSidebarVisibility___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  BOOL v4 = [v3 splitBehavior] == 2 || *(unsigned char *)(a1 + 40) == 0;
  [v5 setSidebarCanBecomeVisible:v4];
}

- (id)_assetCollectionReferenceForGroup:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v11);
    BOOL v12 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 3896, @"%@ should be an instance inheriting from %@, but it is %@", @"axGroup", v10, v12 object file lineNumber description];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 3896, @"%@ should be an instance inheriting from %@, but it is nil", @"axGroup", v10 object file lineNumber description];
  }

LABEL_3:
  [v5 axRootParent];
  id v6 = [(id)objc_claimAutoreleasedReturnValue() axGroupSource];
  uint64_t v7 = [v5 axParent];
  [v5 axFrame];
  if (v7) {
    objc_msgSend(v6, "axConvertRect:fromDescendantGroup:", v7);
  }
  PXRectGetCenter();
}

void __70__PXCuratedLibraryUIViewController__assetCollectionReferenceForGroup___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 assetCollectionReference];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

- (void)_handleShowDefaultUIForGroup:(id)a3
{
  BOOL v4 = [(PXCuratedLibraryUIViewController *)self _assetCollectionReferenceForGroup:a3];
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = [(PXCuratedLibraryUIViewController *)self skimmingController];
    [v5 endPanning];

    BOOL v4 = v6;
  }
}

- (void)_handleShowAlternateUIForGroup:(id)a3
{
  id v5 = [(PXCuratedLibraryUIViewController *)self _assetCollectionReferenceForGroup:a3];
  if (v5)
  {
    BOOL v4 = [(PXCuratedLibraryUIViewController *)self skimmingController];
    [v4 startPanningForAssetCollectionReference:v5];
  }
}

- (void)_handleScrollToRevealInfo:(id)a3 inGroup:(id)a4
{
  id v11 = a3;
  id v6 = [(PXCuratedLibraryUIViewController *)self _assetCollectionReferenceForGroup:a4];
  if (v6)
  {
    uint64_t v7 = [(PXCuratedLibraryUIViewController *)self skimmingController];
    [v11 axFrame];
    double v9 = v8;
    double v10 = -15.0;
    if (v9 < 0.0 || (double v10 = 15.0, v9 > 0.0)) {
      objc_msgSend(v7, "updatePanningWithTranslation:", v10, 0.0);
    }
  }
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = PXGAXGetElementForUserInfo(v10);
  id v12 = v9;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    double v22 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v22);
    double v23 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 3851, @"%@ should be an instance inheriting from %@, but it is %@", @"axGroup", v21, v23 object file lineNumber description];
  }
  else
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    double v20 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 3851, @"%@ should be an instance inheriting from %@, but it is nil", @"axGroup", v21 object file lineNumber description];
  }

LABEL_3:
  id v13 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  uint64_t v14 = [v13 viewModel];

  if ([v14 zoomLevel] != 1) {
    goto LABEL_12;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a4 != 4 || (isKindOfClass & 1) == 0)
  {
    if (a4 == 2 && (isKindOfClass & 1) != 0)
    {
      [(PXCuratedLibraryUIViewController *)self _handleShowAlternateUIForGroup:v12];
      goto LABEL_11;
    }
    if (a4 == 3 && (isKindOfClass & 1) != 0)
    {
      [(PXCuratedLibraryUIViewController *)self _handleShowDefaultUIForGroup:v12];
      goto LABEL_11;
    }
LABEL_12:
    uint64_t v17 = [(PXCuratedLibraryUIViewController *)self axNextResponder];
    char v16 = [v17 axGroup:v12 didRequestToPerformAction:a4 userInfo:v10];

    goto LABEL_13;
  }
  [(PXCuratedLibraryUIViewController *)self _handleScrollToRevealInfo:v11 inGroup:v12];
LABEL_11:
  char v16 = 0;
LABEL_13:

  return v16;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXCuratedLibraryUIViewController *)self axNextResponder];
  [v10 axGroup:v9 didChange:a4 userInfo:v8];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryUIViewController.m" lineNumber:3836 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)footerControllerRevealFooter:(id)a3
{
}

- (void)didDismissTipForController:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self _buttonForEllipsisButtonAction];
  [v3 setShowsMenuAsPrimaryAction:1];
}

- (void)willPresentTipForController:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self _buttonForEllipsisButtonAction];
  [v3 setShowsMenuAsPrimaryAction:0];
}

- (id)passthroughViewsForTipForController:(id)a3
{
  BOOL v4 = [(PXCuratedLibraryUIViewController *)self navigationController];
  id v5 = [v4 navigationBar];

  id v6 = [(PXCuratedLibraryUIViewController *)self navigationController];
  uint64_t v7 = [v6 toolbar];

  id v8 = [(PXCuratedLibraryUIViewController *)self view];
  id v9 = [(PXCuratedLibraryUIViewController *)self gridView];
  id v10 = [(PXCuratedLibraryUIViewController *)self tabBarController];
  id v11 = [v10 tabBar];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  id v13 = v12;
  if (v11) {
    [v12 addObject:v11];
  }
  if (v5) {
    [v13 addObject:v5];
  }
  if (v7) {
    [v13 addObject:v7];
  }
  if (v8) {
    [v13 addObject:v8];
  }
  if (v9) {
    [v13 addObject:v9];
  }

  return v13;
}

- (id)presentationEnvironmentForStatusController:(id)a3
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:self];
}

- (void)statusController:(id)a3 configurationDidChange:(id)a4
{
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5) {
    [(PXCuratedLibraryUIViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else {
    [(PXCuratedLibraryUIViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)ppt_dismiss
{
  id v2 = self;
  id v3 = [(PXCuratedLibraryUIViewController *)self delegate];
  LOBYTE(v2) = [v3 curatedLibraryViewControllerDismiss:v2];

  return (char)v2;
}

- (void)ppt_navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 completionHandler:(id)a6
{
  if (a5) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[PXProgrammaticNavigationDestination alloc] initWithType:7 revealMode:v9 asset:v12 assetCollection:v11];

  [(PXCuratedLibraryUIViewController *)self navigateToDestination:v13 options:2 completionHandler:v10];
}

- (void)px_navigateToStateAllowingTabSwitchingWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v6 = [v5 viewModel];
  [v6 performChanges:&__block_literal_global_556];

  v7[2](v7, 1, 0);
}

uint64_t __104__PXCuratedLibraryUIViewController_px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:0];
}

- (void)_rescheduleNavigationRequest:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PXCuratedLibraryUIViewController *)self isGridViewReady])
  {
    id v5 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Impossible to reschedule the programmatic navigation %@ because the view has already been loaded", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [v4 completionHandler];
    v6[2](v6, 2, 0);
  }
  else
  {
    [(PXCuratedLibraryUIViewController *)self setInitialNavigationRequest:v4];
  }
}

- (void)_handleNavigationRequestConditionCompletionForNavigationRequest:(id)a3 withAssetReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXCuratedLibraryUIViewController *)self isGridViewReady])
  {
    id v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    [v8 prepareForNavigationToObjectReference:v7];

    uint64_t v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke;
    v10[3] = &unk_1E5DD1CD8;
    id v11 = v6;
    id v12 = v7;
    id v13 = self;
    [v9 scrollLibraryViewToAssetReference:v12 scrollPosition:64 completionHandler:v10];
  }
  else
  {
    [(PXCuratedLibraryUIViewController *)self _rescheduleNavigationRequest:v6];
  }
}

void __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 destination];
  uint64_t v8 = [v7 revealMode];

  if (v8 == 1 && *(void *)(a1 + 40))
  {
    uint64_t v9 = [*(id *)(a1 + 32) destination];
    uint64_t v10 = [v9 wantsEditMode];

    id v11 = [*(id *)(a1 + 32) destination];
    id v12 = [v11 completionKey];

    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_2;
    v20[3] = &unk_1E5DB7308;
    id v15 = *(id *)(a1 + 32);
    id v22 = v12;
    uint64_t v23 = v10;
    id v21 = v15;
    id v16 = v12;
    [v13 _presentOneUpForAssetReference:v14 configurationHandler:v20];
  }
  uint64_t v17 = [*(id *)(a1 + 32) completionHandler];
  id v18 = (void *)v17;
  if (a2) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, v19, v6);
}

void __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setAnimated:", ((unint64_t)objc_msgSend(v3, "options") >> 1) & 1);
  [v4 setActivity:*(void *)(a1 + 48)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_3;
  v5[3] = &unk_1E5DD36F8;
  id v6 = *(id *)(a1 + 40);
  [v4 setActivityCompletion:v5];
}

void *__119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_3(uint64_t a1)
{
  $0AC6E346AE4835514AAA8AC86D8F4844 result = *(void **)(a1 + 32);
  if (result)
  {
    id v2 = (const char *)[result UTF8String];
    return (void *)notify_post(v2);
  }
  return result;
}

- (void)_navigateToRevealAssetForNavigationRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v7 = [v6 viewModel];
  uint64_t v8 = [v7 assetsDataSourceManager];
  if (v8)
  {
    if ([v7 zoomLevel] != 4)
    {
      [v7 performChanges:&__block_literal_global_551];
      [v8 forceAllPhotosAccurateIfNeeded];
      uint64_t v9 = [v6 layout];
      [v9 updateIfNeeded];
    }
    uint64_t v10 = [v5 destination];
    id v11 = [v10 asset];

    if (v11)
    {
      id v12 = objc_alloc((Class)off_1E5DA55E0);
      long long v13 = *((_OWORD *)off_1E5DAB028 + 1);
      long long v30 = *(_OWORD *)off_1E5DAB028;
      long long v31 = v13;
      uint64_t v14 = (void *)[v12 initWithSectionObject:0 itemObject:v11 subitemObject:0 indexPath:&v30];
    }
    else
    {
      id v15 = [v8 dataSourceForZoomLevel:4];
      id v16 = v15;
      long long v30 = 0u;
      long long v31 = 0u;
      if (v15)
      {
        [v15 lastItemIndexPath];
        uint64_t v17 = v30;
      }
      else
      {
        uint64_t v17 = 0;
      }
      if (v17 == *(void *)off_1E5DAAED8) {
        PXAssertGetLog();
      }
      *(_OWORD *)id location = v30;
      long long v35 = v31;
      uint64_t v14 = [v16 assetReferenceAtItemIndexPath:location];
    }
    objc_initWeak(location, self);
    *(void *)&long long v30 = 0;
    *((void *)&v30 + 1) = &v30;
    *(void *)&long long v31 = 0x3032000000;
    *((void *)&v31 + 1) = __Block_byref_object_copy__79651;
    double v32 = __Block_byref_object_dispose__79652;
    id v33 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_552;
    v25[3] = &unk_1E5DB72B8;
    id v26 = v14;
    id v18 = v8;
    double v28 = &v30;
    uint64_t v29 = 4;
    id v27 = v18;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_2;
    v20[3] = &unk_1E5DB72E0;
    v24[1] = (id)a2;
    void v20[4] = self;
    id v19 = v26;
    id v21 = v19;
    id v22 = v5;
    objc_copyWeak(v24, location);
    uint64_t v23 = &v30;
    [v18 waitForCondition:v25 timeout:v20 completionHandler:1.0];
    objc_destroyWeak(v24);

    _Block_object_dispose(&v30, 8);
    objc_destroyWeak(location);
  }
  else
  {
    [(PXCuratedLibraryUIViewController *)self _rescheduleNavigationRequest:v5];
  }
}

BOOL __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_552(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32)
    && ([*(id *)(a1 + 40) dataSourceForZoomLevel:*(void *)(a1 + 56)],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == v3))
  {
    uint64_t v6 = [v3 assetReferenceForAssetReference:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    PXAssertGetLog();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleNavigationRequestConditionCompletionForNavigationRequest:*(void *)(a1 + 48) withAssetReference:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

uint64_t __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:4];
}

- (id)px_navigationDestination
{
  id v2 = [[PXProgrammaticNavigationDestination alloc] initWithType:1 revealMode:0];
  return v2;
}

uint64_t __84__PXCuratedLibraryUIViewController_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)zoomLevelControl:(id)a3 didTapOnAlreadySelectedZoomLevel:(int64_t)a4
{
}

- (void)_createAnimationForSkimmingWithDuration:(double)a3 indicatorsDidChangeVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v10 = [v6 layout];

  if (v4) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = [v10 secondSublayout];
  uint64_t v9 = [v8 createCuratedLibraryLayoutAnimationIfNeededWithContext:v7];

  [v9 setDuration:a3];
}

- (void)skimmingControllerDidStopSkimming:(id)a3 animationDuration:(double)a4
{
}

- (void)skimmingController:(id)a3 willStartSkimmingAssetCollectionReference:(id)a4 animationDuration:(double)a5
{
  uint64_t v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v8 = [v7 layout];
  [v8 clearLastVisibleAreaAnchoringInformation];

  [(PXCuratedLibraryUIViewController *)self _createAnimationForSkimmingWithDuration:0 indicatorsDidChangeVisibility:a5];
}

- (void)skimmingController:(id)a3 willHideSkimmingHintsForAssetCollectionReference:(id)a4 animationDuration:(double)a5
{
}

- (void)skimmingController:(id)a3 willShowSkimmingHintsForAssetCollectionReference:(id)a4 animationDuration:(double)a5
{
}

- (id)_dominantAssetCollectionReferenceForSkimming
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v4 = [v3 layout];
  BOOL v5 = [v4 libraryBodyLayout];
  uint64_t v6 = [v5 dominantSectionLayout];

  uint64_t v7 = [v6 zoomLevel];
  uint64_t v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v9 = [v8 viewModel];
  if (v7 == [v9 zoomLevel])
  {
    id v10 = [v6 assetCollectionReference];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)PXCuratedLibraryUIViewController;
  uint64_t v8 = -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v51, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = [(PXCuratedLibraryUIViewController *)self gridView];
  id v11 = objc_alloc_init(PXDiagnosticsItemProvider);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__79651;
  v49 = __Block_byref_object_dispose__79652;
  id v50 = 0;
  objc_msgSend(v10, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v44[3] = &unk_1E5DB71A8;
  v44[4] = &v45;
  objc_msgSend(v10, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v44);
  id v12 = [(id)v46[5] assetCollectionReference];
  long long v13 = [v12 assetCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v14 = v13;

    if (!v14) {
      goto LABEL_7;
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2;
    v42[3] = &unk_1E5DD2988;
    id v15 = v14;
    id v43 = v15;
    [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection" loadHandler:v42];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3;
    v40[3] = &unk_1E5DD2988;
    id v14 = v15;
    id v41 = v14;
    [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierHighlight" loadHandler:v40];
    id v16 = [v10 diagnosticDescription];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_4;
    v38[3] = &unk_1E5DD2988;
    id v17 = v16;
    id v39 = v17;
    [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierViewDescription" loadHandler:v38];
    id v18 = [(id)v46[5] layout];
    id v19 = [v18 diagnosticDescription];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_5;
    v36[3] = &unk_1E5DD2988;
    id v20 = v19;
    id v37 = v20;
    [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierLayoutDescription" loadHandler:v36];

    long long v13 = v43;
  }
  else
  {
    id v14 = 0;
  }

LABEL_7:
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__79651;
  v34 = __Block_byref_object_dispose__79652;
  id v35 = 0;
  objc_msgSend(v10, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_6;
  v29[3] = &unk_1E5DB71A8;
  v29[4] = &v30;
  objc_msgSend(v10, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v29);
  id v21 = [(id)v31[5] assetReference];
  id v22 = [v21 asset];

  if (v22)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_7;
    v27[3] = &unk_1E5DD2988;
    id v28 = v22;
    [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierAsset" loadHandler:v27];
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_8;
  v26[3] = &unk_1E5DD2988;
  v26[4] = self;
  [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierViewController" loadHandler:v26];
  uint64_t v23 = [(PXDiagnosticsItemProvider *)v11 registeredIdentifiers];
  uint64_t v24 = [v23 count];

  if (v24) {
    [v9 addObject:v11];
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v45, 8);

  return v9;
}

void __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  uint64_t v6 = [v8 assetCollectionReference];
  id v7 = [v6 assetCollection];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_6(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  uint64_t v6 = [v7 assetReference];

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_createPreviewViewForAssetReference:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  uint64_t v6 = [v5 viewModel];
  uint64_t v7 = [v6 zoomLevel];

  if (v4)
  {
    id v29 = 0;
    id v8 = [(PXCuratedLibraryUIViewController *)self _regionOfInterestForAssetReference:v4 image:&v29];
    id v9 = v29;
    id v10 = [(PXCuratedLibraryUIViewController *)self gridView];
    id v11 = [v10 scrollViewController];
    id v12 = [v11 contentCoordinateSpace];
    [v8 rectInCoordinateSpace:v12];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v14, v16, v18, v20);
    double v22 = 0.0;
    uint64_t v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
    [v21 setBackgroundColor:v23];

    if ((unint64_t)(v7 - 1) < 2) {
      double v22 = 10.0;
    }
    uint64_t v24 = [v21 layer];
    [v24 setCornerRadius:v22];

    uint64_t v25 = *MEMORY[0x1E4F39EA8];
    id v26 = [v21 layer];
    [v26 setCornerCurve:v25];
  }
  else
  {
    id v9 = 0;
    id v8 = 0;
    id v21 = 0;
  }
  id v27 = v21;

  return v27;
}

- (id)_createPreviewViewForHitTestResult:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([v4 control] - 1) > 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if ([v4 control] == 1)
    {
      BOOL v5 = [v4 assetReference];
    }
    else
    {
      BOOL v5 = [v4 assetCollectionReference];

      if (v5)
      {
        uint64_t v7 = [v4 assetCollectionReference];
        BOOL v5 = [v7 keyAssetReference];
      }
    }
    uint64_t v6 = [(PXCuratedLibraryUIViewController *)self _createPreviewViewForAssetReference:v5];
  }
  return v6;
}

- (id)_bestHitTestResultForCursorAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__79651;
  double v13 = __Block_byref_object_dispose__79652;
  id v14 = 0;
  BOOL v5 = [(PXCuratedLibraryUIViewController *)self gridView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PXCuratedLibraryUIViewController__bestHitTestResultForCursorAtLocation___block_invoke;
  v8[3] = &unk_1E5DB71A8;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v8, x, y);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__PXCuratedLibraryUIViewController__bestHitTestResultForCursorAtLocation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((unint64_t)([v6 control] - 1) <= 2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)pointerController:(id)a3 didExitRegionWithRect:(CGRect)a4 inCoordinateSpace:(id)a5
{
  id v7 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  BOOL v5 = [v7 viewModel];
  id v6 = [v5 selectionManager];

  [v6 performChanges:&__block_literal_global_542_79678];
}

uint64_t __94__PXCuratedLibraryUIViewController_pointerController_didExitRegionWithRect_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *((_OWORD *)off_1E5DAB028 + 1);
  v4[0] = *(_OWORD *)off_1E5DAB028;
  v4[1] = v2;
  return [a2 setPendingIndexPath:v4];
}

- (void)pointerController:(id)a3 willEnterRegionWithRect:(CGRect)a4 inCoordinateSpace:(id)a5
{
  id v5 = a5;
  PXRectGetCenter();
}

uint64_t __96__PXCuratedLibraryUIViewController_pointerController_willEnterRegionWithRect_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setPendingIndexPath:v4];
}

- (int64_t)pointerController:(id)a3 interactionOptionsForRegionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v6 = [v5 viewModel];

  uint64_t v7 = [v6 zoomLevel];
  id v8 = +[PXCursorInteractionSettings sharedInstance];
  uint64_t v9 = [v6 zoomablePhotosViewModel];
  int64_t v10 = objc_msgSend(v8, "interactionOptionsForZoomLevel:isAllPhotosAspectFit:", v7, objc_msgSend(v9, "aspectFit"));

  return v10;
}

- (id)pointerController:(id)a3 viewForCursorInteractionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  uint64_t v9 = [(PXCuratedLibraryUIViewController *)self gridView];
  int64_t v10 = [v9 scrollViewController];
  uint64_t v11 = [v10 contentCoordinateSpace];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    double v13 = [(PXCuratedLibraryUIViewController *)self gridView];
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    double v18 = -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v15, v17);
    if (v18)
    {
      double v19 = [(PXCuratedLibraryUIViewController *)self _createPreviewViewForHitTestResult:v18];
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

  return v19;
}

- (id)pointerController:(id)a3 identifierForRegionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  uint64_t v9 = [(PXCuratedLibraryUIViewController *)self gridView];
  int64_t v10 = [v9 scrollViewController];
  uint64_t v11 = [v10 contentCoordinateSpace];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    double v13 = [(PXCuratedLibraryUIViewController *)self gridView];
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    double v18 = -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v15, v17);
    uint64_t v19 = [v18 control];
    if ((unint64_t)(v19 - 2) >= 2)
    {
      if (v19 == 1)
      {
        id v21 = [v18 assetReference];
        double v22 = [v21 asset];
        double v20 = [v22 uuid];
      }
      else
      {
        double v20 = 0;
      }
    }
    else
    {
      double v20 = [v18 assetCollectionReference];
    }
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

- (BOOL)_shouldExposeCursorAnimations
{
  long long v2 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v3 = [v2 viewModel];

  id v4 = [v3 zoomablePhotosViewModel];
  uint64_t v5 = [v3 zoomLevel];
  long long v12 = 0u;
  long long v13 = 0u;
  if (v4) {
    objc_msgSend(v4, "zoomState", (unsigned __int128)0, (unsigned __int128)0);
  }
  int v6 = objc_msgSend(v4, "isDisplayingIndividualItems", v12, v13);
  uint64_t v7 = [v3 zoomLevelTransitionPhase];
  BOOL v8 = v5 != 4;
  int v9 = v6 ^ 1;
  if (v5 != 4) {
    int v9 = 1;
  }
  if (!v9) {
    BOOL v8 = 1;
  }
  if (v5 == 3) {
    BOOL v8 = 0;
  }
  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8;
  }

  return v10;
}

- (id)pointerController:(id)a3 regionOfInterestForCursorAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  int v9 = [(PXCuratedLibraryUIViewController *)self gridView];
  BOOL v10 = [v9 scrollViewController];
  uint64_t v11 = [v10 contentCoordinateSpace];
  int v12 = [v8 isEqual:v11];

  if (v12 && [(PXCuratedLibraryUIViewController *)self _shouldExposeCursorAnimations])
  {
    long long v13 = [(PXCuratedLibraryUIViewController *)self gridView];
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    double v18 = -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v15, v17);
    if ((unint64_t)([v18 control] - 1) > 2)
    {
      id v21 = 0;
    }
    else
    {
      uint64_t v19 = [(PXCuratedLibraryUIViewController *)self gridView];
      double v20 = [v18 spriteReference];
      id v21 = [v19 regionOfInterestForSpriteReference:v20];
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)dragController:(id)a3 shouldResizeCancelledPreviewForAssetReference:(id)a4
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v5 = [v4 layout];
  int v6 = [v5 hiddenSpriteIndexes];
  BOOL v7 = [v6 count] == 0;

  return v7;
}

- (BOOL)dragController:(id)a3 shouldSelectRearrangedAssetReferences:(id)a4
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v5 = [v4 viewModel];
  char v6 = [v5 isSelecting];

  return v6;
}

- (void)dragController:(id)a3 draggedAssetReferencesDidChange:(id)a4
{
  id v5 = a4;
  char v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v7 = [v6 viewModel];

  id v8 = [v7 draggedAssetReferences];
  unint64_t v9 = [v8 count];
  unint64_t v10 = [v5 count];

  if (v9 > v10)
  {
    uint64_t v11 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    int v12 = [v11 layout];
    id v13 = (id)[v12 createFenceWithType:2];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PXCuratedLibraryUIViewController_dragController_draggedAssetReferencesDidChange___block_invoke;
  v15[3] = &unk_1E5DCF3F0;
  id v16 = v5;
  id v14 = v5;
  [v7 performChanges:v15];
}

uint64_t __83__PXCuratedLibraryUIViewController_dragController_draggedAssetReferencesDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDraggedAssetReferences:*(void *)(a1 + 32)];
}

- (id)dragController:(id)a3 dropTargetAssetReferenceForLocation:(CGPoint)a4
{
  return 0;
}

- (id)dragController:(id)a3 regionOfInterestForAssetReference:(id)a4 image:(id *)a5
{
  return [(PXCuratedLibraryUIViewController *)self _regionOfInterestForAssetReference:a4 image:a5];
}

- (void)dragController:(id)a3 isDragSessionActiveDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v6 videoPlaybackController];
  [v5 setIsDragSessionActive:v4];
}

- (id)dragControllerAssetReferenceForBeginningSession:(id)a3
{
  BOOL v4 = [(UIViewController *)self px_oneUpPresentation];
  if ([v4 isContextMenuInteractionActive])
  {
    id v5 = [(PXCuratedLibraryUIViewController *)self navigatedAssetReference];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dragController:(id)a3 draggableAssetReferenceAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__79651;
  id v16 = __Block_byref_object_dispose__79652;
  id v17 = 0;
  id v8 = [(PXCuratedLibraryUIViewController *)self gridView];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PXCuratedLibraryUIViewController_dragController_draggableAssetReferenceAtLocation___block_invoke;
  v11[3] = &unk_1E5DB71A8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v11, x, y);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __85__PXCuratedLibraryUIViewController_dragController_draggableAssetReferenceAtLocation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v5 = [v10 control];
  if ((unint64_t)(v5 - 7) < 9)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
LABEL_3:

    *a3 = 1;
    goto LABEL_4;
  }
  if (v5 == 1)
  {
    uint64_t v8 = [v10 assetReference];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
    goto LABEL_3;
  }
LABEL_4:
}

- (BOOL)oneUpPresentationShouldPreventShowInAllPhotosAction:(id)a3
{
  return 1;
}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  BOOL v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v5 = [v4 viewModel];

  uint64_t v6 = [v5 selectionManager];
  id v7 = [v6 selectionSnapshot];

  uint64_t v8 = [(PXCuratedLibraryUIViewController *)self navigatedAssetReference];
  if (!v8) {
    PXAssertGetLog();
  }
  if [v5 isSelecting] && (objc_msgSend(v7, "isAnyItemSelected"))
  {
    uint64_t v9 = [v7 selectedIndexPaths];
    [v8 indexPath];
    char v12 = [v9 containsIndexPath:v15];

    if (v12)
    {
      uint64_t v11 = objc_msgSend(v5, "assetActionManager", v15[0], v15[1]);
    }
    else
    {
      id v13 = [(PXCuratedLibraryUIViewController *)self barsController];
      uint64_t v11 = [v13 createAssetActionManagerForAssetReference:v8];

      [v11 setObjectReference:v8];
    }
  }
  else
  {
    id v10 = [(PXCuratedLibraryUIViewController *)self barsController];
    uint64_t v11 = [v10 createAssetActionManagerForAssetReference:v8];
  }
  return v11;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5 = a4;
  id v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v6 = [v7 layout];
  [v6 hideSpritesForObjectReferences:v5];
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v6 = a4;
  [(PXCuratedLibraryUIViewController *)self _requestExpansionIfNeededForInteractionWithAssetReference:v6 animated:0];
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  [v5 scrollLibraryViewToAssetReference:v6 scrollPosition:64 completionHandler:0];

  [(PXCuratedLibraryUIViewController *)self setNavigatedAssetReference:v6];
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v6 = a4;
  if (([a3 isContextMenuInteractionActive] & 1) == 0)
  {
    id v7 = [v6 asset];
    if ([v7 playbackStyle] == 3)
    {
      uint64_t v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
      uint64_t v9 = [v8 videoPlaybackController];
      id v10 = [v6 asset];
      char v11 = [v9 isPlayingDisplayAsset:v10];

      if (v11)
      {
        id v12 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v15 = 0;
  id v13 = [(PXCuratedLibraryUIViewController *)self _regionOfInterestForAssetReference:v6 image:&v15];
  id v12 = v15;
LABEL_7:

  return v12;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v5 = [(PXCuratedLibraryUIViewController *)self _regionOfInterestForAssetReference:a4 image:0];
  id v6 = [(PXCuratedLibraryUIViewController *)self gridView];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PXCuratedLibraryUIViewController_oneUpPresentation_regionOfInterestForAssetReference___block_invoke;
  v9[3] = &unk_1E5DD2298;
  id v10 = v6;
  id v7 = v6;
  [v5 setPlaceholderViewFactory:v9];

  return v5;
}

uint64_t __88__PXCuratedLibraryUIViewController_oneUpPresentation_regionOfInterestForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  [a2 rectInCoordinateSpace:v2];
  return objc_msgSend(v2, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
}

- (BOOL)oneUpPresentation:(id)a3 commitPreviewForContextMenuInteraction:(id)a4
{
  id v5 = a4;
  id v6 = [(PXCuratedLibraryUIViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();
  if (v7)
  {
    uint64_t v8 = [(PXCuratedLibraryUIViewController *)self navigatedAssetReference];
    [v6 curatedLibraryViewController:self commitPreviewForContextMenuInteraction:v5 withAssetReference:v8];
  }
  return v7 & 1;
}

- (void)oneUpPresentation:(id)a3 willEndPreviewingForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v6 videoPlaybackController];
  [v5 setIsContextMenuInteractionActive:0];
}

- (void)oneUpPresentation:(id)a3 willStartPreviewingForContextMenuInteraction:(id)a4
{
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v4 = [v5 videoPlaybackController];
  [v4 setIsContextMenuInteractionActive:1];
}

- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4
{
  return 1;
}

- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4
{
  id v5 = a4;
  if ([(PXCuratedLibraryUIViewController *)self _handleGestureForFilterTipController])
  {
    BOOL v6 = 0;
  }
  else
  {
    char v7 = [(PXCuratedLibraryUIViewController *)self gridView];
    uint64_t v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    uint64_t v9 = [v8 viewModel];
    id v10 = [v9 zoomablePhotosViewModel];
    int v11 = [v10 isDisplayingIndividualItems];

    if (v11)
    {
      [v5 locationInView:v7];
      id v12 = -[PXCuratedLibraryUIViewController _hitTestAssetReferenceAtLocation:inCoordinateSpace:](self, "_hitTestAssetReferenceAtLocation:inCoordinateSpace:", v7);
      BOOL v6 = v12 != 0;
      if (v12) {
        [(PXCuratedLibraryUIViewController *)self setNavigatedAssetReference:v12];
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (BOOL)oneUpPresentation:(id)a3 allowsMultiSelectMenuForInteraction:(id)a4
{
  BOOL v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v4 viewModel];

  LOBYTE(v4) = [v5 isSelecting];
  return (char)v4;
}

- (id)oneUpPresentation:(id)a3 secondaryIdentifiersForConfiguration:(id)a4
{
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v6 = [v5 viewModel];

  if ([v6 isSelecting])
  {
    char v7 = [(PXCuratedLibraryUIViewController *)self navigatedAssetReference];
    if (v7) {
      [v7 indexPath];
    }
    PXIndexPathFromSimpleIndexPath();
  }

  return 0;
}

void __91__PXCuratedLibraryUIViewController_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke(uint64_t a1, int64x2_t *a2)
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a2, *(int64x2_t *)(a1 + 40)), (int32x4_t)vceqq_s64(a2[1], *(int64x2_t *)(a1 + 56)))), 0xFuLL))) & 1) == 0)
  {
    long long v2 = *(void **)(a1 + 32);
    id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2[1].i64[0] inSection:a2->i64[1]];
    [v2 addObject:v3];
  }
}

- (id)targetedPreviewForAssetReference:(id)a3
{
  id v23 = 0;
  BOOL v4 = [(PXCuratedLibraryUIViewController *)self _regionOfInterestForAssetReference:a3 image:&v23];
  id v5 = v23;
  BOOL v6 = [(PXCuratedLibraryUIViewController *)self gridView];
  char v7 = [v6 scrollViewController];

  uint64_t v8 = [v7 scrollView];
  uint64_t v9 = [v8 coordinateSpace];
  [v4 rectInCoordinateSpace:v9];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (v5)
  {
    PXPreviewImageViewForImage(v5, v4, v11, v13, v15, v17);
    if (!objc_claimAutoreleasedReturnValue()) {
      goto LABEL_7;
    }
LABEL_6:
    id v21 = objc_alloc(MEMORY[0x1E4FB1B38]);
    PXRectGetCenter();
  }
  double v18 = [v4 placeholderViewFactory];

  if (v18)
  {
    uint64_t v19 = [v4 placeholderViewFactory];
    uint64_t v20 = ((void (**)(void, void *))v19)[2](v19, v4);

    if (v20) {
      goto LABEL_6;
    }
  }
LABEL_7:

  return 0;
}

- (id)assetReferenceForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v6 = [v5 viewModel];

  char v7 = [v6 selectionManager];
  uint64_t v8 = [v7 selectionSnapshot];

  uint64_t v9 = [v8 dataSource];
  uint64_t v10 = [v9 identifier];
  uint64_t v11 = [v4 section];
  uint64_t v12 = [v4 item];

  v15[0] = v10;
  v15[1] = v11;
  _OWORD v15[2] = v12;
  v15[3] = 0x7FFFFFFFFFFFFFFFLL;
  double v13 = [v9 objectReferenceAtIndexPath:v15];

  return v13;
}

- (id)oneUpPresentation:(id)a3 previewForDismissingToSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  BOOL v6 = [(PXCuratedLibraryUIViewController *)self assetReferenceForIndexPath:a4];
  if (v6)
  {
    char v7 = [(PXCuratedLibraryUIViewController *)self targetedPreviewForAssetReference:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)oneUpPresentation:(id)a3 previewForHighlightingSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  BOOL v6 = [(PXCuratedLibraryUIViewController *)self assetReferenceForIndexPath:a4];
  if (v6)
  {
    char v7 = [(PXCuratedLibraryUIViewController *)self targetedPreviewForAssetReference:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 mediaProvider];

  return v4;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v6 = [v5 assetsDataSourceManager];
  char v7 = [v6 currentPhotoKitAssetsDataSourceManager];

  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryUIViewController.m" lineNumber:2925 description:@"PhotoKit data source manager is missing"];
  }
  return v7;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];

  uint64_t v5 = [v4 zoomLevel];
  if (v5 == 3)
  {
    int64_t v9 = 39;
    goto LABEL_10;
  }
  if (v5 != 4)
  {
    int64_t v9 = 0;
    goto LABEL_10;
  }
  BOOL v6 = [v4 zoomablePhotosViewModel];
  if (!v6)
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    goto LABEL_9;
  }
  char v7 = v6;
  [v6 zoomState];
  uint64_t v8 = v13;

  if ((unint64_t)(v8 - 1) >= 5)
  {
LABEL_9:
    int64_t v9 = 43;
    goto LABEL_10;
  }
  int64_t v9 = qword_1AB35ABB0[v8 - 1];
LABEL_10:

  return v9;
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PXCuratedLibraryUIViewController *)self view];
  id v9 = (id)v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2886, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];

    uint64_t v7 = 0;
  }
  [v6 setSourceView:v7];
  [v6 setPermittedArrowDirections:3];
}

- (id)sourceItemForTipID:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self filterButtonController];
  id v4 = [v3 button];

  return v4;
}

- (void)curatedLibraryActionPerformer:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v7 = [v6 viewModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_contentFilterStateChanged___block_invoke;
  v10[3] = &unk_1E5DCF3F0;
  id v11 = v5;
  id v8 = v5;
  [v7 performChanges:v10];

  id v9 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  [v9 didChangeFilterState:v8];
}

uint64_t __92__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_contentFilterStateChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userDidSetAllPhotosContentFilterState:*(void *)(a1 + 32)];
}

- (void)curatedLibraryActionPerformer:(id)a3 libraryFilterStateChanged:(id)a4
{
  id v4 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  [v4 userDidChangeLibraryFilterState];
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  _OWORD v22[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v19);
    uint64_t v20 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2843, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAssetCollection", v18, v20 object file lineNumber description];
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2843, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAssetCollection", v18 object file lineNumber description];
  }

LABEL_3:
  id v9 = [(PXCuratedLibraryUIViewController *)self moviePresenter];
  if (!v9)
  {
    id v9 = +[PXMoviePresenter moviePresenterWithPresentingViewController:self];
    [(PXCuratedLibraryUIViewController *)self setMoviePresenter:v9];
  }
  if ([v9 presentMovieViewControllerForAssetCollection:v8 keyAssetFetchResult:0 preferredTransitionType:1])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F56658];
    uint64_t v11 = *MEMORY[0x1E4F56548];
    v22[0] = v8;
    uint64_t v12 = *MEMORY[0x1E4F56560];
    v21[0] = v11;
    v21[1] = v12;
    long long v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    v22[1] = v14;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v10 sendEvent:@"com.apple.photos.CPAnalytics.assetCollectionMoviePlayed" withPayload:v15];
  }
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = (PXCuratedLibraryUIViewController *)a4;
  id v8 = (void (**)(void))a5;
  uint64_t v9 = [(UIViewController *)self px_topmostPresentedViewController];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (PXCuratedLibraryUIViewController *)v9;
  }
  else {
    uint64_t v11 = self;
  }
  uint64_t v12 = v11;

  if (v12 == v7)
  {
    [(PXCuratedLibraryUIViewController *)v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }

  return v12 == v7;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v12 = [(PXCuratedLibraryUIViewController *)self navigationController];
      long long v13 = v12;
      BOOL v11 = v12 != 0;
      if (v12) {
        [v12 pushViewController:v10 animated:1];
      }

      break;
    case 2:
      BOOL v11 = [(PXCuratedLibraryUIViewController *)self _actionPerformer:v9 presentViewController:v10];
      break;
    case 0:
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryUIViewController.m" lineNumber:2817 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      BOOL v11 = 0;
      break;
  }

  return v11;
}

- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(PXCuratedLibraryUIViewController *)self gridView];
      id v10 = v7;
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_5:
          id v11 = v8;
          uint64_t v12 = [v11 popoverPresentationController];
          [v12 setSourceView:v9];

          long long v13 = [v10 buttonSpriteReference];
          long long v14 = [v9 regionOfInterestForSpriteReference:v13];

          if (v14)
          {
            [v14 rectInCoordinateSpace:v9];
            double v16 = v15;
            double v18 = v17;
            double v20 = v19;
            double v22 = v21;
            id v23 = [v11 popoverPresentationController];
            objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);
          }
          LOBYTE(v24) = 1;
          [(PXCuratedLibraryUIViewController *)self presentViewController:v11 animated:1 completion:0];

          goto LABEL_36;
        }
        uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
        id v50 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v50);
        objc_super v51 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
        [v47 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2745, @"%@ should be an instance inheriting from %@, but it is %@", @"actionPerformer", v49, v51 object file lineNumber description];
      }
      else
      {
        uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
        v48 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v48);
        [v47 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2745, @"%@ should be an instance inheriting from %@, but it is nil", @"actionPerformer", v49 object file lineNumber description];
      }

      goto LABEL_5;
    }
  }
  uint64_t v25 = [v7 actionType];
  int v26 = [v25 isEqualToString:@"PXCuratedLibraryActionShowFilters"];

  if (v26)
  {
    id v9 = v8;
    id v10 = [v9 popoverPresentationController];
    LOBYTE(v24) = v10 != 0;
    if (!v10)
    {
LABEL_36:

      goto LABEL_37;
    }
    id v27 = +[PXPhotosGridSettings sharedInstance];
    int v28 = [v27 enableFilterViewControllerAnchoringToSender];

    if (v28)
    {
      id v29 = [v7 sender];
      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = v29;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            double v61 = [MEMORY[0x1E4F28B00] currentHandler];
            v55 = (objc_class *)objc_opt_class();
            double v59 = NSStringFromClass(v55);
            id v56 = objc_msgSend(v29, "px_descriptionForAssertionMessage");
            [v61 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2766, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"sender", v59, v56 object file lineNumber description];
          }
          [v10 setSourceView:v29];

          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v44 = [v7 sender];
          if (v44)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v62 = [MEMORY[0x1E4F28B00] currentHandler];
              uint64_t v57 = (objc_class *)objc_opt_class();
              double v60 = NSStringFromClass(v57);
              id v58 = objc_msgSend(v44, "px_descriptionForAssertionMessage");
              [v62 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2769, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"actionPerformer.sender", v60, v58 object file lineNumber description];
            }
          }
          [v10 setBarButtonItem:v44];

          goto LABEL_35;
        }
      }
      uint64_t v45 = [(PXCuratedLibraryUIViewController *)self view];
      [v10 setSourceView:v45];
    }
    else
    {
      id v29 = [(PXCuratedLibraryUIViewController *)self view];
      [v10 setSourceView:v29];
    }
LABEL_35:

    [(PXCuratedLibraryUIViewController *)self presentViewController:v9 animated:1 completion:0];
    goto LABEL_36;
  }
  uint64_t v30 = [v7 actionType];
  int v31 = [v30 isEqualToString:@"PXCuratedLibraryActionTapToRadar"];

  if (v31)
  {
    id v32 = v8;
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v33 = [MEMORY[0x1E4F28B00] currentHandler];
        v34 = (objc_class *)objc_opt_class();
        id v35 = NSStringFromClass(v34);
        uint64_t v36 = objc_msgSend(v32, "px_descriptionForAssertionMessage");
        [v33 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2785, @"%@ should be an instance inheriting from %@, but it is %@", @"UIViewControllerFromPXViewController(pxViewController)", v35, v36 object file lineNumber description];
LABEL_44:

        goto LABEL_45;
      }
      goto LABEL_23;
    }
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    id v52 = (objc_class *)objc_opt_class();
    id v35 = NSStringFromClass(v52);
    [v33 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2785, @"%@ should be an instance inheriting from %@, but it is nil", @"UIViewControllerFromPXViewController(pxViewController)", v35 object file lineNumber description];
    goto LABEL_45;
  }
  id v37 = [v7 actionType];
  int v38 = [v37 isEqualToString:@"PXCuratedLibraryActionCurationDebug"];

  if (v38)
  {
    id v32 = v8;
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v33 = [MEMORY[0x1E4F28B00] currentHandler];
        double v54 = (objc_class *)objc_opt_class();
        id v35 = NSStringFromClass(v54);
        uint64_t v36 = objc_msgSend(v32, "px_descriptionForAssertionMessage");
        [v33 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2789, @"%@ should be an instance inheriting from %@, but it is %@", @"UIViewControllerFromPXViewController(pxViewController)", v35, v36 object file lineNumber description];
        goto LABEL_44;
      }
LABEL_23:
      id v39 = [(PXCuratedLibraryUIViewController *)self gridView];
      double v40 = [v39 diagnosticDescription];
      [v32 setHostViewDiagnosticDescription:v40];

      [(UIViewController *)self px_presentViewControllerInNavigationController:v32 animated:1 dimissButtonLocation:0 completion:0];
      goto LABEL_24;
    }
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    double v53 = (objc_class *)objc_opt_class();
    id v35 = NSStringFromClass(v53);
    [v33 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2789, @"%@ should be an instance inheriting from %@, but it is nil", @"UIViewControllerFromPXViewController(pxViewController)", v35 object file lineNumber description];
LABEL_45:

    goto LABEL_23;
  }
  id v41 = [v7 actionType];
  int v24 = [v41 isEqualToString:@"PXCuratedLibraryActionShare"];

  if (!v24)
  {
    id v42 = v8;
    id v43 = [(PXCuratedLibraryUIViewController *)self navigationController];
    [v43 pushViewController:v42 animated:1];

    goto LABEL_37;
  }
  [(PXCuratedLibraryUIViewController *)self presentViewController:v8 animated:1 completion:0];
LABEL_24:
  LOBYTE(v24) = 0;
LABEL_37:

  return v24;
}

- (void)curatedLibraryActionPerformer:(id)a3 presentShareSheetWithSharingContext:(id)a4
{
  id v16 = a4;
  id v6 = [(PXCuratedLibraryUIViewController *)self px_sharePresentation];
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2733, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];
  }
  id v7 = [v6 createActivitySharingControllerWithContext:v16];
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2735, @"Invalid parameter not satisfying: %@", @"activitySharingController" object file lineNumber description];
  }
  id v8 = [v7 activityViewController];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v14);
    double v15 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2736, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController.activityViewController", v13, v15 object file lineNumber description];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2736, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController.activityViewController", v13 object file lineNumber description];
  }

LABEL_7:
  [(PXCuratedLibraryUIViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)curatedLibraryActionPerformer:(id)a3 presentContextMenuActionsWithPerformers:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v6 = a4;
  id v43 = self;
  uint64_t v45 = [(PXCuratedLibraryUIViewController *)self px_sharePresentation];
  id v7 = v45;
  if (!v45)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, v43, @"PXCuratedLibraryUIViewController.m", 2670, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];

    id v7 = 0;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  id v9 = [v7 defaultActivityTypeOrder];
  id v10 = (void *)[v8 initWithArray:v9];

  if (!v10)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, v43, @"PXCuratedLibraryUIViewController.m", 2672, @"Invalid parameter not satisfying: %@", @"defaultActivityTypeOrder" object file lineNumber description];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  char v65 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke;
  aBlock[3] = &unk_1E5DB7268;
  id v46 = v11;
  id v62 = v46;
  BOOL v63 = v64;
  uint64_t v47 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v6;
  uint64_t v14 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v58 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        double v18 = [v17 menuElement];
        double v19 = [v17 activityType];
        double v20 = v13;
        if (!v19
          || (int v21 = [v10 containsObject:v19], v20 = v13, !v21)
          || (([v12 setObject:v18 forKeyedSubscript:v19],
               v19 != @"PXActivityTypeSetAllLibrariesFilter")
            ? (BOOL v22 = v19 == @"PXActivityTypeSetPersonalLibraryFilter")
            : (BOOL v22 = 1),
              !v22 ? (BOOL v23 = v19 == @"PXActivityTypeSetSharedLibraryFilter") : (BOOL v23 = 1),
              double v20 = v46,
              v23))
        {
          [v20 addObject:v18];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v14);
  }

  int v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v48 = v10;
  uint64_t v25 = [v48 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v54 != v26) {
          objc_enumerationMutation(v48);
        }
        int v28 = *(__CFString **)(*((void *)&v53 + 1) + 8 * j);
        id v29 = [v12 objectForKeyedSubscript:v28];
        if (v29)
        {
          if (v28 == @"PXActivityTypeSetAllLibrariesFilter"
            || v28 == @"PXActivityTypeSetPersonalLibraryFilter"
            || v28 == @"PXActivityTypeSetSharedLibraryFilter")
          {
            v47[2](v47, v24);
          }
          else
          {
            [v24 addObject:v29];
          }
        }
      }
      uint64_t v25 = [v48 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v25);
  }

  [v24 addObjectsFromArray:v13];
  id v32 = [v44 sender];
  if (v32)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    double v40 = (objc_class *)objc_opt_class();
    id v39 = NSStringFromClass(v40);
    id v41 = objc_msgSend(v32, "px_descriptionForAssertionMessage");
    [v37 handleFailureInMethod:a2, v43, @"PXCuratedLibraryUIViewController.m", 2716, @"%@ should be an instance inheriting from %@, but it is %@", @"actionPerformer.sender", v39, v41 object file lineNumber description];
  }
  else
  {
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    int v38 = (objc_class *)objc_opt_class();
    id v39 = NSStringFromClass(v38);
    [v37 handleFailureInMethod:a2, v43, @"PXCuratedLibraryUIViewController.m", 2716, @"%@ should be an instance inheriting from %@, but it is nil", @"actionPerformer.sender", v39 object file lineNumber description];
  }

LABEL_42:
  id v33 = [(PXCuratedLibraryUIViewController *)v43 filterTipController];
  if ([v33 isPresentingTipView])
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke_2;
    v50[3] = &unk_1E5DD32A8;
    id v51 = v32;
    id v52 = v24;
    [v33 dismissTipViewWithCompletion:v50];

    v34 = v51;
  }
  else
  {
    v34 = [MEMORY[0x1E4FB1970] menuWithChildren:v24];
    [v32 setMenu:v34];
  }

  _Block_object_dispose(v64, 8);
}

void __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) count] && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:*(void *)(a1 + 32)];
    [v4 addObject:v3];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke_2(uint64_t a1)
{
  long long v2 = [MEMORY[0x1E4FB1970] menuWithChildren:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setMenu:v2];

  id v3 = [*(id *)(a1 + 32) contextMenuInteraction];
  objc_msgSend(v3, "_presentMenuAtLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)photosCloseButtonControllerHandleAction:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v4 = [(PXCuratedLibraryUIViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v4 curatedLibraryViewControllerDismiss:self] & 1) == 0)
  {
    PXAssertGetLog();
  }
}

- (id)barsControllerActionsForSelectionContextMenu:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];

  uint64_t v5 = [v4 selectionSnapshot];
  if ([v5 isAnyItemSelected])
  {
    if (v5) {
      [v5 firstSelectedIndexPath];
    }
    PXIndexPathFromSimpleIndexPath();
  }

  return 0;
}

- (id)preferredFocusEnvironments
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 gridView];
  uint64_t v5 = [v4 rootLayout];

  id v6 = [(PXCuratedLibraryUIViewController *)self preferredFocusAssetReference];
  if (v6)
  {
    id v7 = [v5 axLeafForObjectReference:v6];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [v5 axGroup];
  id v9 = (void *)v8;
  if (v7)
  {
    id v16 = v7;
    uint64_t v17 = v8;
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = (uint64_t *)&v16;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v15 = v8;
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v15;
    uint64_t v12 = 1;
  }
  long long v13 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17);

  return v13;
}

- (PXActionManager)assetActionManager
{
  long long v2 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v3 = [v2 viewModel];

  id v4 = [v3 assetActionManager];

  return (PXActionManager *)v4;
}

- (void)toggleFilter:(id)a3
{
  id v4 = PXNumberPropertyFromCommand(a3);
  uint64_t v5 = [v4 integerValue];
  if ((unint64_t)(v5 - 1) > 3) {
    id v6 = &stru_1F00B0030;
  }
  else {
    id v6 = off_1E5DB9350[v5 - 1];
  }
  uint64_t v8 = v6;

  id v7 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  [v7 performActionWithType:v8];
}

- (void)toggleViewMode:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  [v3 performActionWithType:@"PXCuratedLibraryActionAllPhotosToggleAspectFit"];
}

- (void)toggleEditMode:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  [v3 toggleSelectMode];
}

- (void)zoomOut:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  [v3 zoomOutAllPhotos];
}

- (void)zoomIn:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  [v3 zoomInAllPhotos];
}

- (void)navigateToSegment:(id)a3
{
  id v4 = PXNumberPropertyFromCommand(a3);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
    uint64_t v7 = 3;
    if (v6 != 4) {
      uint64_t v7 = v6;
    }
    if ((unint64_t)(v7 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
    {
      if (v7 == 3) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = v7;
      }
      id v9 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
      id v10 = [v9 viewModel];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__PXCuratedLibraryUIViewController_navigateToSegment___block_invoke;
      v11[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
      v11[4] = v8;
      [v10 performChanges:v11];
    }
  }
}

uint64_t __54__PXCuratedLibraryUIViewController_navigateToSegment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

- (void)toggleViewer:(id)a3
{
}

- (void)cancelSelectMode:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v4 = [v3 viewModel];

  if ([v4 isSelecting]) {
    [v4 performChanges:&__block_literal_global_480];
  }
}

uint64_t __53__PXCuratedLibraryUIViewController_cancelSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:0];
}

- (void)deselectAll:(id)a3
{
  id v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v5 = [v3 viewModel];

  id v4 = [v5 selectionManager];
  [v4 performChanges:&__block_literal_global_478];
}

uint64_t __48__PXCuratedLibraryUIViewController_deselectAll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)openSelectionWithCommandDownArrow:(id)a3
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v9 = [v4 viewModel];

  id v5 = [v9 actionManager];
  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v7 = [v6 layout];
  uint64_t v8 = [v5 actionPerformerForNavigatingToNextZoomLevelInLayout:v7];

  if (v8) {
    [v8 performActionWithCompletionHandler:0];
  }
  else {
    [(PXCuratedLibraryUIViewController *)self _presentOneUpForSingleSelectedAssetWithActivity:0];
  }
}

- (void)openParentWithCommandUpArrow:(id)a3
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v5 = [v4 viewModel];

  uint64_t v6 = [v5 zoomLevel];
  uint64_t v7 = 2;
  if (v6 > 2) {
    uint64_t v7 = v6;
  }
  uint64_t v8 = v7 - 1;
  id v9 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v10 = [v9 viewModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PXCuratedLibraryUIViewController_openParentWithCommandUpArrow___block_invoke;
  v11[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  v11[4] = v8;
  [v10 performChanges:v11];
}

uint64_t __65__PXCuratedLibraryUIViewController_openParentWithCommandUpArrow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

- (void)validateCommand:(id)a3
{
  id v17 = a3;
  if ((char *)[v17 action] == sel_navigateToSegment_)
  {
    PXNumberPropertyFromCommand(v17);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [(__CFString *)v7 integerValue];
      uint64_t v10 = 3;
      if (v9 != 4) {
        uint64_t v10 = v9;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    if ((unint64_t)(v10 - 5) >= 0xFFFFFFFFFFFFFFFCLL) {
      uint64_t v15 = v10;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v14 = PXCuratedLibraryZoomLevelDiscoverabilityTitle(v15);
  }
  else
  {
    if ((char *)[v17 action] == sel_toggleEditMode_)
    {
      uint64_t v8 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
      id v11 = [(__CFString *)v8 viewModel];
      if ([v11 isSelecting]) {
        uint64_t v12 = @"PXCuratedLibraryCancelSelectionButtonTitle";
      }
      else {
        uint64_t v12 = @"PXCuratedLibrarySelectButtonTitle";
      }
      uint64_t v13 = PXLocalizedStringFromTable(v12, @"PhotosUICore");
LABEL_24:
      id v16 = (void *)v13;
      [v17 setDiscoverabilityTitle:v13];

      goto LABEL_25;
    }
    if ((char *)[v17 action] != sel_toggleViewMode_)
    {
      if ((char *)[v17 action] != sel_toggleFilter_) {
        goto LABEL_26;
      }
      id v4 = PXNumberPropertyFromCommand(v17);
      uint64_t v5 = [v4 integerValue];
      if ((unint64_t)(v5 - 1) > 3) {
        uint64_t v6 = &stru_1F00B0030;
      }
      else {
        uint64_t v6 = off_1E5DB9350[v5 - 1];
      }
      uint64_t v8 = v6;

      id v11 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
      uint64_t v13 = [v11 discoverabilityTitleForActionType:v8];
      goto LABEL_24;
    }
    uint64_t v8 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
    uint64_t v14 = [(__CFString *)v8 discoverabilityTitleForActionType:@"PXCuratedLibraryActionAllPhotosToggleAspectFit"];
  }
  id v11 = (void *)v14;
  [v17 setDiscoverabilityTitle:v14];
LABEL_25:

LABEL_26:
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager targetForKeyCommands];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager targetForKeyCommands];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXCuratedLibraryUIViewController;
    uint64_t v9 = [(PXCuratedLibraryUIViewController *)&v12 targetForAction:a3 withSender:v6];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PXCuratedLibraryUIViewController;
  if ([(PXCuratedLibraryUIViewController *)&v23 canPerformAction:a3 withSender:v6])
  {
    uint64_t v7 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
    char v8 = [v7 viewModel];

    uint64_t v9 = [v8 allowedActions];
    uint64_t v10 = v9;
    if (sel_openParentWithCommandUpArrow_ == a3)
    {
      uint64_t v15 = @"PXCuratedLibraryActionNavigateToPreviousZoomLevel";
      goto LABEL_36;
    }
    if (sel_openSelectionWithCommandDownArrow_ != a3)
    {
      if (sel_navigateToSegment_ == a3)
      {
        if ([v9 containsObject:@"PXCuratedLibraryActionNavigateToYearsMonthsOrDays"])int v16 = objc_msgSend(v8, "isSelecting") ^ 1; {
        else
        }
          int v16 = 0;
        id v17 = PXNumberPropertyFromCommand(v6);
        char v18 = [v17 isEqualToNumber:&unk_1F02D70C0];

        if (!v16) {
          goto LABEL_41;
        }
        double v19 = PXNumberPropertyFromCommand(v6);
        id v11 = v19;
        if (v19)
        {
          if ((unint64_t)([v19 integerValue] - 5) > 0xFFFFFFFFFFFFFFFBLL) {
            char v14 = v18 ^ 1;
          }
          else {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        if (sel_zoomIn_ == a3)
        {
          uint64_t v15 = @"PXCuratedLibraryActionAllPhotosZoomIn";
          goto LABEL_36;
        }
        if (sel_zoomOut_ == a3)
        {
          uint64_t v15 = @"PXCuratedLibraryActionAllPhotosZoomOut";
          goto LABEL_36;
        }
        if (sel_deselectAll_ != a3)
        {
          if (sel_cancelSelectMode_ != a3)
          {
            if (sel_toggleEditMode_ != a3)
            {
              if (sel_toggleViewMode_ != a3)
              {
                if (sel_toggleViewer_ != a3)
                {
                  if (sel_toggleFilter_ == a3)
                  {
                    id v11 = PXNumberPropertyFromCommand(v6);
                    uint64_t v12 = [v11 integerValue];
                    if ((unint64_t)(v12 - 1) > 3) {
                      uint64_t v13 = &stru_1F00B0030;
                    }
                    else {
                      uint64_t v13 = off_1E5DB9350[v12 - 1];
                    }
                    BOOL v22 = v13;
                    char v14 = [v10 containsObject:v22];

                    goto LABEL_32;
                  }
LABEL_18:
                  char v14 = 1;
LABEL_37:

                  goto LABEL_38;
                }
                if ([v9 containsObject:@"PXCuratedLibraryActionNavigateToOneUp"])
                {
                  int v21 = [v8 singleSelectedAssetReference];
                  char v14 = v21 != 0;

                  goto LABEL_37;
                }
LABEL_41:
                char v14 = 0;
                goto LABEL_37;
              }
              uint64_t v15 = @"PXCuratedLibraryActionAllPhotosToggleAspectFit";
LABEL_36:
              char v14 = [v10 containsObject:v15];
              goto LABEL_37;
            }
            if ([v9 containsObject:@"PXCuratedLibraryActionEnterSelectMode"]) {
              goto LABEL_18;
            }
          }
          uint64_t v15 = @"PXCuratedLibraryActionCancelSelectMode";
          goto LABEL_36;
        }
        id v11 = [v8 selectionSnapshot];
        char v14 = [v11 isAnyItemSelected];
      }
LABEL_32:

      goto LABEL_37;
    }
    if ([v9 containsObject:@"PXCuratedLibraryActionNavigateToNextZoomLevel"]) {
      goto LABEL_18;
    }
    uint64_t v15 = @"PXCuratedLibraryActionNavigateToOneUp";
    goto LABEL_36;
  }
  char v14 = 0;
LABEL_38:

  return v14;
}

- (BOOL)canBecomeFirstResponder
{
  long long v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (void)swipeSelectionManagerDidAutoScroll:(id)a3
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v3 = [v4 layout];
  [v3 clearLastVisibleAreaAnchoringInformation];
}

- (void)swipeSelectionManager:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  id v6 = [(PXCuratedLibraryUIViewController *)self presentedViewController];

  if (!v6)
  {
    id v7 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
    if ([v7 ensureSelectMode])
    {
      [v7 extendSelectionInDirection:a4];
      [(PXCuratedLibraryUIViewController *)self _requestFocusUpdateForCursorAsset];
    }
  }
}

- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(PXSimpleIndexPath *)a4 toIndexPath:(PXSimpleIndexPath *)a5
{
  uint64_t v9 = [a3 selectionManager];
  uint64_t v10 = [v9 dataSourceManager];
  id v11 = [v10 dataSource];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    double v20 = (objc_class *)objc_opt_class();
    double v19 = NSStringFromClass(v20);
    int v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2438, @"%@ should be an instance inheriting from %@, but it is %@", @"swipeSelectionManager.selectionManager.dataSourceManager.dataSource", v19, v21 object file lineNumber description];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    char v18 = (objc_class *)objc_opt_class();
    double v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2438, @"%@ should be an instance inheriting from %@, but it is nil", @"swipeSelectionManager.selectionManager.dataSourceManager.dataSource", v19 object file lineNumber description];
  }

LABEL_3:
  uint64_t v12 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  long long v13 = *(_OWORD *)&a4->item;
  v23[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v23[1] = v13;
  long long v14 = *(_OWORD *)&a5->item;
  v22[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v22[1] = v14;
  uint64_t v15 = [v12 indexPathsFromIndexPath:v23 toIndexPath:v22 inDataSource:v11];

  return v15;
}

- (id)_hitTestResultAtLocation:(CGPoint)a3 withPadding:(UIEdgeInsets)a4 swipeSelectionManager:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double y = a3.y;
  double x = a3.x;
  id v12 = a5;
  long long v13 = [(PXCuratedLibraryUIViewController *)self gridView];
  long long v14 = [v12 scrollView];
  objc_msgSend(v13, "convertPoint:fromCoordinateSpace:", v14, x, y);
  double v16 = v15;
  double v18 = v17;

  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__79651;
  id v27 = __Block_byref_object_dispose__79652;
  id v28 = 0;
  double v19 = objc_msgSend(v13, "hitTestResultsAtPoint:padding:passingTest:", 0, v16, v18, top, left, bottom, right);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  _OWORD v22[2] = __95__PXCuratedLibraryUIViewController__hitTestResultAtLocation_withPadding_swipeSelectionManager___block_invoke;
  void v22[3] = &unk_1E5DC38C8;
  void v22[4] = &v23;
  [v19 enumerateObjectsUsingBlock:v22];

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

void __95__PXCuratedLibraryUIViewController__hitTestResultAtLocation_withPadding_swipeSelectionManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 control] == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (PXSimpleIndexPath)_indexPathForAssetAtLocation:(SEL)a3 withPadding:(CGPoint)a4 forSwipeSelectionManager:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double y = a4.y;
  double x = a4.x;
  id v28 = a6;
  double v15 = -[PXCuratedLibraryUIViewController _hitTestResultAtLocation:withPadding:swipeSelectionManager:](self, "_hitTestResultAtLocation:withPadding:swipeSelectionManager:", x, y, top, left, bottom, right);
  double v16 = [v15 assetReference];

  if (!v16) {
    goto LABEL_6;
  }
  double v17 = [v28 selectionManager];
  double v18 = [v17 dataSourceManager];
  double v19 = [v18 dataSource];

  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v26);
    id v27 = objc_msgSend(v19, "px_descriptionForAssertionMessage");
    [v23 handleFailureInMethod:a3, self, @"PXCuratedLibraryUIViewController.m", 2415, @"%@ should be an instance inheriting from %@, but it is %@", @"swipeSelectionManager.selectionManager.dataSourceManager.dataSource", v25, v27 object file lineNumber description];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    int v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    [v23 handleFailureInMethod:a3, self, @"PXCuratedLibraryUIViewController.m", 2415, @"%@ should be an instance inheriting from %@, but it is nil", @"swipeSelectionManager.selectionManager.dataSourceManager.dataSource", v25 object file lineNumber description];
  }

LABEL_4:
  id v20 = [v19 assetReferenceForAssetReference:v16];

  if (v20)
  {
    [v20 indexPath];

    goto LABEL_7;
  }
LABEL_6:
  long long v21 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v21;
LABEL_7:

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  a4;
  id v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  char v8 = [v7 layout];
  [v8 padding];

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  swipeSelectionManager = self->_swipeSelectionManager;
  a4;
  id v7 = [(PXSwipeSelectionManager *)swipeSelectionManager scrollView];
  [v7 frame];

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXCuratedLibraryUIViewController _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", a4, a5.x, a5.y, *(double *)off_1E5DAAF08, *((double *)off_1E5DAAF08 + 1), *((double *)off_1E5DAAF08 + 2), *((double *)off_1E5DAAF08 + 3));
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v7 = [v4 viewModel];

  if (([v7 isSelecting] & 1) == 0)
  {
    uint64_t v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v6 = [v5 viewModel];
    [v6 performChanges:&__block_literal_global_442];
  }
}

uint64_t __98__PXCuratedLibraryUIViewController_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:1];
}

- (BOOL)swipeSelectionManager:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  uint64_t v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v6 = [v5 viewModel];
  id v7 = [v6 allowedActions];
  char v8 = [v7 containsObject:@"PXCuratedLibraryActionEnterSelectMode"];

  uint64_t v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v10 = [v9 viewModel];
  uint64_t v11 = [v10 zoomLevel];

  if (v11 == 4) {
    return 0;
  }
  else {
    return v8;
  }
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  BOOL v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];

  if ([v4 isSelecting])
  {
    uint64_t v5 = [v4 zoomablePhotosViewModel];
    char v6 = [v5 isDisplayingIndividualItems];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_presentOneUpForSingleSelectedAssetWithActivity:(unint64_t)a3
{
  uint64_t v5 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  char v6 = [v5 viewModel];

  if (([v6 isSelecting] & 1) == 0)
  {
    id v7 = [v6 singleSelectedAssetReference];
    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __84__PXCuratedLibraryUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke;
      v8[3] = &__block_descriptor_40_e44_v16__0___PXOneUpPresentationConfiguration__8l;
      v8[4] = a3;
      [(PXCuratedLibraryUIViewController *)self _presentOneUpForAssetReference:v7 configurationHandler:v8];
    }
  }
}

uint64_t __84__PXCuratedLibraryUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActivity:*(void *)(a1 + 32)];
}

- (BOOL)_presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(UIViewController *)self px_oneUpPresentation];
  if (![v8 canStart]) {
    goto LABEL_4;
  }
  uint64_t v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v10 = [v9 viewModel];
  uint64_t v11 = [v10 allowedActions];
  int v12 = [v11 containsObject:@"PXCuratedLibraryActionNavigateToOneUp"];

  if (v12)
  {
    [(PXCuratedLibraryUIViewController *)self setNavigatedAssetReference:v6];
    uint64_t v13 = [v8 startWithConfigurationHandler:v7];
    long long v14 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    double v15 = [v14 videoPlaybackController];
    [v15 setIsOneUpVisible:v13];

    BOOL v16 = 1;
  }
  else
  {
LABEL_4:
    BOOL v16 = 0;
  }

  return v16;
}

- (void)resetToInitialStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(PXCuratedLibraryUIViewController *)self canResetToInitialState])
  {
    uint64_t v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v6 = [v5 viewModel];

    [v6 performChanges:&__block_literal_global_428];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__PXCuratedLibraryUIViewController_resetToInitialStateWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5DCDD58;
    id v8 = v4;
    [(PXCuratedLibraryUIViewController *)self _scrollLibraryViewToInitialPositionWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __77__PXCuratedLibraryUIViewController_resetToInitialStateWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to reset to initial state, error:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__PXCuratedLibraryUIViewController_resetToInitialStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetToInitialState];
}

- (BOOL)isResetToInitialState
{
  if (![(PXCuratedLibraryUIViewController *)self isViewLoaded]) {
    return 1;
  }
  BOOL v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];

  if ([(PXCuratedLibraryUIViewController *)self canResetToInitialState]) {
    char v5 = [v4 isResetToInitialState];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canResetToInitialState
{
  BOOL v3 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v4 = [v3 viewModel];

  if (![(PXCuratedLibraryUIViewController *)self isViewLoaded]) {
    goto LABEL_7;
  }
  if ([v4 isSelecting])
  {
    char v5 = [v4 selectionSnapshot];
    char v6 = [v5 isAnyItemSelected];

    if (v6) {
      goto LABEL_7;
    }
  }
  if (([v4 isNavigating] & 1) != 0
    || -[UIViewController px_containsViewControllerModalInPresentation](self, "px_containsViewControllerModalInPresentation")|| (-[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation"), int v7 = objc_claimAutoreleasedReturnValue(), v8 = [v7 state], v7, v8))
  {
LABEL_7:
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v11 = [(PXCuratedLibraryUIViewController *)self presentedViewController];
    BOOL v9 = v11 == 0;
  }
  return v9;
}

- (BOOL)scrollViewControllerShouldScrollToTop:(id)a3
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  char v5 = [v4 viewModel];
  uint64_t v6 = [v5 zoomLevel];

  if (v6 == 4)
  {
    int v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    uint64_t v8 = [v7 assetsDataSourceManager];
    [v8 forceAllPhotosAccurateIfNeeded];
  }
  BOOL v9 = +[PXCuratedLibrarySettings sharedInstance];
  int v10 = [v9 enableCustomScrollToTopOrBottom];

  if (v10) {
    return ![(PXCuratedLibraryUIViewController *)self _scrollToNextSectionInDirection:-1 animated:1];
  }
  else {
    return 1;
  }
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y = a4.y;
  id v9 = a3;
  int v10 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v11 = [v10 layout];
  int v12 = [v10 gridView];
  uint64_t v13 = [v12 rootLayout];
  objc_msgSend(v13, "convertRect:toDescendantLayout:", v11, a5->x, a5->y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v15 = v14;

  uint64_t v18 = [v9 decelerationRate];
  [v11 adjustedTargetVisibleTopForProposedTargetVisibleTop:&v18 scrollingVelocity:v15 decelerationRate:y];
  a5->double y = a5->y + v16 - v15;
  [v9 setDecelerationRate:v18];

  double v17 = +[PXGridTipsHelper filterAllPhotosTipID];
  +[PXGridTipsHelper setTip:v17 isPresentable:[(PXCuratedLibraryUIViewController *)self isCollapsed] ^ 1];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  [(PXCuratedLibraryUIViewController *)self setCanShowFooter:1];
  id v4 = [(PXCuratedLibraryUIViewController *)self skimmingController];
  [v4 contentViewWillScroll];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PXCuratedLibraryUIViewController *)self tapGesture];
  if (v9 == v7)
  {
    id v11 = [(PXCuratedLibraryUIViewController *)self skimmingTouchGesture];
    BOOL v10 = v11 == v8;
  }
  else
  {
    BOOL v10 = 0;
  }

  id v12 = [(PXCuratedLibraryUIViewController *)self screenEdgePanGestureRecognizer];
  if (v12 == v7)
  {
    id v4 = [(PXCuratedLibraryUIViewController *)self _scrollView];
    id v13 = [v4 panGestureRecognizer];

    if (v13 == v8) {
      BOOL v10 = 1;
    }
  }

  id v14 = [(PXCuratedLibraryUIViewController *)self hoverGesture];
  if (v14 == v7)
  {
    id v4 = [(PXCuratedLibraryUIViewController *)self _scrollView];
    id v16 = [v4 panGestureRecognizer];
    BOOL v15 = v16 == v8;
  }
  else
  {
    BOOL v15 = 0;
  }

  id v17 = [(PXCuratedLibraryUIViewController *)self pinchGesture];
  if (v17 == v7)
  {
    int v21 = 0;
  }
  else
  {
    uint64_t v18 = [(PXCuratedLibraryUIViewController *)self panGesture];
    if ((id)v18 == v7)
    {
      int v21 = 0;
      id v4 = v7;
    }
    else
    {
      id v4 = (void *)v18;
      id v19 = [(PXCuratedLibraryUIViewController *)self screenEdgePanGestureRecognizer];
      if (v19 != v7)
      {

        char v20 = 0;
LABEL_20:

        goto LABEL_21;
      }
      int v21 = 1;
    }
  }
  BOOL v22 = [(PXCuratedLibraryUIViewController *)self swipeSelectionManager];
  uint64_t v23 = [v22 gesturesForFailureRequirements];
  char v20 = [v23 containsObject:v8];

  if (v21) {
  if (v17 != v7)
  }
    goto LABEL_20;
LABEL_21:

  return v20 | (v15 || v10);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXCuratedLibraryUIViewController *)self panGesture];
  if (v8 != v6)
  {
    id v9 = 0;
LABEL_6:

    goto LABEL_7;
  }
  id v15 = 0;
  int v10 = objc_msgSend(v7, "px_isPanGestureRecognizerOfScrollView:", &v15);
  id v11 = v15;
  id v9 = v11;
  if (!v10) {
    goto LABEL_6;
  }
  char v12 = objc_msgSend(v11, "px_scrollableAxis");

  if ((v12 & 1) == 0)
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXCuratedLibraryUIViewController *)self skimmingTouchGesture];

  if (v8 == v6)
  {
    id v10 = [(PXCuratedLibraryUIViewController *)self tapGesture];
    BOOL v9 = v10 != v7;
  }
  else
  {
    BOOL v9 = 0;
  }
  id v11 = [(PXCuratedLibraryUIViewController *)self pinchGesture];
  if (v11 == v6)
  {
    char v12 = [(PXCuratedLibraryUIViewController *)self _scrollView];
    id v13 = [v12 panGestureRecognizer];

    if (v13 == v7) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  char v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v6 = [v5 viewModel];

  id v7 = [v6 allowedActions];
  id v8 = [(PXCuratedLibraryUIViewController *)self panGesture];
  if (v8 != v4)
  {
    id v9 = [(PXCuratedLibraryUIViewController *)self screenEdgePanGestureRecognizer];

    if (v9 == v4)
    {
      id v19 = [(PXCuratedLibraryUIViewController *)self _scrollView];
      if (([v19 isDecelerating] & 1) != 0
        || ([v19 isDragging] & 1) != 0
        || ![v7 containsObject:@"PXCuratedLibraryActionNavigateToPreviousZoomLevel"])
      {
        BOOL v13 = 0;
        goto LABEL_19;
      }
      char v20 = [(PXCuratedLibraryUIViewController *)self zoomLevelControl];
      int v21 = [(PXCuratedLibraryUIViewController *)self viewProvider];
      BOOL v22 = [v21 viewModel];
      BOOL v13 = objc_msgSend(v20, "zoomLevelDisplayedBeforeZoomLevel:", objc_msgSend(v22, "zoomLevel")) != 0;
    }
    else
    {
      id v10 = [(PXCuratedLibraryUIViewController *)self tapGesture];

      if (v10 == v4)
      {
        id v19 = [(PXCuratedLibraryUIViewController *)self gridView];
        [v4 locationInView:v19];
        uint64_t v23 = -[PXCuratedLibraryUIViewController _buttonHitTestResultAtPoint:inCoordinateSpace:](self, "_buttonHitTestResultAtPoint:inCoordinateSpace:", v19);
        BOOL v13 = v23 == 0;

        goto LABEL_19;
      }
      id v11 = [(PXCuratedLibraryUIViewController *)self pressGesture];

      if (v11 != v4)
      {
        id v12 = [(PXCuratedLibraryUIViewController *)self pinchGesture];

        if (v12 != v4)
        {
          BOOL v13 = 1;
          goto LABEL_20;
        }
        id v19 = [(PXCuratedLibraryUIViewController *)self swipeSelectionManager];
        BOOL v13 = [v19 state] == 0;
LABEL_19:

        goto LABEL_20;
      }
      int v24 = (void *)MEMORY[0x1E4FB1790];
      id v19 = [(PXCuratedLibraryUIViewController *)self view];
      char v20 = [v24 focusSystemForEnvironment:v19];
      uint64_t v25 = [v20 focusedItem];
      BOOL v13 = v25 != 0;
    }
    goto LABEL_19;
  }
  if ([v7 containsObject:@"PXCuratedLibraryActionSkim"])
  {
    id v14 = [(PXCuratedLibraryUIViewController *)self view];
    [v4 velocityInView:v14];
    double v16 = v15;
    double v18 = v17;

    MEMORY[0x1AD10AEE0](fabs(v18), fabs(v16));
    +[PXKitSettings sharedInstance];
    [(id)objc_claimAutoreleasedReturnValue() horizontalGesturesAngularToleranceInDegrees];
    PXDegreesToRadians();
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

- (id)_buttonHitTestResultAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__79651;
  double v16 = __Block_byref_object_dispose__79652;
  id v17 = 0;
  id v8 = [(PXCuratedLibraryUIViewController *)self gridView];
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__PXCuratedLibraryUIViewController__buttonHitTestResultAtPoint_inCoordinateSpace___block_invoke;
  v11[3] = &unk_1E5DB71A8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v11);
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __82__PXCuratedLibraryUIViewController__buttonHitTestResultAtPoint_inCoordinateSpace___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((unint64_t)([v6 control] - 7) <= 0xA)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_hitTestAssetReferenceAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(PXCuratedLibraryUIViewController *)self gridView];
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = objc_msgSend(v8, "firstCuratedLibraryHitTestResultsAtPoint:withControl:", 1, v10, v12);
  uint64_t v14 = [v13 assetReference];

  return v14;
}

- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3
{
  id v10 = a3;
  id v5 = [(PXCuratedLibraryUIViewController *)self skimmingTouchGesture];

  if (v5 != v10)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2068, @"Invalid parameter not satisfying: %@", @"touchingRecognizer == self.skimmingTouchGesture" object file lineNumber description];
  }
  id v6 = [(PXCuratedLibraryUIViewController *)self skimmingController];
  int v7 = objc_msgSend(v6, "endTouchingGestureEnded:", objc_msgSend(v10, "state") != 4);

  if (v7)
  {
    id v8 = [(PXCuratedLibraryUIViewController *)self tapGesture];
    objc_msgSend(v8, "px_cancel");
  }
}

- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3
{
  id v5 = a3;
  id v6 = [(PXCuratedLibraryUIViewController *)self skimmingTouchGesture];

  if (v6 != v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 2052, @"Invalid parameter not satisfying: %@", @"touchingRecognizer == self.skimmingTouchGesture" object file lineNumber description];
  }
  int v7 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(PXCuratedLibraryUIViewController *)self skimmingController];
  if ([v12 canStartSkimming])
  {
    BOOL v13 = -[PXCuratedLibraryUIViewController _buttonHitTestResultAtPoint:inCoordinateSpace:](self, "_buttonHitTestResultAtPoint:inCoordinateSpace:", v7, v9, v11);

    if (!v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      _OWORD v15[2] = __80__PXCuratedLibraryUIViewController_touchingUIGestureRecognizerDidBeginTouching___block_invoke;
      v15[3] = &unk_1E5DB71F8;
      void v15[4] = self;
      objc_msgSend(v7, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1F02D3E98, v15, v9, v11);
    }
  }
  else
  {
  }
}

void __80__PXCuratedLibraryUIViewController_touchingUIGestureRecognizerDidBeginTouching___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = [a2 assetCollectionReference];
  if (v6)
  {
    id v5 = [*(id *)(a1 + 32) skimmingController];
    [v5 startTouchingForAssetCollectionReference:v6];

    *a3 = 1;
  }
}

- (BOOL)_handleGestureForFilterTipController
{
  long long v2 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  int v3 = [v2 isPresentingTipView];
  if (v3) {
    [v2 dismissTipViewWithCompletion:0];
  }

  return v3;
}

- (void)_handleScreenEdgePan:(id)a3
{
  id v4 = a3;
  if (![(PXCuratedLibraryUIViewController *)self _handleGestureForFilterTipController])
  {
    id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v6 = [v5 viewModel];
    int v7 = [v5 layout];
    double v8 = [(PXCuratedLibraryUIViewController *)self gridView];
    double v9 = [(PXCuratedLibraryUIViewController *)self backNavigationTransition];
    uint64_t v10 = [v4 state];
    if ((unint64_t)(v10 - 3) < 3)
    {
      if (v9)
      {
        double v11 = [(PXCuratedLibraryUIViewController *)self backNavigationGestureDirectionFilter];
        [v11 output];
        double v13 = v12;

        if (v13 < 0.0)
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_7;
          v38[3] = &unk_1E5DCF3F0;
          void v38[4] = self;
          [v6 performChanges:v38];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_8;
          v36[3] = &unk_1E5DD36F8;
          id v37 = v6;
          [v9 animateToInitialStateWithCompletionBlock:v36];
          [(PXCuratedLibraryUIViewController *)self setBackNavigationTransition:0];
          uint64_t v14 = v37;
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        [v6 performChanges:&__block_literal_global_415];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_5;
        v39[3] = &unk_1E5DD36F8;
        id v40 = v6;
        [v9 animateToFinalStateWithCompletionBlock:v39];
        [(PXCuratedLibraryUIViewController *)self setBackNavigationTransition:0];
        uint64_t v14 = v40;
        goto LABEL_17;
      }
LABEL_18:

      goto LABEL_19;
    }
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        uint64_t v15 = [v6 zoomLevel];
        [(PXCuratedLibraryUIViewController *)self setZoomLevelBeforeBackNavigationTransition:v15];
        double v16 = [(PXCuratedLibraryUIViewController *)self zoomLevelControl];
        uint64_t v17 = [v16 zoomLevelDisplayedBeforeZoomLevel:v15];

        uint64_t v18 = objc_msgSend(v7, "createCuratedLibraryLayoutTransitionIfNeededWithContext:", objc_msgSend(v7, "curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:", v17));

        [(PXCuratedLibraryUIViewController *)self setBackNavigationTransition:v18];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke;
        v44[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
        v44[4] = v17;
        [v6 performChanges:v44];
        id v19 = objc_alloc_init(PXChangeDirectionNumberFilter);
        [(PXChangeDirectionNumberFilter *)v19 setMinimumChange:8.0];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_2;
        v42[3] = &unk_1E5DB7220;
        id v43 = v19;
        char v20 = v19;
        [(PXNumberFilter *)v20 performChanges:v42];
        [(PXCuratedLibraryUIViewController *)self setBackNavigationGestureDirectionFilter:v20];

        double v9 = (void *)v18;
      }
      goto LABEL_18;
    }
    if (!v9) {
      goto LABEL_18;
    }
    int v21 = [(PXCuratedLibraryUIViewController *)self screenEdgePanGestureRecognizer];
    [v21 translationDistanceInView:v8];
    double v23 = v22;

    int v24 = +[PXCuratedLibrarySettings sharedInstance];
    int v25 = [v24 enableInteractiveTransition];

    if (v25)
    {
      if (v23 < 100.0)
      {
        id v27 = [(PXCuratedLibraryUIViewController *)self backNavigationTransition];
        float v26 = v23 / 2000.0;
        *(float *)&double v28 = v26;
        [v27 setFractionCompleted:v28];

LABEL_14:
        id v32 = [(PXCuratedLibraryUIViewController *)self backNavigationGestureDirectionFilter];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_3;
        v41[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
        *(double *)&v41[4] = v23;
        [v32 performChanges:v41];

        goto LABEL_18;
      }
    }
    else
    {
      id v29 = +[PXCuratedLibrarySettings sharedInstance];
      [v29 swipeBackGestureMinTranslation];
      double v31 = v30;

      if (v23 < v31) {
        goto LABEL_14;
      }
    }
    id v33 = [(PXCuratedLibraryUIViewController *)self backNavigationGestureDirectionFilter];
    [v33 output];
    double v35 = v34;

    if (v35 >= 0.0) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_19:
}

void __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setZoomLevel:v2];
  [v3 setZoomLevelTransitionPhase:1];
}

void __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 minimumChange];
  [v4 setInput:v3 + 1.0];
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_417];
}

void __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setZoomLevel:", objc_msgSend(v2, "zoomLevelBeforeBackNavigationTransition"));
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_419];
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setZoomLevelTransitionPhase:0];
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setZoomLevelTransitionPhase:0];
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setZoomLevelTransitionPhase:2];
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryUIViewController *)self gridView];
  uint64_t v6 = [v4 state];
  if ((unint64_t)(v6 - 3) < 3)
  {
    int v7 = [(PXCuratedLibraryUIViewController *)self skimmingController];
    [v7 endPanning];
LABEL_9:

    goto LABEL_10;
  }
  if (v6 == 2)
  {
    [v4 translationInView:v5];
    double v9 = v8;
    double v11 = v10;
    if ([v5 effectiveUserInterfaceLayoutDirection] == 1) {
      double v9 = -v9;
    }
    int v7 = [(PXCuratedLibraryUIViewController *)self skimmingController];
    objc_msgSend(v7, "updatePanningWithTranslation:", v9, v11);
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    [v4 locationInView:v5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__PXCuratedLibraryUIViewController__handlePan___block_invoke;
    v12[3] = &unk_1E5DB71F8;
    v12[4] = self;
    objc_msgSend(v5, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1F02D3E80, v12);
  }
LABEL_10:
}

void __47__PXCuratedLibraryUIViewController__handlePan___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v5 = [v8 assetCollectionReference];
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) skimmingController];
    int v7 = [v8 assetCollectionReference];
    [v6 startPanningForAssetCollectionReference:v7];

    *a3 = 1;
  }
}

- (void)_handlePinch:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [(PXCuratedLibraryUIViewController *)self _scrollView];
    uint64_t v6 = [v5 panGestureRecognizer];
    objc_msgSend(v6, "px_cancel");
  }
  int v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v8 = [v7 viewModel];

  double v9 = [v8 allowedActions];
  int v10 = [v9 containsObject:@"PXCuratedLibraryActionNavigateToOneUp"];
  if (!v10
    || ([(UIViewController *)self px_oneUpPresentation],
        double v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 handlePresentingPinchGestureRecognizer:v4],
        v11,
        (v12 & 1) == 0))
  {
    BOOL v13 = [v4 state] != 1 && objc_msgSend(v4, "state") != 2;
    uint64_t v14 = [(PXCuratedLibraryUIViewController *)self zoomLevelPinchFilter];
    uint64_t v15 = [(PXCuratedLibraryUIViewController *)self gridView];
    double v16 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    uint64_t v17 = [v16 zoomablePhotosInteraction];
    int v18 = [v17 handlePinch:v4];

    id v19 = (void *)v15;
    char v20 = v14;
    if ((v18 & 1) == 0 && !v13)
    {
      [v4 velocity];
      if (v21 <= 0.0)
      {
        int v18 = 0;
      }
      else
      {
        int v18 = 0;
        if (([v14 isTrackingPinch] & 1) == 0 && ((v10 ^ 1) & 1) == 0)
        {
          [v4 locationInView:v19];
          double v22 = -[PXCuratedLibraryUIViewController _hitTestAssetReferenceAtLocation:inCoordinateSpace:](self, "_hitTestAssetReferenceAtLocation:inCoordinateSpace:", v19);
          int v18 = v22 != 0;
          if (v22) {
            [(PXCuratedLibraryUIViewController *)self _presentOneUpForAssetReference:v22 configurationHandler:&__block_literal_global_394];
          }
        }
      }
    }
    int v23 = [v9 containsObject:@"PXCuratedLibraryActionPinchToSwitchZoomLevel"];
    if (((v18 | v13) & 1) != 0 || !v23)
    {
      [v14 reset];
      id v8 = v26;
    }
    else
    {
      [v4 scale];
      double v25 = v24;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2;
      v29[3] = &unk_1E5DB71D0;
      id v30 = v19;
      id v31 = v4;
      id v8 = v26;
      id v32 = v26;
      id v33 = self;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_3;
      v27[3] = &unk_1E5DCF720;
      id v28 = v32;
      [v20 filterPinchGestureWithScale:v29 initialPinchHandler:v27 subsequentDirectionChangeHandler:v25];
    }
  }
}

BOOL __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 < 1)
  {
    double v9 = [*(id *)(a1 + 56) zoomLevelControl];
    uint64_t v10 = objc_msgSend(v9, "zoomLevelDisplayedBeforeZoomLevel:", objc_msgSend(*(id *)(a1 + 48), "zoomLevel"));

    if (v10)
    {
      double v11 = *(void **)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2_404;
      v13[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
      void v13[4] = v10;
      [v11 performChanges:v13];
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x3032000000;
    int v18 = __Block_byref_object_copy__79651;
    id v19 = __Block_byref_object_dispose__79652;
    id v20 = 0;
    id v3 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) locationInView:v3];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_402;
    v14[3] = &unk_1E5DB71A8;
    void v14[4] = &v15;
    objc_msgSend(v3, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1F02D3E68, v14);
    if (v16[5])
    {
      id v4 = [*(id *)(a1 + 48) actionManager];
      id v5 = [v4 actionPerformerForHitTestResult:v16[5]];

      uint64_t v6 = [v5 actionType];
      int v7 = [v6 isEqualToString:@"PXCuratedLibraryActionNavigateToNextZoomLevel"];

      if (v7)
      {
        [v5 performActionWithCompletionHandler:0];
        int v8 = 1;
      }
      else
      {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    _Block_object_dispose(&v15, 8);

    return v8 != 0;
  }
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "zoomLevelInDirection:fromZoomLevel:", a2, objc_msgSend(*(id *)(a1 + 32), "zoomLevel"));
  if ((unint64_t)(result - 1) <= 2)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_4;
    v5[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    void v5[4] = result;
    return [v4 performChanges:v5];
  }
  return result;
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

void __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_402(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2_404(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInteractiveMode:1];
}

- (BOOL)_scrollToNextSectionInDirection:(int64_t)a3 animated:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  int v7 = [v6 layout];
  if ([v7 presentedZoomLevel] == 3)
  {
    [v7 visibleRect];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [v7 safeAreaInsets];
    v39.size.height = v16;
    v39.origin.double x = v9;
    v39.origin.double y = v11;
    v39.size.width = v13;
    CGRect v40 = CGRectInset(v39, 0.0, -1.0);
    uint64_t v33 = 0;
    double v34 = (CGRect *)&v33;
    uint64_t v35 = 0x4010000000;
    uint64_t v36 = &unk_1AB5D584F;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v37 = *MEMORY[0x1E4F1DB20];
    long long v38 = v17;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __77__PXCuratedLibraryUIViewController__scrollToNextSectionInDirection_animated___block_invoke;
    v31[3] = &unk_1E5DB7180;
    CGRect v32 = v40;
    v31[4] = &v33;
    v31[5] = a3;
    [v7 enumerateSectionBoundariesWithOptions:((unint64_t)a3 >> 62) & 2 usingBlock:v31];
    BOOL IsNull = CGRectIsNull(v34[1]);
    if (!IsNull)
    {
      id v19 = [v6 gridView];
      id v20 = [v19 rootLayout];
      objc_msgSend(v20, "convertRect:fromDescendantLayout:", v7, v34[1].origin.x, v34[1].origin.y, v34[1].size.width, v34[1].size.height);
      p_double x = (void *)&v34->origin.x;
      v34[1].origin.double x = v22;
      p_x[5] = v23;
      p_x[6] = v24;
      p_x[7] = v25;

      double x = v34[1].origin.x;
      double y = v34[1].origin.y;
      id v28 = [v19 scrollViewController];
      objc_msgSend(v28, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 4, v4, x, y, v13, v15);
    }
    BOOL v29 = !IsNull;
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

void __77__PXCuratedLibraryUIViewController__scrollToNextSectionInDirection_animated___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a2);
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15 < 0)
  {
    if (MinY < CGRectGetMinY(*(CGRect *)(a1 + 48)))
    {
LABEL_6:
      CGFloat v16 = *(double **)(*(void *)(a1 + 32) + 8);
      v16[4] = a2;
      v16[5] = a3;
      v16[6] = a4;
      v16[7] = a5;
      *a8 = 1;
      return;
    }
    uint64_t v15 = *(void *)(a1 + 40);
  }
  if (v15 >= 1 && MinY > CGRectGetMaxY(*(CGRect *)(a1 + 48))) {
    goto LABEL_6;
  }
}

- (BOOL)_handleTapOnTitleWithHitTestResult:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v6 = [v5 layout];
  int v7 = [v4 assetCollectionReference];

  BOOL v8 = 0;
  if ([v6 presentedZoomLevel] == 3 && v7)
  {
    CGFloat v9 = +[PXCuratedLibrarySettings sharedInstance];
    int v10 = [v9 enableTapOnTitleToScroll];

    if (v10)
    {
      [v6 sectionBoundariesForAssetCollectionReference:v7];
      double x = v28.origin.x;
      double y = v28.origin.y;
      double width = v28.size.width;
      double height = v28.size.height;
      BOOL IsNull = CGRectIsNull(v28);
      if (!IsNull)
      {
        CGFloat v16 = [v5 gridView];
        long long v17 = [v16 rootLayout];
        objc_msgSend(v17, "convertRect:fromDescendantLayout:", v6, x, y, width, height);
        double v19 = v18;
        double v21 = v20;

        [v16 visibleBounds];
        double v23 = v22;
        double v25 = v24;
        float v26 = [v16 scrollViewController];
        objc_msgSend(v26, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 4, 1, v19, v21, v23, v25);
      }
      BOOL v8 = !IsNull;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_handleTapWithHitTestResult:(id)a3 keyModifierFlags:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    BOOL v8 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    CGFloat v9 = [v8 viewModel];
    if (a4 & 0x100000) != 0 && ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
    {
      int v10 = 1;
    }
    else
    {
      if ((a4 & 0x20000) != 0)
      {
        int v10 = 0;
        char v12 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] ^ 1;
LABEL_10:
        uint64_t v13 = [v7 control];
        if (v13 == 6)
        {
          BOOL v11 = [(PXCuratedLibraryUIViewController *)self _handleTapOnTitleWithHitTestResult:v7];
LABEL_40:

          goto LABEL_41;
        }
        if (v13 != 1)
        {
          long long v17 = [v9 actionManager];
          double v18 = [v17 actionPerformerForHitTestResult:v7];

          BOOL v11 = v18 != 0;
          if (v18) {
            [v18 performActionWithCompletionHandler:0];
          }

          goto LABEL_40;
        }
        double v14 = [(PXCuratedLibraryUIViewController *)self dragController];
        int v15 = [v14 isDragSessionActive];

        if (v15)
        {
          CGFloat v16 = PLCuratedLibraryGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "Ignoring tap since it is handled by the drag interaction.", buf, 2u);
          }
        }
        else
        {
          double v19 = [v9 allowedActions];
          int v20 = [v19 containsObject:@"PXCuratedLibraryActionAllPhotosZoomIn"];

          if (v20
            && ([v8 zoomablePhotosInteraction],
                double v21 = objc_claimAutoreleasedReturnValue(),
                [v7 assetReference],
                double v22 = objc_claimAutoreleasedReturnValue(),
                int v29 = [v21 handleTapOnAssetReference:v22],
                v22,
                v21,
                v29))
          {
            CGFloat v16 = [v8 layout];
            [v16 clearLastVisibleAreaAnchoringInformation];
          }
          else
          {
            if ((v12 & 1) != 0 || ![v8 ensureSelectMode])
            {
              if (([v9 isSelecting] & 1) == 0
                && (!v10 || ![v8 ensureSelectMode]))
              {
                id v27 = [v7 assetReference];
                [(PXCuratedLibraryUIViewController *)self _presentOneUpForAssetReference:v27 configurationHandler:0];
LABEL_39:

                BOOL v11 = 1;
                goto LABEL_40;
              }
              float v26 = PLCuratedLibraryGetLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109888;
                *(_DWORD *)&buf[4] = v10;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = [v9 isSelecting];
                *(_WORD *)&buf[14] = 2048;
                *(void *)&long long v34 = a4;
                WORD4(v34) = 1024;
                *(_DWORD *)((char *)&v34 + 10) = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
                _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEBUG, "[PXCuratedLibraryUIViewController] Handling tap wants toggle selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x1Eu);
              }

              v30[0] = MEMORY[0x1E4F143A8];
              v30[1] = 3221225472;
              v30[2] = __81__PXCuratedLibraryUIViewController__handleTapWithHitTestResult_keyModifierFlags___block_invoke;
              v30[3] = &unk_1E5DCF3F0;
              id v31 = v7;
              [v9 performChanges:v30];

LABEL_38:
              id v27 = [(UIViewController *)self px_splitViewController];
              [v27 requestFocusUpdateWithPreferredFocusEnvironment:self];
              goto LABEL_39;
            }
            double v23 = PLCuratedLibraryGetLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = [v9 isSelecting];
              *(_WORD *)&buf[14] = 2048;
              *(void *)&long long v34 = a4;
              WORD4(v34) = 1024;
              *(_DWORD *)((char *)&v34 + 10) = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
              _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEBUG, "[PXCuratedLibraryUIViewController] Handling tap wants range selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x1Eu);
            }

            *(_OWORD *)buf = 0u;
            long long v34 = 0u;
            double v24 = [v7 assetReference];
            double v25 = v24;
            if (v24)
            {
              [v24 indexPath];
            }
            else
            {
              *(_OWORD *)buf = 0u;
              long long v34 = 0u;
            }

            CGFloat v16 = [v9 selectionManager];
            v32[0] = *(_OWORD *)buf;
            v32[1] = v34;
            [v16 extendSelectionToItemIndexPath:v32 withDelegate:v8];
          }
        }

        goto LABEL_38;
      }
      int v10 = 0;
    }
    char v12 = 1;
    goto LABEL_10;
  }
  BOOL v11 = 0;
LABEL_41:

  return v11;
}

void __81__PXCuratedLibraryUIViewController__handleTapWithHitTestResult_keyModifierFlags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assetReference];
  [v3 toggleSelectionForAssetReference:v4 updateCursorIndexPath:1];
}

- (void)_setWantsOptionalChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  if (a3 || ![(PXCuratedLibraryUIViewController *)self isInUnselectedTab])
  {
    double v7 = *MEMORY[0x1E4FB2E08];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke;
    v8[3] = &unk_1E5DBE3F8;
    BOOL v9 = a3;
    v8[4] = self;
    void v8[5] = a4;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "px_animateUsingDefaultDampedEaseInEaseOutWithDuration:animations:completion:", v8, 0, v7);
  }
}

void __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewProvider];
  id v3 = [v2 viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _OWORD v4[2] = __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke_2;
  v4[3] = &__block_descriptor_41_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  char v5 = *(unsigned char *)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  [v3 performChanges:v4];
}

uint64_t __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setWantsOptionalChromeVisible:*(unsigned __int8 *)(a1 + 40) changeReason:*(void *)(a1 + 32)];
}

- (BOOL)_handleTapToToggleChromeWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  char v5 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v4 locationInView:v5];
  double v7 = v6;

  [v5 safeAreaInsets];
  double v9 = v8;
  double v11 = v10 + 12.5;
  [v5 bounds];
  CGFloat v12 = CGRectGetMaxY(v25) + -12.5 - v9;
  uint64_t v13 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  double v14 = [v13 viewModel];
  int v15 = [v14 specManager];
  CGFloat v16 = [v15 spec];

  uint64_t v17 = [v16 layoutOrientation];
  uint64_t v18 = [v16 sizeClass];
  BOOL v19 = v7 <= v12 && v7 >= v11;
  int v20 = [v14 isSelecting];
  int v22 = v17 != 2 || v18 != 1 || v19;
  char v23 = v22 | v20;
  if (((v22 | v20) & 1) == 0) {
    -[PXCuratedLibraryUIViewController _setWantsOptionalChromeVisible:changeReason:](self, "_setWantsOptionalChromeVisible:changeReason:", [v14 wantsOptionalChromeVisible] ^ 1, 1);
  }

  return v23 ^ 1;
}

- (void)_handlePress:(id)a3
{
  if (![(PXCuratedLibraryUIViewController *)self _handleGestureForFilterTipController])
  {
    [(PXCuratedLibraryUIViewController *)self _presentOneUpForSingleSelectedAssetWithActivity:1];
  }
}

- (void)_handleTapWithHitTestResults:(id)a3 tapGesture:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      if (-[PXCuratedLibraryUIViewController _handleTapWithHitTestResult:keyModifierFlags:](self, "_handleTapWithHitTestResult:keyModifierFlags:", *(void *)(*((void *)&v13 + 1) + 8 * v12), objc_msgSend(v7, "modifierFlags", (void)v13)))
      {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    char v5 = [(PXCuratedLibraryUIViewController *)self skimmingController];
    uint64_t v6 = [v5 state];

    if (v6 != 2
      && ![(PXCuratedLibraryUIViewController *)self _handleTapToToggleChromeWithGestureRecognizer:v4])
    {
      id v7 = [(PXCuratedLibraryUIViewController *)self gridView];
      [v4 locationInView:v7];
      id v8 = objc_msgSend(v7, "hitTestResultsAtPoint:");
      uint64_t v9 = [(PXCuratedLibraryUIViewController *)self filterTipController];
      if ([v9 isPresentingTipView])
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __47__PXCuratedLibraryUIViewController__handleTap___block_invoke;
        v10[3] = &unk_1E5DD0F30;
        void v10[4] = self;
        id v11 = v8;
        id v12 = v4;
        [v9 dismissTipViewWithCompletion:v10];
      }
      else
      {
        [(PXCuratedLibraryUIViewController *)self _handleTapWithHitTestResults:v8 tapGesture:v4];
      }
    }
  }
}

uint64_t __47__PXCuratedLibraryUIViewController__handleTap___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTapWithHitTestResults:*(void *)(a1 + 40) tapGesture:*(void *)(a1 + 48)];
}

- (BOOL)_handleHoverWithHitTestResult:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ((unint64_t)([v5 control] - 1) > 2)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      uint64_t v6 = [v5 assetReference];
      if (v6
        || ([v5 assetCollectionReference], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v7 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
        id v8 = [v7 viewModel];

        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v9 = [v8 currentDataSource];
        uint64_t v10 = v9;
        if (v9)
        {
          [v9 indexPathForObjectReference:v6];
        }
        else
        {
          long long v16 = 0u;
          long long v17 = 0u;
        }

        id v11 = [v8 selectionManager];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __66__PXCuratedLibraryUIViewController__handleHoverWithHitTestResult___block_invoke;
        v13[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
        long long v14 = v16;
        long long v15 = v17;
        [v11 performChanges:v13];

        LOBYTE(v6) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

uint64_t __66__PXCuratedLibraryUIViewController__handleHoverWithHitTestResult___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setPendingIndexPath:v4];
}

- (void)_handleHoverWithHitTestResults:(id)a3 hoverGesture:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 state] != 1 && objc_msgSend(v7, "state") != 2) {
    goto LABEL_12;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v9)
  {
LABEL_11:

LABEL_12:
    long long v13 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
    id v8 = [v13 viewModel];

    long long v14 = [v8 selectionManager];
    [v14 performChanges:&__block_literal_global_386_79768];

    goto LABEL_13;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v16;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v16 != v11) {
      objc_enumerationMutation(v8);
    }
    if (-[PXCuratedLibraryUIViewController _handleHoverWithHitTestResult:](self, "_handleHoverWithHitTestResult:", *(void *)(*((void *)&v15 + 1) + 8 * v12), (void)v15))
    {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
LABEL_13:
}

uint64_t __80__PXCuratedLibraryUIViewController__handleHoverWithHitTestResults_hoverGesture___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *((_OWORD *)off_1E5DAB028 + 1);
  v4[0] = *(_OWORD *)off_1E5DAB028;
  v4[1] = v2;
  return [a2 setPendingIndexPath:v4];
}

- (void)_handleHover:(id)a3
{
  id v4 = a3;
  id v6 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v4 locationInView:v6];
  id v5 = objc_msgSend(v6, "hitTestResultsAtPoint:");
  [(PXCuratedLibraryUIViewController *)self _handleHoverWithHitTestResults:v5 hoverGesture:v4];
}

- (void)_scrollToBottomAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[PXCuratedLibrarySettings sharedInstance];
  int v6 = [v5 enableCustomScrollToTopOrBottom];

  if (!v6
    || ![(PXCuratedLibraryUIViewController *)self _scrollToNextSectionInDirection:1 animated:v3])
  {
    id v7 = [(PXCuratedLibraryUIViewController *)self _scrollView];
    objc_msgSend(v7, "px_scrollToEdge:animated:", 3, v3);
  }
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  return 1;
}

- (id)pu_debugCurrentlySelectedAssets
{
  long long v2 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  BOOL v3 = [v2 viewModel];
  id v4 = [v3 selectionManager];
  id v5 = [v4 selectionSnapshot];
  int v6 = [v5 allItemsEnumerator];

  return v6;
}

- (id)_buttonForEllipsisButtonAction
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v5 = [v4 layout];
  int v6 = [v5 floatingHeaderLayout];
  id v7 = [v6 ellipsisButtonActionPerformer];
  id v8 = [v6 spriteReferenceForObjectReference:v7];
  uint64_t v9 = [(PXCuratedLibraryUIViewController *)self gridView];
  uint64_t v10 = [v9 viewForSpriteReference:v8];

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v12);
      long long v13 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
      [v15 handleFailureInMethod:a2, self, @"PXCuratedLibraryUIViewController.m", 1473, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self.gridView viewForSpriteReference:spriteReference]", v14, v13 object file lineNumber description];
    }
  }

  return v10;
}

- (CGRect)_rectForEllipsisActionPerformerButton
{
  BOOL v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 layout];
  id v5 = [v4 floatingHeaderLayout];
  int v6 = [v5 ellipsisButtonActionPerformer];
  id v7 = [(PXCuratedLibraryUIViewController *)self gridView];
  id v8 = [v6 buttonSpriteReference];
  uint64_t v9 = [v7 regionOfInterestForSpriteReference:v8];

  uint64_t v10 = [(PXCuratedLibraryUIViewController *)self gridView];
  [v9 rectInCoordinateSpace:v10];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_saveCurrentAllPhotosScrollPosition
{
  BOOL v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];
  uint64_t v5 = [v4 zoomLevel];

  if (v5 == 4)
  {
    int v6 = [(PXCuratedLibraryUIViewController *)self viewProvider];
    id v7 = [v6 layout];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__PXCuratedLibraryUIViewController__saveCurrentAllPhotosScrollPosition__block_invoke;
    v9[3] = &unk_1E5DBA378;
    id v10 = v7;
    double v11 = self;
    id v8 = v7;
    [v8 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v9];
  }
}

void __71__PXCuratedLibraryUIViewController__saveCurrentAllPhotosScrollPosition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  double v13 = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v13;
  if (isKindOfClass)
  {
    id v8 = [v13 asset];
    uint64_t v9 = [v8 uuid];

    if (v9)
    {
      id v10 = +[PXCuratedLibrarySettings sharedInstance];
      [v10 setSavedAllPhotosScrollPositionAnchorAssetIdentifier:v9];
      [v10 save];
      double v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Scroll Position Saved" message:@"The current (approximate) scroll position will be restored on launch." preferredStyle:1];
      double v12 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
      [v11 addAction:v12];

      [*(id *)(a1 + 40) presentViewController:v11 animated:1 completion:0];
    }

    id v7 = v13;
  }
  *a4 = 1;
}

- (id)_regionOfInterestForAssetReference:(id)a3 image:(id *)a4
{
  uint64_t v15 = 0;
  id v6 = a3;
  id v7 = [(PXCuratedLibraryUIViewController *)self gridView];
  id v8 = [(PXCuratedLibraryUIViewController *)self gridView];
  uint64_t v9 = [v8 rootLayout];
  if (a4) {
    id v10 = &v15;
  }
  else {
    id v10 = 0;
  }
  double v11 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  double v12 = [v11 mediaProvider];
  double v13 = PXRegionOfInterestForAssetReference(v7, v9, v6, v10, v12);

  if (a4 && v15)
  {
    objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (id)_scrollView
{
  long long v2 = [(PXCuratedLibraryUIViewController *)self gridView];
  BOOL v3 = [v2 scrollViewController];
  id v4 = [v3 scrollView];

  return v4;
}

- (BOOL)_requestExpansionAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [(PXCuratedLibraryUIViewController *)self delegate];
  LOBYTE(v3) = [v5 curatedLibraryViewControllerExpand:self animated:v3];

  return v3;
}

- (void)_requestExpansionIfNeededForInteractionWithAssetReference:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v8 = [v7 viewModel];
  char v9 = [v8 isExpanded];

  if ((v9 & 1) == 0)
  {
    id v10 = [(PXCuratedLibraryUIViewController *)self _regionOfInterestForAssetReference:v6 image:0];
    double v11 = [(PXCuratedLibraryUIViewController *)self view];
    double v12 = [v11 superview];
    uint64_t v13 = [v12 superview];
    double v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = v11;
    }
    id v16 = v15;

    uint64_t v17 = objc_msgSend(v11, "px_rootScrollView");
    double v18 = (void *)v17;
    if (v17) {
      double v19 = (void *)v17;
    }
    else {
      double v19 = v11;
    }
    id v20 = v19;

    [v10 rectInCoordinateSpace:v20];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [v20 bounds];
    double v47 = v30;
    double v48 = v29;
    double v49 = v31;
    double v50 = v32;
    [v16 safeAreaInsets];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    v54.origin.double x = v22;
    v54.origin.double y = v24;
    v54.size.double width = v26;
    v54.size.double height = v28;
    if (CGRectIsNull(v54)) {
      goto LABEL_10;
    }
    v55.origin.double x = v22;
    v55.origin.double y = v24;
    v55.size.double width = v26;
    v55.size.double height = v28;
    double MidY = CGRectGetMidY(v55);
    v56.origin.double y = v47 + v34;
    v56.origin.double x = v48 + v36;
    v56.size.double width = v49 - (v36 + v40);
    v56.size.double height = v50 - (v34 + v38);
    if (MidY <= CGRectGetMinY(v56))
    {
LABEL_10:
      id v42 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [v6 asset];
        id v44 = [v43 uuid];
        *(_DWORD *)buf = 138543362;
        id v52 = v44;
        _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_DEFAULT, "Expanding due to interaction with %{public}@ which is outside of safeArea", buf, 0xCu);
      }
      if (![(PXCuratedLibraryUIViewController *)self _requestExpansionAnimated:v4]) {
        PXAssertGetLog();
      }
      if (!v4)
      {
        uint64_t v45 = [(PXCuratedLibraryUIViewController *)self updateDelegate];
        [v45 curatedLibraryViewRequestImmediateUpdate:self];

        id v46 = objc_msgSend(v11, "px_rootView");
        [v46 layoutIfNeeded];
      }
    }
  }
}

- (void)_requestFocusUpdateWithAssetReference:(id)a3
{
  [(PXCuratedLibraryUIViewController *)self setPreferredFocusAssetReference:a3];
  id v4 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v4 requestFocusUpdateToEnvironment:self];
}

- (void)_requestFocusUpdateForCursorAsset
{
  uint64_t v3 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  id v4 = [v3 viewModel];
  uint64_t v5 = [v4 selectionSnapshot];

  long long v10 = 0u;
  long long v11 = 0u;
  if (v5)
  {
    [v5 cursorIndexPath];
    uint64_t v6 = v10;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6 != *(void *)off_1E5DAAED8)
  {
    id v7 = [v5 dataSource];
    v9[0] = v10;
    v9[1] = v11;
    id v8 = [v7 objectReferenceAtIndexPath:v9];

    [(PXCuratedLibraryUIViewController *)self _requestFocusUpdateWithAssetReference:v8];
  }
}

- (void)_updateTrackedScrollLevelIfNeeded
{
  uint64_t v3 = [(PXCuratedLibraryUIViewController *)self trackedScrollContext];
  uint64_t v5 = v4;
  uint64_t v6 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  id v9 = [v6 viewModel];

  uint64_t v7 = [v9 zoomLevel];
  uint64_t v8 = [v9 scrollRegime];
  if (v3) {
    +[PXCuratedLibraryAnimationTracker scrollAnimationDidEndWithScrollContext:](PXCuratedLibraryAnimationTracker, "scrollAnimationDidEndWithScrollContext:", v3, v5);
  }
  if (v7) {
    +[PXCuratedLibraryAnimationTracker scrollAnimationDidBeginWithScrollContext:](PXCuratedLibraryAnimationTracker, "scrollAnimationDidBeginWithScrollContext:", v7, v8);
  }
  -[PXCuratedLibraryUIViewController setTrackedScrollContext:](self, "setTrackedScrollContext:", v7, v8);
}

- (void)_updateStatusBarStyle
{
  uint64_t v3 = +[PXCuratedLibrarySettings sharedInstance];
  uint64_t v4 = (void *)MEMORY[0x1E4FB1EB0];
  [v3 statusBarGradientAndStyleFadeDuration];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PXCuratedLibraryUIViewController__updateStatusBarStyle__block_invoke;
  v5[3] = &unk_1E5DD36F8;
  void v5[4] = self;
  objc_msgSend(v4, "animateWithDuration:animations:", v5);
}

uint64_t __57__PXCuratedLibraryUIViewController__updateStatusBarStyle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

void __59__PXCuratedLibraryUIViewController__updateSecondaryToolbar__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((unint64_t)(*(void *)(a1 + 40) - 1) > 1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) isSecondaryToolbarVisible];
  }
  [v4 setWantsFooterMask:v3];
  [v4 setFooterMaskVerticalOffset:*(double *)(a1 + 64) * 0.25];
}

- (void)_updateIsModalInPresentation
{
  id v4 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v3 = [v4 viewModel];
  -[UIViewController px_setModalInPresentation:](self, "px_setModalInPresentation:", [v3 isModalInPresentation]);
}

- (void)setCanShowFooter:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_canShowFooter != a3)
  {
    self->_BOOL canShowFooter = a3;
    id v4 = PLCuratedLibraryGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    uint64_t v6 = v4;
    uint64_t v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      BOOL canShowFooter = self->_canShowFooter;
      v13[0] = 67109120;
      v13[1] = canShowFooter;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "canShowFooter", "value: %i", (uint8_t *)v13, 8u);
    }

    if (self->_canShowFooter)
    {
      id v9 = [(PXCuratedLibraryUIViewController *)self viewProvider];
      long long v10 = [v9 footerController];
      [v10 performChanges:&__block_literal_global_309];
    }
    long long v11 = v7;
    double v12 = v11;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(v13[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v5, "canShowFooter", "", (uint8_t *)v13, 2u);
    }
  }
}

uint64_t __53__PXCuratedLibraryUIViewController_setCanShowFooter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 viewDidAppear];
}

- (void)px_containedViewControllerModalStateChanged
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  [(UIViewController *)&v4 px_containedViewControllerModalStateChanged];
  uint64_t v3 = [(PXCuratedLibraryUIViewController *)self dismissalInteractionController];
  [v3 containedViewControllerModalStateChanged];
}

uint64_t __61__PXCuratedLibraryUIViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSkimmingSlideshowEnabled];
}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v3 = [(PXCuratedLibraryUIViewController *)self _contentUnavailableConfiguration];

  if (v3) {
    return 0;
  }
  os_signpost_id_t v5 = [(PXCuratedLibraryUIViewController *)self viewProvider];
  uint64_t v6 = [v5 viewModel];
  if ([v6 wantsDarkStatusBar]) {
    int64_t v7 = 3;
  }
  else {
    int64_t v7 = 1;
  }

  uint64_t v8 = [(UIViewController *)self px_extendedTraitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  if (v9 == 2) {
    return 1;
  }
  else {
    return v7;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PXCuratedLibraryUIViewController *)self _setWantsOptionalChromeVisible:0 changeReason:3];
}

- (BOOL)isInUnselectedTab
{
  uint64_t v3 = [(PXCuratedLibraryUIViewController *)self tabBarController];
  objc_super v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 selectedViewController];
    BOOL v6 = ![(UIViewController *)self px_isDescendantOfViewController:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v9 viewDidDisappear:a3];
  int v4 = [(PXCuratedLibraryUIViewController *)self isViewLoaded];
  objc_super v5 = [(PXCuratedLibraryUIViewController *)self viewProviderIfLoaded];
  BOOL v6 = [v5 videoPlaybackController];
  [v6 setIsContentViewVisible:0];

  int64_t v7 = [(PXCuratedLibraryUIViewController *)self userActivityController];
  [v7 setActive:0];

  uint64_t v8 = [v5 eventTracker];
  [v8 logViewControllerDidDisappear:self];

  if ([(PXCuratedLibraryUIViewController *)self isViewLoaded])
  {
    if ([(PXCuratedLibraryUIViewController *)self isInUnselectedTab]) {
      [(PXCuratedLibraryUIViewController *)self _setWantsOptionalChromeVisible:1 changeReason:0];
    }
    [(PXCuratedLibraryUIViewController *)self _invalidateBannerView];
  }
  PXUnregisterAppIntentsViewAnnotationDelegate(self);
  if (v4 != [(PXCuratedLibraryUIViewController *)self isViewLoaded]) {
    PXAssertGetLog();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryUIViewController;
  [(PXCuratedLibraryUIViewController *)&v11 viewWillDisappear:a3];
  int v4 = [(PXCuratedLibraryUIViewController *)self isViewLoaded];
  objc_super v5 = [(PXCuratedLibraryUIViewController *)self gridView];
  BOOL v6 = [v5 scrollViewController];

  if (([v6 isDecelerating] & 1) != 0 || objc_msgSend(v6, "isDragging"))
  {
    uint64_t v7 = [(PXCuratedLibraryUIViewController *)self trackedScrollContext];
    +[PXCuratedLibraryAnimationTracker scrollAnimationDidEndWithScrollContext:](PXCuratedLibraryAnimationTracker, "scrollAnimationDidEndWithScrollContext:", v7, v8);
  }
  objc_super v9 = +[PXCuratedLibraryAnimationTracker sharedTracker];
  [v9 zoomLevelTransitionsDidEndEarly];

  long long v10 = [(PXCuratedLibraryUIViewController *)self filterTipController];
  [v10 setCuratedLibraryIsVisible:0];

  if ([(PXCuratedLibraryUIViewController *)self isViewLoaded]) {
    [(PXCuratedLibraryUIViewController *)self _updateDrawerButtonVisibility];
  }
  if (v4 != [(PXCuratedLibraryUIViewController *)self isViewLoaded]) {
    PXAssertGetLog();
  }
}

void __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCanShowFooter:1];
}

void __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _saveCurrentAllPhotosScrollPosition];
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  long long v2 = [(PXCuratedLibraryUIViewController *)self navigationController];
  uint64_t v3 = [v2 navigationBar];
  int v4 = [v3 scrollEdgeAppearance];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_hideNavigationBarItems:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PXCuratedLibraryUIViewController *)self navigationController];
  BOOL v6 = [v5 navigationBar];
  [v6 setForceFullHeightInLandscape:v3];

  if (v3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(PXCuratedLibraryUIViewController *)self navigationController];
  objc_super v9 = [v8 navigationBar];
  [v9 setRequestedContentSize:v7];

  long long v10 = [(PXCuratedLibraryUIViewController *)self navigationItem];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v10 setTitleView:v11];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v12 = [v10 leftBarButtonItems];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) setHidden:v3];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = objc_msgSend(v10, "rightBarButtonItems", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * j) setHidden:v3];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

void __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke(uint64_t a1)
{
  long long v2 = [PXCPLStatusController alloc];
  BOOL v3 = [*(id *)(a1 + 32) viewModel];
  id v11 = [(PXCPLStatusController *)v2 initWithViewModel:v3];

  int v4 = [*(id *)(a1 + 40) cplUIStatusProvider];
  [(PXCPLStatusController *)v11 setStatusProvider:v4];
  BOOL v5 = +[PXLocalization titleForEmptyPhotoLibrary];
  [(PXCPLStatusController *)v11 setFallbackTitle:v5];

  BOOL v6 = [*(id *)(a1 + 40) configuration];
  uint64_t v7 = [v6 photoLibrary];

  if (!v7)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PXCuratedLibraryUIViewController.m", 563, @"Invalid parameter not satisfying: %@", @"photoLibrary != nil" object file lineNumber description];
  }
  if (+[PXApplicationInstallationStateProvider isAppInstalled:2])
  {
    uint64_t v8 = +[PXLocalization messageForEmptyPhotoLibrary:v7];
    [(PXCPLStatusController *)v11 setFallbackMessage:v8];

    objc_super v9 = +[PXLocalization openCameraButtonTitleForEmptyPhotoLibrary];
    [(PXCPLStatusController *)v11 setFallbackActionTitle:v9];

    [(PXCPLStatusController *)v11 setFallbackAction:&__block_literal_global_245_79877];
  }
  [*(id *)(a1 + 40) setStatusController:v11];
}

void __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  BOOL v5 = PXSharedLibraryEmptyLibraryTitleForViewMode(v3);
  [v4 setTitle:v5];

  PXSharedLibraryEmptyLibraryMessageForViewMode(*(void *)(a1 + 40), *(void **)(a1 + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setAttributedMessage:v6];
}

void __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "px_openCameraAppURL");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:MEMORY[0x1E4F1CC08]];
}

- (id)_emptyPlaceholderMessageTextAttributesFromTextProperties:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4FB0850];
  id v4 = a3;
  BOOL v5 = [v3 defaultParagraphStyle];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setAlignment:1];
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v4, "lineBreakMode"));
  v11[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [v4 font];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB0700];
  uint64_t v8 = [v4 color];

  v11[2] = *MEMORY[0x1E4FB0738];
  v12[1] = v8;
  v12[2] = v6;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (void)_conditionallyUpdateEmptyPlaceholder
{
  uint64_t v3 = [(PXCuratedLibraryUIViewController *)self emptyPlaceholderStatusController];

  if (v3)
  {
    [(PXCuratedLibraryUIViewController *)self _updateEmptyPlaceholder];
  }
}

- (void)setLegibilityClipInsets:(UIEdgeInsets)a3
{
}

- (void)setNavigatedAssetReference:(id)a3
{
  uint64_t v7 = (PXAssetReference *)a3;
  BOOL v5 = self->_navigatedAssetReference;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXAssetReference *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_navigatedAssetReference, a3);
      [(PXCuratedLibraryUIViewController *)self setPreferredFocusAssetReference:v7];
    }
  }
}

void __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSkimmingSlideshowEnabled];
}

void __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSkimmingSlideshowEnabled];
}

void __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSkimmingSlideshowEnabled];
}

- (PXCuratedLibraryUIViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryUIViewController.m", 305, @"%s is not available as initializer", "-[PXCuratedLibraryUIViewController initWithCoder:]");

  abort();
}

- (PXCuratedLibraryUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryUIViewController.m", 301, @"%s is not available as initializer", "-[PXCuratedLibraryUIViewController initWithNibName:bundle:]");

  abort();
}

- (PXCuratedLibraryUIViewController)initWithPhotoLibrary:(id)a3
{
  return [(PXCuratedLibraryUIViewController *)self initWithPhotoLibrary:a3 initialZoomLevel:0];
}

- (PXCuratedLibraryUIViewController)initWithPhotoLibrary:(id)a3 initialZoomLevel:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[PXCuratedLibraryViewConfiguration alloc] initWithPhotoLibrary:v6];

  [(PXCuratedLibraryViewConfiguration *)v7 setInitialZoomLevel:a4];
  id v8 = [(PXCuratedLibraryUIViewController *)self initWithConfiguration:v7];

  return v8;
}

@end