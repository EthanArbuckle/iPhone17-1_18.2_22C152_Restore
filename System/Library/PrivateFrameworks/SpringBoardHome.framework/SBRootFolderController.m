@interface SBRootFolderController
+ (BOOL)pageStateTransitionPrefersUsingScrollingDirection;
+ (Class)_contentViewClass;
+ (Class)configurationClass;
+ (NSString)dockIconLocation;
+ (SBRootFolderPageStateTransitionSnapshot)pageStateTransitionSnapshotForScrollOffset:(SEL)a3 pageWidth:(double)a4 pageSpacing:(double)a5 pages:(double)a6 pageCount:(const int64_t *)a7 userInterfaceLayoutDirection:(unint64_t)a8 currentPageState:(int64_t)a9 currentPageOffset:(int64_t)a10 scrollingDirection:(unint64_t)a11;
+ (id)iconLocation;
- (BOOL)_internalDismissWidgetAddSheet:(BOOL)a3 clearAddSheetViewController:(BOOL)a4 notifyObservers:(BOOL)a5;
- (BOOL)_leadingCustomViewShouldShowAddWidgetButtonWhenEditing;
- (BOOL)_leadingCustomViewShouldShowDoneButtonWhenEditing;
- (BOOL)_listIndexIsVisible:(unint64_t)a3;
- (BOOL)_trailingCustomViewShouldShowAddWidgetButtonWhenEditing;
- (BOOL)_trailingCustomViewShouldShowDoneButtonWhenEditing;
- (BOOL)allowsAutoscrollToLeadingCustomView;
- (BOOL)canAcceptFolderIconDrags;
- (BOOL)canShowWidgetIntroduction;
- (BOOL)canTransitionPageStateToState:(int64_t)a3;
- (BOOL)closesAfterDragExits;
- (BOOL)disablesScrollingWhileIconDragIsDropping;
- (BOOL)dismissWidgetAddSheetIfPresentedAndClearAnimated:(BOOL)a3;
- (BOOL)iconListViewContainsWidget:(unint64_t)a3;
- (BOOL)iconListViewsContainWidget;
- (BOOL)isAnySearchTransitioning;
- (BOOL)isAnySearchVisible;
- (BOOL)isAnySearchVisibleOrTransitioning;
- (BOOL)isDisplayingEditingButtons;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5;
- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4;
- (BOOL)isDisplayingWidgetIntroductionOnPage:(int64_t)a3;
- (BOOL)isDockExternal;
- (BOOL)isDockVisible;
- (BOOL)isLeadingCustomViewOrLeadingCustomViewSearchVisible;
- (BOOL)isLeadingCustomViewPageHidden;
- (BOOL)isLeadingCustomViewPageHiddenAtIndex:(unint64_t)a3;
- (BOOL)isLeadingCustomViewSearchTransitioning;
- (BOOL)isLeadingCustomViewSearchVisible;
- (BOOL)isLeadingCustomViewSearchVisibleOrTransitioning;
- (BOOL)isLeadingCustomViewTransitioning;
- (BOOL)isLeadingCustomViewVisible;
- (BOOL)isLeadingCustomViewVisibleOrTransitionDestination;
- (BOOL)isOccludedByOverlay;
- (BOOL)isOnLeadingCustomPage;
- (BOOL)isPageManagementUITransitioningOutOfVisible;
- (BOOL)isPageManagementUIVisible;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isPullDownSearchTransitioning;
- (BOOL)isPullDownSearchVisible;
- (BOOL)isPullDownSearchVisibleOrTransitioning;
- (BOOL)isPullDownSearchVisibleOrTransitioningToVisible;
- (BOOL)isTrailingCustomViewTransitioning;
- (BOOL)isTrailingCustomViewVisibleOrTransitionDestination;
- (BOOL)isTransitioningBetweenHorizontalPageStates;
- (BOOL)isTransitioningBetweenIconAndLeadingCustomView;
- (BOOL)isTransitioningBetweenIconAndTrailingCustomView;
- (BOOL)isTransitioningBetweenIconPageAndLeadingCustomPage;
- (BOOL)isTransitioningBetweenIconPageAndTrailingCustomPage;
- (BOOL)isTransitioningBetweenPageStateVerticalGroups;
- (BOOL)isTransitioningHorizontally;
- (BOOL)isTransitioningPageState;
- (BOOL)managesStatusBarWidth;
- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)showsDoneButtonWhileEditing;
- (BOOL)stackConfigurationInteraction:(id)a3 allowsRemovalOfIconDataSource:(id)a4;
- (BOOL)suppressesExtraEditingButtons;
- (BOOL)suspendsWallpaperAnimationWhileOpen;
- (BSInvalidatable)searchGestureIconViewTouchCancellationAssertion;
- (NSArray)folderControllers;
- (NSArray)leadingCustomViewControllers;
- (NSArray)trailingCustomViewControllers;
- (NSSet)nonDockPresentedIconLocations;
- (NSSet)presentedIconLocations;
- (SBFParallaxSettings)parallaxSettings;
- (SBHMainAddSheetViewControlling)addSheetViewController;
- (SBHRecentsDocumentExtensionProvider)recentsDocumentExtensionProvider;
- (SBHRootFolderCustomViewPresenting)leadingCustomViewController;
- (SBHRootFolderCustomViewPresenting)trailingCustomViewController;
- (SBHSearchPresentable)searchPresentableViewController;
- (SBHSearchPresenting)searchPresenter;
- (SBHStackConfigurationViewController)stackConfigurationViewController;
- (SBHomeScreenDefaults)homeScreenDefaults;
- (SBRootFolderController)initWithConfiguration:(id)a3;
- (SBRootFolderControllerAccessoryViewControllerDelegate)accessoryViewControllerDelegate;
- (SBRootFolderPageStateTransitionSnapshot)pageStateTransitionSnapshotForScrollOffset:(SEL)a3;
- (SBRootFolderPageTransition)implicitScrollTransition;
- (SBRootFolderPageTransition)searchGestureTransition;
- (SBSearchGesture)searchGesture;
- (UIView)searchBackdropView;
- (UIView)searchableLeadingCustomWrapperView;
- (UIViewController)pullDownSearchViewController;
- (_SBRootFolderPageTransitionHandle)currentTransitionHandle;
- (double)_additionalMinimumOffsetForSheetPresentation;
- (double)_anySearchVisibilityProgress;
- (double)_leadingCustomViewVisibilityProgress;
- (double)_trailingCustomViewVisibilityProgress;
- (double)distanceToTopOfSpotlightIconsForRootFolderView:(id)a3;
- (double)dockHeight;
- (double)externalDockHeightForRootFolderView:(id)a3;
- (double)maxExternalDockHeightForRootFolderView:(id)a3;
- (double)pageTransitionProgress;
- (double)preferredExternalDockVerticalMarginForRootFolderView:(id)a3;
- (double)spotlightFirstIconRowOffset;
- (double)titledButtonsAlpha;
- (double)visibilityProgressTowardPageStateMatchingTest:(id)a3;
- (id)_addWidgetSheetConfigurationManager;
- (id)_makeContentViewWithConfiguration:(id)a3;
- (id)_viewControllersToNotifyForViewObscuration;
- (id)addWidgetAddSheetObserver:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)applicationWidgetCollectionsForEditingViewController:(id)a3 withAllowedSizeClasses:(id *)a4 allowingNonStackableItems:(BOOL)a5;
- (id)backgroundViewForDockForRootFolderView:(id)a3;
- (id)backgroundViewForEditingDoneButtonForRootFolderView:(id)a3;
- (id)beginModifyingDockOffscreenFractionForReason:(id)a3;
- (id)beginPageStateTransitionToState:(int64_t)a3 pageIndex:(int64_t)a4 reason:(id)a5 animated:(BOOL)a6 interactive:(BOOL)a7;
- (id)beginPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (id)customViewControllerForPageIndex:(int64_t)a3;
- (id)defaultTransitionForTransitioningFromPageState:(int64_t)a3 toPageState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)dockIconListView;
- (id)dockListView;
- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4;
- (id)iconLocationForListsWithNonDefaultSizedIconsForRootFolderView:(id)a3;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5;
- (id)interactionControllerForDismissal:(id)a3;
- (id)interactionControllerForPresentation:(id)a3;
- (id)parentViewControllerForCustomIconImageViewControllerForIconView:(id)a3;
- (id)showDoneButtonForReason:(id)a3;
- (id)stackConfigurationInteraction:(id)a3 dragPreviewForIconView:(id)a4;
- (id)stackConfigurationInteraction:(id)a3 draggedIconForIdentifier:(id)a4;
- (id)stackConfigurationInteraction:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5;
- (id)updateStateTransitionsDuringScrollingScrollView:(id)a3 pageBounceComparator:(void *)a4;
- (id)viewControllerForPageState:(int64_t)a3;
- (id)viewControllerForTransitioningFromPageState:(int64_t)a3 toPageState:(int64_t)a4;
- (id)viewControllersForPageIndex:(int64_t)a3;
- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4;
- (id)windowForIconDragPreviewsForStackConfigurationInteraction:(id)a3 forWindowScene:(id)a4;
- (int64_t)destinationPageState;
- (int64_t)leadingCustomViewPageIndex;
- (int64_t)pageIndexForLeadingCustomPageIndex:(unint64_t)a3;
- (int64_t)pageIndexForTrailingCustomPageIndex:(unint64_t)a3;
- (int64_t)pageState;
- (int64_t)trailingCustomViewPageIndex;
- (unint64_t)_addWidgetSheetStyle;
- (unint64_t)_currentHomeScreenEditingGridSize;
- (unint64_t)_defaultEditingSuggestedWidgetItemsFamilyMask;
- (unint64_t)_depth;
- (unint64_t)_stackConfigurationGridSize;
- (unint64_t)destinationPageOffset;
- (unint64_t)dockEdge;
- (unint64_t)hiddenListCountWhenPageManagementPresented;
- (unint64_t)presentationSource;
- (unint64_t)presenterType;
- (unint64_t)showsAddWidgetButtonWhileEditingAllowedOrientations;
- (unint64_t)snapshotTypeForIconImageViewControllersUnderWidgetAddSheet;
- (void)_cancelTouchesForSearchGestureOnIconView:(id)a3;
- (void)_checkForImproperScrollOffsetForPageState;
- (void)_dismissPageManagementIfPresented:(id)a3;
- (void)_doPageManagementEducation;
- (void)_handleWidgetSheetViewControllerDidDisappear:(id)a3;
- (void)_handleWidgetSheetViewControllerWillAppear:(id)a3;
- (void)_handleWidgetSheetViewControllerWillDisappear:(id)a3;
- (void)_invalidateSearchGestureIconViewTouchCancellationAssertion;
- (void)_presentPageManagement:(id)a3;
- (void)_refreshGalleryContentForHomeScreenEditingIfNecessary;
- (void)_removeShowDoneButtonAssertion:(id)a3;
- (void)_updateAddWidgetSheetIconCache;
- (void)_updateFolderRequiredTrailingEmptyListCount;
- (void)_updateStatusBarHiddenForWidgetSheetViewController:(id)a3 visible:(BOOL)a4;
- (void)acceptWidgetIntroduction;
- (void)addPageStateObserver:(id)a3;
- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)addWidgetSheetViewControllerDidAppear:(id)a3;
- (void)addWidgetSheetViewControllerDidCancel:(id)a3;
- (void)addWidgetSheetViewControllerDidDisappear:(id)a3;
- (void)addWidgetSheetViewControllerWillAppear:(id)a3;
- (void)addWidgetSheetViewControllerWillDisappear:(id)a3;
- (void)bringWidgetIntroductionPopoverToFront;
- (void)dealloc;
- (void)didBeginDraggingWidgetIcon:(id)a3;
- (void)didContinueTransitionToState:(int64_t)a3 progress:(double)a4;
- (void)didEndDraggingWidgetIcon:(id)a3;
- (void)didEndTransitionFromState:(int64_t)a3 pageIndex:(int64_t)a4 toState:(int64_t)a5 pageIndex:(int64_t)a6 successfully:(BOOL)a7;
- (void)dismissSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissWidgetEditingViewControllerIfPresentedAnimated:(BOOL)a3;
- (void)enterPageManagementUIWithCompletionHandler:(id)a3;
- (void)enumerateCustomPageViewControllersUsingBlock:(id)a3;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateDisplayedIconViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumeratePageStateObserversUsingBlock:(id)a3;
- (void)enumerateWidgetAddSheetObserversUsingBlock:(id)a3;
- (void)exitPageManagementUIWithCompletionHandler:(id)a3;
- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4;
- (void)folderController:(id)a3 didEndEditingTitle:(id)a4;
- (void)folderView:(id)a3 currentPageIndexDidChange:(int64_t)a4;
- (void)folderView:(id)a3 currentPageIndexWillChange:(int64_t)a4;
- (void)folderView:(id)a3 didBeginEditingTitle:(id)a4;
- (void)folderView:(id)a3 didEndEditingTitle:(id)a4;
- (void)folderView:(id)a3 willAnimateScrollToPageIndex:(int64_t)a4;
- (void)folderViewDidEndScrolling:(id)a3;
- (void)folderViewDidScroll:(id)a3;
- (void)folderViewWillUpdatePageDuringScrolling:(id)a3;
- (void)pageTransitionHandle:(id)a3 endPageStateTransitionSuccessfully:(BOOL)a4;
- (void)pageTransitionHandle:(id)a3 updateCurrentPageStateTransitionToProgress:(double)a4;
- (void)performDefaultPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)performPageStateTransitionToState:(int64_t)a3 pageIndex:(int64_t)a4 reason:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)performPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)presentSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)presentWidgetEditingViewControllerFromViewController:(id)a3;
- (void)presentWidgetEditingViewControllerFromViewController:(id)a3 withAllowedSizeClasses:(id)a4 allowingNonStackableItems:(BOOL)a5;
- (void)rejectWidgetIntroduction;
- (void)removePageStateObserver:(id)a3;
- (void)removeWidgetAddSheetObserverForHandle:(id)a3;
- (void)rootFolderView:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5;
- (void)rootFolderView:(id)a3 didEndOverscrollOnFirstPageWithVelocity:(double)a4 translation:(double)a5;
- (void)rootFolderView:(id)a3 didEndOverscrollOnLastPageWithVelocity:(double)a4 translation:(double)a5;
- (void)rootFolderView:(id)a3 didOverscrollOnFirstPageByAmount:(double)a4;
- (void)rootFolderView:(id)a3 didOverscrollOnLastPageByAmount:(double)a4;
- (void)rootFolderView:(id)a3 wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:(CGPoint)a4;
- (void)rootFolderView:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5;
- (void)rootFolderView:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6;
- (void)rootFolderViewDidChangeSuppressesEditingStateForListViews:(id)a3;
- (void)rootFolderViewWantsIconTintViewControllerPresented:(id)a3;
- (void)rootFolderViewWantsSearchPresented:(id)a3;
- (void)rootFolderViewWantsToEndEditing:(id)a3;
- (void)rootFolderViewWantsWidgetEditingViewControllerPresented:(id)a3;
- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3;
- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4;
- (void)searchGesture:(id)a3 completedShowing:(BOOL)a4;
- (void)searchGesture:(id)a3 resetAnimated:(BOOL)a4;
- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4;
- (void)setAccessoryViewControllerDelegate:(id)a3;
- (void)setAddSheetViewController:(id)a3;
- (void)setAllowsAutoscrollToLeadingCustomView:(BOOL)a3;
- (void)setCurrentTransitionHandle:(id)a3;
- (void)setDockEdge:(unint64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFolderDelegate:(id)a3;
- (void)setHiddenListCountWhenPageManagementPresented:(unint64_t)a3;
- (void)setIdleText:(id)a3;
- (void)setImplicitScrollTransition:(id)a3;
- (void)setLeadingCustomViewPageHidden:(BOOL)a3;
- (void)setLeadingCustomViewPageHidden:(BOOL)a3 atIndex:(unint64_t)a4;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setManagesStatusBarWidth:(BOOL)a3;
- (void)setOccludedByOverlay:(BOOL)a3;
- (void)setPageState:(int64_t)a3;
- (void)setParallaxDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setPresentationSource:(unint64_t)a3;
- (void)setPullDownSearchViewController:(id)a3;
- (void)setRecentsDocumentExtensionProvider:(id)a3;
- (void)setSearchGesture:(id)a3;
- (void)setSearchGestureIconViewTouchCancellationAssertion:(id)a3;
- (void)setSearchGestureTransition:(id)a3;
- (void)setStackConfigurationViewController:(id)a3;
- (void)setSuppressesEditingStateForListView:(BOOL)a3;
- (void)setSuppressesExtraEditingButtons:(BOOL)a3;
- (void)setTitledButtonsAlpha:(double)a3;
- (void)setTodayViewPageHidden:(BOOL)a3;
- (void)stackConfigurationInteraction:(id)a3 isConsumingDropSession:(id)a4;
- (void)stackConfigurationInteraction:(id)a3 noteDidRemoveSuggestedWidgetIcon:(id)a4;
- (void)stackConfigurationInteraction:(id)a3 requestsPresentAddWidgetSheetFromPresenter:(id)a4;
- (void)stackConfigurationInteractionWillAnimateWidgetInsertion:(id)a3;
- (void)stackConfigurationViewControllerDidAppear:(id)a3;
- (void)stackConfigurationViewControllerDidDisappear:(id)a3;
- (void)stackConfigurationViewControllerWillAppear:(id)a3;
- (void)transitionDidFinish:(id)a3;
- (void)transitionWillBegin:(id)a3;
- (void)transitionWillFinish:(id)a3;
- (void)transitionWillReverse:(id)a3;
- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3;
- (void)updatePresentedWidgetEditingViewController;
- (void)updatePronouncedContainerViewVisibilityIfPossible:(BOOL)a3 vertical:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginTransitionToState:(int64_t)a3 pageIndex:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)willEndTransitionToState:(int64_t)a3 successfully:(BOOL)a4;
@end

@implementation SBRootFolderController

- (BOOL)isPresentingIconLocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() iconLocation];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) != 0
    || [(SBFolderController *)self hasDock]
    && ![(SBRootFolderController *)self isDockExternal]
    && ([(SBRootFolderController *)self dockListView],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 iconLocation],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:v4],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = [(SBFolderController *)self iconListViews];
    uint64_t v7 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v11);
          }
          v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) iconLocation];
          char v15 = [v4 isEqualToString:v14];

          if (v15)
          {
            LOBYTE(v7) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v7 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  return v7;
}

+ (id)iconLocation
{
  return @"SBIconLocationRoot";
}

- (id)dockListView
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  v3 = [v2 dockView];
  id v4 = [v3 dockListView];

  return v4;
}

uint64_t __76__SBRootFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__SBRootFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isDockExternal
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 isDockExternal];

  return v3;
}

- (BOOL)isPullDownSearchVisibleOrTransitioning
{
  if ([(SBRootFolderController *)self isPullDownSearchVisible]) {
    return 1;
  }
  return [(SBRootFolderController *)self isPullDownSearchTransitioning];
}

- (BOOL)isPullDownSearchVisible
{
  BOOL v3 = ![(SBRootFolderController *)self isTransitioningPageState]
    && [(SBRootFolderController *)self pageState] == 1;
  id v4 = [(SBRootFolderController *)self searchPresenter];
  v5 = v4;
  if (v4 && ![v4 presentationState]) {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isOnLeadingCustomPage
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  BOOL v4 = SBRootFolderPageStateIsOnLeadingCustomPage([(SBRootFolderController *)self pageState]);
  if (!v3 || !v4) {
    return !v3 && v4;
  }
  uint64_t v5 = [(SBRootFolderController *)self destinationPageState];
  return SBRootFolderPageStateIsOnLeadingCustomPage(v5);
}

- (BOOL)isTrailingCustomViewVisibleOrTransitionDestination
{
  if ([(SBRootFolderController *)self isTransitioningPageState]) {
    int64_t v3 = [(SBRootFolderController *)self destinationPageState];
  }
  else {
    int64_t v3 = [(SBRootFolderController *)self pageState];
  }
  return v3 == 4;
}

- (BOOL)isTransitioningPageState
{
  v2 = [(SBRootFolderController *)self currentTransitionHandle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_SBRootFolderPageTransitionHandle)currentTransitionHandle
{
  return self->_currentTransitionHandle;
}

- (int64_t)pageState
{
  return self->_pageState;
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(SBRootFolderController *)self dockListView];
  v11 = [v10 iconLocation];
  if (!v11
    || ![v9 isEqualToString:v11]
    || [(SBRootFolderController *)self isDockExternal]
    || (a5 & 8) != 0 && ![(SBRootFolderController *)self isDockVisible]
    || ([v10 displayedIconViewForIcon:v8], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBRootFolderController;
    uint64_t v12 = [(SBFolderController *)&v14 iconViewForIcon:v8 location:v9 options:a5];
  }

  return v12;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v9 enumerateDisplayedIconViewsUsingBlock:v4];
  uint64_t v5 = [(SBRootFolderController *)self dockListView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBRootFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AACE80;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIconViewsUsingBlock:v7];
}

- (void)enumerateDisplayedIconViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v11 enumerateDisplayedIconViewsWithOptions:a3 usingBlock:v6];
  uint64_t v7 = [(SBRootFolderController *)self dockListView];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBRootFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E6AACE80;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateIconViewsUsingBlock:v9];
}

- (BOOL)isDockVisible
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 isDockVisible];

  return v3;
}

- (NSSet)nonDockPresentedIconLocations
{
  v2 = [(SBRootFolderController *)self presentedIconLocations];
  char v3 = (void *)[v2 mutableCopy];

  id v4 = [(id)objc_opt_class() dockIconLocation];
  [v3 removeObject:v4];

  return (NSSet *)v3;
}

- (NSSet)presentedIconLocations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(id)objc_opt_class() iconLocation];
  uint64_t v5 = [v3 setWithObject:v4];

  id v6 = [(SBRootFolderController *)self dockListView];
  uint64_t v7 = [v6 iconLocation];

  if ([(SBFolderController *)self hasDock]
    && ![(SBRootFolderController *)self isDockExternal]
    && v7)
  {
    [v5 addObject:v7];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(SBFolderController *)self iconListViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) iconLocation];
        [v5 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (NSSet *)v5;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBRootFolderController *)self dockListView];
  uint64_t v9 = [v8 iconLocation];
  if (!v9
    || ![v7 isEqualToString:v9]
    || [(SBRootFolderController *)self isDockExternal]
    || ([v8 displayedIconViewForIcon:v6], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRootFolderController;
    uint64_t v10 = [(SBFolderController *)&v12 iconViewForIcon:v6 location:v7];
  }

  return v10;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  uint64_t v9 = [(SBRootFolderController *)self dockListView];
  uint64_t v10 = [v9 iconLocation];
  if (v10
    && [v7 isEqualToString:v10]
    && ![(SBRootFolderController *)self isDockExternal])
  {
    v13 = [v8 dock];
    char v12 = [v13 directlyContainsIcon:v6];
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v11 = [(SBFolderController *)self iconListViewIndexForPageIndex:[(SBFolderController *)self currentPageIndex]];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [(SBFolderController *)self iconListViewAtIndex:v11];
    objc_super v14 = [v13 model];
    long long v15 = [v13 iconLocation];
    if ([v7 isEqualToString:v15]) {
      char v12 = [v14 directlyContainsIcon:v6];
    }
    else {
      char v12 = 0;
    }

    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

+ (NSString)dockIconLocation
{
  v2 = (void *)[a1 _contentViewClass];
  return (NSString *)[v2 dockIconLocation];
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (double)dockHeight
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  [v2 dockHeight];
  double v4 = v3;

  return v4;
}

- (id)viewControllersForPageIndex:(int64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[SBRootFolderController customViewControllerForPageIndex:](self, "customViewControllerForPageIndex:");
  id v6 = (void *)v5;
  if (v5)
  {
    v15[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    id v7 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)SBRootFolderController;
  id v8 = [(SBFolderController *)&v14 viewControllersForPageIndex:a3];
  uint64_t v9 = v8;
  if (v8) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!v8) {
      goto LABEL_12;
    }
    id v11 = v8;
  }
  else
  {
    id v11 = [v8 arrayByAddingObjectsFromArray:v7];
  }
  id v12 = v11;

  id v7 = v12;
LABEL_12:

  return v7;
}

- (int64_t)trailingCustomViewPageIndex
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  int64_t v3 = [v2 trailingCustomViewPageIndex];

  return v3;
}

- (int64_t)leadingCustomViewPageIndex
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  int64_t v3 = [v2 leadingCustomViewPageIndex];

  return v3;
}

- (BOOL)isPageManagementUIVisible
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 isPageManagementUIVisible];

  return v3;
}

- (id)iconLocationForListsWithNonDefaultSizedIconsForRootFolderView:(id)a3
{
  double v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconLocationForListsWithNonDefaultSizedIconsForRootFolderController:self];
  }
  else {
  uint64_t v5 = [(id)objc_opt_class() iconLocation];
  }

  return v5;
}

- (void)bringWidgetIntroductionPopoverToFront
{
  if ([(SBRootFolderController *)self isDisplayingWidgetIntroductionOnPage:[(SBFolderController *)self firstIconPageIndex]])
  {
    id v3 = [(SBFolderController *)self currentIconListView];
    [v3 bringWidgetIntroductionPopoverToFront];
  }
}

- (BOOL)isDisplayingWidgetIntroductionOnPage:(int64_t)a3
{
  unint64_t v4 = [(SBFolderController *)self iconListViewIndexForPageIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v6 = [(SBFolderController *)self iconListViewAtIndex:v4];
  char v7 = [v6 isDisplayingWidgetIntroduction];

  return v7;
}

- (void)setParallaxDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBRootFolderController *)self rootFolderView];
  [v7 _setParallaxDisabled:v4 forReason:v6];
}

- (BOOL)isLeadingCustomViewVisibleOrTransitionDestination
{
  if ([(SBRootFolderController *)self isTransitioningPageState]) {
    int64_t v3 = [(SBRootFolderController *)self destinationPageState];
  }
  else {
    int64_t v3 = [(SBRootFolderController *)self pageState];
  }
  return v3 == 2;
}

- (void)transitionWillFinish:(id)a3
{
  BOOL v4 = (SBViewControllerTransitionContext *)a3;
  v26.receiver = self;
  v26.super_class = (Class)SBRootFolderController;
  [(SBNestingViewController *)&v26 transitionWillFinish:v4];
  if (self->_currentTransitionContext == v4)
  {
    uint64_t v5 = [(SBViewControllerTransitionContext *)v4 userInfo];
    id v6 = self;
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (!v8) {
      goto LABEL_31;
    }
    objc_opt_class();
    uint64_t v9 = [(SBViewControllerTransitionContext *)v4 animator];
    BOOL v10 = SBFSafeCast();

    uint64_t v11 = [v8 destinationPageState];
    uint64_t v12 = [v8 sourcePageState];
    BOOL v13 = [(SBViewControllerTransitionContext *)v4 transitionWasCancelled];
    int v14 = [v10 isPresenting];
    long long v15 = (void *)MEMORY[0x1E4FB30C8];
    if (!v14) {
      long long v15 = (void *)MEMORY[0x1E4FB30B8];
    }
    long long v16 = [(SBViewControllerTransitionContext *)v4 viewControllerForKey:*v15];
    long long v17 = [(SBRootFolderController *)self viewControllerForPageState:v12];
    long long v18 = [(SBRootFolderController *)self viewControllerForPageState:v11];
    if (v13)
    {
      [v16 cancelBeginAppearanceTransition];
      if (v17 && v17 != v16) {
        [v17 cancelBeginAppearanceTransition];
      }
      if (v18 && v18 != v16) {
        [v18 cancelBeginAppearanceTransition];
      }
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    if (v11 == 2)
    {
      long long v19 = [(SBFolderController *)self folderDelegate];
      if (objc_opt_respondsToSelector())
      {
        [v19 contentOverlayInsetsFromParentIfAvailableForFolderController:self];
      }
      else
      {
        double v20 = *MEMORY[0x1E4FB2848];
        double v21 = *(double *)(MEMORY[0x1E4FB2848] + 8);
        double v22 = *(double *)(MEMORY[0x1E4FB2848] + 16);
        double v23 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      }
      -[SBRootFolderController _setContentOverlayInsets:](self, "_setContentOverlayInsets:", v20, v21, v22, v23);
      [v16 _updateContentOverlayInsetsFromParentIfNecessary];

      [v16 endAppearanceTransition];
    }
    else
    {
      [v16 endAppearanceTransition];
      if (v11 == 1)
      {
        char v24 = SBHIsSpotlightFloatingWindowEnabled();
        goto LABEL_23;
      }
    }
    char v24 = 0;
LABEL_23:
    if (v17 && v17 != v16 && (v24 & 1) == 0) {
      [v17 endAppearanceTransition];
    }
    if (v18 && v18 != v16) {
      [v18 endAppearanceTransition];
    }
    goto LABEL_30;
  }
LABEL_32:
  v25 = [(SBRootFolderController *)self accessoryViewControllerDelegate];
  [v25 rootFolderController:self transitionWillFinish:v4];
}

- (void)transitionWillBegin:(id)a3
{
  BOOL v4 = (SBViewControllerTransitionContext *)a3;
  v28.receiver = self;
  v28.super_class = (Class)SBRootFolderController;
  [(SBNestingViewController *)&v28 transitionWillBegin:v4];
  if (self->_currentTransitionContext == v4)
  {
    objc_opt_class();
    id v6 = [(SBViewControllerTransitionContext *)v4 animator];
    SBFSafeCast();
    id v7 = (SBFramewiseInteractiveTransitionAnimator *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    id v8 = [(SBViewControllerTransitionContext *)v4 interactor];
    SBFSafeCast();
    uint64_t v9 = (SBPercentPassthroughInteractiveTransition *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = [(SBFramewiseInteractiveTransitionAnimator *)v7 isPresenting];
    uint64_t v11 = self;
    uint64_t v12 = [(SBViewControllerTransitionContext *)v4 userInfo];
    uint64_t v5 = SBFSafeCast();

    uint64_t v13 = [v5 sourcePageState];
    uint64_t v14 = [v5 destinationPageState];
    long long v15 = (void *)MEMORY[0x1E4FB30C8];
    if (!v10) {
      long long v15 = (void *)MEMORY[0x1E4FB30B8];
    }
    long long v16 = [(SBViewControllerTransitionContext *)v4 viewControllerForKey:*v15];
    currentTransitionAnimator = self->_currentTransitionAnimator;
    self->_currentTransitionAnimator = v7;
    long long v18 = v7;

    currentTransitionInteractor = self->_currentTransitionInteractor;
    self->_currentTransitionInteractor = v9;

    uint64_t v20 = [(SBViewControllerTransitionContext *)v4 isAnimated];
    [v16 beginAppearanceTransition:v10 animated:v20];
    if (v14 == 1) {
      char v21 = SBHIsSpotlightFloatingWindowEnabled();
    }
    else {
      char v21 = 0;
    }
    double v22 = [(SBRootFolderController *)self viewControllerForPageState:v13];
    double v23 = v22;
    if (v22 && v22 != v16 && (v21 & 1) == 0) {
      [v22 beginAppearanceTransition:0 animated:v20];
    }
    char v24 = [(SBRootFolderController *)self viewControllerForPageState:v14];
    v25 = v24;
    if (v24 && v24 != v16) {
      [v24 beginAppearanceTransition:1 animated:v20];
    }
  }
  else
  {
    uint64_t v5 = SBLogSpotlight();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "transitionContext is the same so not doing anything", v27, 2u);
    }
  }

  objc_super v26 = [(SBRootFolderController *)self accessoryViewControllerDelegate];
  [v26 rootFolderController:self transitionWillBegin:v4];
}

- (void)transitionDidFinish:(id)a3
{
  BOOL v4 = (SBViewControllerTransitionContext *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  [(SBNestingViewController *)&v9 transitionDidFinish:v4];
  if (self->_currentTransitionContext == v4)
  {
    [(SBViewControllerTransitionContext *)v4 setDelegate:0];
    [(SBFramewiseInteractiveTransitionAnimator *)self->_currentTransitionAnimator setDelegate:0];
    currentTransitionContext = self->_currentTransitionContext;
    self->_currentTransitionContext = 0;

    currentTransitionAnimator = self->_currentTransitionAnimator;
    self->_currentTransitionAnimator = 0;

    currentTransitionInteractor = self->_currentTransitionInteractor;
    self->_currentTransitionInteractor = 0;
  }
  id v8 = [(SBRootFolderController *)self accessoryViewControllerDelegate];
  [v8 rootFolderController:self transitionDidFinish:v4];
}

- (SBRootFolderControllerAccessoryViewControllerDelegate)accessoryViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryViewControllerDelegate);
  return (SBRootFolderControllerAccessoryViewControllerDelegate *)WeakRetained;
}

- (BOOL)isLeadingCustomViewSearchTransitioning
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3) {
    LOBYTE(v3) = [(SBRootFolderController *)self pageState] == 3
  }
              || [(SBRootFolderController *)self destinationPageState] == 3;
  return v3;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  if ([(SBFolderController *)&v9 isDisplayingIcon:v4]) {
    goto LABEL_4;
  }
  uint64_t v5 = [(SBRootFolderController *)self dockListView];
  if (![v5 containsIcon:v4])
  {

    goto LABEL_6;
  }
  BOOL v6 = [(SBRootFolderController *)self isDockVisible];

  if (!v6)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v12 viewDidDisappear:a3];
  id v4 = [(SBRootFolderController *)self rootFolderView];
  if ([(SBRootFolderController *)self isLeadingCustomViewSearchVisible])
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __43__SBRootFolderController_viewDidDisappear___block_invoke;
    objc_super v9 = &unk_1E6AACA90;
    id v10 = v4;
    uint64_t v11 = self;
    [(SBRootFolderController *)self dismissSpotlightAnimated:0 completionHandler:&v6];
  }
  else if ([(SBRootFolderController *)self isAnySearchVisibleOrTransitioning])
  {
    [(SBRootFolderController *)self dismissSpotlightAnimated:0 completionHandler:0];
  }
  objc_msgSend(v4, "updateIconListIndexAndVisibility:", 1, v6, v7, v8, v9);
  uint64_t v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 rootFolderControllerViewDidDisappear:self];
  }
}

- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  BOOL v7 = ((v4 & 1) == 0
     || ![(SBRootFolderController *)self isAnySearchVisibleOrTransitioning])
    && [(SBFolderController *)self isDisplayingIconView:v6];

  return v7;
}

- (BOOL)isAnySearchTransitioning
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    if (SBRootFolderPageStateIsSearch([(SBRootFolderController *)self pageState]))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      uint64_t v4 = [(SBRootFolderController *)self destinationPageState];
      LOBYTE(v3) = SBRootFolderPageStateIsSearch(v4);
    }
  }
  return v3;
}

- (id)_viewControllersToNotifyForViewObscuration
{
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderController;
  BOOL v3 = [(SBFolderController *)&v10 _viewControllersToNotifyForViewObscuration];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (SBRootFolderPageStateIsSearch([(SBRootFolderController *)self pageState])
    && ![(SBFolderController *)self isOverridingPageViewControllerAppearanceStateToRemainDisappeared])
  {
    uint64_t v5 = [(SBRootFolderController *)self pullDownSearchViewController];
    if (v5) {
      [v4 addObject:v5];
    }
  }
  id v6 = [(SBRootFolderController *)self searchPresenter];
  int v7 = [v6 isPresenting];

  if (v7)
  {
    id v8 = [(SBRootFolderController *)self searchPresentableViewController];
    if (v8) {
      [v4 addObject:v8];
    }
  }
  return v4;
}

- (BOOL)isAnySearchVisibleOrTransitioning
{
  if ([(SBRootFolderController *)self isAnySearchVisible]) {
    return 1;
  }
  return [(SBRootFolderController *)self isAnySearchTransitioning];
}

- (BOOL)isAnySearchVisible
{
  if ([(SBRootFolderController *)self isTransitioningPageState]) {
    return 0;
  }
  uint64_t v4 = [(SBRootFolderController *)self pageState];
  return SBRootFolderPageStateIsSearch(v4);
}

- (BOOL)isLeadingCustomViewSearchVisibleOrTransitioning
{
  if ([(SBRootFolderController *)self isLeadingCustomViewSearchVisible]) {
    return 1;
  }
  return [(SBRootFolderController *)self isLeadingCustomViewSearchTransitioning];
}

- (BOOL)isLeadingCustomViewSearchVisible
{
  return ![(SBRootFolderController *)self isTransitioningPageState]
      && [(SBRootFolderController *)self pageState] == 3;
}

- (void)folderViewWillUpdatePageDuringScrolling:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderController;
  id v4 = a3;
  [(SBFolderController *)&v8 folderViewWillUpdatePageDuringScrolling:v4];
  uint64_t v5 = objc_msgSend(v4, "scrollView", v8.receiver, v8.super_class);

  if ([(SBFolderController *)self userInterfaceLayoutDirection]) {
    uint64_t v6 = MEMORY[0x1E4F4F620];
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F4F628];
  }
  id v7 = [(SBRootFolderController *)self updateStateTransitionsDuringScrollingScrollView:v5 pageBounceComparator:v6];
}

- (void)folderViewDidScroll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v5 folderViewDidScroll:a3];
  id v4 = [(SBRootFolderController *)self implicitScrollTransition];
  if (v4
    && ![(SBFolderController *)self isScrolling]
    && [(SBRootFolderController *)self isTransitioningHorizontally])
  {
    [v4 endTransitionSuccessfully:1];
    [(SBRootFolderController *)self setImplicitScrollTransition:0];
  }
}

- (SBRootFolderPageTransition)implicitScrollTransition
{
  return self->_implicitScrollTransition;
}

- (void)folderView:(id)a3 currentPageIndexDidChange:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v13 folderView:v6 currentPageIndexDidChange:a4];
  id v7 = v6;
  uint64_t v8 = [v7 isOnLeadingCustomPage];
  objc_super v9 = [v7 scrollView];
  uint64_t v10 = [v9 isScrollAnimating];

  uint64_t v11 = [(SBRootFolderController *)self searchGesture];
  if ([(SBRootFolderController *)self isPullDownSearchVisibleOrTransitioning]) {
    [v11 resetAnimated:v10];
  }
  if ((([(SBRootFolderController *)self isTransitioningPageState] | v10) & 1) == 0
    && ![(SBFolderController *)self isScrolling]
    && v8 != [(SBRootFolderController *)self isLeadingCustomViewVisible])
  {
    if (v8) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [(SBRootFolderController *)self performPageStateTransitionToState:v12 reason:@"page index changed" animated:0 completionHandler:0];
  }
  [v11 setDisabled:v8 forReason:@"SBRootFolderShowingLeadingCustomViewReason"];
}

- (BOOL)isPullDownSearchTransitioning
{
  LODWORD(v3) = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    int64_t v3 = [(SBRootFolderController *)self pageState];
    if (v3 != 1) {
      LOBYTE(v3) = [(SBRootFolderController *)self destinationPageState] == 1;
    }
  }
  return v3;
}

- (void)folderViewDidEndScrolling:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v9 folderViewDidEndScrolling:v4];
  if ([(SBRootFolderController *)self isTransitioningHorizontally])
  {
    [v4 currentScrollOffset];
    -[SBRootFolderController pageStateTransitionSnapshotForScrollOffset:](self, "pageStateTransitionSnapshotForScrollOffset:");
    BOOL v5 = [(SBRootFolderController *)self destinationPageState] == 0;
    id v6 = [(SBRootFolderController *)self implicitScrollTransition];
    [v6 endTransitionSuccessfully:v5];
    [(SBRootFolderController *)self setImplicitScrollTransition:0];
  }
  uint64_t v7 = [v4 isOnLeadingCustomPage];
  uint64_t v8 = [(SBRootFolderController *)self searchGesture];
  [v8 setDisabled:v7 forReason:@"SBRootFolderShowingLeadingCustomViewReason"];

  if ([(SBFolderController *)self isEditing]) {
    [(SBRootFolderController *)self updateExtraButtonVisibilityAnimated:1];
  }
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (BOOL)isTransitioningBetweenPageStateVerticalGroups
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    uint64_t v4 = [(SBRootFolderController *)self pageState];
    uint64_t v5 = [(SBRootFolderController *)self destinationPageState];
    uint64_t v6 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(v4);
    LOBYTE(v3) = v6 != SBRootFolderPageStateVerticalGroupForRootFolderPageState(v5);
  }
  return v3;
}

- (id)updateStateTransitionsDuringScrollingScrollView:(id)a3 pageBounceComparator:(void *)a4
{
  uint64_t v6 = [(SBRootFolderController *)self rootFolderView];
  [v6 scrollOffsetForPageIndexCalculation];
  double v8 = v7;
  long long v17 = 0u;
  long long v18 = 0u;
  [(SBRootFolderController *)self pageStateTransitionSnapshotForScrollOffset:v7];
  if ([(SBRootFolderController *)self isTransitioningPageState]
    && [(SBRootFolderController *)self destinationPageState] != *((void *)&v17 + 1))
  {
    objc_super v9 = [(SBRootFolderController *)self implicitScrollTransition];
    objc_msgSend(v9, "endTransitionSuccessfully:", v17 == -[SBRootFolderController destinationPageState](self, "destinationPageState"));
  }
  if ([(SBRootFolderController *)self isTransitioningPageState])
  {
    uint64_t v10 = [(SBRootFolderController *)self implicitScrollTransition];
    [v10 setTransitionProgress:*((double *)&v18 + 1)];

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = -[SBRootFolderController beginPageStateTransitionToState:pageIndex:reason:animated:interactive:](self, "beginPageStateTransitionToState:pageIndex:reason:animated:interactive:", *((void *)&v17 + 1), (void)v18 + [v6 minimumPageIndex], @"implicit scroll", 1, 1);
    [v11 setTransitionProgress:*((double *)&v18 + 1)];
    [(SBRootFolderController *)self setImplicitScrollTransition:v11];
  }
  uint64_t v12 = [(SBRootFolderController *)self leadingCustomViewController];

  if (v12)
  {
    uint64_t v13 = [v6 leadingCustomViewPageScrollOffset];
    uint64_t v15 = ((uint64_t (*)(uint64_t, double, double))a4)(v13, v8, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v6 setLeadingCustomViewBouncing:v15];

  return v11;
}

- (SBHRootFolderCustomViewPresenting)leadingCustomViewController
{
  v2 = [(SBRootFolderController *)self leadingCustomViewControllers];
  BOOL v3 = [v2 lastObject];

  return (SBHRootFolderCustomViewPresenting *)v3;
}

- (SBRootFolderPageStateTransitionSnapshot)pageStateTransitionSnapshotForScrollOffset:(SEL)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v7 = [(SBRootFolderController *)self rootFolderView];
  uint64_t v8 = [v7 pageCount];
  size_t v9 = [v7 extraPageCountDuringScrolling] + v8;
  int64_t v26 = [(SBFolderController *)self userInterfaceLayoutDirection];
  [v7 _pageWidthOrHeight];
  double v11 = v10;
  [v7 _pageSpacing];
  double v13 = v12;
  int64_t v25 = [(SBRootFolderController *)self pageState];
  int64_t v23 = [(SBFolderController *)self currentPageIndex];
  int64_t v14 = [(SBFolderController *)self minimumPageIndex];
  unsigned int v24 = [v7 userInterfaceLayoutDirectionAwareScrollingDirection];
  if (v9 >= 0x14)
  {
    uint64_t v15 = (char *)malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
    long long v16 = v15;
  }
  else
  {
    uint64_t v15 = 0;
    long long v16 = &v27;
  }
  uint64_t v17 = [v7 leadingCustomPageCount];
  uint64_t v18 = [v7 trailingCustomPageCount];
  uint64_t v19 = v17 + v18;
  if (v17) {
    memset_pattern16(v16, &unk_1D81E4C30, 8 * v17);
  }
  if (v9 != v19)
  {
    if (v9 - v19 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v9 - v19;
    }
    bzero(&v16[8 * v17], 8 * v20);
    v17 += v20;
  }
  if (v18) {
    memset_pattern16(&v16[8 * v17], &unk_1D81E4C40, 8 * v18);
  }
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  char v21 = objc_opt_class();
  if (v21)
  {
    [v21 pageStateTransitionSnapshotForScrollOffset:v16 pageWidth:v9 pageSpacing:v26 pages:v25 pageCount:v23 - v14 userInterfaceLayoutDirection:v24 currentPageState:a4 currentPageOffset:v11 scrollingDirection:v13];
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  free(v15);

  return result;
}

- (SBHRootFolderCustomViewPresenting)trailingCustomViewController
{
  v2 = [(SBRootFolderController *)self trailingCustomViewControllers];
  BOOL v3 = [v2 firstObject];

  return (SBHRootFolderCustomViewPresenting *)v3;
}

- (BOOL)isLeadingCustomViewPageHidden
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 isLeadingCustomViewPageHidden];

  return v3;
}

- (void)folderView:(id)a3 currentPageIndexWillChange:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v6 folderView:a3 currentPageIndexWillChange:a4];
  if ([(SBRootFolderController *)self isTransitioningPageState])
  {
    if (![(SBRootFolderController *)self isTransitioningHorizontally])
    {
      uint64_t v5 = [(SBRootFolderController *)self currentTransitionHandle];
      [v5 endTransitionSuccessfully:0];
    }
  }
}

- (void)rootFolderViewDidChangeSuppressesEditingStateForListViews:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "rootFolderController:setSuppressesEditingStateForExternalDockListViews:", self, objc_msgSend(v5, "suppressesEditingStateForListViews"));
  }
}

- (SBRootFolderController)initWithConfiguration:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SBRootFolderController;
  id v5 = [(SBFolderController *)&v50 initWithConfiguration:v4];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_pageState = -1;
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__reduceTransparencyChanged name:*MEMORY[0x1E4FB24A8] object:0];
    [v7 addObserver:v6 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
    uint64_t v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = v4;
      v6->_showsDoneButtonWhileEditing = [v10 showsDoneButtonWhileEditing];
      v6->_showsAddWidgetButtonWhileEditingAllowedOrientations = [v10 showsAddWidgetButtonWhileEditingAllowedOrientations];
      uint64_t v11 = [v10 searchPresenter];
      searchPresenter = v6->_searchPresenter;
      v6->_searchPresenter = (SBHSearchPresenting *)v11;

      uint64_t v13 = [v10 searchPresentableViewController];
      searchPresentableViewController = v6->_searchPresentableViewController;
      v6->_searchPresentableViewController = (SBHSearchPresentable *)v13;

      if (!v6->_searchPresenter)
      {
        uint64_t v15 = [v10 pullDownSearchViewController];
        pullDownSearchViewController = v6->_pullDownSearchViewController;
        v6->_pullDownSearchViewController = (UIViewController *)v15;
      }
      if (v6->_searchPresentableViewController)
      {
        -[SBRootFolderController addChildViewController:](v6, "addChildViewController:");
        [(SBHSearchPresentable *)v6->_searchPresentableViewController didMoveToParentViewController:v6];
      }
      if (v6->_pullDownSearchViewController)
      {
        -[SBRootFolderController addChildViewController:](v6, "addChildViewController:");
        [(UIViewController *)v6->_pullDownSearchViewController didMoveToParentViewController:v6];
      }
      uint64_t v17 = [SBSearchGesture alloc];
      uint64_t v18 = [v10 searchPresenter];
      uint64_t v19 = [(SBSearchGesture *)v17 initWithSearchPresenter:v18];
      searchGesture = v6->_searchGesture;
      v6->_searchGesture = (SBSearchGesture *)v19;

      [(SBSearchGesture *)v6->_searchGesture addObserver:v6];
      char v21 = [v10 leadingCustomViewControllers];
      uint64_t v22 = [v21 copy];
      leadingCustomViewControllers = v6->_leadingCustomViewControllers;
      v6->_leadingCustomViewControllers = (NSArray *)v22;

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      unsigned int v24 = v6->_leadingCustomViewControllers;
      uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v47 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            [(SBRootFolderController *)v6 addChildViewController:v29];
            [v29 didMoveToParentViewController:v6];
          }
          uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v26);
      }

      v30 = [v10 trailingCustomViewControllers];
      uint64_t v31 = [v30 copy];
      trailingCustomViewControllers = v6->_trailingCustomViewControllers;
      v6->_trailingCustomViewControllers = (NSArray *)v31;

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v33 = v6->_trailingCustomViewControllers;
      uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v43 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            -[SBRootFolderController addChildViewController:](v6, "addChildViewController:", v38, (void)v42);
            [v38 didMoveToParentViewController:v6];
            if (SBHIsHomeButtonDevice()) {
              objc_msgSend(v38, "setAdditionalSafeAreaInsets:", 20.0, 0.0, 0.0, 0.0);
            }
          }
          uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v35);
      }

      v39 = (SBHomeScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60A0]);
      homeScreenDefaults = v6->_homeScreenDefaults;
      v6->_homeScreenDefaults = v39;
    }
    -[SBFolderController setOpen:](v6, "setOpen:", 1, (void)v42);
  }
  return v6;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v4 dealloc];
}

+ (Class)configurationClass
{
  return (Class)self;
}

- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4
{
  id v6 = a4;
  id v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderController:self didBeginEditingTitle:v6];
  }
}

- (void)folderController:(id)a3 didEndEditingTitle:(id)a4
{
  id v6 = a4;
  id v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderController:self didEndEditingTitle:v6];
  }
}

- (void)viewDidLoad
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v16 viewDidLoad];
  char v3 = [(SBRootFolderController *)self rootFolderView];
  if ([(SBRootFolderController *)self pageState] == -1)
  {
    int64_t v4 = [(SBFolderController *)self currentPageIndex];
    if (v4 == [(SBRootFolderController *)self leadingCustomViewPageIndex])
    {
      [(SBRootFolderController *)self setPageState:2];
      [(SBRootFolderController *)self _leadingCustomViewVisibilityProgress];
      objc_msgSend(v3, "setLeadingCustomViewVisibilityProgress:");
    }
    else if (v4 == [(SBRootFolderController *)self trailingCustomViewPageIndex])
    {
      [(SBRootFolderController *)self setPageState:4];
      [(SBRootFolderController *)self _trailingCustomViewVisibilityProgress];
      objc_msgSend(v3, "setTrailingCustomViewVisibilityProgress:");
    }
    else
    {
      [(SBRootFolderController *)self setPageState:0];
    }
  }
  id v5 = [(SBRootFolderController *)self trailingCustomViewControllers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v3 trailingCustomSearchDimmingView];
          [v10 setSearchDimmingView:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  [(SBRootFolderController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(SBRootFolderController *)self _updateAddWidgetSheetIconCache];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderControllerViewWillAppear:self];
  }
}

uint64_t __43__SBRootFolderController_viewDidDisappear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentPageIndex:animated:", objc_msgSend(*(id *)(a1 + 40), "defaultPageIndex"), 0);
  v2 = *(void **)(a1 + 32);
  return [v2 updateIconListIndexAndVisibility:1];
}

- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  -[SBFolderController viewWillTransitionToSize:forOperation:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_forOperation_withTransitionCoordinator_, a4, a5, a3.width, a3.height);
}

- (id)_makeContentViewWithConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderController;
  int64_t v4 = [(SBFolderController *)&v7 _makeContentViewWithConfiguration:a3];
  objc_super v5 = [(SBRootFolderController *)self searchGesture];
  [v4 setSearchGesture:v5];

  return v4;
}

- (BOOL)closesAfterDragExits
{
  return 0;
}

- (BOOL)canAcceptFolderIconDrags
{
  return 1;
}

- (BOOL)disablesScrollingWhileIconDragIsDropping
{
  return 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(SBFolderController *)self isEditing];
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v9 setEditing:v5 animated:v4];
  if (v7 != v5)
  {
    [(SBRootFolderController *)self updateExtraButtonVisibilityAnimated:v4];
    uint64_t v8 = [(SBRootFolderController *)self _addWidgetSheetConfigurationManager];
    if (v5)
    {
      objc_msgSend(v8, "fetchGalleryContentForHomeScreenEditingWithGridSize:addWidgetSheetViewController:", -[SBRootFolderController _currentHomeScreenEditingGridSize](self, "_currentHomeScreenEditingGridSize"), self->_addSheetViewController);
    }
    else
    {
      [(SBRootFolderController *)self _internalDismissWidgetAddSheet:v4 clearAddSheetViewController:1 notifyObservers:1];
      [v8 setEditingSuggestedWidgetItems:0];
    }
  }
}

- (void)_updateFolderRequiredTrailingEmptyListCount
{
  BOOL v3 = [(SBFolderController *)self isEditing];
  int64_t v4 = [(SBFolderController *)self currentPageIndex];
  int64_t v5 = [(SBRootFolderController *)self trailingCustomViewPageIndex];
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v6 _updateFolderRequiredTrailingEmptyListCount];
  if (v3 && v4 == v5) {
    [(SBFolderController *)self setCurrentPageIndex:[(SBRootFolderController *)self trailingCustomViewPageIndex]];
  }
}

- (void)_refreshGalleryContentForHomeScreenEditingIfNecessary
{
  if ([(SBFolderController *)self isEditing])
  {
    id v3 = [(SBRootFolderController *)self _addWidgetSheetConfigurationManager];
    [v3 setEditingSuggestedWidgetItems:0];
    objc_msgSend(v3, "fetchGalleryContentForHomeScreenEditingWithGridSize:addWidgetSheetViewController:", -[SBRootFolderController _currentHomeScreenEditingGridSize](self, "_currentHomeScreenEditingGridSize"), self->_addSheetViewController);
  }
}

- (unint64_t)_defaultEditingSuggestedWidgetItemsFamilyMask
{
  if ([(SBRootFolderController *)self _addWidgetSheetStyle] == 1) {
    return 30;
  }
  else {
    return 14;
  }
}

- (unint64_t)_currentHomeScreenEditingGridSize
{
  if ([(SBRootFolderController *)self _addWidgetSheetStyle] != 1) {
    return 0;
  }
  if ([(SBFolderController *)self isRotating]) {
    uint64_t v3 = [(SBRootFolderController *)self _rotatingToInterfaceOrientation];
  }
  else {
    uint64_t v3 = [(SBFolderController *)self orientation];
  }
  if ((unint64_t)(v3 - 3) >= 2) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)_stackConfigurationGridSize
{
  return 2 * ([(SBRootFolderController *)self _addWidgetSheetStyle] == 1);
}

- (void)setSuppressesExtraEditingButtons:(BOOL)a3
{
  if (self->_suppressesExtraEditingButtons != a3)
  {
    self->_suppressesExtraEditingButtons = a3;
    [(SBRootFolderController *)self updateExtraButtonVisibilityAnimated:0];
  }
}

- (id)showDoneButtonForReason:(id)a3
{
  id v4 = a3;
  int64_t v5 = [[SBRootFolderControllerShowDoneButtonAssertion alloc] initWithFolderController:self reason:v4];

  showDoneButtonAssertions = self->_showDoneButtonAssertions;
  if (!showDoneButtonAssertions)
  {
    BOOL v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v8 = self->_showDoneButtonAssertions;
    self->_showDoneButtonAssertions = v7;

    showDoneButtonAssertions = self->_showDoneButtonAssertions;
  }
  [(NSHashTable *)showDoneButtonAssertions addObject:v5];
  [(SBRootFolderController *)self updateExtraButtonVisibilityAnimated:1];
  return v5;
}

- (void)_removeShowDoneButtonAssertion:(id)a3
{
  [(NSHashTable *)self->_showDoneButtonAssertions removeObject:a3];
  [(SBRootFolderController *)self updateExtraButtonVisibilityAnimated:1];
}

- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_super v6 = [(SBRootFolderController *)self rootFolderView];
  uint64_t v7 = [(SBFolderController *)self orientation];
  BOOL v8 = [(SBRootFolderController *)self showsDoneButtonWhileEditing];
  [(SBRootFolderController *)self showsAddWidgetButtonWhileEditingAllowedOrientations];
  int v9 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
  BOOL v10 = [(SBFolderController *)self isEditing];
  int v21 = v9;
  if (v10 && v8)
  {
    BOOL suppressesExtraEditingButtons = self->_suppressesExtraEditingButtons;
    BOOL v12 = !self->_suppressesExtraEditingButtons;
    if (v9)
    {
LABEL_4:
      LODWORD(v22) = 1;
LABEL_5:
      BOOL v13 = !suppressesExtraEditingButtons;
      HIDWORD(v22) = 1;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v22 = 1;
    BOOL v13 = 0;
LABEL_9:
    if (![(SBRootFolderController *)self isLeadingCustomViewVisibleOrTransitionDestination])goto LABEL_20; {
    if (v12)
    }
    {
      BOOL v12 = [(SBRootFolderController *)self _leadingCustomViewShouldShowDoneButtonWhenEditing];
      if (!v13) {
        goto LABEL_19;
      }
    }
    else if (!v13)
    {
      BOOL v13 = v12;
      goto LABEL_20;
    }
    BOOL v13 = [(SBRootFolderController *)self _leadingCustomViewShouldShowAddWidgetButtonWhenEditing];
    goto LABEL_20;
  }
  NSUInteger v14 = [(NSHashTable *)self->_showDoneButtonAssertions count];
  int v15 = v10 & v9;
  if (v14)
  {
    BOOL suppressesExtraEditingButtons = self->_suppressesExtraEditingButtons;
    BOOL v12 = !self->_suppressesExtraEditingButtons;
    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  if (v15)
  {
    BOOL v12 = 0;
    LODWORD(v22) = 0;
    BOOL suppressesExtraEditingButtons = self->_suppressesExtraEditingButtons;
    goto LABEL_5;
  }
  [(SBRootFolderController *)self isLeadingCustomViewVisibleOrTransitionDestination];
  uint64_t v22 = 0;
  BOOL v12 = 0;
LABEL_19:
  BOOL v13 = 0;
LABEL_20:
  if ([(SBRootFolderController *)self isTrailingCustomViewVisibleOrTransitionDestination])
  {
    if (v12) {
      BOOL v12 = [(SBRootFolderController *)self _trailingCustomViewShouldShowDoneButtonWhenEditing];
    }
    if (v13) {
      BOOL v13 = [(SBRootFolderController *)self _trailingCustomViewShouldShowAddWidgetButtonWhenEditing];
    }
  }
  objc_super v16 = SBLogRootController();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = BOOL v17 = v3;
    uint64_t v19 = SBHStringFromUIInterfaceOrientation(v7);
    BOOL v20 = self->_suppressesExtraEditingButtons;
    *(_DWORD *)buf = 138414082;
    unsigned int v24 = v18;
    __int16 v25 = 1024;
    BOOL v26 = v12;
    __int16 v27 = 1024;
    BOOL v28 = v13;
    __int16 v29 = 2114;
    v30 = v19;
    __int16 v31 = 1024;
    BOOL v32 = v8;
    __int16 v33 = 1024;
    int v34 = v21;
    __int16 v35 = 1024;
    BOOL v36 = v20;
    __int16 v37 = 1024;
    BOOL v38 = v10;
    _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "(%@) Updating extra button visibility: reallyShowDoneButton='%{BOOL}u', reallyShowAddButton='%{BOOL}u' — orientation='%{public}@', needsEditingDoneButton='%{BOOL}u', needsEditingAddWidgetButton='%{BOOL}u', suppressesExtraEditingButtons='%{BOOL}u', editing='%{BOOL}u'", buf, 0x3Au);

    BOOL v3 = v17;
  }

  [v6 setShowsDoneButton:v12 animated:v12 & v3];
  [v6 setShowsAddWidgetButton:v13 animated:v13 & v3];
  if ((v22 | HIDWORD(v22)) == 1)
  {
    [(SBFolderController *)self _hideStatusBarForReason:@"SBRootFolderEditingReason" animated:0];
    [(SBFolderController *)self _hideFakeStatusBarForReason:@"SBRootFolderEditingReason" animated:0];
  }
  else
  {
    [(SBFolderController *)self _unhideStatusBarForReason:@"SBRootFolderEditingReason"];
    [(SBFolderController *)self _unhideFakeStatusBarForReason:@"SBRootFolderEditingReason" animated:0];
  }
}

- (BOOL)_leadingCustomViewShouldShowDoneButtonWhenEditing
{
  v2 = [(SBRootFolderController *)self leadingCustomViewController];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldShowDoneButtonWhenEditing];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_trailingCustomViewShouldShowDoneButtonWhenEditing
{
  v2 = [(SBRootFolderController *)self trailingCustomViewController];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldShowDoneButtonWhenEditing];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)_leadingCustomViewShouldShowAddWidgetButtonWhenEditing
{
  v2 = [(SBRootFolderController *)self leadingCustomViewController];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldShowAddWidgetButtonWhenEditing];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_trailingCustomViewShouldShowAddWidgetButtonWhenEditing
{
  v2 = [(SBRootFolderController *)self trailingCustomViewController];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldShowAddWidgetButtonWhenEditing];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)enumerateCustomPageViewControllersUsingBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int64_t v5 = self->_leadingCustomViewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
      char v20 = 0;
      v4[2](v4, v10, &v20);
      if (v20) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int64_t v5 = self->_trailingCustomViewControllers;
    uint64_t v11 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
LABEL_11:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
        char v20 = 0;
        v4[2](v4, v15, &v20);
        if (v20) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
          if (v12) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v8 setLegibilitySettings:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SBRootFolderController_setLegibilitySettings___block_invoke;
  v6[3] = &unk_1E6AACE58;
  id v7 = v4;
  id v5 = v4;
  [(SBRootFolderController *)self enumerateCustomPageViewControllersUsingBlock:v6];
}

uint64_t __48__SBRootFolderController_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLegibilitySettings:*(void *)(a1 + 32)];
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderController;
  id v7 = a3;
  [(SBFolderController *)&v10 enumerateDisplayedIconViewsForIcon:v7 usingBlock:v6];
  objc_super v8 = [(SBRootFolderController *)self dockListView];
  uint64_t v9 = [v8 iconViewForIcon:v7];

  if (v9) {
    v6[2](v6, v9);
  }
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SBFolderController *)self listLayoutProvider];
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v10 setListLayoutProvider:v6 animated:v4];
  objc_super v8 = [(SBFolderController *)self listLayoutProvider];

  if (v7 != v8)
  {
    uint64_t v9 = [(SBRootFolderController *)self rootFolderView];
    [v9 setListLayoutProvider:v6 animated:v4];
  }
}

- (id)parentViewControllerForCustomIconImageViewControllerForIconView:(id)a3
{
  id v4 = a3;
  if ([(SBRootFolderController *)self isPageManagementUIVisible]
    && ![(SBRootFolderController *)self isPageManagementUITransitioningOutOfVisible])
  {
    id v5 = [(SBRootFolderController *)self rootFolderView];
    id v6 = [v5 specialLayoutManager];

    if (objc_opt_respondsToSelector())
    {
      id v7 = [v6 parentViewControllerForCustomIconImageViewControllerForIconView:v4];

      if (v7) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  id v7 = [(SBFolderController *)&v9 parentViewControllerForCustomIconImageViewControllerForIconView:v4];
LABEL_8:

  return v7;
}

- (unint64_t)_depth
{
  return 0;
}

- (void)setFolderDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  id v5 = [(SBFolderController *)&v9 folderDelegate];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolderController;
    [(SBFolderController *)&v8 setFolderDelegate:v4];
    id v6 = [(SBRootFolderController *)self viewIfLoaded];
    id v7 = [v6 window];

    if (v7) {
      [(SBRootFolderController *)self _updateAddWidgetSheetIconCache];
    }
  }
}

- (void)_updateAddWidgetSheetIconCache
{
  char v3 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 appIconImageCacheForRootFolderController:self];
    if (v4)
    {
      id v5 = [SBHMutableIconGridSizeClassSet alloc];
      id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
      id v7 = [(SBHIconGridSizeClassSet *)v5 initWithGridSizeClasses:v6];

      if ([(SBRootFolderController *)self _addWidgetSheetStyle] == 1) {
        [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassExtraLarge"];
      }
      uint64_t v13 = v7;
      objc_super v8 = [(SBRootFolderController *)self applicationWidgetCollectionsForEditingViewController:0 withAllowedSizeClasses:&v13 allowingNonStackableItems:1];
      objc_super v9 = v13;

      objc_super v10 = [(SBFolderController *)self effectiveIconImageAppearance];
      [v4 purgeAllCachedImages];
      uint64_t v11 = objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_2);
      id v12 = (id)[v4 cacheImagesForIcons:v11 imageAppearance:v10 options:0 completionHandler:0];
    }
  }
}

uint64_t __56__SBRootFolderController__updateAddWidgetSheetIconCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 icon];
}

- (NSArray)folderControllers
{
  char v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
  uint64_t v4 = [(SBFolderController *)self innerFolderController];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 innerFolderController];

      id v5 = (void *)v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (void)setPullDownSearchViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  pullDownSearchViewController = self->_pullDownSearchViewController;
  if (pullDownSearchViewController != v5)
  {
    objc_super v8 = v5;
    [(UIViewController *)pullDownSearchViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_pullDownSearchViewController, a3);
    id v7 = v8;
    if (v8)
    {
      [(SBRootFolderController *)self addChildViewController:v8];
      id v7 = v8;
    }
    [(UIViewController *)v7 didMoveToParentViewController:self];
    id v5 = v8;
  }
}

- (id)customViewControllerForPageIndex:(int64_t)a3
{
  id v5 = [(SBRootFolderController *)self rootFolderView];
  uint64_t v6 = [v5 typeForPage:a3];
  if (v6 == 2)
  {
    unint64_t v7 = [v5 trailingCustomPageIndexForPageIndex:a3];
    objc_super v8 = [(SBRootFolderController *)self trailingCustomViewControllers];
    goto LABEL_5;
  }
  if (!v6)
  {
    unint64_t v7 = [v5 leadingCustomPageIndexForPageIndex:a3];
    objc_super v8 = [(SBRootFolderController *)self leadingCustomViewControllers];
LABEL_5:
    objc_super v9 = v8;
    if (v7 >= [v8 count])
    {
      objc_super v10 = 0;
    }
    else
    {
      objc_super v10 = [v9 objectAtIndex:v7];
    }

    goto LABEL_10;
  }
  objc_super v10 = 0;
LABEL_10:

  return v10;
}

- (double)spotlightFirstIconRowOffset
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  [v2 _spotlightFirstIconRowOffset];
  double v4 = v3;

  return v4;
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  return [(SBFolderController *)self setCurrentPageIndex:a3 animated:a4 completion:0];
}

- (void)setIdleText:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderController *)self rootFolderView];
  [v5 setIdleText:v4];
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SBRootFolderController *)self dockListView];
  objc_super v9 = [v8 iconLocation];
  if (v9
    && [v7 isEqualToString:v9]
    && ![(SBRootFolderController *)self isDockExternal])
  {
    char v13 = [v8 isDisplayingIconView:v6];
  }
  else
  {
    objc_super v10 = [(id)objc_opt_class() iconLocation];
    int v11 = [v7 isEqualToString:v10];

    if (v11)
    {
      id v12 = [(SBFolderController *)self currentIconListView];
      char v13 = [v12 isDisplayingIconView:v6];
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)beginModifyingDockOffscreenFractionForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderController *)self rootFolderView];
  id v6 = [v5 beginModifyingDockOffscreenFractionForReason:v4];

  return v6;
}

- (unint64_t)dockEdge
{
  v2 = [(SBRootFolderController *)self rootFolderView];
  unint64_t v3 = [v2 dockEdge];

  return v3;
}

- (void)setDockEdge:(unint64_t)a3
{
  id v4 = [(SBRootFolderController *)self rootFolderView];
  [v4 setDockEdge:a3];
}

- (BOOL)_listIndexIsVisible:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderController;
  BOOL v5 = 1;
  if (!-[SBFolderController _listIndexIsVisible:](&v12, sel__listIndexIsVisible_) && a3 != 10000)
  {
    id v6 = [(SBRootFolderController *)self customViewControllerForPageIndex:[(SBFolderController *)self pageIndexForIconListModelIndex:a3]];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = [v6 iconListViewQueryable];
    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28D58], "sb_indexPathWithListIndex:", a3);
    objc_super v9 = [(SBFolderController *)self folder];
    objc_super v10 = [v7 iconListViewForListAtIndexPath:v8 inFolder:v9];

    if (v10) {
      BOOL v5 = 1;
    }
    else {
LABEL_6:
    }
      BOOL v5 = 0;
  }
  return v5;
}

- (BOOL)suspendsWallpaperAnimationWhileOpen
{
  return 0;
}

- (void)rootFolderViewWantsWidgetEditingViewControllerPresented:(id)a3
{
}

- (id)_addWidgetSheetConfigurationManager
{
  unint64_t v3 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 addWidgetSheetConfigurationManagerForRootFolderController:self];
    [v4 setWidgetDragHandlerDelegate:self];
    [v4 setAddWidgetSheetLocation:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)_addWidgetSheetStyle
{
  unint64_t v3 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 addWidgetSheetStyleForRootFolderController:self];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)rootFolderViewWantsIconTintViewControllerPresented:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderControllerWantsIconTintViewControllerPresented:self];
  }
}

- (void)presentWidgetEditingViewControllerFromViewController:(id)a3
{
  id v7 = a3;
  id v4 = [SBHMutableIconGridSizeClassSet alloc];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
  id v6 = [(SBHIconGridSizeClassSet *)v4 initWithGridSizeClasses:v5];

  if ([(SBRootFolderController *)self _addWidgetSheetStyle] == 1) {
    [(SBHMutableIconGridSizeClassSet *)v6 addGridSizeClass:@"SBHIconGridSizeClassExtraLarge"];
  }
  [(SBRootFolderController *)self presentWidgetEditingViewControllerFromViewController:v7 withAllowedSizeClasses:v6 allowingNonStackableItems:1];
}

- (void)updatePresentedWidgetEditingViewController
{
  id v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v3 = [v5 addWidgetSheetConfigurationManagerForRootFolderController:self];
    id v4 = [(SBRootFolderController *)self addSheetViewController];
    [v3 updatePresentedWidgetEditingViewController:v4];
  }
}

- (void)dismissWidgetEditingViewControllerIfPresentedAnimated:(BOOL)a3
{
}

- (id)applicationWidgetCollectionsForEditingViewController:(id)a3 withAllowedSizeClasses:(id *)a4 allowingNonStackableItems:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  objc_super v9 = [(SBRootFolderController *)self _addWidgetSheetConfigurationManager];
  objc_super v10 = [v9 applicationWidgetCollectionsForEditingViewController:v8 withAllowedSizeClasses:a4 allowingNonStackableItems:v5];

  return v10;
}

- (void)presentWidgetEditingViewControllerFromViewController:(id)a3 withAllowedSizeClasses:(id)a4 allowingNonStackableItems:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v55 = a4;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(SBRootFolderController *)self applicationWidgetCollectionsForEditingViewController:v9 withAllowedSizeClasses:&v55 allowingNonStackableItems:v5];
  id v11 = v55;

  uint64_t v12 = [(SBFolderController *)self listLayoutProvider];
  [(SBFolderController *)self gridSizeClassDomain];
  long long v47 = v49 = v11;
  uint64_t v13 = objc_msgSend(v11, "chsWidgetFamilyMaskInDomain:");
  uint64_t v14 = [(SBFolderController *)self iconViewProvider];
  uint64_t v15 = [(SBFolderController *)self folderDelegate];
  uint64_t v16 = [v15 appIconImageCacheForRootFolderController:self];
  uint64_t v17 = [(SBRootFolderController *)self _addWidgetSheetStyle];
  long long v46 = (void *)v14;
  if (v17 == 1)
  {
    long long v18 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:]([SBHPadAddSheetViewController alloc], "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v12, v14, v13, v5, v16, 1);
  }
  else
  {
    long long v18 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:]([SBHAddWidgetSheetViewController alloc], "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v12, v14, v13, v5, v16, v17);
    if (objc_opt_respondsToSelector()) {
      [v15 rootFolderController:self prepareAddSheetViewController:v18];
    }
  }
  long long v19 = [(SBRootFolderController *)self _addWidgetSheetConfigurationManager];
  -[SBHPadAddSheetViewController setAllowsFakeWidgets:](v18, "setAllowsFakeWidgets:", [v19 allowsFakeWidgets]);
  [(SBHPadAddSheetViewController *)v18 setPresenter:v9];
  uint64_t v20 = [v9 presenterType];

  if (v20 == 2)
  {
    unint64_t v21 = [(SBRootFolderController *)self _stackConfigurationGridSize];
    [v19 stackConfigurationSuggestedWidgetItems];
  }
  else
  {
    unint64_t v21 = [(SBRootFolderController *)self _currentHomeScreenEditingGridSize];
    [v19 editingSuggestedWidgetItems];
  long long v22 = };
  [(SBHPadAddSheetViewController *)v18 setGalleryLayoutSize:v21];
  [(SBHPadAddSheetViewController *)v18 setSuggestedItems:v22 forGalleryLayoutSize:v21];
  -[SBHPadAddSheetViewController setAddWidgetSheetLocation:](v18, "setAddWidgetSheetLocation:", [v19 addWidgetSheetLocation]);
  [(SBRootFolderController *)self setAddSheetViewController:v18];
  long long v23 = SBLogWidgets();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v57 = v10;
    _os_log_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_DEFAULT, "Presenting add widget sheet with applicationWidgetCollections: %@", buf, 0xCu);
  }

  [(SBHPadAddSheetViewController *)v18 setApplicationWidgetCollections:v10];
  [(SBHAddWidgetSheetViewControllerBase *)v18 setDelegate:self];
  [(SBHPadAddSheetViewController *)v18 setModalPresentationStyle:2];
  long long v24 = [(SBRootFolderController *)self view];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;

  if (v17 == 1)
  {
    [(SBHPadAddSheetViewController *)v18 preferredInsetsForSheetPresentationInInterfaceOrientation:[(SBFolderController *)self orientation]];
    -[SBHPadAddSheetViewController setPreferredContentSize:](v18, "setPreferredContentSize:", v26 - (v29 + v30), v28 - (v31 + v32));
  }
  __int16 v33 = [(SBHPadAddSheetViewController *)v18 sheetPresentationController];
  [v33 _setShouldDismissWhenTappedOutside:1];
  objc_super v50 = (void *)v10;
  long long v48 = (void *)v12;
  if (v17 == 1)
  {
    [v33 setPrefersGrabberVisible:1];
    [(SBRootFolderController *)self _additionalMinimumOffsetForSheetPresentation];
    objc_msgSend(v33, "_setAdditionalMinimumTopInset:");
    [v33 setPreferredCornerRadius:SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(1)];
    [v33 setPrefersEdgeAttachedInCompactHeight:1];
    [v33 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
    int v34 = [v33 traitOverrides];
    [v34 setHorizontalSizeClass:2];
  }
  else
  {
    __int16 v35 = [(SBFolderController *)self currentIconListView];
    [v33 setSourceView:v35];

    [v33 setPrefersGrabberVisible:1];
    [(SBRootFolderController *)self _additionalMinimumOffsetForSheetPresentation];
    objc_msgSend(v33, "_setAdditionalMinimumTopInset:");
    [v33 setPreferredCornerRadius:SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(v17)];
  }
  BOOL v36 = [(SBRootFolderController *)self traitCollection];
  __int16 v37 = self;
  BOOL v38 = [v36 objectForTrait:v37];

  if (v38)
  {
    uint64_t v39 = [(SBHPadAddSheetViewController *)v18 traitOverrides];
    v40 = self;
    [v39 setObject:v38 forTrait:v40];
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke;
  v53[3] = &unk_1E6AACEC8;
  v41 = v18;
  v54 = v41;
  [(SBRootFolderController *)self enumerateWidgetAddSheetObserversUsingBlock:v53];
  if (objc_opt_respondsToSelector()) {
    [v15 rootFolderController:self willPresentAddSheetViewController:v41];
  }
  long long v42 = _os_activity_create(&dword_1D7F0A000, "Add Widget Sheet", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v42, &self->_widgetAddSheetActivityState);

  long long v43 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v43, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_PRESENT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_108;
  v51[3] = &unk_1E6AACA90;
  v51[4] = self;
  v52 = v41;
  long long v44 = v41;
  [(SBRootFolderController *)self presentViewController:v44 animated:1 completion:v51];
}

uint64_t __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, *(void *)(a1 + 32), 1);
}

void __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_108(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2;
  v4[3] = &unk_1E6AACEC8;
  v1 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v1 enumerateWidgetAddSheetObserversUsingBlock:v4];
  v2 = SBLogWidgets();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_PRESENT", " isAnimation=YES ", v3, 2u);
  }
}

uint64_t __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, *(void *)(a1 + 32), 2);
}

- (unint64_t)snapshotTypeForIconImageViewControllersUnderWidgetAddSheet
{
  return 0;
}

- (BOOL)_internalDismissWidgetAddSheet:(BOOL)a3 clearAddSheetViewController:(BOOL)a4 notifyObservers:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = self->_addSheetViewController;
  if (!v9)
  {
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [(SBRootFolderController *)self presentedViewController];

  if (v10 != v9)
  {
    if (v6) {
      [(SBRootFolderController *)self setAddSheetViewController:0];
    }
    goto LABEL_5;
  }
  if (v5)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke;
    v19[3] = &unk_1E6AACEC8;
    uint64_t v20 = v9;
    [(SBRootFolderController *)self enumerateWidgetAddSheetObserversUsingBlock:v19];
  }
  uint64_t v12 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_DISMISS", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_109;
  v14[3] = &unk_1E6AACEF0;
  BOOL v16 = v6;
  v14[4] = self;
  BOOL v17 = v5;
  uint64_t v15 = v9;
  [(SBNestingViewController *)self dismissViewControllerAnimated:v7 completion:v14];

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

uint64_t __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, *(void *)(a1 + 32), 3);
}

void __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_109(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setAddSheetViewController:0];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_2;
    v5[3] = &unk_1E6AACEC8;
    v2 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v2 enumerateWidgetAddSheetObserversUsingBlock:v5];
  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(a1 + 32) + 1408));
  unint64_t v3 = SBLogWidgets();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_DISMISS", " isAnimation=YES ", v4, 2u);
  }
}

uint64_t __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

- (BOOL)dismissWidgetAddSheetIfPresentedAndClearAnimated:(BOOL)a3
{
  return [(SBRootFolderController *)self _internalDismissWidgetAddSheet:a3 clearAddSheetViewController:1 notifyObservers:1];
}

- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SBRootFolderController *)self isTrailingCustomViewVisibleOrTransitionDestination])
  {
    [(SBFolderController *)self scrollUsingDecelerationAnimationToPageIndex:[(SBFolderController *)self lastIconPageIndex] withCompletionHandler:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolderController;
    [(SBFolderController *)&v5 scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:v4];
  }
}

- (double)_additionalMinimumOffsetForSheetPresentation
{
  unint64_t v3 = [(SBFolderController *)self listLayoutProvider];
  id v4 = [v3 layoutForIconLocation:@"SBIconLocationRoot"];
  uint64_t v5 = [(SBFolderController *)self orientation];
  [v4 layoutInsetsForOrientation:v5];
  double v7 = v6;
  SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v4, v5, @"SBHIconGridSizeClassDefault");
  double v9 = v7 + v8 * 0.5;
  uint64_t v10 = [(SBRootFolderController *)self view];
  _UISheetMinimumTopInset();
  double v12 = v11;

  return v9 - v12;
}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  if (v10)
  {
    uint64_t v15 = [(SBRootFolderController *)self widgetIconForDescriptor:v10 sizeClass:a4];
  }
  else if (v14)
  {
    BOOL v16 = [v14 descriptorsForSizeClass:a4];
    uint64_t v15 = [(SBRootFolderController *)self widgetIconForDescriptors:v16 sizeClass:a4];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBFolderController *)self gridSizeClassDomain];
  id v8 = [[SBWidgetIcon alloc] initWithCHSWidgetDescriptor:v6 inDomain:v7];

  double v9 = [v7 iconGridSizeClassForCHSWidgetFamily:a4];
  [(SBIcon *)v8 setGridSizeClass:v9];

  return v8;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBFolderController *)self gridSizeClassDomain];
  id v8 = [[SBWidgetIcon alloc] initWithCHSWidgetDescriptors:v6 inDomain:v7];

  double v9 = [v7 iconGridSizeClassForCHSWidgetFamily:a4];
  [(SBIcon *)v8 setGridSizeClass:v9];

  return v8;
}

- (void)didBeginDraggingWidgetIcon:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([(SBRootFolderController *)self _addWidgetSheetStyle] == 1)
  {
    id v4 = [(SBRootFolderController *)self addSheetViewController];
    uint64_t v5 = [v4 sheetPresentationController];
    id v6 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:@"AddWidgetSheetDodge" resolver:&__block_literal_global_121];
    v16[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v5 setDetents:v7];

    [v5 setLargestUndimmedDetentIdentifier:@"AddWidgetSheetDodge"];
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_2;
    v14[3] = &unk_1E6AAC810;
    id v9 = v4;
    id v15 = v9;
    [v8 animateWithDuration:0 delay:v14 usingSpringWithDamping:&__block_literal_global_126 initialSpringVelocity:0.6 options:0.0 animations:1.0 completion:0.0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_4;
    v12[3] = &unk_1E6AACF58;
    id v13 = v9;
    id v10 = v9;
    uint64_t v11 = (void (**)(void *, __CFString *))_Block_copy(v12);
    v11[2](v11, @"SBRootFolderControllerKeepRootStaticAssertion");
    v11[2](v11, @"SBRootFolderControllerKeepStackStaticAssertion");
  }
  else
  {
    [(SBRootFolderController *)self _internalDismissWidgetAddSheet:1 clearAddSheetViewController:0 notifyObservers:0];
  }
}

double __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke()
{
  return 150.0;
}

void __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  v1 = [v2 window];
  [v1 layoutIfNeeded];
}

void __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  unint64_t v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKey:v6];

  if (v4)
  {
    [v4 invalidate];
    uint64_t v5 = [*(id *)(a1 + 32) userInfo];
    [v5 removeObjectForKey:v6];
  }
}

- (void)didEndDraggingWidgetIcon:(id)a3
{
  unint64_t v4 = [(SBRootFolderController *)self _addWidgetSheetStyle];
  uint64_t v5 = [(SBRootFolderController *)self addSheetViewController];
  if ([v5 _appearState] && v4 == 1)
  {
    dispatch_time_t v6 = dispatch_time(0, 600000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke;
    v7[3] = &unk_1E6AACA90;
    void v7[4] = self;
    id v8 = v5;
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  }
}

void __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) addSheetViewController];
  unint64_t v3 = [v2 sheetPresentationController];

  unint64_t v4 = [MEMORY[0x1E4FB1C30] largeDetent];
  v14[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 setDetents:v5];

  [v3 setLargestUndimmedDetentIdentifier:0];
  dispatch_time_t v6 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_2;
  v12[3] = &unk_1E6AAC810;
  id v13 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_3;
  v9[3] = &unk_1E6AACF80;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 animateWithDuration:0 delay:v12 usingSpringWithDamping:v9 initialSpringVelocity:0.6 options:0.0 animations:1.0 completion:0.0];
}

void __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  v1 = [v2 window];
  [v1 layoutIfNeeded];
}

void __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = [v2 userInfo];
    unint64_t v4 = [v3 objectForKey:@"SBRootFolderControllerKeepRootStaticAssertion"];

    if (!v4)
    {
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", objc_msgSend(*(id *)(a1 + 40), "snapshotTypeForIconImageViewControllersUnderWidgetAddSheet"), 0, @"Add Sheet view controller after dragging end");
      if (v5)
      {
        dispatch_time_t v6 = [*(id *)(a1 + 32) userInfo];
        [v6 setObject:v5 forKey:@"SBRootFolderControllerKeepRootStaticAssertion"];
      }
    }
    id v7 = [*(id *)(a1 + 40) stackConfigurationViewController];
    if (v7)
    {
      id v12 = v7;
      uint64_t v8 = [*(id *)(a1 + 32) userInfo];
      id v9 = [v8 objectForKey:@"SBRootFolderControllerKeepStackStaticAssertion"];

      id v7 = v12;
      if (!v9)
      {
        id v10 = [v12 keepIconImageViewControllersStaticForReason:@"Add Sheet view controller after dragging end"];
        if (v10)
        {
          uint64_t v11 = [*(id *)(a1 + 32) userInfo];
          [v11 setObject:v10 forKey:@"SBRootFolderControllerKeepStackStaticAssertion"];
        }
        id v7 = v12;
      }
    }
  }
}

- (void)stackConfigurationViewControllerWillAppear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v10 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      dispatch_time_t v6 = v10;
    }
    else {
      dispatch_time_t v6 = 0;
    }
  }
  else
  {
    dispatch_time_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [(SBRootFolderController *)self stackConfigurationViewController];

  if (v8 != v7)
  {
    [(SBRootFolderController *)self setStackConfigurationViewController:v7];
    id v9 = [(SBRootFolderController *)self _addWidgetSheetConfigurationManager];
    [v9 fetchGalleryContentForStackConfigurationViewController:v7 addWidgetSheetViewController:self->_addSheetViewController];
  }
  [(SBRootFolderController *)self _handleWidgetSheetViewControllerWillAppear:v10];
}

- (void)stackConfigurationViewControllerDidAppear:(id)a3
{
  id v6 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerDidAppear:](self, "_handleWidgetSheetViewControllerDidAppear:");
  id v4 = [(SBFolderController *)self keepIconImageViewControllersSnapshotsOfType:1 inAllPagesExcluding:0 forReason:@"Stack Configuration"];
  if (v4)
  {
    uint64_t v5 = [v6 userInfo];
    [v5 setObject:v4 forKey:@"SBRootFolderControllerKeepRootStaticAssertion"];
  }
}

- (void)stackConfigurationViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v10 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v10;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [(SBRootFolderController *)self stackConfigurationViewController];

  if (v8 == v7)
  {
    [(SBRootFolderController *)self setStackConfigurationViewController:0];
    id v9 = [(SBRootFolderController *)self _addWidgetSheetConfigurationManager];
    [v9 setStackConfigurationSuggestedWidgetItems:0];
  }
  [(SBRootFolderController *)self _handleWidgetSheetViewControllerDidDisappear:v10];
}

- (void)stackConfigurationInteraction:(id)a3 requestsPresentAddWidgetSheetFromPresenter:(id)a4
{
  id v6 = a4;
  id v7 = [a3 configuration];
  id v9 = [v7 sizeClass];

  id v8 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClass:v9];
  [(SBRootFolderController *)self presentWidgetEditingViewControllerFromViewController:v6 withAllowedSizeClasses:v8 allowingNonStackableItems:0];
}

- (id)stackConfigurationInteraction:(id)a3 draggedIconForIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 rootFolderController:self draggedIconForStackConfigurationInteractionForIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)stackConfigurationInteraction:(id)a3 isConsumingDropSession:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 rootFolderController:self noteDragItemWasConsumedExternallyForDropSession:v5];
  }
  id v7 = [(SBFolderController *)self iconModel];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v5, "items", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "sbh_appDragLocalContext");
        id v14 = [v13 uniqueIdentifier];
        [v7 removeIconForIdentifier:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)stackConfigurationInteraction:(id)a3 noteDidRemoveSuggestedWidgetIcon:(id)a4
{
  id v6 = a4;
  id v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 rootFolderController:self noteDidRemoveSuggestedWidgetIcon:v6];
  }
}

- (void)stackConfigurationInteractionWillAnimateWidgetInsertion:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderControllerWillAnimateWidgetInsertionForStackConfigurationInteraction:self];
  }
}

- (id)stackConfigurationInteraction:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 rootFolderController:self dragPreviewForIconView:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)windowForIconDragPreviewsForStackConfigurationInteraction:(id)a3 forWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 windowForStackConfigurationIconDragPreviewsForRootFolderController:self forWindowScene:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)stackConfigurationInteraction:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 rootFolderController:self promoteSuggestedWidget:v7 withinStack:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)stackConfigurationInteraction:(id)a3 allowsRemovalOfIconDataSource:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 rootFolderController:self allowsRemovalOfIconDataSourceWithinStack:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SBRootFolderController_addWidgetSheetViewController_didSelectWidgetIconView___block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  aBlock[4] = self;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = [v7 icon];
  if (v9)
  {
    uint64_t v10 = [v6 presenter];
    uint64_t v11 = [(SBFolderController *)self folderDelegate];
    if (objc_opt_respondsToSelector()) {
      [v11 rootFolderController:self handleInsertionForWidgetIcon:v9 withReferenceIconView:v7 fromPresenter:v10 dismissViewControllerHandler:v8];
    }
    else {
      v8[2](v8);
    }
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __79__SBRootFolderController_addWidgetSheetViewController_didSelectWidgetIconView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalDismissWidgetAddSheet:1 clearAddSheetViewController:0 notifyObservers:0];
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
}

- (void)addWidgetSheetViewControllerWillAppear:(id)a3
{
  id v5 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerWillAppear:](self, "_handleWidgetSheetViewControllerWillAppear:");
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderController:self willPresentWidgetEditingViewController:v5];
  }
}

- (void)addWidgetSheetViewControllerDidAppear:(id)a3
{
  id v11 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerDidAppear:](self, "_handleWidgetSheetViewControllerDidAppear:");
  id v4 = [(SBFolderController *)self keepIconImageViewControllersSnapshotsOfType:[(SBRootFolderController *)self snapshotTypeForIconImageViewControllersUnderWidgetAddSheet] inAllPagesExcluding:0 forReason:@"Add Widget Sheet"];
  if (v4)
  {
    id v5 = [v11 userInfo];
    [v5 setObject:v4 forKey:@"SBRootFolderControllerKeepRootStaticAssertion"];
  }
  id v6 = [(SBRootFolderController *)self stackConfigurationViewController];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 keepIconImageViewControllersStaticForReason:@"Add Widget Sheet"];
    if (v8)
    {
      uint64_t v9 = [v11 userInfo];
      [v9 setObject:v8 forKey:@"SBRootFolderControllerKeepStackStaticAssertion"];
    }
  }
  uint64_t v10 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v10 rootFolderController:self didPresentWidgetEditingViewController:v11];
  }
}

- (void)addWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v5 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerWillDisappear:](self, "_handleWidgetSheetViewControllerWillDisappear:");
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderController:self willDismissWidgetEditingViewController:v5];
  }
}

- (void)addWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v5 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerDidDisappear:](self, "_handleWidgetSheetViewControllerDidDisappear:");
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderController:self didDismissWidgetEditingViewController:v5];
  }
}

- (void)_handleWidgetSheetViewControllerWillAppear:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presenter];
  [v5 setSuppressesEditingStateForListView:1];
  [(SBRootFolderController *)self _updateStatusBarHiddenForWidgetSheetViewController:v4 visible:1];
  if (objc_opt_respondsToSelector())
  {
    if ([v4 hidesPresenterTitledButtons]) {
      double v6 = 0.0;
    }
    else {
      double v6 = 0.3;
    }
  }
  else
  {
    double v6 = 0.3;
  }
  id v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBRootFolderController__handleWidgetSheetViewControllerWillAppear___block_invoke;
  v9[3] = &unk_1E6AAC810;
  id v10 = v5;
  id v8 = v5;
  [v7 animateWithDuration:v9 animations:0 completion:v6];
}

uint64_t __69__SBRootFolderController__handleWidgetSheetViewControllerWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitledButtonsAlpha:0.0];
}

- (void)_handleWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presenter];
  [v5 setSuppressesEditingStateForListView:0];
  [(SBRootFolderController *)self _updateStatusBarHiddenForWidgetSheetViewController:v4 visible:0];
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke;
  v12[3] = &unk_1E6AAC810;
  id v13 = v5;
  id v7 = v5;
  [v6 animateWithDuration:v12 animations:0 completion:0.3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke_2;
  v10[3] = &unk_1E6AACF58;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = (void (**)(void *, __CFString *))_Block_copy(v10);
  v9[2](v9, @"SBRootFolderControllerKeepRootStaticAssertion");
  v9[2](v9, @"SBRootFolderControllerKeepStackStaticAssertion");
}

uint64_t __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitledButtonsAlpha:1.0];
}

void __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  unint64_t v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKey:v6];

  if (v4)
  {
    [v4 invalidate];
    id v5 = [*(id *)(a1 + 32) userInfo];
    [v5 removeObjectForKey:v6];
  }
}

- (void)_handleWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presenter];
  [v5 updateExtraButtonVisibilityAnimated:1];
  [(SBRootFolderController *)self _updateStatusBarHiddenForWidgetSheetViewController:v4 visible:0];
}

- (void)_updateStatusBarHiddenForWidgetSheetViewController:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  char v6 = objc_opt_respondsToSelector();
  id v7 = v10;
  if (v6)
  {
    uint64_t v8 = [v10 nonEditingStatusBarHidingReason];
    id v7 = v10;
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      if (v4)
      {
        [(SBFolderController *)self _hideStatusBarForReason:v8 animated:1];
        [(SBFolderController *)self _hideFakeStatusBarForReason:v9 animated:1];
      }
      else
      {
        [(SBFolderController *)self _unhideStatusBarForReason:v8];
        [(SBFolderController *)self _unhideFakeStatusBarForReason:v9 animated:1];
      }

      id v7 = v10;
    }
  }
}

- (BOOL)canShowWidgetIntroduction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(SBFolderController *)self currentPageIndex];
  int64_t v4 = [(SBFolderController *)self firstIconPageIndex];
  BOOL v5 = [(SBRootFolderController *)self isDisplayingWidgetIntroductionOnPage:v3];
  char v6 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    BOOL v9 = v3 == v4;
    __int16 v10 = 2048;
    BOOL v11 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Root folder can show widget discoverability= %ld, is showing = %ld", (uint8_t *)&v8, 0x16u);
  }

  return v3 == v4 && !v5;
}

- (BOOL)iconListViewsContainWidget
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(SBFolderController *)self iconListViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) containsWidget])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)iconListViewContainsWidget:(unint64_t)a3
{
  uint64_t v3 = [(SBFolderController *)self iconListViewAtIndex:a3];
  char v4 = [v3 containsWidget];

  return v4;
}

- (void)updatePronouncedContainerViewVisibilityIfPossible:(BOOL)a3 vertical:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(SBFolderController *)self currentPageIndex];
  unint64_t v8 = [(SBFolderController *)self iconListViewIndexForPageIndex:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = 0;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v9 = [(SBRootFolderController *)self iconListViewContainsWidget:v8];
    if (!v5)
    {
LABEL_8:
      int64_t v11 = [(SBFolderController *)self firstIconPageIndex];
      long long v10 = [(SBFolderController *)self iconListViewAtIndex:[(SBFolderController *)self iconListViewIndexForPageIndex:v11]];
      uint64_t v12 = SBLogWidgetDiscoverabilityMigration();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134218496;
        BOOL v14 = v5;
        __int16 v15 = 2048;
        int64_t v16 = v7;
        __int16 v17 = 2048;
        int64_t v18 = v11;
        _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Should add pronounced container: toVisible(%ld), currentPageIndex(%ld), firstIconPageIndex(%ld)", (uint8_t *)&v13, 0x20u);
      }

      if (v7 == v11 && v5)
      {
        [v10 layoutIconsNow];
        [v10 addPronouncedContainerViewWithDelegate:self vertical:v4];
      }
      else
      {
        [v10 removePronouncedContainerView];
      }
      goto LABEL_14;
    }
  }
  if (v9) {
    goto LABEL_8;
  }
  long long v10 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "No need to update pronounced container", (uint8_t *)&v13, 2u);
  }
LABEL_14:
}

- (void)acceptWidgetIntroduction
{
  [(SBRootFolderController *)self updatePronouncedContainerViewVisibilityIfPossible:0 vertical:0];
  id v3 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 rootFolderControllerDidAcceptWidgetIntroduction:self];
  }
}

- (void)rejectWidgetIntroduction
{
  id v3 = [(SBFolderController *)self folderDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 rootFolderControllerDidSetPrototypeSettingEditAsUndo:self])
  {
    if (objc_opt_respondsToSelector()) {
      [v3 rootFolderControllerDidUndoWidgetIntroduction:self];
    }
  }
  else
  {
    [(SBRootFolderController *)self updatePronouncedContainerViewVisibilityIfPossible:0 vertical:0];
    [v3 folderControllerShouldBeginEditing:self withHaptic:0];
    if (objc_opt_respondsToSelector()) {
      [v3 rootFolderControllerDidEditWidgetIntroduction:self];
    }
  }
}

- (id)viewControllerForPageState:(int64_t)a3
{
  if ((a3 | 2) == 3)
  {
    BOOL v4 = [(SBRootFolderController *)self searchPresentableViewController];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(SBRootFolderController *)self pullDownSearchViewController];
    }
    int64_t v7 = v6;
  }
  else
  {
    int64_t v7 = 0;
  }
  return v7;
}

- (id)viewControllerForTransitioningFromPageState:(int64_t)a3 toPageState:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) < 4) {
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_5;
  }
  if (a4 == -1)
  {
LABEL_4:
    a3 = a4;
LABEL_5:
    id v6 = -[SBRootFolderController viewControllerForPageState:](self, "viewControllerForPageState:", a3, v4);
    return v6;
  }
  id v6 = 0;
  return v6;
}

- (void)addPageStateObserver:(id)a3
{
  id v4 = a3;
  pageStateObservers = self->_pageStateObservers;
  id v8 = v4;
  if (!pageStateObservers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int64_t v7 = self->_pageStateObservers;
    self->_pageStateObservers = v6;

    id v4 = v8;
    pageStateObservers = self->_pageStateObservers;
  }
  [(NSHashTable *)pageStateObservers addObject:v4];
}

- (void)removePageStateObserver:(id)a3
{
}

- (void)enumeratePageStateObserversUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSHashTable *)self->_pageStateObservers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)addWidgetAddSheetObserver:(id)a3
{
  id v4 = a3;
  if (!self->_widgetAddSheetObservers)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    widgetAddSheetObservers = self->_widgetAddSheetObservers;
    self->_widgetAddSheetObservers = v5;
  }
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = self->_widgetAddSheetObservers;
  uint64_t v9 = (void *)[v4 copy];
  long long v10 = _Block_copy(v9);
  [(NSMapTable *)v8 setObject:v10 forKey:v7];

  return v7;
}

- (void)removeWidgetAddSheetObserverForHandle:(id)a3
{
}

- (void)enumerateWidgetAddSheetObserversUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_widgetAddSheetObservers objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)allowsAutoscrollToLeadingCustomView
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 allowsAutoscrollToLeadingCustomView];

  return v3;
}

- (void)setAllowsAutoscrollToLeadingCustomView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBRootFolderController *)self rootFolderView];
  [v4 setAllowsAutoscrollToLeadingCustomView:v3];
}

- (UIView)searchableLeadingCustomWrapperView
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  BOOL v3 = [v2 leadingCustomViewWrapperView];

  return (UIView *)v3;
}

- (UIView)searchBackdropView
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  BOOL v3 = [v2 searchBackdropView];

  return (UIView *)v3;
}

- (SBFParallaxSettings)parallaxSettings
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  BOOL v3 = [v2 parallaxSettings];

  return (SBFParallaxSettings *)v3;
}

- (int64_t)pageIndexForLeadingCustomPageIndex:(unint64_t)a3
{
  id v4 = [(SBRootFolderController *)self rootFolderView];
  int64_t v5 = [v4 pageIndexForLeadingCustomPageIndex:a3];

  return v5;
}

- (int64_t)pageIndexForTrailingCustomPageIndex:(unint64_t)a3
{
  id v4 = [(SBRootFolderController *)self rootFolderView];
  int64_t v5 = [v4 pageIndexForTrailingCustomPageIndex:a3];

  return v5;
}

- (BOOL)isPageManagementUITransitioningOutOfVisible
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 isPageManagementUITransitioningOutOfVisible];

  return v3;
}

- (void)enterPageManagementUIWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderController *)self rootFolderView];
  [v5 enterPageManagementUIWithCompletionHandler:v4];
}

- (void)exitPageManagementUIWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderController *)self rootFolderView];
  [v5 exitPageManagementUIWithCompletionHandler:v4];
}

- (void)setOccludedByOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBRootFolderController *)self rootFolderView];
  [v4 setOccludedByOverlay:v3];
}

- (BOOL)isOccludedByOverlay
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  char v3 = [v2 isOccludedByOverlay];

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)SBRootFolderController;
  id v7 = a4;
  -[SBFolderController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [v7 containerView];
  uint64_t v9 = [v8 _window];

  uint64_t v10 = [v9 _toWindowOrientation];
  uint64_t v11 = [v9 _fromWindowOrientation];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E6AACFA8;
  v13[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E6AACFD0;
  void v12[4] = self;
  *(double *)&v12[5] = width;
  *(double *)&v12[6] = height;
  [v7 animateAlongsideTransition:v13 completion:v12];

  if ((unint64_t)(v10 - 1) < 2 != (unint64_t)(v11 - 1) < 2) {
    [(SBRootFolderController *)self _refreshGalleryContentForHomeScreenEditingIfNecessary];
  }
}

uint64_t __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEditing])
  {
    id v2 = [*(id *)(a1 + 32) addSheetViewController];
    char v3 = [v2 presenter];
    id v4 = v3;
    if (v3 && [v3 presenterType] != 2) {
      objc_msgSend(v2, "setGalleryLayoutSize:", objc_msgSend(*(id *)(a1 + 32), "_currentHomeScreenEditingGridSize"));
    }
    id v5 = [v2 sheetPresentationController];
    [v5 setPrefersGrabberVisible:1];
    [*(id *)(a1 + 32) _additionalMinimumOffsetForSheetPresentation];
    objc_msgSend(v5, "_setAdditionalMinimumTopInset:");
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 updateExtraButtonVisibilityAnimated:1];
}

void __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchGesture];
  [v2 updateForRotation];

  id v3 = [*(id *)(a1 + 32) folderDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "rootFolderController:viewDidTransitionToSize:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (void)folderView:(id)a3 willAnimateScrollToPageIndex:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  [(SBFolderController *)&v6 folderView:a3 willAnimateScrollToPageIndex:a4];
  if (![(SBRootFolderController *)self isTransitioningHorizontally])
  {
    if ([(SBRootFolderController *)self isTransitioningPageState])
    {
      id v5 = [(SBRootFolderController *)self currentTransitionHandle];
      [v5 endTransitionSuccessfully:0];
    }
  }
}

- (void)folderView:(id)a3 didBeginEditingTitle:(id)a4
{
  id v6 = a4;
  id v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderController:self didBeginEditingTitle:v6];
  }
}

- (void)folderView:(id)a3 didEndEditingTitle:(id)a4
{
  id v6 = a4;
  id v5 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderController:self didEndEditingTitle:v6];
  }
}

- (void)rootFolderView:(id)a3 wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "rootFolderController:wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:", self, x, y);
  }
}

- (double)distanceToTopOfSpotlightIconsForRootFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 distanceToTopOfSpotlightIconsForRootFolderController:self];
    double v5 = v6;
  }

  return v5;
}

- (double)maxExternalDockHeightForRootFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 maxExternalDockHeightForRootFolderController:self];
    double v5 = v6;
  }

  return v5;
}

- (double)externalDockHeightForRootFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 externalDockHeightForRootFolderController:self];
    double v5 = v6;
  }

  return v5;
}

- (double)preferredExternalDockVerticalMarginForRootFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 preferredExternalDockVerticalMarginForRootFolderController:self];
    double v5 = v6;
  }

  return v5;
}

- (id)backgroundViewForDockForRootFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [v4 backgroundViewForDockForRootFolderController:self];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)backgroundViewForEditingDoneButtonForRootFolderView:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [v4 backgroundViewForEditingDoneButtonForRootFolderController:self];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)rootFolderView:(id)a3 didOverscrollOnFirstPageByAmount:(double)a4
{
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 rootFolderController:self didOverscrollOnFirstPageByAmount:a4];
  }
}

- (void)rootFolderView:(id)a3 didEndOverscrollOnFirstPageWithVelocity:(double)a4 translation:(double)a5
{
  id v8 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 rootFolderController:self didEndOverscrollOnFirstPageWithVelocity:a4 translation:a5];
  }
}

- (void)rootFolderView:(id)a3 didOverscrollOnLastPageByAmount:(double)a4
{
  id v6 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 rootFolderController:self didOverscrollOnLastPageByAmount:a4];
  }
}

- (void)rootFolderView:(id)a3 didEndOverscrollOnLastPageWithVelocity:(double)a4 translation:(double)a5
{
  id v8 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v8 rootFolderController:self didEndOverscrollOnLastPageWithVelocity:a4 translation:a5];
  }
}

- (void)rootFolderViewWantsToEndEditing:(id)a3
{
  id v4 = [(SBFolderController *)self folderDelegate];
  [v4 folderControllerShouldEndEditing:self];
}

- (void)rootFolderViewWantsSearchPresented:(id)a3
{
  [(SBRootFolderController *)self setPresentationSource:8];
  [(SBRootFolderController *)self presentSpotlightAnimated:1 completionHandler:0];
  [(SBRootFolderController *)self setPresentationSource:0];
}

- (void)rootFolderView:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6
{
  id v18 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = (void *)MEMORY[0x1E4F28D60];
  id v13 = a3;
  objc_super v14 = objc_msgSend(v12, "indexSetWithIndex:", objc_msgSend(v13, "currentPageIndex"));
  uint64_t v15 = [(SBFolderController *)self keepIconImageViewControllersSnapshotsOfType:1 inAllPagesExcluding:v14 forReason:@"SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"];

  if (v15) {
    [v11 setObject:v15 forKey:@"SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"];
  }
  [(SBRootFolderController *)self setSuppressesExtraEditingButtons:0];
  int64_t v16 = [v13 folder];

  -[SBRootFolderController setHiddenListCountWhenPageManagementPresented:](self, "setHiddenListCountWhenPageManagementPresented:", [v16 hiddenListCount]);
  __int16 v17 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v17 rootFolderController:self willPresentPageManagementWithLayoutManager:v18 animator:v10 context:v11];
  }
}

- (void)rootFolderView:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(a3, "currentPageIndex"));
  id v10 = [(SBFolderController *)self keepIconImageViewControllersSnapshotsOfType:1 inAllPagesExcluding:v9 forReason:@"SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"];

  if (v10) {
    [v8 setObject:v10 forKey:@"SBKeepIconImageViewControllersStaticForPageManagementUIDismissalReason"];
  }
  id v11 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 rootFolderController:self willDismissPageManagementUsingAnimator:v12 context:v8];
  }
}

- (void)rootFolderView:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5
{
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKey:@"SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"];
  [v10 invalidate];
  [v9 removeObjectForKey:@"SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"];
  id v11 = [v9 objectForKey:@"SBKeepIconImageViewControllersStaticForPageManagementUIDismissalReason"];

  [v11 invalidate];
  [v9 removeObjectForKey:@"SBKeepIconImageViewControllersStaticForPageManagementUIDismissalReason"];
  id v12 = [(SBRootFolderController *)self homeScreenDefaults];
  if (([v12 pagesHaveEverBeenHidden] & 1) == 0)
  {
    id v13 = [v27 folder];
    unint64_t v14 = [v13 hiddenListCount];
    if (v14 > [(SBRootFolderController *)self hiddenListCountWhenPageManagementPresented])
    {
      [v12 setPagesHaveEverBeenHidden:1];
      double v25 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v15 = SBHBundle();
      int64_t v16 = objc_msgSend(v15, "localizedStringForKey:value:table:", @"PAGE_HIDING_ALERT_TITLE", &stru_1F2FA0300);
      __int16 v17 = SBHBundle();
      [v17 localizedStringForKey:@"PAGE_HIDING_ALERT_BODY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      id v18 = v26 = v8;
      uint64_t v19 = [v25 alertControllerWithTitle:v16 message:v18 preferredStyle:1];

      uint64_t v20 = (void *)MEMORY[0x1E4FB1410];
      unint64_t v21 = SBHBundle();
      long long v22 = [v21 localizedStringForKey:@"OK" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      long long v23 = [v20 actionWithTitle:v22 style:0 handler:0];

      [v19 addAction:v23];
      [(SBRootFolderController *)self presentViewController:v19 animated:1 completion:0];

      id v8 = v26;
    }
  }
  long long v24 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v24 rootFolderController:self didDismissPageManagementWithLayoutManager:v8 context:v9];
  }
}

- (void)_presentPageManagement:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderController *)self rootFolderView];
  [v5 enterPageManagementUIWithCompletionHandler:v4];
}

- (void)_dismissPageManagementIfPresented:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderController *)self rootFolderView];
  [v5 exitPageManagementUIWithCompletionHandler:v4];
}

- (void)performPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)performPageStateTransitionToState:(int64_t)a3 pageIndex:(int64_t)a4 reason:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v20 = a5;
  id v12 = (void (**)(void))a7;
  if ([(SBRootFolderController *)self canTransitionPageStateToState:a3])
  {
    int64_t v13 = [(SBRootFolderController *)self pageState];
    if ([(SBRootFolderController *)self isAnySearchTransitioning] && (!a3 || !v13)) {
      int64_t v13 = [(SBRootFolderController *)self destinationPageState];
    }
    switch(a3)
    {
      case -1:
        break;
      case 0:
        if (v13 != 1)
        {
          int64_t v18 = [(SBFolderController *)self firstIconPageIndex];
          uint64_t v19 = self;
          goto LABEL_24;
        }
        unint64_t v14 = [(SBRootFolderController *)self searchGesture];
        [v14 resetAnimated:v8];
LABEL_10:

        break;
      case 1:
        unint64_t v14 = [(SBRootFolderController *)self searchGesture];
        [v14 revealAnimated:v8];
        goto LABEL_10;
      case 2:
        if (v13 == 3)
        {
          uint64_t v15 = self;
          uint64_t v16 = 2;
LABEL_16:
          [(SBRootFolderController *)v15 performDefaultPageStateTransitionToState:v16 reason:v20 animated:v8 completionHandler:v12];
        }
        else
        {
          if (a4 == 0x7FFFFFFFFFFFFFFFLL)
          {
            int64_t v17 = [(SBRootFolderController *)self leadingCustomViewPageIndex];
LABEL_22:
            a4 = v17;
          }
LABEL_23:
          uint64_t v19 = self;
          int64_t v18 = a4;
LABEL_24:
          [(SBFolderController *)v19 setCurrentPageIndex:v18 animated:v8 completion:v12];
        }
        goto LABEL_25;
      case 3:
        uint64_t v15 = self;
        uint64_t v16 = 3;
        goto LABEL_16;
      case 4:
        if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_23;
        }
        int64_t v17 = [(SBRootFolderController *)self trailingCustomViewPageIndex];
        goto LABEL_22;
      default:
        goto LABEL_25;
    }
  }
  if (v12) {
    v12[2](v12);
  }
LABEL_25:
}

- (void)performDefaultPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = [(SBRootFolderController *)self beginPageStateTransitionToState:a3 reason:a4 animated:v6 interactive:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  id v12 = v11;
  id v23 = v12;
  int64_t v13 = (void (**)(void))_Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke_2;
  v19[3] = &unk_1E6AACFF8;
  id v14 = v12;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  uint64_t v16 = (void (**)(void *, void))_Block_copy(v19);
  if (v6)
  {
    int64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:0 curve:v13 animations:0.3];
    [v17 addCompletion:v16];
    int64_t v18 = [(SBFolderController *)self folderDelegate];
    if (objc_opt_respondsToSelector()) {
      [v18 rootFolderController:self willUsePropertyAnimator:v17 toTransitionToState:a3];
    }
    [v17 startAnimation];
  }
  else
  {
    v13[2](v13);
    v16[2](v16, 0);
  }
}

uint64_t __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTransitionProgress:1.0];
}

uint64_t __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endTransitionSuccessfully:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)presentSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([(SBRootFolderController *)self isAnySearchVisibleOrTransitioning]
    || [(SBRootFolderController *)self isTransitioningPageState]
    || [(SBFolderController *)self isScrolling])
  {
    BOOL v6 = v10;
    if (!v10) {
      goto LABEL_7;
    }
    (*((void (**)(id))v10 + 2))(v10);
  }
  else
  {
    id v7 = [(SBRootFolderController *)self searchPresenter];
    BOOL v8 = v7;
    if (v7)
    {
      [v7 presentSearchAnimated:v4];
      if (v10) {
        (*((void (**)(void))v10 + 2))();
      }
    }
    else
    {
      if ([(SBRootFolderController *)self isOnLeadingCustomPage]) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 1;
      }
      [(SBRootFolderController *)self performPageStateTransitionToState:v9 reason:@"present spotlight" animated:v4 completionHandler:v10];
    }
  }
  BOOL v6 = v10;
LABEL_7:
}

- (void)dismissSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v10 = (void (**)(void))a4;
  if ([(SBRootFolderController *)self isPullDownSearchVisibleOrTransitioningToVisible])
  {
    BOOL v6 = [(SBRootFolderController *)self searchPresenter];
    id v7 = v6;
    if (v6)
    {
      [v6 dismissSearchAnimated:v4];
      if (v10) {
        v10[2]();
      }
    }
    else
    {
      if ([(SBRootFolderController *)self isOnLeadingCustomPage]) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 0;
      }
      [(SBRootFolderController *)self performPageStateTransitionToState:v9 reason:@"dismiss spotlight" animated:v4 completionHandler:v10];
    }
  }
  else
  {
    BOOL v8 = v10;
    if (!v10) {
      goto LABEL_13;
    }
    ((void (*)(void (**)(void)))v10[2])(v10);
  }
  BOOL v8 = v10;
LABEL_13:
}

+ (BOOL)pageStateTransitionPrefersUsingScrollingDirection
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

+ (SBRootFolderPageStateTransitionSnapshot)pageStateTransitionSnapshotForScrollOffset:(SEL)a3 pageWidth:(double)a4 pageSpacing:(double)a5 pages:(double)a6 pageCount:(const int64_t *)a7 userInterfaceLayoutDirection:(unint64_t)a8 currentPageState:(int64_t)a9 currentPageOffset:(int64_t)a10 scrollingDirection:(unint64_t)a11
{
  double v22 = 0.0;
  uint64_t result = +[SBFolderView _pageOffsetForOffset:behavior:pageWidth:pageSpacing:pageCount:userInterfaceLayoutDirection:fractionOfDistanceThroughPage:](SBFolderView, "_pageOffsetForOffset:behavior:pageWidth:pageSpacing:pageCount:userInterfaceLayoutDirection:fractionOfDistanceThroughPage:", 0, a8, a9, &v22, a11, a4, a5, a6);
  int64_t v18 = a7[(void)result];
  *(_OWORD *)&retstr->var0 = xmmword_1D81E4C20;
  retstr->var2 = (unint64_t)result;
  retstr->var3 = 0.0;
  if (v22 <= 0.0)
  {
    uint64_t v21 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(a10);
    uint64_t result = (SBRootFolderPageStateTransitionSnapshot *)SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(v21, v18);
    if (result) {
      int64_t v18 = a10;
    }
    goto LABEL_8;
  }
  uint64_t v19 = result;
  if ((unint64_t)result >= a8 - 1)
  {
LABEL_8:
    retstr->var0 = v18;
    int64_t v20 = -1;
    goto LABEL_9;
  }
  uint64_t result = (SBRootFolderPageStateTransitionSnapshot *)+[SBRootFolderController pageStateTransitionPrefersUsingScrollingDirection];
  if (result)
  {
    if (a12 != 2)
    {
LABEL_5:
      retstr->var1 = v18;
      int64_t v20 = v18;
      retstr->var0 = a7[(void)v19 + 1];
      retstr->var3 = 1.0 - v22;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t result = (SBRootFolderPageStateTransitionSnapshot *)SBRootFolderPageStateVerticalGroupMatches(v18, a10);
    if (!result) {
      goto LABEL_5;
    }
  }
  int64_t v20 = a7[(void)&v19->var0 + 1];
  retstr->var0 = v18;
  retstr->var1 = v20;
  retstr->var3 = v22;
  retstr->var2 = (unint64_t)&v19->var0 + 1;
LABEL_9:
  switch(v20)
  {
    case -1:
    case 0:
    case 1:
    case 3:
      goto LABEL_10;
    case 2:
      if (a8 >= 2 && a7[1] == 2) {
        return result;
      }
      goto LABEL_10;
    case 4:
      if (a8 >= 2 && a7[a8 - 2] == 4) {
        return result;
      }
LABEL_10:
      retstr->var1 = -1;
      retstr->var3 = 0.0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_checkForImproperScrollOffsetForPageState
{
  if ([(SBFolderController *)self isScrolling]) {
    return;
  }
  id v9 = [(SBRootFolderController *)self rootFolderView];
  int64_t v3 = [(SBRootFolderController *)self pageState];
  int64_t v4 = [(SBFolderController *)self currentPageIndex];
  [v9 leadingCustomViewPageScrollOffset];
  double v6 = v5;
  if (SBRootFolderPageStateIsOnLeadingCustomPage(v3))
  {
    uint64_t v7 = (uint64_t)v6;
    if (v4 != (uint64_t)v6) {
      goto LABEL_10;
    }
  }
  if (!SBRootFolderPageStateIsOnIconPage(v3)) {
    goto LABEL_11;
  }
  if (v4 >= [(SBFolderController *)self firstIconPageIndex])
  {
    if (v4 > [(SBFolderController *)self lastIconPageIndex])
    {
      int64_t v8 = [(SBFolderController *)self lastIconPageIndex];
      goto LABEL_9;
    }
LABEL_11:
    [v9 resetContentOffsetToCurrentPageAnimated:1];
    goto LABEL_12;
  }
  int64_t v8 = [(SBFolderController *)self firstIconPageIndex];
LABEL_9:
  uint64_t v7 = v8;
LABEL_10:
  [(SBRootFolderController *)self setCurrentPageIndex:v7 animated:1];
LABEL_12:
}

- (double)visibilityProgressTowardPageStateMatchingTest:(id)a3
{
  int64_t v4 = (uint64_t (**)(id, int64_t))a3;
  int v5 = v4[2](v4, [(SBRootFolderController *)self pageState]);
  if ([(SBRootFolderController *)self isTransitioningPageState])
  {
    int64_t v6 = [(SBRootFolderController *)self destinationPageState];
    [(SBRootFolderController *)self pageTransitionProgress];
    double v8 = v7;
    int v9 = v4[2](v4, v6);
    if ((v5 & v9) != 0) {
      double v10 = 1.0;
    }
    else {
      double v10 = v8;
    }
    double v11 = 1.0 - v8;
    if (!v5) {
      double v11 = 0.0;
    }
    BOOL v12 = (v9 & 1) == 0;
  }
  else
  {
    BOOL v12 = v5 == 0;
    double v11 = 0.0;
    double v10 = 1.0;
  }
  if (v12) {
    double v13 = v11;
  }
  else {
    double v13 = v10;
  }

  return v13;
}

- (BOOL)isPullDownSearchVisibleOrTransitioningToVisible
{
  int64_t v3 = [(SBRootFolderController *)self searchPresenter];
  int64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 isPresenting];
  }
  else
  {
    BOOL v6 = [(SBRootFolderController *)self isPullDownSearchVisible];
    if ([(SBRootFolderController *)self isTransitioningPageState]) {
      BOOL v7 = [(SBRootFolderController *)self destinationPageState] == 1;
    }
    else {
      BOOL v7 = 0;
    }
    char v5 = v6 || v7;
  }

  return v5;
}

- (double)_anySearchVisibilityProgress
{
  [(SBRootFolderController *)self visibilityProgressTowardPageStateMatchingTest:&__block_literal_global_282];
  return result;
}

BOOL __54__SBRootFolderController__anySearchVisibilityProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return SBRootFolderPageStateIsSearch(a2);
}

- (BOOL)isLeadingCustomViewVisible
{
  return ![(SBRootFolderController *)self isTransitioningPageState]
      && [(SBRootFolderController *)self pageState] == 2;
}

- (BOOL)isLeadingCustomViewOrLeadingCustomViewSearchVisible
{
  if ([(SBRootFolderController *)self isTransitioningPageState]) {
    return 0;
  }
  uint64_t v4 = [(SBRootFolderController *)self pageState];
  return SBRootFolderPageStateIsOnLeadingCustomPage(v4);
}

- (void)setLeadingCustomViewPageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(SBRootFolderController *)self isLeadingCustomViewPageHidden] != a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v5 = [(SBRootFolderController *)self leadingCustomViewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (v3)
          {
            [*(id *)(*((void *)&v12 + 1) + 8 * v9) willMoveToParentViewController:0];
            [(SBRootFolderController *)self removeChildViewController:v10];
          }
          else
          {
            [(SBRootFolderController *)self addChildViewController:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
            [v10 didMoveToParentViewController:self];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    double v11 = [(SBRootFolderController *)self rootFolderView];
    [v11 setLeadingCustomViewPageHidden:v3];
  }
}

- (BOOL)isLeadingCustomViewPageHiddenAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(SBRootFolderController *)self rootFolderView];
  LOBYTE(a3) = [v4 isLeadingCustomViewPageHiddenAtIndex:a3];

  return a3;
}

- (void)setLeadingCustomViewPageHidden:(BOOL)a3 atIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  if ([(SBRootFolderController *)self isLeadingCustomViewPageHiddenAtIndex:a4] != a3)
  {
    uint64_t v7 = [(SBRootFolderController *)self leadingCustomViewControllers];
    id v9 = [v7 objectAtIndex:a4];

    if (v5)
    {
      [v9 willMoveToParentViewController:0];
      [(SBRootFolderController *)self removeChildViewController:v9];
    }
    else
    {
      [(SBRootFolderController *)self addChildViewController:v9];
      [v9 didMoveToParentViewController:self];
    }
    uint64_t v8 = [(SBRootFolderController *)self rootFolderView];
    [v8 setLeadingCustomViewPageHidden:v5 atIndex:a4];
  }
}

- (BOOL)isLeadingCustomViewTransitioning
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3) {
    LOBYTE(v3) = [(SBRootFolderController *)self pageState] == 2
  }
              || [(SBRootFolderController *)self destinationPageState] == 2;
  return v3;
}

- (BOOL)isTransitioningBetweenIconAndLeadingCustomView
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    int64_t v4 = [(SBRootFolderController *)self pageState];
    int64_t v5 = [(SBRootFolderController *)self destinationPageState];
    LOBYTE(v3) = !v4 && v5 == 2 || v4 == 2 && v5 == 0;
  }
  return v3;
}

- (BOOL)isTransitioningBetweenIconPageAndLeadingCustomPage
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    int64_t v4 = [(SBRootFolderController *)self pageState];
    int64_t v5 = [(SBRootFolderController *)self destinationPageState];
    LOBYTE(v3) = SBRootFolderPageStateIsOnIconPage(v4) && SBRootFolderPageStateIsOnLeadingCustomPage(v5)
              || SBRootFolderPageStateIsOnLeadingCustomPage(v4) && SBRootFolderPageStateIsOnIconPage(v5);
  }
  return v3;
}

- (double)_leadingCustomViewVisibilityProgress
{
  [(SBRootFolderController *)self visibilityProgressTowardPageStateMatchingTest:&__block_literal_global_284];
  return result;
}

BOOL __62__SBRootFolderController__leadingCustomViewVisibilityProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return SBRootFolderPageStateIsOnLeadingCustomPage(a2);
}

- (double)_trailingCustomViewVisibilityProgress
{
  [(SBRootFolderController *)self visibilityProgressTowardPageStateMatchingTest:&__block_literal_global_286];
  return result;
}

BOOL __63__SBRootFolderController__trailingCustomViewVisibilityProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return SBRootFolderPageStateIsOnTrailingCustomPage(a2);
}

- (BOOL)isTransitioningBetweenIconAndTrailingCustomView
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    int64_t v4 = [(SBRootFolderController *)self pageState];
    int64_t v5 = [(SBRootFolderController *)self destinationPageState];
    LOBYTE(v3) = !v4 && v5 == 4 || v4 == 4 && v5 == 0;
  }
  return v3;
}

- (BOOL)isTransitioningBetweenIconPageAndTrailingCustomPage
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    int64_t v4 = [(SBRootFolderController *)self pageState];
    int64_t v5 = [(SBRootFolderController *)self destinationPageState];
    LOBYTE(v3) = SBRootFolderPageStateIsOnIconPage(v4) && SBRootFolderPageStateIsOnTrailingCustomPage(v5)
              || SBRootFolderPageStateIsOnTrailingCustomPage(v4) && SBRootFolderPageStateIsOnIconPage(v5);
  }
  return v3;
}

- (BOOL)isTrailingCustomViewTransitioning
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3) {
    LOBYTE(v3) = [(SBRootFolderController *)self pageState] == 4
  }
              || [(SBRootFolderController *)self destinationPageState] == 4;
  return v3;
}

- (BOOL)isTransitioningBetweenHorizontalPageStates
{
  BOOL v3 = [(SBRootFolderController *)self isTransitioningPageState];
  if (v3)
  {
    unint64_t v4 = [(SBRootFolderController *)self pageState];
    unint64_t v5 = [(SBRootFolderController *)self destinationPageState];
    LOBYTE(v3) = SBRootFolderPageStateIsOnHorizontalScrollingPlane(v4)
              && SBRootFolderPageStateIsOnHorizontalScrollingPlane(v5);
  }
  return v3;
}

- (BOOL)isTransitioningHorizontally
{
  if ([(SBRootFolderController *)self isTransitioningBetweenPageStateVerticalGroups])
  {
    return 1;
  }
  return [(SBRootFolderController *)self isTransitioningBetweenHorizontalPageStates];
}

- (int64_t)destinationPageState
{
  if (![(_SBRootFolderPageTransitionHandle *)self->_currentTransitionHandle isValid]) {
    return -1;
  }
  currentTransitionHandle = self->_currentTransitionHandle;
  return [(_SBRootFolderPageTransitionHandle *)currentTransitionHandle destinationPageState];
}

- (unint64_t)destinationPageOffset
{
  if ([(_SBRootFolderPageTransitionHandle *)self->_currentTransitionHandle isValid]) {
    int64_t v3 = [(_SBRootFolderPageTransitionHandle *)self->_currentTransitionHandle destinationPageIndex];
  }
  else {
    int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(SBFolderController *)self _isValidPageIndex:v3]) {
    return v3 - [(SBFolderController *)self minimumPageIndex];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (double)pageTransitionProgress
{
  if (![(_SBRootFolderPageTransitionHandle *)self->_currentTransitionHandle isValid]) {
    return 0.0;
  }
  currentTransitionHandle = self->_currentTransitionHandle;
  [(_SBRootFolderPageTransitionHandle *)currentTransitionHandle pageTransitionProgress];
  return result;
}

- (id)beginPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  return [(SBRootFolderController *)self beginPageStateTransitionToState:a3 pageIndex:0x7FFFFFFFFFFFFFFFLL reason:a4 animated:a5 interactive:a6];
}

- (id)beginPageStateTransitionToState:(int64_t)a3 pageIndex:(int64_t)a4 reason:(id)a5 animated:(BOOL)a6 interactive:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  long long v13 = SBLogRootController();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    SBStringForRootFolderPageState(a3);
    long long v14 = (SBRootFolderController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    double v25 = v14;
    __int16 v26 = 2114;
    id v27 = v12;
    __int16 v28 = 1024;
    *(_DWORD *)double v29 = v8;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v7;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Begin page state transition to state \"%{public}@\", reason: %{public}@, animated: %{BOOL}u, interactive: %{BOOL}u", buf, 0x22u);
  }
  uint64_t v15 = [(SBRootFolderController *)self pageState];
  if ([(SBRootFolderController *)self canTransitionPageStateToState:a3])
  {
    uint64_t v16 = [[_SBRootFolderPageTransitionHandle alloc] initWithFolderController:self destinationPageState:a3 destinationPageIndex:a4 reason:v12];
    [(SBRootFolderController *)self setCurrentTransitionHandle:v16];
    [(SBRootFolderController *)self willBeginTransitionToState:a3 pageIndex:a4 animated:v8 interactive:v7];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __96__SBRootFolderController_beginPageStateTransitionToState_pageIndex_reason_animated_interactive___block_invoke;
    v21[3] = &unk_1E6AAD040;
    v21[4] = self;
    v21[5] = a3;
    BOOL v22 = v8;
    BOOL v23 = v7;
    [(SBRootFolderController *)self enumeratePageStateObserversUsingBlock:v21];
  }
  else
  {
    uint64_t v17 = SBLogRootController();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = SBStringForRootFolderPageState(v15);
      int64_t v20 = SBStringForRootFolderPageState(a3);
      *(_DWORD *)buf = 138413058;
      double v25 = self;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2114;
      *(void *)double v29 = v20;
      *(_WORD *)&v29[8] = 2114;
      id v30 = v12;
      _os_log_error_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_ERROR, "Invalid state transition for %@: %{public}@ -> %{public}@, reason: %{public}@", buf, 0x2Au);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __96__SBRootFolderController_beginPageStateTransitionToState_pageIndex_reason_animated_interactive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) willBeginTransitionToState:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) interactive:*(unsigned __int8 *)(a1 + 49)];
}

- (BOOL)canTransitionPageStateToState:(int64_t)a3
{
  unint64_t v5 = [(SBRootFolderController *)self pageState];
  if ([(SBRootFolderController *)self isAnySearchTransitioning] && (!a3 || !v5)) {
    unint64_t v5 = [(SBRootFolderController *)self destinationPageState];
  }
  if (v5 > 4)
  {
    BOOL v7 = 0;
  }
  else if (((1 << v5) & 0x15) != 0)
  {
    uint64_t v6 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(v5);
    BOOL v7 = SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(v6, a3)
      || SBRootFolderPageStateIsOnHorizontalScrollingPlane(a3);
  }
  else
  {
    uint64_t v8 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(v5);
    BOOL v9 = SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(v8, a3);
    char v10 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v9;
    if (a3 == 4) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v10;
    }
  }
  if (v5 == a3)
  {
    switch(a3)
    {
      case -1:
      case 0:
      case 1:
      case 3:
        BOOL v7 = 0;
        break;
      case 2:
      case 4:
        double v11 = [(SBRootFolderController *)self rootFolderView];
        BOOL v7 = (unint64_t)[v11 leadingCustomPageCount] > 1;

        break;
      default:
        break;
    }
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage(a3))
  {
    id v12 = [(SBRootFolderController *)self leadingCustomViewController];

    if (!v12) {
      BOOL v7 = 0;
    }
  }
  if (SBRootFolderPageStateIsSearch(a3))
  {
    long long v13 = [(SBRootFolderController *)self pullDownSearchViewController];
    if (v13)
    {
    }
    else
    {
      long long v14 = [(SBRootFolderController *)self searchPresenter];

      if (!v14) {
        BOOL v7 = 0;
      }
    }
  }
  if (SBRootFolderPageStateIsOnTrailingCustomPage(a3))
  {
    uint64_t v15 = [(SBRootFolderController *)self trailingCustomViewController];

    if (!v15) {
      return 0;
    }
  }
  return v7;
}

- (void)willBeginTransitionToState:(int64_t)a3 pageIndex:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v54 = [(SBRootFolderController *)self rootFolderView];
  uint64_t v11 = [(SBRootFolderController *)self pageState];
  BOOL v51 = SBRootFolderPageStateIsOnLeadingCustomPage(v11);
  BOOL v12 = SBRootFolderPageStateIsOnLeadingCustomPage(a3);
  int v52 = SBRootFolderPageStateIsOnTrailingCustomPage(v11);
  unsigned int v53 = SBRootFolderPageStateIsOnTrailingCustomPage(a3);
  BOOL IsSearch = SBRootFolderPageStateIsSearch(v11);
  BOOL v14 = SBRootFolderPageStateIsSearch(a3);
  if ([(SBFolderController *)self _isValidPageIndex:a4])
  {
    uint64_t v15 = [(SBRootFolderController *)self customViewControllerForPageIndex:a4];
    if (v15)
    {
      uint64_t v16 = v15;
      BOOL v17 = v12;
      int64_t v18 = [v15 view];
      [v18 setNeedsLayout];
      [v18 layoutIfNeeded];
      if (objc_opt_respondsToSelector()) {
        [v16 setContentVisibility:0];
      }

      BOOL v12 = v17;
    }
  }
  BOOL v19 = v7;
  BOOL v20 = v6;
  [(SBRootFolderController *)self _anySearchVisibilityProgress];
  double v22 = v21;
  [(SBRootFolderController *)self _leadingCustomViewVisibilityProgress];
  double v24 = v23;
  [(SBRootFolderController *)self _trailingCustomViewVisibilityProgress];
  double v26 = v25;
  [v54 setPullDownSearchVisibilityProgress:v22];
  [v54 setLeadingCustomViewVisibilityProgress:v24];
  [v54 setTrailingCustomViewVisibilityProgress:v26];
  if ([(SBViewControllerTransitionContext *)self->_currentTransitionContext isTransitioning]
    && ![(SBViewControllerTransitionContext *)self->_currentTransitionContext isCancelled])
  {
    BOOL v27 = [(SBViewControllerTransitionContext *)self->_currentTransitionContext isInteractive];
    currentTransitionContext = self->_currentTransitionContext;
    if (v27) {
      [(SBViewControllerTransitionContext *)currentTransitionContext cancelInteractiveTransition];
    }
    else {
      [(SBViewControllerTransitionContext *)currentTransitionContext cancelTransition];
    }
  }
  int v29 = IsSearch ^ v14;
  id v30 = [(SBRootFolderController *)self accessoryViewControllerDelegate];
  uint64_t v31 = [v30 rootFolderController:self transitionContextForTransitioningToState:a3 animated:v19 interactive:v20];

  if (v31)
  {
    [v54 setShiftsPullDownSearchForVisibility:0];
    int v32 = v29;
  }
  else
  {
    BOOL v49 = v14;
    BOOL v50 = v12;
    int v33 = v51 ^ v12;
    uint64_t v31 = [(SBRootFolderController *)self defaultTransitionForTransitioningFromPageState:v11 toPageState:a3 animated:v19 interactive:v20];
    [v54 setShiftsPullDownSearchForVisibility:v33 ^ 1u];
    int v32 = v29;
    if (v29)
    {
      int v34 = [(SBRootFolderController *)self searchPresentableViewController];

      if (!v34)
      {
        __int16 v35 = [v54 searchBackdropView];
        BOOL v36 = v35;
        if (a3 == 1 || v11 == 1) {
          [v35 prepareForTransitionToBlurred:v49];
        }
      }
    }
    if (v33)
    {
      __int16 v37 = [v54 leadingCustomBackdropView];
      [v37 prepareForTransitionToBlurred:v50];
    }
    if (v52 != v53)
    {
      BOOL v38 = [v54 trailingCustomBackdropView];
      [v38 prepareForTransitionToBlurred:v53];
    }
  }
  [(SBViewControllerTransitionContext *)v31 setDelegate:self];
  uint64_t v39 = NSString;
  v40 = SBStringForRootFolderPageState(v11);
  v41 = SBStringForRootFolderPageState(a3);
  long long v42 = [v39 stringWithFormat:@"PageStateTransition %@ -> %@", v40, v41];
  long long v43 = [(SBFolderController *)self cancelTouchesForAllCustomIconImageViewControllersForReason:v42];

  long long v44 = [(SBRootFolderController *)self currentTransitionHandle];
  [v44 setCustomIconImageViewControllerCancelTouchesAssertion:v43];

  long long v45 = objc_alloc_init(SBRootFolderControllerTransitionInfo);
  [(SBRootFolderControllerTransitionInfo *)v45 setSourcePageState:v11];
  [(SBRootFolderControllerTransitionInfo *)v45 setDestinationPageState:a3];
  [(SBViewControllerTransitionContext *)v31 setUserInfo:v45];
  long long v46 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v46 rootFolderController:self willUseTransitionContext:v31 toTransitionToState:a3];
  }
  if (v32) {
    [v54 setSearchHidden:0];
  }
  long long v47 = self->_currentTransitionContext;
  self->_currentTransitionContext = v31;
  long long v48 = v31;

  [(SBViewControllerTransitionContext *)v48 startTransition];
}

- (void)didContinueTransitionToState:(int64_t)a3 progress:(double)a4
{
  BOOL v7 = [(SBRootFolderController *)self rootFolderView];
  int64_t v8 = [(SBRootFolderController *)self pageState];
  [(SBRootFolderController *)self _anySearchVisibilityProgress];
  double v10 = v9;
  [(SBRootFolderController *)self _leadingCustomViewVisibilityProgress];
  double v12 = v11;
  [(SBRootFolderController *)self _trailingCustomViewVisibilityProgress];
  double v14 = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SBRootFolderController_didContinueTransitionToState_progress___block_invoke;
  aBlock[3] = &__block_descriptor_56_e33_v24__0q8__SBSearchBackdropView_16l;
  void aBlock[4] = v8;
  void aBlock[5] = a3;
  *(double *)&aBlock[6] = a4;
  uint64_t v15 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  uint64_t v16 = [(SBRootFolderController *)self searchPresentableViewController];
  if (!v16)
  {
    BOOL v17 = self;
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
    uint64_t v16 = [v7 searchBackdropView];
    v15[2](v15, 1, v16);
  }

LABEL_5:
  BOOL v19 = [v7 leadingCustomBackdropView];
  v15[2](v15, 2, v19);

  BOOL v20 = [v7 trailingCustomBackdropView];
  v15[2](v15, 4, v20);

  [v7 setPullDownSearchVisibilityProgress:v10];
  [v7 setLeadingCustomViewVisibilityProgress:v12];
  [v7 setTrailingCustomViewVisibilityProgress:v14];
  if ([(SBViewControllerTransitionContext *)self->_currentTransitionContext isInteractive]) {
    [(SBViewControllerTransitionContext *)self->_currentTransitionContext updateInteractiveTransition:a4];
  }
}

void __64__SBRootFolderController_didContinueTransitionToState_progress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32) == a2 || *(void *)(a1 + 40) == a2)
  {
    id v6 = v5;
    [v5 setTransitionProgress:*(double *)(a1 + 48)];
    id v5 = v6;
  }
}

- (void)willEndTransitionToState:(int64_t)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(SBRootFolderController *)self rootFolderView];
  int64_t v8 = [(SBRootFolderController *)self pageState];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SBRootFolderController_willEndTransitionToState_successfully___block_invoke;
  aBlock[3] = &__block_descriptor_49_e33_v24__0q8__SBSearchBackdropView_16l;
  void aBlock[4] = v8;
  void aBlock[5] = a3;
  BOOL v20 = v4;
  double v9 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  double v10 = [(SBRootFolderController *)self searchPresentableViewController];
  if (v10) {
    goto LABEL_4;
  }
  double v11 = self;
  uint64_t isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v10 = [v7 searchBackdropView];
    v9[2](v9, 1, v10);
LABEL_4:
  }
  double v13 = [v7 leadingCustomBackdropView];
  v9[2](v9, 2, v13);

  double v14 = [v7 trailingCustomBackdropView];
  v9[2](v9, 4, v14);

  if ([(SBViewControllerTransitionContext *)self->_currentTransitionContext isTransitioning]
    && ![(SBViewControllerTransitionContext *)self->_currentTransitionContext isCancelled])
  {
    BOOL v17 = [(SBViewControllerTransitionContext *)self->_currentTransitionContext isInteractive];
    currentTransitionContext = self->_currentTransitionContext;
    if (v17)
    {
      if (v4) {
        [(SBViewControllerTransitionContext *)currentTransitionContext finishInteractiveTransition];
      }
      else {
        [(SBViewControllerTransitionContext *)currentTransitionContext cancelInteractiveTransition];
      }
    }
    else if (v4)
    {
      if (![(SBViewControllerTransitionContext *)currentTransitionContext isAnimated]) {
        [(SBViewControllerTransitionContext *)self->_currentTransitionContext completeTransition:1];
      }
    }
    else
    {
      [(SBViewControllerTransitionContext *)currentTransitionContext cancelTransition];
    }
  }
  uint64_t v15 = [(SBRootFolderController *)self currentTransitionHandle];
  uint64_t v16 = [v15 customIconImageViewControllerCancelTouchesAssertion];
  [v16 invalidate];

  [v15 setCustomIconImageViewControllerCancelTouchesAssertion:0];
}

void __64__SBRootFolderController_willEndTransitionToState_successfully___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32) == a2 || *(void *)(a1 + 40) == a2)
  {
    double v6 = 1.0;
    if (!*(unsigned char *)(a1 + 48)) {
      double v6 = 0.0;
    }
    id v7 = v5;
    [v5 setTransitionProgress:v6];
    [v7 completeIncrementalTransitionSuccessfully:*(unsigned __int8 *)(a1 + 48)];
    [v7 completeTransitionSuccessfully:*(unsigned __int8 *)(a1 + 48)];
    id v5 = v7;
  }
}

- (void)didEndTransitionFromState:(int64_t)a3 pageIndex:(int64_t)a4 toState:(int64_t)a5 pageIndex:(int64_t)a6 successfully:(BOOL)a7
{
  BOOL v7 = a7;
  id v25 = [(SBRootFolderController *)self rootFolderView];
  [(SBRootFolderController *)self _checkForImproperScrollOffsetForPageState];
  [v25 setNeedsLayout];
  if (a3 == 1 && a5 != 1 && v7)
  {
    double v13 = [(SBRootFolderController *)self searchGesture];
    [v13 resetAnimated:0];
  }
  BOOL v14 = !v7;
  if (v7) {
    int64_t v15 = a5;
  }
  else {
    int64_t v15 = a3;
  }
  if (v7) {
    int64_t v16 = a6;
  }
  else {
    int64_t v16 = a4;
  }
  if (!v14) {
    a6 = a4;
  }
  [v25 setSearchHidden:!SBRootFolderPageStateIsSearch(v15)];
  [(SBRootFolderController *)self _anySearchVisibilityProgress];
  double v18 = v17;
  [(SBRootFolderController *)self _leadingCustomViewVisibilityProgress];
  double v20 = v19;
  [(SBRootFolderController *)self _trailingCustomViewVisibilityProgress];
  double v22 = v21;
  [v25 setPullDownSearchVisibilityProgress:v18];
  [v25 setLeadingCustomViewVisibilityProgress:v20];
  [v25 setTrailingCustomViewVisibilityProgress:v22];
  if ([(SBFolderController *)self _isValidPageIndex:v16])
  {
    double v23 = [(SBRootFolderController *)self customViewControllerForPageIndex:v16];
  }
  else
  {
    double v23 = 0;
  }
  if ([(SBFolderController *)self _isValidPageIndex:a6])
  {
    double v24 = [(SBRootFolderController *)self customViewControllerForPageIndex:a6];
  }
  else
  {
    double v24 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v24 setContentVisibility:2];
  }
  if (objc_opt_respondsToSelector()) {
    [v23 setContentVisibility:0];
  }
}

- (void)pageTransitionHandle:(id)a3 updateCurrentPageStateTransitionToProgress:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBRootFolderController *)self currentTransitionHandle];

  int64_t v8 = SBLogRootController();
  double v9 = v8;
  if (v7 == v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = a4;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Update page state transition to progress %f", buf, 0xCu);
    }

    int64_t v10 = [(SBRootFolderController *)self destinationPageState];
    [(SBRootFolderController *)self didContinueTransitionToState:v10 progress:a4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__SBRootFolderController_pageTransitionHandle_updateCurrentPageStateTransitionToProgress___block_invoke;
    v11[3] = &unk_1E6AAD0A8;
    v11[4] = self;
    v11[5] = v10;
    *(double *)&v11[6] = a4;
    [(SBRootFolderController *)self enumeratePageStateObserversUsingBlock:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBRootFolderController pageTransitionHandle:updateCurrentPageStateTransitionToProgress:]((uint64_t)v6, v9);
    }
  }
}

uint64_t __90__SBRootFolderController_pageTransitionHandle_updateCurrentPageStateTransitionToProgress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) didContinueTransitionToState:*(void *)(a1 + 40) progress:*(double *)(a1 + 48)];
}

- (void)pageTransitionHandle:(id)a3 endPageStateTransitionSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBRootFolderController *)self currentTransitionHandle];
  if (v7 == v6)
  {
    uint64_t v9 = [(SBRootFolderController *)self destinationPageState];
    int64_t v10 = [(SBRootFolderController *)self pageState];
    double v11 = SBLogRootController();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = SBStringForRootFolderPageState(v9);
      *(_DWORD *)buf = 138543618;
      double v18 = v12;
      __int16 v19 = 1024;
      BOOL v20 = v4;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "End page state transition to state \"%{public}@\" successfully: %{BOOL}u", buf, 0x12u);
    }
    [(SBRootFolderController *)self willEndTransitionToState:v9 successfully:v4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke;
    v15[3] = &unk_1E6AAD0D0;
    v15[4] = self;
    v15[5] = v9;
    BOOL v16 = v4;
    [(SBRootFolderController *)self enumeratePageStateObserversUsingBlock:v15];
    if (v4) {
      [(SBRootFolderController *)self setPageState:v9];
    }
    [v6 setValid:0];
    [(SBRootFolderController *)self setCurrentTransitionHandle:0];
    -[SBRootFolderController didEndTransitionFromState:pageIndex:toState:pageIndex:successfully:](self, "didEndTransitionFromState:pageIndex:toState:pageIndex:successfully:", v10, [v6 sourcePageIndex], v9, objc_msgSend(v6, "destinationPageIndex"), v4);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke_2;
    v13[3] = &unk_1E6AAD0F8;
    v13[4] = self;
    void v13[5] = v10;
    v13[6] = v9;
    BOOL v14 = v4;
    [(SBRootFolderController *)self enumeratePageStateObserversUsingBlock:v13];
  }
  else
  {
    int64_t v8 = SBLogRootController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBRootFolderController pageTransitionHandle:endPageStateTransitionSuccessfully:]((uint64_t)v6, v8);
    }
  }
}

uint64_t __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) willEndTransitionToState:*(void *)(a1 + 40) successfully:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) didEndTransitionFromState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48) successfully:*(unsigned __int8 *)(a1 + 56)];
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  BOOL v5 = a4;
  id v6 = a3;
  if ([(SBRootFolderController *)self canTransitionPageStateToState:v5])
  {
    id v7 = [(SBRootFolderController *)self beginPageStateTransitionToState:v5 reason:@"search gesture started" animated:1 interactive:1];
    [(SBRootFolderController *)self setSearchGestureTransition:v7];
  }
  id v14 = [(SBFolderController *)self currentIconListView];
  [v6 locationInView:v14];
  double v9 = v8;
  double v11 = v10;

  double v12 = objc_msgSend(v14, "iconAtPoint:index:", 0, v9, v11);
  double v13 = [v14 displayedIconViewForIcon:v12];
  if (v12) {
    [(SBRootFolderController *)self _cancelTouchesForSearchGestureOnIconView:v13];
  }
}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  id v8 = [(SBRootFolderController *)self searchGestureTransition];
  if (v8)
  {
    int64_t v6 = [(SBRootFolderController *)self destinationPageState];
    double v7 = 1.0 - a4;
    if (v6 == 1) {
      double v7 = a4;
    }
    [v8 setTransitionProgress:v7];
  }
}

- (void)searchGesture:(id)a3 completedShowing:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  int64_t v6 = [(SBRootFolderController *)self searchGestureTransition];
  if (v6)
  {
    objc_msgSend(v6, "endTransitionSuccessfully:", (-[SBRootFolderController destinationPageState](self, "destinationPageState") != 1) ^ v4);
    [(SBRootFolderController *)self setSearchGestureTransition:0];
  }
  else
  {
    [v7 resetAnimated:0];
  }
  [(SBRootFolderController *)self _invalidateSearchGestureIconViewTouchCancellationAssertion];
}

- (void)searchGesture:(id)a3 resetAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(SBRootFolderController *)self isTransitioningPageState])
  {
    if ([(SBRootFolderController *)self pageState] == 1
      && [(SBRootFolderController *)self canTransitionPageStateToState:0])
    {
      int64_t v6 = [(SBRootFolderController *)self beginPageStateTransitionToState:0 reason:@"search gesture reset" animated:v4 interactive:1];
      [(SBRootFolderController *)self setSearchGestureTransition:v6];
    }
    if (![(SBRootFolderController *)self isLeadingCustomViewVisible])
    {
      [(SBRootFolderController *)self _leadingCustomViewVisibilityProgress];
      if (v7 > 0.0)
      {
        int64_t v8 = [(SBFolderController *)self firstIconPageIndex];
        [(SBRootFolderController *)self setCurrentPageIndex:v8 animated:v4];
      }
    }
  }
}

- (void)_cancelTouchesForSearchGestureOnIconView:(id)a3
{
  id v4 = a3;
  [(SBRootFolderController *)self _invalidateSearchGestureIconViewTouchCancellationAssertion];
  id v7 = [v4 customIconImageViewController];

  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v7 cancelTouchesForCurrentEventInHostedContent];
    searchGestureIconViewTouchCancellationAssertion = self->_searchGestureIconViewTouchCancellationAssertion;
    self->_searchGestureIconViewTouchCancellationAssertion = v5;
  }
}

- (void)_invalidateSearchGestureIconViewTouchCancellationAssertion
{
  searchGestureIconViewTouchCancellationAssertion = self->_searchGestureIconViewTouchCancellationAssertion;
  if (searchGestureIconViewTouchCancellationAssertion)
  {
    [(BSInvalidatable *)searchGestureIconViewTouchCancellationAssertion invalidate];
    id v4 = self->_searchGestureIconViewTouchCancellationAssertion;
    self->_searchGestureIconViewTouchCancellationAssertion = 0;
  }
}

- (void)transitionWillReverse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  id v4 = a3;
  [(SBNestingViewController *)&v6 transitionWillReverse:v4];
  BOOL v5 = [(SBRootFolderController *)self accessoryViewControllerDelegate];
  [v5 rootFolderController:self transitionWillReverse:v4];
}

- (id)defaultTransitionForTransitioningFromPageState:(int64_t)a3 toPageState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double v10 = -[SBRootFolderController viewControllerForTransitioningFromPageState:toPageState:](self, "viewControllerForTransitioningFromPageState:toPageState:", a3);
  if (v10)
  {
    if (a4)
    {
      double v11 = [(SBRootFolderController *)self animationControllerForPresentedController:v10 presentingController:0 sourceController:0];
      double v12 = 0;
      if (v11 && v6 && v7)
      {
        uint64_t v13 = [(SBRootFolderController *)self interactionControllerForPresentation:v11];
LABEL_12:
        double v12 = (void *)v13;
      }
    }
    else
    {
      double v11 = [(SBRootFolderController *)self animationControllerForDismissedController:v10];
      double v12 = 0;
      if (v11 && v6 && v7)
      {
        uint64_t v13 = [(SBRootFolderController *)self interactionControllerForDismissal:v11];
        goto LABEL_12;
      }
    }
    id v14 = objc_alloc_init(SBRootFolderControllerDefaultTransitionContext);
    [(SBViewControllerTransitionContext *)v14 setDelegate:self];
    int64_t v15 = [(SBRootFolderController *)self rootFolderView];
    [(SBViewControllerTransitionContext *)v14 setContainerView:v15];

    [(SBViewControllerTransitionContext *)v14 setAnimator:v11];
    [(SBViewControllerTransitionContext *)v14 setInteractor:v12];
    [(SBViewControllerTransitionContext *)v14 setWantsAnimation:v7];
    BOOL v16 = (void *)MEMORY[0x1E4FB30B8];
    if (a4)
    {
      BOOL v16 = (void *)MEMORY[0x1E4FB30C8];
      double v17 = (void *)MEMORY[0x1E4FB30D0];
    }
    else
    {
      double v17 = (void *)MEMORY[0x1E4FB30C0];
    }
    [(SBViewControllerTransitionContext *)v14 setViewController:v10 forKey:*v16];
    double v18 = [v10 view];
    [(SBViewControllerTransitionContext *)v14 setView:v18 forKey:*v17];

    goto LABEL_17;
  }
  id v14 = 0;
LABEL_17:

  return v14;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  BOOL v6 = objc_alloc_init(SBFramewiseInteractiveTransitionAnimator);
  [(SBFramewiseInteractiveTransitionAnimator *)v6 setDelegate:self];
  [(SBFramewiseInteractiveTransitionAnimator *)v6 setPresenting:1];
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = objc_alloc_init(SBFramewiseInteractiveTransitionAnimator);
  [(SBFramewiseInteractiveTransitionAnimator *)v4 setDelegate:self];
  [(SBFramewiseInteractiveTransitionAnimator *)v4 setPresenting:0];
  return v4;
}

- (id)interactionControllerForPresentation:(id)a3
{
  int64_t v3 = objc_alloc_init(SBPercentPassthroughInteractiveTransition);
  return v3;
}

- (id)interactionControllerForDismissal:(id)a3
{
  int64_t v3 = objc_alloc_init(SBPercentPassthroughInteractiveTransition);
  return v3;
}

- (id)dockIconListView
{
  if ([(SBRootFolderController *)self isDockExternal])
  {
    int64_t v3 = [(SBFolderController *)self folderDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 externalDockIconListViewForRootFolderController:self];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRootFolderController;
    id v4 = [(SBFolderController *)&v6 dockIconListView];
  }
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderController;
  id v4 = [(SBFolderController *)&v12 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderController isDockExternal](self, "isDockExternal"), @"isDockExternal");
  id v6 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBRootFolderController dockEdge](self, "dockEdge"), @"dockEdge");
  BOOL v7 = SBStringForRootFolderPageState([(SBRootFolderController *)self pageState]);
  id v8 = (id)[v4 appendObject:v7 withName:@"pageState"];

  double v9 = [(SBRootFolderController *)self currentTransitionHandle];
  id v10 = (id)[v4 appendObject:v9 withName:@"currentPageStateTransition" skipIfNil:1];

  return v4;
}

- (unint64_t)presenterType
{
  int64_t v3 = [(SBFolderController *)self folderDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 widgetSheetPresenterTypeForRootFolderController:self];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isDisplayingEditingButtons
{
  int64_t v3 = [(SBRootFolderController *)self rootFolderView];
  if ([v3 showsDoneButton])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(SBRootFolderController *)self rootFolderView];
    char v4 = [v5 showsAddWidgetButton];
  }
  return v4;
}

- (void)setSuppressesEditingStateForListView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBRootFolderController *)self rootFolderView];
  [v4 setSuppressesEditingStateForListViews:v3];
}

- (double)titledButtonsAlpha
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  [v2 titledButtonsAlpha];
  double v4 = v3;

  return v4;
}

- (void)setTitledButtonsAlpha:(double)a3
{
  id v4 = [(SBRootFolderController *)self rootFolderView];
  [v4 setTitledButtonsAlpha:a3];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = ((v5 & 1) == 0
      || ![(SBRootFolderController *)self isAnySearchVisibleOrTransitioning])
     && [(SBRootFolderController *)self isDisplayingIcon:v8 inLocation:v9];

  return v10;
}

- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  BOOL v7 = ((v4 & 1) == 0
     || ![(SBRootFolderController *)self isAnySearchVisibleOrTransitioning])
    && [(SBRootFolderController *)self isDisplayingIcon:v6];

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if ((a4 & 1) != 0
    && [(SBRootFolderController *)self isAnySearchVisibleOrTransitioning])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBRootFolderController;
    BOOL v7 = [(SBFolderController *)&v9 firstIconViewForIcon:v6 options:a4];
  }

  return v7;
}

- (void)_doPageManagementEducation
{
  id v2 = [(SBRootFolderController *)self rootFolderView];
  [v2 _doPageManagementEducation];
}

- (void)setPageState:(int64_t)a3
{
  self->_pageState = a3;
}

- (BOOL)showsDoneButtonWhileEditing
{
  return self->_showsDoneButtonWhileEditing;
}

- (unint64_t)showsAddWidgetButtonWhileEditingAllowedOrientations
{
  return self->_showsAddWidgetButtonWhileEditingAllowedOrientations;
}

- (BOOL)suppressesExtraEditingButtons
{
  return self->_suppressesExtraEditingButtons;
}

- (SBHMainAddSheetViewControlling)addSheetViewController
{
  return self->_addSheetViewController;
}

- (void)setAddSheetViewController:(id)a3
{
}

- (UIViewController)pullDownSearchViewController
{
  return self->_pullDownSearchViewController;
}

- (NSArray)leadingCustomViewControllers
{
  return self->_leadingCustomViewControllers;
}

- (NSArray)trailingCustomViewControllers
{
  return self->_trailingCustomViewControllers;
}

- (void)setSearchGesture:(id)a3
{
}

- (void)setAccessoryViewControllerDelegate:(id)a3
{
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

- (void)setTodayViewPageHidden:(BOOL)a3
{
  self->_todayViewPageHidden = a3;
}

- (BOOL)managesStatusBarWidth
{
  return self->_managesStatusBarWidth;
}

- (void)setManagesStatusBarWidth:(BOOL)a3
{
  self->_managesStatusBarWidth = a3;
}

- (BSInvalidatable)searchGestureIconViewTouchCancellationAssertion
{
  return self->_searchGestureIconViewTouchCancellationAssertion;
}

- (void)setSearchGestureIconViewTouchCancellationAssertion:(id)a3
{
}

- (void)setCurrentTransitionHandle:(id)a3
{
}

- (SBRootFolderPageTransition)searchGestureTransition
{
  return self->_searchGestureTransition;
}

- (void)setSearchGestureTransition:(id)a3
{
}

- (void)setImplicitScrollTransition:(id)a3
{
}

- (SBHRecentsDocumentExtensionProvider)recentsDocumentExtensionProvider
{
  return self->_recentsDocumentExtensionProvider;
}

- (void)setRecentsDocumentExtensionProvider:(id)a3
{
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (SBHStackConfigurationViewController)stackConfigurationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackConfigurationViewController);
  return (SBHStackConfigurationViewController *)WeakRetained;
}

- (void)setStackConfigurationViewController:(id)a3
{
}

- (SBHSearchPresentable)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (unint64_t)hiddenListCountWhenPageManagementPresented
{
  return self->_hiddenListCountWhenPageManagementPresented;
}

- (void)setHiddenListCountWhenPageManagementPresented:(unint64_t)a3
{
  self->_hiddenListCountWhenPageManagementPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_destroyWeak((id *)&self->_stackConfigurationViewController);
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_recentsDocumentExtensionProvider, 0);
  objc_storeStrong((id *)&self->_implicitScrollTransition, 0);
  objc_storeStrong((id *)&self->_searchGestureTransition, 0);
  objc_storeStrong((id *)&self->_currentTransitionHandle, 0);
  objc_storeStrong((id *)&self->_searchGestureIconViewTouchCancellationAssertion, 0);
  objc_destroyWeak((id *)&self->_accessoryViewControllerDelegate);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_trailingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_leadingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_pullDownSearchViewController, 0);
  objc_storeStrong((id *)&self->_addSheetViewController, 0);
  objc_storeStrong((id *)&self->_showDoneButtonAssertions, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetObservers, 0);
  objc_storeStrong((id *)&self->_pageStateObservers, 0);
  objc_storeStrong((id *)&self->_currentTransitionInteractor, 0);
  objc_storeStrong((id *)&self->_currentTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_currentTransitionContext, 0);
}

- (void)pageTransitionHandle:(uint64_t)a1 updateCurrentPageStateTransitionToProgress:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Trying to update a transition without the current transition handle: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)pageTransitionHandle:(uint64_t)a1 endPageStateTransitionSuccessfully:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Trying to end a transition without the current transition handle: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end