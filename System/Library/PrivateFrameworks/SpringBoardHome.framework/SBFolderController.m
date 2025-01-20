@interface SBFolderController
+ (Class)_contentViewClass;
+ (Class)configurationClass;
+ (Class)listViewClass;
+ (NSString)iconLocation;
- (BOOL)_allowUserInteraction;
- (BOOL)_canAnyIconViewBeVisiblySettled;
- (BOOL)_iconAppearsOnCurrentPage:(id)a3;
- (BOOL)_isValidPageIndex:(int64_t)a3;
- (BOOL)_listIndexIsVisible:(unint64_t)a3;
- (BOOL)addsFocusGuidesForWrapping;
- (BOOL)canAcceptFolderIconDrags;
- (BOOL)closesAfterDragExits;
- (BOOL)disablesScrollingWhileIconDragIsDropping;
- (BOOL)doesPageContainIconListView:(int64_t)a3;
- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6;
- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4;
- (BOOL)folderView:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderView:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5;
- (BOOL)folderView:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6;
- (BOOL)hasDock;
- (BOOL)isActive;
- (BOOL)isAnimating;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isEditing;
- (BOOL)isOpen;
- (BOOL)isOverridingPageViewControllerAppearanceStateToRemainDisappeared;
- (BOOL)isPageControlHidden;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isRotating;
- (BOOL)isScrollDecelerating;
- (BOOL)isScrollDragging;
- (BOOL)isScrollTracking;
- (BOOL)isScrolling;
- (BOOL)isVertical;
- (BOOL)restoreExpandedPathIdentifiers:(id)a3;
- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)shouldOpenFolderIcon:(id)a3;
- (BOOL)shouldViewControllersAppearVisibleForListView:(id)a3;
- (BOOL)suspendsWallpaperAnimationWhileOpen;
- (BOOL)wasFolderCancelable;
- (BSInvalidatable)statusBarAssertion;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (Class)controllerClassForFolder:(id)a3;
- (Class)iconListViewClassForFolderView:(id)a3;
- (NSArray)_viewControllersToNotifyForViewObscuration;
- (NSArray)iconListViews;
- (NSArray)visibleIconListViews;
- (NSIndexPath)currentIndexPath;
- (NSMutableDictionary)extraAssertions;
- (NSSet)presentedIconLocations;
- (NSString)description;
- (NSString)originatingIconLocation;
- (SBFolder)folder;
- (SBFolderController)deepestFolderController;
- (SBFolderController)initWithConfiguration:(id)a3;
- (SBFolderController)innerFolderController;
- (SBFolderController)outerFolderController;
- (SBFolderControllerAnimationContext)animationContext;
- (SBFolderControllerConfiguration)configuration;
- (SBFolderControllerDelegate)folderDelegate;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBFolderView)folderViewIfLoaded;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconImageAppearance)effectiveIconImageAppearance;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBHIconModel)iconModel;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListModel)currentIconListModel;
- (SBIconListPageControl)pageControl;
- (SBIconListView)currentIconListView;
- (SBIconListView)dockListView;
- (SBIconView)folderIconView;
- (SBIconViewProviding)iconViewProvider;
- (UIColor)defaultAccessibilityTintColor;
- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3;
- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderView:(id)a3;
- (UIEdgeInsets)statusBarEdgeInsetsForFolderController:(id)a3;
- (UIEdgeInsets)statusBarInsetsForOrientation:(int64_t)a3;
- (UIStatusBar)fakeStatusBar;
- (UIView)contentView;
- (UIView)fallbackIconContainerView;
- (UIView)headerView;
- (UIWindow)animationWindow;
- (_UILegibilitySettings)legibilitySettings;
- (double)currentScrollingOffset;
- (double)minimumHomeScreenScaleForFolderController:(id)a3;
- (double)minimumHomeScreenScaleForFolderControllerBackgroundView:(id)a3;
- (double)minimumHomeScreenScaleForFolderView:(id)a3;
- (double)pageControlAlpha;
- (id)_dragDelegate;
- (id)_makeContentViewWithConfiguration:(id)a3;
- (id)_newAnimatorForZoomUp:(BOOL)a3;
- (id)accessibilityTintColorForScreenRect:(CGRect)a3;
- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (id)beginModifyingDockOffscreenFractionForReason:(id)a3;
- (id)beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason:(id)a3;
- (id)borrowScalingView;
- (id)cancelTouchesForAllCustomIconImageViewControllersForReason:(id)a3;
- (id)context;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)disableAutoScrollForReason:(id)a3;
- (id)fakeStatusBarForFolderController:(id)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4;
- (id)firstIconViewWithOptions:(unint64_t)a3 iconPassingTest:(id)a4;
- (id)folderController:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4;
- (id)folderController:(id)a3 iconAnimatorForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6 initialDelay:(double *)a7;
- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6;
- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6;
- (id)folderControllerForFolder:(id)a3;
- (id)folderControllerWantsToHideStatusBar:(id)a3 animated:(BOOL)a4;
- (id)folderView:(id)a3 accessibilityTintColorForRect:(CGRect)a4;
- (id)folderView:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5;
- (id)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5;
- (id)folderView:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6;
- (id)folderView:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6;
- (id)iconListViewAtIndex:(unint64_t)a3;
- (id)iconListViewAtPoint:(CGPoint)a3;
- (id)iconListViewForDrag:(id)a3;
- (id)iconListViewForIconListModelIndex:(unint64_t)a3;
- (id)iconListViewForTouch:(id)a3;
- (id)iconLocation;
- (id)iconLocationForFolderView:(id)a3;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5;
- (id)keepIconImageViewControllersSnapshotsOfType:(unint64_t)a3 inAllPagesExcluding:(id)a4 forReason:(id)a5;
- (id)keyCommands;
- (id)matchMoveSourceViewForIconView:(id)a3;
- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6;
- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4;
- (id)pageViewControllersForLeadingPageIndex:(int64_t)a3 trailingPageIndex:(int64_t)a4;
- (id)preferredFocusEnvironments;
- (id)statusBarStyleRequestForFolderController:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewControllersForPageIndex:(int64_t)a3;
- (id)visiblePageViewControllers;
- (int64_t)currentPageIndex;
- (int64_t)defaultPageIndex;
- (int64_t)firstIconPageIndex;
- (int64_t)lastIconPageIndex;
- (int64_t)maximumPageIndex;
- (int64_t)minimumPageIndex;
- (int64_t)nearestIconPageIndex;
- (int64_t)orientation;
- (int64_t)pageIndexForIconListModelIndex:(unint64_t)a3;
- (int64_t)pageIndexForIconListViewIndex:(unint64_t)a3;
- (int64_t)userInterfaceLayoutDirection;
- (unint64_t)_depth;
- (unint64_t)allowedOrientations;
- (unint64_t)contentVisibility;
- (unint64_t)effectiveContentVisibility;
- (unint64_t)effectiveContentVisibilityFolderHasInnerFolder:(BOOL)a3;
- (unint64_t)iconImageViewControllerPresentationModeForIconView:(id)a3;
- (unint64_t)iconListModelIndexForPageIndex:(int64_t)a3;
- (unint64_t)iconListViewCount;
- (unint64_t)iconListViewIndexForIconListModelIndex:(unint64_t)a3;
- (unint64_t)iconListViewIndexForPageIndex:(int64_t)a3;
- (unint64_t)userInterfaceLayoutDirectionHandling;
- (void)_addFakeStatusBarView;
- (void)_beginTrackingIconViewWithCustomImageViewController:(id)a3;
- (void)_cancelCloseFolderTimer;
- (void)_cancelTouchesForAllCustomIconImageViewControllers;
- (void)_cancelTouchesForCustomIconImageViewController:(id)a3;
- (void)_clearIconAnimator;
- (void)_closeFolder;
- (void)_closeFolderTimerFired;
- (void)_compactFolder;
- (void)_configureForInnerFolderController:(id)a3;
- (void)_disableTouchesOnAllCustomIconImageViewControllers;
- (void)_enableTouchesOnAllCustomIconImageViewControllers;
- (void)_endTrackingIconViewWithCustomImageViewController:(id)a3;
- (void)_fadeHomescreenAndDockIfNecessaryForFolderOpen:(BOOL)a3;
- (void)_handleEndEditingKeyCommand:(id)a3;
- (void)_hideFakeStatusBarForReason:(id)a3 animated:(BOOL)a4;
- (void)_hideStatusBarForReason:(id)a3 animated:(BOOL)a4;
- (void)_invalidate;
- (void)_invalidateAllCancelTouchesAssertions;
- (void)_removeFakeStatusBarAndAssertionIfExists;
- (void)_removeIconImageViewControllerKeepStaticAssertion:(id)a3;
- (void)_removePageViewControllerAppearStateOverrideAssertion:(id)a3;
- (void)_resetFakeStatusBarFrameOnly;
- (void)_resetFakeStatusBarMatchMoveAnimation;
- (void)_resetFakeStatusBarSettingsIfNecessary;
- (void)_resetIconLists;
- (void)_setCloseFolderTimerIfNecessary;
- (void)_setHomescreenAndDockAlpha:(double)a3;
- (void)_unhideFakeStatusBarForReason:(id)a3 animated:(BOOL)a4;
- (void)_unhideStatusBarForReason:(id)a3;
- (void)_updateAssociatedControllerStateAnimated:(BOOL)a3;
- (void)_updateFolderRequiredTrailingEmptyListCount;
- (void)_updateHomescreenAndDockFade;
- (void)_updatePresentationModeForIconView:(id)a3;
- (void)_updatePresentationModeForIconViews;
- (void)_updateStateOfAssociatedController:(id)a3 animated:(BOOL)a4;
- (void)addAssertionsFromInnerFolderController:(id)a3;
- (void)beginEditingTitle;
- (void)cancelScrolling;
- (void)configureInnerFolderControllerConfiguration:(id)a3;
- (void)dealloc;
- (void)delegateDidChange;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateDisplayedIconViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)fadeContentForMagnificationFraction:(double)a3;
- (void)fadeContentForMinificationFraction:(double)a3;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6;
- (void)folderController:(id)a3 willCreateInnerFolderControllerWithConfiguration:(id)a4;
- (void)folderController:(id)a3 willRemoveFakeStatusBar:(id)a4;
- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7;
- (void)folderControllerDidClose:(id)a3;
- (void)folderControllerDidEndScrolling:(id)a3;
- (void)folderControllerDidOpen:(id)a3;
- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4;
- (void)folderControllerShouldEndEditing:(id)a3;
- (void)folderControllerWillBeginScrolling:(id)a3;
- (void)folderControllerWillClose:(id)a3;
- (void)folderControllerWillOpen:(id)a3;
- (void)folderView:(id)a3 currentPageIndexDidChange:(int64_t)a4;
- (void)folderView:(id)a3 didAddIconListView:(id)a4;
- (void)folderView:(id)a3 didRemoveIconListView:(id)a4;
- (void)folderView:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5;
- (void)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5;
- (void)folderView:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5;
- (void)folderView:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5;
- (void)folderView:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6;
- (void)folderView:(id)a3 willAnimateScrollToPageIndex:(int64_t)a4;
- (void)folderViewDidChangeOrientation:(id)a3;
- (void)folderViewDidEndScrolling:(id)a3;
- (void)folderViewDidScroll:(id)a3;
- (void)folderViewShouldBeginEditing:(id)a3;
- (void)folderViewShouldClose:(id)a3 withPinchGesture:(id)a4;
- (void)folderViewShouldEndEditing:(id)a3;
- (void)folderViewWillBeginScrolling:(id)a3;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
- (void)iconListView:(id)a3 iconDropSessionDidEnd:(id)a4;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)iconViewDidDismissContextMenu:(id)a3;
- (void)iconViewWillPresentContextMenu:(id)a3;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)loadView;
- (void)minimumHomeScreenScaleDidChange;
- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6;
- (void)noteIconDrag:(id)a3 didChangeInIconListView:(id)a4;
- (void)noteIconDrag:(id)a3 didEnterIconListView:(id)a4;
- (void)noteIconDrag:(id)a3 didExitIconListView:(id)a4;
- (void)noteIconDragDidEnd:(id)a3;
- (void)noteUserIsInteractingWithIcons;
- (void)parentDelegateDidChange;
- (void)popFolderAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepareForAnimation:(id)a3 withTargetIcon:(id)a4;
- (void)prepareToLaunchTappedIcon:(id)a3 completionHandler:(id)a4;
- (void)pushFolderIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)removeAssertionsFromInnerFolderController:(id)a3;
- (void)returnScalingView;
- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3;
- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationContext:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setCurrentPageIndex:(int64_t)a3;
- (void)setCurrentPageIndexToListDirectlyContainingIcon:(id)a3 animated:(BOOL)a4;
- (void)setCurrentPageIndexToListDirectlyContainingIcon:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDefaultAccessibilityTintColor:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExtraAssertions:(id)a3;
- (void)setFakeStatusBar:(id)a3;
- (void)setFolder:(id)a3;
- (void)setFolderDelegate:(id)a3;
- (void)setFolderIconImageCache:(id)a3;
- (void)setFolderIconView:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setOpen:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOriginatingIconLocation:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlAlpha:(double)a3;
- (void)setPageControlHidden:(BOOL)a3;
- (void)setRotating:(BOOL)a3;
- (void)setScrollingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setStatusBarAssertion:(id)a3;
- (void)setWasFolderCancelable:(BOOL)a3;
- (void)unscatterAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5;
- (void)updateAppearanceStateForPageViewControllers:(BOOL)a3;
- (void)updateContentViewOcclusion;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBFolderController

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![(SBFolderController *)self isPresentingIconLocation:v9])
  {
    v18 = 0;
    goto LABEL_17;
  }
  v10 = [(SBFolderController *)self folderView];
  v11 = v10;
  long long v27 = 0u;
  long long v28 = 0u;
  if (v10) {
    [v10 visibleColumnRangeExcludingAdditionalWidthKeptVisible];
  }
  v12 = [(SBFolderController *)self iconListViews];
  if (![v12 count])
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  unint64_t v13 = 0;
  while (1)
  {
    v14 = [v12 objectAtIndex:v13];
    v15 = [v14 iconLocation];
    int v16 = [v9 isEqualToString:v15];

    if (!v16) {
      goto LABEL_13;
    }
    v17 = [v14 displayedIconViewForIcon:v8];
    if (!v17) {
      goto LABEL_13;
    }
    v18 = v17;
    v19 = [v17 location];
    int v20 = [v19 isEqualToString:v9];

    if (v20)
    {
      if ((v5 & 8) == 0) {
        break;
      }
      [v14 iconColumnsForCurrentOrientation];
      v26[0] = v27;
      v26[1] = v28;
      unint64_t VisibleColumnsForIconListIndex = SBVisibleColumnRangeGetVisibleColumnsForIconListIndex((unint64_t *)v26, v13);
      unint64_t v23 = v22;
      uint64_t v24 = [v14 coordinateForIcon:v8];
      if (v24 - 1 >= VisibleColumnsForIconListIndex && v24 - 1 - VisibleColumnsForIconListIndex < v23) {
        break;
      }
    }

LABEL_13:
    if (++v13 >= [v12 count]) {
      goto LABEL_14;
    }
  }

LABEL_15:
LABEL_17:

  return v18;
}

void __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!*(unsigned char *)(a1 + 80)
    || ((uint64_t v6 = [*(id *)(a1 + 32) coordinateForIconAtIndex:a3], v7 = *(void *)(a1 + 56), v6 - 1 >= v7)
      ? (BOOL v8 = v6 - 1 - v7 >= *(void *)(a1 + 64))
      : (BOOL v8 = 1),
        !v8))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __50__SBFolderController_viewControllersForPageIndex___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 customIconImageViewController];
  if (v3)
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    BOOL v8 = v3;
    if (v4)
    {
      [v4 addObject:v3];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    v3 = v8;
  }
}

- (UIView)contentView
{
  [(SBFolderController *)self loadViewIfNeeded];
  contentView = self->_contentView;
  return (UIView *)contentView;
}

- (NSArray)iconListViews
{
  return [(SBFolderView *)self->_contentView iconListViews];
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (SBFolderController)deepestFolderController
{
  uint64_t v2 = [(SBFolderController *)self innerFolderController];
  if (v2)
  {
    v3 = (void *)v2;
    v4 = 0;
    do
    {
      id v5 = v3;

      v3 = [v5 innerFolderController];

      v4 = v5;
    }
    while (v3);
  }
  else
  {
    id v5 = 0;
  }
  return (SBFolderController *)v5;
}

- (SBFolderController)innerFolderController
{
  uint64_t v2 = [(SBNestingViewController *)self nestedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SBFolderController *)v3;
}

void __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v5 iconColumnsForCurrentOrientation];
    unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    long long v8 = *(_OWORD *)(a1 + 72);
    v22[0] = *(_OWORD *)(a1 + 56);
    v22[1] = v8;
    uint64_t VisibleColumnsForIconListIndex = SBVisibleColumnRangeGetVisibleColumnsForIconListIndex((unint64_t *)v22, v7);
    uint64_t v11 = v10;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke_2;
    v14[3] = &unk_1E6AB13D0;
    char v21 = *(unsigned char *)(a1 + 88);
    id v15 = v6;
    uint64_t v18 = VisibleColumnsForIconListIndex;
    uint64_t v19 = v11;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v13;
    uint64_t v20 = a3;
    [v15 enumerateIconViewsUsingBlock:v14];
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (void)enumerateDisplayedIconViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(SBFolderController *)self folderView];
  long long v8 = v7;
  long long v26 = 0u;
  long long v27 = 0u;
  if (v7) {
    [v7 visibleColumnRangeExcludingAdditionalWidthKeptVisible];
  }
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v18 = v26;
  uint64_t v13 = __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke;
  v14 = &unk_1E6AB13F8;
  long long v19 = v27;
  id v16 = &v22;
  uint64_t v17 = v21;
  BOOL v20 = (a3 & 8) != 0;
  id v9 = v6;
  id v15 = v9;
  [v8 enumerateIconListViewsUsingBlock:&v11];
  if ((a3 & 0x10) != 0 && !*((unsigned char *)v23 + 24))
  {
    uint64_t v10 = [(SBFolderController *)self innerFolderController];
    [v10 enumerateDisplayedIconViewsWithOptions:a3 usingBlock:v9];
  }
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
}

- (BOOL)hasDock
{
  uint64_t v2 = [(SBFolderController *)self folder];
  char v3 = [v2 isRootFolder];

  return v3;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v5 = a4;
  [v5 removeObserver:self];
  id v6 = [v5 customIconImageViewController];
  unint64_t v7 = v6;
  if (v6)
  {
    long long v8 = [v6 view];
    int v9 = [v8 isDescendantOfView:v5];
    uint64_t v10 = SBLogRootController();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (!v9)
    {
      if (v11) {
        -[SBFolderController iconListView:didRemoveIconView:].cold.5();
      }

      goto LABEL_17;
    }
    if (v11) {
      -[SBFolderController iconListView:didRemoveIconView:].cold.4();
    }

    [v7 willMoveToParentViewController:0];
    [v8 removeFromSuperview];
    [v7 removeFromParentViewController];
    if (objc_msgSend(v7, "bs_isAppearingOrAppeared"))
    {
      uint64_t v12 = SBLogRootController();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SBFolderController iconListView:didRemoveIconView:]();
      }

      objc_msgSend(v7, "bs_beginAppearanceTransition:animated:", 0, 0);
      uint64_t v13 = SBLogRootController();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
    }
    else
    {
      if ([v7 _appearState] != 3)
      {
LABEL_17:
        [(SBFolderController *)self _endTrackingIconViewWithCustomImageViewController:v5];

        goto LABEL_18;
      }
      uint64_t v13 = SBLogRootController();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:

        objc_msgSend(v7, "bs_endAppearanceTransition");
        [(NSMutableSet *)self->_appearanceTransitioningCustomImageViewControllers removeObject:v7];
        goto LABEL_17;
      }
    }
    -[SBFolderController iconListView:didRemoveIconView:]();
    goto LABEL_16;
  }
LABEL_18:
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self presentedIconLocations];
  id v6 = [v5 allObjects];
  unint64_t v7 = [(SBFolderController *)self firstIconViewForIcon:v4 inLocations:v6];

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[SBFolderController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return [(SBFolderController *)self iconViewForIcon:a3 location:a4 options:0];
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 addObserver:self];
  uint64_t v8 = [v7 customIconImageViewController];
  if (v8)
  {
    [(SBFolderController *)self _updatePresentationModeForIconView:v7];
    uint64_t v9 = [v8 view];
    uint64_t v10 = [v9 superview];

    if (!v10) {
      NSLog(&cfstr_NoSuperview.isa);
    }
    if (([v7 isIconImageViewBorrowed] & 1) == 0)
    {
      BOOL v11 = [(SBFolderController *)self parentViewControllerForCustomIconImageViewControllerForIconView:v7];
      objc_msgSend(v11, "bs_addChildViewController:", v8);
      uint64_t v12 = SBLogRootController();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SBFolderController iconListView:didAddIconView:]();
      }

      BOOL v13 = [(SBFolderController *)self shouldViewControllersAppearVisibleForListView:v6];
      if (v13 != objc_msgSend(v8, "bs_isAppearingOrAppeared"))
      {
        v14 = SBLogRootController();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[SBFolderController iconListView:didAddIconView:]();
        }

        objc_msgSend(v8, "bs_endAppearanceTransition:", v13);
        [(NSMutableSet *)self->_appearanceTransitioningCustomImageViewControllers removeObject:v8];
      }
      objc_msgSend(v7, "setCustomIconImageViewHitTestingDisabled:", -[SBFolderController _isHitTestingDisabledOnCustomIconImageViewControllers](self, "_isHitTestingDisabledOnCustomIconImageViewControllers"));
    }
    [(SBFolderController *)self _beginTrackingIconViewWithCustomImageViewController:v7];
  }
}

- (void)_compactFolder
{
  id v2 = [(SBFolderController *)self folder];
  [v2 compactLists];
}

- (void)loadView
{
  id v7 = [(SBFolderController *)self configuration];
  char v3 = [(SBFolderController *)self _makeContentViewWithConfiguration:v7];
  contentView = self->_contentView;
  self->_contentView = v3;

  [(SBFolderView *)self->_contentView setDelegate:self];
  [(SBFolderController *)self setConfiguration:0];
  id v5 = [[SBFolderContainerView alloc] initWithFolderView:self->_contentView];
  containerView = self->_containerView;
  self->_containerView = v5;

  [(SBFolderController *)self setView:self->_containerView];
}

- (void)setConfiguration:(id)a3
{
}

- (SBFolderControllerConfiguration)configuration
{
  return self->_configuration;
}

- (id)_makeContentViewWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClass")), "initWithConfiguration:", v3);

  return v4;
}

- (void)folderView:(id)a3 currentPageIndexDidChange:(int64_t)a4
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"SBFolderControllerCurrentPageIndexDidChangeNotification" object:self];
}

- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  uint64_t v10 = [(SBFolderController *)self folderIconView];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  [(SBFolderController *)self setOpen:a4 == 1];
  if ([v9 isAnimated]) {
    [(SBFolderController *)self setAnimating:1];
  }
  uint64_t v12 = [(SBFolderController *)self folderView];
  if (a4 == 1)
  {
    -[SBFolderController setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", [v10 visibleMiniIconListIndex], 0);
    if (!IsReduceMotionEnabled) {
      [v10 setAllIconElementsButLabelHidden:1];
    }
    [(SBFolderController *)self folderControllerWillOpen:self];
    double v13 = 1.0;
  }
  else
  {
    uint64_t v14 = objc_msgSend(v12, "iconListViewIndexForPageIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
    if (self->_isEditing) {
      [v10 scrollToGapOrTopIfFullOfPage:v14 animated:0];
    }
    else {
      [v10 scrollToTopOfPage:v14 animated:0];
    }
    [(SBFolderController *)self folderControllerWillClose:self];
    double v13 = 0.0;
  }
  BOOL v15 = !IsReduceMotionEnabled;
  uint64_t v16 = [v9 isAnimated];
  long long v17 = [v9 transitionAnimationFactory];
  long long v18 = [v17 settings];
  [v12 willTransitionAnimated:v16 withSettings:v18];

  [(SBFolderController *)self fadeContentForMinificationFraction:v13];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke;
  v24[3] = &unk_1E6AB1358;
  BOOL v27 = v15;
  BOOL v28 = a4 == 1;
  id v25 = v10;
  long long v26 = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_3;
  v21[3] = &unk_1E6AB1380;
  BOOL v23 = a4 == 1;
  void v21[4] = self;
  id v22 = v25;
  id v19 = v25;
  [v9 animateAlongsideTransition:v24 completion:v21];
  v20.receiver = self;
  v20.super_class = (Class)SBFolderController;
  -[SBNestingViewController viewWillTransitionToSize:forOperation:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_forOperation_withTransitionCoordinator_, a4, v9, width, height);
}

void __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isCancelled];
  int v5 = v4;
  if (!*(unsigned char *)(a1 + 48))
  {
    BOOL v6 = *(unsigned char *)(a1 + 49) != 0;
    if (v4) {
      BOOL v6 = *(unsigned char *)(a1 + 49) == 0;
    }
    double v7 = 1.0;
    if (v6) {
      double v7 = 0.0;
    }
    [*(id *)(a1 + 32) setAlpha:v7];
  }
  if (([v3 isInteractive] & 1) == 0)
  {
    int v8 = (*(unsigned char *)(a1 + 49) == 0) ^ v5;
    if (v8) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
    int v10 = [v3 transitionWasRestarted];
    if (![v3 isAnimated])
    {
      [*(id *)(a1 + 40) fadeContentForMinificationFraction:v9];
      if (((v5 | v10) & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
    BOOL v11 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v12 = [v11 iconAnimationSettings];

    if (v8) {
      [v12 folderCloseSettings];
    }
    else {
    double v13 = [v12 folderOpenSettings];
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F4F898];
    BOOL v15 = [v13 innerFolderFadeSettings];
    uint64_t v16 = [v15 BSAnimationSettings];
    long long v17 = [v14 factoryWithSettings:v16];

    [v17 setAllowsAdditiveAnimations:1];
    int v18 = v5 | v10;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_2;
    id v25 = &unk_1E6AAC838;
    if (v18) {
      uint64_t v19 = 614;
    }
    else {
      uint64_t v19 = 610;
    }
    uint64_t v26 = *(void *)(a1 + 40);
    double v27 = v9;
    [MEMORY[0x1E4F4F898] animateWithFactory:v17 additionalDelay:v19 options:&v22 actions:0.0];

    if (v18)
    {
LABEL_21:
      if (v5) {
        BOOL v20 = *(unsigned char *)(a1 + 49) == 0;
      }
      else {
        BOOL v20 = *(unsigned char *)(a1 + 49) != 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "setOpen:", v20, v22, v23, v24, v25);
      char v21 = *(void **)(a1 + 40);
      if (v8) {
        [v21 folderControllerWillClose:v21];
      }
      else {
        [v21 folderControllerWillOpen:v21];
      }
    }
  }
LABEL_27:
}

- (void)fadeContentForMinificationFraction:(double)a3
{
  id v4 = [(SBFolderController *)self folderView];
  [v4 fadeContentForMinificationFraction:a3];
}

- (SBIconView)folderIconView
{
  return self->_folderIconView;
}

- (void)_updateStateOfAssociatedController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_msgSend(v6, "setOpen:", -[SBFolderController isOpen](self, "isOpen"));
  objc_msgSend(v6, "setEditing:animated:", -[SBFolderController isEditing](self, "isEditing"), v4);
  objc_msgSend(v6, "setContentVisibility:", -[SBFolderController contentVisibility](self, "contentVisibility"));
}

- (void)setOpen:(BOOL)a3
{
  if (self->_isOpen != a3)
  {
    self->_isOpen = a3;
    [(SBFolderController *)self _updateAssociatedControllerStateAnimated:0];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isEditing != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_isEditing = a3;
    [(SBFolderController *)self _updateFolderRequiredTrailingEmptyListCount];
    [(SBFolderView *)self->_contentView setEditing:v5 animated:v4];
    [(SBFolderController *)self _updateAssociatedControllerStateAnimated:v4];
  }
}

- (void)_updateAssociatedControllerStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBFolderController *)self innerFolderController];
  if (v5)
  {
    id v6 = v5;
    [(SBFolderController *)self _updateStateOfAssociatedController:v5 animated:v3];
    BOOL v5 = v6;
  }
}

- (void)updateAppearanceStateForPageViewControllers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBFolderController *)self folderView];
  int64_t v52 = 0;
  v53 = 0;
  [v5 getLeadingVisiblePageIndex:&v53 trailingVisiblePageIndex:&v52];
  uint64_t v6 = 1104;
  if (v53 != (objc_class *)self->_leadingVisiblePageIndex
    || (v52 == self->_trailingVisiblePageIndex ? (BOOL v7 = !v3) : (BOOL v7 = 0), !v7))
  {
    if (![(SBFolderController *)self isOverridingPageViewControllerAppearanceStateToRemainDisappeared])
    {
      v37 = v5;
      int v8 = [(SBFolderController *)self visiblePageViewControllers];
      double v9 = [(SBFolderController *)self pageViewControllersForLeadingPageIndex:v53 trailingPageIndex:v52];
      uint64_t v36 = 1104;
      if (v3) {
        appearanceTransitioningCustomImageViewControllers = self->_appearanceTransitioningCustomImageViewControllers;
      }
      else {
        appearanceTransitioningCustomImageViewControllers = 0;
      }
      v38 = appearanceTransitioningCustomImageViewControllers;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v49 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if ((objc_msgSend(v9, "containsObject:", v16, v36) & 1) == 0)
            {
              long long v17 = SBLogRootController();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v16;
                _os_log_debug_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to NO (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v16, "bs_endAppearanceTransition:", 0);
              [(NSMutableSet *)self->_appearanceTransitioningCustomImageViewControllers removeObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
        }
        while (v13);
      }

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      obuint64_t j = v38;
      uint64_t v18 = [(NSMutableSet *)obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v45 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            if ((objc_msgSend(v9, "containsObject:", v22, v36) & 1) == 0
              && ([v11 containsObject:v22] & 1) == 0)
            {
              uint64_t v23 = SBLogRootController();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v22;
                _os_log_debug_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to NO (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v22, "bs_endAppearanceTransition:", 0);
            }
          }
          uint64_t v19 = [(NSMutableSet *)obj countByEnumeratingWithState:&v44 objects:v55 count:16];
        }
        while (v19);
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v24 = v9;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v54 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v41;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v40 + 1) + 8 * k);
            if (v3)
            {
              v30 = SBLogRootController();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v29;
                _os_log_debug_impl(&dword_1D7F0A000, v30, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to YES (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v29, "bs_endAppearanceTransition:", 1);
              [(NSMutableSet *)self->_appearanceTransitioningCustomImageViewControllers removeObject:v29];
            }
            else if (([v11 containsObject:*(void *)(*((void *)&v40 + 1) + 8 * k)] & 1) == 0)
            {
              v31 = SBLogRootController();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v29;
                _os_log_debug_impl(&dword_1D7F0A000, v31, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to YES (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v29, "bs_beginAppearanceTransition:animated:", 1, 0);
              v32 = self->_appearanceTransitioningCustomImageViewControllers;
              if (!v32)
              {
                v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
                v34 = self->_appearanceTransitioningCustomImageViewControllers;
                self->_appearanceTransitioningCustomImageViewControllers = v33;

                v32 = self->_appearanceTransitioningCustomImageViewControllers;
              }
              -[NSMutableSet addObject:](v32, "addObject:", v29, v36);
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v54 count:16];
        }
        while (v26);
      }

      if (v3)
      {
        v35 = self->_appearanceTransitioningCustomImageViewControllers;
        self->_appearanceTransitioningCustomImageViewControllers = 0;
      }
      uint64_t v6 = v36;
      BOOL v5 = v37;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + v6) = v53;
    self->_trailingVisiblePageIndex = v52;
  }
}

- (id)visiblePageViewControllers
{
  BOOL v3 = [(SBFolderController *)self folderView];
  if (([v3 _isValidPageIndex:self->_leadingVisiblePageIndex] & 1) == 0) {
    [v3 getLeadingVisiblePageIndex:&self->_leadingVisiblePageIndex trailingVisiblePageIndex:&self->_trailingVisiblePageIndex];
  }
  BOOL v4 = [(SBFolderController *)self pageViewControllersForLeadingPageIndex:self->_leadingVisiblePageIndex trailingPageIndex:self->_trailingVisiblePageIndex];

  return v4;
}

- (id)pageViewControllersForLeadingPageIndex:(int64_t)a3 trailingPageIndex:(int64_t)a4
{
  if (a3 <= a4)
  {
    int64_t v5 = a3;
    BOOL v4 = 0;
    int64_t v7 = a4 + 1;
    do
    {
      int v8 = [(SBFolderController *)self viewControllersForPageIndex:v5];
      if (v8)
      {
        if (!v4)
        {
          BOOL v4 = [MEMORY[0x1E4F1CA48] array];
        }
        [v4 addObjectsFromArray:v8];
      }

      ++v5;
    }
    while (v7 != v5);
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)viewControllersForPageIndex:(int64_t)a3
{
  BOOL v4 = [(SBFolderController *)self folderView];
  int64_t v5 = [v4 iconListViewForPageIndex:a3];

  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SBFolderController_viewControllersForPageIndex___block_invoke;
  v8[3] = &unk_1E6AB0700;
  v8[4] = &v9;
  [v5 enumerateIconViewsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NSArray)_viewControllersToNotifyForViewObscuration
{
  if ([(SBFolderController *)self isOverridingPageViewControllerAppearanceStateToRemainDisappeared])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v3 = [(SBFolderController *)self visiblePageViewControllers];
  }
  return (NSArray *)v3;
}

- (BOOL)isOverridingPageViewControllerAppearanceStateToRemainDisappeared
{
  return [(NSHashTable *)self->_pageViewControllerAppearStateOverrideAssertions count] != 0;
}

- (BOOL)folderView:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  id v6 = [(SBFolderController *)self folderDelegate];
  int64_t v7 = v6;
  if (v6) {
    char v8 = [v6 folderController:self canChangeCurrentPageIndexToIndex:a4];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (SBFolderControllerDelegate)folderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderDelegate);
  return (SBFolderControllerDelegate *)WeakRetained;
}

- (id)iconLocationForFolderView:(id)a3
{
  BOOL v3 = objc_opt_class();
  return (id)[v3 iconLocation];
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  id v6 = [(SBFolderController *)self folderDelegate];
  int64_t v7 = v6;
  if (v6) {
    char v8 = [v6 folderController:self canChangeCurrentPageIndexToIndex:a4];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

uint64_t __60__SBFolderController_revealIcon_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBFolderController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBFolderController *)self succinctDescriptionBuilder];
  int64_t v5 = [(SBFolderController *)self folder];
  id v6 = (id)[v4 appendObject:v5 withName:@"folder"];

  int64_t v7 = [(SBFolderController *)self folderView];
  id v8 = (id)[v4 appendObject:v7 withName:@"folderView"];

  uint64_t v9 = [(SBFolderController *)self originatingIconLocation];
  char v10 = [v9 isEqualToString:@"SBIconLocationNone"];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(SBFolderController *)self originatingIconLocation];
    id v12 = (id)[v4 appendObject:v11 withName:@"originatingIconLocation"];
  }
  id v13 = (id)[v4 appendObject:self->_pageViewControllerAppearStateOverrideAssertions withName:@"pageViewControllerAppearStateOverrideAssertions" skipIfNil:1];
  return v4;
}

- (NSString)originatingIconLocation
{
  return self->_originatingIconLocation;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (int64_t)firstIconPageIndex
{
  return [(SBFolderView *)self->_contentView firstIconPageIndex];
}

- (unint64_t)iconListViewIndexForPageIndex:(int64_t)a3
{
  BOOL v4 = [(SBFolderController *)self folderView];
  unint64_t v5 = [v4 iconListViewIndexForPageIndex:a3];

  return v5;
}

- (id)iconListViewAtIndex:(unint64_t)a3
{
  BOOL v4 = [(SBFolderController *)self folderView];
  unint64_t v5 = [v4 iconListViewAtIndex:a3];

  return v5;
}

- (BOOL)isScrolling
{
  return [(SBFolderView *)self->_contentView isScrolling];
}

- (unint64_t)iconListModelIndexForPageIndex:(int64_t)a3
{
  BOOL v4 = [(SBFolderController *)self folderView];
  unint64_t v5 = [v4 iconListModelIndexForPageIndex:a3];

  return v5;
}

- (SBIconListModel)currentIconListModel
{
  id v2 = [(SBFolderController *)self folderView];
  BOOL v3 = [v2 currentIconListModel];

  return (SBIconListModel *)v3;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBFolderController *)self folder];
  id v6 = [v5 indexPathForIcon:v4];

  if (v6)
  {
    int64_t v7 = [v5 folderContainingIndexPath:v6 relativeIndexPath:0];
    if (v7 == v5 && (uint64_t v8 = [v6 sbListIndex], v8 != 0x7FFFFFFFFFFFFFFFLL))
    {
      int64_t v10 = [(SBFolderController *)self pageIndexForIconListModelIndex:v8];
      BOOL v9 = v10 == [(SBFolderController *)self currentPageIndex];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(id, BOOL))a5;
  id v9 = a3;
  int64_t v10 = [(SBFolderController *)self folder];
  uint64_t v11 = [v10 indexPathForIcon:v9];

  if (v11)
  {
    int64_t v12 = [(SBFolderController *)self pageIndexForIconListModelIndex:SBFolderRelativeListIndex(v11)];
    int64_t v13 = [(SBFolderController *)self currentPageIndex];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == v12)
    {
      if (v8) {
        v8[2](v8, v12 != 0x7FFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__SBFolderController_revealIcon_animated_completionHandler___block_invoke;
      v14[3] = &unk_1E6AAD4C8;
      BOOL v15 = v8;
      [(SBFolderController *)self setCurrentPageIndex:v12 animated:v5 completion:v14];
    }
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

- (id)folderControllerForFolder:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self folder];

  if (v5 == v4)
  {
    int64_t v7 = self;
  }
  else
  {
    id v6 = [(SBFolderController *)self innerFolderController];
    int64_t v7 = [v6 folderControllerForFolder:v4];
  }
  return v7;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (id)iconListViewForIconListModelIndex:(unint64_t)a3
{
  id v4 = [(SBFolderController *)self folderView];
  id v5 = [v4 iconListViewForIconListModelIndex:a3];

  return v5;
}

- (int64_t)currentPageIndex
{
  return [(SBFolderView *)self->_contentView currentPageIndex];
}

- (int64_t)pageIndexForIconListModelIndex:(unint64_t)a3
{
  id v4 = [(SBFolderController *)self folderView];
  int64_t v5 = [v4 pageIndexForIconListModelIndex:a3];

  return v5;
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  return [(SBFolderView *)self->_contentView setCurrentPageIndex:a3 animated:a4 completion:a5];
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  int64_t v10 = (SBFolderController *)a3;
  id v11 = a5;
  if (v10 == self && a4 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      int64_t v13 = [(SBFolderController *)v10 folderContainerView];
      id v14 = [v12 folderContainerView];

      [v13 setChildFolderContainerView:v14];
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SBFolderController;
  BOOL v15 = [(SBNestingViewController *)&v30 nestingViewController:v10 animationControllerForOperation:a4 onViewController:v11 animated:v6];
  uint64_t v16 = [(SBNestingViewController *)self delegate];
  if (!v15 && (objc_opt_respondsToSelector() & 1) == 0 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v15 = 0;
      goto LABEL_6;
    }
    uint64_t v27 = v10;
    id v18 = v11;
    BOOL v28 = [(SBFolderController *)self folderDelegate];
    double v29 = 0.0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_29;
      }
      uint64_t v22 = [v28 folderController:self iconAnimatorForOperation:a4 onViewController:v18 animated:1 initialDelay:&v29];
LABEL_25:
      if (v22)
      {
        BOOL v15 = [[SBHomeScreenIconTransitionAnimator alloc] initWithIconAnimator:v22 childViewController:v18 operation:a4 != 1];
        [(SBHomeScreenIconTransitionAnimator *)v15 setInitialDelay:v29];
        if (objc_opt_respondsToSelector()) {
          [v28 folderController:self willUseIconTransitionAnimator:v15 forOperation:a4 onViewController:v18 animated:1];
        }

        goto LABEL_30;
      }
LABEL_29:
      BOOL v15 = 0;
LABEL_30:

      goto LABEL_6;
    }
    id v19 = v18;
    uint64_t v20 = [v19 folder];
    char v21 = [v20 icon];

    if (v21
      && +[SBScaleIconZoomAnimator validateAnimationContainer:v27 targetIcon:v21])
    {
      if (!UIAccessibilityIsReduceMotionEnabled())
      {
        uint64_t v22 = [[SBFolderIconZoomAnimator alloc] initWithAnimationContainer:v27 innerFolderController:v19 folderIcon:v21];
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v23 = SBLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SBFolderController nestingViewController:animationControllerForOperation:onViewController:animated:]();
      }

      UIAccessibilityIsReduceMotionEnabled();
    }
    id v24 = [SBIconFadeAnimator alloc];
    [v19 contentView];
    uint64_t v25 = v26 = v18;
    uint64_t v22 = [(SBIconFadeAnimator *)v24 initWithAnimationContainer:v27 crossfadeView:v25];

    id v18 = v26;
    [(SBFolderIconZoomAnimator *)v22 setFadesReferenceView:0];
    goto LABEL_24;
  }
LABEL_6:

  return v15;
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  int64_t v10 = (SBFolderController *)a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = a4 == 1;
  id v14 = v11;
  if (v10 != self)
  {
    [(SBFolderControllerBackgroundView *)self->_backgroundView setFrozen:a4 == 1];
    [(SBFolderController *)self _resetFakeStatusBarSettingsIfNecessary];
    goto LABEL_25;
  }
  if (![(SBFolderController *)v10 doesPageContainIconListView:[(SBFolderController *)v10 currentPageIndex]])[(SBFolderController *)v10 setCurrentPageIndex:[(SBFolderController *)v10 defaultPageIndex] animated:0]; {
  objc_opt_class();
  }
  BOOL v15 = &off_1D81E4000;
  int64_t v39 = a4;
  if (objc_opt_isKindOfClass())
  {
    id v16 = v14;
    long long v17 = v16;
    if (a4 == 1)
    {
      if (v16)
      {
LABEL_11:
        id v18 = [SBFolderControllerBackgroundView alloc];
        id v19 = [(SBFolderController *)v10 folderView];
        [v19 bounds];
        uint64_t v20 = -[SBFolderControllerBackgroundView initWithFrame:](v18, "initWithFrame:");
        backgroundView = v10->_backgroundView;
        v10->_backgroundView = (SBFolderControllerBackgroundView *)v20;

        [(SBFolderControllerBackgroundView *)v10->_backgroundView setDelegate:v10];
        if (v17)
        {
          [(SBFolderController *)v10 _configureForInnerFolderController:v17];
          uint64_t v22 = [(SBFolderController *)v10 folderContainerView];
          uint64_t v23 = [v17 folderContainerView];
          [v22 setChildFolderContainerView:v23];
          [v22 insertSubview:v10->_backgroundView belowSubview:v23];
          [v22 setBackgroundView:v10->_backgroundView];

          [(SBFolderController *)v10 _addFakeStatusBarView];
          id v24 = 0;
          BOOL v15 = &off_1D81E4000;
LABEL_16:
          if ([v12 isAnimated]) {
            [(SBFolderController *)v10 setAnimating:1];
          }
          aBlocuint64_t k = MEMORY[0x1E4F143A8];
          uint64_t v60 = *((void *)v15 + 360);
          uint64_t v25 = v60;
          v61 = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
          v62 = &unk_1E6AACF80;
          v63 = v10;
          id v26 = v17;
          id v64 = v26;
          uint64_t v27 = _Block_copy(&aBlock);
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = v25;
          v56[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
          v56[3] = &unk_1E6AB12E0;
          BOOL v58 = v13;
          v56[4] = v10;
          id v57 = v27;
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = v25;
          v52[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3;
          v52[3] = &unk_1E6AB1308;
          v52[4] = v10;
          BOOL v55 = v13;
          id v38 = v26;
          id v53 = v38;
          id v36 = v24;
          id v54 = v36;
          id v28 = v27;
          [v12 animateAlongsideTransition:v56 completion:v52];

          goto LABEL_21;
        }
        id v24 = 0;
        BOOL v15 = &off_1D81E4000;
        goto LABEL_20;
      }
LABEL_10:
      long long v17 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if (a4 == 1) {
      goto LABEL_10;
    }
    long long v17 = 0;
  }
  id v24 = [(SBFolderController *)v10 innerFolderController];
  if (v17)
  {
    [(SBFolderController *)v10 _configureForInnerFolderController:0];
    goto LABEL_16;
  }
LABEL_20:
  id v36 = v24;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4;
  v49[3] = &unk_1E6AB1330;
  BOOL v51 = v13;
  id v50 = v14;
  [v12 animateAlongsideTransition:0 completion:v49];

  id v38 = 0;
LABEL_21:
  BOOL v29 = v13;
  objc_super v30 = v15;
  v31 = [(SBFolderController *)v10 folderView];
  uint64_t v32 = [v12 isAnimated];
  v33 = [v12 transitionAnimationFactory];
  v34 = [v33 settings];
  [v31 willTransitionAnimated:v32 withSettings:v34];

  a4 = v39;
  if (v39 == 1) {
    double v35 = 0.0;
  }
  else {
    double v35 = 1.0;
  }
  [(SBFolderControllerBackgroundView *)v10->_backgroundView setExpanding:v39 == 1];
  [(SBFolderController *)v10 fadeContentForMagnificationFraction:v35];
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = *((void *)v30 + 360);
  long long v45 = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5;
  long long v46 = &unk_1E6AB1330;
  BOOL v48 = v29;
  long long v47 = v10;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = v44;
  v41[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7;
  v41[3] = &unk_1E6AB1330;
  BOOL v42 = v29;
  v41[4] = v10;
  [v12 animateAlongsideTransition:&v43 completion:v41];

LABEL_25:
  v40.receiver = self;
  v40.super_class = (Class)SBFolderController;
  [(SBNestingViewController *)&v40 nestingViewController:v10 willPerformOperation:a4 onViewController:v14 withTransitionCoordinator:v12];
}

- (void)folderControllerDidOpen:(id)a3
{
  id v5 = a3;
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 folderControllerDidOpen:v5];
  }
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isInteractive] & 1) == 0)
  {
    int v4 = [v3 isCancelled];
    int v5 = [v3 transitionWasRestarted];
    int v6 = (*(unsigned char *)(a1 + 40) != 0) ^ v4;
    if (v6) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    if ([v3 isAnimated])
    {
      uint64_t v8 = +[SBHHomeScreenDomain rootSettings];
      id v9 = [v8 iconAnimationSettings];

      if (v6) {
        [v9 folderOpenSettings];
      }
      else {
      int64_t v10 = [v9 folderCloseSettings];
      }
      id v11 = (void *)MEMORY[0x1E4F4F898];
      id v12 = [v10 outerFolderFadeSettings];
      BOOL v13 = [v12 BSAnimationSettings];
      id v14 = [v11 factoryWithSettings:v13];

      [v14 setAllowsAdditiveAnimations:1];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      char v21 = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6;
      uint64_t v22 = &unk_1E6AAC838;
      if (v4 | v5) {
        uint64_t v15 = 614;
      }
      else {
        uint64_t v15 = 610;
      }
      uint64_t v23 = *(void *)(a1 + 32);
      double v24 = v7;
      [MEMORY[0x1E4F4F898] animateWithFactory:v14 additionalDelay:v15 options:&v19 actions:0.0];
    }
    else
    {
      [*(id *)(a1 + 32) fadeContentForMagnificationFraction:v7];
    }
    id v16 = *(id *)(*(void *)(a1 + 32) + 1048);
    long long v17 = v16;
    if (v4)
    {
      [v16 setTransitionCancelled:1];
      BOOL v18 = *(unsigned char *)(a1 + 40) == 0;
    }
    else
    {
      [v16 setTransitionCancelled:0];
      BOOL v18 = *(unsigned char *)(a1 + 40) != 0;
    }
    objc_msgSend(v17, "setEffectActive:", v18, v19, v20, v21, v22);
  }
}

- (void)fadeContentForMagnificationFraction:(double)a3
{
  id v4 = [(SBFolderController *)self folderView];
  [v4 fadeContentForMagnificationFraction:a3];
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isInteractive] & 1) == 0)
  {
    if ([v5 isCancelled])
    {
      [*(id *)(a1 + 32) _fadeHomescreenAndDockIfNecessaryForFolderOpen:*(unsigned char *)(a1 + 48) == 0];
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(unsigned char *)(a1 + 48) == 0;
    }
    else
    {
      [v5 transitionWasRestarted];
      [*(id *)(a1 + 32) _fadeHomescreenAndDockIfNecessaryForFolderOpen:*(unsigned __int8 *)(a1 + 48)];
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  }
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = a2 ^ 1u;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "bs_setHitTestingDisabled:", v3);
  id v4 = [*(id *)(a1 + 40) view];
  objc_msgSend(v4, "bs_setHitTestingDisabled:", v3);
}

uint64_t __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 isCancelled] ^ (*(unsigned char *)(a1 + 48) != 0);
  id v5 = [*(id *)(a1 + 32) folderView];
  uint64_t v6 = [v3 isAnimated];

  [v5 didTransitionAnimated:v6];
  [*(id *)(a1 + 32) setAnimating:0];
  if (v4)
  {
    double v7 = *(void **)(a1 + 32);
    return [v7 folderControllerDidOpen:v7];
  }
  else
  {
    [*(id *)(a1 + 40) setHidden:0];
    [*(id *)(a1 + 40) setAllIconElementsButLabelHidden:0];
    [*(id *)(a1 + 40) setAlpha:1.0];
    int v9 = [*(id *)(a1 + 32) isEditing];
    int64_t v10 = *(void **)(a1 + 40);
    if (v9) {
      [v10 scrollToFirstGapAnimated:1];
    }
    else {
      [v10 scrollToTopOfFirstPageAnimated:1];
    }
    [*(id *)(a1 + 32) folderControllerDidClose:*(void *)(a1 + 32)];
    id v11 = *(void **)(a1 + 32);
    return [v11 _invalidate];
  }
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((([v3 isCancelled] ^ (*(unsigned char *)(a1 + 40) != 0)) & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 1048) removeFromSuperview];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1048);
    *(void *)(v4 + 1048) = 0;
  }
  id v7 = [*(id *)(a1 + 32) folderView];
  uint64_t v6 = [v3 isAnimated];

  [v7 didTransitionAnimated:v6];
}

uint64_t __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = [a2 isCancelled];
  if (v3)
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 40);
    }
    [*(id *)(a1 + 32) _configureForInnerFolderController:v4];
  }
  uint64_t result = [*(id *)(a1 + 32) setAnimating:0];
  if (*(unsigned char *)(a1 + 56)) {
    char v6 = v3;
  }
  else {
    char v6 = 1;
  }
  if (v6)
  {
    if (v3 != (*(unsigned char *)(a1 + 56) == 0))
    {
      id v7 = [*(id *)(a1 + 32) folderContainerView];
      [v7 setChildFolderContainerView:0];

      [*(id *)(a1 + 32) _removeFakeStatusBar];
      [*(id *)(a1 + 32) removeAssertionsFromInnerFolderController:*(void *)(a1 + 48)];
      uint64_t v8 = *(void **)(a1 + 48);
      return [v8 setFolderDelegate:0];
    }
  }
  else
  {
    int v9 = *(void **)(a1 + 32);
    return [v9 _compactFolder];
  }
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

uint64_t __66__SBFolderController_pushFolderIcon_location_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOverrideIconImageAppearance:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self folderView];
  [v5 setOverrideIconImageAppearance:v4];
}

- (void)_fadeHomescreenAndDockIfNecessaryForFolderOpen:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBFolderController *)self _homescreenAndDockShouldFade])
  {
    double v5 = 1.0;
    if (v3) {
      double v5 = 0.0;
    }
    [(SBFolderController *)self _setHomescreenAndDockAlpha:v5];
  }
}

- (void)prepareToLaunchTappedIcon:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(SBFolderController *)self isDisplayingIcon:v6])
  {
    v7[2](v7);
  }
  else
  {
    uint64_t v8 = SBLogIcon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v6 uniqueIdentifier];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 1024;
      BOOL v13 = [(SBFolderController *)self isScrolling];
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "Need to scroll to show tapped icon '%@' (already scrolling: %{BOOL}u)", (uint8_t *)&v10, 0x12u);
    }
    [(SBFolderController *)self setCurrentPageIndexToListDirectlyContainingIcon:v6 animated:1 completion:v7];
  }
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFolderController *)self folderView];
  char v6 = [v4 isDescendantOfView:v5];

  return v6;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(SBFolderController *)self bs_isAppearingOrAppeared]) {
    NSLog(&cfstr_ThisViewHasAlr.isa);
  }
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  [(SBNestingViewController *)&v19 viewDidDisappear:v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(SBFolderController *)self _viewControllersToNotifyForViewObscuration];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 67109378;
    long long v14 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "bs_endAppearanceTransition:", 0, v14);
        id v11 = SBLogRootController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = (objc_class *)objc_opt_class();
          BOOL v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = v14;
          BOOL v21 = v3;
          __int16 v22 = 2114;
          uint64_t v23 = v13;
          _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "viewDidDisappear:%{public:BOOL}d %{public}@", buf, 0x12u);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v8);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(SBFolderController *)self bs_isAppearingOrAppeared]) {
    NSLog(&cfstr_ThisViewHasAlr.isa);
  }
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  [(SBNestingViewController *)&v19 viewWillDisappear:v3];
  [(SBFolderController *)self _cancelTouchesForAllCustomIconImageViewControllers];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(SBFolderController *)self _viewControllersToNotifyForViewObscuration];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 67109378;
    long long v14 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "bs_beginAppearanceTransition:animated:", 0, v3, v14);
        id v11 = SBLogRootController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = (objc_class *)objc_opt_class();
          BOOL v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = v14;
          BOOL v21 = v3;
          __int16 v22 = 2114;
          uint64_t v23 = v13;
          _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "viewWillDisappear:%{public:BOOL}d %{public}@", buf, 0x12u);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v8);
  }
}

- (void)_cancelTouchesForAllCustomIconImageViewControllers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        -[SBFolderController _cancelTouchesForCustomIconImageViewController:](self, "_cancelTouchesForCustomIconImageViewController:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSString)description
{
  return (NSString *)[(SBFolderController *)self descriptionWithMultilinePrefix:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(SBFolderController *)self bs_isDisappearingOrDisappeared]) {
    NSLog(&cfstr_ThisViewHasAlr.isa);
  }
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  [(SBNestingViewController *)&v19 viewDidAppear:v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SBFolderController *)self _viewControllersToNotifyForViewObscuration];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138543362;
    long long v14 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "bs_endAppearanceTransition:", 1, v14);
        long long v11 = SBLogRootController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = v14;
          BOOL v21 = v13;
          _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "viewDidAppear:%{public}@", buf, 0xCu);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(SBFolderController *)self bs_isDisappearingOrDisappeared]) {
    NSLog(&cfstr_ThisViewHasAlr.isa);
  }
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  [(SBNestingViewController *)&v19 viewWillAppear:v3];
  [(SBFolderController *)self _invalidateAllCancelTouchesAssertions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SBFolderController *)self _viewControllersToNotifyForViewObscuration];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138543362;
    long long v14 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "bs_beginAppearanceTransition:animated:", 1, v3, v14);
        long long v11 = SBLogRootController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = v14;
          BOOL v21 = v13;
          _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "viewWillAppear:%{public}@", buf, 0xCu);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v8);
  }
}

- (double)minimumHomeScreenScaleForFolderControllerBackgroundView:(id)a3
{
  [(SBFolderController *)self minimumHomeScreenScaleForFolderController:self];
  return result;
}

- (double)minimumHomeScreenScaleForFolderController:(id)a3
{
  uint64_t v4 = [(SBFolderController *)self folderDelegate];
  double v5 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 minimumHomeScreenScaleForFolderController:self];
    double v5 = v6;
  }

  return v5;
}

- (void)updateContentViewOcclusion
{
  id v3 = [(SBFolderController *)self folderView];
  objc_msgSend(v3, "setContentVisibility:", -[SBFolderController effectiveContentVisibility](self, "effectiveContentVisibility"));
}

- (unint64_t)effectiveContentVisibility
{
  id v3 = [(SBFolderController *)self innerFolderController];
  BOOL v4 = v3 != 0;

  return [(SBFolderController *)self effectiveContentVisibilityFolderHasInnerFolder:v4];
}

- (unint64_t)effectiveContentVisibilityFolderHasInnerFolder:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t result = [(SBFolderController *)self contentVisibility];
  if (v3) {
    return 1;
  }
  return result;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    double v5 = [(SBFolderController *)self innerFolderController];
    [v5 setContentVisibility:a3];

    [(SBFolderController *)self updateContentViewOcclusion];
  }
}

- (int64_t)userInterfaceLayoutDirection
{
  id v2 = [(SBFolderController *)self folderView];
  int64_t v3 = [v2 userInterfaceLayoutDirection];

  return v3;
}

- (void)folderViewDidScroll:(id)a3
{
}

- (double)minimumHomeScreenScaleForFolderView:(id)a3
{
  BOOL v4 = [(SBFolderController *)self folderDelegate];
  double v5 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 minimumHomeScreenScaleForFolderController:self];
    double v5 = v6;
  }

  return v5;
}

- (void)folderViewWillBeginScrolling:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SBFolderController *)self folderDelegate];
  [v5 folderControllerWillBeginScrolling:self];

  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBFolderControllerWillBeginScrollingNotification" object:self userInfo:0];

  if (![(SBFolderController *)self isOverridingPageViewControllerAppearanceStateToRemainDisappeared])
  {
    long long v7 = [(SBFolderController *)self viewControllersForPageIndex:[(SBFolderController *)self currentPageIndex]];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
          uint64_t v13 = SBLogRootController();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            long long v46 = v12;
            _os_log_debug_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to NO (folderViewWillBeginScrolling)", buf, 0xCu);
          }

          [v12 beginAppearanceTransition:0 animated:0];
          appearanceTransitioningCustomImageViewControllers = self->_appearanceTransitioningCustomImageViewControllers;
          if (!appearanceTransitioningCustomImageViewControllers)
          {
            long long v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v16 = self->_appearanceTransitioningCustomImageViewControllers;
            self->_appearanceTransitioningCustomImageViewControllers = v15;

            appearanceTransitioningCustomImageViewControllers = self->_appearanceTransitioningCustomImageViewControllers;
          }
          [(NSMutableSet *)appearanceTransitioningCustomImageViewControllers addObject:v12];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v9);
    }
  }
  long long v17 = [v4 scrollView];
  long long v18 = v17;
  if (v17)
  {
    objc_super v19 = [v17 panGestureRecognizer];
    [v19 locationInView:v18];
    double v21 = v20;
    double v23 = v22;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    double v24 = self->_iconViewsWithCustomImageViewControllers;
    uint64_t v25 = [(NSHashTable *)v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          BOOL v29 = [*(id *)(*((void *)&v36 + 1) + 8 * i) customIconImageViewController];
          objc_super v30 = [v29 view];
          v31 = [v30 superview];
          objc_msgSend(v31, "convertPoint:fromView:", v18, v21, v23);
          CGFloat v33 = v32;
          CGFloat v35 = v34;

          [v30 frame];
          v49.x = v33;
          v49.y = v35;
          if (CGRectContainsPoint(v50, v49)) {
            [(SBFolderController *)self _cancelTouchesForCustomIconImageViewController:v29];
          }
        }
        uint64_t v26 = [(NSHashTable *)v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v26);
    }
  }
  [(SBFolderController *)self _disableTouchesOnAllCustomIconImageViewControllers];
}

- (void)folderViewDidEndScrolling:(id)a3
{
  [(SBFolderController *)self updateAppearanceStateForPageViewControllers:1];
  [(SBFolderController *)self _invalidateAllCancelTouchesAssertions];
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 folderControllerDidEndScrolling:self];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"SBFolderControllerDidEndScrollingNotification" object:self userInfo:0];

  iconImageViewControllerKeepStaticForAnimatedScrollAssertion = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  if (iconImageViewControllerKeepStaticForAnimatedScrollAssertion)
  {
    [(BSInvalidatable *)iconImageViewControllerKeepStaticForAnimatedScrollAssertion invalidate];
    long long v7 = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
    self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion = 0;
  }
}

- (void)_invalidateAllCancelTouchesAssertions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMapTable objectForKey:](self->_iconViewCustomImageViewControllerTouchCancellationAssertions, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_iconViewCustomImageViewControllerTouchCancellationAssertions removeAllObjects];
  [(SBFolderController *)self _enableTouchesOnAllCustomIconImageViewControllers];
}

- (void)_enableTouchesOnAllCustomIconImageViewControllers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_iconViewsWithCustomImageViewControllers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setCustomIconImageViewHitTestingDisabled:", 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_disableTouchesOnAllCustomIconImageViewControllers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_iconViewsWithCustomImageViewControllers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setCustomIconImageViewHitTestingDisabled:", 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)noteUserIsInteractingWithIcons
{
}

- (BOOL)suspendsWallpaperAnimationWhileOpen
{
  return 1;
}

- (SBFolderController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SBFolderController;
  uint64_t v5 = [(SBNestingViewController *)&v29 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SBFolderControllerConfiguration *)v6;

    uint64_t v8 = [v4 listLayoutProvider];
    listLayoutProvider = v5->_listLayoutProvider;
    v5->_listLayoutProvider = (SBIconListLayoutProvider *)v8;

    v5->_orientation = [v4 orientation];
    v5->_allowedOrientations = [v4 allowedOrientations];
    long long v10 = [v4 originatingIconLocation];
    uint64_t v11 = [v10 copy];
    originatingIconLocation = v5->_originatingIconLocation;
    v5->_originatingIconLocation = (NSString *)v11;

    uint64_t v13 = [v4 iconViewProvider];
    objc_storeWeak((id *)&v5->_iconViewProvider, v13);

    uint64_t v14 = [v4 animationContext];
    animationContext = v5->_animationContext;
    v5->_animationContext = (SBFolderControllerAnimationContext *)v14;

    long long v16 = [v4 folderDelegate];
    objc_storeWeak((id *)&v5->_folderDelegate, v16);

    uint64_t v17 = [v4 legibilitySettings];
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v17;

    uint64_t v19 = [v4 headerView];
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v19;

    uint64_t v21 = [v4 folderIconImageCache];
    folderIconImageCache = v5->_folderIconImageCache;
    v5->_folderIconImageCache = (SBFolderIconImageCache *)v21;

    uint64_t v23 = [v4 iconImageCache];
    iconImageCache = v5->_iconImageCache;
    v5->_iconImageCache = (SBHIconImageCache *)v23;

    v5->_addsFocusGuidesForWrapping = [v4 addsFocusGuidesForWrapping];
    v5->_contentVisibility = 0;
    uint64_t v25 = [v4 delegate];
    [(SBNestingViewController *)v5 setDelegate:v25];

    uint64_t v26 = [v4 folder];
    [(SBFolderController *)v5 setFolder:v26];
    [(SBFolderController *)v5 setCurrentPageIndex:[(SBFolderController *)v5 defaultPageIndex] animated:0];
    uint64_t v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v5 selector:sel_iconViewWillPresentContextMenu_ name:@"SBIconViewWillPresentContextMenuNotification" object:0];
    [v27 addObserver:v5 selector:sel_iconViewDidDismissContextMenu_ name:@"SBIconViewDidDismissContextMenuNotification" object:0];
  }
  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SBFolderController;
  [(SBFolderController *)&v4 viewDidLoad];
  [(SBFolderController *)self _resetIconLists];
  uint64_t v3 = [(SBFolderController *)self folderView];
  objc_msgSend(v3, "setEditing:animated:", -[SBFolderController isEditing](self, "isEditing"), 0);
  objc_msgSend(v3, "setContentVisibility:", -[SBFolderController effectiveContentVisibility](self, "effectiveContentVisibility"));
  [(SBFolderController *)self setCurrentPageIndex:[(SBFolderController *)self defaultPageIndex] animated:0];
  [(SBFolderController *)self updateAppearanceStateForPageViewControllers:1];
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  return [(SBFolderController *)self setCurrentPageIndex:a3 animated:a4 completion:0];
}

- (int64_t)defaultPageIndex
{
  return [(SBFolderView *)self->_contentView defaultPageIndex];
}

- (void)setFolder:(id)a3
{
  uint64_t v5 = (SBFolder *)a3;
  p_folder = &self->_folder;
  folder = self->_folder;
  if (folder != v5)
  {
    long long v9 = v5;
    [(SBFolder *)folder removeFolderObserver:self];
    objc_storeStrong((id *)&self->_folder, a3);
    if (v9)
    {
      if (![(SBFolder *)*p_folder listCount]) {
        id v8 = [(SBFolder *)*p_folder addEmptyList];
      }
      [(SBFolder *)*p_folder addFolderObserver:self];
    }
    [(SBFolderView *)self->_contentView setFolder:*p_folder];
    uint64_t v5 = v9;
  }
}

- (void)pushFolderIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(SBFolderController *)self isOpen])
  {
    if (v10 && [(SBFolderController *)self shouldOpenFolderIcon:v10])
    {
      uint64_t v13 = [v10 folder];
      uint64_t v14 = [(SBFolderController *)self controllerClassForFolder:v13];
      id v15 = objc_alloc_init((Class)[(objc_class *)v14 configurationClass]);
      [v15 setFolder:v13];
      [v15 setOriginatingIconLocation:v11];
      [(SBFolderController *)self configureInnerFolderControllerConfiguration:v15];
      long long v16 = (void *)[[v14 alloc] initWithConfiguration:v15];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__SBFolderController_pushFolderIcon_location_animated_completion___block_invoke;
      v19[3] = &unk_1E6AAF958;
      id v20 = v16;
      id v21 = v12;
      id v17 = v16;
      [(SBNestingViewController *)self pushNestedViewController:v17 animated:v7 withCompletion:v19];

      goto LABEL_11;
    }
    long long v18 = SBLogIcon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBFolderController pushFolderIcon:location:animated:completion:]();
    }
  }
  else
  {
    long long v18 = SBLogIcon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBFolderController pushFolderIcon:location:animated:completion:]();
    }
  }

  if (v12) {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
LABEL_11:
}

- (BOOL)shouldOpenFolderIcon:(id)a3
{
  uint64_t v3 = [(SBFolderController *)self firstIconViewForIcon:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (Class)controllerClassForFolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderController *)self folderDelegate];
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (void *)[v5 controllerClassForFolder:v4];
  }
  else {
    BOOL v7 = objc_opt_class();
  }
  id v8 = v7;

  return v8;
}

- (void)configureInnerFolderControllerConfiguration:(id)a3
{
  id v11 = a3;
  id v4 = [(SBFolderController *)self listLayoutProvider];
  [v11 setListLayoutProvider:v4];

  objc_msgSend(v11, "setOrientation:", -[SBFolderController orientation](self, "orientation"));
  objc_msgSend(v11, "setAllowedOrientations:", -[SBFolderController allowedOrientations](self, "allowedOrientations"));
  uint64_t v5 = [(SBFolderController *)self iconViewProvider];
  [v11 setIconViewProvider:v5];

  uint64_t v6 = [(SBFolderController *)self folderIconImageCache];
  [v11 setFolderIconImageCache:v6];

  BOOL v7 = [(SBFolderController *)self iconImageCache];
  [v11 setIconImageCache:v7];

  id v8 = [(SBFolderController *)self legibilitySettings];
  [v11 setLegibilitySettings:v8];

  [v11 setDelegate:self];
  [v11 setFolderDelegate:self];
  objc_msgSend(v11, "setAddsFocusGuidesForWrapping:", -[SBFolderController addsFocusGuidesForWrapping](self, "addsFocusGuidesForWrapping"));
  objc_msgSend(v11, "setVertical:", -[SBFolderController isVertical](self, "isVertical"));
  long long v9 = [(SBFolderController *)self effectiveIconImageAppearance];
  [v11 setOverrideIconImageAppearance:v9];

  id v10 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v10 folderController:self willCreateInnerFolderControllerWithConfiguration:v11];
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isVertical
{
  id v2 = [(SBFolderController *)self folderView];
  char v3 = [v2 isVertical];

  return v3;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (SBHIconImageAppearance)effectiveIconImageAppearance
{
  char v3 = [(SBFolderController *)self overrideIconImageAppearance];
  id v4 = [(SBFolderController *)self traitCollection];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);

  return (SBHIconImageAppearance *)v5;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  id v2 = [(SBFolderController *)self folderView];
  char v3 = [v2 overrideIconImageAppearance];

  return (SBHIconImageAppearance *)v3;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (void)_resetIconLists
{
  [(SBFolderView *)self->_contentView resetIconListViews];
  id v3 = [(SBFolderController *)self innerFolderController];
  [v3 _resetIconLists];
}

- (void)folderView:(id)a3 didAddIconListView:(id)a4
{
  id v5 = a4;
  [v5 addLayoutObserver:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SBFolderController_folderView_didAddIconListView___block_invoke;
  v7[3] = &unk_1E6AAF758;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 enumerateIconViewsUsingBlock:v7];
}

- (void)_configureForInnerFolderController:(id)a3
{
  id v8 = a3;
  id v4 = [(SBFolderController *)self innerFolderController];
  [v8 setFolderDelegate:self];
  if (v8 && v4 != v8)
  {
    [(SBFolderController *)self _updateStateOfAssociatedController:v8 animated:0];
    id v5 = [v8 folder];
    id v6 = [v5 icon];
    BOOL v7 = [(SBFolderController *)self firstIconViewForIcon:v6];
    [v8 setFolderIconView:v7];
  }
}

- (void)setFolderIconView:(id)a3
{
  id v5 = (SBIconView *)a3;
  if (self->_folderIconView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_folderIconView, a3);
    id v5 = v6;
    if (v6)
    {
      [(SBFolderController *)self setCurrentPageIndex:[(SBFolderController *)self pageIndexForIconListViewIndex:[(SBIconView *)v6 visibleMiniIconListIndex]] animated:0];
      id v5 = v6;
    }
  }
}

- (void)setFolderDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_folderDelegate, obj);
    [(SBFolderController *)self delegateDidChange];
    id v6 = [(SBFolderController *)self innerFolderController];
    [v6 parentDelegateDidChange];

    id v5 = obj;
  }
}

- (int64_t)pageIndexForIconListViewIndex:(unint64_t)a3
{
  id v4 = [(SBFolderController *)self folderView];
  int64_t v5 = [v4 pageIndexForIconListViewIndex:a3];

  return v5;
}

- (void)folderControllerWillOpen:(id)a3
{
  long long v9 = (SBFolderController *)a3;
  [(SBFolderController *)v9 _updateFolderRequiredTrailingEmptyListCount];
  id v4 = [(SBFolderController *)v9 folderView];
  [v4 prepareToOpen];

  int64_t v5 = [(SBFolderController *)self innerFolderController];

  if (v5)
  {
    id v6 = [(SBFolderController *)self folderView];
    [v6 setSuppressesEditingStateForListViews:1];
  }
  [(SBFolderController *)self updateContentViewOcclusion];
  if (v9 == self)
  {
    BOOL v7 = [(SBFolderController *)v9 folder];
    if ([v7 isCancelable])
    {
      [(SBFolderController *)v9 setWasFolderCancelable:1];
      [v7 setCancelable:0];
    }
  }
  else
  {
    [(SBFolderController *)self addAssertionsFromInnerFolderController:v9];
  }
  id v8 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderControllerWillOpen:v9];
  }
}

- (void)_updateFolderRequiredTrailingEmptyListCount
{
  id v3 = [(SBFolderController *)self folder];
  objc_msgSend(v3, "setRequiredTrailingEmptyListCount:", -[SBFolderController isEditing](self, "isEditing"));
}

- (Class)iconListViewClassForFolderView:(id)a3
{
  id v3 = objc_opt_class();
  return (Class)[v3 listViewClass];
}

+ (Class)listViewClass
{
  id v2 = (void *)[a1 _contentViewClass];
  return (Class)[v2 defaultIconListViewClass];
}

- (void)addAssertionsFromInnerFolderController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = self->_layoutHidingAssertions;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "addAssertionFromChild:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSMutableDictionary)extraAssertions
{
  return self->_extraAssertions;
}

- (void)setExtraAssertions:(id)a3
{
}

- (BOOL)doesPageContainIconListView:(int64_t)a3
{
  id v4 = [(SBFolderController *)self folderView];
  LOBYTE(a3) = [v4 doesPageContainIconListView:a3];

  return a3;
}

- (void)_addFakeStatusBarView
{
  [(SBFolderController *)self _removeFakeStatusBarAndAssertionIfExists];
  [(SBFolderController *)self _hideStatusBarForReason:@"SBFolderControllerFakeStatusBar" animated:0];
  id v7 = [(SBFolderController *)self folderDelegate];
  char v3 = objc_opt_respondsToSelector();
  if (v3)
  {
    id v4 = [v7 fakeStatusBarForFolderController:self];
  }
  else
  {
    id v4 = 0;
  }
  p_fakeStatusBar = &self->_fakeStatusBar;
  objc_storeStrong((id *)&self->_fakeStatusBar, v4);
  if (v3) {

  }
  if (*p_fakeStatusBar)
  {
    [(SBFolderController *)self _resetFakeStatusBarSettingsIfNecessary];
    uint64_t v6 = [(SBFolderController *)self view];
    [v6 insertSubview:*p_fakeStatusBar belowSubview:self->_backgroundView];
  }
}

- (void)_resetFakeStatusBarSettingsIfNecessary
{
  if (self->_fakeStatusBar)
  {
    [(SBFolderController *)self _resetFakeStatusBarFrameOnly];
    id v5 = [(SBFolderController *)self folderDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [v5 statusBarStyleRequestForFolderController:self];
      if (v3)
      {
        id v4 = (void *)v3;
        [(UIStatusBar *)self->_fakeStatusBar setStyleRequest:v3];
      }
    }
    -[UIStatusBar setOrientation:](self->_fakeStatusBar, "setOrientation:", [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation]);
    [(UIStatusBar *)self->_fakeStatusBar setHidden:[(NSMutableSet *)self->_fakeStatusBarHidingReasons count] != 0];
  }
}

- (void)_resetFakeStatusBarFrameOnly
{
  id v16 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v16 statusBarEdgeInsetsForFolderController:self];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB2848];
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  fakeStatusBar = self->_fakeStatusBar;
  [(id)*MEMORY[0x1E4FB2608] statusBarFrame];
  -[UIStatusBar setFrame:](fakeStatusBar, "setFrame:", v6 + v12, v4 + v13, v14 - (v10 + v6), v15 - (v8 + v4));
  [(SBFolderController *)self _resetFakeStatusBarMatchMoveAnimation];
}

- (void)_resetFakeStatusBarMatchMoveAnimation
{
  v29[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIStatusBar *)self->_fakeStatusBar layer];
  [v3 removeAnimationForKey:@"SBFolderControllerFakeStatusBarMatchMoveKey"];

  double v4 = [(SBFolderController *)self view];
  double v5 = [v4 window];
  double v6 = [v5 layer];

  [(UIStatusBar *)self->_fakeStatusBar frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4F39C00]);
  [v15 setSourceLayer:v6];
  id v16 = (void *)MEMORY[0x1E4F29238];
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.double width = v12;
  v30.size.double height = v14;
  double MinX = CGRectGetMinX(v30);
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.double width = v12;
  v31.size.double height = v14;
  long long v18 = objc_msgSend(v16, "valueWithCGPoint:", MinX, CGRectGetMinY(v31));
  v29[0] = v18;
  uint64_t v19 = (void *)MEMORY[0x1E4F29238];
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.double width = v12;
  v32.size.double height = v14;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.double width = v12;
  v33.size.double height = v14;
  id v21 = objc_msgSend(v19, "valueWithCGPoint:", MaxX, CGRectGetMinY(v33));
  v29[1] = v21;
  double v22 = (void *)MEMORY[0x1E4F29238];
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.double width = v12;
  v34.size.double height = v14;
  double v23 = CGRectGetMaxX(v34);
  v35.origin.x = v8;
  v35.origin.y = v10;
  v35.size.double width = v12;
  v35.size.double height = v14;
  double v24 = objc_msgSend(v22, "valueWithCGPoint:", v23, CGRectGetMaxY(v35));
  v29[2] = v24;
  uint64_t v25 = (void *)MEMORY[0x1E4F29238];
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.double width = v12;
  v36.size.double height = v14;
  double v26 = CGRectGetMinX(v36);
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.double width = v12;
  v37.size.double height = v14;
  uint64_t v27 = objc_msgSend(v25, "valueWithCGPoint:", v26, CGRectGetMaxY(v37));
  v29[3] = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v15 setSourcePoints:v28];

  [v15 setDuration:INFINITY];
  [v15 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v15 setRemovedOnCompletion:0];
  [(UIStatusBar *)self->_fakeStatusBar addAnimation:v15 forKey:@"SBFolderControllerFakeStatusBarMatchMoveKey"];
}

- (void)_removeFakeStatusBarAndAssertionIfExists
{
  [(SBFolderController *)self _unhideStatusBarForReason:@"SBFolderControllerFakeStatusBar"];
  fakeStatusBar = self->_fakeStatusBar;
  if (fakeStatusBar)
  {
    double v4 = [(UIStatusBar *)fakeStatusBar layer];
    [v4 removeAnimationForKey:@"SBFolderControllerFakeStatusBarMatchMoveKey"];

    double v5 = [(SBFolderController *)self folderDelegate];
    if (objc_opt_respondsToSelector()) {
      [v5 folderController:self willRemoveFakeStatusBar:self->_fakeStatusBar];
    }
    else {
      [(UIStatusBar *)self->_fakeStatusBar removeFromSuperview];
    }
    double v6 = self->_fakeStatusBar;
    self->_fakeStatusBar = 0;
  }
  double v7 = (void *)MEMORY[0x1E4FB1B70];
  [v7 _synchronizeDrawing];
}

- (void)_unhideStatusBarForReason:(id)a3
{
  [(NSMutableSet *)self->_realStatusBarHidingReasons removeObject:a3];
  if (![(NSMutableSet *)self->_realStatusBarHidingReasons count])
  {
    [(BSInvalidatable *)self->_statusBarAssertion invalidate];
    statusBarAssertion = self->_statusBarAssertion;
    self->_statusBarAssertion = 0;
  }
}

- (void)_hideStatusBarForReason:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  realStatusBarHidingReasons = self->_realStatusBarHidingReasons;
  id v13 = v6;
  if (!realStatusBarHidingReasons)
  {
    CGFloat v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v9 = self->_realStatusBarHidingReasons;
    self->_realStatusBarHidingReasons = v8;

    id v6 = v13;
    realStatusBarHidingReasons = self->_realStatusBarHidingReasons;
  }
  [(NSMutableSet *)realStatusBarHidingReasons addObject:v6];
  if ([(NSMutableSet *)self->_realStatusBarHidingReasons count])
  {
    CGFloat v10 = [(SBFolderController *)self folderDelegate];
    char v11 = objc_opt_respondsToSelector();
    if (v11)
    {
      CGFloat v12 = [v10 folderControllerWantsToHideStatusBar:self animated:v4];
    }
    else
    {
      CGFloat v12 = 0;
    }
    objc_storeStrong((id *)&self->_statusBarAssertion, v12);
    if (v11) {
  }
    }
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBIconViewWillPresentContextMenuNotification" object:0];
  [v3 removeObserver:self name:@"SBIconViewDidDismissContextMenuNotification" object:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(SBFolderController *)self extraAssertions];
  double v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        CGFloat v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        char v11 = SBLogRootController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v18 = v10;
          _os_log_fault_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_FAULT, "Invalidating assertion:%@ in SBFolderController dealloc, because it was not invalidated and/or removed earlier", buf, 0xCu);
        }

        [v10 invalidate];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)SBFolderController;
  [(SBFolderController *)&v12 dealloc];
}

+ (Class)configurationClass
{
  return (Class)self;
}

- (void)delegateDidChange
{
  id v2 = [(SBFolderController *)self folderViewIfLoaded];
  [v2 updateAccessibilityTintColors];
}

- (void)parentDelegateDidChange
{
  double v3 = [(SBFolderController *)self innerFolderController];
  [v3 parentDelegateDidChange];

  id v4 = [(SBFolderController *)self folderViewIfLoaded];
  [v4 updateAccessibilityTintColors];
}

- (void)_invalidate
{
}

- (id)keyCommands
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBFolderController;
  double v3 = [(SBFolderController *)&v8 keyCommands];
  if ([(SBFolderController *)self isEditing])
  {
    id v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel__handleEndEditingKeyCommand_];
    double v5 = [v4 _nonRepeatableKeyCommand];

    if (v3)
    {
      uint64_t v6 = [v3 arrayByAddingObject:v5];

      double v3 = (void *)v6;
    }
    else
    {
      v9[0] = v5;
      double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
  }
  return v3;
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  if ((([a2 isCancelled] ^ (*(unsigned char *)(a1 + 40) != 0)) & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) view];
    [v3 removeFromSuperview];
  }
}

uint64_t __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) fadeContentForMagnificationFraction:*(double *)(a1 + 40)];
}

uint64_t __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fadeContentForMinificationFraction:*(double *)(a1 + 40)];
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (SBFolderView)folderViewIfLoaded
{
  return self->_contentView;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v8 = [(SBFolderController *)self presentedIconLocations];
    uint64_t v9 = [v8 allObjects];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self->_listLayoutProvider, v7, *(void **)(*((void *)&v15 + 1) + 8 * i), 1);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    long long v14 = [(SBFolderController *)self folderView];
    [v14 setListLayoutProvider:v7 animated:v4];
  }
}

- (void)setOrientation:(int64_t)a3
{
  int64_t orientation = self->_orientation;
  if (orientation != a3 && SBFInterfaceOrientationMaskContainsInterfaceOrientation())
  {
    self->_int64_t orientation = a3;
    [(SBFolderController *)self orientationDidChange:orientation];
  }
}

- (BOOL)isScrollDragging
{
  id v2 = [(SBFolderView *)self->_contentView scrollView];
  char v3 = [v2 isDragging];

  return v3;
}

- (BOOL)isScrollDecelerating
{
  id v2 = [(SBFolderView *)self->_contentView scrollView];
  char v3 = [v2 isDecelerating];

  return v3;
}

- (BOOL)isScrollTracking
{
  id v2 = [(SBFolderView *)self->_contentView scrollView];
  char v3 = [v2 isTracking];

  return v3;
}

- (double)currentScrollingOffset
{
  id v2 = [(SBFolderController *)self folderView];
  char v3 = [v2 scrollView];
  [v3 contentOffset];
  double v5 = v4;

  return v5;
}

- (void)_handleEndEditingKeyCommand:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 folderControllerShouldEndEditing:self];
}

- (void)beginEditingTitle
{
  id v2 = [(SBFolderController *)self folderView];
  id v3 = [v2 _titleTextField];

  if ([v3 showingEditUI])
  {
    [v3 becomeFirstResponder];
    [v3 selectAll:0];
  }
}

- (void)setCurrentPageIndex:(int64_t)a3
{
}

- (void)setCurrentPageIndexToListDirectlyContainingIcon:(id)a3 animated:(BOOL)a4
{
}

- (void)setCurrentPageIndexToListDirectlyContainingIcon:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  if (!v8 || [(SBFolderController *)self isDisplayingIcon:v8])
  {
    if (v9) {
      v9[2](v9);
    }
    goto LABEL_28;
  }
  uint64_t v10 = [(SBFolderController *)self folder];
  uint64_t v11 = v10;
  if (v10)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = [v10 listsContainingIcon:v8];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      double v22 = self;
      uint64_t v15 = *(void *)v24;
      unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v18, "directlyContainsIcon:", v8, v22))
          {
            unint64_t v19 = [v11 indexOfList:v18];
            if (v19 < v16 || v16 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v16 = v19;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);

      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v6 = v6;
      self = v22;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v21 = [(SBFolderController *)v22 pageIndexForIconListModelIndex:v16];
      }
      goto LABEL_23;
    }
  }
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:
  if ([(SBFolderController *)self _isValidPageIndex:v21])
  {
    [(SBFolderController *)self setCurrentPageIndex:v21 animated:v6 completion:v9];
  }
  else if (v9)
  {
    v9[2](v9);
  }

LABEL_28:
}

- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(SBFolderController *)self scrollUsingDecelerationAnimationToPageIndex:[(SBFolderController *)self defaultPageIndex] withCompletionHandler:v4];
}

- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
}

- (int64_t)minimumPageIndex
{
  return [(SBFolderView *)self->_contentView minimumPageIndex];
}

- (int64_t)maximumPageIndex
{
  return [(SBFolderView *)self->_contentView maximumPageIndex];
}

- (int64_t)lastIconPageIndex
{
  return [(SBFolderView *)self->_contentView lastIconPageIndex];
}

- (int64_t)nearestIconPageIndex
{
  return [(SBFolderView *)self->_contentView nearestIconPageIndex];
}

- (SBFolderController)outerFolderController
{
  id v2 = [(SBNestingViewController *)self parentNestingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SBFolderController *)v3;
}

- (unint64_t)iconListViewCount
{
  return [(SBFolderView *)self->_contentView iconListViewCount];
}

- (SBIconListView)currentIconListView
{
  id v2 = [(SBFolderController *)self folderView];
  id v3 = [v2 currentIconListView];

  return (SBIconListView *)v3;
}

- (id)iconListViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(SBFolderController *)self folderView];
  uint64_t v6 = objc_msgSend(v5, "iconListViewAtPoint:", x, y);

  return v6;
}

- (id)iconListViewForTouch:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFolderController *)self folderView];
  uint64_t v6 = [v5 iconListViewForTouch:v4];

  return v6;
}

- (id)iconListViewForDrag:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFolderController *)self folderView];
  uint64_t v6 = [v5 iconListViewForDrag:v4];

  return v6;
}

- (unint64_t)iconListViewIndexForIconListModelIndex:(unint64_t)a3
{
  id v4 = [(SBFolderController *)self folderView];
  unint64_t v5 = [v4 iconListViewIndexForIconListModelIndex:a3];

  return v5;
}

- (BOOL)_isValidPageIndex:(int64_t)a3
{
  id v4 = [(SBFolderController *)self folderView];
  LOBYTE(a3) = [v4 _isValidPageIndex:a3];

  return a3;
}

- (NSArray)visibleIconListViews
{
  id v2 = [(SBFolderController *)self folderView];
  id v3 = [v2 visibleIconListViews];

  return (NSArray *)v3;
}

- (void)_closeFolder
{
  id v3 = [(SBFolderController *)self folderView];
  [(SBFolderController *)self folderViewShouldClose:v3 withPinchGesture:0];
}

- (id)beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = SBLogRootController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Begin overriding page view controller appearance state for reason: %{public}@", buf, 0xCu);
  }

  uint64_t v6 = [(SBFolderController *)self _viewControllersToNotifyForViewObscuration];
  uint64_t v7 = [[_SBFolderControllerPageViewControllerAppearStateOverrideAssertion alloc] initWithFolderController:self reason:v4];
  pageViewControllerAppearStateOverrideAssertions = self->_pageViewControllerAppearStateOverrideAssertions;
  if (!pageViewControllerAppearStateOverrideAssertions)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v10 = self->_pageViewControllerAppearStateOverrideAssertions;
    self->_pageViewControllerAppearStateOverrideAssertions = v9;

    pageViewControllerAppearStateOverrideAssertions = self->_pageViewControllerAppearStateOverrideAssertions;
  }
  [(NSHashTable *)pageViewControllerAppearStateOverrideAssertions addObject:v7];
  if ([(SBFolderController *)self isOverridingPageViewControllerAppearanceStateToRemainDisappeared])
  {
    uint64_t v20 = v6;
    id v21 = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v16, "bs_isAppearingOrAppeared"))
          {
            long long v17 = SBLogRootController();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              id v28 = v16;
              _os_log_debug_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to NO (beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason)", buf, 0xCu);
            }

            [v16 beginAppearanceTransition:0 animated:0];
            long long v18 = SBLogRootController();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              id v28 = v16;
              _os_log_debug_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to NO (beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason)", buf, 0xCu);
            }

            [v16 endAppearanceTransition];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    uint64_t v6 = v20;
    id v4 = v21;
  }

  return v7;
}

- (void)_removePageViewControllerAppearStateOverrideAssertion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = SBLogRootController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 reason];
    *(_DWORD *)buf = 138543362;
    long long v22 = v6;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "End overriding page view controller appearance state for reason: %{public}@", buf, 0xCu);
  }
  [(NSHashTable *)self->_pageViewControllerAppearStateOverrideAssertions removeObject:v4];
  if (![(SBFolderController *)self isOverridingPageViewControllerAppearanceStateToRemainDisappeared])
  {
    pageViewControllerAppearStateOverrideAssertions = self->_pageViewControllerAppearStateOverrideAssertions;
    self->_pageViewControllerAppearStateOverrideAssertions = 0;

    if ([(SBFolderController *)self bs_isAppearingOrAppeared])
    {
      id v8 = [(SBFolderController *)self _viewControllersToNotifyForViewObscuration];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v13, "bs_isDisappearingOrDisappeared"))
            {
              uint64_t v14 = SBLogRootController();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                long long v22 = v13;
                _os_log_debug_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to YES (_removePageViewControllerAppearStateOverrideAssertion)", buf, 0xCu);
              }

              [v13 beginAppearanceTransition:1 animated:0];
              uint64_t v15 = SBLogRootController();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                long long v22 = v13;
                _os_log_debug_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to YES (_removePageViewControllerAppearStateOverrideAssertion)", buf, 0xCu);
              }

              [v13 endAppearanceTransition];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
}

- (id)keepIconImageViewControllersSnapshotsOfType:(unint64_t)a3 inAllPagesExcluding:(id)a4 forReason:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SBLogRootController();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Begin keeping icon image view controllers static in all pages excluding: %{public}@ for reason: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v11 = [[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion alloc] initWithFolderController:self snapshotType:a3 pageIndexesToExclude:v8 reason:v9];
  if (a3 == 1)
  {
    uint64_t v12 = 1136;
  }
  else
  {
    if (a3) {
      goto LABEL_10;
    }
    uint64_t v12 = 1128;
  }
  uint64_t v13 = (void **)((char *)&self->super.super.super.super.isa + v12);
  uint64_t v14 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    long long v16 = *v13;
    *uint64_t v13 = (void *)v15;

    uint64_t v14 = *v13;
  }
  [v14 addObject:v11];
LABEL_10:
  [(SBFolderController *)self _updatePresentationModeForIconViews];

  return v11;
}

- (void)_removeIconImageViewControllerKeepStaticAssertion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = SBLogRootController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 reason];
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "End keeping icon image view controllers static for reason: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [v4 snapshotType];
  if (!v7)
  {
    id v8 = &OBJC_IVAR___SBFolderController__iconImageViewControllerKeepSnapshotTypeDefaultAssertions;
    goto LABEL_7;
  }
  if (v7 == 1)
  {
    id v8 = &OBJC_IVAR___SBFolderController__iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions;
LABEL_7:
    [*(id *)((char *)&self->super.super.super.super.isa + *v8) removeObject:v4];
  }
  [(SBFolderController *)self _updatePresentationModeForIconViews];
}

- (unint64_t)iconImageViewControllerPresentationModeForIconView:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSHashTable *)self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions count]
    || [(NSHashTable *)self->_iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions count])
  {
    unint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v6 = self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) pageIndexesToExclude];
          if (v11) {
            [v5 addIndexes:v11];
          }
        }
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v8);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v12 = self->_iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions;
    uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "pageIndexesToExclude", (void)v31);
          if (v17) {
            [v5 addIndexes:v17];
          }
        }
        uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v14);
    }

    int v18 = 1;
  }
  else
  {
    int v18 = 0;
    unint64_t v5 = 0;
  }
  id v19 = [(SBFolderController *)self folder];
  __int16 v20 = [v4 icon];
  id v21 = [v19 indexPathForIcon:v20];

  int64_t v22 = -[SBFolderController pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", [v21 sbListIndex]);
  if (v18
    && (int64_t v23 = v22, [(SBFolderController *)self _isValidPageIndex:v22])
    && ([v5 containsIndex:v23] & 1) == 0)
  {
    if ([(NSHashTable *)self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions count]) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = 2;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  long long v25 = [(SBFolderController *)self iconLocation];
  long long v26 = [v4 location];
  int v27 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupIconHierarchy", v25);
  int v28 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupIconHierarchy", v26);
  if (v27 & (v28 ^ 1) | SBIconLocationGroupContainsLocation(@"SBIconLocationGroupWidgetConfiguration", v26))unint64_t v29 = 0; {
  else
  }
    unint64_t v29 = v24;

  return v29;
}

- (void)_updatePresentationModeForIconViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_iconViewsWithCustomImageViewControllers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        -[SBFolderController _updatePresentationModeForIconView:](self, "_updatePresentationModeForIconView:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updatePresentationModeForIconView:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "setPresentationMode:", -[SBFolderController iconImageViewControllerPresentationModeForIconView:](self, "iconImageViewControllerPresentationModeForIconView:", v5));
  }
}

- (void)_beginTrackingIconViewWithCustomImageViewController:(id)a3
{
  id v4 = a3;
  iconViewsWithCustomImageViewControllers = self->_iconViewsWithCustomImageViewControllers;
  id v8 = v4;
  if (!iconViewsWithCustomImageViewControllers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_iconViewsWithCustomImageViewControllers;
    self->_iconViewsWithCustomImageViewControllers = v6;

    id v4 = v8;
    iconViewsWithCustomImageViewControllers = self->_iconViewsWithCustomImageViewControllers;
  }
  [(NSHashTable *)iconViewsWithCustomImageViewControllers addObject:v4];
}

- (void)_endTrackingIconViewWithCustomImageViewController:(id)a3
{
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([(SBFolderController *)self isPresentingIconLocation:a4])
  {
    uint64_t v7 = [(SBFolderController *)self currentIconListView];
    id v8 = [v7 model];
    char v9 = [v8 directlyContainsIcon:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[SBFolderController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBFolderController *)self isPresentingIconLocation:v7]
    && [(SBFolderController *)self isDisplayingIconView:v6])
  {
    uint64_t v8 = [v6 location];
    char v9 = [v8 isEqualToString:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(SBFolderController *)self presentedIconLocations];
  uint64_t v8 = [v7 allObjects];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [(SBFolderController *)self iconViewForIcon:v6 location:*(void *)(*((void *)&v16 + 1) + 8 * i) options:a4];
        if (v13)
        {
          long long v14 = (void *)v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  long long v14 = 0;
LABEL_11:

  return v14;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBFolderController *)self presentedIconLocations];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 minusSet:v6];
  uint64_t v10 = [v9 allObjects];
  uint64_t v11 = [(SBFolderController *)self firstIconViewForIcon:v7 inLocations:v10];

  return v11;
}

- (id)firstIconViewWithOptions:(unint64_t)a3 iconPassingTest:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__11;
  long long v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SBFolderController_firstIconViewWithOptions_iconPassingTest___block_invoke;
  v10[3] = &unk_1E6AAE5F8;
  id v7 = v6;
  id v11 = v7;
  BOOL v12 = &v13;
  [(SBFolderController *)self enumerateDisplayedIconViewsWithOptions:a3 usingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __63__SBFolderController_firstIconViewWithOptions_iconPassingTest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v6 = [v7 icon];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SBIconListView)dockListView
{
  return 0;
}

- (id)beginModifyingDockOffscreenFractionForReason:(id)a3
{
  return 0;
}

- (void)setScrollingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBFolderController *)self folderView];
  [v7 _setScrollingDisabled:v4 forReason:v6];
}

- (void)cancelScrolling
{
  id v3 = [(SBFolderController *)self folderView];
  [v3 cancelScrolling];

  id v4 = [(SBFolderController *)self innerFolderController];
  [v4 cancelScrolling];
}

- (id)disableAutoScrollForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self folderView];
  id v6 = [v5 disableAutoScrollForReason:v4];

  return v6;
}

- (id)iconLocation
{
  id v2 = [(SBFolderController *)self iconListViews];
  id v3 = [v2 firstObject];

  if (v3)
  {
    id v4 = [v3 iconLocation];
  }
  else
  {
    id v4 = @"SBIconLocationNone";
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  id v2 = [(SBFolderController *)self folderView];
  unint64_t v3 = [v2 userInterfaceLayoutDirectionHandling];

  return v3;
}

- (void)setIconImageCache:(id)a3
{
  id v6 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v6)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    id v5 = [(SBFolderController *)self folderView];
    [v5 setIconImageCache:v6];
  }
}

- (void)setFolderIconImageCache:(id)a3
{
  id v6 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v6)
  {
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    id v5 = [(SBFolderController *)self folderView];
    [v5 setFolderIconImageCache:v6];
  }
}

- (void)minimumHomeScreenScaleDidChange
{
  id v2 = [(SBFolderController *)self folderView];
  [v2 minimumHomeScreenScaleDidChange];
}

- (id)_dragDelegate
{
  id v3 = [(SBFolderController *)self folderDelegate];
  id v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 draggingDelegateForFolderController:self];
  }
  return v4;
}

- (void)_setHomescreenAndDockAlpha:(double)a3
{
  id v4 = [(SBFolderController *)self folderViewIfLoaded];
  [v4 setAlpha:a3];
}

- (void)_updateHomescreenAndDockFade
{
  if ([(SBFolderController *)self _homescreenAndDockShouldFade])
  {
    id v4 = [(SBNestingViewController *)self nestedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = [v4 isOpen];
    }
    else {
      uint64_t v3 = 0;
    }
    [(SBFolderController *)self _fadeHomescreenAndDockIfNecessaryForFolderOpen:v3];
  }
  else
  {
    [(SBFolderController *)self _setHomescreenAndDockAlpha:1.0];
  }
}

- (void)_hideFakeStatusBarForReason:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  fakeStatusBarHidingReasons = self->_fakeStatusBarHidingReasons;
  id v10 = v6;
  if (!fakeStatusBarHidingReasons)
  {
    id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v9 = self->_fakeStatusBarHidingReasons;
    self->_fakeStatusBarHidingReasons = v8;

    id v6 = v10;
    fakeStatusBarHidingReasons = self->_fakeStatusBarHidingReasons;
  }
  [(NSMutableSet *)fakeStatusBarHidingReasons addObject:v6];
  if ([(NSMutableSet *)self->_fakeStatusBarHidingReasons count]) {
    [(UIStatusBar *)self->_fakeStatusBar setHidden:1 animated:v4];
  }
}

- (void)_unhideFakeStatusBarForReason:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(NSMutableSet *)self->_fakeStatusBarHidingReasons removeObject:a3];
  if (![(NSMutableSet *)self->_fakeStatusBarHidingReasons count])
  {
    fakeStatusBar = self->_fakeStatusBar;
    [(UIStatusBar *)fakeStatusBar setHidden:0 animated:v4];
  }
}

- (SBIconListPageControl)pageControl
{
  id v2 = [(SBFolderController *)self folderView];
  uint64_t v3 = [v2 pageControl];

  return (SBIconListPageControl *)v3;
}

- (BOOL)isPageControlHidden
{
  id v2 = [(SBFolderController *)self folderView];
  char v3 = [v2 isPageControlHidden];

  return v3;
}

- (void)setPageControlHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFolderController *)self folderView];
  [v4 setPageControlHidden:v3];
}

- (double)pageControlAlpha
{
  id v2 = [(SBFolderController *)self folderView];
  [v2 pageControlAlpha];
  double v4 = v3;

  return v4;
}

- (void)setPageControlAlpha:(double)a3
{
  id v4 = [(SBFolderController *)self folderView];
  [v4 setPageControlAlpha:a3];
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  id v2 = [(SBFolderController *)self folderView];
  double v3 = [v2 gridSizeClassDomain];

  return (SBHIconGridSizeClassDomain *)v3;
}

+ (NSString)iconLocation
{
  return (NSString *)@"SBIconLocationNone";
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBFolderController *)self folderView];
  [v6 layoutIconListsWithAnimationType:a3 forceRelayout:v4];
}

- (BOOL)shouldViewControllersAppearVisibleForListView:(id)a3
{
  id v4 = a3;
  if ([(SBFolderController *)self bs_isDisappearingOrDisappeared])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(SBFolderView *)self->_contentView iconListViews];
    uint64_t v7 = [v6 indexOfObjectIdenticalTo:v4];

    int64_t v8 = [(SBFolderController *)self pageIndexForIconListViewIndex:v7];
    int64_t v11 = 0;
    int64_t v12 = 0;
    [(SBFolderView *)self->_contentView getLeadingVisiblePageIndex:&v12 trailingVisiblePageIndex:&v11];
    BOOL v5 = v8 >= v12 && v8 <= v11;
  }

  return v5;
}

- (BOOL)_allowUserInteraction
{
  if ([(SBFolderController *)self isScrolling]) {
    return 0;
  }
  else {
    return ![(SBFolderController *)self isRotating];
  }
}

- (BOOL)closesAfterDragExits
{
  return 1;
}

- (BOOL)canAcceptFolderIconDrags
{
  return 0;
}

- (BOOL)disablesScrollingWhileIconDragIsDropping
{
  return 1;
}

- (void)_cancelCloseFolderTimer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_DEBUG, "[SBFolderController] _cancelCloseFolderTimer was called", v1, 2u);
}

- (void)_closeFolderTimerFired
{
  [(SBFolderController *)self _cancelCloseFolderTimer];
  double v3 = [(SBFolderController *)self folder];

  if (v3)
  {
    id v5 = [(SBFolderController *)self _dragDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(SBFolderController *)self currentIconListView];
      [v5 folderController:self draggedIconShouldDropFromListView:v4];
    }
  }
}

- (void)_setCloseFolderTimerIfNecessary
{
  if (!self->_closeFolderTimer
    && self->_grabbedIconHasEverEnteredFolderView
    && [(SBFolderController *)self closesAfterDragExits]
    && ![(NSMutableSet *)self->_draggingEnteredIconListViews count])
  {
    double v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__closeFolderTimerFired selector:0 userInfo:0 repeats:0.25];
    closeFolderTimer = self->_closeFolderTimer;
    self->_closeFolderTimer = v3;
  }
}

- (void)noteIconDrag:(id)a3 didEnterIconListView:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  if (!draggingEnteredIconListViews)
  {
    int64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v9 = self->_draggingEnteredIconListViews;
    self->_draggingEnteredIconListViews = v8;

    draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  }
  [(NSMutableSet *)draggingEnteredIconListViews addObject:v6];
  [v14 locationInView:v6];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v6 bounds];
  v16.double x = v11;
  v16.double y = v13;
  if (CGRectContainsPoint(v17, v16))
  {
    [(SBFolderController *)self noteUserIsInteractingWithIcons];
    [(SBFolderController *)self _cancelAllInteractionTimers];
    [(SBFolderController *)self _updateAssociatedControllerStateAnimated:0];
    if (![(SBFolderController *)self isAnimating]) {
      self->_grabbedIconHasEverEnteredFolderView = 1;
    }
  }
}

- (void)noteIconDrag:(id)a3 didChangeInIconListView:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(SBFolderController *)self innerFolderController];

  if (v7)
  {
    int64_t v8 = [(SBFolderController *)self innerFolderController];
    [v8 noteIconDrag:v13 didChangeInIconListView:v6];
  }
  else
  {
    if (![(SBFolderController *)self _allowUserInteraction]) {
      [(SBFolderController *)self _cancelAllInteractionTimers];
    }
    if ([(NSMutableSet *)self->_draggingEnteredIconListViews containsObject:v6])
    {
      [v13 locationInView:v6];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      [v6 bounds];
      v15.double x = v10;
      v15.double y = v12;
      if (CGRectContainsPoint(v16, v15))
      {
        if (![(SBFolderController *)self isAnimating]) {
          self->_grabbedIconHasEverEnteredFolderView = 1;
        }
      }
      else
      {
        [(NSMutableSet *)self->_draggingEnteredIconListViews removeObject:v6];
        [(SBFolderController *)self _setCloseFolderTimerIfNecessary];
      }
    }
  }
}

- (void)noteIconDrag:(id)a3 didExitIconListView:(id)a4
{
  id v5 = a4;
  if (-[NSMutableSet containsObject:](self->_draggingEnteredIconListViews, "containsObject:"))
  {
    [(NSMutableSet *)self->_draggingEnteredIconListViews removeObject:v5];
    [(SBFolderController *)self noteUserIsInteractingWithIcons];
    [(SBFolderController *)self _setCloseFolderTimerIfNecessary];
    [(SBFolderController *)self _updateAssociatedControllerStateAnimated:0];
  }
}

- (void)noteIconDragDidEnd:(id)a3
{
  [(SBFolderController *)self _cancelAllInteractionTimers];
  if (![(SBFolderController *)self isEditing])
  {
    id v4 = [(SBFolderController *)self folder];
    [v4 compactLists];
  }
  self->_grabbedIconHasEverEnteredFolderView = 0;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  self->_draggingEnteredIconListViews = 0;
}

- (void)unscatterAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [(SBFolderController *)self _clearIconAnimator];
  if (v6)
  {
    double v9 = [(SBFolderController *)self _newAnimatorForZoomUp:0];
    iconAnimator = self->_iconAnimator;
    self->_iconAnimator = v9;

    [(SBIconAnimator *)self->_iconAnimator prepare];
    [(SBIconAnimator *)self->_iconAnimator setFraction:1.0];
    double v11 = self->_iconAnimator;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__SBFolderController_unscatterAnimated_afterDelay_withCompletion___block_invoke;
    v12[3] = &unk_1E6AAF958;
    v12[4] = self;
    id v13 = v8;
    [(SBIconAnimator *)v11 animateToFraction:v12 afterDelay:0.0 withCompletion:a4];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __66__SBFolderController_unscatterAnimated_afterDelay_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearIconAnimator];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_clearIconAnimator
{
  [(SBIconAnimator *)self->_iconAnimator cleanup];
  iconAnimator = self->_iconAnimator;
  self->_iconAnimator = 0;
}

- (id)_newAnimatorForZoomUp:(BOOL)a3
{
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    id v5 = [(SBIconAnimator *)[SBIconFadeAnimator alloc] initWithAnimationContainer:self];
    BOOL v6 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v7 = [v6 iconAnimationSettings];
    id v8 = [v7 reducedMotionSettings];
    [(SBIconAnimator *)v5 setSettings:v8];
  }
  else
  {
    double v9 = +[SBHHomeScreenDomain rootSettings];
    BOOL v6 = [v9 iconAnimationSettings];

    if (a3) {
      [v6 centerLaunchSettings];
    }
    else {
    uint64_t v7 = [v6 unlockSettings];
    }
    id v5 = [[SBCenterIconZoomAnimator alloc] initWithFolderController:self];
    [(SBIconAnimator *)v5 setSettings:v7];
  }

  return v5;
}

- (unint64_t)_depth
{
  id v2 = [(SBFolderController *)self outerFolderController];
  unint64_t v3 = [v2 _depth] + 1;

  return v3;
}

- (BOOL)_listIndexIsVisible:(unint64_t)a3
{
  return [(SBFolderController *)self currentPageIndex] == a3;
}

- (BOOL)_iconAppearsOnCurrentPage:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self folder];
  BOOL v6 = [v5 indexPathForIcon:v4];

  BOOL v7 = v6
    && [v6 length] == 2
    && [(SBFolderController *)self _listIndexIsVisible:SBFolderRelativeListIndex(v6)];

  return v7;
}

- (void)popFolderAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  BOOL v6 = [(SBFolderController *)self innerFolderController];
  if (v6)
  {
    [(SBNestingViewController *)self popNestedViewControllerAnimated:v4 withCompletion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (BOOL)restoreExpandedPathIdentifiers:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  BOOL v4 = [(SBFolderController *)self folder];
  id v5 = [v4 resolvedComponentsForUniqueIdentifierPath:v23];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v6 = self;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = *(void *)v32;
    id v8 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v11 == v4) {
            continue;
          }
          id v12 = v11;
          id v13 = [(SBFolderController *)v6 controllerClassForFolder:v4];
          id v14 = objc_alloc_init((Class)[(objc_class *)v13 configurationClass]);
          [v14 setOriginatingIconLocation:@"SBIconLocationRoot"];
          [(SBFolderController *)v6 configureInnerFolderControllerConfiguration:v14];
          [v14 setFolder:v12];
          uint64_t v15 = [[v13 alloc] initWithConfiguration:v14];
          [v24 addObject:v15];
          CGRect v16 = [(SBFolderController *)v6 iconLocation];
          [v14 setOriginatingIconLocation:v16];
        }
        else
        {
          CGRect v17 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          id v14 = v11;
          long long v19 = [v8 folder];
          uint64_t v20 = [v19 indexOfList:v14];

          if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
            [v8 setCurrentPageIndex:v20];
          }
          uint64_t v15 = (uint64_t)v8;
        }

        id v8 = (void *)v15;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = -1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  _OWORD v26[2] = __53__SBFolderController_restoreExpandedPathIdentifiers___block_invoke;
  v26[3] = &unk_1E6AB13A8;
  v26[4] = &v27;
  [(SBNestingViewController *)v6 setNestedViewControllers:v24 withCompletion:v26];
  BOOL v21 = *((_DWORD *)v28 + 6) == 1;
  _Block_object_dispose(&v27, 8);

  return v21;
}

uint64_t __53__SBFolderController_restoreExpandedPathIdentifiers___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSIndexPath)currentIndexPath
{
  unint64_t v3 = [(SBFolderController *)self innerFolderController];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 currentIndexPath];
    BOOL v6 = [(SBFolderController *)self folder];
    uint64_t v7 = [v4 folder];
    id v8 = [v6 indexPathForNodeIdentifier:v7];
    uint64_t v9 = objc_msgSend(v5, "bs_indexPathByAddingPrefix:", v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
  }

  return (NSIndexPath *)v9;
}

- (void)_cancelTouchesForCustomIconImageViewController:(id)a3
{
  id v10 = a3;
  BOOL v4 = -[NSMapTable objectForKey:](self->_iconViewCustomImageViewControllerTouchCancellationAssertions, "objectForKey:");

  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = [v10 cancelTouchesForCurrentEventInHostedContent];
    if (v5)
    {
      BOOL v6 = (void *)v5;
      iconViewCustomImageViewControllerTouchCancellationAssertions = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
      if (!iconViewCustomImageViewControllerTouchCancellationAssertions)
      {
        id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v9 = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
        self->_iconViewCustomImageViewControllerTouchCancellationAssertions = v8;

        iconViewCustomImageViewControllerTouchCancellationAssertions = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
      }
      [(NSMapTable *)iconViewCustomImageViewControllerTouchCancellationAssertions setObject:v6 forKey:v10];
    }
  }
}

- (id)cancelTouchesForAllCustomIconImageViewControllersForReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[SBHCompoundAssertion alloc] initWithReason:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v6 = self->_iconViewsWithCustomImageViewControllers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "customIconImageViewController", (void)v15);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [v11 cancelTouchesForCurrentEventInHostedContent];
          if (v12)
          {
            id v13 = (void *)v12;
            [(SBHCompoundAssertion *)v5 addAssertion:v12];
          }
        }
      }
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canAnyIconViewBeVisiblySettled
{
  return ![(SBFolderController *)self isScrolling]
      && [(SBFolderController *)self contentVisibility] != 2;
}

- (id)matchMoveSourceViewForIconView:(id)a3
{
  id v4 = [a3 location];
  int v5 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v4);

  if (v5) {
    [(SBFolderController *)self dockListView];
  }
  else {
  BOOL v6 = [(SBFolderController *)self currentIconListView];
  }
  return v6;
}

- (UIWindow)animationWindow
{
  id v2 = [(SBFolderController *)self animationContext];
  unint64_t v3 = [v2 animationWindow];

  return (UIWindow *)v3;
}

- (UIView)fallbackIconContainerView
{
  id v2 = [(SBFolderController *)self animationContext];
  unint64_t v3 = [v2 fallbackIconContainer];

  return (UIView *)v3;
}

- (SBHIconModel)iconModel
{
  id v2 = [(SBFolderController *)self folder];
  unint64_t v3 = [v2 rootFolder];

  id v4 = self;
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v3 model];
  }
  else
  {
    int v5 = 0;
  }

  return (SBHIconModel *)v5;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(SBFolderController *)self presentedIconLocations];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        id v13 = [(SBFolderController *)self iconViewForIcon:v6 location:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        if (v13) {
          v7[2](v7, v13);
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)borrowScalingView
{
  id v2 = [(SBFolderController *)self folderView];
  unint64_t v3 = [v2 borrowScalingView];

  return v3;
}

- (void)returnScalingView
{
  id v2 = [(SBFolderController *)self folderView];
  [v2 returnScalingView];
}

- (void)prepareForAnimation:(id)a3 withTargetIcon:(id)a4
{
}

- (void)setContentAlpha:(double)a3
{
  id v4 = [(SBFolderController *)self folderView];
  [v4 setContentAlpha:a3];
}

- (UIEdgeInsets)statusBarInsetsForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
LABEL_7:
    v19.receiver = self;
    v19.super_class = (Class)SBFolderController;
    -[SBNestingViewController sizeForChildContentContainer:withParentContainerSize:](&v19, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    double v12 = v15;
    double v14 = v16;
    goto LABEL_8;
  }
  uint64_t v10 = [v7 viewIfLoaded];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

LABEL_8:
  double v17 = v12;
  double v18 = v14;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBFolderController;
  -[SBFolderController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [v7 containerView];
  char v9 = [v8 _window];

  uint64_t v10 = [v9 _fromWindowOrientation];
  uint64_t v11 = [v9 _toWindowOrientation];
  [(SBFolderController *)self allowedOrientations];
  int64_t v12 = [(SBFolderController *)self orientation];
  if (SBFInterfaceOrientationMaskContainsInterfaceOrientation() && v12 != v11)
  {
    double v13 = SBLogIcon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v14);
      v30.double width = width;
      v30.double height = height;
      double v16 = NSStringFromCGSize(v30);
      *(_DWORD *)buf = 138544130;
      int64_t v22 = v15;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "%{public}@ will transition to size %{public}@, %li to %li orientation", buf, 0x2Au);
    }
    [(SBFolderController *)self setRotating:1];
    double v17 = [(SBFolderController *)self folderView];
    objc_msgSend(v17, "transitionToSize:withTransitionCoordinator:", v7, width, height);
    [(SBFolderController *)self _resetFakeStatusBarFrameOnly];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v19[3] = &unk_1E6AAEFB0;
    void v19[4] = self;
    v19[5] = v11;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v18[3] = &unk_1E6AACFA8;
    v18[4] = self;
    [v7 animateAlongsideTransition:v19 completion:v18];
  }
}

uint64_t __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOrientation:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  if (v8 >= v10) {
    double v11 = v8;
  }
  else {
    double v11 = v10;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "setFrame:", v4, v6, v11, v11);
  int64_t v12 = *(void **)(a1 + 32);
  return [v12 _resetFakeStatusBarFrameOnly];
}

uint64_t __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[131];
  double v4 = [v2 view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  double v5 = *(void **)(a1 + 32);
  return [v5 setRotating:0];
}

- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  double v7 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderController:v8 draggedIconShouldDropFromListView:v6];
  }
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  double v7 = v6;
  if (!v6 || [v6 folderControllerShouldClose:self withPinchGesture:v5]) {
    [(SBFolderController *)self popFolderAnimated:1 completion:0];
  }

  return 0;
}

- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  [v6 folderControllerShouldBeginEditing:self withHaptic:v4];
}

- (void)folderControllerShouldEndEditing:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 folderControllerShouldEndEditing:self];
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self folderDelegate];
  [v5 folderControllerWillBeginScrolling:v4];
}

- (void)folderControllerDidEndScrolling:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self folderDelegate];
  [v5 folderControllerDidEndScrolling:v4];
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = [v9 folderController:self iconListView:v7 canHandleIconDropSession:v8];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 iconDropSessionDidEnter:v7];
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SBFolderController *)self _dragDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v9 folderController:self iconListView:v7 iconDropSessionDidUpdate:v8],
        (char v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
  }

  return v10;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 iconDropSessionDidExit:v7];
  }
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 performIconDrop:v7];
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [(SBFolderController *)self _dragDelegate];
  double v15 = v13;
  if (objc_opt_respondsToSelector())
  {
    double v15 = [v14 folderController:v10 iconListView:v11 iconViewForDroppingIconDragItem:v12 proposedIconView:v13];
  }
  return v15;
}

- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v13 folderController:v14 iconListView:v10 willUseIconView:v11 forDroppingIconDragItem:v12];
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SBFolderController *)self _dragDelegate];
  double v15 = v13;
  if (objc_opt_respondsToSelector())
  {
    double v15 = [v14 folderController:v10 iconListView:v11 previewForDroppingIconDragItem:v12 proposedPreview:v13];
  }
  return v15;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 folderController:self iconListView:v12 iconDragItem:v9 willAnimateDropWithAnimator:v10];
  }
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    char v13 = [v12 folderController:self iconListView:v9 shouldAllowSpringLoadedInteractionForIconDropSession:v10 onIconView:v11];
  }
  else {
    char v13 = 0;
  }

  return v13;
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 springLoadedInteractionForIconDragDidCompleteOnIconView:v7];
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v9 folderController:self iconListView:v7 customSpringAnimationBehaviorForDroppingItem:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 contentOverlayInsetsFromParentIfAvailableForFolderController:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)folderController:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v10 = objc_msgSend(v9, "folderController:accessibilityTintColorForScreenRect:", self, x, y, width, height);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)folderController:(id)a3 willCreateInnerFolderControllerWithConfiguration:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  double v7 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderController:v8 willCreateInnerFolderControllerWithConfiguration:v6];
  }
}

- (void)folderControllerWillClose:(id)a3
{
  id v8 = a3;
  id v4 = [(SBFolderController *)self folderView];
  [v4 setSuppressesEditingStateForListViews:0];

  double v5 = [(SBFolderController *)self folder];
  if ([v5 isRootFolder])
  {
    id v6 = [(SBFolderController *)self folderView];
    objc_msgSend(v6, "setContentVisibility:", -[SBFolderController effectiveContentVisibilityFolderHasInnerFolder:](self, "effectiveContentVisibilityFolderHasInnerFolder:", 0));
  }
  else
  {
    [(SBFolderController *)self updateContentViewOcclusion];
  }
  double v7 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderControllerWillClose:v8];
  }
}

- (void)folderControllerDidClose:(id)a3
{
  id v6 = (SBFolderController *)a3;
  id v4 = [(SBFolderController *)v6 folder];
  if (([v4 isRootFolder] & 1) == 0) {
    [v4 setRequiredTrailingEmptyListCount:0];
  }
  if (v6 == self)
  {
    if ([(SBFolderController *)v6 wasFolderCancelable]) {
      [v4 setCancelable:1];
    }
  }
  else
  {
    [(SBFolderController *)self removeAssertionsFromInnerFolderController:v6];
  }
  double v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderControllerDidClose:v6];
  }
}

- (id)folderControllerWantsToHideStatusBar:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 folderControllerWantsToHideStatusBar:v6 animated:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fakeStatusBarForFolderController:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 fakeStatusBarForFolderController:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)folderController:(id)a3 willRemoveFakeStatusBar:(id)a4
{
  id v6 = a4;
  double v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderController:self willRemoveFakeStatusBar:v6];
  }
}

- (id)statusBarStyleRequestForFolderController:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [v4 statusBarStyleRequestForFolderController:self];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)statusBarEdgeInsetsForFolderController:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 statusBarEdgeInsetsForFolderController:self];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)folderController:(id)a3 iconAnimatorForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6 initialDelay:(double *)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  double v12 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v13 = [v12 folderController:self iconAnimatorForOperation:a4 onViewController:v11 animated:v8 initialDelay:a7];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a4;
  id v11 = a6;
  double v12 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v12 folderController:self willUseIconTransitionAnimator:v13 forOperation:a5 onViewController:v11 animated:v7];
  }
}

- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v10 = [v7 folder];
    id v11 = [v10 icon];

    double v12 = [(SBFolderController *)self firstIconViewForIcon:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFolderController;
    double v12 = [(SBNestingViewController *)&v14 nestingViewController:v6 sourceViewForPresentingViewController:v7];
  }

  return v12;
}

- (void)folderView:(id)a3 willAnimateScrollToPageIndex:(int64_t)a4
{
  id v11 = a3;
  iconImageViewControllerKeepStaticForAnimatedScrollAssertion = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  if (iconImageViewControllerKeepStaticForAnimatedScrollAssertion)
  {
    [(BSInvalidatable *)iconImageViewControllerKeepStaticForAnimatedScrollAssertion invalidate];
    id v7 = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
    self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion = 0;
  }
  BOOL v8 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a4];
  objc_msgSend(v8, "addIndex:", objc_msgSend(v11, "currentPageIndex"));
  double v9 = [(SBFolderController *)self keepIconImageViewControllersSnapshotsOfType:1 inAllPagesExcluding:v8 forReason:@"AnimatedScroll"];
  [(BSInvalidatable *)self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion invalidate];
  double v10 = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion = v9;
}

- (void)folderViewShouldClose:(id)a3 withPinchGesture:(id)a4
{
  id v6 = a4;
  if (![(SBFolderController *)self isRotating])
  {
    double v5 = [(SBFolderController *)self folderDelegate];
    [v5 folderControllerShouldClose:self withPinchGesture:v6];
  }
}

- (void)folderViewShouldBeginEditing:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 folderControllerShouldBeginEditing:self withHaptic:0];
}

- (void)folderViewShouldEndEditing:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 folderControllerShouldEndEditing:self];
}

- (BOOL)folderView:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = [v9 folderController:self iconListView:v7 canHandleIconDropSession:v8];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 iconDropSessionDidEnter:v7];
  }
  [(SBFolderController *)self noteIconDrag:v7 didEnterIconListView:v9];
  [v9 addDragObserver:self forDropSession:v7];
}

- (id)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SBFolderController *)self _dragDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v9 folderController:self iconListView:v7 iconDropSessionDidUpdate:v8],
        (char v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
  }
  [(SBFolderController *)self noteIconDrag:v8 didChangeInIconListView:v7];
  if ([v7 iconsNeedLayout]) {
    [(SBFolderController *)self layoutIconListsWithAnimationType:0 forceRelayout:1];
  }

  return v10;
}

- (void)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  [(SBFolderController *)self noteIconDrag:v7 didExitIconListView:v9];
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 iconDropSessionDidExit:v7];
  }
}

- (void)folderView:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 performIconDrop:v7];
  }
}

- (id)folderView:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [(SBFolderController *)self _dragDelegate];
  id v13 = v11;
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v12 folderController:self iconListView:v9 iconViewForDroppingIconDragItem:v10 proposedIconView:v11];
  }
  return v13;
}

- (void)folderView:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 folderController:self iconListView:v12 willUseIconView:v9 forDroppingIconDragItem:v10];
  }
}

- (id)folderView:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SBFolderController *)self _dragDelegate];
  id v13 = v11;
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v12 folderController:self iconListView:v9 previewForDroppingIconDragItem:v10 proposedPreview:v11];
  }
  return v13;
}

- (void)folderView:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v14 folderController:self iconListView:v11 iconDragItem:v12 willAnimateDropWithAnimator:v13];
  }
  if ([(SBFolderController *)self disablesScrollingWhileIconDragIsDropping])
  {
    [v10 _setScrollingDisabled:1 forReason:@"SBFolderController-IconDropping"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__SBFolderController_folderView_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke;
    v15[3] = &unk_1E6AACB50;
    id v16 = v10;
    [v13 addCompletion:v15];
  }
}

uint64_t __87__SBFolderController_folderView_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setScrollingDisabled:0 forReason:@"SBFolderController-IconDropping"];
}

- (BOOL)folderView:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    char v13 = [v12 folderController:self iconListView:v9 shouldAllowSpringLoadedInteractionForIconDropSession:v10 onIconView:v11];
  }
  else {
    char v13 = 0;
  }

  return v13;
}

- (void)folderView:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 folderController:self iconListView:v9 springLoadedInteractionForIconDragDidCompleteOnIconView:v7];
  }
}

- (id)folderView:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SBFolderController *)self _dragDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v9 folderController:self iconListView:v7 customSpringAnimationBehaviorForDroppingItem:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 contentOverlayInsetsFromParentIfAvailableForFolderController:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)folderView:(id)a3 accessibilityTintColorForRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  double v10 = [(SBFolderController *)self folderDelegate];
  double v11 = [v9 _screen];
  double v12 = [v11 coordinateSpace];
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if (objc_opt_respondsToSelector())
  {
    BOOL v21 = objc_msgSend(v10, "folderController:accessibilityTintColorForScreenRect:", self, v14, v16, v18, v20);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)folderViewDidChangeOrientation:(id)a3
{
  id v4 = a3;
  if (![(SBFolderController *)self isRotating]) {
    -[SBFolderController setOrientation:](self, "setOrientation:", [v4 orientation]);
  }
}

uint64_t __52__SBFolderController_folderView_didAddIconListView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) iconListView:*(void *)(a1 + 40) didAddIconView:a2];
}

- (void)folderView:(id)a3 didRemoveIconListView:(id)a4
{
}

- (void)iconListView:(id)a3 iconDropSessionDidEnd:(id)a4
{
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 customIconImageViewController];
  if (v7)
  {
    id v9 = SBLogRootController();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBFolderController iconView:didChangeCustomImageViewController:]();
    }

    [(SBFolderController *)self bs_removeChildViewController:v7];
    [(SBFolderController *)self _endTrackingIconViewWithCustomImageViewController:v6];
  }
  if (v8)
  {
    if (([v6 isIconImageViewBorrowed] & 1) == 0)
    {
      objc_msgSend(v6, "setCustomIconImageViewHitTestingDisabled:", -[SBFolderController _isHitTestingDisabledOnCustomIconImageViewControllers](self, "_isHitTestingDisabledOnCustomIconImageViewControllers"));
      double v10 = SBLogRootController();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[SBFolderController iconView:didChangeCustomImageViewController:]();
      }

      double v11 = [v8 view];
      double v12 = [v11 superview];

      if (!v12) {
        NSLog(&cfstr_NoSuperview.isa);
      }
      double v13 = [(SBFolderController *)self parentViewControllerForCustomIconImageViewControllerForIconView:v6];
      objc_msgSend(v13, "bs_addChildViewController:", v8);
    }
    [(SBFolderController *)self _beginTrackingIconViewWithCustomImageViewController:v6];
  }
}

- (void)iconViewWillPresentContextMenu:(id)a3
{
  id v7 = [a3 object];
  BOOL v4 = [(SBFolderController *)self isDisplayingIconView:v7];
  double v5 = v7;
  if (v4)
  {
    id v6 = [v7 customIconImageViewController];
    if (v6) {
      [(SBFolderController *)self _cancelTouchesForCustomIconImageViewController:v6];
    }

    double v5 = v7;
  }
}

- (void)iconViewDidDismissContextMenu:(id)a3
{
  id v4 = [a3 object];
  if (-[SBFolderController isDisplayingIconView:](self, "isDisplayingIconView:")) {
    [(SBFolderController *)self _invalidateAllCancelTouchesAssertions];
  }
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [(SBFolderController *)self innerFolderController];
  double v8 = [v7 folder];
  id v9 = [v8 icon];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "isEqual:", v9, (void)v15)) {
          [(SBFolderController *)self popFolderAnimated:0 completion:0];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v6 = a4;
  id v9 = [(SBFolderController *)self innerFolderController];
  id v7 = [v9 folder];
  double v8 = [v7 icon];

  LODWORD(v7) = [v6 isEqual:v8];
  if (v7) {
    [(SBFolderController *)self popFolderAnimated:0 completion:0];
  }
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFolderController *)self iconLocation];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (NSSet)presentedIconLocations
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  double v3 = [(SBFolderController *)self iconLocation];
  id v4 = [v2 setWithObject:v3];

  return (NSSet *)v4;
}

- (id)preferredFocusEnvironments
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(SBFolderController *)self innerFolderController];
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 folderView];
    v10[0] = v5;
    char v6 = (void **)v10;
  }
  else
  {
    double v5 = [(SBFolderController *)self folderView];
    id v9 = v5;
    char v6 = &v9;
  }
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v7;
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SBFolderController *)self folderView];
  uint64_t v11 = [v10 beginHidingIconsFromLayout:v9 reason:v8 options:a5];

  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  long long v16 = [(SBFolderController *)self innerFolderController];
  if (v16) {
    [v15 addAssertionFromChild:v16];
  }
  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    long long v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v19 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v18;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  [(NSHashTable *)layoutHidingAssertions addObject:v15];

  return v15;
}

- (void)removeAssertionsFromInnerFolderController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_layoutHidingAssertions;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "removeAndInvalidateAssertionsForChild:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBFolderView *)self->_contentView setLegibilitySettings:*p_legibilitySettings];
    uint64_t v6 = [(SBFolderController *)self innerFolderController];
    [v6 setLegibilitySettings:*p_legibilitySettings];
  }
}

- (id)accessibilityTintColorForScreenRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "folderController:accessibilityTintColorForScreenRect:", self, x, y, width, height);
  }
  else {
  uint64_t v9 = [(SBFolderController *)self defaultAccessibilityTintColor];
  }

  return v9;
}

- (id)succinctDescription
{
  id v2 = [(SBFolderController *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (id)context
{
  return self->_context;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (void)setOriginatingIconLocation:(id)a3
{
}

- (UIColor)defaultAccessibilityTintColor
{
  return self->_defaultAccessibilityTintColor;
}

- (void)setDefaultAccessibilityTintColor:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BSInvalidatable)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
}

- (UIStatusBar)fakeStatusBar
{
  return self->_fakeStatusBar;
}

- (void)setFakeStatusBar:(id)a3
{
}

- (BOOL)wasFolderCancelable
{
  return self->_wasFolderCancelable;
}

- (void)setWasFolderCancelable:(BOOL)a3
{
  self->_wasFolderCancelable = a3;
}

- (SBFolderControllerAnimationContext)animationContext
{
  return self->_animationContext;
}

- (void)setAnimationContext:(id)a3
{
}

- (void)setPageControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_fakeStatusBar, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_defaultAccessibilityTintColor, 0);
  objc_storeStrong((id *)&self->_originatingIconLocation, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_extraAssertions, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_folderIconView, 0);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_destroyWeak((id *)&self->_folderDelegate);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_appearanceTransitioningCustomImageViewControllers, 0);
  objc_storeStrong((id *)&self->_iconViewCustomImageViewControllerTouchCancellationAssertions, 0);
  objc_storeStrong((id *)&self->_iconViewsWithCustomImageViewControllers, 0);
  objc_storeStrong((id *)&self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion, 0);
  objc_storeStrong((id *)&self->_iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions, 0);
  objc_storeStrong((id *)&self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions, 0);
  objc_storeStrong((id *)&self->_pageViewControllerAppearStateOverrideAssertions, 0);
  objc_storeStrong((id *)&self->_realStatusBarHidingReasons, 0);
  objc_storeStrong((id *)&self->_fakeStatusBarHidingReasons, 0);
  objc_storeStrong((id *)&self->_draggingEnteredIconListViews, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_closeFolderTimer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)nestingViewController:animationControllerForOperation:onViewController:animated:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "Forcing cross-fade animation for folder transition for icon: %@", v1, 0xCu);
}

- (void)pushFolderIcon:location:animated:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Folder icon %@ cannot be opened because it does not exist on the current page.", (uint8_t *)v1, 0x16u);
}

- (void)pushFolderIcon:location:animated:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Unable to open folder icon %@ because we aren't actually open!", (uint8_t *)v1, 0x16u);
}

- (void)iconListView:didAddIconView:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1D7F0A000, v1, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to %{BOOL}u (didAddIconView)", v2, 0x12u);
}

- (void)iconListView:didAddIconView:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Adding %p as a child of folder controller (didAddIconView)", v2, v3, v4, v5, v6);
}

- (void)iconListView:didRemoveIconView:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Ending appearance transition of %p to NO (didRemoveIconView)", v2, v3, v4, v5, v6);
}

- (void)iconListView:didRemoveIconView:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Beginning appearance transition of %p to NO (didRemoveIconView)", v2, v3, v4, v5, v6);
}

- (void)iconListView:didRemoveIconView:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Removing %p as a child of folder controller (didRemoveIconView)", v2, v3, v4, v5, v6);
}

- (void)iconListView:didRemoveIconView:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Not removing %p as a child of folder controller because it's in another view already (didRemoveIconView)", v2, v3, v4, v5, v6);
}

- (void)iconView:didChangeCustomImageViewController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Adding %p as a child of folder controller (oldCustomImageViewController)", v2, v3, v4, v5, v6);
}

- (void)iconView:didChangeCustomImageViewController:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Removing %p as a child of folder controller (oldCustomImageViewController)", v2, v3, v4, v5, v6);
}

@end