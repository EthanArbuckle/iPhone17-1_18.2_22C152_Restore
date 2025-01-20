@interface PXPhotosUIViewController
+ (BOOL)shouldReconfigureOpacityOfSecondaryToolbarControllerForViewModelChange:(unint64_t)a3;
+ (id)_roundedButtonConfigurationWithSymbolName:(id)a3 inset:(double)a4 fontSize:(double)a5 weight:(int64_t)a6 groupName:(id)a7;
+ (id)_roundedButtonConfigurationWithSymbolName:(id)a3 useOriginalSymbolAppearance:(BOOL)a4 inset:(double)a5 fontSize:(double)a6 weight:(int64_t)a7 groupName:(id)a8;
+ (void)_configureOpacityOfSecondaryToolbarController:(id)a3 withViewModel:(id)a4 secondaryToolbarAlpha:(double)a5;
+ (void)configureOpacityOfSecondaryToolbarController:(id)a3 withViewModel:(id)a4;
- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResetToInitialState;
- (BOOL)hasScrolledToInitialPosition;
- (BOOL)hidesNavbar;
- (BOOL)hidesToolbar;
- (BOOL)isScrolledToTop;
- (BOOL)isShowingInitialLoadingPlaceholder;
- (BOOL)photosContentController:(id)a3 canPlayAssetInline:(id)a4;
- (BOOL)photosContentController:(id)a3 isDisplayAssetEligibleForAutoPlayback:(id)a4;
- (BOOL)photosContentController:(id)a3 isDisplayAssetEligibleForPlaybackWithSettlingEffect:(id)a4;
- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4;
- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3;
- (BOOL)pu_shouldOptOutFromChromelessBars;
- (BOOL)px_determinesPreferredStatusBarStyle;
- (BOOL)resetToInitialStateIfPossible;
- (BOOL)scrollToBottomAnimated:(BOOL)a3;
- (BOOL)scrollViewController:(id)a3 shouldBeginScrollingWithPanAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 velocity:(CGPoint)a6;
- (BOOL)secondaryToolbarController:(id)a3 scrollToBottomAnimated:(BOOL)a4;
- (BOOL)shouldAlwaysRespectToolbarActionPlacementPreference;
- (BOOL)shouldBeginScrollingContentWithPanAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 velocity:(CGPoint)a5;
- (BOOL)shouldScrollToInitialPositionAfterUnlock;
- (BOOL)swift_scrollViewControllerShouldScrollToTop:(id)a3;
- (BOOL)swift_updateScrollViewControllerForScrollDetentsProvider;
- (CGRect)layout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4;
- (NSArray)visibleUUIDs;
- (NSObject)filterTimeoutObserver;
- (NSSet)hiddenAssetReferences;
- (NSString)authenticationTitle;
- (NSString)description;
- (NSString)passcodeAuthenticationReason;
- (NSString)toolbarBackdropGroupName;
- (PXActionManager)assetActionManager;
- (PXAssetReference)assetReferenceForCurrentScrollPosition;
- (PXAssetReference)preferredFocusAssetReference;
- (PXAssetSelectionUserActivityController)userActivityController;
- (PXBoopableItemsProvider)boopableItemsProvider;
- (PXContentPrivacyController)privacyController;
- (PXGItemPlacement)placementOverride;
- (PXGView)gridView;
- (PXGridPresentationBarsUpdateDelegate)gridPresentationBarsUpdateDelegate;
- (PXPhotosBarsController)barsController;
- (PXPhotosCloseButtonController)closeButtonController;
- (PXPhotosContentController)contentController;
- (PXPhotosContentController)contentControllerIfLoaded;
- (PXPhotosDragController)emptyPlaceholderDragController;
- (PXPhotosFilterToggleButtonController)filterButtonController;
- (PXPhotosGridPlaceholderStatusController)fallbackPlaceholderStatusController;
- (PXPhotosStatusToggleButtonController)statusButtonController;
- (PXPhotosUIViewController)initWithCoder:(id)a3;
- (PXPhotosUIViewController)initWithConfiguration:(id)a3;
- (PXPhotosUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPhotosViewConfiguration)configuration;
- (PXPhotosViewEventTracker)eventTracker;
- (PXPhotosViewModel)viewModel;
- (PXPhotosViewModel)viewModelIfLoaded;
- (PXPhotosViewUIInteraction)interaction;
- (PXProgrammaticNavigationRequest)pendingInitialNavigationRequest;
- (PXScrollBehavior)scrollBehavior;
- (PXSecondaryToolbarController)secondaryToolbarController;
- (PXSelectionContainer)selectionContainer;
- (PXSplitViewController)observedSplitViewController;
- (PXStatusController)placeholderStatusController;
- (PXUpdater)updater;
- (PXViewControllerDismissalInteractionController)dismissalInteractionController;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIColor)backgroundColorBeforeOverride;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIEdgeInsets)maskPaddingForContentController:(id)a3;
- (UIEdgeInsets)px_layoutMargins;
- (UIView)alternateContentView;
- (UIView)fullscreenOverlay;
- (UIViewController)containerViewController;
- (UIViewControllerInteractiveTransitioning)edgeSwipeDismissalInteraction;
- (double)collapsibleFooterHeight;
- (double)numberOfPhotosRowsForVisibleHeight:(double)a3;
- (double)secondaryToolbarAlpha;
- (double)secondaryToolbarHeight;
- (double)visibleHeightForNumberOfPhotosRows:(double)a3;
- (id)_createButtonForScrollingToNeighboringSectionInDirection:(unint64_t)a3;
- (id)_createPlayAsMemoryButton;
- (id)_createSortButton;
- (id)_defaultPresentationEnvironment;
- (id)_popoverPresentationEnvironmentWithSourceItem:(id)a3;
- (id)_viewControllerForPresentationEnvironment;
- (id)barsControllerActionsForSelectionContextMenu:(id)a3;
- (id)createSearchOverlayController;
- (id)currentDataSource;
- (id)explicitRepresentedItem;
- (id)menuForPXAssetCollectionActionTypeTTRForLemonadeCollections;
- (id)placementInContext:(id)a3 forItemReference:(id)a4;
- (id)popoverPresentationEnvironmentForPhotosCloseButtonController:(id)a3;
- (id)popoverPresentationEnvironmentForPhotosStatusToggleButtonController:(id)a3;
- (id)ppt_navigateToBottom;
- (id)ppt_scrollToPreviousAssetOfAsset:(id)a3 completion:(id)a4;
- (id)preferredFocusEnvironments;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)presentationEnvironmentForPhotosBarsController:(id)a3 withSourceItem:(id)a4;
- (id)pu_debugCurrentPrivacyController;
- (id)pu_debugCurrentlySelectedAssets;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)px_navigationDestination;
- (id)regionOfInterestForActionPerformer:(id)a3;
- (id)regionOfInterestForAssetReference:(id)a3;
- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4;
- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 shouldSnapshotPlaceholder:(BOOL)a5;
- (id)regionOfInterestForTransitioningAssetReference:(id)a3;
- (id)representedItem;
- (id)scrollView;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)windowForProgressPresentationInAssetsSharingHelper:(id)a3;
- (int64_t)userInterfaceFeature;
- (unint64_t)allowedInteractiveDismissBehaviors;
- (unint64_t)photosContentControllerFilterSortedRecordsStrategy:(id)a3;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_completeNavigationToDestination:(id)a3 result:(int64_t)a4 error:(id)a5;
- (void)_configureDismissalInteractionController;
- (void)_dismissOnInternalRequest;
- (void)_getPhotosRowHeight:(double *)a3 spacing:(double *)a4;
- (void)_handleDidEndScrolling:(id)a3;
- (void)_invalidateObservedSplitViewController;
- (void)_invalidateOneUpPresentationInteraction;
- (void)_invalidateSidebarVisibilityDependentProperties;
- (void)_presentOneUpForSingleSelectedAssetWithActivity:(unint64_t)a3;
- (void)_requestFocusUpdateWithAssetReference:(id)a3;
- (void)_scrollToInitialPositionAnimated:(BOOL)a3;
- (void)_scrollToInitialPositionIfNecessary;
- (void)_setNeedsUpdate;
- (void)_showSearch;
- (void)_updateBackButtonBehavior;
- (void)_updateBackgroundColor;
- (void)_updateBackgroundColorOverride;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateDismissalInteractionControllerProperties;
- (void)_updateDrawerButtonVisibility;
- (void)_updateEmptyBehaviorIfNeeded;
- (void)_updateIsModalInPresentation;
- (void)_updateObservedSplitViewController;
- (void)_updateOneUpPresentationInteraction;
- (void)_updateScrollViewController;
- (void)_updateSecondaryToolbarAccessoryViews;
- (void)_updateSecondaryToolbarController;
- (void)_updateSecondaryToolbarOpacity;
- (void)_updateSidebarVisibilityDependentProperties;
- (void)_updateSubviewsOrdering;
- (void)_updateUIFromViewModelPrivacyState;
- (void)_waitForAvailabilityOfAsset:(id)a3 completionHandler:(id)a4;
- (void)_waitUntilOneUpPresentationCanStartAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)addAssetsToAlbum:(id)a3;
- (void)cancelSelectMode:(id)a3;
- (void)containerView:(id)a3 willMoveToWindow:(id)a4;
- (void)dealloc;
- (void)deselectAll:(id)a3;
- (void)dismissPresentedViewControllerForContentController:(id)a3;
- (void)ensureSwipeDismissalInteraction;
- (void)invalidateBoopableItemsProvider;
- (void)invalidateHeaderView;
- (void)loadView;
- (void)modalDismiss:(id)a3;
- (void)navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)navigateToAssetReference:(id)a3;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)needsUpdateForContentController:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)openSelectionWithCommandDownArrow:(id)a3;
- (void)paste:(id)a3;
- (void)photosBarsController:(id)a3 didRequestDismissWithSender:(id)a4;
- (void)photosBarsControllerDidUpdateBars:(id)a3;
- (void)photosBarsControllerDidUpdateNavigationItemAppearance:(id)a3;
- (void)photosCloseButtonControllerHandleAction:(id)a3;
- (void)playCollectionAsMemory;
- (void)ppt_navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 completionHandler:(id)a6;
- (void)ppt_navigateToAssetReference:(id)a3 revealInOneUp:(BOOL)a4 completionHandler:(id)a5;
- (void)preferencesDidChange;
- (void)prepareForDismissal;
- (void)px_containedViewControllerModalStateChanged;
- (void)px_didTransitionBars;
- (void)px_willTransitionBars;
- (void)scrollToCenterAssetReference:(id)a3 completion:(id)a4;
- (void)scrollToRevealAssetReference:(id)a3 completion:(id)a4;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)selectAll:(id)a3;
- (void)setAlternateContentView:(id)a3;
- (void)setBackgroundColorBeforeOverride:(id)a3;
- (void)setBoopableItemsProvider:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setExplicitRepresentedItem:(id)a3;
- (void)setFallbackPlaceholderStatusController:(id)a3;
- (void)setGridPresentationBarsUpdateDelegate:(id)a3;
- (void)setHasScrolledToInitialPosition:(BOOL)a3;
- (void)setHiddenAssetReferences:(id)a3;
- (void)setHiddenAssetReferences:(id)a3 animationType:(int64_t)a4;
- (void)setHidesNavbar:(BOOL)a3;
- (void)setHidesToolbar:(BOOL)a3;
- (void)setObservedSplitViewController:(id)a3;
- (void)setOneUpEnabled:(BOOL)a3;
- (void)setPendingInitialNavigationRequest:(id)a3;
- (void)setPlaceholderStatusController:(id)a3;
- (void)setPlacementOverride:(id)a3;
- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setPreferredFocusAssetReference:(id)a3;
- (void)setScrollBehavior:(id)a3;
- (void)setSecondaryToolbarAlpha:(double)a3;
- (void)setSecondaryToolbarController:(id)a3;
- (void)setShouldAlwaysRespectToolbarActionPlacementPreference:(BOOL)a3;
- (void)setShouldScrollToInitialPositionAfterUnlock:(BOOL)a3;
- (void)setShowingInitialLoadPlaceholder:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)swift_configureDismissalInteractionController:(id)a3;
- (void)swift_handleViewModelChange:(unint64_t)a3;
- (void)swift_scrollViewControllerDidScroll:(id)a3;
- (void)swift_specDidChange;
- (void)swift_viewDidLoad;
- (void)toggleEditMode:(id)a3;
- (void)toggleFilter:(id)a3;
- (void)toggleViewMode:(id)a3;
- (void)toggleViewer:(id)a3;
- (void)uiInteraction:(id)a3 didChangeNavigatedAssetReference:(id)a4;
- (void)uiInteractionDidExtendSelection:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)zoomIn:(id)a3;
- (void)zoomOut:(id)a3;
@end

@implementation PXPhotosUIViewController

+ (id)_roundedButtonConfigurationWithSymbolName:(id)a3 useOriginalSymbolAppearance:(BOOL)a4 inset:(double)a5 fontSize:(double)a6 weight:(int64_t)a7 groupName:(id)a8
{
  id v13 = a3;
  v14 = (void *)MEMORY[0x1E4FB14D8];
  id v15 = a8;
  v16 = [v14 grayButtonConfiguration];
  v17 = [MEMORY[0x1E4FB1830] configurationWithPointSize:a7 weight:a6];
  v18 = [MEMORY[0x1E4FB1818] _systemImageNamed:v13 withConfiguration:v17];
  if (v18)
  {
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v18 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:withConfiguration:", v13, v17);
  if (!a4)
  {
LABEL_3:
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v20 = [v18 imageWithTintColor:v19 renderingMode:1];

    v18 = (void *)v20;
  }
LABEL_4:
  [v16 setImage:v18];
  v21 = [MEMORY[0x1E4FB1498] clearConfiguration];
  [v21 _setVisualEffectGroupName:v15];

  v22 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
  [v21 setVisualEffect:v22];

  [v16 setBackground:v21];
  objc_msgSend(v16, "setContentInsets:", a5, a5, a5, a5);
  [v16 setCornerStyle:4];

  return v16;
}

- (void)swift_configureDismissalInteractionController:(id)a3
{
  v5 = *(void (**)(PXPhotosUIViewController *, _UNKNOWN **))((*MEMORY[0x1E4FBC8C8] & *(void *)a3) + 0x178);
  v7 = self;
  id v6 = a3;
  v5(self, &off_1F009C650);
}

- (void)swift_viewDidLoad
{
}

- (void)swift_handleViewModelChange:(unint64_t)a3
{
  v4 = self;
  sub_1AA7DE2E8(a3);
}

- (void)swift_specDidChange
{
}

- (void)swift_scrollViewControllerDidScroll:(id)a3
{
  id v4 = a3;
  self;
  sub_1AA7E0A80();
}

- (BOOL)swift_updateScrollViewControllerForScrollDetentsProvider
{
  v2 = self;
  sub_1AA7DED3C();
}

- (BOOL)swift_scrollViewControllerShouldScrollToTop:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotosUIViewController *)self viewModel];
  PXPhotosViewModel.scrollDetentsProvider.getter();
}

- (id)representedItem
{
  v2 = self;
  if ([(PXPhotosUIViewController *)v2 explicitRepresentedItem])
  {
    sub_1AB23BC4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_1A9BA8728((uint64_t)v11, (uint64_t)v12);

  uint64_t v3 = v13;
  if (v13)
  {
    id v4 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v5 = *(void *)(v3 - 8);
    double v6 = MEMORY[0x1F4188790](v4, v4);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v5 + 16))(v8, v6);
    v9 = (void *)sub_1AB23C58C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)shouldBeginScrollingContentWithPanAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  v8 = [(PXPhotosUIViewController *)v7 viewModel];
  unsigned int v9 = [(PXPhotosViewModel *)v8 isScrollDisabledForAxis:1];

  if (v9)
  {
    swift_unknownObjectRelease();

    return 0;
  }
  else
  {
    if (y > 0.0)
    {
      id v11 = [(PXPhotosUIViewController *)v7 presentingViewController];

      if (v11) {
        sub_1AA7DFB10();
      }
    }
    swift_unknownObjectRelease();

    return 1;
  }
}

- (id)createSearchOverlayController
{
  v2 = self;
  uint64_t v3 = (void *)sub_1AA7E0444();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_explicitRepresentedItem, 0);
  objc_storeStrong((id *)&self->_alternateContentView, 0);
  objc_storeStrong((id *)&self->_scrollBehavior, 0);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_filterTimeoutObserver, 0);
  objc_storeStrong((id *)&self->_backgroundColorBeforeOverride, 0);
  objc_storeStrong((id *)&self->_placementOverride, 0);
  objc_storeStrong((id *)&self->_fullscreenOverlay, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarController, 0);
  objc_storeStrong((id *)&self->_fallbackPlaceholderStatusController, 0);
  objc_storeStrong((id *)&self->_placeholderStatusController, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_preferredFocusAssetReference, 0);
  objc_storeStrong((id *)&self->_pendingInitialNavigationRequest, 0);
  objc_destroyWeak((id *)&self->_observedSplitViewController);
  objc_storeStrong((id *)&self->_dismissalInteractionController, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderDragController, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_toolbarBackdropGroupName, 0);
  objc_destroyWeak((id *)&self->_gridPresentationBarsUpdateDelegate);
  objc_storeStrong((id *)&self->_closeButtonController, 0);
  objc_storeStrong((id *)&self->_statusButtonController, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_selectedAssetsAssetCollectionActionManager, 0);
}

- (void)setExplicitRepresentedItem:(id)a3
{
}

- (id)explicitRepresentedItem
{
  return self->_explicitRepresentedItem;
}

- (UIView)alternateContentView
{
  return self->_alternateContentView;
}

- (double)secondaryToolbarAlpha
{
  return self->_secondaryToolbarAlpha;
}

- (void)setScrollBehavior:(id)a3
{
}

- (PXScrollBehavior)scrollBehavior
{
  return self->_scrollBehavior;
}

- (PXPhotosBarsController)barsController
{
  return self->_barsController;
}

- (PXPhotosViewConfiguration)configuration
{
  return self->_configuration;
}

- (NSObject)filterTimeoutObserver
{
  return self->_filterTimeoutObserver;
}

- (void)setBackgroundColorBeforeOverride:(id)a3
{
}

- (UIColor)backgroundColorBeforeOverride
{
  return self->_backgroundColorBeforeOverride;
}

- (PXGItemPlacement)placementOverride
{
  return self->_placementOverride;
}

- (UIView)fullscreenOverlay
{
  return self->_fullscreenOverlay;
}

- (void)setSecondaryToolbarController:(id)a3
{
}

- (PXSecondaryToolbarController)secondaryToolbarController
{
  return self->_secondaryToolbarController;
}

- (BOOL)isShowingInitialLoadingPlaceholder
{
  return self->_showingInitialLoadPlaceholder;
}

- (void)setFallbackPlaceholderStatusController:(id)a3
{
}

- (PXPhotosGridPlaceholderStatusController)fallbackPlaceholderStatusController
{
  return self->_fallbackPlaceholderStatusController;
}

- (void)setPlaceholderStatusController:(id)a3
{
}

- (PXStatusController)placeholderStatusController
{
  return self->_placeholderStatusController;
}

- (void)setBoopableItemsProvider:(id)a3
{
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setPreferredFocusAssetReference:(id)a3
{
}

- (PXAssetReference)preferredFocusAssetReference
{
  return self->_preferredFocusAssetReference;
}

- (void)setShouldScrollToInitialPositionAfterUnlock:(BOOL)a3
{
  self->_shouldScrollToInitialPositionAfterUnlock = a3;
}

- (BOOL)shouldScrollToInitialPositionAfterUnlock
{
  return self->_shouldScrollToInitialPositionAfterUnlock;
}

- (void)setHasScrolledToInitialPosition:(BOOL)a3
{
  self->_hasScrolledToInitialPosition = a3;
}

- (BOOL)hasScrolledToInitialPosition
{
  return self->_hasScrolledToInitialPosition;
}

- (void)setPendingInitialNavigationRequest:(id)a3
{
}

- (PXProgrammaticNavigationRequest)pendingInitialNavigationRequest
{
  return self->_pendingInitialNavigationRequest;
}

- (PXSplitViewController)observedSplitViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedSplitViewController);
  return (PXSplitViewController *)WeakRetained;
}

- (PXViewControllerDismissalInteractionController)dismissalInteractionController
{
  return self->_dismissalInteractionController;
}

- (PXAssetSelectionUserActivityController)userActivityController
{
  return self->_userActivityController;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXPhotosDragController)emptyPlaceholderDragController
{
  return self->_emptyPlaceholderDragController;
}

- (unint64_t)allowedInteractiveDismissBehaviors
{
  return self->_allowedInteractiveDismissBehaviors;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setContainerViewController:(id)a3
{
}

- (UIViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setGridPresentationBarsUpdateDelegate:(id)a3
{
}

- (PXGridPresentationBarsUpdateDelegate)gridPresentationBarsUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridPresentationBarsUpdateDelegate);
  return (PXGridPresentationBarsUpdateDelegate *)WeakRetained;
}

- (id)_popoverPresentationEnvironmentWithSourceItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotosUIViewController *)self _viewControllerForPresentationEnvironment];
  double v6 = +[PXViewControllerPresenter popoverPresenterWithViewController:v5 sourceItem:v4];

  return v6;
}

- (id)_defaultPresentationEnvironment
{
  v2 = [(PXPhotosUIViewController *)self _viewControllerForPresentationEnvironment];
  uint64_t v3 = +[PXViewControllerPresenter defaultPresenterWithViewController:v2];

  return v3;
}

- (id)_viewControllerForPresentationEnvironment
{
  uint64_t v3 = [(PXPhotosUIViewController *)self containerViewController];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (id)popoverPresentationEnvironmentForPhotosCloseButtonController:(id)a3
{
  id v4 = [a3 button];
  id v5 = [(PXPhotosUIViewController *)self _popoverPresentationEnvironmentWithSourceItem:v4];

  return v5;
}

- (void)photosCloseButtonControllerHandleAction:(id)a3
{
  id v6 = a3;
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  id v5 = [v4 viewDelegate];

  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v5 photosViewControllerDismiss:self] & 1) == 0) {
    [(PXPhotosUIViewController *)self modalDismiss:v6];
  }
}

- (id)popoverPresentationEnvironmentForPhotosStatusToggleButtonController:(id)a3
{
  id v4 = [a3 button];
  id v5 = [(PXPhotosUIViewController *)self _popoverPresentationEnvironmentWithSourceItem:v4];

  return v5;
}

- (void)preferencesDidChange
{
  uint64_t v3 = [(PXPhotosUIViewController *)self viewModel];
  id v4 = [v3 currentDataSource];
  id v5 = [v4 containerCollection];
  int v6 = objc_msgSend(v5, "px_isHiddenSmartAlbum");

  if (v6)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"HiddenAlbumVisible", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      if (!AppBooleanValue)
      {
        v8 = PLGridZeroGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXPhotosUIViewController: Show Hidden Album was disabled in preferences, popping view.", v13, 2u);
        }

        BOOL v9 = [(UIViewController *)self px_isVisible];
        v10 = [(UIViewController *)self px_oneUpPresentation];
        [v10 stopAnimated:v9];

        id v11 = [(PXPhotosUIViewController *)self navigationController];
        id v12 = (id)objc_msgSend(v11, "px_popToViewControllerPrecedingViewController:animated:", self, v9);
      }
    }
  }
}

- (void)prepareForDismissal
{
  id v2 = [(UIViewController *)self px_oneUpPresentation];
  [v2 stopAnimated:0];
}

- (void)uiInteractionDidExtendSelection:(id)a3
{
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  id v5 = [v4 selectionManager];
  int v6 = [v5 selectionSnapshot];

  long long v11 = 0u;
  long long v12 = 0u;
  if (v6)
  {
    [v6 cursorIndexPath];
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (v7 != *(void *)off_1E5DAAED8)
  {
    v8 = [v6 dataSource];
    v10[0] = v11;
    v10[1] = v12;
    BOOL v9 = [v8 objectReferenceAtIndexPath:v10];

    [(PXPhotosUIViewController *)self _requestFocusUpdateWithAssetReference:v9];
  }
}

- (void)uiInteraction:(id)a3 didChangeNavigatedAssetReference:(id)a4
{
}

- (void)invalidateBoopableItemsProvider
{
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  uint64_t v3 = [(PXPhotosUIViewController *)self viewModel];
  uint64_t v4 = [v3 contentPrivacyState];

  id v5 = [(PXPhotosUIViewController *)self viewModel];
  int v6 = [v5 allowsShareAction];

  uint64_t v7 = 0;
  if (v6 && !v4)
  {
    v8 = [(PXPhotosUIViewController *)self boopableItemsProvider];

    if (!v8)
    {
      BOOL v9 = objc_alloc_init(PXBoopableItemsProvider);
      [(PXPhotosUIViewController *)self setBoopableItemsProvider:v9];

      v10 = [(PXPhotosUIViewController *)self viewModel];
      long long v11 = [v10 selectionManager];
      long long v12 = [(PXPhotosUIViewController *)self boopableItemsProvider];
      [v12 setSelectionManager:v11];

      uint64_t v13 = [(PXPhotosUIViewController *)self viewModel];
      v14 = [v13 mediaProvider];
      id v15 = [(PXPhotosUIViewController *)self boopableItemsProvider];
      [v15 setImagePreviewMediaProvider:v14];
    }
    uint64_t v7 = [(PXPhotosUIViewController *)self boopableItemsProvider];
  }
  return (UIActivityItemsConfigurationReading *)v7;
}

- (PXSelectionContainer)selectionContainer
{
  uint64_t v3 = [(PXPhotosUIViewController *)self viewModel];
  uint64_t v4 = [PXSelectionContainer alloc];
  id v5 = [v3 selectionManager];
  int v6 = [v5 selectionSnapshot];
  uint64_t v7 = [(PXPhotosUIViewController *)self undoManager];
  v8 = -[PXSelectionContainer initWithSelectionSnapshot:undoManager:context:](v4, "initWithSelectionSnapshot:undoManager:context:", v6, v7, [v3 selectionContext]);

  return v8;
}

- (BOOL)secondaryToolbarController:(id)a3 scrollToBottomAnimated:(BOOL)a4
{
  return [(PXPhotosUIViewController *)self scrollToBottomAnimated:a4];
}

- (id)windowForProgressPresentationInAssetsSharingHelper:(id)a3
{
  uint64_t v3 = [(PXPhotosUIViewController *)self view];
  uint64_t v4 = [v3 window];

  return v4;
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PXPhotosUIViewController *)self presentedViewController];

  if (v9 == v8) {
    [(PXPhotosUIViewController *)self dismissViewControllerAnimated:1 completion:v7];
  }

  return v9 == v8;
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  return a4 != 0;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosUIViewController *)self view];
  [v5 setAccessibilityLabel:v4];

  v6.receiver = self;
  v6.super_class = (Class)PXPhotosUIViewController;
  [(PXPhotosUIViewController *)&v6 setTitle:v4];
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(PXPhotosUIViewController *)self viewModel];
  id v9 = [v8 dataSourceManager];
  v10 = [v9 dataSource];

  long long v11 = objc_alloc_init(PXDiagnosticsItemProvider);
  long long v12 = [v10 containerCollection];
  if ([v12 conformsToProtocol:&unk_1F0352298]) {
    [(PXDiagnosticsItemProvider *)v11 registerItem:v12 forIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection"];
  }
  uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosUIViewController;
  v14 = -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v16, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);

  [v13 addObjectsFromArray:v14];
  return v13;
}

- (id)regionOfInterestForTransitioningAssetReference:(id)a3
{
  return [(PXPhotosUIViewController *)self regionOfInterestForAssetReference:a3 image:0 shouldSnapshotPlaceholder:0];
}

- (CGRect)layout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = [(PXPhotosUIViewController *)self scrollBehavior];
  if (v10)
  {
    long long v11 = [v9 activeAnchor];

    if (v11)
    {
      objc_msgSend(v10, "adjustedScrollTargetContentOffsetForProposedTargetContentOffset:velocity:currentContentOffset:decelerationRate:", 0, x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), x, y);
      double x = v12;
      double y = v13;
    }
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = a3;
  double v13 = [(PXPhotosUIViewController *)self scrollBehavior];
  if (v13)
  {
    double v14 = a5->x;
    double v15 = a5->y;
    double v75 = 0.0;
    uint64_t v76 = 0;
    *(double *)&uint64_t v74 = 0.0;
    int v16 = [v12 isInterruptingScrollWithDirection:&v74];
    if (v16) {
      double v17 = *(double *)&v74;
    }
    else {
      double v17 = v10;
    }
    if (v16) {
      double v18 = v75;
    }
    else {
      double v18 = v9;
    }
    objc_msgSend(v13, "adjustedScrollTargetContentOffsetForProposedTargetContentOffset:velocity:currentContentOffset:decelerationRate:", &v76, v14, v15, v17, v18, x, y);
    CGFloat v20 = v19;
    double v22 = v21;
    v23 = [v13 detentAtContentOffset:v21];
    v24 = [(PXPhotosUIViewController *)self viewModel];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __119__PXPhotosUIViewController_scrollViewControllerWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke;
    v72[3] = &unk_1E5DCF6C0;
    id v25 = v23;
    id v73 = v25;
    [v24 performChanges:v72];

    [v12 setDecelerationRate:v76];
    if (v22 != v15)
    {
      v26 = [(PXPhotosUIViewController *)self contentController];
      [v26 setShouldEnablePlaybackDuringAnimatedScroll:1];
    }
    if (v18 >= 0.0 || v22 <= y)
    {
      a5->double x = v20;
      a5->double y = v22;
    }
    else
    {
      a5->double x = v14;
      a5->double y = v15;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __119__PXPhotosUIViewController_scrollViewControllerWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke_2;
      block[3] = &unk_1E5DD35E0;
      id v69 = v12;
      CGFloat v70 = v20;
      double v71 = v22;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    double v27 = a5->y;
    double v67 = a5->x;
    *(double *)&uint64_t v74 = COERCE_DOUBLE([v12 decelerationRate]);
    v28 = [(PXPhotosUIViewController *)self contentController];
    v29 = [v28 layout];

    v30 = [v29 rootLayout];
    objc_msgSend(v30, "convertRect:toDescendantLayout:", v29, a5->x, a5->y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v32 = v31;
    double v34 = v33;

    objc_msgSend(v29, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", &v74, v32, v34, v10, v9);
    double v64 = v27 + v35 - v34;
    [v29 lastScrollDirection];
    double v37 = v36;
    double v65 = v38;
    double v66 = v36;
    double v39 = v38;
    [v12 visibleRect];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [v29 topCollapsibleArea];
    double v50 = PXScrollViewContentOffsetSnappedToRange(1, v41, v43, v45, v47, v67, v64, v10, v9, v37, v39, v48, v49);
    double v52 = v51;
    [v12 visibleRect];
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    [v29 bottomCollapsibleArea];
    a5->double x = PXScrollViewContentOffsetSnappedToRange(1, v54, v56, v58, v60, v50, v52, v10, v9, v66, v65, v61, v62);
    a5->double y = v63;
    [v12 setDecelerationRate:v74];
  }
}

uint64_t __119__PXPhotosUIViewController_scrollViewControllerWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLastTargetPreferredScrollDetent:*(void *)(a1 + 32)];
}

void __119__PXPhotosUIViewController_scrollViewControllerWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke_2(uint64_t a1)
{
}

- (void)_handleDidEndScrolling:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosUIViewController *)self scrollBehavior];
  if (v5)
  {
    [v4 visibleRect];
    [v5 axis];
    PXPointValueForAxis();
  }
}

uint64_t __51__PXPhotosUIViewController__handleDidEndScrolling___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLastPreferredScrollDetent:*(void *)(a1 + 32)];
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  [(PXPhotosUIViewController *)self _handleDidEndScrolling:a3];
  id v4 = [(PXPhotosUIViewController *)self scrollBehavior];

  if (v4)
  {
    id v5 = [(PXPhotosUIViewController *)self contentController];
    [v5 setShouldEnablePlaybackDuringAnimatedScroll:0];
  }
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v12 = a3;
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  int v5 = [v4 _shouldMimicSystemChromelessUsingManualScrollEdgeAppearance];

  if (v5)
  {
    [v12 visibleOrigin];
    double v7 = v6;
    id v8 = [(PXPhotosUIViewController *)self view];
    [v8 safeAreaInsets];
    double v10 = floor(v7 + v9);

    long long v11 = [(PXPhotosUIViewController *)self navigationItem];
    objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", fmax(fmin(v10, 16.0), 0.0) * 0.0625);
  }
  [(PXPhotosUIViewController *)self swift_scrollViewControllerDidScroll:v12];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  id v8 = a3;
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  int v5 = [v4 viewDelegateRespondsTo:0x20000];

  if (v5)
  {
    double v6 = [(PXPhotosUIViewController *)self viewModel];
    double v7 = [v6 viewDelegate];
    [v7 photosViewController:self scrollViewControllerWillBeginScrolling:v8];
  }
}

- (BOOL)scrollViewController:(id)a3 shouldBeginScrollingWithPanAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 velocity:(CGPoint)a6
{
  return -[PXPhotosUIViewController shouldBeginScrollingContentWithPanAtLocation:inCoordinateSpace:velocity:](self, "shouldBeginScrollingContentWithPanAtLocation:inCoordinateSpace:velocity:", a5, a4.x, a4.y, a6.x, a6.y);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ViewModelObserverContext_201660 != a5)
  {
    if ((a4 & 1) != 0 && (void *)SpecManagerObserverContext == a5)
    {
      [(PXPhotosUIViewController *)self _updateScrollViewController];
      [(PXPhotosUIViewController *)self swift_specDidChange];
    }
    goto LABEL_44;
  }
  if ((a4 & 0x8000000000000) != 0) {
    [(PXPhotosUIViewController *)self setFallbackPlaceholderStatusController:0];
  }
  if ((a4 & 0x8000200000001) != 0) {
    [(PXPhotosUIViewController *)self _updateEmptyBehaviorIfNeeded];
  }
  if ((a4 & 4) != 0)
  {
    double v9 = [(PXPhotosUIViewController *)self contentController];
    double v10 = [v9 layout];
    [v10 clearLastVisibleAreaAnchoringInformation];

    [(PXPhotosUIViewController *)self invalidateBoopableItemsProvider];
    if ((a4 & 0x4000) == 0)
    {
LABEL_11:
      if ((a4 & 0x2000000000000) == 0) {
        goto LABEL_12;
      }
LABEL_16:
      [(PXPhotosUIViewController *)self _showSearch];
      if ((a4 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  else if ((a4 & 0x4000) == 0)
  {
    goto LABEL_11;
  }
  long long v11 = [(PXPhotosUIViewController *)self viewModel];
  id v12 = [v11 singleSelectedAssetReference];
  [(PXPhotosUIViewController *)self _requestFocusUpdateWithAssetReference:v12];

  if ((a4 & 0x2000000000000) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((a4 & 2) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  double v13 = [(PXPhotosUIViewController *)self viewModel];
  double v14 = [v13 selectionSnapshot];
  int v15 = [v14 isEmptySelectionAvoided];

  if (v15)
  {
    int v16 = [(PXPhotosUIViewController *)self viewModel];
    double v17 = [v16 singleSelectedAssetReference];
    [(PXPhotosUIViewController *)self _requestFocusUpdateWithAssetReference:v17];
  }
LABEL_19:
  if ((a4 & 0x40000000) != 0)
  {
    double v18 = [(PXPhotosUIViewController *)self viewModel];
    int v19 = [v18 dismissRequested];

    if (v19) {
      [(PXPhotosUIViewController *)self _dismissOnInternalRequest];
    }
  }
  if ((a4 & 0x400000000) != 0)
  {
    [(PXPhotosUIViewController *)self _updateUIFromViewModelPrivacyState];
    CGFloat v20 = [(PXPhotosUIViewController *)self viewModel];
    uint64_t v21 = [v20 contentPrivacyState];

    if (v21 == 1)
    {
      double v22 = [(PXPhotosUIViewController *)self gridView];
      v23 = [v22 scrollViewController];
      uint64_t v24 = [v23 isScrolledAtEdge:3 tolerance:100.0];

      [(PXPhotosUIViewController *)self setShouldScrollToInitialPositionAfterUnlock:v24];
    }
    else if ([(PXPhotosUIViewController *)self shouldScrollToInitialPositionAfterUnlock])
    {
      id v25 = PLGridZeroGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "PXPhotosUIViewController: Scrolling to initial position after unlock.", buf, 2u);
      }

      [(PXPhotosUIViewController *)self _scrollToInitialPositionAnimated:0];
      [(PXPhotosUIViewController *)self setShouldScrollToInitialPositionAfterUnlock:0];
    }
    [(PXPhotosUIViewController *)self invalidateBoopableItemsProvider];
  }
  if ((a4 & 0x30000000000) != 0) {
    [(PXPhotosUIViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  }
  if ((a4 & 0x80000000000) != 0) {
    [(PXPhotosUIViewController *)self _invalidateSecondaryToolbarController];
  }
  if ([(id)objc_opt_class() shouldReconfigureOpacityOfSecondaryToolbarControllerForViewModelChange:a4])
  {
    [(PXPhotosUIViewController *)self _invalidateSecondaryToolbarOpacity];
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_36:
      if ((a4 & 4) == 0) {
        goto LABEL_37;
      }
      goto LABEL_47;
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    goto LABEL_36;
  }
  [(PXPhotosUIViewController *)self _invalidateIsModalInPresentation];
  if ((a4 & 4) == 0)
  {
LABEL_37:
    if ((a4 & 0x100000000000) == 0) {
      goto LABEL_38;
    }
LABEL_48:
    [(PXPhotosUIViewController *)self _invalidateOneUpPresentationInteraction];
    if ((a4 & 0x20) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_47:
  [(PXPhotosUIViewController *)self _invalidateSecondaryToolbarController];
  if ((a4 & 0x100000000000) != 0) {
    goto LABEL_48;
  }
LABEL_38:
  if ((a4 & 0x20) != 0)
  {
LABEL_39:
    [(PXPhotosUIViewController *)self _invalidateDismissalInteractionControllerProperties];
    [(PXPhotosUIViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
LABEL_40:
  [(PXPhotosUIViewController *)self swift_handleViewModelChange:a4];
  if ((a4 & 0x400000000001) != 0)
  {
    [(PXPhotosUIViewController *)self _updateScrollViewController];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PXPhotosUIViewController_observable_didChange_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ((a4 & 0x800000000000) != 0)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __57__PXPhotosUIViewController_observable_didChange_context___block_invoke_2;
    v26[3] = &unk_1E5DD36F8;
    v26[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v26);
  }
LABEL_44:
}

uint64_t __57__PXPhotosUIViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollToInitialPositionIfNecessary];
}

uint64_t __57__PXPhotosUIViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScrollViewController];
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PXPhotosUIViewController *)self setPlacementOverride:v7];
  id v8 = [(PXPhotosUIViewController *)self contentController];
  [v8 setPlacementOverride:v7 forItemReference:v6];
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosUIViewController *)self contentController];
  double v9 = [v8 placementInContext:v7 forItemReference:v6];

  return v9;
}

- (unint64_t)photosContentControllerFilterSortedRecordsStrategy:(id)a3
{
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  if ([v4 viewDelegateRespondsTo:0x4000])
  {
    int v5 = [v4 viewDelegate];
    unint64_t v6 = [v5 photosViewControllerFilterSortedRecordsStrategy:self];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)photosContentController:(id)a3 isDisplayAssetEligibleForPlaybackWithSettlingEffect:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(PXPhotosUIViewController *)self viewModel];
  if ([v6 viewDelegateRespondsTo:0x10000])
  {
    id v7 = [v6 viewDelegate];
    char v8 = [v7 photosViewController:self isAssetEligibleForPlaybackWithSettlingEffect:v5];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)photosContentController:(id)a3 isDisplayAssetEligibleForAutoPlayback:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(PXPhotosUIViewController *)self viewModel];
  if ([v6 viewDelegateRespondsTo:0x2000])
  {
    id v7 = [v6 viewDelegate];
    char v8 = [v7 photosViewController:self isAssetEligibleForAutoPlayback:v5];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)photosContentController:(id)a3 canPlayAssetInline:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(PXPhotosUIViewController *)self viewModel];
  if ([v6 viewDelegateRespondsTo:4096])
  {
    id v7 = [v6 viewDelegate];
    char v8 = [v7 photosViewController:self canPlayAssetInline:v5];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)regionOfInterestForActionPerformer:(id)a3
{
  id v4 = [a3 actionType];
  id v5 = @"PXAssetActionTypeTrash";
  if (v4 == @"PXAssetActionTypeTrash")
  {
  }
  else
  {
    int v6 = [(__CFString *)v4 isEqualToString:@"PXAssetActionTypeTrash"];

    if (!v6)
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  char v8 = [(PXPhotosUIViewController *)self interaction];
  double v9 = [v8 navigatedAssetReference];

  id v7 = [(PXPhotosUIViewController *)self regionOfInterestForAssetReference:v9];

LABEL_6:
  return v7;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v5 = a3;
  int v6 = [v5 sender];
  int v7 = [v6 conformsToProtocol:&unk_1F02E1808];

  if (v7)
  {
    char v8 = [v5 sender];
    double v9 = +[PXViewControllerPresenter popoverPresenterWithViewController:self sourceItem:v8];

    if (v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  double v10 = [v5 selectionSnapshot];
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__201663;
  v30 = __Block_byref_object_dispose__201664;
  id v31 = 0;
  long long v11 = [v10 selectedIndexPaths];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  CGFloat v20 = __70__PXPhotosUIViewController_presentationEnvironmentForActionPerformer___block_invoke;
  uint64_t v21 = &unk_1E5DCF698;
  uint64_t v24 = &v26;
  id v12 = v10;
  SEL v25 = a2;
  id v22 = v12;
  v23 = self;
  [v11 enumerateItemIndexPathsUsingBlock:&v18];

  if (!v27[5]) {
    goto LABEL_8;
  }
  double v13 = -[PXPhotosUIViewController regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v18, v19, v20, v21);
  if (v13)
  {
    double v14 = [(PXPhotosUIViewController *)self gridView];
    [v13 rectInCoordinateSpace:v14];
    double v9 = +[PXViewControllerPresenter popoverPresenterWithViewController:sourceView:sourceRect:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceView:sourceRect:", self, v14);
  }
  else
  {
LABEL_8:
    double v9 = 0;
  }

  _Block_object_dispose(&v26, 8);
  if (!v9)
  {
LABEL_10:
    int v15 = [(PXPhotosUIViewController *)self barsController];
    int v16 = [v15 existingBarItemForIdentifier:@"PXBarItemIdentifierSelectModeMenu"];

    double v9 = +[PXViewControllerPresenter popoverPresenterWithViewController:self sourceItem:v16];
  }
LABEL_11:

  return v9;
}

void __70__PXPhotosUIViewController_presentationEnvironmentForActionPerformer___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0;

    *a3 = 1;
    return;
  }
  char v8 = [*(id *)(a1 + 32) dataSource];
  long long v9 = a2[1];
  v22[0] = *a2;
  v22[1] = v9;
  double v10 = [v8 objectReferenceAtIndexPath:v22];

  if (!v10)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    [v13 handleFailureInMethod:v14, v15, @"PXPhotosUIViewController.m", 2299, @"%@ should be an instance inheriting from %@, but it is nil", @"[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]", v17 object file lineNumber description];
LABEL_9:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 40);
    CGFloat v20 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v20);
    uint64_t v21 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:v18, v19, @"PXPhotosUIViewController.m", 2299, @"%@ should be an instance inheriting from %@, but it is %@", @"[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]", v17, v21 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_5:
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (UIEdgeInsets)maskPaddingForContentController:(id)a3
{
  secondaryToolbarController = self->_secondaryToolbarController;
  if (secondaryToolbarController)
  {
    [(PXSecondaryToolbarController *)secondaryToolbarController padding];
  }
  else
  {
    double v4 = *(double *)off_1E5DAAF10;
    double v5 = *((double *)off_1E5DAAF10 + 1);
    double v6 = *((double *)off_1E5DAAF10 + 2);
    double v7 = *((double *)off_1E5DAAF10 + 3);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)needsUpdateForContentController:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(PXPhotosUIViewController *)self navigationController];

  if (v6)
  {
    double v7 = [(PXPhotosUIViewController *)self navigationController];
    [v7 pushViewController:v5 animated:1];
  }
  return v6 != 0;
}

- (void)dismissPresentedViewControllerForContentController:(id)a3
{
}

- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4
{
  return 1;
}

- (id)presentationEnvironmentForPhotosBarsController:(id)a3 withSourceItem:(id)a4
{
  if (a4) {
    [(PXPhotosUIViewController *)self _popoverPresentationEnvironmentWithSourceItem:a4];
  }
  else {
  double v4 = [(PXPhotosUIViewController *)self _defaultPresentationEnvironment];
  }
  return v4;
}

- (void)_showSearch
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPhotosUIViewController *)self createSearchOverlayController];
  if (!v3)
  {
    double v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = [(PXPhotosUIViewController *)self currentDataSource];
      int v8 = 138412290;
      long long v9 = v7;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Can't get a search overlay view controller (data source: %@).", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_7;
  }
  double v4 = [(PXPhotosUIViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    double v6 = objc_msgSend(v3, "px_createViewControllerWithHiddenStatusBarForMainViewController:", v3);
    [v6 setModalPresentationStyle:5];
    [v6 setModalPresentationCapturesStatusBarAppearance:1];
    [(PXPhotosUIViewController *)self presentViewController:v6 animated:0 completion:0];
LABEL_7:

    goto LABEL_8;
  }
  [v3 setModalPresentationStyle:5];
  [(PXPhotosUIViewController *)self presentViewController:v3 animated:0 completion:0];
LABEL_8:
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.search.session" withPayload:MEMORY[0x1E4F1CC08]];
}

- (void)photosBarsController:(id)a3 didRequestDismissWithSender:(id)a4
{
  id v12 = a4;
  uint64_t v5 = [(PXPhotosUIViewController *)self configuration];
  double v6 = [v5 customDismissHandler];

  if (v6)
  {
    double v7 = [(PXPhotosUIViewController *)self configuration];
    int v8 = [v7 customDismissHandler];
    v8[2]();

LABEL_3:
    goto LABEL_6;
  }
  long long v9 = [(PXPhotosUIViewController *)self presentingViewController];

  if (v9)
  {
    [(PXPhotosUIViewController *)self modalDismiss:v12];
  }
  else
  {
    uint64_t v10 = [(PXPhotosUIViewController *)self navigationController];

    if (v10)
    {
      double v7 = [(PXPhotosUIViewController *)self navigationController];
      id v11 = (id)[v7 popViewControllerAnimated:1];
      goto LABEL_3;
    }
  }
LABEL_6:
}

- (void)photosBarsControllerDidUpdateNavigationItemAppearance:(id)a3
{
  double v4 = [(PXPhotosUIViewController *)self gridPresentationBarsUpdateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PXPhotosUIViewController *)self gridPresentationBarsUpdateDelegate];
    [v6 viewControllerDidUpdateNavigationItemAppearance:self];
  }
}

- (void)photosBarsControllerDidUpdateBars:(id)a3
{
  double v4 = [(PXPhotosUIViewController *)self gridPresentationBarsUpdateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(PXPhotosUIViewController *)self gridPresentationBarsUpdateDelegate];
    id v6 = [(PXPhotosUIViewController *)self viewModel];
    objc_msgSend(v7, "viewController:didUpdateBarsAnimated:isSelecting:", self, 0, objc_msgSend(v6, "isInSelectMode"));
  }
}

- (id)menuForPXAssetCollectionActionTypeTTRForLemonadeCollections
{
  if (PFOSVariantHasInternalUI())
  {
    id v3 = [(PXPhotosUIViewController *)self viewModel];
    double v4 = [v3 selectionSnapshot];
    if ([v4 isAnyItemSelected])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = [v3 selectionSnapshot];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __87__PXPhotosUIViewController_menuForPXAssetCollectionActionTypeTTRForLemonadeCollections__block_invoke;
      v17[3] = &unk_1E5DC44A8;
      id v18 = v5;
      id v7 = v5;
      [v6 enumerateSelectedObjectsUsingBlock:v17];

      int v8 = [(PXPhotosUIViewController *)self interaction];
      long long v9 = [v8 navigatedAssetReference];
      uint64_t v10 = [v9 assetCollection];
      id v11 = [v10 localizedTitle];

      id v12 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v7 title:v11];
      double v13 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v12 displayTitleInfo:0];
      selectedAssetsAssetCollectionActionManager = self->_selectedAssetsAssetCollectionActionManager;
      self->_selectedAssetsAssetCollectionActionManager = v13;

      [(PXActionManager *)self->_selectedAssetsAssetCollectionActionManager setPerformerDelegate:self];
      uint64_t v15 = [(PXPhotoKitAssetCollectionActionManager *)self->_selectedAssetsAssetCollectionActionManager standardActionForActionType:@"PXAssetCollectionActionTypeTTRForLemonadeCollections"];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

void __87__PXPhotosUIViewController_menuForPXAssetCollectionActionTypeTTRForLemonadeCollections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)barsControllerActionsForSelectionContextMenu:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  double v4 = [(PXPhotosUIViewController *)self viewModel];
  id v5 = [v4 selectionSnapshot];
  id v6 = [v4 currentDataSource];
  id v7 = [v6 containerCollection];

  char v8 = objc_msgSend(v7, "px_isRecentlyDeletedSmartAlbum");
  int v9 = objc_msgSend(v7, "px_isRecoveredSmartAlbum");
  int v10 = [v5 isAnyItemSelected];
  if (((v10 & 1) != 0 || (v8 & 1) != 0 || v9) && [v4 allowsMultiSelectMenu])
  {
    if (v10)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      if (v5) {
        [v5 firstSelectedIndexPath];
      }
      id v11 = [v5 dataSource];
      v21[0] = v22;
      v21[1] = v23;
      id v12 = [v11 objectReferenceAtIndexPath:v21];
      double v13 = [(PXPhotosUIViewController *)self interaction];
      [v13 setNavigatedAssetReference:v12];
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v15 = [(PXPhotosUIViewController *)self assetActionManager];
    v24[0] = @"PXAssetActionTypeShare";
    v24[1] = @"PXAssetActionTypeTrash";
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    double v17 = +[PXAssetActionMenuBuilder menuElementsForActionManager:v15 excludedActionTypes:v16];
    id v18 = [v14 arrayWithArray:v17];

    uint64_t v19 = [(PXPhotosUIViewController *)self menuForPXAssetCollectionActionTypeTTRForLemonadeCollections];
    if (v19) {
      [v18 insertObject:v19 atIndex:0];
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (NSString)passcodeAuthenticationReason
{
  id v3 = PXLocalizedStringFromTable(@"PXContentPrivacyAuthenticationPasscodeReason_Generic", @"PhotosUICore");
  double v4 = [(PXPhotosUIViewController *)self viewModel];
  id v5 = [v4 dataSourceManager];
  id v6 = [v5 dataSource];
  id v7 = [v6 containerCollection];

  int v8 = objc_msgSend(v7, "px_isHiddenSmartAlbum");
  int v9 = objc_msgSend(v7, "px_isRecentlyDeletedSmartAlbum");
  int v10 = objc_msgSend(v7, "px_isRecoveredSmartAlbum");
  if ((v8 & 1) != 0 || (v9 & 1) != 0 || v10)
  {
    id v11 = @"PXContentPrivacyAuthenticationPasscodeReason_Recovered";
    if (v9) {
      id v11 = @"PXContentPrivacyAuthenticationPasscodeReason_RecentlyDeleted";
    }
    if (v8) {
      id v12 = @"PXContentPrivacyAuthenticationPasscodeReason_Hidden";
    }
    else {
      id v12 = v11;
    }
    uint64_t v13 = PXLocalizedStringFromTable(v12, @"PhotosUICore");

    id v3 = (void *)v13;
  }

  return (NSString *)v3;
}

- (NSString)authenticationTitle
{
  id v2 = [(PXPhotosUIViewController *)self viewModel];
  id v3 = [v2 dataSourceManager];
  double v4 = [v3 dataSource];
  id v5 = [v4 containerCollection];

  int v6 = objc_msgSend(v5, "px_isHiddenSmartAlbum");
  int v7 = objc_msgSend(v5, "px_isRecentlyDeletedSmartAlbum");
  int v8 = objc_msgSend(v5, "px_isRecoveredSmartAlbum");
  int v9 = @"PXContentPrivacyAuthenticationTouchIDTitle_Generic";
  if (v8) {
    int v9 = @"PXContentPrivacyAuthenticationTouchIDTitle_Recovered";
  }
  if (v7) {
    int v9 = @"PXContentPrivacyAuthenticationTouchIDTitle_RecentlyDeleted";
  }
  if (v6) {
    int v10 = @"PXContentPrivacyAuthenticationTouchIDTitle_Hidden";
  }
  else {
    int v10 = v9;
  }
  id v11 = PXLocalizedStringFromTable(v10, @"PhotosUICore");

  return (NSString *)v11;
}

- (void)_waitUntilOneUpPresentationCanStartAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIViewController *)self px_oneUpPresentation];
  [v7 waitUntilPresentationCanStartAnimated:v4 completionHandler:v6];
}

- (void)navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  if (a5) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  int v16 = [[PXProgrammaticNavigationDestination alloc] initWithType:7 revealMode:v11 asset:v14 assetCollection:v13];

  if (v7) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [(PXPhotosUIViewController *)self navigateToDestination:v16 options:v15 completionHandler:v12];
}

- (void)navigateToAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [PXProgrammaticNavigationDestination alloc];
  id v6 = [v4 asset];
  BOOL v7 = [v4 assetCollection];

  int v8 = [(PXProgrammaticNavigationDestination *)v5 initWithType:7 revealMode:2 asset:v6 assetCollection:v7];
  [(PXPhotosUIViewController *)self navigateToDestination:v8 options:0 completionHandler:&__block_literal_global_802];
}

- (void)_waitForAvailabilityOfAsset:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  if (v13)
  {
    id v6 = a4;
    BOOL v7 = +[PXApplicationSettings sharedInstance];
    [v7 defaultNavigationTimeoutDuration];
    double v9 = v8;

    id v10 = [(PXPhotosUIViewController *)self viewModel];
    uint64_t v11 = [v10 dataSourceManager];
    [v11 waitForAvailabilityOfAsset:v13 timeout:v6 completionHandler:v9];
  }
  else
  {
    id v12 = (void (*)(void))*((void *)a4 + 2);
    id v10 = a4;
    v12();
  }
}

- (id)px_navigationDestination
{
  id v2 = [(PXPhotosUIViewController *)self currentDataSource];
  id v3 = [v2 containerCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;

    if (v4)
    {
      id v5 = [[PXProgrammaticNavigationDestination alloc] initWithObject:v4 revealMode:0];
      goto LABEL_7;
    }
  }
  else
  {

    id v4 = 0;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)_completeNavigationToDestination:(id)a3 result:(int64_t)a4 error:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([v8 type] == 8 && objc_msgSend(v8, "assetCollectionSubtype") == 218)
  {
    if ([v8 renderAlbumAssetsWithDeferredProcessing])
    {
      id v10 = [(PXPhotosUIViewController *)self currentDataSource];
      uint64_t v11 = [v10 containerCollection];
      int v12 = objc_msgSend(v11, "px_isCinematicSmartAlbum");

      if (v12)
      {
        if (a4 == 1)
        {
          id v13 = (void *)MEMORY[0x1E4F56658];
          uint64_t v25 = *MEMORY[0x1E4F56560];
          id v14 = (objc_class *)objc_opt_class();
          uint64_t v15 = NSStringFromClass(v14);
          v26[0] = v15;
          int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
          [v13 sendEvent:@"com.apple.photos.CPAnalytics.navigateToCinematicAlbumWithRender" withPayload:v16];

          double v17 = [(PXPhotosUIViewController *)self viewModel];
          id v18 = [v17 dataSourceManager];
          uint64_t v19 = [v18 dataSource];
          CGFloat v20 = [v19 containerCollection];

          if ([v20 conformsToProtocol:&unk_1F0352298])
          {
            uint64_t v21 = v20;
            long long v22 = PXCreateDefaultAssetSharingHelper(self);
            [v22 ensureRenderingForAssetsWithDeferredProcessingInCollection:v21 completion:&__block_literal_global_797];
          }
          else
          {
            long long v22 = PLGridZeroGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v23) = 0;
              _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "PXPhotosUIViewController: Navigation to cinematic album failed, data source collection is not an asset collection.", (uint8_t *)&v23, 2u);
            }
          }
        }
        else
        {
          CGFloat v20 = PLGridZeroGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            int v23 = 138412290;
            id v24 = v9;
            _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "PXPhotosUIViewController: Navigation to cinematic album failed. with error %@", (uint8_t *)&v23, 0xCu);
          }
        }
      }
    }
  }
}

void __74__PXPhotosUIViewController__completeNavigationToDestination_result_error___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = PLGridZeroGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotosUIViewController: Cinematic local asset rendering did not complete: It failed or was cancelled.", v3, 2u);
    }
  }
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5DC43A0;
  objc_copyWeak(&v47, &location);
  id v9 = v7;
  id v45 = v9;
  id v10 = v8;
  id v46 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  if (![(PXPhotosUIViewController *)self isViewLoaded]) {
    goto LABEL_20;
  }
  int v12 = [(PXPhotosUIViewController *)self viewModel];
  if ([v12 appearState])
  {

    goto LABEL_5;
  }
  BOOL v13 = [(PXPhotosUIViewController *)self hasScrolledToInitialPosition];

  if (!v13)
  {
LABEL_20:
    id v31 = [(PXPhotosUIViewController *)self pendingInitialNavigationRequest];
    [v31 cancel];

    double v32 = [[PXProgrammaticNavigationRequest alloc] initWithDestination:v9 options:a4 completionHandler:v11];
    [(PXPhotosUIViewController *)self setPendingInitialNavigationRequest:v32];

    goto LABEL_29;
  }
LABEL_5:
  id v14 = [v9 sidebarBackNavigationRootDestination];
  uint64_t v15 = [v14 collection];
  int v16 = [(PXPhotosUIViewController *)self currentDataSource];
  double v17 = [v16 containerCollection];
  int v18 = [v15 isEqual:v17];

  if (v18)
  {
    uint64_t v19 = [(PXPhotosUIViewController *)self navigationItem];
    objc_msgSend(v19, "px_setHidesBackButtonInRegularWidth:", 1);
    CGFloat v20 = [(PXPhotosUIViewController *)self traitCollection];
    objc_msgSend(v19, "px_updateBackButtonVisibilityForTraitCollection:", v20);

    [(PXPhotosUIViewController *)self _updateBackButtonBehavior];
  }
  uint64_t v21 = [(PXPhotosUIViewController *)self viewModel];
  [v21 performChanges:&__block_literal_global_420];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3;
  v43[3] = &unk_1E5DC43C8;
  v43[4] = self;
  double v35 = _Block_copy(v43);
  long long v22 = [v9 asset];
  if ([v9 type] == 7 && objc_msgSend(v9, "revealMode") != 2) {
    goto LABEL_19;
  }
  if ([v9 type] == 6 && objc_msgSend(v9, "revealMode") == 1)
  {
    int v23 = [(PXPhotosUIViewController *)self viewModel];
    id v24 = [v23 viewOptionsModel];
    uint64_t v25 = [v24 sortOrderState];

    if (v25 && [v25 sortOrder] != 2) {
      [v25 performChanges:&__block_literal_global_426_201720];
    }
    uint64_t v26 = [(PXPhotosUIViewController *)self currentDataSource];
    double v27 = v26;
    long long v41 = 0u;
    long long v42 = 0u;
    if (!v26
      || ([v26 lastItemIndexPath], (void)v41 == *(void *)off_1E5DAAED8)
      || (void)v42 == 0x7FFFFFFFFFFFFFFFLL
      || *((void *)&v42 + 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      PXAssertGetLog();
    }
    buf[0] = v41;
    buf[1] = v42;
    uint64_t v28 = [v27 assetAtItemIndexPath:buf];

    long long v22 = (void *)v28;
LABEL_19:
    v29 = v40;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_427;
    v40[3] = &unk_1E5DC4460;
    v40[7] = v35;
    id v30 = v22;
    v40[4] = v30;
    v40[5] = self;
    v40[6] = v9;
    v40[10] = a4;
    v40[8] = v10;
    v40[9] = v11;
    [(PXPhotosUIViewController *)self _waitForAvailabilityOfAsset:v30 completionHandler:v40];
LABEL_24:
    double v33 = (id *)(v29 + 7);

    double v34 = (void *)v29[4];
    goto LABEL_25;
  }
  if (v22)
  {
    v29 = v39;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_4_440;
    v39[3] = &unk_1E5DC4460;
    v39[7] = v35;
    id v30 = v22;
    v39[4] = v30;
    v39[5] = self;
    v39[6] = v9;
    v39[10] = a4;
    v39[8] = v10;
    v39[9] = v11;
    [(PXPhotosUIViewController *)self _waitForAvailabilityOfAsset:v30 completionHandler:v39];
    goto LABEL_24;
  }
  if ([v9 revealMode] != 3)
  {
    (*((void (**)(void *, uint64_t, void))v11 + 2))(v11, 1, 0);
    id v30 = 0;
    goto LABEL_26;
  }
  double v34 = [(PXPhotosUIViewController *)self contentController];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_445;
  v37[3] = &unk_1E5DCCA98;
  id v38 = v11;
  [v34 scrollToInitialPositionAnimated:(a4 >> 1) & 1 withCompletionHandler:v37];
  id v30 = 0;
  double v33 = &v38;
LABEL_25:

LABEL_26:
  if ([v9 type] == 8) {
    [v9 displayAlbumOptions];
  }

LABEL_29:
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completeNavigationToDestination:*(void *)(a1 + 32) result:a2 error:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 photoLibrary];
    id v5 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v4];

    if ([v5 hasSharedLibraryOrPreview])
    {
      id v6 = [*(id *)(a1 + 32) viewModel];
      id v7 = [v6 libraryFilterState];
      BOOL v8 = [v7 viewMode] != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_427(uint64_t a1, char a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (*(void *)(a1 + 80) >> 1) & 1;
    id v7 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_428;
    v17[3] = &unk_1E5DC4438;
    id v8 = *(id *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    id v20 = v8;
    void v17[4] = v9;
    id v18 = v10;
    id v19 = v5;
    char v21 = v6;
    [v7 _waitUntilOneUpPresentationCanStartAnimated:v6 completionHandler:v17];
  }
  else if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    uint64_t v11 = [*(id *)(a1 + 40) viewModel];
    int v12 = [v11 libraryFilterState];
    [v12 setViewMode:0];

    [*(id *)(a1 + 40) navigateToDestination:*(void *)(a1 + 48) options:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    BOOL v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Photos view %@ timed out waiting for asset %@ to go to 1-up for navigation destination %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_4_440(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 40) contentController];
    uint64_t v7 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_441;
    v14[3] = &unk_1E5DCD158;
    id v16 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 32);
    [v6 scrollToRevealAsset:v7 completionHandler:v14];
  }
  else if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    id v8 = [*(id *)(a1 + 40) viewModel];
    uint64_t v9 = [v8 libraryFilterState];
    [v9 setViewMode:0];

    [*(id *)(a1 + 40) navigateToDestination:*(void *)(a1 + 48) options:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Photos view %@ timed out waiting for asset %@ to reveal navigation destination %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_445(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"failed to scroll to initial position");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, 5, v5);
  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_441(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"failed to scroll to reveal asset %@", *(void *)(a1 + 32));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, 5, v5);
  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_428(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) wantsEditMode];
    uint64_t v4 = [*(id *)(a1 + 40) completionKey];
    id v5 = [*(id *)(a1 + 32) interaction];
    uint64_t v6 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_433;
    void v12[3] = &unk_1E5DC4410;
    char v15 = *(unsigned char *)(a1 + 64);
    id v13 = v4;
    uint64_t v14 = v3;
    id v7 = v4;
    LOBYTE(v6) = [v5 presentOneUpForAssetReference:v6 configurationHandler:v12];

    uint64_t v8 = *(void *)(a1 + 56);
    if (v6)
    {
      (*(void (**)(void, uint64_t, void))(v8 + 16))(*(void *)(a1 + 56), 1, 0);
    }
    else
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"failed to present 1-up for %@", *(void *)(a1 + 48));
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, 5, v10);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"unable to present 1-up from %@", *(void *)(a1 + 32));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 5, v11);
  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_433(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  [v4 setAnimated:v3];
  [v4 setActivity:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3_434;
  v5[3] = &unk_1E5DD36F8;
  id v6 = *(id *)(a1 + 32);
  [v4 setActivityCompletion:v5];
}

void *__76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3_434(uint64_t a1)
{
  UIEdgeInsets result = *(void **)(a1 + 32);
  if (result)
  {
    uint64_t v2 = (const char *)[result UTF8String];
    return (void *)notify_post(v2);
  }
  return result;
}

uint64_t __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setSortOrder:2];
}

uint64_t __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resetToInitialSelectionAndFilteringState];
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosUIViewController *)self currentDataSource];
  id v6 = [v5 containerCollection];
  uint64_t v7 = [v4 type];
  if ((unint64_t)(v7 - 5) < 2)
  {
    unsigned int v13 = objc_msgSend(v6, "px_isAllPhotosSmartAlbum");
  }
  else if ((unint64_t)(v7 - 7) > 1)
  {
    unsigned int v13 = 0;
  }
  else
  {
    uint64_t v8 = [v4 assetCollection];
    if (v8)
    {
      id v9 = objc_alloc((Class)off_1E5DA55C0);
      long long v10 = *((_OWORD *)off_1E5DAB028 + 1);
      v20[0] = *(_OWORD *)off_1E5DAB028;
      v20[1] = v10;
      id v11 = (void *)[v9 initWithAssetCollection:v8 keyAssetReference:0 indexPath:v20];
      if ([v8 isEqual:v6]) {
        goto LABEL_17;
      }
      if (v5)
      {
        [v5 indexPathForAssetCollectionReference:v11];
        uint64_t v12 = v18;
      }
      else
      {
        uint64_t v12 = 0;
        long long v18 = 0u;
        long long v19 = 0u;
      }
      if (v12 != *(void *)off_1E5DAAED8) {
        goto LABEL_17;
      }
      if (!objc_msgSend(v8, "px_isRecentsSmartAlbum")) {
        goto LABEL_26;
      }
      if (!objc_msgSend(v6, "px_isAllPhotosSmartAlbum")) {
        goto LABEL_26;
      }
      uint64_t v14 = [(PXPhotosUIViewController *)self viewModel];
      char v15 = [v14 viewOptionsModel];
      id v16 = [v15 sortOrderState];

      if (v16)
      {
LABEL_17:
        unsigned int v13 = 1;
      }
      else
      {
LABEL_26:
        if (objc_msgSend(v8, "px_isFeaturedPhotosCollection", v18, v19)) {
          unsigned int v13 = objc_msgSend(v6, "px_isFeaturedPhotosCollection");
        }
        else {
          unsigned int v13 = 0;
        }
      }
    }
    else if ([v4 type] == 7)
    {
      unsigned int v13 = objc_msgSend(v6, "px_isAllPhotosSmartAlbum");
    }
    else
    {
      unsigned int v13 = 0;
    }
  }
  return v13;
}

- (PXActionManager)assetActionManager
{
  uint64_t v2 = [(PXPhotosUIViewController *)self viewModel];
  uint64_t v3 = [v2 assetActionManager];

  return (PXActionManager *)v3;
}

- (BOOL)resetToInitialStateIfPossible
{
  BOOL v3 = [(PXPhotosUIViewController *)self canResetToInitialState];
  if (v3)
  {
    id v4 = [(PXPhotosUIViewController *)self viewModel];
    [v4 performChanges:&__block_literal_global_417_201745];

    [(PXPhotosUIViewController *)self _scrollToInitialPositionAnimated:0];
  }
  return v3;
}

void __57__PXPhotosUIViewController_resetToInitialStateIfPossible__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v2 = (double)[v4 defaultZoomStep];
  [v4 zoomStep];
  if (v3 != v2) {
    [v4 setZoomStep:0 isInteractive:0 shouldAnimate:0 anchorAssetReference:v2];
  }
  [v4 signalChange:0x400000000000000];
}

- (BOOL)canResetToInitialState
{
  double v3 = [(PXPhotosUIViewController *)self viewModel];
  if (![(PXPhotosUIViewController *)self isViewLoaded]) {
    goto LABEL_5;
  }
  id v4 = [v3 selectionSnapshot];
  char v5 = [v4 isAnyItemSelected];

  if ((v5 & 1) != 0
    || -[UIViewController px_containsViewControllerModalInPresentation](self, "px_containsViewControllerModalInPresentation")|| (-[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation"), id v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 state], v6, v7))
  {
LABEL_5:
    BOOL v8 = 0;
  }
  else
  {
    long long v10 = [(PXPhotosUIViewController *)self presentedViewController];
    BOOL v8 = v10 == 0;
  }
  return v8;
}

- (BOOL)scrollToBottomAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = [(PXPhotosUIViewController *)self isViewLoaded];
  if (v5)
  {
    id v6 = [(PXPhotosUIViewController *)self scrollView];
    char v7 = objc_msgSend(v6, "px_isScrolledAtEdge:", 3);

    if ((v7 & 1) == 0)
    {
      BOOL v8 = [(PXPhotosUIViewController *)self scrollView];
      objc_msgSend(v8, "px_scrollToEdge:animated:", 3, v3);

      id v9 = (void *)MEMORY[0x1E4F56658];
      uint64_t v14 = *MEMORY[0x1E4F56560];
      long long v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      v15[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v9 sendEvent:@"com.apple.photos.CPAnalytics.viewScrolledToBottom" withPayload:v12];
    }
    LOBYTE(v5) = v7 ^ 1;
  }
  return v5;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PXPhotosUIViewController *)self isViewLoaded];
  if (v5)
  {
    id v6 = [(PXPhotosUIViewController *)self contentController];
    [v6 scrollToInitialPositionAnimated:v3 withCompletionHandler:0];
  }
  return v5;
}

- (NSArray)visibleUUIDs
{
  double v2 = [(PXPhotosUIViewController *)self contentController];
  BOOL v3 = [v2 visibleAssetsIterator];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__PXPhotosUIViewController_visibleUUIDs__block_invoke;
  v9[3] = &unk_1E5DC4370;
  id v10 = v4;
  int v5 = (void (*)(void *, void *))v3[2];
  id v6 = v4;
  v5(v3, v9);
  char v7 = (void *)[v6 copy];

  return (NSArray *)v7;
}

void __40__PXPhotosUIViewController_visibleUUIDs__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

- (id)pu_debugCurrentPrivacyController
{
  return self->_privacyController;
}

- (id)pu_debugCurrentlySelectedAssets
{
  double v2 = [(PXPhotosUIViewController *)self viewModel];
  id v3 = [v2 selectionManager];

  id v4 = [v3 selectionSnapshot];
  int v5 = [v4 allItemsEnumerator];

  return v5;
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  if ([v3 navBarStyle])
  {
    char v4 = 0;
  }
  else
  {
    int v5 = [(PXPhotosUIViewController *)self viewModel];
    char v4 = [v5 shouldOptOutOfChromelessBars];
  }
  return v4;
}

- (id)preferredFocusEnvironments
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPhotosUIViewController *)self contentController];
  char v4 = [v3 layout];

  int v5 = [(PXPhotosUIViewController *)self preferredFocusAssetReference];
  if (v5)
  {
    id v6 = [v4 axLeafForObjectReference:v5];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [v4 axGroup];
  BOOL v8 = (void *)v7;
  if (v6)
  {
    char v15 = v6;
    uint64_t v16 = v7;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = (uint64_t *)&v15;
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v14 = v7;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = &v14;
    uint64_t v11 = 1;
  }
  uint64_t v12 = objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v14, v15, v16);

  return v12;
}

- (void)playCollectionAsMemory
{
  double v2 = [(PXPhotosUIViewController *)self viewModel];
  id v3 = [v2 assetCollectionActionManager];
  id v4 = [v3 actionPerformerForActionType:@"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer"];

  [v4 performActionWithCompletionHandler:0];
}

- (void)modalDismiss:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self presentingViewController];
  if (!v3) {
    PXAssertGetLog();
  }
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelSelectMode:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  [v3 performChanges:&__block_literal_global_411_201749];
}

uint64_t __45__PXPhotosUIViewController_cancelSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsInSelectMode:0];
}

- (void)deselectAll:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  [v3 performChanges:&__block_literal_global_409_201751];
}

uint64_t __40__PXPhotosUIViewController_deselectAll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)selectAll:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  if ([v3 allowsSelectAllAction]) {
    [v3 performChanges:&__block_literal_global_407];
  }
}

void __38__PXPhotosUIViewController_selectAll___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 attemptSetInSelectMode:1]) {
    [v2 selectAll];
  }
}

- (void)addAssetsToAlbum:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  id v4 = [v3 assetCollectionActionManager];
  id v5 = [v4 actionPerformerForActionType:@"PXAssetCollectionActionTypeAddFrom"];

  [v5 performActionWithCompletionHandler:0];
}

- (void)toggleFilter:(id)a3
{
  id v4 = PXNumberPropertyFromCommand(a3);
  uint64_t v5 = [v4 integerValue];
  if ((unint64_t)(v5 - 1) > 3) {
    id v6 = &stru_1F00B0030;
  }
  else {
    id v6 = off_1E5DC2A78[v5 - 1];
  }
  BOOL v8 = v6;

  uint64_t v7 = [(PXPhotosUIViewController *)self interaction];
  [v7 performActionWithType:v8];
}

- (void)toggleViewMode:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self interaction];
  [v3 performActionWithType:@"PXPhotosGridActionToggleAspectFit"];
}

- (void)toggleEditMode:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self interaction];
  [v3 toggleSelectMode];
}

- (void)zoomOut:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self interaction];
  [v3 performActionWithType:@"PXPhotosGridActionZoomOut"];
}

- (void)zoomIn:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self interaction];
  [v3 performActionWithType:@"PXPhotosGridActionZoomIn"];
}

- (void)toggleViewer:(id)a3
{
}

- (void)openSelectionWithCommandDownArrow:(id)a3
{
}

- (void)paste:(id)a3
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  id v4 = [v3 currentDataSource];
  uint64_t v5 = v4;
  if (v4) {
    [v4 firstSectionIndexPath];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  id v6 = [v5 assetCollectionReferenceAtSectionIndexPath:v11];
  uint64_t v7 = [v3 assetCollectionActionManager];
  BOOL v8 = [v7 actionPerformerForActionType:@"PXAssetCollectionActionTypePasteAssets" assetCollectionReference:v6];

  if (v8)
  {
    [v8 performActionWithCompletionHandler:&__block_literal_global_405];
  }
  else
  {
    id v9 = PLGridZeroGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Unable to paste assets.", v10, 2u);
    }
  }
}

void __34__PXPhotosUIViewController_paste___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = PLGridZeroGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Paste of assets failed with error:%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)validateCommand:(id)a3
{
  id v13 = a3;
  if ((char *)[v13 action] == sel_toggleEditMode_)
  {
    id v4 = [(PXPhotosUIViewController *)self viewModel];
    if ([(__CFString *)v4 isInSelectMode]) {
      uint64_t v8 = @"PXPhotosGridCancel";
    }
    else {
      uint64_t v8 = @"PXPhotosGridSelect";
    }
    uint64_t v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
    goto LABEL_12;
  }
  if ((char *)[v13 action] == sel_toggleViewMode_)
  {
    id v4 = [(PXPhotosUIViewController *)self interaction];
    uint64_t v9 = [(__CFString *)v4 discoverabilityTitleForActionType:@"PXPhotosGridActionToggleAspectFit"];
LABEL_12:
    uint64_t v5 = (void *)v9;
    [v13 setDiscoverabilityTitle:v9];
LABEL_19:

    goto LABEL_20;
  }
  if ((char *)[v13 action] == sel_toggleFilter_)
  {
    id v10 = PXNumberPropertyFromCommand(v13);
    uint64_t v11 = [v10 integerValue];
    if ((unint64_t)(v11 - 1) > 3) {
      uint64_t v12 = &stru_1F00B0030;
    }
    else {
      uint64_t v12 = off_1E5DC2A78[v11 - 1];
    }
    id v4 = v12;

    uint64_t v5 = [(PXPhotosUIViewController *)self interaction];
    int v6 = [v5 discoverabilityTitleForActionType:v4];
    [v13 setDiscoverabilityTitle:v6];
LABEL_18:

    goto LABEL_19;
  }
  if ((char *)[v13 action] != sel_addAssetsToAlbum_)
  {
    if ((char *)[v13 action] != sel_addAssetsToLastUsedAlbum_) {
      goto LABEL_21;
    }
    id v4 = [(PXPhotosUIViewController *)self viewModel];
    uint64_t v5 = [(__CFString *)v4 assetActionManager];
    int v6 = [v5 actionPerformerForActionType:@"PXAssetActionTypeAddToLastUsedAlbum"];
    id v7 = [v6 localizedTitleForUseCase:1];
    [v13 setDiscoverabilityTitle:v7];

    goto LABEL_18;
  }
  PXLocalizedStringFromTable(@"PXPhotosGridAddPhotosActionMenuTitle", @"PhotosUICore");
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v13 setDiscoverabilityTitle:v4];
LABEL_20:

LABEL_21:
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(PXPhotosUIViewController *)self interaction];
  uint64_t v8 = [v7 targetForKeyCommands];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(PXPhotosUIViewController *)self interaction];
    uint64_t v11 = [v10 targetForKeyCommands];
  }
  else
  {
    uint64_t v12 = [(PXPhotosUIViewController *)self assetActionManager];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(PXPhotosUIViewController *)self assetActionManager];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)PXPhotosUIViewController;
      uint64_t v14 = [(PXPhotosUIViewController *)&v16 targetForAction:a3 withSender:v6];
    }
    uint64_t v11 = (void *)v14;
  }

  return v11;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(PXPhotosUIViewController *)self viewModel];
  uint64_t v8 = v7;
  if (sel_paste_ == a3)
  {
    uint64_t v11 = [v7 currentDataSource];
    if ([v11 numberOfSections] != 1)
    {
      BOOL v10 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (v11) {
      [v11 firstSectionIndexPath];
    }
    else {
      memset(v26, 0, sizeof(v26));
    }
    uint64_t v17 = [v11 assetCollectionReferenceAtSectionIndexPath:v26];
    long long v18 = [v8 assetCollectionActionManager];
    char v19 = [(__CFString *)v18 canPerformActionType:@"PXAssetCollectionActionTypePasteAssets" assetCollectionReference:v17];
LABEL_29:
    BOOL v10 = v19;

    goto LABEL_35;
  }
  if (sel_addAssetsToAlbum_ == a3)
  {
    uint64_t v12 = [v7 assetCollectionActionManager];
    uint64_t v11 = v12;
    char v13 = @"PXAssetCollectionActionTypeAddFrom";
    goto LABEL_33;
  }
  if (sel_openSelectionWithCommandDownArrow_ != a3 && sel_toggleViewer_ != a3)
  {
    if (sel_zoomIn_ == a3)
    {
      uint64_t v12 = [(PXPhotosUIViewController *)self interaction];
      uint64_t v11 = v12;
      char v13 = @"PXPhotosGridActionZoomIn";
    }
    else if (sel_zoomOut_ == a3)
    {
      uint64_t v12 = [(PXPhotosUIViewController *)self interaction];
      uint64_t v11 = v12;
      char v13 = @"PXPhotosGridActionZoomOut";
    }
    else
    {
      if (sel_toggleViewMode_ != a3)
      {
        if (sel_toggleFilter_ != a3)
        {
          if (sel_toggleEditMode_ == a3)
          {
            uint64_t v11 = [(PXPhotosUIViewController *)self interaction];
            char v16 = [v11 canToggleSelectMode];
            goto LABEL_34;
          }
          if (sel_cancelSelectMode_ == a3)
          {
            unsigned __int8 v24 = [v7 canExitSelectMode];
            goto LABEL_47;
          }
          if (sel_selectAll_ != a3)
          {
            if (sel_deselectAll_ == a3)
            {
              uint64_t v11 = [v7 selectionSnapshot];
              char v16 = [v11 isAnyItemSelected];
              goto LABEL_34;
            }
            uint64_t v14 = [(PXPhotosUIViewController *)self assetActionManager];
            char v15 = objc_opt_respondsToSelector();

            if (v15)
            {
              uint64_t v11 = [(PXPhotosUIViewController *)self assetActionManager];
              char v16 = [v11 canPerformAction:a3 withSender:v6];
LABEL_34:
              BOOL v10 = v16;
              goto LABEL_35;
            }
            v25.receiver = self;
            v25.super_class = (Class)PXPhotosUIViewController;
            unsigned __int8 v24 = [(PXPhotosUIViewController *)&v25 canPerformAction:a3 withSender:v6];
LABEL_47:
            BOOL v10 = v24;
            goto LABEL_36;
          }
          if ([v7 canEnterSelectMode])
          {
            unsigned __int8 v24 = [v8 allowsSelectAllAction];
            goto LABEL_47;
          }
          goto LABEL_10;
        }
        uint64_t v11 = [(PXPhotosUIViewController *)self interaction];
        uint64_t v17 = PXNumberPropertyFromCommand(v6);
        uint64_t v22 = [v17 integerValue];
        if ((unint64_t)(v22 - 1) > 3) {
          uint64_t v23 = &stru_1F00B0030;
        }
        else {
          uint64_t v23 = off_1E5DC2A78[v22 - 1];
        }
        long long v18 = v23;
        char v19 = [v11 canPerformActionType:v18];
        goto LABEL_29;
      }
      uint64_t v12 = [(PXPhotosUIViewController *)self interaction];
      uint64_t v11 = v12;
      char v13 = @"PXPhotosGridActionToggleAspectFit";
    }
LABEL_33:
    char v16 = [v12 canPerformActionType:v13];
    goto LABEL_34;
  }
  if ([v7 canPresentOneUp] && (objc_msgSend(v8, "isInSelectMode") & 1) == 0)
  {
    uint64_t v20 = [v8 singleSelectedAssetReference];
    BOOL v10 = v20 != 0;

    goto LABEL_36;
  }
LABEL_10:
  BOOL v10 = 0;
LABEL_36:

  return v10;
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = [(PXPhotosUIViewController *)self navigationController];
  id v3 = [v2 firstResponder];

  if (v3)
  {
    id v4 = [v2 firstResponder];
    char v5 = [v4 _containsResponder:v2];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (int64_t)userInterfaceFeature
{
  return 5;
}

- (void)px_containedViewControllerModalStateChanged
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosUIViewController;
  [(UIViewController *)&v4 px_containedViewControllerModalStateChanged];
  id v3 = [(PXPhotosUIViewController *)self dismissalInteractionController];
  [v3 containedViewControllerModalStateChanged];
}

- (UIEdgeInsets)px_layoutMargins
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosUIViewController;
  [(UIViewController *)&v7 px_layoutMargins];
  if (v3 >= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  if (v3 != v5)
  {
    double v5 = v6;
    double v3 = v6;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)px_determinesPreferredStatusBarStyle
{
  return 1;
}

- (void)px_didTransitionBars
{
  id v2 = [(PXPhotosUIViewController *)self gridView];
  [v2 setShouldWorkaround18475431:0];
}

- (void)px_willTransitionBars
{
  id v2 = [(PXPhotosUIViewController *)self gridView];
  [v2 setShouldWorkaround18475431:1];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  double v3 = [(PXPhotosUIViewController *)self contentControllerIfLoaded];
  double v4 = [v3 viewModel];

  if (v4)
  {
    double v5 = [(PXPhotosUIViewController *)self viewModel];
    BOOL v6 = ([v5 allowedChromeItems] & 0x400) == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setObservedSplitViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedSplitViewController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_observedSplitViewController);
    [v5 unregisterChangeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_observedSplitViewController, obj);
    [obj registerChangeObserver:self];

    [(PXPhotosUIViewController *)self _invalidateSidebarVisibilityDependentProperties];
  }
}

- (void)_updateSidebarVisibilityDependentProperties
{
  [(PXPhotosUIViewController *)self _updateBackButtonBehavior];
  [(PXPhotosUIViewController *)self _updateDrawerButtonVisibility];
}

- (void)_invalidateSidebarVisibilityDependentProperties
{
  id v2 = [(PXPhotosUIViewController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSidebarVisibilityDependentProperties];
}

- (void)_updateObservedSplitViewController
{
  id v3 = [(UIViewController *)self px_splitViewController];
  [(PXPhotosUIViewController *)self setObservedSplitViewController:v3];
}

- (void)_invalidateObservedSplitViewController
{
  id v2 = [(PXPhotosUIViewController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateObservedSplitViewController];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (a3) {
    [(PXPhotosUIViewController *)self _invalidateObservedSplitViewController];
  }
  else {
    [(PXPhotosUIViewController *)self setObservedSplitViewController:0];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosUIViewController;
  [(PXPhotosUIViewController *)&v4 viewLayoutMarginsDidChange];
  id v3 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  [v3 updateIfNeeded];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosUIViewController;
  id v6 = a4;
  [(PXPhotosUIViewController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PXPhotosUIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E5DD2A68;
  v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

uint64_t __86__PXPhotosUIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackButtonBehavior];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewDidDisappear:](&v11, sel_viewDidDisappear_);
  objc_super v5 = [(PXPhotosUIViewController *)self viewModel];
  [v5 performChanges:&__block_literal_global_356_201783];

  id v6 = [(PXPhotosUIViewController *)self eventTracker];
  [v6 logViewControllerDidDisappear:self];

  objc_super v7 = [(PXPhotosUIViewController *)self userActivityController];
  [v7 setActive:0];

  uint64_t v8 = PXContentPrivacyNavigationStateFromViewController(self);
  char v9 = [(PXPhotosUIViewController *)self privacyController];
  [v9 viewDidDisappearForAuthenticationContext:self withNavigationState:v8];

  BOOL v10 = [(PXPhotosUIViewController *)self contentController];
  [v10 contentViewDidDisappear:v3];
}

uint64_t __45__PXPhotosUIViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppearState:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosUIViewController;
  [(PXPhotosUIViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(PXPhotosUIViewController *)self viewModel];
  [v4 performChanges:&__block_literal_global_352];
}

uint64_t __46__PXPhotosUIViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppearState:3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewDidAppear:](&v11, sel_viewDidAppear_);
  objc_super v5 = [(PXPhotosUIViewController *)self viewModel];
  [v5 performChanges:&__block_literal_global_348_201787];

  id v6 = [(PXPhotosUIViewController *)self contentController];
  [v6 stopForceIncludingAllAssetsInDataSource];

  objc_super v7 = [(PXPhotosUIViewController *)self eventTracker];
  [v7 logViewControllerDidAppear:self];

  uint64_t v8 = [(PXPhotosUIViewController *)self contentController];
  [v8 contentViewDidAppear:v3];

  char v9 = [(PXPhotosUIViewController *)self userActivityController];
  [v9 setActive:1];

  BOOL v10 = [(PXPhotosUIViewController *)self privacyController];
  [v10 viewDidAppearForAuthenticationContext:self];

  [(PXPhotosUIViewController *)self _updateBackButtonBehavior];
}

uint64_t __42__PXPhotosUIViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppearState:2];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosUIViewController;
  [(PXPhotosUIViewController *)&v17 viewWillLayoutSubviews];
  BOOL v3 = [(PXPhotosUIViewController *)self updater];
  [v3 updateIfNeeded];

  objc_super v4 = [(PXPhotosUIViewController *)self contentController];
  [v4 updateIfNeeded];

  objc_super v5 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  [v5 updateIfNeeded];

  id v6 = [(PXPhotosUIViewController *)self dismissalInteractionController];
  [v6 viewControllerViewWillLayoutSubviews];

  objc_super v7 = [(PXPhotosUIViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  char v16 = [(PXPhotosUIViewController *)self fullscreenOverlay];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (void)containerView:(id)a3 willMoveToWindow:(id)a4
{
  if (a4)
  {
    objc_super v5 = objc_msgSend(a4, "windowScene", a3);
    id v6 = [v5 statusBarManager];
    [v6 statusBarFrame];
    double v8 = v7;

    id v10 = [(PXPhotosUIViewController *)self contentController];
    double v9 = [v10 layout];
    [v9 setStatusBarHeight:v8];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewIsAppearing:](&v8, sel_viewIsAppearing_);
  objc_super v5 = [(PXPhotosUIViewController *)self viewModel];
  [v5 performChanges:&__block_literal_global_342_201791];

  id v6 = [(PXPhotosUIViewController *)self barsController];
  [v6 updateIfNeeded];

  double v7 = [(PXPhotosUIViewController *)self contentController];
  [v7 contentViewWillAppear:v3];

  [(PXPhotosUIViewController *)self _scrollToInitialPositionIfNecessary];
  [(PXPhotosUIViewController *)self _updateBackButtonBehavior];
  [(PXPhotosUIViewController *)self _updateDrawerButtonVisibility];
}

uint64_t __44__PXPhotosUIViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppearState:1];
}

- (void)_scrollToInitialPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PXPhotosUIViewController *)self contentController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PXPhotosUIViewController__scrollToInitialPositionAnimated___block_invoke;
  v6[3] = &unk_1E5DD2188;
  v6[4] = self;
  [v5 scrollToInitialPositionAnimated:v3 withCompletionHandler:v6];
}

void __61__PXPhotosUIViewController__scrollToInitialPositionAnimated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setHasScrolledToInitialPosition:1];
    id v3 = [*(id *)(a1 + 32) contentController];
    [v3 contentViewDidScrollToInitialPosition];
  }
}

- (void)_scrollToInitialPositionIfNecessary
{
  if (![(PXPhotosUIViewController *)self hasScrolledToInitialPosition]
    && ![(PXPhotosUIViewController *)self isShowingInitialLoadingPlaceholder])
  {
    id v3 = [(PXPhotosUIViewController *)self pendingInitialNavigationRequest];
    if (v3)
    {
      [(PXPhotosUIViewController *)self setPendingInitialNavigationRequest:0];
      objc_super v4 = [v3 destination];
      objc_super v5 = [PXProgrammaticNavigationRequest alloc];
      uint64_t v6 = [v3 options];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke;
      v9[3] = &unk_1E5DC4328;
      id v10 = v4;
      double v11 = self;
      id v12 = v3;
      id v7 = v4;
      objc_super v8 = [(PXProgrammaticNavigationRequest *)v5 initWithDestination:v7 options:v6 completionHandler:v9];
      PXProgrammaticNavigationRequestExecute(v8, self);
    }
    else
    {
      [(PXPhotosUIViewController *)self _scrollToInitialPositionAnimated:0];
    }
  }
}

void __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1 && [a1[4] revealMode])
  {
    uint64_t v6 = [a1[5] contentController];
    [v6 contentViewDidScrollToInitialPosition];
  }
  else
  {
    uint64_t v6 = [a1[5] contentController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke_2;
    v8[3] = &unk_1E5DD2188;
    v8[4] = a1[5];
    [v6 scrollToInitialPositionAnimated:0 withCompletionHandler:v8];
  }

  id v7 = [a1[6] completionHandler];
  ((void (**)(void, uint64_t, id))v7)[2](v7, a2, v5);
}

void __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentController];
  [v1 contentViewDidScrollToInitialPosition];
}

- (id)_createPlayAsMemoryButton
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __53__PXPhotosUIViewController__createPlayAsMemoryButton__block_invoke;
  double v13 = &unk_1E5DD2930;
  objc_copyWeak(&v14, &location);
  objc_super v4 = [v3 actionWithHandler:&v10];
  id v5 = objc_opt_class();
  uint64_t v6 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
  id v7 = [v5 _roundedButtonConfigurationWithSymbolName:@"play.fill" inset:7 fontSize:v6 weight:10.0 groupName:12.0];

  objc_super v8 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v7 primaryAction:v4];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v8;
}

void __53__PXPhotosUIViewController__createPlayAsMemoryButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained playCollectionAsMemory];
}

- (id)_createSortButton
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  objc_super v4 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
  id v5 = [v3 _roundedButtonConfigurationWithSymbolName:@"arrow.up.arrow.down" inset:7 fontSize:v4 weight:10.0 groupName:14.0];

  uint64_t v6 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v5 primaryAction:0];
  [v6 setShowsMenuAsPrimaryAction:1];
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB1970];
  objc_super v8 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __45__PXPhotosUIViewController__createSortButton__block_invoke;
  char v16 = &unk_1E5DC4300;
  objc_copyWeak(&v17, &location);
  double v9 = [v8 elementWithUncachedProvider:&v13];
  v19[0] = v9;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1, v13, v14, v15, v16);
  uint64_t v11 = [v7 menuWithChildren:v10];
  [v6 setMenu:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v6;
}

void __45__PXPhotosUIViewController__createSortButton__block_invoke(uint64_t a1, void *a2)
{
  double v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = [WeakRetained viewModel];
  id v5 = [v4 dataSourceManager];
  uint64_t v6 = [v5 dataSource];
  id v7 = [v6 containerCollection];

  if (v7)
  {
    objc_super v8 = +[PXCollectionSortOrderMenuBuilder sortOrderMenuActionsForCollection:v7];
    v9[2](v9, v8);
  }
}

- (id)_createButtonForScrollingToNeighboringSectionInDirection:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = @"chevron.up";
  }
  else
  {
    if (a3 != 2)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PXPhotosUIViewController.m" lineNumber:1274 description:@"unsupported direction"];

      abort();
    }
    id v5 = @"chevron.down";
  }
  objc_initWeak(&location, self);
  uint64_t v6 = objc_opt_class();
  id v7 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
  objc_super v8 = [v6 _roundedButtonConfigurationWithSymbolName:v5 inset:7 fontSize:v7 weight:10.0 groupName:12.0];

  double v9 = (void *)MEMORY[0x1E4FB14D0];
  uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PXPhotosUIViewController__createButtonForScrollingToNeighboringSectionInDirection___block_invoke;
  v16[3] = &unk_1E5DC42D8;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  uint64_t v11 = [v10 actionWithHandler:v16];
  id v12 = [v9 buttonWithConfiguration:v8 primaryAction:v11];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  return v12;
}

void __85__PXPhotosUIViewController__createButtonForScrollingToNeighboringSectionInDirection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained contentController];
  [v2 scrollToNeighboringSectionInDirection:*(void *)(a1 + 40) animated:1];
}

- (void)_updateScrollViewController
{
  id v19 = [(PXPhotosUIViewController *)self viewModel];
  id v3 = [v19 specManager];
  objc_super v4 = [v3 spec];

  id v5 = [(PXPhotosUIViewController *)self contentController];
  uint64_t v6 = [v5 gridView];
  id v7 = [v6 scrollViewController];

  if (![(PXPhotosUIViewController *)self swift_updateScrollViewControllerForScrollDetentsProvider])
  {
    objc_super v8 = [(PXPhotosUIViewController *)self configuration];
    uint64_t v9 = [v8 scrollingBehavior];

    if (v9 == 1)
    {
      [v7 setShowsHorizontalScrollIndicator:0];
      [v7 setShowsVerticalScrollIndicator:0];
      uint64_t v10 = 1;
      [v7 setShouldScrollSimultaneouslyWithDescendantScrollView:1];
      uint64_t v11 = +[PXLemonadeSettings sharedInstance];
      uint64_t v12 = [v11 horizontalPagingTechnique];

      if (!v12)
      {
        [v4 interPageSpacing];
        objc_msgSend(v7, "setHorizontalInterPageSpacing:");
        uint64_t v10 = 0;
      }
      [v7 setDecelerationRate:v10];
      [v4 layoutReferenceSize];
      double v14 = v13;
      [v4 interPageSpacing];
      char v16 = +[PXScrollBehavior pagingBehaviorWithAxis:2 pagingOrigin:1 pageOffset:0.0 decelerationRate:v14 + v15];
      [(PXPhotosUIViewController *)self setScrollBehavior:v16];
      id v17 = [(PXPhotosUIViewController *)self contentController];
      long long v18 = [v17 layout];
      [v18 setVisibleRectDelegate:self];
    }
  }
}

- (void)_updateSecondaryToolbarAccessoryViews
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  objc_super v4 = [v3 viewOptionsModel];

  if (v4)
  {
    id v5 = [(PXPhotosUIViewController *)self filterButtonController];
    [v5 invalidateButton];
    id v9 = [v5 button];
    if ([v3 dismissAffordance] == 3) {
      [(PXPhotosUIViewController *)self closeButtonController];
    }
    else {
    uint64_t v6 = [(PXPhotosUIViewController *)self statusButtonController];
    }
    objc_super v4 = [v6 button];
  }
  else
  {
    id v9 = 0;
  }
  id v7 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  [v7 setLeadingAccessoryView:v9];

  objc_super v8 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  [v8 setTrailingAccessoryView:v4];
}

- (void)_updateOneUpPresentationInteraction
{
  id v4 = [(UIViewController *)self px_oneUpPresentation];
  id v3 = [(PXPhotosUIViewController *)self interaction];
  [v3 setOneUpPresentation:v4];
}

- (void)_invalidateOneUpPresentationInteraction
{
  id v3 = [(PXPhotosUIViewController *)self interaction];
  [v3 setOneUpPresentation:0];

  [(PXPhotosUIViewController *)self _updateOneUpPresentationInteraction];
}

- (void)setOneUpEnabled:(BOOL)a3
{
  if (self->_contentController)
  {
    BOOL v3 = a3;
    id v5 = [(PXPhotosUIViewController *)self interaction];
    id v4 = [v5 oneUpPresentation];
    [v4 setEnabled:v3];
  }
}

- (void)_updateSecondaryToolbarOpacity
{
  BOOL v3 = objc_opt_class();
  id v5 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  [(PXPhotosUIViewController *)self secondaryToolbarAlpha];
  objc_msgSend(v3, "_configureOpacityOfSecondaryToolbarController:withViewModel:secondaryToolbarAlpha:", v5, v4);
}

- (void)_updateSecondaryToolbarController
{
  uint64_t v28 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  BOOL v3 = [(PXPhotosUIViewController *)self viewModel];
  id v4 = [v3 viewOptionsModel];
  if (v4 && ([v3 isInSelectMode] & 1) == 0) {
    int v5 = [v3 hidesViewOptionsToolbar] ^ 1;
  }
  else {
    int v5 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (((v5 ^ 1) & 1) != 0 || (isKindOfClass & 1) == 0)
  {
    if (v5)
    {
      objc_super v8 = [PXPhotosViewOptionsToolbarController alloc];
      id v9 = [(PXPhotosUIViewController *)self view];
      id v7 = [(PXPhotosViewOptionsToolbarController *)v8 initWithModel:v4 containerView:v9];

      -[PXPhotosViewOptionsToolbarController setShouldHideAccessoryViewsOnScroll:](v7, "setShouldHideAccessoryViewsOnScroll:", [v3 dismissAffordance] != 3);
      [(PXSecondaryToolbarController *)v7 setLegibilityGradientEnabled:1];
      uint64_t v10 = [(PXPhotosUIViewController *)self gridView];
      uint64_t v11 = [v10 scrollViewController];
      [(PXSecondaryToolbarController *)v7 setContentScrollViewController:v11];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = v28;
  }
  int v12 = [v3 wantsLensControlVisible];
  int v13 = v12 & (v5 ^ 1);
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();
  if (v13 == 1 && (v14 & 1) != 0)
  {
    double v15 = v28;
LABEL_16:

    id v7 = (PXPhotosViewOptionsToolbarController *)v15;
    goto LABEL_17;
  }
  if (v13)
  {
    char v16 = [PXPhotosLensToolbarController alloc];
    uint64_t v17 = [(PXPhotosUIViewController *)self view];
    double v15 = [(PXPhotosLensToolbarController *)v16 initWithViewModel:v3 containerView:v17];

    id v7 = (PXPhotosViewOptionsToolbarController *)v17;
    goto LABEL_16;
  }
LABEL_17:
  long long v18 = [(PXPhotosUIViewController *)self configuration];
  int v19 = [v18 wantsExternallyRenderedSecondaryToolbar] & ((v5 | v12) ^ 1);

  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();
  if (v19 == 1 && (v20 & 1) != 0)
  {
    __int16 v21 = v28;
  }
  else
  {
    if (v19)
    {
      uint64_t v22 = [PXPhotosExternalSecondaryToolbarController alloc];
      uint64_t v23 = [(PXPhotosUIViewController *)self view];
      __int16 v21 = [(PXPhotosExternalSecondaryToolbarController *)v22 initWithContainerView:v23];
    }
    else
    {
      __int16 v21 = (PXPhotosExternalSecondaryToolbarController *)v7;
    }
    unsigned __int8 v24 = v28;
    if (v21 == v28) {
      goto LABEL_30;
    }
    id v7 = [(PXPhotosUIViewController *)self gridView];
    if (v28)
    {
      [(PXSecondaryToolbarController *)v28 setActionHandler:0];
      [(PXSecondaryToolbarController *)v28 removeFromContainerView];
      objc_super v25 = [(PXPhotosViewOptionsToolbarController *)v7 scrollViewController];
      [v25 unregisterObserver:v28];
    }
    __int16 v26 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
    [(PXSecondaryToolbarController *)v21 setBackdropGroupName:v26];

    [(PXPhotosUIViewController *)self setSecondaryToolbarController:v21];
    if (v21)
    {
      [(PXSecondaryToolbarController *)v21 setActionHandler:self];
      [(PXSecondaryToolbarController *)v21 updateIfNeeded];
      [(PXSecondaryToolbarController *)v21 containerViewAdditionalEdgeInsets];
      -[PXPhotosViewOptionsToolbarController setAdditionalSafeAreaInsets:](v7, "setAdditionalSafeAreaInsets:");
      uint64_t v27 = [(PXPhotosViewOptionsToolbarController *)v7 scrollViewController];
      [v27 registerObserver:v21];

      [(PXPhotosUIViewController *)self _updateSecondaryToolbarAccessoryViews];
    }
    else
    {
      -[PXPhotosViewOptionsToolbarController setAdditionalSafeAreaInsets:](v7, "setAdditionalSafeAreaInsets:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
    }
  }

  unsigned __int8 v24 = v21;
LABEL_30:
  [(PXPhotosUIViewController *)self _updateSecondaryToolbarOpacity];
}

- (void)_updateIsModalInPresentation
{
  id v3 = [(PXPhotosUIViewController *)self viewModel];
  -[UIViewController px_setModalInPresentation:](self, "px_setModalInPresentation:", [v3 isModalInPresentation]);
}

- (void)_updateDismissalInteractionControllerProperties
{
  id v4 = [(PXPhotosUIViewController *)self dismissalInteractionController];
  unint64_t v3 = [(PXPhotosUIViewController *)self allowedInteractiveDismissBehaviors];
  [v4 setSwipeDownAllowed:v3 & 1];
  [v4 setSwipeUpAllowed:(v3 >> 1) & 1];
  [v4 setScreenEdgeSwipeAllowed:(v3 >> 2) & 1];
  [v4 setWantsChromeVisible:0];
}

- (void)_configureDismissalInteractionController
{
  if ([(PXPhotosUIViewController *)self allowedInteractiveDismissBehaviors]
    && !self->_dismissalInteractionController)
  {
    unint64_t v3 = [[PXViewControllerDismissalInteractionController alloc] initWithViewController:self];
    dismissalInteractionController = self->_dismissalInteractionController;
    self->_dismissalInteractionController = v3;

    [(PXPhotosUIViewController *)self _updateDismissalInteractionControllerProperties];
    int v5 = self->_dismissalInteractionController;
    [(PXPhotosUIViewController *)self swift_configureDismissalInteractionController:v5];
  }
}

- (void)_updateBackgroundColor
{
  id v15 = [(PXPhotosUIViewController *)self view];
  unint64_t v3 = [(PXPhotosUIViewController *)self contentController];
  id v4 = [v3 gridView];

  int v5 = [(PXPhotosUIViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  id v7 = [(PXPhotosUIViewController *)self configuration];
  objc_super v8 = v7;
  if (v6 == 2) {
    uint64_t v9 = [v7 darkModeBackgroundStyle];
  }
  else {
    uint64_t v9 = [v7 lightModeBackgroundStyle];
  }
  uint64_t v10 = v9;

  if ((unint64_t)(v10 - 1) >= 2)
  {
    if (v10) {
      goto LABEL_9;
    }
    int v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v15 setBackgroundColor:v13];

    uint64_t v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
    [v15 setBackgroundColor:v11];

    uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
  }
  char v14 = (void *)v12;
  [v4 setBackgroundColor:v12];

LABEL_9:
}

- (void)_setNeedsUpdate
{
  id v2 = [(PXPhotosUIViewController *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)viewDidLoad
{
  v91[1] = *MEMORY[0x1E4F143B8];
  v88.receiver = self;
  v88.super_class = (Class)PXPhotosUIViewController;
  [(PXPhotosUIViewController *)&v88 viewDidLoad];
  unint64_t v3 = [(PXPhotosUIViewController *)self view];
  id v4 = [(PXPhotosUIViewController *)self containerViewController];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    [(UIViewController *)self px_enableOneUpPresentation];
  }
  else
  {
    uint64_t v6 = [(PXPhotosUIViewController *)self containerViewController];
    [(UIViewController *)self px_enableOneUpPresentationFromViewController:v6];
  }
  [(UIViewController *)self px_enableExtendedTraitCollection];
  v72 = [(UIViewController *)self px_extendedTraitCollection];
  id v7 = [PXPhotosContentController alloc];
  objc_super v8 = [(PXPhotosUIViewController *)self configuration];
  uint64_t v9 = [(PXPhotosContentController *)v7 initWithConfiguration:v8 traitCollection:v72];
  contentController = self->_contentController;
  self->_contentController = v9;

  [(PXPhotosContentController *)self->_contentController setDelegate:self];
  uint64_t v11 = [(PXPhotosUIViewController *)self configuration];
  uint64_t v12 = [v11 privacyController];
  privacyController = self->_privacyController;
  self->_privacyController = v12;

  char v14 = self->_privacyController;
  if (v14 && [(PXContentPrivacyController *)v14 isLocked]) {
    [(PXPhotosUIViewController *)self setShouldScrollToInitialPositionAfterUnlock:1];
  }
  if ([(PXPhotosUIViewController *)self shouldUseSystemSwipeToDismiss])
  {
    self->_allowedInteractiveDismissBehaviors = 0;
  }
  else
  {
    id v15 = [(PXPhotosUIViewController *)self configuration];
    self->_allowedInteractiveDismissBehaviors = [v15 allowedInteractiveDismissBehaviors];
  }
  [(PXPhotosUIViewController *)self _updateOneUpPresentationInteraction];
  char v16 = [(PXPhotosUIViewController *)self interaction];
  [v16 setUiInteractionDelegate:self];

  uint64_t v17 = [(PXPhotosUIViewController *)self viewModel];
  [v17 registerChangeObserver:self context:ViewModelObserverContext_201660];
  long long v18 = [v17 currentDataSource];
  id v73 = [v18 containerCollection];

  if (objc_msgSend(v73, "px_isHiddenSmartAlbum")) {
    PXRegisterPreferencesObserver(self);
  }
  if (objc_msgSend(v73, "px_isRecentlyDeletedSmartAlbum")) {
    +[PXTipsAppDonation donateSignalForEvent:1];
  }
  if (objc_msgSend(v73, "px_isRecoveredSmartAlbum"))
  {
    id v19 = v73;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    __int16 v21 = [v20 photoLibrary];
    uint64_t v22 = objc_msgSend(v21, "px_assetsRecoveryCountsManager");

    [v22 markAsRead];
  }
  uint64_t v23 = [v17 specManager];
  [v23 registerChangeObserver:self context:SpecManagerObserverContext];

  if ([v17 decorationViewClass]) {
    [v17 performChanges:&__block_literal_global_271_201824];
  }
  [v17 performChanges:&__block_literal_global_273_201825];
  unsigned __int8 v24 = [(PXPhotosUIViewController *)self configuration];
  if ([v24 allowedBehaviors])
  {
    [(UIViewController *)self px_enableBarAppearance];
    objc_super v25 = [[PXPhotosBarsController alloc] initWithPhotosContentController:self->_contentController];
    barsController = self->_barsController;
    self->_barsController = v25;

    [(PXPhotosBarsController *)self->_barsController setDelegate:self];
    [(PXBarsController *)self->_barsController setViewController:self];
    if ([v24 wantsTabBarHidden]) {
      [v17 performChanges:&__block_literal_global_277_201827];
    }
  }
  if ([v17 allowsSelectionUserActivityBehavior])
  {
    uint64_t v27 = [PXAssetSelectionUserActivityController alloc];
    uint64_t v28 = [v17 selectionManager];
    v29 = [(PXAssetSelectionUserActivityController *)v27 initWithSelectionManager:v28];
    userActivityController = self->_userActivityController;
    self->_userActivityController = v29;
  }
  id v31 = [(PXPhotosContentController *)self->_contentController gridView];
  double v32 = [v31 scrollViewController];
  double v71 = [v32 scrollView];

  [v3 bounds];
  objc_msgSend(v31, "setFrame:");
  [v31 setAutoresizingMask:18];
  if ([v24 backgroundStyle] == 1)
  {
    double v33 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    double v34 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v33];
    [v3 bounds];
    objc_msgSend(v34, "setFrame:");
    double v35 = [v17 specManager];
    double v36 = [v35 spec];
    double v37 = [v36 visualEffectViewGroupName];
    [v34 _setGroupName:v37];

    [v34 setAutoresizingMask:18];
    [v3 addSubview:v34];
  }
  objc_msgSend(v31, "setEnableUnderlaySupport:", objc_msgSend(v24, "enableSupportForTungstenUnderlay"));
  [v3 addSubview:v31];
  [(PXPhotosUIViewController *)self setContentScrollView:v71 forEdge:5];
  [(PXPhotosUIViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  id v38 = [v31 scrollViewController];
  [v38 registerObserver:self];

  [(PXPhotosUIViewController *)self _configureDismissalInteractionController];
  [(PXPhotosUIViewController *)self invalidateHeaderView];
  double v39 = [v24 bannerProvider];
  [v39 setPresentationDelegate:self];

  [(PXPhotosUIViewController *)self _updateSecondaryToolbarController];
  [(PXPhotosUIViewController *)self _updateSecondaryToolbarAccessoryViews];
  [(PXPhotosUIViewController *)self _updateIsModalInPresentation];
  [(PXPhotosUIViewController *)self _updateBackgroundColor];
  objc_initWeak(&location, self);
  v91[0] = objc_opt_class();
  double v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __39__PXPhotosUIViewController_viewDidLoad__block_invoke_4;
  v85[3] = &unk_1E5DCF420;
  id v69 = &v86;
  objc_copyWeak(&v86, &location);
  id v41 = (id)[(PXPhotosUIViewController *)self registerForTraitChanges:v40 withHandler:v85];

  long long v42 = [v17 assetCollectionActionManager];
  [v42 setTraitEnvironment:self];

  double v43 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0x100000 action:sel_openSelectionWithCommandDownArrow_];
  [(PXPhotosUIViewController *)self addKeyCommand:v43];

  double v44 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_cancelSelectMode_];
  [(PXPhotosUIViewController *)self addKeyCommand:v44];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v45 = [(PXPhotosUIViewController *)self interaction];
  id v46 = [v45 keyCommandsForSelectionExtension];

  uint64_t v47 = [v46 countByEnumeratingWithState:&v81 objects:v90 count:16];
  double v48 = v3;
  if (v47)
  {
    uint64_t v49 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v82 != v49) {
          objc_enumerationMutation(v46);
        }
        -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", *(void *)(*((void *)&v81 + 1) + 8 * i), v69);
      }
      uint64_t v47 = [v46 countByEnumeratingWithState:&v81 objects:v90 count:16];
    }
    while (v47);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  double v51 = [(PXPhotosUIViewController *)self assetActionManager];
  double v52 = [v51 actionKeyCommands];

  uint64_t v53 = [v52 countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v78 != v54) {
          objc_enumerationMutation(v52);
        }
        -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", *(void *)(*((void *)&v77 + 1) + 8 * j), v69);
      }
      uint64_t v53 = [v52 countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v53);
  }

  if ([v17 dismissAffordance])
  {
    double v56 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0x100000 action:sel_modalDismiss_];
    [(PXPhotosUIViewController *)self addKeyCommand:v56];

    double v57 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"[" modifierFlags:0x100000 action:sel_modalDismiss_];
    [(PXPhotosUIViewController *)self addKeyCommand:v57];
  }
  double v58 = objc_msgSend(v24, "fullscreenOverlayControllers", v69);
  double v59 = +[PXPhotosFullscreenOverlayViewControllerFactory makeViewControllerWithOverlayControllers:v58 photosViewModel:v17];

  if (v59)
  {
    [(PXPhotosUIViewController *)self addChildViewController:v59];
    double v60 = [v59 view];
    fullscreenOverladouble y = self->_fullscreenOverlay;
    self->_fullscreenOverladouble y = v60;

    [v48 addSubview:self->_fullscreenOverlay];
    [v59 didMoveToParentViewController:self];
  }
  double v62 = (PXUpdater *)[objc_alloc((Class)off_1E5DA9778) initWithTarget:self needsUpdateSelector:sel__setNeedsUpdate];
  updater = self->_updater;
  self->_updater = v62;

  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateObservedSplitViewController needsUpdate:1];
  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateSidebarVisibilityDependentProperties];
  objc_initWeak(&from, self);
  double v64 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __39__PXPhotosUIViewController_viewDidLoad__block_invoke_5;
  v74[3] = &unk_1E5DCFD58;
  objc_copyWeak(&v75, &from);
  double v65 = [v64 addObserverForName:@"PXPhotosResetViewNotificationName" object:0 queue:0 usingBlock:v74];
  filterTimeoutObserver = self->_filterTimeoutObserver;
  self->_filterTimeoutObserver = v65;

  [(PXPhotosUIViewController *)self swift_viewDidLoad];
  double v67 = (void *)MEMORY[0x1E4F29060];
  v68 = +[PXPhotosGridSettings sharedInstance];
  [v68 simulatedLoadDelay];
  objc_msgSend(v67, "sleepForTimeInterval:");

  objc_destroyWeak(&v75);
  objc_destroyWeak(&from);

  objc_destroyWeak(v70);
  objc_destroyWeak(&location);
}

void __39__PXPhotosUIViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBackgroundColor];
}

void __39__PXPhotosUIViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained canResetToInitialState];

  if (v3)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v4 = [v5 viewModel];
    [v4 performChanges:&__block_literal_global_303];
  }
}

uint64_t __39__PXPhotosUIViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 resetToInitialSelectionAndFilteringState];
}

uint64_t __39__PXPhotosUIViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setKeepsTabBarAlwaysHidden:1];
}

void __39__PXPhotosUIViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setCplActionManagerClass:objc_opt_class()];
}

uint64_t __39__PXPhotosUIViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setViewBasedDecorationsEnabled:1];
}

- (void)loadView
{
  int v3 = [_PXPhotosGridContainerUIView alloc];
  id v4 = -[_PXPhotosGridContainerUIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_PXPhotosGridContainerUIView *)v4 setDelegate:self];
  [(PXPhotosUIViewController *)self setView:v4];
}

- (void)_updateBackgroundColorOverride
{
  id v11 = [(PXPhotosUIViewController *)self placementOverride];
  int v3 = [(PXPhotosUIViewController *)self backgroundColorBeforeOverride];
  id v4 = v11;
  if (v11 && !v3)
  {
    id v5 = [(PXPhotosUIViewController *)self gridView];
    int v3 = [v5 backgroundColor];

    [(PXPhotosUIViewController *)self setBackgroundColorBeforeOverride:v3];
    id v4 = v11;
LABEL_5:
    [v4 chromeAlpha];
    objc_msgSend(v3, "colorWithAlphaComponent:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    goto LABEL_6;
  }
  if (v11) {
    goto LABEL_5;
  }
  if (v3)
  {
    id v6 = v3;
    [(PXPhotosUIViewController *)self setBackgroundColorBeforeOverride:0];
    int v3 = v6;
  }
  else
  {
    uint64_t v10 = [(PXPhotosUIViewController *)self view];
    id v6 = [v10 backgroundColor];

    int v3 = 0;
  }
  id v7 = v6;
LABEL_6:
  objc_super v8 = [(PXPhotosUIViewController *)self view];
  [v8 setBackgroundColor:v7];

  if (v11) {
  uint64_t v9 = [(PXPhotosUIViewController *)self gridView];
  }
  [v9 setBackgroundColor:v6];
}

- (void)setPlacementOverride:(id)a3
{
  id v5 = (PXGItemPlacement *)a3;
  if (self->_placementOverride != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_placementOverride, a3);
    [(PXPhotosUIViewController *)self _updateBackgroundColorOverride];
    id v5 = v6;
  }
}

- (UIViewControllerInteractiveTransitioning)edgeSwipeDismissalInteraction
{
  id v2 = [(PXPhotosUIViewController *)self interaction];
  int v3 = [v2 edgeSwipeDismissalInteraction];

  return (UIViewControllerInteractiveTransitioning *)v3;
}

- (void)ensureSwipeDismissalInteraction
{
  id v2 = [(PXPhotosUIViewController *)self interaction];
  [v2 ensureSwipeDismissalInteraction];
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  id v2 = [(PXPhotosUIViewController *)self interaction];
  int v3 = [v2 contextMenuInteraction];

  return (UIContextMenuInteraction *)v3;
}

- (PXAssetReference)assetReferenceForCurrentScrollPosition
{
  id v2 = [(PXPhotosUIViewController *)self contentController];
  int v3 = [v2 assetReferenceForCurrentScrollPosition];

  return (PXAssetReference *)v3;
}

- (BOOL)isScrolledToTop
{
  id v2 = [(PXPhotosUIViewController *)self viewModel];
  char v3 = [v2 isScrolledToTop];

  return v3;
}

- (BOOL)shouldAlwaysRespectToolbarActionPlacementPreference
{
  id v2 = [(PXPhotosUIViewController *)self viewModel];
  char v3 = [v2 shouldAlwaysRespectToolbarActionPlacementPreference];

  return v3;
}

- (void)setShouldAlwaysRespectToolbarActionPlacementPreference:(BOOL)a3
{
  int v3 = a3;
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  if ([v4 shouldAlwaysRespectToolbarActionPlacementPreference] != v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__PXPhotosUIViewController_setShouldAlwaysRespectToolbarActionPlacementPreference___block_invoke;
    v5[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    char v6 = v3;
    [v4 performChanges:v5];
  }
}

uint64_t __83__PXPhotosUIViewController_setShouldAlwaysRespectToolbarActionPlacementPreference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldAlwaysRespectToolbarActionPlacementPreference:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)hidesToolbar
{
  id v2 = [(PXPhotosUIViewController *)self viewModel];
  char v3 = [v2 hidesToolbar];

  return v3;
}

- (void)setHidesToolbar:(BOOL)a3
{
  int v3 = a3;
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  if ([v4 hidesToolbar] != v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__PXPhotosUIViewController_setHidesToolbar___block_invoke;
    v5[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    char v6 = v3;
    [v4 performChanges:v5];
  }
}

uint64_t __44__PXPhotosUIViewController_setHidesToolbar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidesToolbar:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)hidesNavbar
{
  id v2 = [(PXPhotosUIViewController *)self viewModel];
  char v3 = [v2 hidesNavbar];

  return v3;
}

- (void)setHidesNavbar:(BOOL)a3
{
  int v3 = a3;
  id v4 = [(PXPhotosUIViewController *)self viewModel];
  if ([v4 hidesNavbar] != v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__PXPhotosUIViewController_setHidesNavbar___block_invoke;
    v5[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    char v6 = v3;
    [v4 performChanges:v5];
  }
}

uint64_t __43__PXPhotosUIViewController_setHidesNavbar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidesNavbar:*(unsigned __int8 *)(a1 + 32)];
}

- (NSSet)hiddenAssetReferences
{
  id v2 = [(PXPhotosUIViewController *)self interaction];
  int v3 = [v2 hiddenAssetReferences];

  return (NSSet *)v3;
}

- (void)setHiddenAssetReferences:(id)a3 animationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PXPhotosUIViewController *)self contentController];
  objc_super v8 = [v7 layout];
  [v8 setPendingHideAnimationType:a4];

  id v9 = [(PXPhotosUIViewController *)self interaction];
  [v9 setHiddenAssetReferences:v6];
}

- (void)setHiddenAssetReferences:(id)a3
{
}

- (void)scrollToCenterAssetReference:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosUIViewController *)self contentController];
  objc_msgSend(v8, "scrollToRevealAssetReference:scrollPosition:padding:completionHandler:", v7, 18, v6, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

- (void)scrollToRevealAssetReference:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosUIViewController *)self contentController];
  [v8 scrollToRevealAssetReference:v7 completionHandler:v6];
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 shouldSnapshotPlaceholder:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(PXPhotosUIViewController *)self interaction];
  uint64_t v10 = [v9 regionOfInterestForAssetReference:v8 image:a4 fallbackMediaProvider:0 shouldSnapshot:v5];

  return v10;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4
{
  return [(PXPhotosUIViewController *)self regionOfInterestForAssetReference:a3 image:a4 shouldSnapshotPlaceholder:1];
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  return [(PXPhotosUIViewController *)self regionOfInterestForAssetReference:a3 image:0 shouldSnapshotPlaceholder:1];
}

- (void)_dismissOnInternalRequest
{
  int v3 = [(PXPhotosUIViewController *)self viewModel];
  char v4 = [v3 dismissRequested];

  if ((v4 & 1) == 0) {
    PXAssertGetLog();
  }
  BOOL v5 = [(PXPhotosUIViewController *)self viewModel];
  id v6 = [v5 dataSourceManager];
  [v6 performChanges:&__block_literal_global_201855];

  id v7 = [(PXPhotosUIViewController *)self navigationController];
  id v8 = (id)objc_msgSend(v7, "px_popToViewControllerPrecedingViewController:animated:", self, 1);

  id v9 = [(PXPhotosUIViewController *)self viewModel];
  [v9 performChanges:&__block_literal_global_262_201856];
}

uint64_t __53__PXPhotosUIViewController__dismissOnInternalRequest__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDismissRequested:0];
}

id __53__PXPhotosUIViewController__dismissOnInternalRequest__block_invoke(uint64_t a1, void *a2)
{
  return (id)[a2 pauseChangeDeliveryWithTimeout:@"PXPhotosUIViewController" identifier:1.0];
}

- (void)_presentOneUpForSingleSelectedAssetWithActivity:(unint64_t)a3
{
  BOOL v5 = [(PXPhotosUIViewController *)self viewModel];
  if (([v5 isInSelectMode] & 1) == 0)
  {
    id v6 = [v5 singleSelectedAssetReference];
    if (v6)
    {
      id v7 = [(PXPhotosUIViewController *)self interaction];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __76__PXPhotosUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke;
      v8[3] = &__block_descriptor_40_e44_v16__0___PXOneUpPresentationConfiguration__8l;
      v8[4] = a3;
      [v7 presentOneUpForAssetReference:v6 configurationHandler:v8];
    }
  }
}

uint64_t __76__PXPhotosUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActivity:*(void *)(a1 + 32)];
}

- (void)setSecondaryToolbarAlpha:(double)a3
{
  if (self->_secondaryToolbarAlpha != a3)
  {
    self->_secondaryToolbarAlpha = a3;
    [(PXPhotosUIViewController *)self _invalidateSecondaryToolbarOpacity];
  }
}

- (double)secondaryToolbarHeight
{
  id v2 = [(PXPhotosUIViewController *)self secondaryToolbarController];
  double v3 = 0.0;
  if ([v2 isSecondaryToolbarVisible])
  {
    [v2 containerViewAdditionalEdgeInsets];
    double v3 = v4;
  }

  return v3;
}

- (double)collapsibleFooterHeight
{
  id v2 = [(PXPhotosUIViewController *)self contentController];
  [v2 collapsibleFooterHeight];
  double v4 = v3;

  return v4;
}

- (void)_getPhotosRowHeight:(double *)a3 spacing:(double *)a4
{
  id v26 = [(PXPhotosUIViewController *)self configuration];
  id v7 = [(UIViewController *)self px_extendedTraitCollection];
  if (![v7 layoutSizeClass])
  {
    id v8 = [[_PXPhotosEstimatedExtendedTraitCollection alloc] initWithViewController:self];

    id v7 = v8;
  }
  id v9 = [PXZoomablePhotosLayoutSpec alloc];
  uint64_t v10 = [v26 gridStyle];
  [v26 itemAspectRatio];
  double v12 = v11;
  int v13 = [v26 customUserDefaults];
  char v14 = [(PXPhotosUIViewController *)self viewModel];
  [v14 additionalAspectFitEdgeMargins];
  id v19 = -[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:](v9, "initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:", v7, 0, 0, v10, v13, 0, v12, v15, v16, v17, v18, 0, 0);

  uint64_t v20 = [(PXZoomablePhotosLayoutSpec *)v19 initialNumberOfColumns];
  [(PXZoomablePhotosLayoutSpec *)v19 interitemSpacing];
  double v22 = v21;
  [(PXFeatureSpec *)v19 layoutReferenceSize];
  double v24 = v23;
  [(PXZoomablePhotosLayoutSpec *)v19 itemAspectRatio];
  if (a3) {
    *a3 = round(((v22 + v24) / (double)v20 - v22) / v25);
  }
  if (a4) {
    *a4 = v22;
  }
}

- (double)numberOfPhotosRowsForVisibleHeight:(double)a3
{
  double v5 = 0.0;
  double v6 = 0.0;
  [(PXPhotosUIViewController *)self _getPhotosRowHeight:&v6 spacing:&v5];
  return (v5 + a3) / (v5 + v6);
}

- (double)visibleHeightForNumberOfPhotosRows:(double)a3
{
  double v5 = 0.0;
  double v6 = 0.0;
  [(PXPhotosUIViewController *)self _getPhotosRowHeight:&v6 spacing:&v5];
  return -(v5 - a3 * (v6 + v5));
}

- (void)invalidateHeaderView
{
  id v13 = [(PXPhotosUIViewController *)self viewModel];
  if ([v13 viewDelegateRespondsTo:2])
  {
    double v3 = [(PXPhotosUIViewController *)self contentController];
    double v4 = [v3 headerView];

    double v5 = [(PXPhotosUIViewController *)self _contentUnavailableConfiguration];
    if (v5)
    {
      double v6 = 0;
    }
    else
    {
      id v7 = [v13 viewDelegate];
      double v6 = [v7 headerViewForPhotosViewController:self];
    }
    if ([v13 viewDelegateRespondsTo:0x8000])
    {
      id v8 = [v13 viewDelegate];
      uint64_t v9 = [v8 shouldAnimateFromHeaderView:v4 toHeaderView:v6];
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [(PXPhotosUIViewController *)self contentController];
    [v10 setHeaderView:v6 animated:v9];

    double v11 = [(PXPhotosUIViewController *)self contentController];
    double v12 = [v11 headerView];
    PXPhotosViewNoteHeaderViewSizeDidChange(v12);
  }
}

- (void)setShowingInitialLoadPlaceholder:(BOOL)a3
{
  if (self->_showingInitialLoadPlaceholder != a3)
  {
    self->_showingInitialLoadPlaceholder = a3;
    if (!a3)
    {
      [(PXPhotosUIViewController *)self setHasScrolledToInitialPosition:0];
      [(PXPhotosUIViewController *)self _scrollToInitialPositionIfNecessary];
    }
  }
}

- (void)_updateDrawerButtonVisibility
{
  id v10 = [(UIViewController *)self px_splitViewController];
  double v3 = [(PXPhotosUIViewController *)self viewModelIfLoaded];
  uint64_t v4 = [v3 gridStyle];
  double v5 = [(PXPhotosUIViewController *)self viewModel];
  double v6 = [v5 specManager];

  uint64_t v7 = 1;
  if (v10 && (v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (([v10 displayMode] & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      uint64_t v7 = [v10 isCollapsed] ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [(PXPhotosUIViewController *)self navigationController];

    if (v8) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7;
    }
    [v6 setWantsToggleSidebarButton:v9];
  }
  [v6 setShouldMakeSpaceForLeadingChrome:v7];
}

- (void)_updateBackButtonBehavior
{
  id v22 = [(UIViewController *)self px_splitViewController];
  double v3 = [(PXPhotosUIViewController *)self navigationController];
  uint64_t v4 = [v3 viewControllers];
  double v5 = [v4 firstObject];
  if (v5 == self)
  {
    int v7 = 0;
  }
  else
  {
    double v6 = [(PXPhotosUIViewController *)self navigationItem];
    int v7 = [v6 hidesBackButton] ^ 1;
  }
  if ([v22 isSidebarVisible]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [v22 splitBehavior] == 1 || objc_msgSend(v22, "splitBehavior") == 2;
  }
  uint64_t v9 = [v22 displayMode];
  id v10 = [(PXPhotosUIViewController *)self navigationItem];
  double v11 = [v10 leftBarButtonItems];
  uint64_t v12 = [v11 count];

  id v13 = [(PXPhotosUIViewController *)self contentController];
  char v14 = [v13 layout];

  BOOL v16 = v9 != 3 && v12 == 0;
  BOOL v17 = ((v7 | v8) & 1) == 0 && v16;
  [v14 setWantsHeaderInSafeArea:v17];
  uint64_t v18 = [v22 splitBehavior];
  int v19 = v9 == 3 || v8;
  if (v19 == 1)
  {
    if (v18 == 2) {
      unsigned int v20 = v7 ^ 1;
    }
    else {
      unsigned int v20 = 0;
    }
    if ([v22 splitBehavior] == 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  [v14 setAlignsHeaderTitleWithLayoutMargins:v21];
}

- (void)_updateSubviewsOrdering
{
  id v5 = [(PXPhotosUIViewController *)self view];
  double v3 = [(PXPhotosUIViewController *)self gridView];
  [v5 sendSubviewToBack:v3];

  uint64_t v4 = [(PXPhotosUIViewController *)self alternateContentView];
  [v5 bringSubviewToFront:v4];
}

- (void)_updateUIFromViewModelPrivacyState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = [(PXPhotosUIViewController *)self viewModel];
  uint64_t v4 = [v3 contentPrivacyState];

  id v5 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = @"NO";
    if (v4) {
      double v6 = @"YES";
    }
    int v7 = v6;
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "View Controller: Content should be obscured: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  BOOL v8 = [(PXPhotosUIViewController *)self gridView];
  [v8 setContentShouldBeObscured:v4 != 0];
  uint64_t v9 = [(UIViewController *)self px_oneUpPresentation];
  id v10 = v9;
  if (v4 && [v9 isContextMenuInteractionActive])
  {
    double v11 = [v10 contextMenuInteraction];
    [v11 dismissMenu];
  }
  [(PXPhotosUIViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosUIViewController *)self viewModel];
  if (![(PXPhotosUIViewController *)self isViewLoaded]
    || ![v5 allowsEmptyPlaceholderBehavior])
  {
    goto LABEL_25;
  }
  uint64_t v6 = [v5 emptyPlaceholderState];
  int v7 = [v5 dataSourceManager];
  switch(v6)
  {
    case 3:
      id v13 = [v5 emptyPlaceholderStatusViewModel];

      if (v13)
      {
        uint64_t v14 = [(PXPhotosUIViewController *)self placeholderStatusController];
        double v15 = [(PXPhotosUIViewController *)self placeholderStatusController];

        if (!v15)
        {
          BOOL v16 = objc_alloc_init(PXStatusController);

          BOOL v17 = [v5 emptyPlaceholderStatusViewModel];
          [(PXStatusController *)v16 setViewModel:v17];

          [(PXStatusController *)v16 setDelegate:self];
          [(PXPhotosUIViewController *)self setPlaceholderStatusController:v16];
          uint64_t v14 = v16;
        }
        int v12 = [v14 configuration];
      }
      else
      {
        uint64_t v14 = [(PXPhotosUIViewController *)self fallbackPlaceholderStatusController];
        if (!v14)
        {
          uint64_t v14 = _FallbackPlaceholderStatusControllerForViewModel(v5);
          [(PXPhotosUIViewController *)self setFallbackPlaceholderStatusController:v14];
          id v22 = [v14 statusController];
          [v22 setDelegate:self];
        }
        double v23 = [v14 statusController];
        int v12 = [v23 configuration];
      }
      break;
    case 2:
      int v12 = [MEMORY[0x1E4FB1658] loadingConfiguration];
      uint64_t v18 = [v7 localizedLoadingInitialDataSourceMessage];
      [v12 setText:v18];

      uint64_t v19 = [v7 isLoadingInitialDataSource];
      goto LABEL_18;
    case 1:
      objc_initWeak(&location, self);
      BOOL v8 = (void *)MEMORY[0x1E4FB13F0];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __77__PXPhotosUIViewController__updateContentUnavailableConfigurationUsingState___block_invoke;
      v47[3] = &unk_1E5DD2930;
      objc_copyWeak(&v48, &location);
      uint64_t v9 = [v8 actionWithHandler:v47];
      id v10 = [(PXPhotosUIViewController *)self privacyController];
      unint64_t v11 = [v10 authenticationType];

      int v12 = PXContentLockedPlaceholderConfiguration(1, v11, [v5 wantsContentUnavailableUnlockButtonVisible], v9);

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
      break;
    default:
      placeholderStatusController = self->_placeholderStatusController;
      self->_placeholderStatusController = 0;

      fallbackPlaceholderStatusController = self->_fallbackPlaceholderStatusController;
      self->_fallbackPlaceholderStatusController = 0;

      uint64_t v19 = 0;
      int v12 = 0;
      goto LABEL_18;
  }
  uint64_t v19 = 0;
LABEL_18:
  [(PXPhotosUIViewController *)self setShowingInitialLoadPlaceholder:v19];

  if (!v12)
  {
LABEL_25:
    id v45 = [0 updatedConfigurationForState:v4];
    [(PXPhotosUIViewController *)self _setContentUnavailableConfiguration:v45];

    [(PXPhotosUIViewController *)self invalidateHeaderView];
    int v12 = 0;
LABEL_26:
    emptyPlaceholderDragController = self->_emptyPlaceholderDragController;
    self->_emptyPlaceholderDragController = 0;
    goto LABEL_27;
  }
  double v24 = [v5 specManager];
  double v25 = [v24 spec];

  id v26 = [v25 placeholderFont];

  if (v26)
  {
    uint64_t v27 = [v25 placeholderFont];
    uint64_t v28 = [v12 textProperties];
    [v28 setFont:v27];
  }
  v29 = [v25 placeholderFontColor];

  if (v29)
  {
    id v30 = [v25 placeholderFontColor];
    id v31 = [v12 textProperties];
    [v31 setColor:v30];
  }
  [v25 contentUnavailablePlaceholderDirectionalLayoutMargins];
  objc_msgSend(v12, "setDirectionalLayoutMargins:");
  uint64_t v32 = [v25 contentUnavailablePlaceholderDisablesVerticalBounce] ^ 1;
  double v33 = [(PXPhotosUIViewController *)self gridView];
  double v34 = [v33 scrollViewController];
  [v34 setAlwaysBounceVertical:v32];

  double v35 = [v12 updatedConfigurationForState:v4];
  [(PXPhotosUIViewController *)self _setContentUnavailableConfiguration:v35];

  [(PXPhotosUIViewController *)self invalidateHeaderView];
  double v36 = [(PXPhotosUIViewController *)self configuration];
  LODWORD(v32) = [v36 allowsDragIn];

  if (!v32) {
    goto LABEL_26;
  }
  id v46 = [PXPhotosDragController alloc];
  emptyPlaceholderDragController = [(PXPhotosUIViewController *)self view];
  id v38 = [(PXPhotosUIViewController *)self viewModel];
  double v39 = [v38 selectionManager];
  double v40 = [(PXPhotosUIViewController *)self viewModel];
  id v41 = [v40 assetCollectionActionManager];
  long long v42 = [(PXPhotosUIViewController *)self interaction];
  double v43 = [(PXPhotosDragController *)v46 initWithContentView:emptyPlaceholderDragController selectionManager:v39 assetCollectionActionManager:v41 delegate:v42];
  double v44 = self->_emptyPlaceholderDragController;
  self->_emptyPlaceholderDragController = v43;

LABEL_27:
}

void __77__PXPhotosUIViewController__updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained privacyController];
  id v3 = objc_loadWeakRetained(v1);
  [v2 performUserAuthenticationIfNeededFromContext:v3];
}

- (void)_updateEmptyBehaviorIfNeeded
{
  id v21 = [(PXPhotosUIViewController *)self viewModel];
  id v3 = [v21 currentDataSource];
  if ([v3 numberOfSections])
  {
    if (([v3 containsAnyItems] & 1) == 0)
    {
      id v4 = [(UIViewController *)self px_oneUpPresentation];
      [v4 stopAnimated:1];

      id v5 = [(PXPhotosUIViewController *)self viewModel];
      if ([v5 allowsPopOnEmptyBehavior])
      {
        uint64_t v6 = [(PXPhotosUIViewController *)self viewModel];
        uint64_t v7 = [v6 appearState];

        if (v7 == 2)
        {
          BOOL v8 = [(PXPhotosUIViewController *)self navigationController];
          uint64_t v9 = objc_msgSend(v8, "px_popToViewControllerPrecedingViewController:animated:", self, 1);

          if (!v9)
          {
            id v10 = [(PXPhotosUIViewController *)self navigationController];
            unint64_t v11 = [v10 presentingViewController];
            [v11 dismissViewControllerAnimated:1 completion:0];
          }
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
LABEL_17:
    [(PXPhotosUIViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    goto LABEL_18;
  }
  int v12 = [(PXPhotosUIViewController *)self viewModel];
  int v13 = [v12 allowsPopOnContainerDeleteBehavior];
  if (!v13)
  {
LABEL_11:

    char v17 = v13;
    goto LABEL_14;
  }
  uint64_t v14 = [(PXPhotosUIViewController *)self viewModel];
  uint64_t v15 = [v14 appearState];

  if (v15 == 2)
  {
    BOOL v16 = [(PXPhotosUIViewController *)self navigationController];
    char v17 = 1;
    uint64_t v18 = objc_msgSend(v16, "px_popToViewControllerPrecedingViewController:animated:", self, 1);

    if (v18) {
      goto LABEL_14;
    }
    int v12 = [(PXPhotosUIViewController *)self navigationController];
    uint64_t v19 = [v12 presentingViewController];
    [v19 dismissViewControllerAnimated:1 completion:0];

    goto LABEL_11;
  }
  char v17 = 0;
LABEL_14:
  if ([v21 viewDelegateRespondsTo:4])
  {
    unsigned int v20 = [v21 viewDelegate];
    [v20 containerWasDeletedForPhotosViewController:self];
  }
  if ((v17 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_requestFocusUpdateWithAssetReference:(id)a3
{
  [(PXPhotosUIViewController *)self setPreferredFocusAssetReference:a3];
  id v4 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v4 requestFocusUpdateToEnvironment:self];
}

- (void)setAlternateContentView:(id)a3
{
  id v5 = (UIView *)a3;
  p_alternateContentView = &self->_alternateContentView;
  alternateContentView = self->_alternateContentView;
  if (alternateContentView != v5)
  {
    [(UIView *)alternateContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_alternateContentView, a3);
    BOOL v8 = [(PXPhotosUIViewController *)self view];
    [v8 bounds];
    -[UIView setFrame:](*p_alternateContentView, "setFrame:");
    [(UIView *)*p_alternateContentView setAutoresizingMask:18];
    uint64_t v9 = [(PXPhotosUIViewController *)self view];
    [v9 addSubview:*p_alternateContentView];

    [(PXPhotosUIViewController *)self _updateSubviewsOrdering];
    BOOL v10 = *p_alternateContentView != 0;
    unint64_t v11 = [(PXPhotosUIViewController *)self viewModel];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__PXPhotosUIViewController_setAlternateContentView___block_invoke;
    void v12[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    BOOL v13 = v10;
    [v11 performChanges:v12];
  }
}

uint64_t __52__PXPhotosUIViewController_setAlternateContentView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShowingAlternateContent:*(unsigned __int8 *)(a1 + 32)];
}

- (PXPhotosCloseButtonController)closeButtonController
{
  closeButtonController = self->_closeButtonController;
  if (!closeButtonController)
  {
    id v4 = [MEMORY[0x1E4FB14D0] photosViewRoundedAccessoryConfigurationWithSymbolName:@"xmark"];
    id v5 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
    uint64_t v6 = [v4 background];
    [v6 _setVisualEffectGroupName:v5];

    uint64_t v7 = [[PXPhotosCloseButtonController alloc] initWithButtonConfiguration:v4];
    BOOL v8 = self->_closeButtonController;
    self->_closeButtonController = v7;

    [(PXPhotosCloseButtonController *)self->_closeButtonController setDelegate:self];
    closeButtonController = self->_closeButtonController;
  }
  return closeButtonController;
}

- (PXPhotosStatusToggleButtonController)statusButtonController
{
  statusButtonController = self->_statusButtonController;
  if (!statusButtonController)
  {
    id v4 = [(PXPhotosUIViewController *)self viewModel];
    id v5 = [v4 footerViewModel];

    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
    BOOL v8 = [v6 _roundedButtonConfigurationWithSymbolName:@"info" inset:7 fontSize:v7 weight:7.0 groupName:14.0];

    uint64_t v9 = [[PXPhotosStatusToggleButtonController alloc] initWithFooterViewModel:v5 buttonConfiguration:v8];
    BOOL v10 = self->_statusButtonController;
    self->_statusButtonController = v9;

    [(PXPhotosStatusToggleButtonController *)self->_statusButtonController setDelegate:self];
    statusButtonController = self->_statusButtonController;
  }
  return statusButtonController;
}

- (PXPhotosFilterToggleButtonController)filterButtonController
{
  if (!self->_filterButtonController)
  {
    id v3 = [(PXPhotosUIViewController *)self configuration];
    int v4 = [v3 enableFilterButton];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4FB14D0] photosViewRoundedAccessoryConfigurationWithSymbolName:@"line.3.horizontal.decrease"];
      uint64_t v6 = [(PXPhotosUIViewController *)self toolbarBackdropGroupName];
      uint64_t v7 = [v5 background];
      [v7 _setVisualEffectGroupName:v6];

      BOOL v8 = [PXPhotosFilterToggleButtonController alloc];
      uint64_t v9 = [(PXPhotosUIViewController *)self viewModel];
      BOOL v10 = [(PXPhotosFilterToggleButtonController *)v8 initWithViewModel:v9 buttonConfiguration:v5];
      filterButtonController = self->_filterButtonController;
      self->_filterButtonController = v10;
    }
  }
  int v12 = self->_filterButtonController;
  return v12;
}

- (NSString)toolbarBackdropGroupName
{
  toolbarBackdropGroupName = self->_toolbarBackdropGroupName;
  if (!toolbarBackdropGroupName)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"PhotosToolbar-%p", self);
    int v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_toolbarBackdropGroupName;
    self->_toolbarBackdropGroupName = v4;

    toolbarBackdropGroupName = self->_toolbarBackdropGroupName;
  }
  return toolbarBackdropGroupName;
}

- (PXPhotosViewUIInteraction)interaction
{
  id v2 = [(PXPhotosUIViewController *)self contentController];
  id v3 = [v2 interaction];

  return (PXPhotosViewUIInteraction *)v3;
}

- (id)scrollView
{
  id v2 = [(PXPhotosUIViewController *)self gridView];
  id v3 = [v2 scrollViewController];
  int v4 = [v3 scrollView];

  return v4;
}

- (PXPhotosViewEventTracker)eventTracker
{
  id v2 = [(PXPhotosUIViewController *)self contentController];
  id v3 = [v2 eventTracker];

  return (PXPhotosViewEventTracker *)v3;
}

- (id)currentDataSource
{
  if ([(PXPhotosUIViewController *)self isViewLoaded])
  {
    id v3 = [(PXPhotosUIViewController *)self contentController];
    int v4 = [v3 viewModel];
    [v4 currentDataSource];
  }
  else
  {
    id v3 = [(PXPhotosUIViewController *)self configuration];
    int v4 = [v3 dataSourceManager];
    [v4 dataSource];
  id v5 = };

  return v5;
}

- (PXGView)gridView
{
  id v2 = [(PXPhotosUIViewController *)self contentController];
  id v3 = [v2 gridView];

  return (PXGView *)v3;
}

- (PXPhotosViewModel)viewModel
{
  id v2 = [(PXPhotosUIViewController *)self contentController];
  id v3 = [v2 viewModel];

  return (PXPhotosViewModel *)v3;
}

- (PXPhotosViewModel)viewModelIfLoaded
{
  id v2 = [(PXPhotosUIViewController *)self contentControllerIfLoaded];
  id v3 = [v2 viewModel];

  return (PXPhotosViewModel *)v3;
}

- (PXPhotosContentController)contentControllerIfLoaded
{
  return self->_contentController;
}

- (PXPhotosContentController)contentController
{
  contentController = self->_contentController;
  if (!contentController)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXPhotosUIViewController.m" lineNumber:253 description:@"Content controller should not be accessed before viewDidLoad"];

    contentController = self->_contentController;
  }
  return contentController;
}

- (NSString)description
{
  id v3 = [(PXPhotosUIViewController *)self contentControllerIfLoaded];
  int v4 = [v3 viewModel];

  if (v4)
  {
    id v5 = NSString;
    uint64_t v6 = [v4 currentDataSource];
    uint64_t v7 = [v6 containerCollection];
    BOOL v8 = [v7 localizedTitle];
    [v5 stringWithFormat:@"containerCollection=%@", v8];
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = @"not loaded";
  }
  BOOL v10 = NSString;
  unint64_t v11 = (objc_class *)objc_opt_class();
  int v12 = NSStringFromClass(v11);
  BOOL v13 = [v10 stringWithFormat:@"<%@:%p; %@>", v12, self, v9];

  return (NSString *)v13;
}

- (void)dealloc
{
  PXUnregisterPreferencesObserver(self);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_filterTimeoutObserver];

  filterTimeoutObserver = self->_filterTimeoutObserver;
  self->_filterTimeoutObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosUIViewController;
  [(PXPhotosUIViewController *)&v5 dealloc];
}

- (PXPhotosUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosUIViewController.m", 228, @"%s is not available as initializer", "-[PXPhotosUIViewController initWithNibName:bundle:]");

  abort();
}

- (PXPhotosUIViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosUIViewController.m", 224, @"%s is not available as initializer", "-[PXPhotosUIViewController initWithCoder:]");

  abort();
}

- (PXPhotosUIViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosUIViewController;
  id v5 = [(PXPhotosUIViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (PXPhotosViewConfiguration *)v6;

    [(PXPhotosViewConfiguration *)v5->_configuration setIsEmbedded:0];
  }

  return v5;
}

+ (id)_roundedButtonConfigurationWithSymbolName:(id)a3 inset:(double)a4 fontSize:(double)a5 weight:(int64_t)a6 groupName:(id)a7
{
  return (id)[a1 _roundedButtonConfigurationWithSymbolName:a3 useOriginalSymbolAppearance:0 inset:a6 fontSize:a7 weight:a4 groupName:a5];
}

+ (BOOL)shouldReconfigureOpacityOfSecondaryToolbarControllerForViewModelChange:(unint64_t)a3
{
  return (a3 >> 61) & 1;
}

+ (void)_configureOpacityOfSecondaryToolbarController:(id)a3 withViewModel:(id)a4 secondaryToolbarAlpha:(double)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 chromeOpacity];
  }
  else {
    double v9 = 1.0;
  }
  [v10 setAlpha:v9 * a5];
  objc_msgSend(v10, "setShouldAlwaysBeConsideredVisibleForLayoutPurpose:", ((unint64_t)objc_msgSend(v8, "chromeItemsToBeConsideredVisibleForLayoutPurpose") >> 5) & 1);
}

+ (void)configureOpacityOfSecondaryToolbarController:(id)a3 withViewModel:(id)a4
{
}

- (void)ppt_navigateToAssetReference:(id)a3 revealInOneUp:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 asset];
  unint64_t v11 = [v9 assetCollection];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__PXPhotosUIViewController_PPT__ppt_navigateToAssetReference_revealInOneUp_completionHandler___block_invoke;
  v13[3] = &unk_1E5DCEE10;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(PXPhotosUIViewController *)self ppt_navigateToAsset:v10 inAssetContainer:v11 revealInOneUp:v5 completionHandler:v13];
}

void __94__PXPhotosUIViewController_PPT__ppt_navigateToAssetReference_revealInOneUp_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = 0;
  id v11 = v5;
  if (a2 == 1 && !v5)
  {
    id v7 = [*(id *)(a1 + 32) navigationController];
    uint64_t v6 = [v7 topViewController];

    id v8 = [v6 presentedViewController];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v8 topViewController];
      }
      else
      {
        id v9 = v8;
      }
      id v10 = v9;

      uint64_t v6 = v10;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)ppt_scrollToPreviousAssetOfAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXPhotosUIViewController *)self viewModel];
  id v9 = [v8 currentDataSource];

  long long v17 = 0u;
  long long v18 = 0u;
  if (v9) {
    [v9 indexPathForAssetReference:v6];
  }
  id v10 = [(PXPhotosUIViewController *)self contentController];
  id v11 = v10;
  if (v10)
  {
    v14[0] = v17;
    v14[1] = v18;
    [v10 selectableIndexPathClosestToIndexPath:v14 inDirection:6];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  long long v17 = v15;
  long long v18 = v16;

  long long v15 = v17;
  long long v16 = v18;
  id v12 = [v9 assetReferenceAtItemIndexPath:&v15];
  [(PXPhotosUIViewController *)self scrollToCenterAssetReference:v12 completion:v7];

  return v12;
}

- (id)ppt_navigateToBottom
{
  [(PXPhotosUIViewController *)self scrollToBottomAnimated:0];
  return [(PXPhotosUIViewController *)self assetReferenceForCurrentScrollPosition];
}

- (void)ppt_navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 completionHandler:(id)a6
{
}

@end