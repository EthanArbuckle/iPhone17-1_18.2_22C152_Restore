@interface SBHTodayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isViewVisibleInScrollViewSpace:(id)a3;
- (BOOL)_isWidgetHitTestingDisabled;
- (BOOL)_shouldIconViewForbidJiggling:(id)a3;
- (BOOL)_shouldKeepIconImageViewControllersStatic;
- (BOOL)enableEditingModeWhenScrollEnds;
- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4;
- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isOverlayViewDisappearing;
- (BOOL)isOverridingViewControllerAppearanceStateToRemainDisappeared;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isSpotlightVisible;
- (BOOL)needsToManageTopInset;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldAnimateFirstTwoViewsAsOne;
- (BOOL)shouldAnimateLastTwoViewsAsOne;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldBeIndicatedInPageControl;
- (BOOL)shouldShowAddWidgetButtonWhenEditing;
- (BOOL)shouldShowDoneButtonWhenEditing;
- (BOOL)suppressesEditingStateForListViews;
- (BOOL)widgetsAreCenteredForFullScreen;
- (CGPoint)_interactiveSpotlightDraggingBeginPoint;
- (CGPoint)scrollingBeginningOffset;
- (CGRect)_cellFrameInScrollBoundsForCell:(id)a3;
- (CGRect)_suggestedTodayViewFrameForBounds:(CGRect)a3;
- (CGSize)_iconSpacingForIconListViews;
- (MTMaterialView)legacyListPlatterView;
- (NSHashTable)observers;
- (NSHashTable)viewControllerAppearStateOverrideAssertions;
- (NSLayoutConstraint)listViewMinimumHeightConstraint;
- (NSLayoutConstraint)listViewMinimumWidthConstraint;
- (NSLayoutConstraint)scrollViewLeadingConstraint;
- (NSLayoutConstraint)scrollViewTrailingConstraint;
- (NSLayoutConstraint)stackViewToScrollViewBottomConstraint;
- (NSLayoutConstraint)stackViewToScrollViewLeadingConstraint;
- (NSLayoutConstraint)stackViewToScrollViewTopConstraint;
- (NSLayoutConstraint)stackViewToScrollViewTrailingConstraint;
- (NSMapTable)onScreenIconIndexRangeByIconListView;
- (NSMutableArray)scrollViewDidEndScrollingHandlers;
- (NSMutableDictionary)cancelTouchesAssertionsByLegacyWidgetID;
- (NSMutableDictionary)cancelTouchesAssertionsByWidgetID;
- (NSMutableSet)suspendVisibleRowRangeUpdatesReasons;
- (NSMutableSet)widgetHitTestingDisabledReasons;
- (NSSet)presentedIconLocations;
- (NSString)iconLocation;
- (SBFOverlayDismissalDelegate)dismissalDelegate;
- (SBFTouchPassThroughView)spotlightContainerView;
- (SBHIconManager)iconManager;
- (SBHScrollableIconViewInteraction)scrollingInteraction;
- (SBHTodayIconListLayoutDelegate)listLayoutDelegate;
- (SBHTodayViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 legacyWidgetListViewController:(id)a5 location:(int64_t)a6;
- (SBHTodayViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 location:(int64_t)a5;
- (SBHTodayViewControllerDelegate)delegate;
- (SBHWidgetSettings)widgetSettings;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListView)listView;
- (SBIconViewProviding)iconViewProvider;
- (SBRootFolder)rootFolder;
- (UIEdgeInsets)_effectiveLayoutInsets;
- (UIEdgeInsets)visibleContainerInsets;
- (UIScrollView)scrollView;
- (UIStackView)stackView;
- (UIView)carouselReferenceForLegacyWidgetListView;
- (UIView)legacyListContainerView;
- (UIViewController)containerViewController;
- (UIViewController)legacyWidgetListViewController;
- (_UILegibilitySettings)effectiveLegibilitySettings;
- (_UILegibilitySettings)legibilitySettings;
- (_UILegibilitySettings)overrideLegibilitySettings;
- (double)firstWidgetTopOffset;
- (double)mostRecentPresentationProgress;
- (double)scrollPageOffsetForButtonsInEditingMode;
- (double)searchBarTopOffset;
- (double)widgetsLeadingOffset;
- (id)_majorScrollView;
- (id)_widgetIconViewAtLocation:(CGPoint)a3;
- (id)beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason:(id)a3;
- (id)cancelTouchesOnIconViews;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)extraViews;
- (id)extraViewsContainers;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4;
- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5;
- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)keepIconImageViewControllersStaticForReason:(id)a3;
- (id)listModel;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)layoutOrientation;
- (int64_t)location;
- (unint64_t)_indexForNextWidgetInListViewAfterContentOffset:(double)a3;
- (unint64_t)contentVisibility;
- (void)_beginSuspendingVisibleRowRangeUpdatesForReason:(id)a3;
- (void)_cancelTouchesForHitTestedWidgetInScrollView:(id)a3;
- (void)_cancelTouchesForWidgetIconView:(id)a3;
- (void)_endSuspendingVisibleRowRangeUpdatesForReason:(id)a3;
- (void)_removeIconImageViewControllerKeepStaticAssertion:(id)a3;
- (void)_scrollViewDidEndScrolling;
- (void)_setUpIconListViewLayoutDelegates;
- (void)_setUpIconListViews;
- (void)_setUpScrollView;
- (void)_setupStateCapture;
- (void)_toggleListVisibilityWithEditing:(BOOL)a3;
- (void)_updateEditingStateAnimated:(BOOL)a3;
- (void)_updateEditingStateForListView:(id)a3;
- (void)_updateIconListSpacing;
- (void)_updateListLayoutAdditionalInsets;
- (void)_updateListViewLayoutAnimated:(BOOL)a3;
- (void)_updatePresentationModeForIconViews;
- (void)_updateRevealStateAnimated:(BOOL)a3;
- (void)_updateScrollViewContentSize;
- (void)_updateSubviewOrderingForListViews;
- (void)_updateTouchInsets;
- (void)_updateVisibleRowRangeForListView:(id)a3;
- (void)_updateVisibleRowRangeForListViews;
- (void)_updateVisiblySettledForIconViews;
- (void)_updateVisiblySettledForIconViewsInListView:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginDisablingWidgetHitTestingForReason:(id)a3;
- (void)cancelTouchesForAllWidgets;
- (void)cleanupViews;
- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4;
- (void)dealloc;
- (void)endDisablingWidgetHitTestingForReason:(id)a3;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateScrollableIconViewsUsingBlock:(id)a3;
- (void)enumerateWidgetIconViewsUsingBlock:(id)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didMoveIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4;
- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4;
- (void)iconListView:(id)a3 performIconDrop:(id)a4;
- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4;
- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)iconViewWillDismissContextMenu:(id)a3;
- (void)iconViewWillPresentContextMenu:(id)a3;
- (void)invalidateAllCancelTouchesAssertions;
- (void)layoutIconListViewWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)loadView;
- (void)noteIconViewWillZoomDown:(id)a3;
- (void)removeFromParentViewController;
- (void)removeObserver:(id)a3;
- (void)scrollIconToVisible:(id)a3 atPosition:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCancelTouchesAssertionsByLegacyWidgetID:(id)a3;
- (void)setCancelTouchesAssertionsByWidgetID:(id)a3;
- (void)setCarouselReferenceForLegacyWidgetListView:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEnableEditingModeWhenScrollEnds:(BOOL)a3;
- (void)setIconLocation:(id)a3;
- (void)setIconManager:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setIsOverlayViewDisappearing:(BOOL)a3;
- (void)setLegacyListContainerView:(id)a3;
- (void)setLegacyListPlatterView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutDelegate:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setListView:(id)a3;
- (void)setListViewMinimumHeightConstraint:(id)a3;
- (void)setListViewMinimumWidthConstraint:(id)a3;
- (void)setMostRecentPresentationProgress:(double)a3;
- (void)setObservers:(id)a3;
- (void)setOverrideLegibilitySettings:(id)a3;
- (void)setRevealed:(BOOL)a3;
- (void)setRootFolder:(id)a3;
- (void)setScrollViewDidEndScrollingHandlers:(id)a3;
- (void)setScrollViewLeadingConstraint:(id)a3;
- (void)setScrollViewTrailingConstraint:(id)a3;
- (void)setScrollingBeginningOffset:(CGPoint)a3;
- (void)setScrollingInteraction:(id)a3;
- (void)setSpotlightContainerView:(id)a3;
- (void)setSpotlightVisible:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewToScrollViewLeadingConstraint:(id)a3;
- (void)setStackViewToScrollViewTrailingConstraint:(id)a3;
- (void)setSuppressesEditingStateForListViews:(BOOL)a3;
- (void)setSuspendVisibleRowRangeUpdatesReasons:(id)a3;
- (void)setViewControllerAppearStateOverrideAssertions:(id)a3;
- (void)setVisuallyRevealed:(BOOL)a3 animated:(BOOL)a4;
- (void)setWidgetHitTestingDisabledReasons:(id)a3;
- (void)setWidgetSettings:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateViewsWithLegibilitySettings;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SBHTodayViewController

- (NSSet)presentedIconLocations
{
  v2 = [(SBHTodayViewController *)self iconLocation];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];

  return (NSSet *)v3;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBHTodayViewController *)self iconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [(SBIconListView *)self->_listView model];
    char v11 = [v10 directlyContainsIcon:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (double)scrollPageOffsetForButtonsInEditingMode
{
  return 0.0;
}

- (void)viewWillLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v20 viewWillLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained isTodayViewRotating:self];

  if ((v4 & 1) == 0)
  {
    [(SBHTodayViewController *)self _effectiveLayoutInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = v9;
    if (v9 == 0.0)
    {
      v14 = objc_msgSend(MEMORY[0x1E4FB33B0], "sbh_displayEdgeInfoForScreenType:", 3);
      v15 = [v14 safeAreaInsetsPortrait];
      [v15 bottomInset];
      double v13 = v16;
    }
    -[UIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:", 0.0, 0.0, -v13, 0.0);
    v17 = [(SBHTodayViewController *)self view];
    [v17 setNeedsUpdateConstraints];

    [(NSLayoutConstraint *)self->_stackViewToScrollViewTopConstraint constant];
    if (v18 != v6 && [(SBHTodayViewController *)self needsToManageTopInset]) {
      [(NSLayoutConstraint *)self->_stackViewToScrollViewTopConstraint setConstant:v6];
    }
    [(NSLayoutConstraint *)self->_stackViewToScrollViewBottomConstraint constant];
    if (v19 != -v10) {
      -[NSLayoutConstraint setConstant:](self->_stackViewToScrollViewBottomConstraint, "setConstant:");
    }
    -[SBHTodayIconListLayoutDelegate setCarouselInsets:](self->_listLayoutDelegate, "setCarouselInsets:", v6, v8, v10, v12);
    [(SBHTodayViewController *)self _updateListLayoutAdditionalInsets];
    [(SBHTodayViewController *)self _updateTouchInsets];
    [(SBHTodayViewController *)self _updateScrollViewContentInset];
  }
}

- (BOOL)needsToManageTopInset
{
  v2 = [(SBHTodayViewController *)self iconLocation];
  char v3 = [v2 isEqualToString:@"SBIconLocationTodayViewOverlay"];

  return v3;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)_updateTouchInsets
{
  char v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v16 = [(SBHTodayViewController *)self view];
    double v5 = [v16 window];
    [(SBHTodayViewController *)self _effectiveLayoutInsets];
    [v5 bounds];
    [v16 bounds];
    objc_msgSend(v5, "convertRect:fromView:", v16);
    CGRectGetMaxY(v18);
    UIEdgeInsetsSubtract();
    UIEdgeInsetsMin();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    -[UIStackView _setTouchInsets:](self->_stackView, "_setTouchInsets:");
    -[UIScrollView _setTouchInsets:](self->_scrollView, "_setTouchInsets:", v7, v9, v11, v13);
    objc_msgSend(v16, "_setTouchInsets:", v7, v9, v11, v13);
    v14 = [(SBHTodayViewController *)self parentViewController];
    v15 = [v14 view];
    objc_msgSend(v15, "_setTouchInsets:", v7, v9, v11, v13);

    -[SBIconListView _setTouchInsets:](self->_listView, "_setTouchInsets:", 0.0, v9, 0.0, v13);
  }
}

- (void)_updateListLayoutAdditionalInsets
{
}

- (UIEdgeInsets)_effectiveLayoutInsets
{
  v2 = [(SBHTodayViewController *)self view];
  [v2 layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)shouldBeIndicatedInPageControl
{
  return 0;
}

- (id)cancelTouchesOnIconViews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SBHTodayViewController_cancelTouchesOnIconViews__block_invoke;
  v7[3] = &unk_1E6AAD830;
  id v8 = v3;
  id v4 = v3;
  [(SBHTodayViewController *)self enumerateWidgetIconViewsUsingBlock:v7];
  double v5 = [[_SBHTodayViewControllerCancelTouchesAssertion alloc] initWithAssertions:v4];

  return v5;
}

- (void)enumerateWidgetIconViewsUsingBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  double v5 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v5, "bs_safeAddObject:", self->_listView);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v6);
      }
      double v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__SBHTodayViewController_enumerateWidgetIconViewsUsingBlock___block_invoke;
      v11[3] = &unk_1E6AAE5A8;
      id v12 = v4;
      double v13 = &v18;
      [v10 enumerateIconViewsUsingBlock:v11];
      LOBYTE(v10) = *((unsigned char *)v19 + 24) == 0;

      if ((v10 & 1) == 0) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v18, 8);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v3 viewDidLayoutSubviews];
  [(SBHTodayViewController *)self _updateVisibleRowRangeForListViews];
  if ([(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isCarouselLayout]) {
    [(SBIconListView *)self->_listView setIconsNeedLayout];
  }
}

- (void)_updateVisibleRowRangeForListViews
{
}

- (void)_updateVisibleRowRangeForListView:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_suspendVisibleRowRangeUpdatesReasons count]) {
    goto LABEL_56;
  }
  double v5 = [v4 layoutDelegate];
  id v6 = [v4 layoutMetrics];
  v57 = [v6 listModel];
  uint64_t v7 = [v57 numberOfIcons];
  int v8 = [v5 isCarouselLayout];
  uint64_t v9 = [(SBHTodayViewController *)self view];
  [v9 bounds];
  objc_msgSend(v9, "convertRect:toView:", self->_scrollView);
  -[UIScrollView convertRect:toView:](self->_scrollView, "convertRect:toView:", v4);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  uint64_t v18 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v8 & 1) == 0)
  {
    uint64_t v20 = [v9 window];
    [v20 bounds];
    objc_msgSend(v20, "convertRect:toView:", self->_scrollView);
    -[UIScrollView convertRect:toView:](self->_scrollView, "convertRect:toView:", v4);
    CGFloat v13 = v21;
    CGFloat v17 = v22;
  }
  v56 = v9;
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v7)
  {
    int v35 = 1;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    int v36 = 1;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_41;
  }
  uint64_t v24 = 0;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v27 = [v4 coordinateForIconAtIndex:v24];
    if (v8)
    {
      if (v5) {
        objc_msgSend(v5, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", v27, v28, v6, 0);
      }
      if ((BSFloatIsZero() & 1) == 0)
      {
LABEL_11:
        if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v33 = v24;
        }
        else {
          uint64_t v33 = v26;
        }
        uint64_t v25 = v24;
        goto LABEL_17;
      }
    }
    else
    {
      [v4 rectForIconAtIndex:v24];
      v59.origin.x = v29;
      v59.origin.y = v30;
      v59.size.width = v31;
      v59.size.height = v32;
      v58.origin.x = v11;
      v58.origin.y = v13;
      v58.size.width = v15;
      v58.size.height = v17;
      if (CGRectIntersectsRect(v58, v59)) {
        goto LABEL_11;
      }
    }
    uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
    if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_22;
    }
LABEL_17:
    ++v24;
    uint64_t v26 = v33;
  }
  while (v7 != v24);
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  if (v33 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v55 = 1;
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }
  uint64_t v26 = v33;
LABEL_22:
  if (v26 <= 1) {
    uint64_t v37 = 1;
  }
  else {
    uint64_t v37 = v26;
  }
  [v4 coordinateForIconAtIndex:v37 - 1];
  int v55 = 0;
  uint64_t v34 = v38 - 1;
LABEL_26:
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
    int v35 = 1;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v25 + 1 < v7 - 1) {
      uint64_t v39 = v25 + 1;
    }
    else {
      uint64_t v39 = v7 - 1;
    }
    [v4 coordinateForIconAtIndex:v39];
    uint64_t v41 = v40;
    [v4 gridRangeForIconAtIndex:v39];
    if (v41 + v42 - 1 == 0x8000000000000000) {
      uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v43 = v34;
    }
    if (v41 + v42 - 1 == 0x8000000000000000) {
      uint64_t v44 = 0;
    }
    else {
      uint64_t v44 = v41 + v42 - 1 - v34;
    }
    int v35 = 0;
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v23 = v43;
      uint64_t v7 = v44;
    }
  }
  int v36 = v55;
LABEL_41:
  if (v23 != [v4 visibleRowRange] || v7 != v45)
  {
    objc_msgSend(v4, "setVisibleRowRange:", v23, v7);
    [v4 layoutIconsIfNeededWithAnimationType:1 options:0];
  }
  if (v35 | v36) {
    uint64_t v46 = 0;
  }
  else {
    uint64_t v46 = v25 - v26 + 1;
  }
  if (v35 | v36) {
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v47 = v26;
  }
  v48 = [(NSMapTable *)self->_onScreenIconIndexRangeByIconListView objectForKey:v4];
  uint64_t v49 = [v48 rangeValue];
  uint64_t v51 = v50;

  if (v47 != v49 || v46 != v51)
  {
    onScreenIconIndexRangeByIconListView = self->_onScreenIconIndexRangeByIconListView;
    v54 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v47, v46);
    [(NSMapTable *)onScreenIconIndexRangeByIconListView setObject:v54 forKey:v4];
  }
  [(SBHTodayViewController *)self _updateVisiblySettledForIconViewsInListView:v4];
  [(SBHTodayViewController *)self _updateEditingStateForListView:v4];

LABEL_56:
}

- (SBHTodayViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 legacyWidgetListViewController:(id)a5 location:(int64_t)a6
{
  return [(SBHTodayViewController *)self initWithListLayoutProvider:a3 iconViewProvider:a4 location:a6];
}

- (SBHTodayViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 location:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SBHTodayViewController;
  CGFloat v11 = [(SBHTodayViewController *)&v30 init];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_listLayoutProvider, a3);
    objc_storeWeak((id *)&v12->_iconViewProvider, v10);
    v12->_location = a5;
    objc_storeStrong((id *)&v12->_iconLocation, @"SBIconLocationTodayView");
    v12->_contentVisibility = 0;
    CGFloat v13 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v14 = [v13 widgetSettings];
    widgetSettings = v12->_widgetSettings;
    v12->_widgetSettings = (SBHWidgetSettings *)v14;

    [(PTSettings *)v12->_widgetSettings addKeyObserver:v12];
    double v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    if ((v17 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      uint64_t v18 = [(SBHScrollableIconViewInteraction *)[SBHScrollableZoomingIconViewInteraction alloc] initWithContainer:v12];
      scrollingInteraction = v12->_scrollingInteraction;
      v12->_scrollingInteraction = &v18->super;
    }
    uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v12 selector:sel_iconViewWillPresentContextMenu_ name:@"SBIconViewWillPresentContextMenuNotification" object:0];
    [v20 addObserver:v12 selector:sel_iconViewWillDismissContextMenu_ name:@"SBIconViewWillDismissContextMenuNotification" object:0];
    double v21 = [v9 layoutForIconLocation:@"SBIconLocationRoot"];
    if (objc_opt_respondsToSelector())
    {
      double v22 = [v21 sidebarVisualConfiguration];
    }
    else
    {
      double v22 = objc_alloc_init(SBHSidebarVisualConfiguration);
    }
    uint64_t v23 = v22;
    [(SBHSidebarVisualConfiguration *)v22 searchBarTopOffset];
    v12->_searchBarTopOffset = v24;
    [(SBHSidebarVisualConfiguration *)v23 firstWidgetTopOffset];
    v12->_firstWidgetTopOffset = v25;
    [(SBHSidebarVisualConfiguration *)v23 insets];
    v12->_widgetsLeadingOffset = v26;
    v12->_widgetsAreCenteredForFullScreen = [(SBHSidebarVisualConfiguration *)v23 isContentFullscreen];
    uint64_t v27 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconViewsForbiddenFromEditing = v12->_iconViewsForbiddenFromEditing;
    v12->_iconViewsForbiddenFromEditing = (NSHashTable *)v27;

    [(SBHTodayViewController *)v12 setViewRespectsSystemMinimumLayoutMargins:0];
    [(SBHTodayViewController *)v12 _setupStateCapture];
  }
  return v12;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCapture invalidate];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBIconViewWillPresentContextMenuNotification" object:0];
  [v3 removeObserver:self name:@"SBIconViewWillDismissContextMenuNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v4 dealloc];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v5 loadView];
  objc_super v3 = [(SBHTodayViewController *)self view];
  [v3 setPreservesSuperviewLayoutMargins:1];

  objc_super v4 = [MEMORY[0x1E4FB21E0] sharedInstanceForStyle:1];
  [(SBHTodayViewController *)self setOverrideLegibilitySettings:v4];

  [(SBHTodayViewController *)self _setUpScrollView];
  [(SBHTodayViewController *)self _setUpIconListViews];
  [(SBHTodayViewController *)self setRevealed:1];
  [(SBHTodayViewController *)self setVisuallyRevealed:1 animated:0];
}

- (void)_setUpScrollView
{
  v28[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SBHTodayViewController *)self view];
  objc_super v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  id v6 = [(UIScrollView *)self->_scrollView layer];
  [v6 setHitTestsAsOpaque:1];

  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setClipsToBounds:0];
  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setDelaysContentTouches:0];
  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  [v3 addSubview:self->_scrollView];
  double v7 = 0.0;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        double v7 = 0.0;
      }
      else {
        double v7 = 29.0;
      }
    }
    else
    {
      int v8 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v8 userInterfaceIdiom] == 1) {
        double v7 = 0.0;
      }
      else {
        double v7 = 29.0;
      }
    }
  }
  scrollViewLeadingConstraint = self->_scrollViewLeadingConstraint;
  if (!scrollViewLeadingConstraint)
  {
    id v10 = [(UIScrollView *)self->_scrollView leadingAnchor];
    CGFloat v11 = [v3 leadingAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    CGFloat v13 = self->_scrollViewLeadingConstraint;
    self->_scrollViewLeadingConstraint = v12;

    uint64_t v14 = [(UIScrollView *)self->_scrollView trailingAnchor];
    CGFloat v15 = [v3 trailingAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];
    scrollViewTrailingConstraint = self->_scrollViewTrailingConstraint;
    self->_scrollViewTrailingConstraint = v16;

    scrollViewLeadingConstraint = self->_scrollViewLeadingConstraint;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v19 = self->_scrollViewTrailingConstraint;
  v28[0] = scrollViewLeadingConstraint;
  v28[1] = v19;
  uint64_t v20 = [v3 topAnchor];
  double v21 = [(UIScrollView *)self->_scrollView topAnchor];
  double v22 = [v20 constraintEqualToAnchor:v21];
  v28[2] = v22;
  uint64_t v23 = [v3 bottomAnchor];
  [(UIScrollView *)self->_scrollView bottomAnchor];
  double v24 = v27 = v3;
  double v25 = [v23 constraintEqualToAnchor:v24 constant:v7];
  v28[3] = v25;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v18 activateConstraints:v26];

  [(UIScrollView *)self->_scrollView setAccessibilityIdentifier:@"left-of-home-scroll-view"];
}

- (CGSize)_iconSpacingForIconListViews
{
  objc_super v3 = [(SBHTodayViewController *)self listLayoutProvider];
  objc_super v4 = [(SBHTodayViewController *)self iconLocation];
  objc_super v5 = [v3 layoutForIconLocation:v4];
  double v6 = SBHIconListLayoutListIconSpacing(v5, 1);
  double v7 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, @"SBHIconGridSizeClassSmall");
  double v8 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, @"SBHIconGridSizeClassMedium") + v7 * -2.0;
  id v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v6 = v8;
  }

  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_updateIconListSpacing
{
  [(SBIconListView *)self->_listView addIconViewConfigurationOption:2];
  [(SBHTodayViewController *)self _iconSpacingForIconListViews];
  double v4 = v3;
  -[SBIconListView setIconSpacing:](self->_listView, "setIconSpacing:");
  stackView = self->_stackView;
  [(UIStackView *)stackView setSpacing:v4];
}

- (void)_setUpIconListViewLayoutDelegates
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  BOOL v5 = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  double v6 = [[SBHTodayIconListLayoutDelegate alloc] initWithIconListView:self->_listView];
  listLayoutDelegate = self->_listLayoutDelegate;
  self->_listLayoutDelegate = v6;

  double v8 = self->_listLayoutDelegate;
  id v9 = [(SBHTodayViewController *)self view];
  [(SBHTodayIconListLayoutDelegate *)v8 setContainerView:v9];

  [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate setScrollView:self->_scrollView];
  [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate setCarouselLayout:v5];
  listView = self->_listView;
  double v11 = self->_listLayoutDelegate;
  [(SBIconListView *)listView setLayoutDelegate:v11];
}

- (void)_setUpIconListViews
{
  v51[1] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  onScreenIconIndexRangeByIconListView = self->_onScreenIconIndexRangeByIconListView;
  self->_onScreenIconIndexRangeByIconListView = v3;

  [(SBHTodayViewController *)self _beginSuspendingVisibleRowRangeUpdatesForReason:@"SBHTodayViewSuspendVisibleRowRangeUpdatesForDisappearedReason"];
  uint64_t v5 = [(SBHTodayViewController *)self listLayoutProvider];
  double v6 = [(SBHTodayViewController *)self listModel];
  double v7 = [(SBHTodayViewController *)self iconViewProvider];
  [(SBHTodayViewController *)self iconLocation];
  v48 = uint64_t v49 = (void *)v5;
  double v8 = [[SBIconListView alloc] initWithModel:v6 layoutProvider:v5 iconLocation:v48 orientation:1 iconViewProvider:v7];
  listView = self->_listView;
  self->_listView = v8;

  [(SBIconListView *)self->_listView addLayoutObserver:self];
  [(SBIconListView *)self->_listView setDragDelegate:self];
  uint64_t v10 = self->_listView;
  double v11 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
  [(SBIconListView *)v10 setLegibilitySettings:v11];

  [(SBIconListView *)self->_listView setAutomaticallyAdjustsLayoutMetricsToFit:0];
  [(SBIconListView *)self->_listView hideAllIcons];
  if (self->_location == 2) {
    [(SBIconListView *)self->_listView setIconViewConfigurationOptions:16];
  }
  [(SBIconListView *)self->_listView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v12 = self->_onScreenIconIndexRangeByIconListView;
  CGFloat v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(NSMapTable *)v12 setObject:v13 forKey:self->_listView];

  id v14 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v51[0] = self->_listView;
  CGFloat v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  double v16 = (UIStackView *)[v14 initWithArrangedSubviews:v15];
  stackView = self->_stackView;
  self->_stackView = v16;

  [(UIStackView *)self->_stackView setAlignment:3];
  uint64_t v18 = [(SBIconListView *)self->_listView heightAnchor];
  uint64_t v19 = [v18 constraintGreaterThanOrEqualToConstant:0.0];
  listViewMinimumHeightConstraint = self->_listViewMinimumHeightConstraint;
  self->_listViewMinimumHeightConstraint = v19;

  double v21 = [(SBIconListView *)self->_listView widthAnchor];
  double v22 = [v21 constraintGreaterThanOrEqualToConstant:0.0];
  listViewMinimumWidthConstraint = self->_listViewMinimumWidthConstraint;
  self->_listViewMinimumWidthConstraint = v22;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView addSubview:self->_stackView];
  double v24 = [(SBIconListView *)self->_listView layer];
  [v24 setSortsSublayers:0];

  [(SBHTodayViewController *)self _updateIconListSpacing];
  [(SBHTodayViewController *)self _setUpIconListViewLayoutDelegates];
  double v25 = [(UIStackView *)self->_stackView topAnchor];
  double v26 = [(UIScrollView *)self->_scrollView topAnchor];
  uint64_t v27 = [v25 constraintEqualToAnchor:v26];
  stackViewToScrollViewTopConstraint = self->_stackViewToScrollViewTopConstraint;
  self->_stackViewToScrollViewTopConstraint = v27;

  CGFloat v29 = [(UIStackView *)self->_stackView bottomAnchor];
  objc_super v30 = [(UIScrollView *)self->_scrollView bottomAnchor];
  CGFloat v31 = [v29 constraintEqualToAnchor:v30];
  stackViewToScrollViewBottomConstraint = self->_stackViewToScrollViewBottomConstraint;
  self->_stackViewToScrollViewBottomConstraint = v31;

  uint64_t v33 = self->_stackView;
  if (self->_widgetsAreCenteredForFullScreen)
  {
    uint64_t v34 = [(UIStackView *)v33 centerXAnchor];
    int v35 = [(UIScrollView *)self->_scrollView centerXAnchor];
    [v34 constraintEqualToAnchor:v35];
  }
  else
  {
    uint64_t v34 = [(UIStackView *)v33 leadingAnchor];
    int v35 = [(UIScrollView *)self->_scrollView leadingAnchor];
    [v34 constraintEqualToAnchor:v35 constant:self->_widgetsLeadingOffset];
  int v36 = };

  uint64_t v37 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  uint64_t v38 = [v37 leadingAnchor];
  uint64_t v39 = [(UIScrollView *)self->_scrollView frameLayoutGuide];
  uint64_t v40 = [v39 leadingAnchor];
  uint64_t v41 = [v38 constraintEqualToAnchor:v40];

  unsigned __int16 v42 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v43 = self->_stackViewToScrollViewTopConstraint;
  v50[0] = v41;
  v50[1] = v36;
  uint64_t v44 = self->_stackViewToScrollViewBottomConstraint;
  uint64_t v45 = self->_listViewMinimumHeightConstraint;
  v50[2] = v43;
  v50[3] = v44;
  uint64_t v46 = self->_listViewMinimumWidthConstraint;
  v50[4] = v45;
  v50[5] = v46;
  uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:6];
  [v42 activateConstraints:v47];
}

- (void)_setupStateCapture
{
  if (!self->_stateCapture)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    uint64_t v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    int64_t v7 = self->_location;
    double v8 = @"UNKNOWN SBHTodayViewControllerLOCATION";
    if (v7 == 2) {
      double v8 = @"SBHTodayViewControllerLocationCoverSheet";
    }
    if (v7 == 1) {
      id v9 = @"SBHTodayViewControllerLocationLeftOfHome";
    }
    else {
      id v9 = v8;
    }
    uint64_t v10 = v9;
    double v11 = [v4 stringWithFormat:@"%@-%@", v6, v10];
    objc_copyWeak(&v14, &location);
    BSLogAddStateCaptureBlockWithTitle();
    double v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCapture = self->_stateCapture;
    self->_stateCapture = v12;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

__CFString *__44__SBHTodayViewController__setupStateCapture__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    uint64_t v4 = [v3 descriptionWithMultilinePrefix:@"\n"];
  }
  else
  {
    uint64_t v4 = @"(NULL!)";
  }
  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_widgetSettings == a3) {
    [(SBHTodayViewController *)self _updateIconListSpacing];
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = _SBFLoggingMethodProem();
    int64_t location = self->_location;
    *(_DWORD *)buf = 138412802;
    double v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    __int16 v15 = 2048;
    int64_t v16 = location;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u location %ld", buf, 0x1Cu);
  }
  v10.receiver = self;
  v10.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v10 viewWillAppear:v3];
  [(SBHTodayViewController *)self _beginAppearanceTransitionForChildViewControllersToVisible:1 animated:v3];
  [(SBHTodayViewController *)self _endSuspendingVisibleRowRangeUpdatesForReason:@"SBHTodayViewSuspendVisibleRowRangeUpdatesForDisappearedReason"];
  [(SBHTodayViewController *)self _updateListLayoutAdditionalInsets];
  [(SBHTodayViewController *)self _updateScrollViewContentInset];
  [(SBHTodayViewController *)self _updateVisiblySettledForIconViews];
  double v8 = [(SBHTodayViewController *)self view];
  [v8 setNeedsLayout];

  id v9 = [(SBHTodayViewController *)self view];
  [v9 layoutIfNeeded];

  [(SBHTodayViewController *)self invalidateAllCancelTouchesAssertions];
  [(SBHTodayViewController *)self endDisablingWidgetHitTestingForReason:@"SBHTodayViewDisableWidgetHitTestingForDisappearedReason"];
  [(SBIconListView *)self->_listView setContentVisibility:[(SBHTodayViewController *)self contentVisibility]];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = _SBFLoggingMethodProem();
    int64_t location = self->_location;
    int64_t v22 = [(SBHTodayViewController *)self layoutOrientation];
    double v24 = [(SBHTodayViewController *)self scrollView];
    [v24 frame];
    int64_t v7 = NSStringFromCGRect(v48);
    double v8 = [(SBHTodayViewController *)self scrollViewLeadingConstraint];
    [v8 constant];
    uint64_t v10 = v9;
    double v11 = [(SBHTodayViewController *)self stackView];
    [v11 frame];
    double v12 = NSStringFromCGRect(v49);
    __int16 v13 = [(SBHTodayViewController *)self stackViewToScrollViewLeadingConstraint];
    [v13 constant];
    *(_DWORD *)buf = 138545154;
    CGFloat v32 = v6;
    __int16 v33 = 1024;
    BOOL v34 = v3;
    __int16 v35 = 2048;
    int64_t v36 = location;
    __int16 v37 = 2048;
    int64_t v38 = v22;
    __int16 v39 = 2114;
    uint64_t v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v10;
    __int16 v43 = 2114;
    uint64_t v44 = v12;
    __int16 v45 = 2048;
    uint64_t v46 = v14;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "[Overlay Position] %{public}@ animated: %{BOOL}u location %ld, orientation: %ld, scrollViewFrame: %{public}@, scrollViewLeading: %f, stackViewFrame: %{public}@, stackViewLeading: %f", buf, 0x4Eu);
  }
  v29.receiver = self;
  v29.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v29 viewDidAppear:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained todayViewDidAppear:self];

  [(SBHTodayViewController *)self _endAppearanceTransitionForChildViewControllersToVisible:1];
  [(SBIconListView *)self->_listView setContentVisibility:[(SBHTodayViewController *)self contentVisibility]];
  [(SBHTodayViewController *)self _updateVisiblySettledForIconViews];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int64_t v16 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector()) {
          [v21 todayViewControllerDidAppear:self];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = _SBFLoggingMethodProem();
    int64_t location = self->_location;
    *(_DWORD *)buf = 138412802;
    double v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v3;
    __int16 v24 = 2048;
    int64_t v25 = location;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u location %ld", buf, 0x1Cu);
  }
  v18.receiver = self;
  v18.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v18 viewWillDisappear:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
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
        __int16 v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 todayViewControllerWillDisappear:self];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }

  [(SBHTodayViewController *)self _beginAppearanceTransitionForChildViewControllersToVisible:0 animated:v3];
  [(SBHTodayViewController *)self _updateVisiblySettledForIconViews];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = _SBFLoggingMethodProem();
    int64_t location = self->_location;
    *(_DWORD *)buf = 138412802;
    double v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v3;
    __int16 v24 = 2048;
    int64_t v25 = location;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u location %ld", buf, 0x1Cu);
  }
  v18.receiver = self;
  v18.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v18 viewDidDisappear:v3];
  [(SBIconListView *)self->_listView setContentVisibility:2];
  [(SBHTodayViewController *)self cleanupViews];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
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
        __int16 v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 todayViewControllerDidDisappear:self];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)removeFromParentViewController
{
  v3.receiver = self;
  v3.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v3 removeFromParentViewController];
  [(SBHTodayViewController *)self cleanupViews];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)willMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBHTodayViewController;
  id v4 = a3;
  [(SBHTodayViewController *)&v9 willMoveToParentViewController:v4];
  id v5 = [(SBHTodayViewController *)self parentViewController];

  if (v5 != v4)
  {
    double v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v8 = [v5 view];
      objc_msgSend(v8, "_setTouchInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    }
  }
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBHTodayViewController *)self loadViewIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)SBHTodayViewController;
  [(SBHTodayViewController *)&v5 setEditing:v3];
  [(SBHTodayViewController *)self _updateEditingStateAnimated:1];
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBHTodayViewController *)self isEditing]) {
    uint64_t v5 = [(SBHTodayViewController *)self suppressesEditingStateForListViews] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [(SBIconListView *)self->_listView setEditing:v5];
  [(SBIconListView *)self->_listView updateEditingStateAnimated:v3];
  double v6 = NSString;
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  double v8 = [v7 UUIDString];
  objc_super v9 = [v6 stringWithFormat:@"ToggleEditing-%@", v8];

  [(SBHTodayViewController *)self _beginSuspendingVisibleRowRangeUpdatesForReason:v9];
  [(UIScrollView *)self->_scrollView stopScrollingAndZooming];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v11 = [(SBHWidgetSettings *)self->_widgetSettings toggleEditingOrPinnedAnimationSettings];
  if (v3) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke;
  v17[3] = &unk_1E6AAD728;
  v17[4] = self;
  char v18 = v5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke_2;
  v14[3] = &unk_1E6AAE560;
  id v15 = v9;
  long long v16 = self;
  id v13 = v9;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, v12, v17, v14);
}

uint64_t __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateListLayoutAdditionalInsets];
  [*(id *)(a1 + 32) _toggleListVisibilityWithEditing:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateScrollViewContentInset];
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 1080) layout];
    double v3 = SBHIconListLayoutIconImageInfoForGridSizeClass(v2, @"SBHIconGridSizeClassMedium");
    double v5 = v4;
    [*(id *)(*(void *)(a1 + 32) + 1080) frame];
    double Height = CGRectGetHeight(v12);
    if (Height >= v5) {
      double v5 = Height;
    }
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [*(id *)(*(void *)(a1 + 32) + 1200) setConstant:v5];
  [*(id *)(*(void *)(a1 + 32) + 1208) setConstant:v3];
  [*(id *)(*(void *)(a1 + 32) + 1176) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 1120) layoutIfNeeded];
  if (([*(id *)(*(void *)(a1 + 32) + 1216) isVisuallyRevealed] & 1) == 0)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1120);
    [v7 adjustedContentInset];
    objc_msgSend(v7, "setContentOffset:", 0.0, -v8);
  }
  [*(id *)(a1 + 32) _updateEditingStateForListView:*(void *)(*(void *)(a1 + 32) + 1080)];
  objc_super v9 = *(void **)(*(void *)(a1 + 32) + 1080);
  return [v9 layoutIconsNow];
}

uint64_t __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "_endSuspendingVisibleRowRangeUpdatesForReason:");
  }
  return result;
}

- (void)_toggleListVisibilityWithEditing:(BOOL)a3
{
  [(SBHTodayViewController *)self setVisuallyRevealed:1 animated:0];
  [(SBHTodayViewController *)self setRevealed:1];
}

- (void)setRootFolder:(id)a3
{
  double v5 = (SBRootFolder *)a3;
  rootFolder = self->_rootFolder;
  if (rootFolder != v5)
  {
    uint64_t v11 = v5;
    uint64_t v7 = [(SBRootFolder *)rootFolder todayList];
    [v7 removeListObserver:self];

    objc_storeStrong((id *)&self->_rootFolder, a3);
    double v8 = [(SBRootFolder *)v11 todayList];
    [v8 addListObserver:self];
    listView = self->_listView;
    if (listView)
    {
      [(SBIconListView *)listView setModel:v8];
      uint64_t v10 = [(SBHTodayViewController *)self view];
      [v10 setNeedsLayout];
    }
    double v5 = v11;
  }
}

- (id)listModel
{
  v2 = [(SBHTodayViewController *)self rootFolder];
  double v3 = [v2 todayList];

  return v3;
}

- (SBIconListView)listView
{
  [(SBHTodayViewController *)self loadViewIfNeeded];
  listView = self->_listView;
  return listView;
}

- (void)layoutIconListViewWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  if (a4) {
    [(SBIconListView *)self->_listView setIconsNeedLayout];
  }
  listView = self->_listView;
  [(SBIconListView *)listView layoutIconsIfNeededWithAnimationType:a3 options:0];
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    [(SBHTodayViewController *)self _updateEditingStateAnimated:1];
  }
}

- (BOOL)isSpotlightVisible
{
  return 0;
}

- (void)noteIconViewWillZoomDown:(id)a3
{
  id v14 = a3;
  if ([(SBHTodayViewController *)self bs_isAppearingOrAppeared])
  {
    double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      double v6 = [v14 location];
      int IsAppPrediction = SBHIconLocationIsAppPrediction(v6);

      if (IsAppPrediction)
      {
        double v8 = [(SBHTodayViewController *)self iconManager];
        objc_super v9 = [v8 appPredictionsIconViewDisplayingIconView:v14 options:1];
        if (v9) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = v14;
        }
        id v11 = v10;

        CGRect v12 = v11;
      }
      else
      {
        CGRect v12 = v14;
      }
      id v14 = v12;
      id v13 = [v12 icon];
      if (v13) {
        [(SBHTodayViewController *)self scrollIconToVisible:v13 atPosition:1 animated:1 completion:0];
      }
    }
  }
}

- (id)beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __99__SBHTodayViewController_beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason___block_invoke;
  id v14 = &unk_1E6AAD538;
  objc_copyWeak(&v15, &location);
  double v6 = (void *)[v5 initWithIdentifier:@"OverrideAppearanceStateToRemainDisappeared" forReason:v4 invalidationBlock:&v11];
  viewControllerAppearStateOverrideAssertions = self->_viewControllerAppearStateOverrideAssertions;
  if (!viewControllerAppearStateOverrideAssertions)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v11, v12, v13, v14);
    double v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    objc_super v9 = self->_viewControllerAppearStateOverrideAssertions;
    self->_viewControllerAppearStateOverrideAssertions = v8;

    viewControllerAppearStateOverrideAssertions = self->_viewControllerAppearStateOverrideAssertions;
  }
  -[NSHashTable addObject:](viewControllerAppearStateOverrideAssertions, "addObject:", v6, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v6;
}

void __99__SBHTodayViewController_beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained viewControllerAppearStateOverrideAssertions];
    [v5 removeObject:v7];

    double v6 = [v4 viewControllerAppearStateOverrideAssertions];
    [v6 count];
  }
}

- (BOOL)isOverridingViewControllerAppearanceStateToRemainDisappeared
{
  return [(NSHashTable *)self->_viewControllerAppearStateOverrideAssertions count] != 0;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_listLayoutProvider = (void **)&self->_listLayoutProvider;
  id v9 = a3;
  if (*p_listLayoutProvider != v9)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    [(SBHTodayViewController *)self _updateIconListSpacing];
    double v8 = [(SBHTodayViewController *)self iconLocation];
    SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(*p_listLayoutProvider, v9, v8, 1);
    [(SBIconListView *)self->_listView setLayoutProvider:v9 animated:v4];
  }
}

- (id)keepIconImageViewControllersStaticForReason:(id)a3
{
  id v4 = a3;
  id v5 = [[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion alloc] initWithTodayViewController:self reason:v4];

  keepStaticAssertions = self->_keepStaticAssertions;
  if (!keepStaticAssertions)
  {
    id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v8 = self->_keepStaticAssertions;
    self->_keepStaticAssertions = v7;

    keepStaticAssertions = self->_keepStaticAssertions;
  }
  [(NSHashTable *)keepStaticAssertions addObject:v5];
  [(SBHTodayViewController *)self _updatePresentationModeForIconViews];
  return v5;
}

- (void)_removeIconImageViewControllerKeepStaticAssertion:(id)a3
{
  [(NSHashTable *)self->_keepStaticAssertions removeObject:a3];
  [(SBHTodayViewController *)self _updatePresentationModeForIconViews];
}

- (BOOL)_shouldKeepIconImageViewControllersStatic
{
  return [(NSHashTable *)self->_keepStaticAssertions count] != 0;
}

- (void)_updatePresentationModeForIconViews
{
  BOOL v3 = [(SBHTodayViewController *)self _shouldKeepIconImageViewControllersStatic];
  uint64_t v4 = 2;
  if (!v3) {
    uint64_t v4 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SBHTodayViewController__updatePresentationModeForIconViews__block_invoke;
  v5[3] = &__block_descriptor_40_e24_v24__0__SBIconView_8_B16l;
  v5[4] = v4;
  [(SBHTodayViewController *)self enumerateDisplayedIconViewsUsingBlock:v5];
}

void __61__SBHTodayViewController__updatePresentationModeForIconViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    [v3 setPresentationMode:*(void *)(a1 + 32)];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)setLegibilitySettings:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    id v5 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    double v6 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
    if (([v5 isEqual:v6] & 1) == 0) {
      [(SBHTodayViewController *)self updateViewsWithLegibilitySettings];
    }
  }
}

- (void)setOverrideLegibilitySettings:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_overrideLegibilitySettings] & 1) == 0)
  {
    id v5 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
    objc_storeStrong((id *)&self->_overrideLegibilitySettings, a3);
    double v6 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
    if (([v5 isEqual:v6] & 1) == 0) {
      [(SBHTodayViewController *)self updateViewsWithLegibilitySettings];
    }
  }
}

- (void)updateViewsWithLegibilitySettings
{
  id v3 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
  [(SBIconListView *)self->_listView setLegibilitySettings:v3];
}

- (_UILegibilitySettings)effectiveLegibilitySettings
{
  overrideLegibilitySettings = self->_overrideLegibilitySettings;
  if (!overrideLegibilitySettings) {
    overrideLegibilitySettings = self->_legibilitySettings;
  }
  return overrideLegibilitySettings;
}

- (void)setContentVisibility:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t contentVisibility = self->_contentVisibility;
  if (contentVisibility != a3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 todayViewController:self contentVisibilityWillChange:a3];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    self->_unint64_t contentVisibility = a3;
    [(SBIconListView *)self->_listView setContentVisibility:a3];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v17 todayViewController:self contentVisibilityDidChange:contentVisibility];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHTodayViewController *)self iconLocation];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHTodayViewController *)self iconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(SBIconListView *)self->_listView displayedIconViewForIcon:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
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
        uint64_t v12 = -[SBHTodayViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHTodayViewController *)self presentedIconLocations];
  id v6 = [v5 allObjects];
  id v7 = [(SBHTodayViewController *)self firstIconViewForIcon:v4 inLocations:v6];

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHTodayViewController *)self presentedIconLocations];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 minusSet:v6];
  uint64_t v10 = [v9 allObjects];
  uint64_t v11 = [(SBHTodayViewController *)self firstIconViewForIcon:v7 inLocations:v10];

  return v11;
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
        if (-[SBHTodayViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
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

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v6 = [(SBIconListView *)self->_listView displayedIconViewForIcon:a3];
  if (v6) {
    v7[2](v7, v6);
  }
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  listView = self->_listView;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBHTodayViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AAE5A8;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = v10;
  [(SBIconListView *)listView enumerateIconViewsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

uint64_t __64__SBHTodayViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHTodayViewController *)self iconLocation];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  LOBYTE(self) = [(SBHTodayViewController *)self isDisplayingIcon:v4 inLocations:v6];

  return (char)self;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return [(SBIconListView *)self->_listView isDisplayingIconView:a3];
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHTodayViewController *)self iconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    BOOL v10 = [(SBIconListView *)self->_listView isDisplayingIconView:v6];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)iconViewWillPresentContextMenu:(id)a3
{
  id v4 = [a3 object];
  if (-[SBHTodayViewController isDisplayingIconView:](self, "isDisplayingIconView:")) {
    [(SBHTodayViewController *)self _cancelTouchesForWidgetIconView:v4];
  }
}

- (void)iconViewWillDismissContextMenu:(id)a3
{
  widgetHitTestingDisabledReasons = self->_widgetHitTestingDisabledReasons;
  id v5 = a3;
  char v6 = [(NSMutableSet *)widgetHitTestingDisabledReasons containsObject:@"SBHTodayViewDisableWidgetHitTestingForScrollingReason"];
  id v7 = [v5 object];

  if ([(SBHTodayViewController *)self isDisplayingIconView:v7] && (v6 & 1) == 0) {
    [(SBHTodayViewController *)self invalidateAllCancelTouchesAssertions];
  }
}

- (id)_widgetIconViewAtLocation:(CGPoint)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__4;
  char v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SBHTodayViewController__widgetIconViewAtLocation___block_invoke;
  v5[3] = &unk_1E6AAE5D0;
  CGPoint v6 = a3;
  v5[4] = self;
  void v5[5] = &v7;
  [(SBHTodayViewController *)self enumerateWidgetIconViewsUsingBlock:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __52__SBHTodayViewController__widgetIconViewAtLocation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toView:", *(void *)(*(void *)(a1 + 32) + 1120));
  if (CGRectContainsPoint(v8, *(CGPoint *)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)cancelTouchesForAllWidgets
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__SBHTodayViewController_cancelTouchesForAllWidgets__block_invoke;
  v2[3] = &unk_1E6AAD830;
  v2[4] = self;
  [(SBHTodayViewController *)self enumerateWidgetIconViewsUsingBlock:v2];
}

uint64_t __52__SBHTodayViewController_cancelTouchesForAllWidgets__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cancelTouchesForWidgetIconView:a2];
}

- (void)_cancelTouchesForHitTestedWidgetInScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 panGestureRecognizer];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  BOOL v10 = -[SBHTodayViewController _widgetIconViewAtLocation:](self, "_widgetIconViewAtLocation:", v7, v9);
  if (v10)
  {
    char v11 = v10;
    [(SBHTodayViewController *)self _cancelTouchesForWidgetIconView:v10];
    BOOL v10 = v11;
  }
}

- (void)_cancelTouchesForWidgetIconView:(id)a3
{
  id v15 = a3;
  id v4 = [v15 customIconImageViewController];
  char v5 = objc_opt_respondsToSelector();

  double v6 = v15;
  if (v5)
  {
    double v7 = [v15 customIconImageViewController];
    double v8 = [v7 cancelTouchesForCurrentEventInHostedContent];

    double v6 = v15;
    if (v8)
    {
      if (!self->_cancelTouchesAssertionsByWidgetID)
      {
        double v9 = [MEMORY[0x1E4F1CA60] dictionary];
        cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
        self->_cancelTouchesAssertionsByWidgetID = v9;

        double v6 = v15;
      }
      char v11 = [v6 icon];
      id v12 = [v11 uniqueIdentifier];

      uint64_t v13 = [(NSMutableDictionary *)self->_cancelTouchesAssertionsByWidgetID objectForKey:v12];
      long long v14 = v13;
      if (v13) {
        [v13 invalidate];
      }
      [(NSMutableDictionary *)self->_cancelTouchesAssertionsByWidgetID setObject:v8 forKey:v12];

      double v6 = v15;
    }
  }
}

- (void)invalidateAllCancelTouchesAssertions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = self->_cancelTouchesAssertionsByWidgetID;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [(NSMutableDictionary *)self->_cancelTouchesAssertionsByWidgetID objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v7)];
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_cancelTouchesAssertionsByWidgetID removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v9 = self->_cancelTouchesAssertionsByLegacyWidgetID;
  uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByLegacyWidgetID, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * v13), (void)v15);
        [v14 invalidate];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  [(NSMutableDictionary *)self->_cancelTouchesAssertionsByLegacyWidgetID removeAllObjects];
}

void __50__SBHTodayViewController_cancelTouchesOnIconViews__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 customIconImageViewController];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = v8;
  if (v4)
  {
    uint64_t v6 = [v8 customIconImageViewController];
    uint64_t v7 = [v6 cancelTouchesForCurrentEventInHostedContent];

    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }

    uint64_t v5 = v8;
  }
}

- (BOOL)_isWidgetHitTestingDisabled
{
  return [(NSMutableSet *)self->_widgetHitTestingDisabledReasons count] != 0;
}

- (void)beginDisablingWidgetHitTestingForReason:(id)a3
{
  id v7 = a3;
  widgetHitTestingDisabledReasons = self->_widgetHitTestingDisabledReasons;
  if (!widgetHitTestingDisabledReasons)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v6 = self->_widgetHitTestingDisabledReasons;
    self->_widgetHitTestingDisabledReasons = v5;

    widgetHitTestingDisabledReasons = self->_widgetHitTestingDisabledReasons;
  }
  if (![(NSMutableSet *)widgetHitTestingDisabledReasons count]) {
    [(SBHTodayViewController *)self enumerateWidgetIconViewsUsingBlock:&__block_literal_global_16];
  }
  [(NSMutableSet *)self->_widgetHitTestingDisabledReasons addObject:v7];
}

uint64_t __66__SBHTodayViewController_beginDisablingWidgetHitTestingForReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomIconImageViewHitTestingDisabled:1];
}

- (void)endDisablingWidgetHitTestingForReason:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_widgetHitTestingDisabledReasons, "containsObject:"))
  {
    [(NSMutableSet *)self->_widgetHitTestingDisabledReasons removeObject:v4];
    if (![(NSMutableSet *)self->_widgetHitTestingDisabledReasons count]) {
      [(SBHTodayViewController *)self enumerateWidgetIconViewsUsingBlock:&__block_literal_global_104];
    }
  }
}

uint64_t __64__SBHTodayViewController_endDisablingWidgetHitTestingForReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomIconImageViewHitTestingDisabled:0];
}

void __61__SBHTodayViewController_enumerateWidgetIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v6 = [v8 icon];
  int v7 = [v6 isWidgetIcon];

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v4[3] = &unk_1E6AAC810;
  v4[4] = self;
  [a4 addAnimations:v4];
}

void __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(a1 + 32) + 1080);
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  v4[3] = &unk_1E6AAC810;
  id v5 = v1;
  id v3 = v1;
  [v2 performWithoutAnimation:v4];
  objc_msgSend(v3, "pl_performCrossFadeIfNecessary");
}

uint64_t __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6 = a4;
  [v6 addObserver:self];
  id v5 = [v6 customIconImageViewController];
  if (v5 && ([v6 isIconImageViewBorrowed] & 1) == 0) {
    [(SBHTodayViewController *)self bs_addChildViewController:v5];
  }
  objc_msgSend(v6, "setCustomIconImageViewHitTestingDisabled:", -[SBHTodayViewController _isWidgetHitTestingDisabled](self, "_isWidgetHitTestingDisabled"));
  objc_msgSend(v6, "setWantsFocusProxyView:", -[SBHTodayIconListLayoutDelegate isCarouselLayout](self->_listLayoutDelegate, "isCarouselLayout"));
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v5 = a4;
  [v5 removeObserver:self];
  id v7 = [v5 customIconImageViewController];

  id v6 = v7;
  if (v7)
  {
    [(SBHTodayViewController *)self bs_removeChildViewController:v7];
    id v6 = v7;
  }
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 customIconImageViewController];
  if (v6) {
    [(SBHTodayViewController *)self bs_removeChildViewController:v6];
  }
  if (v7)
  {
    objc_msgSend(v8, "setCustomIconImageViewHitTestingDisabled:", -[SBHTodayViewController _isWidgetHitTestingDisabled](self, "_isWidgetHitTestingDisabled"));
    [(SBHTodayViewController *)self bs_addChildViewController:v7];
    if ([(SBHTodayViewController *)self _shouldKeepIconImageViewControllersStatic])
    {
      if (objc_opt_respondsToSelector()) {
        [v7 setPresentationMode:2];
      }
    }
  }
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5 = [(SBHTodayViewController *)self view];
  [v5 setNeedsLayout];

  [(SBHTodayViewController *)self _updateVisibleRowRangeForListViews];
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v5 = [(SBHTodayViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v4 = [(SBHTodayViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  id v4 = [(SBHTodayViewController *)self view];
  [v4 setNeedsLayout];
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHTodayViewController *)self listView];

  if (v8 == v6)
  {
    uint64_t v10 = [(SBHTodayViewController *)self iconManager];
    uint64_t v11 = [v10 iconDragManager];

    char v9 = [v11 canHandleIconDropSession:v7 inIconListView:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SBHTodayViewController *)self listView];

  if (v7 == v10)
  {
    id v8 = [(SBHTodayViewController *)self iconManager];
    char v9 = [v8 iconDragManager];
    [v9 iconDropSessionDidEnter:v6 inIconListView:v10];
  }
}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHTodayViewController *)self listView];

  if (v8 == v6)
  {
    id v10 = [(SBHTodayViewController *)self iconManager];
    uint64_t v11 = [v10 iconDragManager];
    char v9 = [v11 iconDropSessionDidUpdate:v7 inIconListView:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SBHTodayViewController *)self listView];

  if (v7 == v10)
  {
    id v8 = [(SBHTodayViewController *)self iconManager];
    char v9 = [v8 iconDragManager];
    [v9 iconDropSessionDidExit:v6 fromIconListView:v10];
  }
}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBHTodayViewController *)self iconManager];
  id v8 = [v9 iconDragManager];
  [v8 performIconDrop:v6 inIconListView:v7];
}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(SBHTodayViewController *)self iconManager];
  uint64_t v12 = [v11 iconDragManager];
  uint64_t v13 = [v12 iconListView:v10 iconViewForDroppingIconDragItem:v9 proposedIconView:v8];

  return v13;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(SBHTodayViewController *)self iconManager];
  uint64_t v11 = [v12 iconDragManager];
  [v11 iconListView:v10 willUseIconView:v9 forDroppingIconDragItem:v8];
}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(SBHTodayViewController *)self iconManager];
  id v12 = [v11 iconDragManager];
  uint64_t v13 = [v12 iconListView:v10 previewForDroppingIconDragItem:v9 proposedPreview:v8];

  return v13;
}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(SBHTodayViewController *)self iconManager];
  uint64_t v11 = [v12 iconDragManager];
  [v11 iconListView:v10 iconDragItem:v9 willAnimateDropWithAnimator:v8];
}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBHTodayViewController *)self iconManager];
  id v10 = [v9 iconDragManager];
  char v11 = [v10 shouldAllowSpringLoadedInteractionForIconDropSession:v8 onIconView:v7];

  return v11;
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
  id v5 = a4;
  id v7 = [(SBHTodayViewController *)self iconManager];
  id v6 = [v7 iconDragManager];
  [v6 performSpringLoadedInteractionForIconDragOnIconView:v5];
}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHTodayViewController *)self iconManager];
  id v9 = [v8 iconDragManager];
  id v10 = [v9 iconListView:v7 customSpringAnimationBehaviorForDroppingItem:v6];

  return v10;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [v4 _removeAllRetargetableAnimations:1];
  [(SBHTodayViewController *)self _cancelTouchesForHitTestedWidgetInScrollView:v4];
  [(SBHTodayViewController *)self beginDisablingWidgetHitTestingForReason:@"SBHTodayViewDisableWidgetHitTestingForScrollingReason"];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  -[SBHTodayViewController setScrollingBeginningOffset:](self, "setScrollingBeginningOffset:", v6, v8);
  [(SBHTodayViewController *)self _updateVisiblySettledForIconViews];
  scrollingInteraction = self->_scrollingInteraction;
  [(SBHScrollableIconViewInteraction *)scrollingInteraction updateScrolling:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollView == a3)
  {
    id v4 = a3;
    [(SBHTodayViewController *)self _updateListViewLayoutAnimated:1];
    [(SBHTodayViewController *)self _updateVisibleRowRangeForListView:self->_listView];
    [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction clippingScrollViewDidScroll:v4];
  }
}

- (void)scrollIconToVisible:(id)a3 atPosition:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (**)(void))a6;
  id v11 = a3;
  [(SBHTodayViewController *)self _updateScrollViewContentSize];
  id v12 = [(SBHTodayViewController *)self listView];
  uint64_t v13 = [v12 indexOfIcon:v11];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    if (v10)
    {
      scrollViewDidEndScrollingHandlers = self->_scrollViewDidEndScrollingHandlers;
      if (!scrollViewDidEndScrollingHandlers)
      {
        long long v15 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        long long v16 = self->_scrollViewDidEndScrollingHandlers;
        self->_scrollViewDidEndScrollingHandlers = v15;

        scrollViewDidEndScrollingHandlers = self->_scrollViewDidEndScrollingHandlers;
      }
      long long v17 = _Block_copy(v10);
      [(NSMutableArray *)scrollViewDidEndScrollingHandlers addObject:v17];
    }
    long long v18 = [(SBHTodayViewController *)self listLayoutDelegate];
    [(SBHTodayViewController *)self _effectiveLayoutInsets];
    double v61 = v19;
    double v62 = v20;
    uint64_t v21 = [v12 coordinateForIconAtIndex:v13];
    uint64_t v23 = v22;
    objc_msgSend(v18, "unadjustedOriginYForIconCoordinate:", v21, v22);
    -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", v12, 0.0, v24);
    double v26 = v25;
    [(UIScrollView *)self->_scrollView contentOffset];
    double v63 = v27;
    objc_msgSend(v18, "unadjustedBoundsForIconCoordinate:", v21, v23);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    [(UIScrollView *)self->_scrollView bounds];
    if (a4 == 1)
    {
      uint64_t v50 = [(SBHTodayViewController *)self iconLocation];
      uint64_t v51 = [(SBIconListLayoutProvider *)self->_listLayoutProvider layoutForIconLocation:v50];
      [v51 layoutInsetsForOrientation:1];
      double v53 = v52;
      [(UIScrollView *)self->_scrollView adjustedContentInset];
      double v55 = v53 + v61 + v54;
      [(UIScrollView *)self->_scrollView contentOffset];
      if (v56 >= v26 - v55) {
        double v26 = v26 - v55;
      }
      else {
        double v26 = v56;
      }
    }
    else if (!a4)
    {
      CGFloat v40 = v38;
      CGFloat v41 = v39;
      CGFloat v42 = v36;
      v64.origin.x = v29;
      CGFloat v43 = v37;
      v64.origin.y = v31;
      v64.size.width = v33;
      v64.size.height = v35;
      CGFloat v44 = CGRectGetHeight(v64) * 0.5;
      v65.origin.x = v42;
      v65.origin.y = v43;
      CGFloat v45 = v43;
      v65.size.width = v40;
      v65.size.height = v41;
      double v46 = v26 + v44 - CGRectGetHeight(v65) * 0.5;
      [(UIScrollView *)self->_scrollView contentSize];
      double v48 = v62 + v47;
      v66.origin.x = v42;
      v66.origin.y = v45;
      v66.size.width = v40;
      v66.size.height = v41;
      double v49 = v48 - CGRectGetHeight(v66);
      if (v46 >= v49) {
        double v26 = v49;
      }
      else {
        double v26 = v46;
      }
    }
    [(UIScrollView *)self->_scrollView adjustedContentInset];
    double v58 = -v57;
    if (v26 >= v58) {
      double v59 = v26;
    }
    else {
      double v59 = v58;
    }
    v60 = [MEMORY[0x1E4F39C90] animation];
    convertDampingRatioAndResponseToTensionAndFriction();
    [v60 setMass:1.0];
    [v60 setStiffness:0.0];
    [v60 setDamping:0.0];
    [v60 durationForEpsilon:1.17549435e-38];
    objc_msgSend(v60, "setDuration:");
    -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self->_scrollView, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", v6, 3, 0, v60, v63, v59);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  if ([(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isRevealed]
    || ![(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isVisuallyRevealed])
  {
    if ([(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isRevealed]
      && ![(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isVisuallyRevealed])
    {
      [(SBHTodayViewController *)self setRevealed:0];
    }
  }
  else
  {
    [(SBHTodayViewController *)self setRevealed:1];
    [v7 contentSize];
    double v9 = v8;
    [v7 bounds];
    if (v9 > v10)
    {
      [(UIScrollView *)self->_scrollView contentOffset];
      unint64_t v12 = [(SBHTodayViewController *)self _indexForNextWidgetInListViewAfterContentOffset:v11];
      unint64_t v13 = [(SBHTodayViewController *)self _indexForNextWidgetInListViewAfterContentOffset:a5->y];
      long long v14 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
      [v14 velocityInView:v7];
      double v16 = v15;

      double v17 = 0.0;
      unint64_t v18 = vcvtad_u64_f64(pow(fmin(fmax(v16 / -15000.0, 0.0), 1.0), 3.0) * (double)(v13 - v12) + (double)v12);
      if ([(SBHTodayViewController *)self needsToManageTopInset])
      {
        [(NSLayoutConstraint *)self->_stackViewToScrollViewTopConstraint constant];
        double v17 = v19;
      }
      double v20 = [(SBHTodayViewController *)self listView];
      uint64_t v21 = [(SBHTodayViewController *)self listLayoutDelegate];
      uint64_t v22 = [v20 coordinateForIconAtIndex:v18];
      objc_msgSend(v21, "unadjustedOriginYForIconCoordinate:", v22, v23);
      objc_msgSend(v7, "convertPoint:fromView:", v20, 0.0, v24 - v17);
      double v26 = v25;
      double v28 = v27;
      uint64_t v29 = [v20 coordinateForIconAtIndex:0];
      objc_msgSend(v21, "unadjustedOriginYForIconCoordinate:", v29, v30);
      objc_msgSend(v7, "convertPoint:fromView:", v20, 0.0, v31 - v17);
      if (a5->y > v32)
      {
        [v7 contentSize];
        double v34 = v33;
        [v7 bounds];
        if (v16 < 0.0 && v28 < v34 - v35)
        {
          [v7 contentOffset];
          a5->x = v36;
          a5->y = v37;
          [v7 contentOffset];
          double v39 = fmin(-v16 / (v28 - v38), 15.0);
          CGFloat v40 = objc_opt_new();
          uint64_t v41 = 0;
          convertDampingRatioAndResponseToTensionAndFriction();
          [v40 setMass:1.0];
          [v40 setStiffness:0.0];
          [v40 setDamping:0.0];
          [v40 durationForEpsilon:1.17549435e-38];
          objc_msgSend(v40, "setDuration:");
          [v40 setInitialVelocity:v39];
          objc_msgSend(v7, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 0, v40, v26, v28);
        }
      }
    }
  }
  [(SBHTodayViewController *)self invalidateAllCancelTouchesAssertions];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(SBHTodayViewController *)self _scrollViewDidEndScrolling];
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 1;
}

- (UIEdgeInsets)visibleContainerInsets
{
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v4 = v3;
  [(SBHTodayViewController *)self _effectiveLayoutInsets];
  double v6 = v4 + v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (void)enumerateScrollableIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __65__SBHTodayViewController_enumerateScrollableIconViewsUsingBlock___block_invoke;
  double v10 = &unk_1E6AAE5F8;
  id v5 = v4;
  id v11 = v5;
  unint64_t v12 = &v13;
  [(SBHTodayViewController *)self enumerateDisplayedIconViewsUsingBlock:&v7];
  if (!*((unsigned char *)v14 + 24))
  {
    double v6 = [(SBHTodayViewController *)self iconManager];
    [v6 enumerateIconViewsDisplayedInAppPredictionsInLocationGroup:@"SBIconLocationGroupTodayView" withOptions:1 usingBlock:v5];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __65__SBHTodayViewController_enumerateScrollableIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)shouldShowDoneButtonWhenEditing
{
  return 1;
}

- (BOOL)shouldShowAddWidgetButtonWhenEditing
{
  return 1;
}

- (void)_scrollViewDidEndScrolling
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_enableEditingModeWhenScrollEnds)
  {
    self->_enableEditingModeWhenScrollEnds = 0;
    double v3 = [(SBHTodayViewController *)self iconManager];
    [v3 setEditing:1];
  }
  id v4 = (void *)[(NSMutableArray *)self->_scrollViewDidEndScrollingHandlers copy];
  scrollViewDidEndScrollingHandlers = self->_scrollViewDidEndScrollingHandlers;
  self->_scrollViewDidEndScrollingHandlers = 0;

  [(SBHTodayViewController *)self _updateVisiblySettledForIconViews];
  [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction updateScrolling:0];
  [(SBHTodayViewController *)self endDisablingWidgetHitTestingForReason:@"SBHTodayViewDisableWidgetHitTestingForScrollingReason"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * i) + 16))();
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v16 todayViewControllerDidEndScrolling:self];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)_updateListViewLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIStackView *)self->_stackView layoutIfNeeded];
  [(UIScrollView *)self->_scrollView layoutIfNeeded];
  [(SBHTodayViewController *)self _updateVisibleRowRangeForListViews];
  [(SBHTodayViewController *)self _updateSubviewOrderingForListViews];
  if ([(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isCarouselLayout]) {
    [(SBIconListView *)self->_listView setIconsNeedLayout];
  }
  listView = self->_listView;
  if (v3)
  {
    [(SBIconListView *)listView layoutIconsIfNeededWithAnimationType:1 options:0];
  }
  else
  {
    [(SBIconListView *)listView layoutIconsIfNeeded];
  }
}

- (unint64_t)_indexForNextWidgetInListViewAfterContentOffset:(double)a3
{
  id v5 = [(SBHTodayViewController *)self listView];
  id v6 = [(SBHTodayViewController *)self listLayoutDelegate];
  uint64_t v7 = [v5 model];
  unint64_t v8 = [v7 numberOfIcons];
  objc_msgSend(v5, "convertPoint:fromView:", self->_scrollView, 0.0, a3);
  double v10 = v9;
  uint64_t v11 = 0;
  while (v8 != v11)
  {
    uint64_t v12 = [v5 coordinateForIconAtIndex:v11];
    objc_msgSend(v6, "unadjustedOriginYForIconCoordinate:", v12, v13);
    ++v11;
    if (v14 > v10)
    {
      unint64_t v8 = v11 - 1;
      break;
    }
  }

  return v8;
}

- (void)_updateSubviewOrderingForListViews
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(SBHTodayViewController *)self listView];
  objc_msgSend(v3, "bs_safeAddObject:", v4);

  id v5 = [v3 firstObject];
  id v6 = [(SBHTodayViewController *)self view];
  if ([v3 count] != 1)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [v3 objectAtIndex:v7];
      double v9 = [v3 objectAtIndex:++v7];
      [v8 bounds];
      objc_msgSend(v8, "convertRect:toView:", v6);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v9 bounds];
      objc_msgSend(v9, "convertRect:toView:", v6);
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      v60.origin.x = v11;
      v60.origin.y = v13;
      v60.size.width = v15;
      v60.size.height = v17;
      if (CGRectGetMinY(v60) < 0.0)
      {
        v61.origin.x = v19;
        v61.origin.y = v21;
        v61.size.width = v23;
        v61.size.height = v25;
        double MinY = CGRectGetMinY(v61);
        [v6 bounds];
        if (MinY < CGRectGetMidY(v62))
        {
          id v27 = v9;

          id v5 = v27;
        }
      }
    }
    while (v7 < [v3 count] - 1);
  }
  double v28 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v29 = v28;
  if (v5)
  {
    [v28 addObject:v5];
    uint64_t v30 = [v3 indexOfObject:v5];
    for (unint64_t i = v30 + 1; i < [v3 count]; ++i)
    {
      CGFloat v32 = [v3 objectAtIndex:i];
      [v29 insertObject:v32 atIndex:0];
    }
    uint64_t v33 = v30 - 1;
    if (v33 >= 0)
    {
      do
      {
        double v34 = [v3 objectAtIndex:v33];
        [v29 insertObject:v34 atIndex:0];

        --v33;
      }
      while (v33 != -1);
    }
  }
  double v48 = v5;
  double v35 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSet", v6);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  CGFloat v36 = [(UIStackView *)self->_stackView subviews];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        if ([v29 containsObject:v41]) {
          [v35 addObject:v41];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v38);
  }

  if (([v29 isEqualToOrderedSet:v35] & 1) == 0)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v42 = v29;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(v42);
          }
          [(UIStackView *)self->_stackView bringSubviewToFront:*(void *)(*((void *)&v49 + 1) + 8 * k)];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v44);
    }
  }
}

- (void)_updateVisiblySettledForIconViews
{
}

- (void)_updateVisiblySettledForIconViewsInListView:(id)a3
{
  id v5 = a3;
  if ([(UIScrollView *)self->_scrollView isDragging]
    || [(UIScrollView *)self->_scrollView isDecelerating])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(UIScrollView *)self->_scrollView isScrollAnimating] ^ 1;
  }
  [v5 setVisiblySettled:v4];
}

- (void)_updateEditingStateForListView:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isEditing];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBHTodayViewController__updateEditingStateForListView___block_invoke;
  v6[3] = &unk_1E6AAE620;
  v6[4] = self;
  char v7 = v5;
  [v4 enumerateIconViewsUsingBlock:v6];
}

void __57__SBHTodayViewController__updateEditingStateForListView___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [v7 icon];
  int v4 = [v3 isWidgetIcon];

  char v5 = v7;
  if (v4)
  {
    int v6 = [*(id *)(*(void *)(a1 + 32) + 976) containsObject:v7];
    if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) _shouldIconViewForbidJiggling:v7])
    {
      char v5 = v7;
      if (v6) {
        goto LABEL_9;
      }
      [v7 startForbiddingEditingModeWithReason:@"kStopJigglingBecauseOffScreen"];
      [*(id *)(*(void *)(a1 + 32) + 976) addObject:v7];
    }
    else
    {
      char v5 = v7;
      if (!v6) {
        goto LABEL_9;
      }
      [v7 endForbiddingEditingModeWithReason:@"kStopJigglingBecauseOffScreen"];
      [*(id *)(*(void *)(a1 + 32) + 976) removeObject:v7];
    }
    char v5 = v7;
  }
LABEL_9:
}

- (BOOL)_shouldIconViewForbidJiggling:(id)a3
{
  return 0;
}

- (void)_beginSuspendingVisibleRowRangeUpdatesForReason:(id)a3
{
  id v4 = a3;
  suspendVisibleRowRangeUpdatesReasons = self->_suspendVisibleRowRangeUpdatesReasons;
  id v8 = v4;
  if (!suspendVisibleRowRangeUpdatesReasons)
  {
    int v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_suspendVisibleRowRangeUpdatesReasons;
    self->_suspendVisibleRowRangeUpdatesReasons = v6;

    id v4 = v8;
    suspendVisibleRowRangeUpdatesReasons = self->_suspendVisibleRowRangeUpdatesReasons;
  }
  [(NSMutableSet *)suspendVisibleRowRangeUpdatesReasons addObject:v4];
}

- (void)_endSuspendingVisibleRowRangeUpdatesForReason:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_suspendVisibleRowRangeUpdatesReasons, "containsObject:"))
  {
    [(NSMutableSet *)self->_suspendVisibleRowRangeUpdatesReasons removeObject:v4];
    if (![(NSMutableSet *)self->_suspendVisibleRowRangeUpdatesReasons count]) {
      [(SBHTodayViewController *)self _updateVisibleRowRangeForListViews];
    }
  }
}

- (CGRect)_cellFrameInScrollBoundsForCell:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  [(UIScrollView *)self->_scrollView contentOffset];
  double v8 = v6 - v7;
  [v4 frame];
  double v10 = v9;
  double v12 = v11;

  double v13 = 0.0;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)cleanupViews
{
  [(SBHTodayViewController *)self invalidateAllCancelTouchesAssertions];
  [(SBHTodayViewController *)self _endAppearanceTransitionForChildViewControllersToVisible:0];
  [(SBHTodayViewController *)self _beginSuspendingVisibleRowRangeUpdatesForReason:@"SBHTodayViewSuspendVisibleRowRangeUpdatesForDisappearedReason"];
  listView = self->_listView;
  [(SBIconListView *)listView hideAllIcons];
}

- (int64_t)layoutOrientation
{
  v2 = [(SBHTodayViewController *)self listView];
  BOOL v3 = [v2 window];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (id)_majorScrollView
{
  return self->_scrollView;
}

- (CGPoint)_interactiveSpotlightDraggingBeginPoint
{
  BOOL v3 = [(SBHTodayViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(SBHTodayViewController *)self iconLocation];
  double v13 = [(SBHTodayViewController *)self listLayoutProvider];
  double v14 = [v13 layoutForIconLocation:v12];

  double v15 = SBHIconListLayoutIconImageInfoForGridSizeClass(v14, @"SBHIconGridSizeClassMedium");
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  CGFloat v16 = (CGRectGetWidth(v22) - v15) * 0.5 * 0.5;
  UIRectGetCenter();
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (BOOL)_isViewVisibleInScrollViewSpace:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", self->_scrollView);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(UIScrollView *)self->_scrollView bounds];
  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  if (CGRectIntersectsRect(v15, v16))
  {
    [v4 alpha];
    char v13 = BSFloatGreaterThanFloat();
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)extraViewsContainers
{
  BOOL v3 = objc_opt_new();
  if ([(SBHTodayViewController *)self _isViewVisibleInScrollViewSpace:self->_listView])
  {
    [v3 addObject:self->_listView];
  }
  return v3;
}

- (id)extraViews
{
  BOOL v3 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __36__SBHTodayViewController_extraViews__block_invoke;
  v8[3] = &unk_1E6AADEB0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(SBHTodayViewController *)self enumerateDisplayedIconViewsUsingBlock:v8];
  double v5 = v9;
  id v6 = v4;

  return v6;
}

void __36__SBHTodayViewController_extraViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isViewVisibleInScrollViewSpace:"))
  {
    [v3 effectiveIconImageAlpha];
    if (BSFloatGreaterThanFloat()) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

- (BOOL)shouldAnimateLastTwoViewsAsOne
{
  return 0;
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  return 0;
}

- (void)setRevealed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isRevealed] != a3)
  {
    [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate setRevealed:v3];
    [(SBHTodayViewController *)self _updateScrollViewContentSize];
  }
}

- (void)setVisuallyRevealed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isVisuallyRevealed] != a3)
  {
    [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate setVisuallyRevealed:v5 animated:v4];
    [(SBHTodayViewController *)self _updateScrollViewContentSize];
  }
  if (![(UIScrollView *)self->_scrollView isTracking])
  {
    [(SBHTodayViewController *)self setRevealed:v5];
  }
}

- (void)_updateScrollViewContentSize
{
  id v6 = self->_scrollView;
  [(UIScrollView *)v6 _setAutomaticContentOffsetAdjustmentEnabled:0];
  BOOL v3 = [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isVisuallyRevealed];
  BOOL v4 = [(SBHTodayViewController *)self stackViewToScrollViewBottomConstraint];
  BOOL v5 = v4;
  if (v3)
  {
    [v4 setActive:1];

    [(UIScrollView *)v6 layoutIfNeeded];
  }
  else
  {
    [v4 setActive:0];
  }
}

- (void)_updateRevealStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v13 = self->_scrollView;
  [(UIScrollView *)v13 contentOffset];
  [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate setRevealProgress:fmin(fmax(v5 / 60.0, 0.0), 1.0)];
  [(UIScrollView *)v13 contentOffset];
  [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate setDismissProgress:-fmin(fmax(v6 / 60.0, -1.0), 0.0)];
  BOOL v7 = [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isRevealed];
  BOOL v8 = [(SBHTodayIconListLayoutDelegate *)self->_listLayoutDelegate isVisuallyRevealed];
  if (v7) {
    int v9 = 1;
  }
  else {
    int v9 = BSFloatIsOne() ^ 1;
  }
  int IsOne = BSFloatIsOne();
  BOOL v11 = [(UIScrollView *)v13 isDecelerating];
  if (v7 && !IsOne || (v7 & IsOne ^ 1 | v11) == 1 && (v7 && v11 || !v11 && (v9 & (!v8 | IsOne)) != 1)) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = [(SBHTodayViewController *)self isEditing];
  }
  [(SBHTodayViewController *)self setVisuallyRevealed:v12 animated:v3];
}

- (CGRect)_suggestedTodayViewFrameForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v8 = [(SBHTodayViewController *)self listLayoutProvider];
  int v9 = [(SBHTodayViewController *)self iconLocation];
  CGFloat v10 = [v8 layoutForIconLocation:v9];
  SBHIconListLayoutIconImageInfoForGridSizeClass(v10, @"SBHIconGridSizeClassMedium");
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGRectGetHeight(v24);
  BSRectWithSize();
  BOOL v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  UIRectCenteredIntegralRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (UIViewController)legacyWidgetListViewController
{
  return 0;
}

- (id)succinctDescription
{
  v2 = [(SBHTodayViewController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBHTodayViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBHTodayViewController *)self succinctDescriptionBuilder];
  double v5 = v4;
  int64_t location = self->_location;
  BOOL v7 = @"UNKNOWN SBHTodayViewControllerLOCATION";
  if (location == 2) {
    BOOL v7 = @"SBHTodayViewControllerLocationCoverSheet";
  }
  if (location == 1) {
    BOOL v8 = @"SBHTodayViewControllerLocationLeftOfHome";
  }
  else {
    BOOL v8 = v7;
  }
  id v9 = (id)[v4 appendObject:v8 withName:@"location"];
  CGFloat v10 = SBHStringFromContentVisibility([(SBIconListView *)self->_listView contentVisibility]);
  [v5 appendString:v10 withName:@"_listView contentVisibility"];

  BOOL v11 = SBHStringFromContentVisibility([(SBHTodayViewController *)self contentVisibility]);
  [v5 appendString:v11 withName:@"contentVisibility"];

  id v12 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBHTodayViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"), @"isAppearingOrAppeared", 1);
  id v13 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBHTodayViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared"), @"isDisappearingOrDisappeared", 1);
  id v14 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBHTodayViewController isSpotlightVisible](self, "isSpotlightVisible"), @"spotlightVisible");
  if ([(SBHTodayViewController *)self isOverridingViewControllerAppearanceStateToRemainDisappeared])
  {
    id v15 = (id)[v5 appendObject:self->_viewControllerAppearStateOverrideAssertions withName:@"_viewControllerAppearStateOverrideAssertions"];
  }
  if ([(SBHTodayViewController *)self _isWidgetHitTestingDisabled]) {
    id v16 = (id)[v5 appendBool:self->_widgetHitTestingDisabledReasons != 0 withName:@"_widgetHitTestingDisabledReasons"];
  }
  if ([(SBHTodayViewController *)self _shouldKeepIconImageViewControllersStatic])
  {
    id v17 = (id)[v5 appendObject:self->_keepStaticAssertions withName:@"_keepStaticAssertions"];
  }
  return v5;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (_UILegibilitySettings)overrideLegibilitySettings
{
  return self->_overrideLegibilitySettings;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (SBHTodayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHTodayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFOverlayDismissalDelegate)dismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);
  return (SBFOverlayDismissalDelegate *)WeakRetained;
}

- (void)setDismissalDelegate:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (UIViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (void)setListView:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (NSMapTable)onScreenIconIndexRangeByIconListView
{
  return self->_onScreenIconIndexRangeByIconListView;
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (void)setSpotlightVisible:(BOOL)a3
{
  self->_spotlightVisible = a3;
}

- (void)setIconLocation:(id)a3
{
}

- (int64_t)location
{
  return self->_location;
}

- (double)searchBarTopOffset
{
  return self->_searchBarTopOffset;
}

- (BOOL)isOverlayViewDisappearing
{
  return self->_isOverlayViewDisappearing;
}

- (void)setIsOverlayViewDisappearing:(BOOL)a3
{
  self->_isOverlayViewDisappearing = a3;
}

- (double)mostRecentPresentationProgress
{
  return self->_mostRecentPresentationProgress;
}

- (void)setMostRecentPresentationProgress:(double)a3
{
  self->_mostRecentPresentationProgress = a3;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (void)setIconViewProvider:(id)a3
{
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (void)setWidgetSettings:(id)a3
{
}

- (NSMutableArray)scrollViewDidEndScrollingHandlers
{
  return self->_scrollViewDidEndScrollingHandlers;
}

- (void)setScrollViewDidEndScrollingHandlers:(id)a3
{
}

- (SBHScrollableIconViewInteraction)scrollingInteraction
{
  return self->_scrollingInteraction;
}

- (void)setScrollingInteraction:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)scrollViewLeadingConstraint
{
  return self->_scrollViewLeadingConstraint;
}

- (void)setScrollViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewTrailingConstraint
{
  return self->_scrollViewTrailingConstraint;
}

- (void)setScrollViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)listViewMinimumHeightConstraint
{
  return self->_listViewMinimumHeightConstraint;
}

- (void)setListViewMinimumHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)listViewMinimumWidthConstraint
{
  return self->_listViewMinimumWidthConstraint;
}

- (void)setListViewMinimumWidthConstraint:(id)a3
{
}

- (SBHTodayIconListLayoutDelegate)listLayoutDelegate
{
  return self->_listLayoutDelegate;
}

- (void)setListLayoutDelegate:(id)a3
{
}

- (UIView)carouselReferenceForLegacyWidgetListView
{
  return self->_carouselReferenceForLegacyWidgetListView;
}

- (void)setCarouselReferenceForLegacyWidgetListView:(id)a3
{
}

- (UIView)legacyListContainerView
{
  return self->_legacyListContainerView;
}

- (void)setLegacyListContainerView:(id)a3
{
}

- (MTMaterialView)legacyListPlatterView
{
  return self->_legacyListPlatterView;
}

- (void)setLegacyListPlatterView:(id)a3
{
}

- (NSMutableDictionary)cancelTouchesAssertionsByLegacyWidgetID
{
  return self->_cancelTouchesAssertionsByLegacyWidgetID;
}

- (void)setCancelTouchesAssertionsByLegacyWidgetID:(id)a3
{
}

- (NSMutableDictionary)cancelTouchesAssertionsByWidgetID
{
  return self->_cancelTouchesAssertionsByWidgetID;
}

- (void)setCancelTouchesAssertionsByWidgetID:(id)a3
{
}

- (SBFTouchPassThroughView)spotlightContainerView
{
  return self->_spotlightContainerView;
}

- (void)setSpotlightContainerView:(id)a3
{
}

- (NSLayoutConstraint)stackViewToScrollViewTopConstraint
{
  return self->_stackViewToScrollViewTopConstraint;
}

- (NSLayoutConstraint)stackViewToScrollViewBottomConstraint
{
  return self->_stackViewToScrollViewBottomConstraint;
}

- (NSLayoutConstraint)stackViewToScrollViewLeadingConstraint
{
  return self->_stackViewToScrollViewLeadingConstraint;
}

- (void)setStackViewToScrollViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewToScrollViewTrailingConstraint
{
  return self->_stackViewToScrollViewTrailingConstraint;
}

- (void)setStackViewToScrollViewTrailingConstraint:(id)a3
{
}

- (NSMutableSet)suspendVisibleRowRangeUpdatesReasons
{
  return self->_suspendVisibleRowRangeUpdatesReasons;
}

- (void)setSuspendVisibleRowRangeUpdatesReasons:(id)a3
{
}

- (NSMutableSet)widgetHitTestingDisabledReasons
{
  return self->_widgetHitTestingDisabledReasons;
}

- (void)setWidgetHitTestingDisabledReasons:(id)a3
{
}

- (double)firstWidgetTopOffset
{
  return self->_firstWidgetTopOffset;
}

- (double)widgetsLeadingOffset
{
  return self->_widgetsLeadingOffset;
}

- (BOOL)widgetsAreCenteredForFullScreen
{
  return self->_widgetsAreCenteredForFullScreen;
}

- (NSHashTable)viewControllerAppearStateOverrideAssertions
{
  return self->_viewControllerAppearStateOverrideAssertions;
}

- (void)setViewControllerAppearStateOverrideAssertions:(id)a3
{
}

- (BOOL)enableEditingModeWhenScrollEnds
{
  return self->_enableEditingModeWhenScrollEnds;
}

- (void)setEnableEditingModeWhenScrollEnds:(BOOL)a3
{
  self->_enableEditingModeWhenScrollEnds = a3;
}

- (CGPoint)scrollingBeginningOffset
{
  double x = self->_scrollingBeginningOffset.x;
  double y = self->_scrollingBeginningOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScrollingBeginningOffset:(CGPoint)a3
{
  self->_scrollingBeginningOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerAppearStateOverrideAssertions, 0);
  objc_storeStrong((id *)&self->_widgetHitTestingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_suspendVisibleRowRangeUpdatesReasons, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_spotlightContainerView, 0);
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByWidgetID, 0);
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByLegacyWidgetID, 0);
  objc_storeStrong((id *)&self->_legacyListPlatterView, 0);
  objc_storeStrong((id *)&self->_legacyListContainerView, 0);
  objc_storeStrong((id *)&self->_carouselReferenceForLegacyWidgetListView, 0);
  objc_storeStrong((id *)&self->_listLayoutDelegate, 0);
  objc_storeStrong((id *)&self->_listViewMinimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_listViewMinimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_scrollViewDidEndScrollingHandlers, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_onScreenIconIndexRangeByIconListView, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dismissalDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_overrideLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_keepStaticAssertions, 0);
  objc_storeStrong((id *)&self->_iconViewsForbiddenFromEditing, 0);
}

@end