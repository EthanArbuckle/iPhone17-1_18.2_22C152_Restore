@interface SBRootFolderView
+ (NSString)dockIconLocation;
+ (id)defaultIconLocation;
+ (void)_editButtonLayoutFramesInBounds:(CGRect)a3 forVisualConfiguration:(id)a4 withTranslationOffset:(double)a5 inRTL:(BOOL)a6 doneButton:(id)a7 addWidgetButton:(id)a8 doneButtonFrame:(CGRect *)a9 addWidgetButtonFrame:(CGRect *)a10;
+ (void)_getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 forListLayout:(id)a6 withTranslationOffset:(double)a7 inRTL:(BOOL)a8;
+ (void)_getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 forVisualConfiguration:(id)a6 includingContentEdgeInsets:(BOOL)a7 withTranslationOffset:(double)a8 inRTL:(BOOL)a9;
- (BOOL)_leadingCustomViewShouldShowDoneButtonWhenEditing;
- (BOOL)_shouldIgnoreOverscrollOnFirstPageForCurrentOrientation;
- (BOOL)_shouldIgnoreOverscrollOnFirstPageForOrientation:(int64_t)a3;
- (BOOL)_shouldIgnoreOverscrollOnLastPageForCurrentOrientation;
- (BOOL)_shouldIgnoreOverscrollOnLastPageForOrientation:(int64_t)a3;
- (BOOL)_useParallaxOnPageControl;
- (BOOL)allowsAutoscrollToLeadingCustomView;
- (BOOL)allowsFreeScrollingUntilScrollingEnds;
- (BOOL)hidesOffscreenCustomPageViews;
- (BOOL)iconScrollView:(id)a3 shouldSetAutoscrollContentOffset:(CGPoint)a4;
- (BOOL)iconScrollView:(id)a3 shouldSetContentOffset:(CGPoint *)a4 animated:(BOOL)a5;
- (BOOL)isDockExternal;
- (BOOL)isDockViewBorrowed;
- (BOOL)isDockVisible;
- (BOOL)isLeadingCustomViewBouncing;
- (BOOL)isLeadingCustomViewPageHidden;
- (BOOL)isLeadingCustomViewPageHiddenAtIndex:(unint64_t)a3;
- (BOOL)isModifyingDockOffscreenFraction;
- (BOOL)isOccludedByOverlay;
- (BOOL)isOnLeadingCustomPage;
- (BOOL)isOnTrailingCustomPage;
- (BOOL)isPageControlHidden;
- (BOOL)isPageManagementUITransitioningOutOfVisible;
- (BOOL)isPageManagementUIVisible;
- (BOOL)isScrollAccessoryBorrowed;
- (BOOL)isSearchHidden;
- (BOOL)scrollViewHeightIncludesPageControlAndDock;
- (BOOL)shiftsPullDownSearchForVisibility;
- (BOOL)shouldFadeDockOutDuringTransitionToLeadingCustomView;
- (BOOL)shouldPinScrollingToFirstOrLastPageScrollOffsetForProposedScrollOffset:(CGPoint *)a3;
- (BOOL)shouldScrollDockDuringTransitionToLeadingCustomView;
- (BOOL)shouldScrollPageControlDuringTransitionToLeadingCustomView;
- (BOOL)showsAddWidgetButton;
- (BOOL)showsDoneButton;
- (BOOL)userAttemptedToOverscrollFirstPageDuringCurrentGesture;
- (BOOL)userAttemptedToOverscrollLastPageDuringCurrentGesture;
- (BSInvalidatable)configuredForSnapshotPageDotsVisibilityAssertion;
- (BSInvalidatable)editingPageDotsVisibilityAssertion;
- (BSInvalidatable)scrollingPageDotsVisibilityAssertion;
- (BSInvalidatable)scrubbingPageDotsVisibilityAssertion;
- (BSInvalidatable)searchButtonDisabledPageDotsVisibilityAssertion;
- (BSInvalidatable)searchButtonUnsupportedHardwarePageDotsVisibilityAssertion;
- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9;
- (CGRect)_scaledBoundsForMinimumHomeScreenScale;
- (CGRect)_scrollViewFrameForDockEdge:(unint64_t)a3;
- (CGRect)enterEditingTouchRect;
- (NSArray)leadingCustomViewControllers;
- (NSArray)trailingCustomViewControllers;
- (NSIndexSet)hiddenLeadingCustomPageIndexes;
- (NSMutableArray)pageDotsVisibilityAssertions;
- (NSString)dockIconLocation;
- (NSTimer)pageDotsVisibilityTimer;
- (SBDockIconListView)dockListView;
- (SBDockView)dockView;
- (SBFParallaxSettings)parallaxSettings;
- (SBFolderScrollAccessoryView)scrollAccessoryView;
- (SBHHomePullToSearchSettings)pullToSearchSettings;
- (SBHMinusPageStepper)customPageAnimationStepper;
- (SBHRootFolderSettings)folderSettings;
- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration;
- (SBHSearchPresenting)searchPresenter;
- (SBHTouchPassThroughView)titledButtonsContainerView;
- (SBIconListViewIconLocationTransitioning)firstListViewIconLocationTransitionHandler;
- (SBRootFolderView)initWithConfiguration:(id)a3;
- (SBRootFolderViewLayoutManager)specialLayoutManager;
- (SBRootFolderViewLayoutManager)transitioningNewSpecialLayoutManager;
- (SBRootFolderViewLayoutManager)transitioningOldSpecialLayoutManager;
- (SBSearchBackdropView)leadingCustomBackdropView;
- (SBSearchBackdropView)searchBackdropView;
- (SBSearchBackdropView)trailingCustomBackdropView;
- (SBSearchGesture)searchGesture;
- (SBTitledHomeScreenButton)doneButton;
- (SBTitledHomeScreenButton)widgetButton;
- (UIEdgeInsets)_statusBarInsetsForDockEdge:(unint64_t)a3 dockOffscreenPercentage:(double)a4;
- (UIEdgeInsets)statusBarInsetsForDockEdge:(unint64_t)a3;
- (UILabel)idleTextView;
- (UIView)leadingCustomView;
- (UIView)leadingCustomViewWrapperView;
- (UIView)pullDownSearchView;
- (UIView)scrollAccessoryAuxiliaryView;
- (UIView)scrollAccessoryBackgroundView;
- (UIView)searchPresentableView;
- (UIView)trailingCustomSearchDimmingView;
- (UIView)trailingCustomView;
- (_SBRootFolderLayoutWrapperView)searchPulldownWrapperView;
- (_SBRootFolderViewElementBorrowedAssertion)dockBorrowedAssertion;
- (_SBRootFolderViewElementBorrowedAssertion)scrollAccessoryBorrowedAssertion;
- (double)_firstPageScrollOffsetForOverscroll;
- (double)_lastPageScrollOffsetForOverscroll;
- (double)_minimumHomeScreenScale;
- (double)_spotlightFirstIconRowOffset;
- (double)additionalScrollWidthToKeepVisibleInOneDirection;
- (double)currentDockOffscreenFraction;
- (double)dockHeight;
- (double)externalDockPageControlVerticalMargin;
- (double)internalDockPageControlVerticalMargin;
- (double)leadingCustomViewPageScrollOffset;
- (double)leadingCustomViewPageScrollOffsetUsingPageWidth:(double)a3;
- (double)leadingCustomViewVisibilityProgress;
- (double)maxDockHeight;
- (double)pageControlAlpha;
- (double)pullDownSearchVisibilityProgress;
- (double)pullToSearchActivationThreshold;
- (double)pullToSearchFadeInThreshold;
- (double)pullToSearchTranslatesIcons;
- (double)scrollableWidthForVisibleColumnRange;
- (double)scrollingAdjustment;
- (double)titledButtonsAlpha;
- (double)trailingCustomViewPageScrollOffset;
- (double)trailingCustomViewPageScrollOffsetUsingPageWidth:(double)a3;
- (double)trailingCustomViewVisibilityProgress;
- (id)_createIconListViewForList:(id)a3;
- (id)_stateCaptureString;
- (id)accessibilityTintColorForDockView:(id)a3;
- (id)additionalIconListViews;
- (id)beginModifyingDockOffscreenFractionForReason:(id)a3;
- (id)borrowDockViewForReason:(id)a3;
- (id)borrowScrollAccessoryForReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)editMenu;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)iconListView:(id)a3 alternateIconLocationForListWithNonDefaultSizedIcons:(BOOL)a4;
- (id)iconListViewAtIndex:(unint64_t)a3;
- (id)iconListViewAtPoint:(CGPoint)a3;
- (id)iconListViewForExtraIndex:(unint64_t)a3;
- (id)iconListViewForIconListModelIndex:(unint64_t)a3;
- (id)iconLocationForListsWithNonDefaultSizedIcons;
- (id)leadingCustomViewController;
- (id)makeTitledButtonOfClass:(Class)a3;
- (id)newDockBackgroundMaterialViewWithInitialWeighting:(double)a3;
- (id)newDockBackgroundView;
- (id)newHomeScreenButtonBackgroundView;
- (id)requirePageDotsVisibilityForReason:(id)a3;
- (id)rootListLayout;
- (id)rootWithWidgetsListLayout;
- (id)searchableLeadingCustomWrapperView;
- (id)trailingCustomViewController;
- (id)trailingCustomViewWrapperView;
- (id)visibleIconListViews;
- (int64_t)_adjustPageIndexForPageControl:(int64_t)a3;
- (int64_t)_adjustPageIndexFromPageControl:(int64_t)a3;
- (int64_t)_pageCountForPageControl;
- (int64_t)firstLeadingCustomPageIndex;
- (int64_t)lastLeadingCustomPageIndex;
- (int64_t)pageIndexForLeadingCustomPageIndex:(unint64_t)a3;
- (unint64_t)_countOfLeadingCustomViewsThatShouldNotBeIndicatedInPageControl;
- (unint64_t)_countOfTrailingCustomViewsThatShouldNotBeIndicatedInPageControl;
- (unint64_t)dockEdge;
- (unint64_t)folderPageManagementAllowedOrientations;
- (unint64_t)ignoresOverscrollOnFirstPageOrientations;
- (unint64_t)ignoresOverscrollOnLastPageOrientations;
- (unint64_t)leadingCustomPageCount;
- (unint64_t)totalLeadingCustomPageCount;
- (unint64_t)trailingCustomPageCount;
- (void)_adjustLeadingCustomContentForEdgeBounce;
- (void)_animateViewsForPullingToSearch;
- (void)_animateViewsForPullingToSearchWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)_animateViewsForScrollingToLeadingOrTrailingCustomView;
- (void)_animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)_applyPageDotsVisibilityAssertions;
- (void)_captureInitialSearchScrollTrackingState;
- (void)_cleanUpAfterOverscrollScrollGestureEnded:(id)a3;
- (void)_cleanUpAfterScrolling;
- (void)_cleanupAfterExtraScrollGesturesCompleted;
- (void)_currentPageIndexDidChangeFromPageIndex:(int64_t)a3;
- (void)_doPageManagementEducation;
- (void)_flashPageDotsForReason:(id)a3;
- (void)_forceLayoutPageControl;
- (void)_layoutSubviews;
- (void)_layoutSubviewsForLeadingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)_layoutSubviewsForPulldownSearch;
- (void)_layoutSubviewsForTrailingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)_overscrollScrollPanGestureRecognizerDidUpdate:(id)a3;
- (void)_reduceMotionStatusDidChange:(id)a3;
- (void)_resetSearchScrollTrackingState;
- (void)_setupIdleTextPrivacyDisclosures;
- (void)_setupLeadingCustomBackdropViewIfNecessary;
- (void)_setupSearchBackdropViewIfNecessary;
- (void)_setupStateDumper;
- (void)_setupTrailingCustomBackdropViewIfNecessary;
- (void)_setupTrailingCustomDimmingViewIfNecessary;
- (void)_updateDockBackgroundViewForOcclusionByOverlay;
- (void)_updateDockViewZOrdering;
- (void)_updateEditingStateAnimated:(BOOL)a3;
- (void)_updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:(BOOL)a3;
- (void)_updateIconListLegibilitySettings;
- (void)_updatePageControlNumberOfPages;
- (void)_updateParallaxSettings;
- (void)_updatePullToSearchSettings;
- (void)_updateScrollingState:(BOOL)a3;
- (void)_willScrollToPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)cleanUpAfterTransition;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)doneButtonTriggered:(id)a3;
- (void)elementBorrowedAssertionDidInvalidate:(id)a3;
- (void)enterPageManagementUIWithCompletionHandler:(id)a3;
- (void)enumerateScrollViewPageViewsUsingBlock:(id)a3;
- (void)exitPageManagementUIWithCompletionHandler:(id)a3;
- (void)folderDidChange;
- (void)getMetrics:(SBRootFolderViewMetrics *)a3;
- (void)getMetrics:(SBRootFolderViewMetrics *)a3 dockEdge:(unint64_t)a4;
- (void)iconScrollViewDidCancelTouchTracking:(id)a3;
- (void)iconTintButtonTriggered:(id)a3;
- (void)layoutDockViewWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)layoutPageControlWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)layoutSearchableViews;
- (void)layoutSearchableViewsWithMetrics:(const SBRootFolderViewMetrics *)a3;
- (void)minimumHomeScreenScaleDidChange;
- (void)pageControlDidBeginScrubbing:(id)a3;
- (void)pageControlDidEndScrubbing:(id)a3;
- (void)pageControlDidReceiveButtonTap:(id)a3;
- (void)prepareForTransition;
- (void)remoteBasebandLogCollectionStateDidChange:(BOOL)a3;
- (void)removeDockOffscreenFractionClient:(id)a3;
- (void)resetIconListViews;
- (void)returnScalingView;
- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowsAutoscrollToLeadingCustomView:(BOOL)a3;
- (void)setAllowsFreeScrollingUntilScrollingEnds:(BOOL)a3;
- (void)setConfiguredForSnapshotPageDotsVisibilityAssertion:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDockBorrowedAssertion:(id)a3;
- (void)setDockEdge:(unint64_t)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingPageDotsVisibilityAssertion:(id)a3;
- (void)setFirstListViewIconLocationTransitionHandler:(id)a3;
- (void)setFolderSettings:(id)a3;
- (void)setHiddenLeadingCustomPageIndexes:(id)a3;
- (void)setIdleText:(id)a3;
- (void)setIdleText:(id)a3 animated:(BOOL)a4;
- (void)setLeadingCustomViewBouncing:(BOOL)a3;
- (void)setLeadingCustomViewPageHidden:(BOOL)a3;
- (void)setLeadingCustomViewPageHidden:(BOOL)a3 atIndex:(unint64_t)a4;
- (void)setLeadingCustomViewVisibilityProgress:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setNeedsLayout;
- (void)setOccludedByOverlay:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPageControlAlpha:(double)a3;
- (void)setPageControlHidden:(BOOL)a3;
- (void)setPageDotsVisibilityAssertions:(id)a3;
- (void)setPageDotsVisibilityTimer:(id)a3;
- (void)setPullDownSearchVisibilityProgress:(double)a3;
- (void)setPullToSearchActivationThreshold:(double)a3;
- (void)setPullToSearchFadeInThreshold:(double)a3;
- (void)setPullToSearchTranslatesIcons:(double)a3;
- (void)setScrollAccessoryBorrowedAssertion:(id)a3;
- (void)setScrollingAdjustment:(double)a3;
- (void)setScrollingPageDotsVisibilityAssertion:(id)a3;
- (void)setScrubbingPageDotsVisibilityAssertion:(id)a3;
- (void)setSearchButtonDisabledPageDotsVisibilityAssertion:(id)a3;
- (void)setSearchButtonUnsupportedHardwarePageDotsVisibilityAssertion:(id)a3;
- (void)setSearchGesture:(id)a3;
- (void)setSearchHidden:(BOOL)a3;
- (void)setShiftsPullDownSearchForVisibility:(BOOL)a3;
- (void)setShowsAddWidgetButton:(BOOL)a3;
- (void)setShowsAddWidgetButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setSpecialLayoutManager:(id)a3;
- (void)setSpecialLayoutManager:(id)a3 completionHandler:(id)a4;
- (void)setSuppressesEditingStateForListViews:(BOOL)a3;
- (void)setTitledButtonsAlpha:(double)a3;
- (void)setTitledButtonsContainerView:(id)a3;
- (void)setTodayViewVisibilityProgress:(double)a3;
- (void)setTrailingCustomViewVisibilityProgress:(double)a3;
- (void)setTransitioningNewSpecialLayoutManager:(id)a3;
- (void)setTransitioningOldSpecialLayoutManager:(id)a3;
- (void)setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:(BOOL)a3;
- (void)setUserAttemptedToOverscrollLastPageDuringCurrentGesture:(BOOL)a3;
- (void)setWidgetButton:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)tearDownListViews;
- (void)transitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)updateAccessibilityTintColors;
- (void)updateDockViewOrientation;
- (void)updateEditButtonMenu;
- (void)updateIconListIndexAndVisibility:(BOOL)a3;
- (void)updateIconListViews;
- (void)updatePageControlConfiguration;
- (void)widgetButtonTriggered:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBRootFolderView

- (SBDockView)dockView
{
  return self->_dockView;
}

- (id)iconListViewAtIndex:(unint64_t)a3
{
  v5 = -[SBRootFolderView iconListViewForExtraIndex:](self, "iconListViewForExtraIndex:");
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBRootFolderView;
    id v7 = [(SBFolderView *)&v10 iconListViewAtIndex:a3];
  }
  v8 = v7;

  return v8;
}

- (id)iconListViewForExtraIndex:(unint64_t)a3
{
  if (a3 == 10000)
  {
    v4 = self->_dockListView;
  }
  else
  {
    v6 = [(SBRootFolderView *)self leadingCustomViewController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(SBRootFolderView *)self leadingCustomViewController];
      v9 = [v8 iconListViewQueryable];

      objc_super v10 = objc_msgSend(MEMORY[0x1E4F28D58], "sb_indexPathWithListIndex:", a3);
      v11 = [(SBFolderView *)self folder];
      v4 = [v9 iconListViewForListAtIndexPath:v10 inFolder:v11];
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)leadingCustomViewController
{
  v2 = [(SBRootFolderView *)self leadingCustomViewControllers];
  v3 = [v2 lastObject];

  return v3;
}

- (BOOL)isLeadingCustomViewPageHidden
{
  return self->_leadingCustomViewPageHidden;
}

- (UIView)leadingCustomView
{
  v2 = [(NSArray *)self->_searchableLeadingCustomWrapperViews lastObject];
  v3 = [v2 wrappedView];

  return (UIView *)v3;
}

- (UIView)trailingCustomView
{
  v2 = [(NSArray *)self->_searchableTrailingCustomWrapperViews firstObject];
  v3 = [v2 wrappedView];

  return (UIView *)v3;
}

- (double)scrollableWidthForVisibleColumnRange
{
  if ([(SBFolderView *)self isVertical])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolderView;
    [(SBFolderView *)&v8 scrollableWidthForVisibleColumnRange];
  }
  else
  {
    [(SBRootFolderView *)self bounds];
    return CGRectGetWidth(*(CGRect *)&v4);
  }
  return result;
}

- (double)additionalScrollWidthToKeepVisibleInOneDirection
{
  if (([(SBRootFolderView *)self dockEdge] & 0xA) != 0)
  {
    [(SBRootFolderView *)self maxDockHeight];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRootFolderView;
    [(SBFolderView *)&v4 additionalScrollWidthToKeepVisibleInOneDirection];
  }
  return result;
}

- (unint64_t)dockEdge
{
  return self->_dockEdge;
}

- (void)layoutDockViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  if (![(SBRootFolderView *)self isDockViewBorrowed])
  {
    v5 = [(SBRootFolderView *)self dockView];
    if (v5)
    {
      v6 = [(SBRootFolderView *)self dockListView];
      char v7 = [(SBFolderView *)self listLayoutProvider];
      objc_super v8 = [v7 layoutForIconLocation:@"SBIconLocationDock"];

      BOOL v9 = [(SBRootFolderView *)self isDockExternal];
      p_var6 = &a3->var6;
      if (v9) {
        p_var6 = (CGRect *)MEMORY[0x1E4F1DB28];
      }
      CGSize size = p_var6->size;
      CGPoint origin = p_var6->origin;
      CGSize v29 = size;
      double v12 = SBHIconListLayoutListIconSpacingWithDefault(v8, 1, 20.0);
      char v13 = [MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock];
      char v14 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlock];
      BOOL v15 = [(SBRootFolderView *)self isModifyingDockOffscreenFraction];
      [v5 frame];
      CGRectGetWidth(v30);
      char IsZero = BSFloatIsZero();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__SBRootFolderView_layoutDockViewWithMetrics___block_invoke;
      aBlock[3] = &unk_1E6AAEE48;
      id v21 = v5;
      CGPoint v23 = origin;
      CGSize v24 = v29;
      v25 = a3;
      id v17 = v6;
      id v22 = v17;
      double v26 = v12;
      char v27 = IsZero;
      v18 = _Block_copy(aBlock);
      v19 = v18;
      if (!v15 || (v13 & 1) != 0 || (v14 & 1) != 0) {
        (*((void (**)(void *))v18 + 2))(v18);
      }
      else {
        [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v18];
      }
    }
  }
}

- (BOOL)isDockExternal
{
  return self->_dockExternal;
}

- (BOOL)isModifyingDockOffscreenFraction
{
  return [(NSHashTable *)self->_dockOffscreenProgressSettingClients count] != 0;
}

- (BOOL)isDockViewBorrowed
{
  v2 = [(SBRootFolderView *)self dockBorrowedAssertion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_SBRootFolderViewElementBorrowedAssertion)dockBorrowedAssertion
{
  return self->_dockBorrowedAssertion;
}

- (SBDockIconListView)dockListView
{
  return self->_dockListView;
}

- (id)additionalIconListViews
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_dockListView)
  {
    v5[0] = self->_dockListView;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRootFolderView;
    v2 = [(SBFolderView *)&v4 additionalIconListViews];
  }
  return v2;
}

- (BOOL)isDockVisible
{
  [(SBRootFolderView *)self currentDockOffscreenFraction];
  if (v3 >= 1.0) {
    return 0;
  }
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  if (v4 >= 1.0) {
    return 0;
  }
  [(SBRootFolderView *)self trailingCustomViewVisibilityProgress];
  return v5 < 1.0;
}

- (double)currentDockOffscreenFraction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_dockOffscreenProgressSettingClients;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "desiredOffscreenFraction", (void)v10);
        if (v8 > v6) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = -1.79769313e308;
  }

  double result = 0.0;
  if (v6 != -1.79769313e308) {
    return v6;
  }
  return result;
}

+ (NSString)dockIconLocation
{
  return (NSString *)@"SBIconLocationDock";
}

- (void)prepareForTransition
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 prepareForTransition];
  [(UILabel *)self->_idleTextView setHidden:1];
}

- (void)updateIconListIndexAndVisibility:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView updateIconListIndexAndVisibility:](&v5, sel_updateIconListIndexAndVisibility_);
  if (self->_scrollToSearchIsDraggingOrAnimating
    || a3
    || ([(SBRootFolderView *)self leadingCustomViewVisibilityProgress],
        (BSFloatIsZero() & 1) == 0))
  {
    [(SBRootFolderView *)self _updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:1];
  }
}

- (void)getMetrics:(SBRootFolderViewMetrics *)a3 dockEdge:(unint64_t)a4
{
  a3->var10.size.height = 0.0;
  *(_OWORD *)&a3->var9.size.height = 0u;
  *(_OWORD *)&a3->var10.origin.y = 0u;
  *(_OWORD *)&a3->var8.size.height = 0u;
  *(_OWORD *)&a3->var9.origin.y = 0u;
  *(_OWORD *)&a3->var7 = 0u;
  *(_OWORD *)&a3->var8.origin.y = 0u;
  a3->var6.CGPoint origin = 0u;
  a3->var6.CGSize size = 0u;
  a3->var5.CGPoint origin = 0u;
  a3->var5.CGSize size = 0u;
  a3->var4.CGPoint origin = 0u;
  a3->var4.CGSize size = 0u;
  a3->var3.CGPoint origin = 0u;
  a3->var3.CGSize size = 0u;
  a3->var2.CGPoint origin = 0u;
  a3->var2.CGSize size = 0u;
  a3->var1.CGPoint origin = 0u;
  a3->var1.CGSize size = 0u;
  a3->var0.CGPoint origin = 0u;
  a3->var0.CGSize size = 0u;
  [(SBRootFolderView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  [(SBRootFolderView *)self safeAreaInsets];
  uint64_t v15 = [(SBRootFolderView *)self rootWithWidgetsListLayout];
  v16 = [(SBRootFolderView *)self rootWithWidgetsListLayout];
  [v16 iconImageInfo];
  double v18 = v17;

  int IsZero = BSFloatIsZero();
  double v20 = 1.0;
  remainder.origin.x = v8;
  remainder.origin.y = v10;
  if (!IsZero) {
    double v20 = v18;
  }
  double v123 = v20;
  remainder.size.width = v12;
  remainder.size.height = v14;
  v140.origin.x = v8;
  v140.origin.y = v10;
  v140.size.width = v12;
  v140.size.height = v14;
  v139.origin.x = v8;
  v139.origin.y = v10;
  v139.size.width = v12;
  v139.size.height = v14;
  v142.origin.x = v8;
  v142.origin.y = v10;
  v142.size.width = v12;
  v142.size.height = v14;
  double Width = CGRectGetWidth(v142);
  v143.origin.x = v8;
  v143.origin.y = v10;
  double v124 = v12;
  v143.size.width = v12;
  v143.size.height = v14;
  if (Width < CGRectGetHeight(v143))
  {
    v144.origin.x = v8;
    v144.origin.y = v10;
    v144.size.width = v12;
    v144.size.height = v14;
    CGFloat v22 = CGRectGetWidth(v144);
    v145.origin.x = v8;
    v145.origin.y = v10;
    v145.size.width = v12;
    v145.size.height = v14;
    v139.size.width = CGRectGetHeight(v145);
    v139.size.height = v22;
  }
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  double v24 = v23;
  [(SBRootFolderView *)self trailingCustomViewVisibilityProgress];
  double v26 = v25;
  char v27 = [(SBRootFolderView *)self rootFolderVisualConfiguration];
  v28 = [(SBFolderView *)self gridSizeClassDomain];
  [(SBRootFolderView *)self dockHeight];
  double v30 = v29;
  [(SBRootFolderView *)self currentDockOffscreenFraction];
  double v32 = v31;
  CGRectEdge v33 = CGRectMinYEdge;
  double rect = v14;
  int v34 = 2;
  switch(a4)
  {
    case 0uLL:
    case 4uLL:
      goto LABEL_19;
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_20;
    case 2uLL:
      int v34 = 0;
      goto LABEL_7;
    case 8uLL:
LABEL_7:
      BOOL v35 = [(SBRootFolderView *)self isDockExternal];
      BOOL v36 = [(SBFolderView *)self isRTL];
      double v37 = 1.0;
      if (v32 > 0.0) {
        double v37 = 1.0 - v32;
      }
      double v38 = v30 * v37;
      if (v24 >= v26) {
        double v39 = v24;
      }
      else {
        double v39 = v26;
      }
      v146.origin.x = v8;
      v146.origin.y = v10;
      v146.size.width = v124;
      v146.size.height = rect;
      double v40 = v39 * (CGRectGetWidth(v146) - v30);
      double v14 = rect;
      double v41 = fmax(v30 - v40, 0.0);
      if (v30 <= v41) {
        double v41 = v30;
      }
      if (v38 <= v41) {
        double v42 = v38;
      }
      else {
        double v42 = v41;
      }
      CGRectEdge v33 = v34;
      break;
    default:
      if (a4 == 15) {
LABEL_19:
      }
        CGRectEdge v33 = CGRectMaxYEdge;
LABEL_20:
      BOOL v35 = [(SBRootFolderView *)self isDockExternal];
      BOOL v36 = [(SBFolderView *)self isRTL];
      double v43 = 1.0;
      if (v32 > 0.0) {
        double v43 = 1.0 - v32;
      }
      double v42 = v30 * v43;
      break;
  }
  if (v42 >= 0.0)
  {
    double v44 = v14;
  }
  else
  {
    double v44 = v14 - v42;
    remainder.size.height = v14 - v42;
    double v42 = 0.0;
  }
  p_var6 = &a3->var6;
  double v46 = v8;
  double v47 = v10;
  double v48 = v124;
  CGRectDivide(*(CGRect *)(&v44 - 3), &a3->var6, &remainder, v42, v33);
  memset(&slice, 0, sizeof(slice));
  CGRectDivide(v140, &slice, &v140, v30, v33);
  memset(&v137, 0, sizeof(v137));
  CGRectDivide(v139, &v137, &v139, v30, v33);
  CGFloat v49 = CGRectGetWidth(v140);
  double v50 = v24 * v49;
  double v119 = v49;
  double v51 = v26 * v49;
  switch(v33)
  {
    case CGRectMinYEdge:
    case CGRectMaxYEdge:
      p_height = (CGSize *)&a3->var6.size.height;
      break;
    default:
      p_height = &a3->var6.size;
      break;
  }
  p_height->width = v30;
  double v53 = 0.0;
  if ([(SBRootFolderView *)self shouldScrollDockDuringTransitionToLeadingCustomView])
  {
    if (a4 > 0xF) {
      goto LABEL_44;
    }
    if (((1 << a4) & 0x106) == 0)
    {
      if (((1 << a4) & 0x8011) == 0) {
        goto LABEL_44;
      }
      if ([(SBRootFolderView *)self shouldFadeDockOutDuringTransitionToLeadingCustomView])
      {
        if (v50 <= 0.0)
        {
          if (v51 > 0.0)
          {
            double v117 = -v51;
            if (!v36) {
              double v117 = v51;
            }
            double v53 = 0.0 - v117;
          }
        }
        else if (v36)
        {
          double v53 = -v50;
        }
        else
        {
          double v53 = v50;
        }
      }
      else
      {
        double v54 = -v50;
        if (!v36) {
          double v54 = v50;
        }
        double v55 = v54 + p_var6->origin.x;
        double v56 = -v51;
        if (!v36) {
          double v56 = v51;
        }
        p_var6->origin.x = v55 - v56;
      }
    }
  }
  a3->var7 = v53;
LABEL_44:
  [(SBFolderView *)self headerHeight];
  if (v57 != 0.0)
  {
    CGFloat v58 = v57;
    CGRectDivide(remainder, &a3->var0, &remainder, v57, CGRectMinYEdge);
    memset(&v136, 0, sizeof(v136));
    CGRectDivide(v140, &v136, &v140, v58, CGRectMinYEdge);
    memset(&v135, 0, sizeof(v135));
    CGRectDivide(v139, &v135, &v139, v58, CGRectMinYEdge);
  }
  v59 = [(SBRootFolderView *)self doneButton];
  v60 = [(SBRootFolderView *)self widgetButton];
  CGSize v61 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v134.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v134.CGSize size = v61;
  CGSize v120 = v61;
  CGPoint origin = v134.origin;
  CGPoint v132 = v134.origin;
  CGSize v133 = v61;
  v62 = [(SBRootFolderView *)self leadingCustomViewController];
  double v63 = v50;
  if (objc_opt_respondsToSelector())
  {
    [v62 scrollPageOffsetForButtonsInEditingMode];
    double v63 = v64;
  }
  objc_msgSend((id)objc_opt_class(), "_editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:", v27, v36, v59, v60, &v132, &v134, v8, v10, v124, v14, v63);
  CGSize size = v134.size;
  a3->var2.CGPoint origin = v134.origin;
  a3->var2.CGSize size = size;
  CGSize v66 = v133;
  a3->var1.CGPoint origin = v132;
  a3->var1.CGSize size = v66;

  if (self->_idleTextView)
  {
    uint64_t v67 = [(SBFolderView *)self orientation];
    [v15 layoutInsetsForOrientation:v67];
    double v69 = v68;
    SBHIconListLayoutLargestExtraIconImageSizeInDomain(v15, v67, v28);
    CGFloat v71 = v69 + v70 * -0.5;
    memset(&v134, 0, sizeof(v134));
    memset(&v131, 0, sizeof(v131));
    CGRectDivide(remainder, &v134, &v131, v71, CGRectMinYEdge);
    memset(&v130, 0, sizeof(v130));
    CGRectDivide(remainder, &v130, &remainder, v71, CGRectMinYEdge);
    memset(&v129, 0, sizeof(v129));
    CGRectDivide(v140, &v129, &v140, v71, CGRectMinYEdge);
    memset(&v128, 0, sizeof(v128));
    CGRectDivide(v139, &v128, &v139, v71, CGRectMinYEdge);
    v72 = [(UILabel *)self->_idleTextView font];
    [v72 lineHeight];

    [v27 idleTextVerticalOffset];
    UIRectInsetEdges();
    CGRectGetWidth(remainder);
    UISizeRoundToScale();
    BSRectWithSize();
    double v118 = v123;
    UIRectCenteredYInRectScale();
    a3->var3.size.width = v75;
    a3->var3.size.height = v76;
    double v77 = v50;
    if (v36) {
      double v77 = -v50;
    }
    a3->var3.origin.x = v77 + v73;
    a3->var3.origin.y = v74;
  }
  v78 = [(SBRootFolderView *)self scrollAccessoryView];
  v79 = [(SBFolderView *)self pageControl];
  if (v35) {
    [(SBRootFolderView *)self externalDockPageControlVerticalMargin];
  }
  else {
    [(SBRootFolderView *)self internalDockPageControlVerticalMargin];
  }
  double v81 = v80;
  [v27 pageControlFrameInset];
  [v78 intrinsicContentSize];
  double v83 = v82;
  CGFloat v85 = v84;
  [v79 sizeForNumberOfPages:2];
  if (v83 < v86) {
    double v83 = v86;
  }
  SBFFloatCeilForScale();
  CGFloat v88 = v87;
  SBFFloatCeilForScale();
  CGFloat v90 = v89;
  v147.origin.x = 0.0;
  v147.origin.y = 0.0;
  v147.size.width = v83;
  v147.size.height = v85;
  CGRectInset(v147, v88, v90);
  UIRectCenteredXInRectScale();
  CGFloat v92 = v91;
  CGFloat v94 = v93;
  CGFloat v96 = v95;
  CGFloat v98 = v97;
  double MaxY = CGRectGetMaxY(remainder);
  v148.origin.x = v92;
  v148.origin.y = v94;
  v148.size.width = v96;
  v148.size.height = v98;
  CGFloat v100 = MaxY - CGRectGetHeight(v148) - v81;
  double v101 = CGRectGetMaxY(remainder);
  v149.origin.x = v92;
  v149.origin.y = v100;
  v149.size.width = v96;
  v149.size.height = v98;
  CGFloat v102 = v101 - CGRectGetMinY(v149);
  memset(&v127, 0, sizeof(v127));
  CGRectDivide(remainder, &v127, &remainder, v102, CGRectMaxYEdge);
  memset(&v126, 0, sizeof(v126));
  CGRectDivide(v140, &v126, &v140, v102, CGRectMaxYEdge);
  memset(&v125, 0, sizeof(v125));
  CGRectDivide(v139, &v125, &v139, v102, CGRectMaxYEdge);
  [(SBRootFolderView *)self shouldScrollPageControlDuringTransitionToLeadingCustomView];
  SBFRectRoundForScale();
  a3->var5.origin.x = v103;
  a3->var5.origin.y = v104;
  a3->var5.size.width = v105;
  a3->var5.size.height = v106;

  if (v35)
  {
    a3->var4.origin.x = v8;
    a3->var4.origin.y = v10;
    a3->var4.size.width = v124;
    a3->var4.size.height = rect;
  }
  else if ([(SBRootFolderView *)self scrollViewHeightIncludesPageControlAndDock])
  {
    CGFloat v107 = CGRectGetWidth(v140);
    v150.origin.x = v8;
    v150.origin.y = v10;
    v150.size.width = v124;
    v150.size.height = rect;
    CGFloat Height = CGRectGetHeight(v150);
    a3->var4.origin.x = v8;
    a3->var4.origin.y = v10;
    a3->var4.size.width = v107;
    a3->var4.size.height = Height;
  }
  else
  {
    CGSize v109 = v140.size;
    a3->var4.CGPoint origin = v140.origin;
    a3->var4.CGSize size = v109;
  }
  if (self->_searchableLeadingCustomWrapperViews || self->_searchableTrailingCustomWrapperViews)
  {
    v110 = [(SBFolderView *)self scrollView];
    -[SBRootFolderView convertRect:toView:](self, "convertRect:toView:", v110, v8, v10, v124, rect);
    CGFloat v112 = v111;
    CGFloat v114 = v113;
    if ([(NSArray *)self->_searchableLeadingCustomWrapperViews count])
    {
      a3->var8.origin.x = 0.0;
      a3->var8.origin.y = 0.0;
      a3->var8.size.width = v112;
      a3->var8.size.height = v114;
      [(SBRootFolderView *)self leadingCustomViewPageScrollOffsetUsingPageWidth:v119];
      a3->var8.origin.x = v115;
    }
    if ([(NSArray *)self->_searchableTrailingCustomWrapperViews count])
    {
      a3->var9.origin.x = 0.0;
      a3->var9.origin.y = 0.0;
      a3->var9.size.width = v112;
      a3->var9.size.height = v114;
      [(SBRootFolderView *)self trailingCustomViewPageScrollOffsetUsingPageWidth:v119];
      a3->var9.origin.x = v116;
    }
  }
  a3->var10.CGPoint origin = origin;
  a3->var10.CGSize size = v120;
}

- (void)_animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  double v6 = v5;
  [(SBRootFolderView *)self trailingCustomViewVisibilityProgress];
  double v8 = v7;
  if (v7 <= 0.0) {
    double v7 = v6;
  }
  [(SBFSteppedAnimationTimingFunctionCalculator *)self->_customPageAnimationStepper setPercentComplete:v7];
  [(SBHMinusPageStepper *)self->_customPageAnimationStepper backgroundBlurAlpha];
  double v10 = v9;
  unint64_t v11 = [(SBRootFolderView *)self dockEdge];
  id v23 = [(SBRootFolderView *)self dockView];
  BOOL v12 = [(SBRootFolderView *)self shouldFadeDockOutDuringTransitionToLeadingCustomView];
  double v13 = 1.0;
  if (v12 && v11 <= 0xF && ((1 << v11) & 0x8011) != 0) {
    double v13 = 1.0 - v10;
  }
  [v23 setBackgroundAlpha:v13];
  if (![(SBRootFolderView *)self isScrollAccessoryBorrowed])
  {
    BOOL v14 = [(SBRootFolderView *)self shouldFadePageControlOutDuringTransitionToLeadingCustomView];
    double v15 = 1.0;
    if (v14)
    {
      customPageAnimationStepper = self->_customPageAnimationStepper;
      if (customPageAnimationStepper) {
        [(SBHMinusPageStepper *)customPageAnimationStepper pageControlAlpha];
      }
    }
    [(SBRootFolderView *)self setPageControlAlpha:v15];
  }
  [(SBSearchBackdropView *)self->_leadingCustomBackdropView setHidden:BSFloatIsZero()];
  [(SBSearchBackdropView *)self->_trailingCustomBackdropView setHidden:BSFloatIsZero()];
  [(UIView *)self->_trailingCustomSearchDimmingView setAlpha:v8];
  [(SBRootFolderView *)self layoutDockViewWithMetrics:a3];
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  BOOL v19 = v17 > 0.0
     && ([(SBRootFolderView *)self leadingCustomViewVisibilityProgress], v18 != 1.0)
     && [(SBRootFolderView *)self _leadingCustomViewShouldShowDoneButtonWhenEditing];
  if (![(SBRootFolderView *)self isPageManagementUIVisible] && !v19)
  {
    double v20 = [(SBRootFolderView *)self doneButton];
    objc_msgSend(v20, "sbf_setBoundsAndPositionFromFrame:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);

    id v21 = [(SBRootFolderView *)self widgetButton];
    objc_msgSend(v21, "sbf_setBoundsAndPositionFromFrame:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, a3->var2.size.height);
  }
  [(SBRootFolderView *)self layoutPageControlWithMetrics:a3];
  -[UILabel sbf_setBoundsAndPositionFromFrame:](self->_idleTextView, "sbf_setBoundsAndPositionFromFrame:", a3->var3.origin.x, a3->var3.origin.y, a3->var3.size.width, a3->var3.size.height);
  CGFloat v22 = [(SBFolderView *)self headerView];
  objc_msgSend(v22, "sbf_setBoundsAndPositionFromFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
}

- (double)leadingCustomViewVisibilityProgress
{
  return self->_leadingCustomViewVisibilityProgress;
}

- (BOOL)shouldFadeDockOutDuringTransitionToLeadingCustomView
{
  objc_super v3 = [(SBRootFolderView *)self dockView];
  BOOL v4 = ([v3 isDockInset] & 1) == 0 && (-[SBRootFolderView dockEdge](self, "dockEdge") & 0xA) == 0;

  return v4;
}

- (double)trailingCustomViewVisibilityProgress
{
  return self->_trailingCustomViewVisibilityProgress;
}

- (SBTitledHomeScreenButton)widgetButton
{
  return self->_widgetButton;
}

- (SBTitledHomeScreenButton)doneButton
{
  return self->_doneButton;
}

- (BOOL)isPageManagementUIVisible
{
  v2 = [(SBRootFolderView *)self specialLayoutManager];
  objc_super v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SBRootFolderViewLayoutManager)specialLayoutManager
{
  return self->_specialLayoutManager;
}

- (void)layoutPageControlWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  if (![(SBRootFolderView *)self isScrollAccessoryBorrowed])
  {
    double v5 = [(SBRootFolderView *)self scrollAccessoryView];
    double v6 = [(SBFolderView *)self pageControl];
    char v7 = [MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock];
    char v8 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlock];
    BOOL v9 = [(SBRootFolderView *)self isModifyingDockOffscreenFraction];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__SBRootFolderView_layoutPageControlWithMetrics___block_invoke;
    aBlock[3] = &unk_1E6AADF50;
    id v10 = v5;
    id v15 = v10;
    double v17 = a3;
    id v11 = v6;
    id v16 = v11;
    BOOL v12 = _Block_copy(aBlock);
    double v13 = v12;
    if (!v9 || (v7 & 1) != 0 || (v8 & 1) != 0) {
      (*((void (**)(void *))v12 + 2))(v12);
    }
    else {
      [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v12];
    }
  }
}

void __49__SBRootFolderView_layoutPageControlWithMetrics___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "sbf_setBoundsAndPositionFromFrame:", *(double *)(*(void *)(a1 + 48) + 160), *(double *)(*(void *)(a1 + 48) + 168), *(double *)(*(void *)(a1 + 48) + 176), *(double *)(*(void *)(a1 + 48) + 184));
  v2 = *(void **)(a1 + 40);
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *(double *)(*(void *)(a1 + 48) + 296), *(double *)(*(void *)(a1 + 48) + 304), *(double *)(*(void *)(a1 + 48) + 312), *(double *)(*(void *)(a1 + 48) + 320));
  v5[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setTouchIgnoreRects:v4];
}

- (void)setPageControlAlpha:(double)a3
{
  if (![(SBRootFolderView *)self isScrollAccessoryBorrowed])
  {
    id v5 = [(SBRootFolderView *)self scrollAccessoryView];
    [v5 setAlpha:a3];
  }
}

- (BOOL)isScrollAccessoryBorrowed
{
  v2 = [(SBRootFolderView *)self scrollAccessoryBorrowedAssertion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_SBRootFolderViewElementBorrowedAssertion)scrollAccessoryBorrowedAssertion
{
  return self->_scrollAccessoryBorrowedAssertion;
}

- (SBFolderScrollAccessoryView)scrollAccessoryView
{
  return self->_scrollAccessoryView;
}

- (id)rootWithWidgetsListLayout
{
  BOOL v3 = [(SBFolderView *)self listLayoutProvider];
  BOOL v4 = [(SBRootFolderView *)self iconLocationForListsWithNonDefaultSizedIcons];
  id v5 = [v3 layoutForIconLocation:v4];

  return v5;
}

- (id)iconLocationForListsWithNonDefaultSizedIcons
{
  BOOL v3 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 iconLocationForListsWithNonDefaultSizedIconsForRootFolderView:self];
  }
  else {
  BOOL v4 = [(id)objc_opt_class() defaultIconLocation];
  }

  return v4;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  v2 = [(SBRootFolderView *)self rootListLayout];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 rootFolderVisualConfiguration];
  }
  else
  {
    BOOL v3 = objc_alloc_init(SBHRootFolderVisualConfiguration);
  }
  BOOL v4 = v3;

  return v4;
}

- (id)rootListLayout
{
  BOOL v3 = [(SBFolderView *)self listLayoutProvider];
  BOOL v4 = [(SBFolderView *)self iconLocation];
  id v5 = [v3 layoutForIconLocation:v4];

  return v5;
}

- (double)dockHeight
{
  if ([(SBRootFolderView *)self isDockExternal])
  {
    BOOL v3 = [(SBFolderView *)self delegate];
    double v4 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v3 externalDockHeightForRootFolderView:self];
      double v4 = v5;
    }

    return v4;
  }
  else
  {
    dockView = self->_dockView;
    [(SBDockView *)dockView dockHeight];
  }
  return result;
}

- (double)trailingCustomViewPageScrollOffsetUsingPageWidth:(double)a3
{
  int64_t v5 = [(SBRootFolderView *)self trailingCustomViewPageIndex];
  [(SBFolderView *)self _scrollOffsetForPageAtIndex:v5 pageWidth:a3];
  return result;
}

- (BOOL)shouldScrollPageControlDuringTransitionToLeadingCustomView
{
  return 1;
}

- (BOOL)shouldScrollDockDuringTransitionToLeadingCustomView
{
  return 1;
}

- (double)internalDockPageControlVerticalMargin
{
  double v3 = 0.0;
  if ([(SBRootFolderView *)self scrollViewHeightIncludesPageControlAndDock])
  {
    double v4 = [(SBRootFolderView *)self rootFolderVisualConfiguration];
    [v4 pageControlVerticalOffset];
    double v3 = v5;
    double v6 = [(SBRootFolderView *)self scrollAccessoryAuxiliaryView];

    if (v6)
    {
      [v4 scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView];
      double v3 = v3 + v7;
    }
  }
  return v3;
}

- (BOOL)scrollViewHeightIncludesPageControlAndDock
{
  double v3 = self;
  LOBYTE(self) = [(SBRootFolderView *)self isMemberOfClass:v3];

  return (char)self;
}

- (UIView)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  -[SBFolderView layoutIconListsWithAnimationType:forceRelayout:](&v7, sel_layoutIconListsWithAnimationType_forceRelayout_);
  if (v4) {
    [(SBIconListView *)self->_dockListView setIconsNeedLayout];
  }
  [(SBIconListView *)self->_dockListView layoutIconsIfNeededWithAnimationType:a3 options:0];
}

uint64_t __46__SBRootFolderView_layoutDockViewWithMetrics___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sbf_setBoundsAndPositionFromFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) setDockListOffset:*(double *)(*(void *)(a1 + 80) + 224)];
  objc_msgSend(*(id *)(a1 + 40), "setIconSpacing:", *(double *)(a1 + 88), *(double *)(a1 + 88));
  uint64_t result = [*(id *)(a1 + 40) layoutIconsIfNeeded];
  if (*(unsigned char *)(a1 + 96))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 updateAccessibilityTintColor];
  }
  return result;
}

- (int64_t)_adjustPageIndexForPageControl:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  id v4 = [(SBFolderView *)&v6 _adjustPageIndexForPageControl:a3];
  return (int64_t)v4
       - [(SBRootFolderView *)self _countOfLeadingCustomViewsThatShouldNotBeIndicatedInPageControl];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBRootFolderView;
  char v8 = -[SBFolderView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
  if ([(SBFolderView *)self isEditing])
  {
    id v9 = v8;
  }
  else
  {
    id v10 = [(SBFolderView *)self scrollView];
    [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
    if (v11 > 0.0 && ([v8 isDescendantOfView:v10] & 1) == 0 && self->_dockView)
    {
      [(SBRootFolderView *)self pullDownSearchVisibilityProgress];
      if (BSFloatIsZero())
      {
        BOOL v12 = [(NSArray *)self->_searchableLeadingCustomWrapperViews lastObject];
      }
      else
      {
        BOOL v12 = self->_searchPulldownWrapperView;
      }
      double v13 = v12;
      -[SBRootFolderView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
      uint64_t v14 = -[SBHTouchPassThroughView hitTest:withEvent:](v13, "hitTest:withEvent:", v7);
      id v15 = (void *)v14;
      if (v14) {
        id v16 = (void *)v14;
      }
      else {
        id v16 = v8;
      }
      id v17 = v16;

      char v8 = v17;
    }
    id v9 = v8;
  }
  return v9;
}

- (void)_updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v5 = [(SBFolderView *)self scrollView];
  [(SBFolderView *)self currentScrollOffset];
  double v7 = v6;
  BOOL v8 = [(SBFolderView *)self isScrolling];
  if (v8)
  {
    [(SBFolderView *)self scrollOffsetForPageIndexCalculation];
    unint64_t v9 = -[SBFolderView typeForPage:](self, "typeForPage:", -[SBFolderView _pageIndexForOffset:](self, "_pageIndexForOffset:"));
    if ([v5 isTracking] && v9 == 1)
    {
      id v10 = [(SBRootFolderView *)self scrollingPageDotsVisibilityAssertion];

      if (!v10)
      {
        double v11 = [(SBRootFolderView *)self requirePageDotsVisibilityForReason:@"scrolling"];
        [(SBRootFolderView *)self setScrollingPageDotsVisibilityAssertion:v11];
      }
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v9 = [(SBFolderView *)self typeForPage:[(SBFolderView *)self currentPageIndex]];
  }
  BOOL v12 = [(SBRootFolderView *)self scrollingPageDotsVisibilityAssertion];
  [(SBRootFolderView *)self setScrollingPageDotsVisibilityAssertion:0];
  [v12 invalidate];

  if (v9)
  {
LABEL_8:
    int v13 = 0;
    goto LABEL_9;
  }
  BOOL v15 = [(SBFolderView *)self isRTL];
  double baseOffsetForDeterminingScrollToSearchThreshold = self->_baseOffsetForDeterminingScrollToSearchThreshold;
  double v17 = v7 - baseOffsetForDeterminingScrollToSearchThreshold;
  double v18 = baseOffsetForDeterminingScrollToSearchThreshold - v7;
  if (v15) {
    double v19 = v17;
  }
  else {
    double v19 = v18;
  }
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  int v13 = 1;
  if (BSFloatIsZero())
  {
    if (v19 > 0.0 && v3) {
      [(SBRootFolderView *)self layoutSearchableViews];
    }
  }
LABEL_9:
  if (![(SBRootFolderView *)self isLeadingCustomViewPageHidden])
  {
    BOOL v14 = ((v8 | v13) & 1) == 0
       && [(SBRootFolderView *)self hidesOffscreenCustomPageViews];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = self->_searchableLeadingCustomWrapperViews;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "setHidden:", v14, (void)v26);
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v23);
    }
  }
}

- (void)setScrollingPageDotsVisibilityAssertion:(id)a3
{
}

- (BSInvalidatable)scrollingPageDotsVisibilityAssertion
{
  return self->_scrollingPageDotsVisibilityAssertion;
}

- (BOOL)hidesOffscreenCustomPageViews
{
  return 1;
}

- (id)iconListViewForIconListModelIndex:(unint64_t)a3
{
  double v5 = -[SBRootFolderView iconListViewForExtraIndex:](self, "iconListViewForExtraIndex:");
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBRootFolderView;
    id v7 = [(SBFolderView *)&v10 iconListViewForIconListModelIndex:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (CGRect)enterEditingTouchRect
{
  [(SBRootFolderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(SBFolderView *)self orientation];
  BOOL v12 = [(SBFolderView *)self currentIconListView];
  if (!v12)
  {
    BOOL v12 = [(SBFolderView *)self firstIconListView];
  }
  [v12 layoutInsetsForOrientation:v11];
  double v14 = v13;
  double v16 = v15;
  double v17 = [(SBRootFolderView *)self rootFolderVisualConfiguration];
  [v17 editingEntryAreaHorizontalInset];
  double v19 = v18;
  if (v18 == -10000.0)
  {
    double v20 = [v12 layout];
    id v21 = [(SBFolderView *)self gridSizeClassDomain];
    double v19 = SBHIconListLayoutLargestExtraIconImageSizeInDomain(v20, v11, v21) + 40.0;
  }
  double v22 = v4 + v14 - v19;
  double v23 = v6 + 0.0;
  double v24 = v8 - (v14 - v19 + v16 - v19);
  double v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)cleanUpAfterTransition
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 cleanUpAfterTransition];
  [(UILabel *)self->_idleTextView setHidden:0];
  self->_iconListFrameOrientationOverride = 0;
  [(SBRootFolderView *)self _updatePageControlNumberOfPages];
  [(SBFolderView *)self _updatePageControlToIndex:[(SBFolderView *)self currentPageIndex]];
}

- (BOOL)iconScrollView:(id)a3 shouldSetContentOffset:(CGPoint *)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([(SBRootFolderView *)self allowsFreeScrollingUntilScrollingEnds]
    || ![(SBRootFolderView *)self shouldPinScrollingToFirstOrLastPageScrollOffsetForProposedScrollOffset:a4])
  {
    BOOL v10 = [(SBFolderView *)self isVertical];
    uint64_t v11 = 8;
    if (!v10) {
      uint64_t v11 = 0;
    }
    *(double *)((char *)&a4->x + v11) = self->_scrollingAdjustment + *(double *)((char *)&a4->x + v11);
    v13.receiver = self;
    v13.super_class = (Class)SBRootFolderView;
    BOOL v9 = [(SBFolderView *)&v13 iconScrollView:v8 shouldSetContentOffset:a4 animated:v5];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)allowsFreeScrollingUntilScrollingEnds
{
  return self->_allowsFreeScrollingUntilScrollingEnds;
}

- (void)_layoutSubviews
{
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  [(SBRootFolderView *)self getMetrics:&v6];
  objc_super v3 = [(SBFolderView *)self headerView];
  objc_msgSend(v3, "setFrame:", v6, v7);

  if (![(SBFolderView *)self isScalingViewBorrowed]) {
    [(SBRootFolderView *)self layoutSearchableViewsWithMetrics:&v6];
  }
  if (![(SBRootFolderView *)self isDockViewBorrowed]) {
    [(SBRootFolderView *)self layoutDockViewWithMetrics:&v6];
  }
  if ([(SBRootFolderView *)self isLeadingCustomViewBouncing])
  {
    [(SBRootFolderView *)self _adjustLeadingCustomContentForEdgeBounce];
    [(SBRootFolderView *)self setLeadingCustomViewBouncing:0];
  }
  double v4 = [(SBRootFolderView *)self searchGesture];
  [v4 updateForRotation];

  BOOL v5 = [(SBRootFolderView *)self searchPresentableView];
  [(SBRootFolderView *)self bounds];
  objc_msgSend(v5, "setFrame:");
}

- (UIView)searchPresentableView
{
  return self->_searchPresentableView;
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (BOOL)isLeadingCustomViewBouncing
{
  return self->_leadingCustomViewBouncing;
}

- (void)setContentVisibility:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  if ([(SBFolderView *)&v6 contentVisibility] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolderView;
    [(SBFolderView *)&v5 setContentVisibility:a3];
    [(SBRootFolderView *)self _updateDockBackgroundViewForOcclusionByOverlay];
  }
}

- (void)_updateDockBackgroundViewForOcclusionByOverlay
{
  objc_opt_class();
  objc_super v3 = [(SBDockView *)self->_dockView backgroundView];
  SBFSafeCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = v11;
  if (v11)
  {
    unint64_t v5 = [(SBFolderView *)self contentVisibility];
    objc_super v6 = [(SBRootFolderView *)self superview];
    if (v6)
    {
      long long v7 = [(SBRootFolderView *)self window];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }

    BOOL v9 = [(SBRootFolderView *)self isOccludedByOverlay];
    if (v5) {
      BOOL v10 = v8;
    }
    else {
      BOOL v10 = 0;
    }
    [v11 setContentReplacedWithSnapshot:v10 & v9];
    double v4 = v11;
  }
}

- (BOOL)isOccludedByOverlay
{
  return self->_occludedByOverlay;
}

- (void)_updateScrollingState:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    [(SBRootFolderView *)self setScrollingAdjustment:0.0];
    [(SBRootFolderView *)self setAllowsFreeScrollingUntilScrollingEnds:0];
    [(SBRootFolderView *)self _cleanupAfterExtraScrollGesturesCompleted];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v5 _updateScrollingState:v3];
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  if (BSFloatIsOne()) {
    [(SBRootFolderView *)self _captureInitialSearchScrollTrackingState];
  }
}

- (void)setScrollingAdjustment:(double)a3
{
  self->_scrollingAdjustment = a3;
}

- (void)_willScrollToPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView _willScrollToPageIndex:animated:](&v6, sel__willScrollToPageIndex_animated_, a3);
  [(SBRootFolderView *)self setAllowsFreeScrollingUntilScrollingEnds:1];
  if (v4 && ![(SBFolderView *)self isScrolling]) {
    [(SBRootFolderView *)self _captureInitialSearchScrollTrackingState];
  }
}

- (void)setAllowsFreeScrollingUntilScrollingEnds:(BOOL)a3
{
  self->_allowsFreeScrollingUntilScrollingEnds = a3;
}

- (void)_cleanupAfterExtraScrollGesturesCompleted
{
  BOOL v3 = [(SBFolderView *)self scrollView];
  id v4 = [v3 panGestureRecognizer];

  [(SBRootFolderView *)self _cleanUpAfterOverscrollScrollGestureEnded:v4];
}

- (void)_cleanUpAfterOverscrollScrollGestureEnded:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(SBRootFolderView *)self userAttemptedToOverscrollFirstPageDuringCurrentGesture];
  BOOL v5 = [(SBRootFolderView *)self userAttemptedToOverscrollLastPageDuringCurrentGesture];
  BOOL v6 = v5;
  if (v4 || v5)
  {
    long long v7 = [(SBFolderView *)self delegate];
    [v12 velocityInView:self];
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
    double v9 = v8;
    [v12 translationInView:self];
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
    double v11 = v10;
    if (v4)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 rootFolderView:self didEndOverscrollOnFirstPageWithVelocity:v9 translation:v11];
      }
      [(SBRootFolderView *)self setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:0];
    }
    if (v6)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 rootFolderView:self didEndOverscrollOnLastPageWithVelocity:v9 translation:v11];
      }
      [(SBRootFolderView *)self setUserAttemptedToOverscrollLastPageDuringCurrentGesture:0];
    }
  }
  self->_lastEventWasAttemptingToOverscrollFirstPage = 0;
  self->_lastEventWasAttemptingToOverscrollLastPage = 0;
}

- (BOOL)userAttemptedToOverscrollLastPageDuringCurrentGesture
{
  return self->_userAttemptedToOverscrollLastPageDuringCurrentGesture;
}

- (BOOL)userAttemptedToOverscrollFirstPageDuringCurrentGesture
{
  return self->_userAttemptedToOverscrollFirstPageDuringCurrentGesture;
}

- (void)_currentPageIndexDidChangeFromPageIndex:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v6 _currentPageIndexDidChangeFromPageIndex:a3];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  [(SBRootFolderView *)self getMetrics:v4];
  [(SBRootFolderView *)self _animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:v4];
  [(SBRootFolderView *)self layoutSearchableViewsWithMetrics:v4];
}

- (void)getMetrics:(SBRootFolderViewMetrics *)a3
{
  unint64_t v5 = [(SBRootFolderView *)self dockEdge];
  [(SBRootFolderView *)self getMetrics:a3 dockEdge:v5];
}

- (void)layoutSearchableViewsWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  -[SBRootFolderView _animateViewsForPullingToSearchWithMetrics:](self, "_animateViewsForPullingToSearchWithMetrics:");
  [(SBRootFolderView *)self _animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:a3];
  [(SBRootFolderView *)self _layoutSubviewsForPulldownSearch];
  [(SBRootFolderView *)self _layoutSubviewsForLeadingCustomViewWithMetrics:a3];
  [(SBRootFolderView *)self _layoutSubviewsForTrailingCustomViewWithMetrics:a3];
  [(SBRootFolderView *)self _updateDockOffscreenFractionWithMetrics:a3];
  if (![(SBFolderView *)self isRTL])
  {
    id v5 = [(SBFolderView *)self scrollView];
    [(SBRootFolderView *)self leadingCustomViewPageScrollOffset];
    objc_msgSend(v5, "_setFirstPageOffset:");
  }
}

- (double)leadingCustomViewPageScrollOffsetUsingPageWidth:(double)a3
{
  int64_t v5 = [(SBRootFolderView *)self firstLeadingCustomPageIndex];
  double result = 0.0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SBFolderView *)self _scrollOffsetForPageAtIndex:v5 pageWidth:a3];
  }
  return result;
}

- (double)leadingCustomViewPageScrollOffset
{
  [(SBFolderView *)self _pageWidth];
  -[SBRootFolderView leadingCustomViewPageScrollOffsetUsingPageWidth:](self, "leadingCustomViewPageScrollOffsetUsingPageWidth:");
  return result;
}

- (void)_layoutSubviewsForTrailingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  CGSize size = a3->var9.size;
  CGPoint origin = a3->var9.origin;
  CGSize v11 = size;
  [(SBFolderView *)self _pageWidthOrHeight];
  uint64_t v6 = v5;
  BOOL v7 = [(SBFolderView *)self isVertical];
  searchableTrailingCustomWrapperViews = self->_searchableTrailingCustomWrapperViews;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBRootFolderView__layoutSubviewsForTrailingCustomViewWithMetrics___block_invoke;
  v9[3] = &__block_descriptor_73_e47_v32__0___SBRootFolderLayoutWrapperView_8Q16_B24l;
  BOOL v13 = v7;
  uint64_t v12 = v6;
  [(NSArray *)searchableTrailingCustomWrapperViews enumerateObjectsUsingBlock:v9];
}

- (void)_layoutSubviewsForPulldownSearch
{
  searchBackdropView = self->_searchBackdropView;
  [(SBRootFolderView *)self _scaledBoundsForMinimumHomeScreenScale];
  -[SBSearchBackdropView setFrame:](searchBackdropView, "setFrame:");
}

- (CGRect)_scaledBoundsForMinimumHomeScreenScale
{
  [(SBRootFolderView *)self _minimumHomeScreenScale];
  double v4 = v3;
  [(SBRootFolderView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  UIRectGetCenter();
  CGAffineTransformMakeScale(&v17, 1.0 / v4, 1.0 / v4);
  v18.origin.double x = v6;
  v18.origin.double y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  CGRectApplyAffineTransform(v18, &v17);
  UIRectCenteredAboutPoint();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (double)_minimumHomeScreenScale
{
  double v3 = [(SBFolderView *)self delegate];
  double v4 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 minimumHomeScreenScaleForFolderView:self];
    double v4 = v5;
  }

  return v4;
}

- (void)_layoutSubviewsForLeadingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  CGSize size = a3->var8.size;
  CGPoint origin = a3->var8.origin;
  CGSize v11 = size;
  [(SBFolderView *)self _pageWidthOrHeight];
  uint64_t v6 = v5;
  BOOL v7 = [(SBFolderView *)self isVertical];
  searchableLeadingCustomWrapperViews = self->_searchableLeadingCustomWrapperViews;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBRootFolderView__layoutSubviewsForLeadingCustomViewWithMetrics___block_invoke;
  v9[3] = &__block_descriptor_73_e47_v32__0___SBRootFolderLayoutWrapperView_8Q16_B24l;
  BOOL v13 = v7;
  uint64_t v12 = v6;
  [(NSArray *)searchableLeadingCustomWrapperViews enumerateObjectsUsingBlock:v9];
}

- (void)_animateViewsForPullingToSearchWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  [(SBRootFolderView *)self pullDownSearchVisibilityProgress];
  double v6 = v5;
  double v7 = 0.0;
  if ([(SBRootFolderView *)self isOnLeadingCustomPage]) {
    double v8 = 0.0;
  }
  else {
    double v8 = v6;
  }
  if ([(SBRootFolderView *)self shiftsPullDownSearchForVisibility]) {
    double v9 = v6;
  }
  else {
    double v9 = 1.0;
  }
  CGFloat v10 = [(SBRootFolderView *)self searchPresenter];
  [(SBRootFolderView *)self bounds];
  uint64_t v52 = v12;
  uint64_t v53 = v11;
  uint64_t v51 = v13;
  uint64_t v15 = v14;
  if (v6 > 0.0 || v8 > 0.0)
  {
    [(SBRootFolderView *)self _spotlightFirstIconRowOffset];
    double v7 = v16;
  }
  double v50 = v6;
  if (v10)
  {
    double v17 = 0.0;
    uint64_t v18 = v15;
    if (self->_pullToSearchTranslatesIcons != 0.0 && [v10 presentationState] == 1)
    {
      [v10 presentationOffset];
      double v17 = v19;
    }
  }
  else
  {
    uint64_t v18 = v15;
    double v17 = v8 * v7;
  }
  double v20 = v9 * v7;
  double v21 = 0.0;
  if (v9 < 1.0) {
    double v21 = v7;
  }
  double v49 = v21;
  CGRect v56 = CGRectOffset(a3->var4, 0.0, v17);
  double x = v56.origin.x;
  double y = v56.origin.y;
  double width = v56.size.width;
  double height = v56.size.height;
  uint64_t v26 = [(SBFolderView *)self scrollView];
  [v26 frame];
  v59.origin.double x = v27;
  v59.origin.double y = v28;
  v59.size.double width = v29;
  v59.size.double height = v30;
  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  if (!CGRectEqualToRect(v57, v59)) {
    objc_msgSend(v26, "setFrame:", x, y, width, height);
  }
  double v31 = v7 - v20;
  if (v10)
  {
    uint64_t v32 = v18;
    if (self->_pullToSearchTranslatesIcons != 0.0)
    {
      memcpy(__dst, a3, sizeof(__dst));
      *(CGRect *)&__dst[192] = CGRectOffset(a3->var6, 0.0, v17);
      uint64_t v33 = [(SBRootFolderView *)self scrollAccessoryAuxiliaryView];
      if (!v33
        || (int v34 = (void *)v33,
            BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled(),
            v34,
            IsReduceMotionEnabled))
      {
        CGRect v58 = CGRectOffset(a3->var5, 0.0, v17);
        double v36 = v58.origin.x;
        double v37 = v58.origin.y;
        double v38 = v58.size.width;
        double v39 = v58.size.height;
        *(CGRect *)&__dst[160] = v58;
        double v40 = [(SBRootFolderView *)self scrollAccessoryView];
        objc_msgSend(v40, "sbf_setBoundsAndPositionFromFrame:", v36, v37, v38, v39);
      }
      -[SBRootFolderView layoutDockViewWithMetrics:](self, "layoutDockViewWithMetrics:", __dst, *(void *)&v49);
    }
    int v41 = 0;
    uint64_t v43 = v52;
    uint64_t v42 = v53;
    uint64_t v44 = v51;
  }
  else
  {
    v45 = [(SBRootFolderView *)self _window];
    int v41 = [v45 isRotating] ^ 1;

    uint64_t v43 = v52;
    uint64_t v42 = v53;
    uint64_t v44 = v51;
    uint64_t v32 = v18;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SBRootFolderView__animateViewsForPullingToSearchWithMetrics___block_invoke;
  aBlock[3] = &unk_1E6AAEF88;
  void aBlock[4] = self;
  aBlock[5] = v42;
  aBlock[6] = v43;
  aBlock[7] = v44;
  aBlock[8] = v32;
  *(double *)&aBlock[9] = v31;
  aBlock[10] = 0;
  *(double *)&aBlock[11] = v49;
  double v46 = _Block_copy(aBlock);
  double v47 = v46;
  if (v41) {
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v46];
  }
  else {
    (*((void (**)(void *))v46 + 2))(v46);
  }
  double v48 = [(SBRootFolderView *)self pullDownSearchView];
  objc_msgSend(v48, "setAlpha:", fmin(fmax((v50 - self->_pullToSearchFadeInThreshold)/ (self->_pullToSearchActivationThreshold - self->_pullToSearchFadeInThreshold)+ 0.0, 0.0), 1.0));
}

- (BOOL)isOnLeadingCustomPage
{
  return [(SBFolderView *)self currentPageType] == 0;
}

uint64_t __63__SBRootFolderView__animateViewsForPullingToSearchWithMetrics___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 896), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 896) setHeaderOffset:*(double *)(a1 + 72)];
  v2 = *(void **)(*(void *)(a1 + 32) + 896);
  double v3 = *(double *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  return objc_msgSend(v2, "setExtendedSize:", v3, v4);
}

- (BOOL)shiftsPullDownSearchForVisibility
{
  return self->_shiftsPullDownSearchForVisibility;
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (double)pullDownSearchVisibilityProgress
{
  return self->_pullDownSearchVisibilityProgress;
}

- (UIView)pullDownSearchView
{
  return [(_SBRootFolderLayoutWrapperView *)self->_searchPulldownWrapperView wrappedView];
}

- (void)setLeadingCustomViewBouncing:(BOOL)a3
{
  if (self->_leadingCustomViewBouncing != a3)
  {
    self->_leadingCustomViewBouncing = a3;
    [(SBRootFolderView *)self setNeedsLayout];
  }
}

+ (void)_editButtonLayoutFramesInBounds:(CGRect)a3 forVisualConfiguration:(id)a4 withTranslationOffset:(double)a5 inRTL:(BOOL)a6 doneButton:(id)a7 addWidgetButton:(id)a8 doneButtonFrame:(CGRect *)a9 addWidgetButtonFrame:(CGRect *)a10
{
  BOOL v14 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGPoint v36 = (CGPoint)0;
  id v22 = a7;
  id v23 = a4;
  objc_msgSend(a8, "sizeThatFits:", width, height);
  v37.double width = v24;
  v37.double height = v25;
  CGPoint v34 = (CGPoint)0;
  objc_msgSend(v22, "sizeThatFits:", width, height);
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v35.double width = v27;
  v35.double height = v29;
  if (a7) {
    CGFloat v30 = &v36;
  }
  else {
    CGFloat v30 = 0;
  }
  if (a7) {
    double v31 = &v34;
  }
  else {
    double v31 = &v36;
  }
  objc_msgSend(a1, "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forVisualConfiguration:includingContentEdgeInsets:withTranslationOffset:inRTL:", v30, v31, v23, 1, v14, x, y, width, height, a5);

  if (a9)
  {
    CGSize v32 = v35;
    a9->CGPoint origin = v34;
    a9->CGSize size = v32;
  }
  if (a10)
  {
    CGSize v33 = v37;
    a10->CGPoint origin = v36;
    a10->CGSize size = v33;
  }
}

+ (void)_getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 forVisualConfiguration:(id)a6 includingContentEdgeInsets:(BOOL)a7 withTranslationOffset:(double)a8 inRTL:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a7;
  id v13 = a6;
  id v56 = v13;
  if (v10)
  {
    [v13 editModeButtonContentEdgeInsets];
    SBHDirectionalEdgeInsetsGetEdgeInsets();
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v15 = *MEMORY[0x1E4FB2848];
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v21 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v22 = SBHEdgeInsetsInvert(v15);
  double v24 = v23;
  double v52 = v26;
  double v53 = v25;
  [v56 editModeButtonLayoutOffset];
  double v28 = v27;
  double v30 = v29;
  if (a3)
  {
    CGFloat v31 = v15 + a3->origin.y;
    CGFloat v32 = a3->size.width - (v21 + v17);
    CGFloat v33 = a3->size.height - (v19 + v15);
    a3->origin.double x = v17 + a3->origin.x;
    a3->origin.double y = v31;
    a3->size.double width = v32;
    a3->size.double height = v33;
    a3->origin.double y = v30 + CGRectGetMinY(a5);
  }
  CGPoint v34 = v56;
  if (a4)
  {
    CGFloat v35 = v15 + a4->origin.y;
    CGFloat v36 = a4->size.width - (v21 + v17);
    CGFloat v37 = a4->size.height - (v19 + v15);
    a4->origin.double x = v17 + a4->origin.x;
    a4->origin.double y = v35;
    a4->size.double width = v36;
    a4->size.double height = v37;
    if (a3)
    {
      double y = a3->origin.y;
    }
    else
    {
      CGFloat MinX = CGRectGetMinX(a5);
      CGPoint v34 = v56;
      double y = v30 + MinX;
    }
    a4->origin.double y = y;
  }
  BOOL v40 = !v9;
  if (v9) {
    int v41 = a4;
  }
  else {
    int v41 = a3;
  }
  if (v40) {
    uint64_t v42 = a4;
  }
  else {
    uint64_t v42 = a3;
  }
  if (v42)
  {
    double MaxX = CGRectGetMaxX(a5);
    CGFloat Width = CGRectGetWidth(*v42);
    CGPoint v34 = v56;
    v42->origin.double x = MaxX - Width - v28 + a8;
  }
  if (v41)
  {
    CGFloat v45 = CGRectGetMinX(a5);
    CGPoint v34 = v56;
    v41->origin.double x = v28 + v45 + a8;
  }
  if (a3)
  {
    CGFloat v46 = v22 + a3->origin.y;
    CGFloat v47 = a3->size.width - (v24 + v52);
    CGFloat v48 = a3->size.height - (v22 + v53);
    a3->origin.double x = v24 + a3->origin.x;
    a3->origin.double y = v46;
    a3->size.double width = v47;
    a3->size.double height = v48;
  }
  if (a4)
  {
    CGFloat v49 = v22 + a4->origin.y;
    CGFloat v50 = a4->size.width - (v24 + v52);
    CGFloat v51 = a4->size.height - (v22 + v53);
    a4->origin.double x = v24 + a4->origin.x;
    a4->origin.double y = v49;
    a4->size.double width = v50;
    a4->size.double height = v51;
  }
}

- (void)_updatePageControlNumberOfPages
{
  double v3 = [(SBFolderView *)self pageControl];
  uint64_t v4 = [v3 numberOfPages];
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v6 _updatePageControlNumberOfPages];
  if (v4 != [v3 numberOfPages])
  {
    double v5 = [(SBRootFolderView *)self scrollAccessoryAuxiliaryView];

    if (v5) {
      [(SBRootFolderView *)self _forceLayoutPageControl];
    }
    [(SBRootFolderView *)self _applyPageDotsVisibilityAssertions];
  }
}

- (int64_t)_pageCountForPageControl
{
  unint64_t v3 = [(SBRootFolderView *)self leadingCustomPageCount];
  unint64_t v4 = [(SBRootFolderView *)self _countOfLeadingCustomViewsThatShouldNotBeIndicatedInPageControl];
  unint64_t v5 = [(SBRootFolderView *)self trailingCustomPageCount];
  unint64_t v6 = [(SBRootFolderView *)self _countOfTrailingCustomViewsThatShouldNotBeIndicatedInPageControl];
  double v7 = [(SBFolderView *)self folder];
  int64_t v8 = v3 + v5 - (v4 + v6) + [v7 visibleListCount];

  return v8;
}

- (id)trailingCustomViewController
{
  v2 = [(SBRootFolderView *)self trailingCustomViewControllers];
  unint64_t v3 = [v2 firstObject];

  return v3;
}

- (void)setNeedsLayout
{
  [(SBIconListView *)self->_dockListView setIconsNeedLayout];
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 setNeedsLayout];
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBFolderView *)self suppressesEditingStateForListViews] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRootFolderView;
    [(SBFolderView *)&v6 setSuppressesEditingStateForListViews:v3];
    unint64_t v5 = [(SBFolderView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 rootFolderViewDidChangeSuppressesEditingStateForListViews:self];
    }
  }
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView _updateEditingStateAnimated:](&v5, sel__updateEditingStateAnimated_);
  [(SBIconListView *)self->_dockListView setEditing:[(SBFolderView *)self isEditing] & ([(SBFolderView *)self suppressesEditingStateForListViews] ^ 1)];
  [(SBIconListView *)self->_dockListView updateEditingStateAnimated:v3];
}

- (SBRootFolderView)initWithConfiguration:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v121.receiver = self;
  v121.super_class = (Class)SBRootFolderView;
  objc_super v5 = [(SBFolderView *)&v121 initWithConfiguration:v4];
  if (!v5) {
    goto LABEL_73;
  }
  objc_super v6 = self;
  if (objc_opt_isKindOfClass()) {
    double v7 = v4;
  }
  else {
    double v7 = 0;
  }
  id v8 = v7;

  BOOL v9 = [(SBFolderView *)v5 folder];
  uint64_t v10 = [v8 isForSnapshot];
  v5->_dockEdge = 4;
  CGSize v109 = v8;
  v110 = v5;
  id v108 = v4;
  if ([v8 isDockExternal])
  {
    v5->_dockExternal = 1;
  }
  else
  {
    uint64_t v11 = [v9 dock];
    uint64_t v12 = [(SBRootFolderView *)v5 dockIconLocation];
    id v13 = [SBDockIconListView alloc];
    double v14 = [(SBFolderView *)v5 listLayoutProvider];
    uint64_t v15 = [(SBFolderView *)v5 orientation];
    double v16 = [(SBFolderView *)v5 iconViewProvider];
    uint64_t v17 = [(SBDockIconListView *)v13 initWithModel:v11 layoutProvider:v14 iconLocation:v12 orientation:v15 iconViewProvider:v16];
    dockListView = v110->_dockListView;
    v110->_dockListView = (SBDockIconListView *)v17;

    objc_super v5 = v110;
    [(SBIconListView *)v110->_dockListView setLayoutInsetsMode:2];
    [(SBIconListView *)v110->_dockListView setAutomaticallyAdjustsLayoutMetricsToFit:0];
    [(SBIconListView *)v110->_dockListView setAdjustsColumnPositionsForFullScreenWidth:1];
    double v19 = v110->_dockListView;
    double v20 = [(SBFolderView *)v110 folderIconImageCache];
    [(SBIconListView *)v19 setFolderIconImageCache:v20];

    double v21 = v110->_dockListView;
    double v22 = [(SBFolderView *)v110 iconImageCache];
    [(SBIconListView *)v21 setIconImageCache:v22];

    [(SBIconListView *)v5->_dockListView setDragDelegate:v5];
    double v23 = [[SBDockView alloc] initWithDockListView:v110->_dockListView forSnapshot:v10];
    dockView = v110->_dockView;
    v110->_dockView = v23;

    [(SBDockView *)v5->_dockView setDelegate:v5];
    id v8 = v109;
  }
  double v25 = [(SBFolderView *)v5 scalingView];
  uint64_t v26 = [(SBFolderView *)v5 headerView];
  if (v26) {
    [v25 addSubview:v26];
  }
  CGFloat v112 = [(SBFolderView *)v5 scrollView];
  objc_msgSend(v25, "addSubview:");
  CGFloat v104 = [(SBRootFolderView *)v5 rootFolderVisualConfiguration];
  [v104 pageControlCustomPadding];
  double v28 = v27;
  double v30 = v29;
  CGFloat v31 = [(SBFolderView *)v5 pageControl];
  CGFloat v32 = v31;
  if (v28 > 0.0) {
    [v31 _setCustomHorizontalPadding:v28];
  }
  CGFloat v105 = (void *)v26;
  if (v30 > 0.0) {
    [v32 _setCustomVerticalPadding:v30];
  }
  CGFloat v33 = [[SBFolderScrollAccessoryView alloc] initWithFolder:v9 pageControl:v32];
  scrollAccessoryView = v5->_scrollAccessoryView;
  v5->_scrollAccessoryView = v33;

  uint64_t v35 = [v8 scrollAccessoryAuxiliaryView];
  scrollAccessoryAuxiliaryView = v5->_scrollAccessoryAuxiliaryView;
  v5->_scrollAccessoryAuxiliaryView = (UIView *)v35;

  uint64_t v37 = [v8 scrollAccessoryBackgroundView];
  scrollAccessoryBackgroundView = v5->_scrollAccessoryBackgroundView;
  v5->_scrollAccessoryBackgroundView = (UIView *)v37;

  [v25 addSubview:v5->_scrollAccessoryView];
  [(SBRootFolderView *)v5 updatePageControlConfiguration];
  if (v10)
  {
    double v39 = [(SBRootFolderView *)v5 requirePageDotsVisibilityForReason:@"snapshot"];
    [(SBRootFolderView *)v5 setConfiguredForSnapshotPageDotsVisibilityAssertion:v39];
  }
  if (!SBHHardwareSupportsHomeScreenSearchAffordance())
  {
    BOOL v40 = [(SBRootFolderView *)v5 requirePageDotsVisibilityForReason:@"hardware-unsupported"];
    [(SBRootFolderView *)v5 setSearchButtonUnsupportedHardwarePageDotsVisibilityAssertion:v40];
    goto LABEL_20;
  }
  if (!v5->_scrollAccessoryAuxiliaryView)
  {
    BOOL v40 = [(SBRootFolderView *)v5 requirePageDotsVisibilityForReason:@"feature-disabled"];
    [(SBRootFolderView *)v5 setSearchButtonDisabledPageDotsVisibilityAssertion:v40];
LABEL_20:
  }
  [(SBRootFolderView *)v5 _applyPageDotsVisibilityAssertions];
  if (v5->_dockView)
  {
    objc_msgSend(v25, "addSubview:");
    [(SBRootFolderView *)v5 _updateDockViewZOrdering];
  }
  uint64_t v41 = [(SBRootFolderView *)v5 traitCollection];
  uint64_t v42 = [(SBFolderView *)v5 overrideIconImageAppearance];
  CGFloat v106 = v25;
  double v101 = v42;
  CGFloat v102 = (void *)v41;
  if (v42)
  {
    id v43 = v42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v41);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v44 = v43;
  CGFloat v45 = [v8 leadingCustomViewControllers];
  uint64_t v46 = [v45 copy];
  leadingCustomViewControllers = v5->_leadingCustomViewControllers;
  v5->_leadingCustomViewControllers = (NSArray *)v46;

  if ([(NSArray *)v5->_leadingCustomViewControllers count]) {
    id v111 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v111 = 0;
  }
  CGFloat v103 = v32;
  CGFloat v107 = v9;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  CGFloat v48 = v5->_leadingCustomViewControllers;
  uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v117 objects:v124 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    char v51 = 0;
    uint64_t v52 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v118 != v52) {
          objc_enumerationMutation(v48);
        }
        double v54 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        double v55 = [v54 view];
        if (v55)
        {
          id v56 = objc_alloc_init(_SBRootFolderLayoutWrapperView);
          [(_SBRootFolderLayoutWrapperView *)v56 setWrappedView:v55];
          if (v44 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v54 setOverrideIconImageAppearance:v44];
          }
          [v112 addSubview:v56];
          [v111 addObject:v56];

          char v51 = 1;
        }
        else
        {
          v110->_leadingCustomViewPageHidden = 1;
        }
      }
      uint64_t v50 = [(NSArray *)v48 countByEnumeratingWithState:&v117 objects:v124 count:16];
    }
    while (v50);
  }
  else
  {
    char v51 = 0;
  }

  uint64_t v57 = [v111 copy];
  searchableLeadingCustomWrapperViews = v110->_searchableLeadingCustomWrapperViews;
  v110->_searchableLeadingCustomWrapperViews = (NSArray *)v57;

  CGRect v59 = [v109 trailingCustomViewControllers];
  uint64_t v60 = [v59 copy];
  trailingCustomViewControllers = v110->_trailingCustomViewControllers;
  v110->_trailingCustomViewControllers = (NSArray *)v60;

  if ([(NSArray *)v110->_trailingCustomViewControllers count]) {
    id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v62 = 0;
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  double v63 = v110->_trailingCustomViewControllers;
  uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:&v113 objects:v123 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v65; ++j)
      {
        if (*(void *)v114 != v66) {
          objc_enumerationMutation(v63);
        }
        double v68 = *(void **)(*((void *)&v113 + 1) + 8 * j);
        double v69 = [v68 view];
        if (v69)
        {
          double v70 = objc_alloc_init(_SBRootFolderLayoutWrapperView);
          [(_SBRootFolderLayoutWrapperView *)v70 setWrappedView:v69];
          if (v44 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v68 setOverrideIconImageAppearance:v44];
          }
          [v112 addSubview:v70];
          [v62 addObject:v70];

          char v51 = 1;
        }
      }
      uint64_t v65 = [(NSArray *)v63 countByEnumeratingWithState:&v113 objects:v123 count:16];
    }
    while (v65);
  }

  uint64_t v71 = [v62 copy];
  objc_super v5 = v110;
  searchableTrailingCustomWrapperViews = v110->_searchableTrailingCustomWrapperViews;
  v110->_searchableTrailingCustomWrapperViews = (NSArray *)v71;

  if (v51)
  {
    double v73 = objc_alloc_init(SBHMinusPageStepper);
    customPageAnimationStepper = v110->_customPageAnimationStepper;
    v110->_customPageAnimationStepper = v73;
  }
  uint64_t v75 = [v109 searchPresenter];
  searchPresenter = v110->_searchPresenter;
  v110->_searchPresenter = (SBHSearchPresenting *)v75;

  if (v110->_searchPresenter)
  {
    double v77 = [v109 searchPresentableViewController];
    uint64_t v78 = [v77 view];
    searchPresentableView = v110->_searchPresentableView;
    v110->_searchPresentableView = (UIView *)v78;

    double v80 = v110->_searchPresentableView;
    [(SBRootFolderView *)v110 bounds];
    -[UIView setFrame:](v80, "setFrame:");
    [(UIView *)v110->_searchPresentableView setHidden:1];
    [(SBRootFolderView *)v110 addSubview:v110->_searchPresentableView];
  }
  double v81 = [v109 pullDownSearchViewController];
  double v82 = [v81 view];

  if (v82 || v110->_searchPresenter)
  {
    double v83 = objc_alloc_init(_SBRootFolderLayoutWrapperView);
    searchPulldownWrapperView = v110->_searchPulldownWrapperView;
    v110->_searchPulldownWrapperView = v83;

    if (v82) {
      [(_SBRootFolderLayoutWrapperView *)v110->_searchPulldownWrapperView setWrappedView:v82];
    }
    [(_SBRootFolderLayoutWrapperView *)v110->_searchPulldownWrapperView setHidden:1];
    [(SBRootFolderView *)v110 addSubview:v110->_searchPulldownWrapperView];
  }
  CGFloat v85 = +[SBHHomeScreenDomain rootSettings];
  v110->_ignoresOverscrollOnFirstPageOrientations = [v109 ignoresOverscrollOnFirstPageOrientations];
  uint64_t v86 = [v109 ignoresOverscrollOnLastPageOrientations];
  v110->_ignoresOverscrollOnLastPageOrientations = v86;
  if (v110->_ignoresOverscrollOnFirstPageOrientations | v86)
  {
    double v87 = [v112 panGestureRecognizer];
    [v87 addTarget:v110 action:sel__overscrollScrollPanGestureRecognizerDidUpdate_];
  }
  uint64_t v88 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  dockOffscreenProgressSettingClients = v110->_dockOffscreenProgressSettingClients;
  v110->_dockOffscreenProgressSettingClients = (NSHashTable *)v88;

  CGFloat v90 = [v85 iconSettings];
  uint64_t v91 = [v90 iconParallaxSettings];
  parallaxSettings = v110->_parallaxSettings;
  v110->_parallaxSettings = (SBFParallaxSettings *)v91;

  [(SBFParallaxSettings *)v110->_parallaxSettings addKeyObserver:v110];
  [(SBRootFolderView *)v110 _updateParallaxSettings];
  uint64_t v93 = [v85 homeScreenPullToSearchSettings];
  pullToSearchSettings = v110->_pullToSearchSettings;
  v110->_pullToSearchSettings = (SBHHomePullToSearchSettings *)v93;

  [(PTSettings *)v110->_pullToSearchSettings addKeyObserver:v110];
  [(SBRootFolderView *)v110 _updatePullToSearchSettings];
  uint64_t v95 = [v85 rootFolderSettings];
  folderSettings = v110->_folderSettings;
  v110->_folderSettings = (SBHRootFolderSettings *)v95;

  [(SBRootFolderView *)v110 _resetSearchScrollTrackingState];
  v110->_allowsAutoscrollToLeadingCustomView = 1;
  v110->_folderPageManagementAllowedOrientations = [v109 folderPageManagementAllowedOrientations];
  [(SBRootFolderView *)v110 _setupIdleTextPrivacyDisclosures];
  [(SBRootFolderView *)v110 _setupStateDumper];
  v110->_titledButtonsAlpha = 1.0;
  double v97 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v97 addObserver:v110 selector:sel__reduceMotionStatusDidChange_ name:*MEMORY[0x1E4FB2498] object:0];

  if (v110->_scrollAccessoryAuxiliaryView)
  {
    uint64_t v122 = objc_opt_class();
    CGFloat v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
    id v99 = (id)[(SBRootFolderView *)v110 registerForTraitChanges:v98 withAction:sel__forceLayoutPageControl];
  }
  id v4 = v108;
LABEL_73:

  return v5;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4FA5FC0] sharedInstance];
  [v4 removeObserver:self];

  [(SBFParallaxSettings *)self->_parallaxSettings removeKeyObserver:self];
  [(BSInvalidatable *)self->_dockStateDumpHandle invalidate];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v5 = [(SBRootFolderView *)self pageDotsVisibilityAssertions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) invalidate];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v10 dealloc];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 didMoveToSuperview];
  [(SBRootFolderView *)self _updateDockBackgroundViewForOcclusionByOverlay];
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v5 setDelegate:a3];
  if (self->_dockView && ![(SBRootFolderView *)self isDockExternal])
  {
    id v4 = [(SBRootFolderView *)self newDockBackgroundView];
    if (v4)
    {
      [(SBDockView *)self->_dockView setBackgroundView:v4];
      [(SBRootFolderView *)self _updateDockBackgroundViewForOcclusionByOverlay];
    }
  }
}

- (UIView)leadingCustomViewWrapperView
{
  return (UIView *)[(NSArray *)self->_searchableLeadingCustomWrapperViews lastObject];
}

- (id)trailingCustomViewWrapperView
{
  return [(NSArray *)self->_searchableTrailingCustomWrapperViews lastObject];
}

- (void)setSearchGesture:(id)a3
{
  objc_super v5 = (SBSearchGesture *)a3;
  searchGesture = self->_searchGesture;
  if (searchGesture != v5)
  {
    uint64_t v9 = v5;
    [(SBSearchGesture *)searchGesture setTargetView:0];
    objc_storeStrong((id *)&self->_searchGesture, a3);
    uint64_t v7 = self->_searchGesture;
    uint64_t v8 = [(SBFolderView *)self scrollView];
    [(SBSearchGesture *)v7 setTargetView:v8];

    objc_super v5 = v9;
  }
}

- (BOOL)isSearchHidden
{
  return [(_SBRootFolderLayoutWrapperView *)self->_searchPulldownWrapperView isHidden];
}

- (void)setSearchHidden:(BOOL)a3
{
}

- (void)setLeadingCustomViewPageHidden:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_leadingCustomViewPageHidden != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = [(SBRootFolderView *)self leadingCustomView];

    if (v5)
    {
      if ([(SBRootFolderView *)self isOnLeadingCustomPage] && v3) {
        [(SBFolderView *)self setCurrentPageIndex:[(SBFolderView *)self firstIconPageIndex] animated:0];
      }
      uint64_t v6 = [(SBFolderView *)self currentPageUniqueIdentifier];
      self->_leadingCustomViewPageHidden = v3;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v7 = self->_searchableLeadingCustomWrapperViews;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            if (v3)
            {
              [*(id *)(*((void *)&v15 + 1) + 8 * i) removeFromSuperview];
            }
            else
            {
              long long v13 = [(SBFolderView *)self scrollView];
              [v13 addSubview:v12];
            }
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      [(SBFolderView *)self _updateIconListFrames];
      int64_t v14 = [(SBFolderView *)self pageIndexForUniqueIdentifier:v6];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v14 = [(SBFolderView *)self defaultPageIndex];
      }
      -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v14, 0, (void)v15);
      [(SBRootFolderView *)self setNeedsLayout];
      [(SBRootFolderView *)self layoutIfNeeded];
    }
  }
}

- (BOOL)isLeadingCustomViewPageHiddenAtIndex:(unint64_t)a3
{
  id v4 = [(SBRootFolderView *)self hiddenLeadingCustomPageIndexes];
  LOBYTE(a3) = [v4 containsIndex:a3];

  return a3;
}

- (void)setLeadingCustomViewPageHidden:(BOOL)a3 atIndex:(unint64_t)a4
{
  int v5 = a3;
  id v15 = [(SBRootFolderView *)self hiddenLeadingCustomPageIndexes];
  if ([v15 containsIndex:a4] != v5)
  {
    int64_t v7 = [(SBFolderView *)self currentPageIndex];
    if ([(SBRootFolderView *)self isOnLeadingCustomPage]
      && v5
      && [(SBFolderView *)self leadingCustomPageIndexForPageIndex:v7] == a4)
    {
      [(SBFolderView *)self setCurrentPageIndex:[(SBFolderView *)self firstIconPageIndex] animated:0];
    }
    uint64_t v8 = [(SBFolderView *)self currentPageUniqueIdentifier];
    if (v15) {
      id v9 = (id)[v15 mutableCopy];
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    }
    uint64_t v10 = v9;
    if (v5) {
      [v9 addIndex:a4];
    }
    else {
      [v9 removeIndex:a4];
    }
    [(SBRootFolderView *)self setHiddenLeadingCustomPageIndexes:v10];
    long long v11 = [(NSArray *)self->_searchableLeadingCustomWrapperViews objectAtIndex:a4];
    uint64_t v12 = v11;
    if (v5)
    {
      [v11 removeFromSuperview];
    }
    else
    {
      long long v13 = [(SBFolderView *)self scrollView];
      [v13 addSubview:v12];
    }
    [(SBFolderView *)self _updateIconListFrames];
    int64_t v14 = [(SBFolderView *)self pageIndexForUniqueIdentifier:v8];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v14 = [(SBFolderView *)self defaultPageIndex];
    }
    [(SBFolderView *)self setCurrentPageIndex:v14 animated:0];
    [(SBRootFolderView *)self setNeedsLayout];
    [(SBRootFolderView *)self layoutIfNeeded];
  }
}

- (void)setOccludedByOverlay:(BOOL)a3
{
  if (self->_occludedByOverlay != a3)
  {
    self->_occludedByOverladouble y = a3;
    [(SBRootFolderView *)self _updateDockBackgroundViewForOcclusionByOverlay];
  }
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = [(SBFolderView *)self listLayoutProvider];
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v10 setListLayoutProvider:v6 animated:v4];

  uint64_t v8 = [(SBFolderView *)self listLayoutProvider];

  if (v7 != v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__SBRootFolderView_setListLayoutProvider_animated___block_invoke;
    v9[3] = &unk_1E6AAC810;
    void v9[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:0.3];
  }
}

uint64_t __51__SBRootFolderView_setListLayoutProvider_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dockView];
  [v2 listLayoutProviderDidChange];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 _layoutSubviews];
}

- (void)_flashPageDotsForReason:(id)a3
{
  id v3 = [(SBRootFolderView *)self requirePageDotsVisibilityForReason:a3];
  [v3 invalidate];
}

- (void)returnScalingView
{
  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v12 returnScalingView];
  [(SBRootFolderView *)self bringSubviewToFront:self->_searchPulldownWrapperView];
  id v3 = [(SBSearchBackdropView *)self->_leadingCustomBackdropView superview];
  [v3 sendSubviewToBack:self->_leadingCustomBackdropView];

  BOOL v4 = [(SBSearchBackdropView *)self->_trailingCustomBackdropView superview];
  [v4 sendSubviewToBack:self->_trailingCustomBackdropView];

  int v5 = [(SBSearchBackdropView *)self->_trailingCustomBackdropView superview];
  [v5 insertSubview:self->_trailingCustomSearchDimmingView aboveSubview:self->_trailingCustomBackdropView];

  id v6 = [(SBRootFolderView *)self doneButton];
  int64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 superview];
    [v8 bringSubviewToFront:v7];
  }
  id v9 = [(SBRootFolderView *)self widgetButton];
  objc_super v10 = v9;
  if (v9)
  {
    long long v11 = [v9 superview];
    [v11 bringSubviewToFront:v10];
  }
}

- (void)willMoveToWindow:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (SBRootFolderView *)a3;
  int v5 = [(SBRootFolderView *)self window];
  if (v5) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4 != 0;
  }

  int64_t v7 = [(SBRootFolderView *)self window];

  if (v7) {
    BOOL v8 = v4 != 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v6 || !v8)
  {
    int64_t v9 = [(SBFolderView *)self minimumPageIndex];
    uint64_t v10 = [(SBFolderView *)self maximumPageIndex];
    int64_t v11 = [(SBFolderView *)self currentPageIndex];
    uint64_t v12 = v10 & ~(v10 >> 63);
    if (v11 <= v12) {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v11 >= v9) {
      long long v13 = (SBRootFolderView *)v12;
    }
    else {
      long long v13 = (SBRootFolderView *)v9;
    }
    if (v13 != (SBRootFolderView *)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = self;
        _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "SBRootFolderView current state: %{public}@", buf, 0xCu);
      }

      id v15 = SBLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v20 = v13;
        _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "SBRootFolderView is moving to page: %{public}lu", buf, 0xCu);
      }

      long long v16 = SBLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v4;
        _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "SBRootFolderView is moving to window: %{public}@", buf, 0xCu);
      }

      long long v17 = SBLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v4;
        __int16 v21 = 2114;
        double v22 = self;
        __int16 v23 = 2050;
        double v24 = v13;
        _os_log_fault_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_FAULT, "SBRootFolderView is moving to window '%{public}@' state: %{public}@; will trigger setCurrentPageIndex:'%{publi"
          "c}lu' animated:NO",
          buf,
          0x20u);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v18 willMoveToWindow:v4];
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v11 didMoveToWindow];
  id v3 = [(SBRootFolderView *)self leadingCustomViewControllers];
  BOOL v4 = [(SBRootFolderView *)self trailingCustomViewControllers];
  int v5 = (void *)*MEMORY[0x1E4FB2608];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__SBRootFolderView_didMoveToWindow__block_invoke;
  v8[3] = &unk_1E6AACDE0;
  v8[4] = self;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 _performBlockAfterCATransactionCommits:v8];
}

void __35__SBRootFolderView_didMoveToWindow__block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] overrideIconImageAppearance];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        BOOL v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 setOverrideIconImageAppearance:v2];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = a1[6];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        int64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "setOverrideIconImageAppearance:", v2, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)setOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView setOrientation:](&v5, sel_setOrientation_);
  if (![(SBRootFolderView *)self isDockViewBorrowed])
  {
    [(SBIconListView *)self->_dockListView setOrientation:a3];
    [(SBIconListView *)self->_dockListView layoutIconsNow];
  }
  [(SBRootFolderView *)self updateEditButtonMenu];
  [(SBRootFolderView *)self setNeedsLayout];
  [(SBRootFolderView *)self layoutIfNeeded];
}

- (void)setLegibilitySettings:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  id v4 = a3;
  [(SBFolderView *)&v5 setLegibilitySettings:v4];
  -[SBDockView setLegibilitySettings:](self->_dockView, "setLegibilitySettings:", v4, v5.receiver, v5.super_class);
}

- (void)_updateIconListLegibilitySettings
{
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v7 _updateIconListLegibilitySettings];
  id v3 = [(SBFolderView *)self legibilitySettingsForIconListViews];
  [(SBIconListView *)self->_dockListView setLegibilitySettings:v3];
  idleTextView = self->_idleTextView;
  objc_super v5 = [v3 primaryColor];
  if (v5)
  {
    [(UILabel *)idleTextView setTextColor:v5];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)idleTextView setTextColor:v6];
  }
}

- (NSString)dockIconLocation
{
  v2 = objc_opt_class();
  return (NSString *)[v2 dockIconLocation];
}

- (double)maxDockHeight
{
  if ([(SBRootFolderView *)self isDockExternal])
  {
    id v3 = [(SBFolderView *)self delegate];
    double v4 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v3 maxExternalDockHeightForRootFolderView:self];
      double v4 = v5;
    }

    return v4;
  }
  else
  {
    dockView = self->_dockView;
    [(SBDockView *)dockView dockHeight];
  }
  return result;
}

- (double)externalDockPageControlVerticalMargin
{
  id v3 = [(SBRootFolderView *)self rootWithWidgetsListLayout];
  double v4 = [(SBFolderView *)self gridSizeClassDomain];
  uint64_t v5 = [(SBFolderView *)self orientation];
  [v3 layoutInsetsForOrientation:v5];
  double v7 = v6;
  double v9 = v8;
  double v34 = v10;
  double v12 = v11;
  double v13 = SBHIconListLayoutLargestExtraIconImageSizeInDomain(v3, v5, v4);
  double v35 = v14;
  [(SBRootFolderView *)self bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v23 = v9 + v15;
  CGFloat rect = v7 + v17;
  CGFloat v24 = v19 - (v9 + v12);
  CGFloat v25 = v21 - (v7 + v34);
  [(SBRootFolderView *)self dockHeight];
  double v27 = v26;
  v36.origin.double x = v16;
  v36.origin.double y = v18;
  v36.size.double width = v20;
  v36.size.double height = v22;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.double x = v23;
  v37.origin.double y = rect;
  v37.size.double width = v24;
  v37.size.double height = v25;
  double v29 = MaxY - CGRectGetMaxY(v37) - v27 - v35 * 0.5;
  [(SBFolderView *)self pageControlAreaHeight];
  double v31 = ceil(v29 * 0.5 - v30 * 0.5);

  return v31;
}

- (unint64_t)totalLeadingCustomPageCount
{
  v2 = [(SBRootFolderView *)self leadingCustomViewControllers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)leadingCustomPageCount
{
  if (![(SBFolderView *)self iconListViewCount]
    && [(SBFolderView *)self automaticallyCreatesIconListViews])
  {
    return 0;
  }
  double v4 = [(SBRootFolderView *)self leadingCustomViewControllers];
  uint64_t v5 = [v4 count];

  double v6 = [(SBRootFolderView *)self hiddenLeadingCustomPageIndexes];
  unint64_t v3 = v5 - [v6 count];
  if ([(SBRootFolderView *)self isLeadingCustomViewPageHidden]) {
    unint64_t v3 = 0;
  }
  if ([(NSArray *)self->_searchableLeadingCustomWrapperViews count] < v3) {
    unint64_t v3 = [(NSArray *)self->_searchableLeadingCustomWrapperViews count];
  }

  return v3;
}

- (unint64_t)trailingCustomPageCount
{
  if (![(SBFolderView *)self iconListViewCount]
    && [(SBFolderView *)self automaticallyCreatesIconListViews])
  {
    return 0;
  }
  unint64_t v3 = [(SBRootFolderView *)self trailingCustomView];

  if (!v3) {
    return 0;
  }
  double v4 = [(SBRootFolderView *)self trailingCustomViewControllers];
  unint64_t v5 = [v4 count];

  return v5;
}

uint64_t __67__SBRootFolderView__layoutSubviewsForLeadingCustomViewWithMetrics___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3 = *(double *)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 64);
  double v6 = v4 + v5 * (double)a3;
  double v7 = v3 + v5 * (double)a3;
  if (*(unsigned char *)(a1 + 72)) {
    double v4 = v6;
  }
  else {
    double v3 = v7;
  }
  return objc_msgSend(a2, "setFrame:", v3, v4, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __68__SBRootFolderView__layoutSubviewsForTrailingCustomViewWithMetrics___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3 = *(double *)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 64);
  double v6 = v4 + v5 * (double)a3;
  double v7 = v3 + v5 * (double)a3;
  if (*(unsigned char *)(a1 + 72)) {
    double v4 = v6;
  }
  else {
    double v3 = v7;
  }
  return objc_msgSend(a2, "setFrame:", v3, v4, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)layoutSearchableViews
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  [(SBRootFolderView *)self getMetrics:v3];
  [(SBRootFolderView *)self layoutSearchableViewsWithMetrics:v3];
}

- (CGRect)_scrollViewFrameForDockEdge:(unint64_t)a3
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  memset(v7, 0, sizeof(v7));
  [(SBRootFolderView *)self getMetrics:v7 dockEdge:a3];
  double v4 = *((double *)&v8 + 1);
  double v3 = *(double *)&v8;
  double v6 = *((double *)&v9 + 1);
  double v5 = *(double *)&v9;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)_spotlightFirstIconRowOffset
{
  double v3 = [(SBFolderView *)self firstIconListView];
  double v4 = [v3 layout];
  objc_msgSend(v4, "layoutInsetsForOrientation:", objc_msgSend(v3, "orientation"));
  double v6 = v5;

  double v7 = [(SBFolderView *)self delegate];
  char v8 = objc_opt_respondsToSelector();
  double v9 = 0.0;
  if (v8) {
    objc_msgSend(v7, "distanceToTopOfSpotlightIconsForRootFolderView:", self, 0.0);
  }
  if (v9 - v6 <= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = v9 - v6;
  }

  return v10;
}

- (id)beginModifyingDockOffscreenFractionForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Begin modifying dock offscreen fraction for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  double v6 = [[_SBRootFolderDockOffscreenFractionClient alloc] initWithFolderView:self reason:v4];
  [(NSHashTable *)self->_dockOffscreenProgressSettingClients addObject:v6];

  return v6;
}

- (void)removeDockOffscreenFractionClient:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = [v4 reason];
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "End modifying dock offscreen fraction for reason: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(NSHashTable *)self->_dockOffscreenProgressSettingClients removeObject:v4];
  [(SBRootFolderView *)self setNeedsLayout];
}

- (void)setDockEdge:(unint64_t)a3
{
  if (self->_dockEdge != a3)
  {
    self->_dockEdge = a3;
    double v5 = [(SBRootFolderView *)self dockView];
    [v5 setDockEdge:a3];

    [(SBRootFolderView *)self _updateDockViewZOrdering];
    [(SBRootFolderView *)self _updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:0];
    [(SBRootFolderView *)self setNeedsLayout];
  }
}

- (void)updateDockViewOrientation
{
  [(SBIconListView *)self->_dockListView setOrientation:[(SBFolderView *)self orientation]];
  dockListView = self->_dockListView;
  [(SBIconListView *)dockListView layoutIconsNow];
}

- (void)_updateDockViewZOrdering
{
  uint64_t v3 = [(SBRootFolderView *)self dockEdge];
  if (v3 > 7)
  {
    if (v3 == 15) {
      goto LABEL_8;
    }
    if (v3 != 8)
    {
LABEL_11:
      id v4 = [(SBFolderView *)self scalingView];
      goto LABEL_12;
    }
LABEL_7:
    id v4 = [(SBFolderView *)self scalingView];
LABEL_10:
    id v6 = v4;
    [v4 bringSubviewToFront:self->_dockView];
    goto LABEL_13;
  }
  if (v3 == 2) {
    goto LABEL_7;
  }
  if (v3 != 4) {
    goto LABEL_11;
  }
LABEL_8:
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  if ((BSFloatIsZero() & 1) == 0) {
    goto LABEL_11;
  }
  [(SBRootFolderView *)self trailingCustomViewVisibilityProgress];
  int IsZero = BSFloatIsZero();
  id v4 = [(SBFolderView *)self scalingView];
  if (IsZero) {
    goto LABEL_10;
  }
LABEL_12:
  id v6 = v4;
  [v4 sendSubviewToBack:self->_dockView];
LABEL_13:
}

- (void)setContentAlpha:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView setContentAlpha:](&v6, sel_setContentAlpha_);
  double v5 = [(SBRootFolderView *)self dockView];
  [v5 setAlpha:a3];
}

- (id)borrowDockViewForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(SBRootFolderView *)self dockBorrowedAssertion];

  if (v5)
  {
    objc_super v6 = 0;
  }
  else
  {
    objc_super v6 = [[_SBRootFolderViewElementBorrowedAssertion alloc] initWithFolderView:self reason:v4];
    [(SBRootFolderView *)self setDockBorrowedAssertion:v6];
  }

  return v6;
}

- (void)elementBorrowedAssertionDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderView *)self dockBorrowedAssertion];

  if (v5 == v4)
  {
    [(SBRootFolderView *)self setDockBorrowedAssertion:0];
    int v8 = [(SBFolderView *)self scalingView];
    [v8 addSubview:self->_dockView];
    [(SBDockView *)self->_dockView setAlpha:1.0];
    [(SBDockView *)self->_dockView setHidden:0];
    [(SBRootFolderView *)self updateDockViewOrientation];
    [(SBRootFolderView *)self _updateDockViewZOrdering];
    [(SBRootFolderView *)self setNeedsLayout];
LABEL_11:

    goto LABEL_12;
  }
  id v6 = [(SBRootFolderView *)self scrollAccessoryBorrowedAssertion];

  if (v6 == v4)
  {
    [(SBRootFolderView *)self setScrollAccessoryBorrowedAssertion:0];
    int v8 = [(SBFolderView *)self scalingView];
    uint64_t v9 = [(SBRootFolderView *)self scrollAccessoryView];
    [v8 addSubview:v9];
    uint64_t v10 = [(SBFolderView *)self pageControl];
    if (![v10 hidesForSinglePage] || objc_msgSend(v10, "numberOfPages") >= 2)
    {
      [v10 setAlpha:1.0];
      [v10 setHidden:0];
    }
    [(SBRootFolderView *)self setNeedsLayout];

    goto LABEL_11;
  }
  int v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SBRootFolderView elementBorrowedAssertionDidInvalidate:](v4, v7);
  }

LABEL_12:
}

- (id)borrowScrollAccessoryForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolderView *)self scrollAccessoryBorrowedAssertion];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [[_SBRootFolderViewElementBorrowedAssertion alloc] initWithFolderView:self reason:v4];
    [(SBRootFolderView *)self setScrollAccessoryBorrowedAssertion:v6];
  }

  return v6;
}

- (id)requirePageDotsVisibilityForReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke;
  long long v15 = &unk_1E6AAD538;
  objc_copyWeak(&v16, &location);
  int v8 = (void *)[v5 initWithIdentifier:@"RootFolderPageDotsVisibility" forReason:v4 queue:v6 invalidationBlock:&v12];

  uint64_t v9 = [(SBRootFolderView *)self pageDotsVisibilityAssertions];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    [(SBRootFolderView *)self setPageDotsVisibilityAssertions:v9];
  }
  uint64_t v10 = [v9 count];
  [v9 addObject:v8];
  if (!v10) {
    [(SBRootFolderView *)self _applyPageDotsVisibilityAssertions];
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

void __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained pageDotsVisibilityAssertions];
  [v5 removeObject:v3];

  if (![v5 count])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CB00];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke_2;
    v9[3] = &unk_1E6AAEE70;
    id v7 = WeakRetained;
    id v10 = v7;
    int v8 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:0.8];
    [v7 setPageDotsVisibilityTimer:v8];
  }
}

uint64_t __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyPageDotsVisibilityAssertions];
}

- (void)_applyPageDotsVisibilityAssertions
{
  id v3 = [(SBRootFolderView *)self pageDotsVisibilityTimer];
  [v3 invalidate];

  [(SBRootFolderView *)self setPageDotsVisibilityTimer:0];
  id v4 = [(SBRootFolderView *)self pageDotsVisibilityAssertions];
  if ([v4 count])
  {
    id v5 = [(SBFolderView *)self pageControl];
    uint64_t v6 = [v5 numberOfPages];

    if (v6 >= 2)
    {
      id v7 = [(SBRootFolderView *)self scrollAccessoryView];
      id v9 = v7;
      uint64_t v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [(SBRootFolderView *)self scrollAccessoryView];
  id v9 = v7;
  uint64_t v8 = 1;
LABEL_6:
  [v7 setMode:v8];
}

- (BOOL)isPageControlHidden
{
  v2 = [(SBRootFolderView *)self scrollAccessoryView];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setPageControlHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBRootFolderView *)self scrollAccessoryView];
  [v4 setHidden:v3];
}

- (double)pageControlAlpha
{
  v2 = [(SBRootFolderView *)self scrollAccessoryView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (unint64_t)_countOfLeadingCustomViewsThatShouldNotBeIndicatedInPageControl
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SBRootFolderView *)self leadingCustomViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v5 += [v8 shouldBeIndicatedInPageControl] ^ 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_countOfTrailingCustomViewsThatShouldNotBeIndicatedInPageControl
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SBRootFolderView *)self trailingCustomViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v5 += [v8 shouldBeIndicatedInPageControl] ^ 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_leadingCustomViewShouldShowDoneButtonWhenEditing
{
  v2 = [(SBRootFolderView *)self leadingCustomViewController];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldShowDoneButtonWhenEditing];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (int64_t)_adjustPageIndexFromPageControl:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  id v4 = [(SBFolderView *)&v6 _adjustPageIndexForPageControl:a3];
  return (int64_t)v4
       + [(SBRootFolderView *)self _countOfLeadingCustomViewsThatShouldNotBeIndicatedInPageControl];
}

- (void)_forceLayoutPageControl
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  [(SBRootFolderView *)self getMetrics:v4];
  [(SBRootFolderView *)self layoutPageControlWithMetrics:v4];
  char v3 = [(SBRootFolderView *)self scrollAccessoryView];
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
}

- (UIEdgeInsets)statusBarInsetsForDockEdge:(unint64_t)a3
{
  [(SBRootFolderView *)self currentDockOffscreenFraction];
  -[SBRootFolderView _statusBarInsetsForDockEdge:dockOffscreenPercentage:](self, "_statusBarInsetsForDockEdge:dockOffscreenPercentage:", a3);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)searchableLeadingCustomWrapperView
{
  [(SBRootFolderView *)self _setupSearchBackdropViewIfNecessary];
  searchableLeadingCustomWrapperViews = self->_searchableLeadingCustomWrapperViews;
  return [(NSArray *)searchableLeadingCustomWrapperViews lastObject];
}

- (SBSearchBackdropView)searchBackdropView
{
  [(SBRootFolderView *)self _setupSearchBackdropViewIfNecessary];
  searchBackdropView = self->_searchBackdropView;
  return searchBackdropView;
}

- (SBSearchBackdropView)leadingCustomBackdropView
{
  [(SBRootFolderView *)self _setupLeadingCustomBackdropViewIfNecessary];
  leadingCustomBackdropView = self->_leadingCustomBackdropView;
  return leadingCustomBackdropView;
}

- (SBSearchBackdropView)trailingCustomBackdropView
{
  [(SBRootFolderView *)self _setupTrailingCustomBackdropViewIfNecessary];
  trailingCustomBackdropView = self->_trailingCustomBackdropView;
  return trailingCustomBackdropView;
}

- (UIView)trailingCustomSearchDimmingView
{
  [(SBRootFolderView *)self _setupTrailingCustomDimmingViewIfNecessary];
  trailingCustomSearchDimmingView = self->_trailingCustomSearchDimmingView;
  return trailingCustomSearchDimmingView;
}

- (id)newDockBackgroundView
{
  char v3 = [(SBFolderView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 backgroundViewForDockForRootFolderView:self],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(SBRootFolderView *)self newDockBackgroundMaterialViewWithInitialWeighting:1.0];
  }

  return v4;
}

- (id)newDockBackgroundMaterialViewWithInitialWeighting:(double)a3
{
  char v3 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19 options:0 initialWeighting:a3];
  [v3 setGroupNameBase:0];
  [v3 setGroupName:@"WallpaperCaptureGroup"];
  id v4 = [v3 layer];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  [v8 setGroupNamespace:*MEMORY[0x1E4F39DA0]];
  return v3;
}

- (id)newHomeScreenButtonBackgroundView
{
  char v3 = [(SBFolderView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 backgroundViewForEditingDoneButtonForRootFolderView:self],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = +[SBIconView componentBackgroundView];
  }

  return v4;
}

- (id)makeTitledButtonOfClass:(Class)a3
{
  uint64_t v5 = [(SBRootFolderView *)self rootFolderVisualConfiguration];
  id v6 = [(SBRootFolderView *)self newHomeScreenButtonBackgroundView];
  id v7 = [a3 alloc];
  id v8 = objc_msgSend(v7, "initWithFrame:backgroundView:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = [v8 configuration];
  [v5 editModeButtonContentEdgeInsets];
  objc_msgSend(v9, "setContentInsets:");
  [v8 setConfiguration:v9];
  [v5 editModeButtonSize];
  objc_msgSend(v8, "setPreferredContentFittingSize:");
  long long v10 = [v8 materialView];
  long long v11 = [(SBFolderView *)self legibilitySettings];
  objc_msgSend(v10, "setLegibilityStyle:", objc_msgSend(v11, "style"));

  return v8;
}

+ (void)_getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 forListLayout:(id)a6 withTranslationOffset:(double)a7 inRTL:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a6;
  double v18 = 28.0;
  if (objc_opt_respondsToSelector())
  {
    long long v19 = [v17 rootFolderVisualConfiguration];
    uint64_t v20 = v19;
    if (v19)
    {
      [v19 editModeButtonSize];
      double v18 = v22;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 0x4051000000000000;
LABEL_6:
  CGPoint v27 = (CGPoint)0;
  v28.double width = v18;
  *(void *)&v28.double height = v21;
  CGPoint v25 = (CGPoint)0;
  v26.double width = v18;
  *(void *)&v26.double height = v21;
  objc_msgSend(a1, "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forVisualConfiguration:includingContentEdgeInsets:withTranslationOffset:inRTL:", &v27, &v25, v20, 0, v8, x, y, width, height, a7);
  if (a3)
  {
    CGSize v23 = v28;
    a3->CGPoint origin = v27;
    a3->CGSize size = v23;
  }
  if (a4)
  {
    CGSize v24 = v26;
    a4->CGPoint origin = v25;
    a4->CGSize size = v24;
  }
}

- (void)setShowsDoneButton:(BOOL)a3
{
}

- (void)setShowsDoneButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsDoneButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showsDoneButton = a3;
    id v7 = [(SBRootFolderView *)self doneButton];
    id v8 = v7;
    if (v5)
    {
      if (v7)
      {
        if (!v4) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
      long long v11 = [(SBRootFolderView *)self makeTitledButtonOfClass:objc_opt_class()];
      [v11 addTarget:self action:sel_doneButtonTriggered_ forControlEvents:0x2000];
      [(SBRootFolderView *)self setDoneButton:v11];
      [(SBRootFolderView *)self bounds];
      objc_msgSend(v11, "sizeThatFits:", v12, v13);
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      double v18 = (void *)MEMORY[0x1E4FB1EB0];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke;
      v32[3] = &unk_1E6AAEE98;
      id v8 = v11;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = v15;
      uint64_t v38 = v17;
      id v33 = v8;
      double v34 = self;
      [v18 performWithoutAnimation:v32];

      if (v4)
      {
LABEL_10:
        long long v19 = (void *)MEMORY[0x1E4FB1EB0];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_2;
        v30[3] = &unk_1E6AAC810;
        id v20 = v8;
        id v31 = v20;
        [v19 performWithoutAnimation:v30];
        uint64_t v21 = (void *)MEMORY[0x1E4FB1EB0];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_3;
        v27[3] = &unk_1E6AACA90;
        id v8 = v20;
        id v28 = v8;
        double v29 = self;
        [v21 animateWithDuration:v27 animations:0.2];

        id v10 = v31;
        goto LABEL_11;
      }
    }
    else
    {
      if (v4)
      {
        id v9 = (void *)MEMORY[0x1E4FB1EB0];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_4;
        v25[3] = &unk_1E6AAC810;
        id v26 = v7;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_5;
        v22[3] = &unk_1E6AACF80;
        id v8 = v26;
        id v23 = v8;
        CGSize v24 = self;
        [v9 animateWithDuration:v25 animations:v22 completion:0.2];

        id v10 = v26;
LABEL_11:

        goto LABEL_12;
      }
      [v7 removeFromSuperview];
      [(SBRootFolderView *)self setDoneButton:0];
    }
LABEL_12:
  }
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 40) addSubview:*(void *)(a1 + 32)];
  v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return [v2 setTransform:&v4];
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 40) + 1048)];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  void v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return [v2 setTransform:&v4];
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_5(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    long long v3 = *(void **)(v2 + 40);
    return [v3 setDoneButton:0];
  }
  return result;
}

- (void)setShowsAddWidgetButton:(BOOL)a3
{
}

- (void)setShowsAddWidgetButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsAddWidgetButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showsAddWidgetButton = a3;
    id v7 = [(SBRootFolderView *)self widgetButton];
    [v7 setAccessibilityIdentifier:@"avocado-widget-add-button"];
    if (v5)
    {
      if (v7)
      {
        if (!v4) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
      id v10 = [(SBRootFolderView *)self makeTitledButtonOfClass:objc_opt_class()];
      long long v11 = [(SBRootFolderView *)self editMenu];
      [v10 setMenu:v11];
      [v10 setShowsMenuAsPrimaryAction:1];
      [(SBRootFolderView *)self setWidgetButton:v10];
      [(SBRootFolderView *)self bounds];
      objc_msgSend(v10, "sizeThatFits:", v12, v13);
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      double v18 = (void *)MEMORY[0x1E4FB1EB0];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke;
      v32[3] = &unk_1E6AAEE98;
      id v7 = v10;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = v15;
      uint64_t v38 = v17;
      id v33 = v7;
      double v34 = self;
      [v18 performWithoutAnimation:v32];

      if (v4)
      {
LABEL_10:
        long long v19 = (void *)MEMORY[0x1E4FB1EB0];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_2;
        v30[3] = &unk_1E6AAC810;
        id v20 = v7;
        id v31 = v20;
        [v19 performWithoutAnimation:v30];
        uint64_t v21 = (void *)MEMORY[0x1E4FB1EB0];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_3;
        v27[3] = &unk_1E6AACA90;
        id v7 = v20;
        id v28 = v7;
        double v29 = self;
        [v21 animateWithDuration:v27 animations:0.2];

        id v9 = v31;
        goto LABEL_11;
      }
    }
    else
    {
      if (v4)
      {
        id v8 = (void *)MEMORY[0x1E4FB1EB0];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_4;
        v25[3] = &unk_1E6AAC810;
        id v26 = v7;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_5;
        v22[3] = &unk_1E6AACF80;
        id v7 = v26;
        id v23 = v7;
        CGSize v24 = self;
        [v8 animateWithDuration:v25 animations:v22 completion:0.2];

        id v9 = v26;
LABEL_11:

        goto LABEL_12;
      }
      [v7 removeFromSuperview];
      [(SBRootFolderView *)self setWidgetButton:0];
    }
LABEL_12:
  }
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 40) addSubview:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return [v2 setTransform:&v4];
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 40) + 1048)];
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  void v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return [v2 setTransform:&v4];
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_5(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    long long v3 = *(void **)(v2 + 40);
    return [v3 setWidgetButton:0];
  }
  return result;
}

- (void)setTitledButtonsAlpha:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_titledButtonsAlpha != a3)
  {
    self->_titledButtonsAlpha = a3;
    BOOL v5 = SBLogRootController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134349056;
      double v7 = a3;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "SBRootFolderView setTitledButtonsAlpha: %{public}f", (uint8_t *)&v6, 0xCu);
    }

    [(SBTitledHomeScreenButton *)self->_doneButton setAlpha:a3];
    [(SBTitledHomeScreenButton *)self->_widgetButton setAlpha:a3];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderView;
  -[SBFolderView setEditing:animated:](&v12, sel_setEditing_animated_);
  if ([(SBRootFolderView *)self folderPageManagementAllowedOrientations])
  {
    double v7 = 0.3;
    if (!v4) {
      double v7 = 0.0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__SBRootFolderView_setEditing_animated___block_invoke;
    v11[3] = &unk_1E6AAC810;
    v11[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:v7];
    [(SBRootFolderView *)self setNeedsLayout];
    [(SBRootFolderView *)self layoutIfNeeded];
  }
  if (v5)
  {
    uint64_t v8 = [(SBRootFolderView *)self requirePageDotsVisibilityForReason:@"editing"];
    [(SBRootFolderView *)self setEditingPageDotsVisibilityAssertion:v8];
    id v9 = [(SBRootFolderView *)self scrollAccessoryAuxiliaryView];

    if (v9)
    {
      id v10 = [(SBFolderView *)self pageControl];
      [v10 cancelTapGesture];
    }
  }
  else
  {
    uint64_t v8 = [(SBRootFolderView *)self editingPageDotsVisibilityAssertion];
    [(SBRootFolderView *)self setEditingPageDotsVisibilityAssertion:0];
    [v8 invalidate];
    [(SBRootFolderView *)self exitPageManagementUIWithCompletionHandler:0];
  }
}

uint64_t __40__SBRootFolderView_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePageControlConfiguration];
}

- (id)editMenu
{
  v40[3] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  long long v3 = (void *)MEMORY[0x1E4FB13F0];
  BOOL v4 = SBHBundle();
  BOOL v5 = [v4 localizedStringForKey:@"EDIT_MENU_ADD_WIDGET" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  int v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"widget.small.badge.plus"];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __28__SBRootFolderView_editMenu__block_invoke;
  v37[3] = &unk_1E6AAEEC0;
  CGFloat v32 = &v38;
  objc_copyWeak(&v38, &location);
  double v7 = [v3 actionWithTitle:v5 image:v6 identifier:@"addwidget" handler:v37];

  BOOL v8 = [(SBFolderView *)self isRTL];
  id v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ((unint64_t)([(SBFolderView *)self orientation] - 3) > 1)
    {
      long long v11 = @"apps.ipad.badge.paintbrush";
      BOOL v12 = !v8;
      if (v8) {
        long long v11 = @"apps.ipad.badge.paintbrush.rtl";
      }
      double v13 = @"apps.ipad.on.rectangle.portraint";
      uint64_t v14 = @"apps.ipad.on.rectangle.portraint.rtl";
    }
    else
    {
      long long v11 = @"apps.ipad.landscape.badge.paintbrush";
      BOOL v12 = !v8;
      if (v8) {
        long long v11 = @"apps.ipad.landscape.badge.paintbrush.rtl";
      }
      double v13 = @"apps.ipad.landscape.on.rectangle";
      uint64_t v14 = @"apps.ipad.landscape.on.rectangle.rtl";
    }
  }
  else
  {
    long long v11 = @"apps.iphone.badge.paintbrush";
    BOOL v12 = !v8;
    if (v8) {
      long long v11 = @"apps.iphone.badge.paintbrush.rtl";
    }
    double v13 = @"apps.iphone.on.rectangle.portrait";
    uint64_t v14 = @"apps.iphone.on.rectangle.portrait.rtl";
  }
  if (v12) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v11;
  uint64_t v17 = v15;
  double v18 = (void *)MEMORY[0x1E4FB13F0];
  long long v19 = SBHBundle();
  id v20 = [v19 localizedStringForKey:@"EDIT_MENU_CUSTOMIZE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  uint64_t v21 = [MEMORY[0x1E4FB1818] _systemImageNamed:v16];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __28__SBRootFolderView_editMenu__block_invoke_2;
  v35[3] = &unk_1E6AAEEC0;
  objc_copyWeak(&v36, &location);
  double v22 = [v18 actionWithTitle:v20 image:v21 identifier:@"customize" handler:v35];

  id v23 = (void *)MEMORY[0x1E4FB13F0];
  CGSize v24 = SBHBundle();
  CGPoint v25 = [v24 localizedStringForKey:@"EDIT_MENU_EDIT_PAGES" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  id v26 = [MEMORY[0x1E4FB1818] _systemImageNamed:v17];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __28__SBRootFolderView_editMenu__block_invoke_3;
  v33[3] = &unk_1E6AAEEC0;
  objc_copyWeak(&v34, &location);
  CGPoint v27 = [v23 actionWithTitle:v25 image:v26 identifier:@"pageManagement" handler:v33];

  id v28 = (void *)MEMORY[0x1E4FB1970];
  v40[0] = v7;
  v40[1] = v22;
  v40[2] = v27;
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  double v30 = [v28 menuWithChildren:v29];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  return v30;
}

void __28__SBRootFolderView_editMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [v3 sender];

  [WeakRetained widgetButtonTriggered:v4];
}

void __28__SBRootFolderView_editMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [v3 sender];

  [WeakRetained iconTintButtonTriggered:v4];
}

void __28__SBRootFolderView_editMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained enterPageManagementUIWithCompletionHandler:0];
}

- (void)updateEditButtonMenu
{
  id v4 = [(SBRootFolderView *)self widgetButton];
  if (v4)
  {
    id v3 = [(SBRootFolderView *)self editMenu];
    [v4 setMenu:v3];
  }
}

- (void)doneButtonTriggered:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__SBRootFolderView_doneButtonTriggered___block_invoke;
  v3[3] = &unk_1E6AAC810;
  v3[4] = self;
  [(SBRootFolderView *)self exitPageManagementUIWithCompletionHandler:v3];
}

void __40__SBRootFolderView_doneButtonTriggered___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 rootFolderViewWantsToEndEditing:*(void *)(a1 + 32)];
  }
}

- (void)widgetButtonTriggered:(id)a3
{
  id v4 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderViewWantsWidgetEditingViewControllerPresented:self];
  }
}

- (void)iconTintButtonTriggered:(id)a3
{
  id v4 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 rootFolderViewWantsIconTintViewControllerPresented:self];
  }
}

- (BOOL)isPageManagementUITransitioningOutOfVisible
{
  id v3 = [(SBRootFolderView *)self transitioningNewSpecialLayoutManager];
  id v4 = [(SBRootFolderView *)self transitioningOldSpecialLayoutManager];
  BOOL v5 = self;
  BOOL v6 = objc_opt_isKindOfClass() & (v3 == 0);

  return v6;
}

- (void)enterPageManagementUIWithCompletionHandler:(id)a3
{
  uint64_t v10 = (void (**)(void))a3;
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  id v4 = [(SBRootFolderView *)self transitioningNewSpecialLayoutManager];
  BOOL v5 = [(SBRootFolderView *)self isPageManagementUIVisible];
  BOOL v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v5 || (isKindOfClass & 1) != 0)
  {
    if (v10) {
      v10[2]();
    }
  }
  else
  {
    BOOL v8 = objc_alloc_init(SBRootFolderViewPageManagementLayoutManager);
    [(SBRootFolderViewPageManagementLayoutManager *)v8 setAllowsEditing:1];
    [(SBRootFolderView *)self setSpecialLayoutManager:v8 completionHandler:v10];
  }
  id v9 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v9 emitEvent:54];
}

- (void)exitPageManagementUIWithCompletionHandler:(id)a3
{
  id v7 = a3;
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  BOOL v4 = [(SBRootFolderView *)self isPageManagementUIVisible];
  BOOL v5 = [(SBRootFolderView *)self isPageManagementUITransitioningOutOfVisible];
  if (!v4 || v5)
  {
    BOOL v6 = v7;
    if (!v7) {
      goto LABEL_7;
    }
    (*((void (**)(id))v7 + 2))(v7);
  }
  else
  {
    [(SBRootFolderView *)self setSpecialLayoutManager:0 completionHandler:v7];
  }
  BOOL v6 = v7;
LABEL_7:
}

- (void)updatePageControlConfiguration
{
  [(SBRootFolderView *)self folderPageManagementAllowedOrientations];
  [(SBFolderView *)self orientation];
  int v3 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
  unsigned int v4 = v3 & [(SBFolderView *)self isEditing];
  id v15 = [(SBRootFolderView *)self scrollAccessoryAuxiliaryView];
  if (v15) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  BOOL v6 = [(SBFolderView *)self pageControl];
  id v7 = [(SBRootFolderView *)self scrollAccessoryView];
  [v6 setHidesForSinglePage:v5 ^ 1];
  [v6 setActsAsButton:v5];
  if (v15)
  {
    uint64_t v8 = [v7 auxiliaryView];
    if (!v8
      || (id v9 = (void *)v8,
          [v7 backgroundView],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      [v7 setAuxiliaryView:v15];
      long long v11 = [(SBRootFolderView *)self scrollAccessoryBackgroundView];
      [v7 setBackgroundView:v11];
    }
    id v12 = objc_alloc(MEMORY[0x1E4FB21E0]);
    double v13 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v14 = (void *)[v12 initWithContentColor:v13];
  }
  else
  {
    [v7 setBackgroundView:0];
    uint64_t v14 = [(SBFolderView *)self legibilitySettings];
  }
  [v6 setLegibilitySettings:v14];
}

- (void)updateAccessibilityTintColors
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 updateAccessibilityTintColors];
  [(SBDockView *)self->_dockView updateAccessibilityTintColor];
}

- (void)folderDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v6 folderDidChange];
  objc_super v3 = [(SBFolderView *)self folder];
  dockListView = self->_dockListView;
  uint64_t v5 = [v3 dock];
  [(SBIconListView *)dockListView setModel:v5];
}

- (void)setPullDownSearchVisibilityProgress:(double)a3
{
  if (self->_pullDownSearchVisibilityProgress != a3
    || BSFloatGreaterThanOrEqualToFloat()
    && ([(SBRootFolderView *)self searchPresenter],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    self->_pullDownSearchVisibilityProgress = a3;
    [(SBRootFolderView *)self _layoutSubviewsForPulldownSearch];
    [(SBRootFolderView *)self _animateViewsForPullingToSearch];
  }
}

- (void)setLeadingCustomViewVisibilityProgress:(double)a3
{
  if (self->_leadingCustomViewVisibilityProgress != a3)
  {
    self->_leadingCustomViewVisibilityProgress = a3;
    [(SBRootFolderView *)self _animateViewsForScrollingToLeadingOrTrailingCustomView];
  }
}

- (void)setTrailingCustomViewVisibilityProgress:(double)a3
{
  if (self->_trailingCustomViewVisibilityProgress != a3)
  {
    self->_trailingCustomViewVisibilityProgress = a3;
    [(SBRootFolderView *)self _animateViewsForScrollingToLeadingOrTrailingCustomView];
    [(SBRootFolderView *)self _updateDockViewZOrdering];
  }
}

- (void)setSpecialLayoutManager:(id)a3
{
}

- (void)setSpecialLayoutManager:(id)a3 completionHandler:(id)a4
{
  objc_super v6 = (SBRootFolderViewLayoutManager *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  specialLayoutManager = self->_specialLayoutManager;
  if (specialLayoutManager == v6)
  {
    if (v7) {
      (*((void (**)(id))v7 + 2))(v7);
    }
  }
  else
  {
    uint64_t v10 = specialLayoutManager;
    uint64_t v37 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v11 = [v37 iconEditingSettings];
    [(id)v11 defaultSpringDuration];
    double v13 = v12;
    id v36 = (void *)v11;
    [(id)v11 defaultSpringDampingRatio];
    double v15 = v14;
    LOBYTE(v11) = UIAccessibilityIsReduceMotionEnabled();
    char v16 = [(SBRootFolderViewLayoutManager *)v10 isTrackingActiveOrDroppingIconDrags];
    uint64_t v17 = 0;
    double v39 = v8;
    if ((v11 & 1) == 0 && (v16 & 1) == 0) {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:0 dampingRatio:v13 animations:v15];
    }
    double v18 = [(SBFolderView *)self delegate];
    long long v19 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    int v21 = isKindOfClass & 1;
    double v22 = self;
    char v23 = objc_opt_isKindOfClass();

    if (v23 & 1) != 0 && (objc_opt_respondsToSelector())
    {
      CGSize v24 = [(SBRootFolderViewLayoutManager *)v10 userInfo];
      [v18 rootFolderView:self willDismissPageManagementUsingAnimator:v17 context:v24];
    }
    char v35 = v23 & 1;
    if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v18 rootFolderView:self willPresentPageManagementWithLayoutManager:v6 animator:v17 context:v25];
      [(SBRootFolderViewLayoutManager *)v6 setUserInfo:v25];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6AAEEE8;
    id v26 = v10;
    char v51 = v26;
    uint64_t v52 = self;
    CGPoint v27 = v6;
    double v53 = v27;
    id v54 = v39;
    id v28 = _Block_copy(aBlock);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_2;
    v48[3] = &unk_1E6AACA68;
    id v29 = v28;
    id v49 = v29;
    [v17 addCompletion:v48];
    [(SBRootFolderViewLayoutManager *)v27 setRootFolderView:self];
    double v30 = [(SBRootFolderView *)self layoutManager];
    if (v27) {
      objc_storeStrong((id *)&self->_specialLayoutManager, a3);
    }
    [(SBRootFolderView *)self setTransitioningNewSpecialLayoutManager:v27];
    [(SBRootFolderView *)self setTransitioningOldSpecialLayoutManager:v26];
    [v30 transitionToActive:0 inFolderView:self usingAnimator:v17];
    [(SBRootFolderViewLayoutManager *)v27 transitionToActive:1 inFolderView:self usingAnimator:v17];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_3;
    v42[3] = &unk_1E6AAEF10;
    char v46 = v35;
    char v47 = v21;
    id v31 = v18;
    id v43 = v31;
    CGFloat v32 = v26;
    uint64_t v44 = v32;
    CGFloat v45 = self;
    id v33 = _Block_copy(v42);
    id v34 = v33;
    if (v17)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_4;
      v40[3] = &unk_1E6AACA68;
      id v41 = v33;
      [v17 addCompletion:v40];
      [v17 startAnimation];
    }
    else
    {
      (*((void (**)(void *, uint64_t))v33 + 2))(v33, 1);
      [(SBRootFolderViewLayoutManager *)v32 setRootFolderView:0];
      objc_storeStrong((id *)&self->_specialLayoutManager, a3);
      [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:&__block_literal_global_22 animations:v29 completion:0.3];
    }
    uint64_t v8 = v39;
  }
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setRootFolderView:0];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1368), *(id *)(a1 + 48));
    objc_super v3 = [*(id *)(a1 + 40) transitioningOldSpecialLayoutManager];
    unsigned int v4 = *(void **)(a1 + 32);

    if (v3 == v4) {
      [*(id *)(a1 + 40) setTransitioningOldSpecialLayoutManager:0];
    }
    uint64_t v5 = [*(id *)(a1 + 40) transitioningNewSpecialLayoutManager];
    objc_super v6 = *(void **)(a1 + 48);

    if (v5 == v6) {
      [*(id *)(a1 + 40) setTransitioningNewSpecialLayoutManager:0];
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 56))
    {
      if (!*(unsigned char *)(result + 57))
      {
        if (objc_opt_respondsToSelector())
        {
          objc_super v3 = [*(id *)(v2 + 40) userInfo];
          [*(id *)(v2 + 32) rootFolderView:*(void *)(v2 + 48) didDismissPageManagementWithLayoutManager:*(void *)(v2 + 40) context:v3];
        }
        unsigned int v4 = *(void **)(v2 + 40);
        return [v4 setUserInfo:0];
      }
    }
  }
  return result;
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)pageControlDidReceiveButtonTap:(id)a3
{
  if ([(SBFolderView *)self isEditing])
  {
    [(SBRootFolderView *)self enterPageManagementUIWithCompletionHandler:0];
  }
  else
  {
    id v4 = [(SBFolderView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 rootFolderViewWantsSearchPresented:self];
    }
  }
}

- (void)pageControlDidBeginScrubbing:(id)a3
{
  id v4 = [(SBRootFolderView *)self scrubbingPageDotsVisibilityAssertion];

  if (!v4)
  {
    id v5 = [(SBRootFolderView *)self requirePageDotsVisibilityForReason:@"scrubbing"];
    [(SBRootFolderView *)self setScrubbingPageDotsVisibilityAssertion:v5];
  }
}

- (void)pageControlDidEndScrubbing:(id)a3
{
  id v4 = [(SBRootFolderView *)self scrubbingPageDotsVisibilityAssertion];
  [(SBRootFolderView *)self setScrubbingPageDotsVisibilityAssertion:0];
  [v4 invalidate];
}

- (void)minimumHomeScreenScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 minimumHomeScreenScaleDidChange];
  [(SBDockView *)self->_dockView minimumHomeScreenScaleDidChange];
}

- (id)_createIconListViewForList:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  objc_super v3 = [(SBFolderView *)&v5 _createIconListViewForList:a3];
  [v3 setAdjustsColumnPositionsForFullScreenWidth:1];
  return v3;
}

- (id)iconListViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)SBRootFolderView;
  -[SBFolderView iconListViewAtPoint:](&v18, sel_iconListViewAtPoint_);
  objc_super v6 = (SBDockIconListView *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    dockListView = self->_dockListView;
    [(SBDockIconListView *)dockListView bounds];
    -[SBDockIconListView convertRect:toView:](dockListView, "convertRect:toView:", self);
    v20.double x = x;
    v20.double y = y;
    if (CGRectContainsPoint(v21, v20))
    {
      objc_super v6 = self->_dockListView;
    }
    else
    {
      uint64_t v8 = [(SBRootFolderView *)self leadingCustomViewController];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = [(SBRootFolderView *)self leadingCustomViewController];
        uint64_t v11 = [v10 view];
        objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
        double v13 = v12;
        double v15 = v14;

        char v16 = [v10 iconListViewQueryable];
        objc_msgSend(v16, "iconListViewAtPoint:", v13, v15);
        objc_super v6 = (SBDockIconListView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = 0;
      }
    }
  }
  return v6;
}

- (void)resetIconListViews
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v6 resetIconListViews];
  dockListView = self->_dockListView;
  id v4 = [(SBFolderView *)self folder];
  objc_super v5 = [v4 dock];
  [(SBIconListView *)dockListView setModel:v5];

  [(SBIconListView *)self->_dockListView showAllIcons];
  [(SBIconListView *)self->_dockListView layoutIconsNow];
}

- (void)tearDownListViews
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 tearDownListViews];
  [(SBIconListView *)self->_dockListView setModel:0];
}

+ (id)defaultIconLocation
{
  return @"SBIconLocationRoot";
}

- (id)visibleIconListViews
{
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  objc_super v3 = [(SBFolderView *)&v7 visibleIconListViews];
  id v4 = [(SBRootFolderView *)self dockListView];
  if (v4 && [(SBRootFolderView *)self isDockVisible])
  {
    uint64_t v5 = [v3 arrayByAddingObject:v4];

    objc_super v3 = (void *)v5;
  }

  return v3;
}

- (void)enumerateScrollViewPageViewsUsingBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_searchableLeadingCustomWrapperViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
      char v21 = 0;
      v4[2](v4, v10, &v21);
      if (v21) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
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

    v20.receiver = self;
    v20.super_class = (Class)SBRootFolderView;
    [(SBFolderView *)&v20 enumerateScrollViewPageViewsUsingBlock:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = self->_searchableTrailingCustomWrapperViews;
    uint64_t v11 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
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
        char v21 = 0;
        v4[2](v4, v15, &v21);
        if (v21) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
          if (v12) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
  }
}

- (void)setIdleText:(id)a3
{
}

- (void)setIdleText:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if (![(id)v8 length])
  {

    uint64_t v8 = 0;
  }
  uint64_t v9 = [(UILabel *)self->_idleTextView text];
  uint64_t v10 = v9 | v8;

  if (v10)
  {
    uint64_t v11 = [(UILabel *)self->_idleTextView text];
    char v12 = BSEqualStrings();

    if ((v12 & 1) == 0)
    {
      if (!self->_idleTextView)
      {
        uint64_t v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        idleTextView = self->_idleTextView;
        self->_idleTextView = v13;

        [(UILabel *)self->_idleTextView setTextAlignment:1];
        uint64_t v15 = self->_idleTextView;
        long long v16 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
        [(UILabel *)v15 setFont:v16];

        long long v17 = self->_idleTextView;
        long long v18 = [(SBFolderView *)self legibilitySettingsForIconListViews];
        long long v19 = [v18 primaryColor];
        if (v19)
        {
          [(UILabel *)v17 setTextColor:v19];
        }
        else
        {
          objc_super v20 = [MEMORY[0x1E4FB1618] whiteColor];
          [(UILabel *)v17 setTextColor:v20];
        }
        char v21 = self->_idleTextView;
        long long v22 = [MEMORY[0x1E4FB1618] clearColor];
        [(UILabel *)v21 setBackgroundColor:v22];

        long long v23 = [(SBFolderView *)self scalingView];
        [v23 addSubview:self->_idleTextView];

        [(UILabel *)self->_idleTextView setAlpha:0.0];
        uint64_t v58 = 0;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        *(_OWORD *)id location = 0u;
        long long v39 = 0u;
        [(SBRootFolderView *)self getMetrics:location];
        -[UILabel sbf_setBoundsAndPositionFromFrame:](self->_idleTextView, "sbf_setBoundsAndPositionFromFrame:", v44, v45);
      }
      long long v24 = self->_idleTextView;
      if (!v8)
      {
        if (!v4)
        {
          [(UILabel *)v24 removeFromSuperview];
          goto LABEL_16;
        }
        goto LABEL_14;
      }
      [(UILabel *)v24 setText:v8];
      [(UILabel *)self->_idleTextView setMarqueeEnabled:1];
      [(UILabel *)self->_idleTextView setMarqueeRunning:1];
      if (v4)
      {
        long long v24 = self->_idleTextView;
LABEL_14:
        long long v25 = v24;
        objc_initWeak(location, self);
        id v26 = (void *)MEMORY[0x1E4FB1EB0];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __41__SBRootFolderView_setIdleText_animated___block_invoke;
        v34[3] = &unk_1E6AAEF38;
        objc_copyWeak(&v37, location);
        CGPoint v27 = v25;
        char v35 = v27;
        id v28 = (id)v8;
        id v36 = v28;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __41__SBRootFolderView_setIdleText_animated___block_invoke_2;
        v30[3] = &unk_1E6AAEF60;
        objc_copyWeak(&v33, location);
        id v31 = v28;
        id v29 = v27;
        CGFloat v32 = v29;
        [v26 animateWithDuration:v34 animations:v30 completion:0.3];

        objc_destroyWeak(&v33);
        objc_destroyWeak(&v37);
        objc_destroyWeak(location);
      }
    }
  }
LABEL_16:
}

void __41__SBRootFolderView_setIdleText_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v2 = 1.0;
  if (!*(void *)(a1 + 40)) {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  [WeakRetained setNeedsLayout];
  [WeakRetained layoutIfNeeded];
}

void __41__SBRootFolderView_setIdleText_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = WeakRetained == 0;
  }
  if (!v3)
  {
    id v5 = WeakRetained;
    [*(id *)(a1 + 40) removeFromSuperview];
    id WeakRetained = v5;
    BOOL v4 = *(void **)(a1 + 40);
    if (v4 == *((void **)v5 + 154))
    {
      *((void *)v5 + 154) = 0;

      id WeakRetained = v5;
    }
  }
}

- (void)transitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderView;
  -[SBFolderView transitionToSize:withTransitionCoordinator:](&v9, sel_transitionToSize_withTransitionCoordinator_, v7, width, height);
  if ([(SBRootFolderView *)self folderPageManagementAllowedOrientations])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__SBRootFolderView_transitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E6AACFA8;
    v8[4] = self;
    [v7 animateAlongsideTransition:v8 completion:0];
  }
}

uint64_t __63__SBRootFolderView_transitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePageControlConfiguration];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v5 scrollViewWillBeginDragging:v4];
  if ([v4 isScrollAnimating]) {
    [v4 stopScrollingAndZooming];
  }
  [(SBRootFolderView *)self _captureInitialSearchScrollTrackingState];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  a5->double x = self->_scrollingAdjustment + a5->x;
  id v9 = a3;
  [(SBRootFolderView *)self setScrollingAdjustment:0.0];
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v10, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewDidEndDragging:willDecelerate:](&v6, sel_scrollViewDidEndDragging_willDecelerate_, a3);
  if (!a4) {
    [(SBRootFolderView *)self _cleanUpAfterScrolling];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v6 scrollViewDidEndDecelerating:a3];
  id v4 = [(SBFolderView *)self scrollView];
  char v5 = [v4 isTracking];

  if ((v5 & 1) == 0) {
    [(SBRootFolderView *)self _cleanUpAfterScrolling];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v6 scrollViewDidEndScrollingAnimation:a3];
  id v4 = [(SBFolderView *)self scrollView];
  if ([v4 isTracking])
  {
  }
  else
  {
    BOOL v5 = [(SBFolderView *)self _shouldIgnoreScrollingDidEndNotifications];

    if (!v5) {
      [(SBRootFolderView *)self _cleanUpAfterScrolling];
    }
  }
}

- (void)iconScrollViewDidCancelTouchTracking:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v8 iconScrollViewDidCancelTouchTracking:a3];
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  double v5 = v4;
  if ([(SBFolderView *)self currentPageIndex] < 0 && v5 <= 0.0)
  {
    objc_super v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543362;
      objc_super v10 = v7;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "%{public}@ Home Screen page mismatch, forcing page zero", buf, 0xCu);
    }
    [(SBFolderView *)self setCurrentPageIndex:[(SBFolderView *)self defaultPageIndex] animated:1];
  }
}

- (BOOL)shouldPinScrollingToFirstOrLastPageScrollOffsetForProposedScrollOffset:(CGPoint *)a3
{
  return 0;
}

- (BOOL)iconScrollView:(id)a3 shouldSetAutoscrollContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  objc_super v8 = [(SBRootFolderView *)self window];
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:", x, y);
  double v10 = v9;
  if ((([v8 isRotating] & 1) != 0
     || [(SBRootFolderView *)self allowsAutoscrollToLeadingCustomView]
     || (int64_t v11 = [(SBFolderView *)self _pageIndexForOffset:v10],
         v11 != [(SBRootFolderView *)self leadingCustomViewPageIndex]))
    && (v14.receiver = self,
        v14.super_class = (Class)SBRootFolderView,
        -[SBFolderView iconScrollView:shouldSetAutoscrollContentOffset:](&v14, sel_iconScrollView_shouldSetAutoscrollContentOffset_, v7, x, y)))
  {
    BOOL v12 = 1;
    [(SBRootFolderView *)self setAllowsFreeScrollingUntilScrollingEnds:1];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:", a3, a8, a9, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, a7.x, a7.y);
  double v12 = v11;
  if (a8) {
    double v13 = *a8;
  }
  else {
    double v13 = 0.0;
  }
  [(SBRootFolderView *)self _firstPageScrollOffsetForOverscroll];
  double v15 = v14;
  [(SBRootFolderView *)self _lastPageScrollOffsetForOverscroll];
  double v17 = v16;
  BOOL v18 = [(SBFolderView *)self isRTL];
  int v19 = !v18 && v12 < v15 || v12 > v15 && v18;
  int v20 = v12 <= v17 || v18;
  BOOL v21 = v12 < v17 && v18;
  int v22 = v20 != 1 || v21;
  if ((v19 & [(SBRootFolderView *)self _shouldIgnoreOverscrollOnFirstPageForCurrentOrientation]) != 0)
  {
    double v12 = v15;
    double v23 = 0.0;
  }
  else
  {
    double v23 = v13;
  }
  if (v22
    && [(SBRootFolderView *)self _shouldIgnoreOverscrollOnLastPageForCurrentOrientation])
  {
    double v12 = v17;
    double v23 = 0.0;
  }
  if (a8) {
    *a8 = v23;
  }
  [(SBFolderView *)self pointForScrollingDimension:v12];
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (void)updateIconListViews
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v3 updateIconListViews];
  [(SBRootFolderView *)self layoutSearchableViews];
}

- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if ([(SBFolderView *)self currentPageIndex] != a3
    || [(SBFolderView *)self isScrolling])
  {
    [(SBRootFolderView *)self _flashPageDotsForReason:@"animated scroll"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v7 scrollUsingDecelerationAnimationToPageIndex:a3 withCompletionHandler:v6];
}

- (int64_t)pageIndexForLeadingCustomPageIndex:(unint64_t)a3
{
  double v5 = [(SBRootFolderView *)self leadingCustomView];

  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  return [(SBFolderView *)&v7 pageIndexForLeadingCustomPageIndex:a3];
}

- (int64_t)firstLeadingCustomPageIndex
{
  if ([(SBRootFolderView *)self isLeadingCustomViewPageHidden]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_super v3 = [(SBRootFolderView *)self leadingCustomView];

  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  return [(SBFolderView *)&v5 firstLeadingCustomPageIndex];
}

- (int64_t)lastLeadingCustomPageIndex
{
  if ([(SBRootFolderView *)self isLeadingCustomViewPageHidden]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_super v3 = [(SBRootFolderView *)self leadingCustomView];

  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  return [(SBFolderView *)&v5 lastLeadingCustomPageIndex];
}

- (double)trailingCustomViewPageScrollOffset
{
  [(SBFolderView *)self _pageWidth];
  -[SBRootFolderView trailingCustomViewPageScrollOffsetUsingPageWidth:](self, "trailingCustomViewPageScrollOffsetUsingPageWidth:");
  return result;
}

- (UIEdgeInsets)_statusBarInsetsForDockEdge:(unint64_t)a3 dockOffscreenPercentage:(double)a4
{
  uint64_t v7 = MEMORY[0x1E4FB2848];
  double v8 = *MEMORY[0x1E4FB2848];
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  [(SBDockView *)self->_dockView dockHeight];
  double v12 = v11;
  [(SBDockView *)self->_dockView dockHeightPadding];
  double v13 = 1.0 - a4;
  double v15 = -(v14 - v12 * v13);
  if (a3 == 8)
  {
    double v16 = -(v14 - v12 * v13);
LABEL_5:
    double v15 = v9;
    goto LABEL_6;
  }
  double v16 = *(double *)(v7 + 24);
  if (a3 != 2) {
    goto LABEL_5;
  }
LABEL_6:
  double v17 = v8;
  double v18 = v10;
  result.right = v16;
  result.bottom = v18;
  result.left = v15;
  result.top = v17;
  return result;
}

- (void)_cleanUpAfterScrolling
{
  if (![(SBFolderView *)self isScrolling])
  {
    self->_isLeadingCustomViewBouncing = 0;
    [(SBRootFolderView *)self _resetSearchScrollTrackingState];
  }
}

- (void)_captureInitialSearchScrollTrackingState
{
  self->_scrollToSearchIsDraggingOrAnimating = 1;
  [(SBFolderView *)self _pageWidth];
  self->_double pageWidthWhenScrollToSearchBeganDragging = v3;
  if ([(SBFolderView *)self isRTL])
  {
    [(SBFolderView *)self _scrollOffsetForFirstListView];
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  }
  else
  {
    double pageWidthWhenScrollToSearchBeganDragging = self->_pageWidthWhenScrollToSearchBeganDragging;
  }
  self->_double baseOffsetForDeterminingScrollToSearchThreshold = pageWidthWhenScrollToSearchBeganDragging;
  id v6 = [(SBFolderView *)self scrollView];
  [v6 contentOffset];
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  self->_scrollOffsetWhenScrollingBegan = v5;
}

- (void)_resetSearchScrollTrackingState
{
  self->_scrollToSearchIsDraggingOrAnimating = 0;
  self->_double pageWidthWhenScrollToSearchBeganDragging = 1.79769313e308;
  self->_double baseOffsetForDeterminingScrollToSearchThreshold = 1.79769313e308;
  self->_scrollOffsetWhenScrollingBegan = 1.79769313e308;
}

- (BOOL)_useParallaxOnPageControl
{
  return 0;
}

- (void)_updateParallaxSettings
{
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderView;
  [(SBFolderView *)&v8 _updateParallaxSettings];
  BOOL v3 = [(SBFolderView *)self isParallaxEnabled];
  double v4 = [(SBRootFolderView *)self scrollAccessoryView];
  double v5 = v4;
  id v6 = (double *)MEMORY[0x1E4FB3330];
  if (!v3) {
    id v6 = (double *)MEMORY[0x1E4FB3328];
  }
  [v4 _setVisualAltitude:*v6];

  uint64_t v7 = [(SBFolderView *)self scrollView];
  SBFApplyParallaxSettingsToViewWithFactor();
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  objc_super v8 = (SBFParallaxSettings *)a3;
  id v6 = a4;
  uint64_t v7 = (SBHHomePullToSearchSettings *)v8;
  if (self->_parallaxSettings == v8)
  {
    [(SBRootFolderView *)self _updateParallaxSettings];
    uint64_t v7 = (SBHHomePullToSearchSettings *)v8;
  }
  if (self->_pullToSearchSettings == v7) {
    [(SBRootFolderView *)self _updatePullToSearchSettings];
  }
}

- (void)_updatePullToSearchSettings
{
  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings searchContentFadeInStartThreshold];
  -[SBRootFolderView setPullToSearchFadeInThreshold:](self, "setPullToSearchFadeInThreshold:");
  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionActivationThreshold];
  -[SBRootFolderView setPullToSearchActivationThreshold:](self, "setPullToSearchActivationThreshold:");
  double v3 = (double)[(SBHHomePullToSearchSettings *)self->_pullToSearchSettings appIconsFollowTranslation];
  [(SBRootFolderView *)self setPullToSearchTranslatesIcons:v3];
}

- (void)_animateViewsForPullingToSearch
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  [(SBRootFolderView *)self getMetrics:v3];
  [(SBRootFolderView *)self _animateViewsForPullingToSearchWithMetrics:v3];
}

- (void)_animateViewsForScrollingToLeadingOrTrailingCustomView
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  [(SBRootFolderView *)self getMetrics:v3];
  [(SBRootFolderView *)self _animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:v3];
}

- (BOOL)isOnTrailingCustomPage
{
  return [(SBFolderView *)self currentPageType] == 2;
}

- (void)_adjustLeadingCustomContentForEdgeBounce
{
  double v3 = [(SBFolderView *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "rootFolderView:wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:", self, v5, v7);
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBRootFolderView;
  double v4 = [(SBFolderView *)&v16 descriptionBuilderWithMultilinePrefix:a3];
  if ([(NSHashTable *)self->_dockOffscreenProgressSettingClients count]) {
    id v5 = (id)[v4 appendObject:self->_dockOffscreenProgressSettingClients withName:@"dockOffscreenProgressSettingClients"];
  }
  id v6 = (id)[v4 appendBool:self->_dockExternal withName:@"isDockExternal" ifEqualTo:1];
  id v7 = (id)[v4 appendFloat:@"leadingCustomViewVisibilityProgress" withName:2 decimalPrecision:self->_leadingCustomViewVisibilityProgress];
  id v8 = (id)[v4 appendFloat:@"pullDownSearchVisibilityProgress" withName:2 decimalPrecision:self->_pullDownSearchVisibilityProgress];
  id v9 = (id)[v4 appendBool:self->_userAttemptedToOverscrollFirstPageDuringCurrentGesture withName:@"userAttemptedToOverscrollFirstPageDuringCurrentGesture" ifEqualTo:1];
  id v10 = (id)[v4 appendBool:self->_userAttemptedToOverscrollLastPageDuringCurrentGesture withName:@"userAttemptedToOverscrollLastPageDuringCurrentGesture" ifEqualTo:1];
  id v11 = (id)[v4 appendBool:self->_allowsFreeScrollingUntilScrollingEnds withName:@"allowsFreeScrollingUntilScrollingEnds" ifEqualTo:1];
  if ((BSFloatIsZero() & 1) == 0) {
    id v12 = (id)[v4 appendFloat:@"scrollingAdjustment" withName:2 decimalPrecision:self->_scrollingAdjustment];
  }
  id v13 = (id)[v4 appendObject:self->_dockBorrowedAssertion withName:@"dockBorrowedAssertion" skipIfNil:1];
  id v14 = (id)[v4 appendObject:self->_scrollAccessoryBorrowedAssertion withName:@"scrollAccessoryBorrowedAssertion" skipIfNil:1];
  return v4;
}

- (id)accessibilityTintColorForDockView:(id)a3
{
  [(SBDockView *)self->_dockView frame];
  return -[SBFolderView accessibilityTintColorForRect:tintStyle:](self, "accessibilityTintColorForRect:tintStyle:", 3);
}

- (void)remoteBasebandLogCollectionStateDidChange:(BOOL)a3
{
  if (a3) {
    double v3 = (__CFString *)*MEMORY[0x1E4FA6110];
  }
  else {
    double v3 = &stru_1F2FA0300;
  }
  [(SBRootFolderView *)self setIdleText:v3];
}

- (void)_setupIdleTextPrivacyDisclosures
{
  double v3 = [MEMORY[0x1E4FA5FC0] sharedInstance];
  [v3 addObserver:self];

  if (ct_green_tea_logging_enabled())
  {
    double v4 = @"Regulatory Logging Enabled";
  }
  else
  {
    id v5 = [MEMORY[0x1E4FA5FC0] sharedInstance];
    int v6 = [v5 isLogCollectionEnabled];

    if (!v6) {
      return;
    }
    double v4 = (__CFString *)*MEMORY[0x1E4FA6110];
  }
  [(SBRootFolderView *)self setIdleText:v4 animated:0];
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  id v10 = a3;
  searchBackdropView = self->_searchBackdropView;
  if (searchBackdropView)
  {
    [(SBSearchBackdropView *)searchBackdropView removeFromSuperview];
    id v5 = self->_searchBackdropView;
    self->_searchBackdropView = 0;

    [(SBRootFolderView *)self _setupSearchBackdropViewIfNecessary];
  }
  trailingCustomBackdropView = self->_trailingCustomBackdropView;
  if (trailingCustomBackdropView)
  {
    [(SBSearchBackdropView *)trailingCustomBackdropView removeFromSuperview];
    id v7 = self->_trailingCustomBackdropView;
    self->_trailingCustomBackdropView = 0;

    [(SBRootFolderView *)self _setupTrailingCustomBackdropViewIfNecessary];
  }
  leadingCustomBackdropView = self->_leadingCustomBackdropView;
  if (leadingCustomBackdropView)
  {
    [(SBSearchBackdropView *)leadingCustomBackdropView removeFromSuperview];
    id v9 = self->_leadingCustomBackdropView;
    self->_leadingCustomBackdropView = 0;

    [(SBRootFolderView *)self _setupLeadingCustomBackdropViewIfNecessary];
  }
}

- (void)_setupSearchBackdropViewIfNecessary
{
  if (!self->_searchBackdropView)
  {
    int v6 = self->_searchPulldownWrapperView;
    double v3 = [SBSearchBackdropView alloc];
    [(_SBRootFolderLayoutWrapperView *)v6 bounds];
    double v4 = -[SBSearchBackdropView initWithFrame:style:](v3, "initWithFrame:style:", 0);
    searchBackdropView = self->_searchBackdropView;
    self->_searchBackdropView = v4;

    [(SBSearchBackdropView *)self->_searchBackdropView setAutoresizingMask:18];
    [(SBSearchBackdropView *)self->_searchBackdropView setAlpha:1.0];
    [(_SBRootFolderLayoutWrapperView *)v6 insertSubview:self->_searchBackdropView atIndex:0];
  }
}

- (void)_setupLeadingCustomBackdropViewIfNecessary
{
  if ([(NSArray *)self->_searchableLeadingCustomWrapperViews count] && !self->_leadingCustomBackdropView)
  {
    int v6 = self;
    double v3 = [SBSearchBackdropView alloc];
    [(SBRootFolderView *)v6 _scaledBoundsForMinimumHomeScreenScale];
    double v4 = -[SBSearchBackdropView initWithFrame:style:](v3, "initWithFrame:style:", 4);
    leadingCustomBackdropView = self->_leadingCustomBackdropView;
    self->_leadingCustomBackdropView = v4;

    [(SBSearchBackdropView *)self->_leadingCustomBackdropView setAutoresizingMask:18];
    [(SBSearchBackdropView *)self->_leadingCustomBackdropView setAlpha:1.0];
    [(SBSearchBackdropView *)self->_leadingCustomBackdropView prepareForTransitionToBlurred:0];
    [(SBSearchBackdropView *)self->_leadingCustomBackdropView completeTransitionSuccessfully:1];
    [(SBRootFolderView *)v6 insertSubview:self->_leadingCustomBackdropView atIndex:0];
  }
}

- (void)_setupTrailingCustomBackdropViewIfNecessary
{
  if ([(NSArray *)self->_searchableTrailingCustomWrapperViews count] && !self->_trailingCustomBackdropView)
  {
    leadingCustomViewControllers = self->_leadingCustomViewControllers;
    id v8 = self;
    if ([(NSArray *)leadingCustomViewControllers count]) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 1;
    }
    id v5 = [SBSearchBackdropView alloc];
    [(SBRootFolderView *)v8 _scaledBoundsForMinimumHomeScreenScale];
    int v6 = -[SBSearchBackdropView initWithFrame:style:](v5, "initWithFrame:style:", v4);
    trailingCustomBackdropView = self->_trailingCustomBackdropView;
    self->_trailingCustomBackdropView = v6;

    [(SBSearchBackdropView *)self->_trailingCustomBackdropView setAutoresizingMask:18];
    [(SBSearchBackdropView *)self->_trailingCustomBackdropView setAlpha:1.0];
    [(SBSearchBackdropView *)self->_trailingCustomBackdropView prepareForTransitionToBlurred:0];
    [(SBSearchBackdropView *)self->_trailingCustomBackdropView completeTransitionSuccessfully:1];
    [(SBRootFolderView *)v8 insertSubview:self->_trailingCustomBackdropView atIndex:0];
  }
}

- (void)_setupTrailingCustomDimmingViewIfNecessary
{
  if ([(NSArray *)self->_searchableTrailingCustomWrapperViews count] && !self->_trailingCustomSearchDimmingView)
  {
    double v3 = (objc_class *)MEMORY[0x1E4FB1EB0];
    uint64_t v4 = self;
    id v5 = [v3 alloc];
    [(SBRootFolderView *)v4 _scaledBoundsForMinimumHomeScreenScale];
    int v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    trailingCustomSearchDimmingView = self->_trailingCustomSearchDimmingView;
    self->_trailingCustomSearchDimmingView = v6;

    [(UIView *)self->_trailingCustomSearchDimmingView setAutoresizingMask:18];
    [(UIView *)self->_trailingCustomSearchDimmingView setAlpha:0.0];
    [(UIView *)self->_trailingCustomSearchDimmingView setUserInteractionEnabled:0];
    id v8 = self->_trailingCustomSearchDimmingView;
    id v9 = [(SBRootFolderView *)v4 trailingCustomBackdropView];
    [(SBRootFolderView *)v4 insertSubview:v8 aboveSubview:v9];
  }
}

- (void)_doPageManagementEducation
{
}

- (void)_setupStateDumper
{
  if (!self->_dockStateDumpHandle)
  {
    if (self->_dockView)
    {
      objc_initWeak(&location, self);
      id v3 = MEMORY[0x1E4F14428];
      objc_copyWeak(&v6, &location);
      BSLogAddStateCaptureBlockWithTitle();
      uint64_t v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      dockStateDumpHandle = self->_dockStateDumpHandle;
      self->_dockStateDumpHandle = v4;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

id __37__SBRootFolderView__setupStateDumper__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _stateCaptureString];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_stateCaptureString
{
  v49[12] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBRootFolderView *)self dockView];
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  memset(v40, 0, sizeof(v40));
  [(SBRootFolderView *)self getMetrics:v40];
  v48[0] = @"hidden";
  id v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isHidden"));
  v49[0] = v38;
  v48[1] = @"alpha";
  id v5 = NSNumber;
  [v4 alpha];
  id v37 = objc_msgSend(v5, "numberWithDouble:");
  v49[1] = v37;
  v48[2] = @"leadingCustomViewVisibilityProgress";
  id v6 = NSNumber;
  [(SBRootFolderView *)self leadingCustomViewVisibilityProgress];
  id v36 = objc_msgSend(v6, "numberWithDouble:");
  v49[2] = v36;
  v48[3] = @"pullDownSearchVisibilityProgress";
  id v7 = NSNumber;
  [(SBRootFolderView *)self pullDownSearchVisibilityProgress];
  char v35 = objc_msgSend(v7, "numberWithDouble:");
  v49[3] = v35;
  void v48[4] = @"currentDockOffscreenFraction";
  id v8 = NSNumber;
  [(SBRootFolderView *)self currentDockOffscreenFraction];
  id v34 = objc_msgSend(v8, "numberWithDouble:");
  v49[4] = v34;
  v48[5] = @"transform";
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  uint64_t v9 = NSStringFromCGAffineTransform(&transform);
  id v10 = &stru_1F2FA0300;
  id v33 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_1F2FA0300;
  }
  v49[5] = v11;
  v48[6] = @"dockFrame";
  [v4 frame];
  uint64_t v12 = NSStringFromCGRect(v51);
  CGFloat v32 = (void *)v12;
  if (v12) {
    id v13 = (__CFString *)v12;
  }
  else {
    id v13 = &stru_1F2FA0300;
  }
  v49[6] = v13;
  v48[7] = @"effectiveDockFrame";
  uint64_t v14 = NSStringFromCGRect(v40[6]);
  double v15 = (void *)v14;
  if (v14) {
    objc_super v16 = (__CFString *)v14;
  }
  else {
    objc_super v16 = &stru_1F2FA0300;
  }
  v49[7] = v16;
  v48[8] = @"dockView";
  uint64_t v17 = [v4 description];
  double v18 = (void *)v17;
  if (v17) {
    int v19 = (__CFString *)v17;
  }
  else {
    int v19 = &stru_1F2FA0300;
  }
  v49[8] = v19;
  v48[9] = @"dockViewSuperview";
  int v20 = [v4 superview];
  uint64_t v21 = [v20 description];
  int v22 = (void *)v21;
  if (v21) {
    double v23 = (__CFString *)v21;
  }
  else {
    double v23 = &stru_1F2FA0300;
  }
  v49[9] = v23;
  v48[10] = @"dockWindow";
  uint64_t v24 = [v4 window];
  double v25 = (void *)v24;
  if (v24) {
    id v26 = (__CFString *)v24;
  }
  else {
    id v26 = &stru_1F2FA0300;
  }
  v49[10] = v26;
  v48[11] = @"dockWindowLevel";
  CGPoint v27 = [v4 window];
  if (v27)
  {
    id v28 = NSNumber;
    double v2 = [v4 window];
    [v2 windowLevel];
    objc_msgSend(v28, "numberWithDouble:");
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v49[11] = v10;
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:12];
  if (v27)
  {
  }
  double v30 = [v29 description];

  return v30;
}

- (double)_firstPageScrollOffsetForOverscroll
{
  [(SBFolderView *)self _scrollOffsetForPageAtIndex:[(SBFolderView *)self minimumPageIndex]];
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  return result;
}

- (double)_lastPageScrollOffsetForOverscroll
{
  [(SBFolderView *)self _scrollOffsetForPageAtIndex:[(SBFolderView *)self maximumPageIndex]];
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  return result;
}

- (void)_overscrollScrollPanGestureRecognizerDidUpdate:(id)a3
{
  id v23 = a3;
  uint64_t v4 = [v23 state];
  [(SBRootFolderView *)self _firstPageScrollOffsetForOverscroll];
  double v6 = v5;
  [(SBRootFolderView *)self _lastPageScrollOffsetForOverscroll];
  double v8 = v7;
  BOOL v9 = [(SBRootFolderView *)self _shouldIgnoreOverscrollOnFirstPageForCurrentOrientation];
  BOOL v10 = [(SBRootFolderView *)self _shouldIgnoreOverscrollOnLastPageForCurrentOrientation];
  BOOL v11 = v10;
  if (v9 || v10)
  {
    if ((unint64_t)(v4 - 3) < 3)
    {
      [(SBRootFolderView *)self _cleanUpAfterOverscrollScrollGestureEnded:v23];
      goto LABEL_33;
    }
    if (v4 == 2)
    {
      [v23 translationInView:self];
      -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
      double v13 = v12;
      double v14 = self->_scrollOffsetWhenScrollingBegan - v12;
      BOOL v15 = [(SBFolderView *)self isRTL];
      BOOL v16 = !v15 && v14 < v6 || v14 > v6 && v15;
      int v17 = v14 <= v8 || v15;
      BOOL v18 = v17 != 1 || v14 < v8 && v15;
      int v19 = [(SBFolderView *)self delegate];
      if (v16 && v9)
      {
        [(SBRootFolderView *)self setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:1];
        char v21 = objc_opt_respondsToSelector();
        double v20 = v13;
        if ((v21 & 1) == 0) {
          goto LABEL_27;
        }
      }
      else if (!self->_lastEventWasAttemptingToOverscrollFirstPage {
             || v16
      }
             || ([(SBRootFolderView *)self setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:1], char v22 = objc_opt_respondsToSelector(), v20 = 0.0, (v22 & 1) == 0))
      {
LABEL_27:
        if (v18 && v11 || self->_lastEventWasAttemptingToOverscrollLastPage && !v18)
        {
          -[SBRootFolderView setUserAttemptedToOverscrollLastPageDuringCurrentGesture:](self, "setUserAttemptedToOverscrollLastPageDuringCurrentGesture:", 1, v20);
          if (objc_opt_respondsToSelector()) {
            [v19 rootFolderView:self didOverscrollOnLastPageByAmount:v13];
          }
        }
        self->_lastEventWasAttemptingToOverscrollFirstPage = v16;
        self->_lastEventWasAttemptingToOverscrollLastPage = v18;

        goto LABEL_33;
      }
      [v19 rootFolderView:self didOverscrollOnFirstPageByAmount:v20];
      goto LABEL_27;
    }
  }
LABEL_33:
}

- (BOOL)_shouldIgnoreOverscrollOnFirstPageForCurrentOrientation
{
  int64_t v3 = [(SBFolderView *)self orientation];
  return [(SBRootFolderView *)self _shouldIgnoreOverscrollOnFirstPageForOrientation:v3];
}

- (BOOL)_shouldIgnoreOverscrollOnFirstPageForOrientation:(int64_t)a3
{
  return ([(SBRootFolderView *)self ignoresOverscrollOnFirstPageOrientations] & (1 << a3)) != 0;
}

- (BOOL)_shouldIgnoreOverscrollOnLastPageForCurrentOrientation
{
  int64_t v3 = [(SBFolderView *)self orientation];
  return [(SBRootFolderView *)self _shouldIgnoreOverscrollOnLastPageForOrientation:v3];
}

- (BOOL)_shouldIgnoreOverscrollOnLastPageForOrientation:(int64_t)a3
{
  return ([(SBRootFolderView *)self ignoresOverscrollOnLastPageOrientations] & (1 << a3)) != 0;
}

- (id)iconListView:(id)a3 alternateIconLocationForListWithNonDefaultSizedIcons:(BOOL)a4
{
  if (a4) {
    [(SBRootFolderView *)self iconLocationForListsWithNonDefaultSizedIcons];
  }
  else {
  uint64_t v4 = [(SBFolderView *)self iconLocation];
  }
  return v4;
}

- (SBFParallaxSettings)parallaxSettings
{
  return self->_parallaxSettings;
}

- (BOOL)allowsAutoscrollToLeadingCustomView
{
  return self->_allowsAutoscrollToLeadingCustomView;
}

- (void)setAllowsAutoscrollToLeadingCustomView:(BOOL)a3
{
  self->_allowsAutoscrollToLeadingCustomView = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (BOOL)showsAddWidgetButton
{
  return self->_showsAddWidgetButton;
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (void)setShiftsPullDownSearchForVisibility:(BOOL)a3
{
  self->_shiftsPullDownSearchForVisibilitdouble y = a3;
}

- (void)setTodayViewVisibilityProgress:(double)a3
{
  self->_todayViewVisibilityProgress = a3;
}

- (void)setDockBorrowedAssertion:(id)a3
{
  self->_dockBorrowedAssertion = (_SBRootFolderViewElementBorrowedAssertion *)a3;
}

- (void)setScrollAccessoryBorrowedAssertion:(id)a3
{
  self->_scrollAccessoryBorrowedAssertion = (_SBRootFolderViewElementBorrowedAssertion *)a3;
}

- (NSMutableArray)pageDotsVisibilityAssertions
{
  return self->_pageDotsVisibilityAssertions;
}

- (void)setPageDotsVisibilityAssertions:(id)a3
{
}

- (BSInvalidatable)scrubbingPageDotsVisibilityAssertion
{
  return self->_scrubbingPageDotsVisibilityAssertion;
}

- (void)setScrubbingPageDotsVisibilityAssertion:(id)a3
{
}

- (BSInvalidatable)editingPageDotsVisibilityAssertion
{
  return self->_editingPageDotsVisibilityAssertion;
}

- (void)setEditingPageDotsVisibilityAssertion:(id)a3
{
}

- (BSInvalidatable)searchButtonDisabledPageDotsVisibilityAssertion
{
  return self->_searchButtonDisabledPageDotsVisibilityAssertion;
}

- (void)setSearchButtonDisabledPageDotsVisibilityAssertion:(id)a3
{
}

- (BSInvalidatable)searchButtonUnsupportedHardwarePageDotsVisibilityAssertion
{
  return self->_searchButtonUnsupportedHardwarePageDotsVisibilityAssertion;
}

- (void)setSearchButtonUnsupportedHardwarePageDotsVisibilityAssertion:(id)a3
{
}

- (BSInvalidatable)configuredForSnapshotPageDotsVisibilityAssertion
{
  return self->_configuredForSnapshotPageDotsVisibilityAssertion;
}

- (void)setConfiguredForSnapshotPageDotsVisibilityAssertion:(id)a3
{
}

- (NSTimer)pageDotsVisibilityTimer
{
  return self->_pageDotsVisibilityTimer;
}

- (void)setPageDotsVisibilityTimer:(id)a3
{
}

- (SBHTouchPassThroughView)titledButtonsContainerView
{
  return self->_titledButtonsContainerView;
}

- (void)setTitledButtonsContainerView:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (void)setWidgetButton:(id)a3
{
}

- (SBIconListViewIconLocationTransitioning)firstListViewIconLocationTransitionHandler
{
  return self->_firstListViewIconLocationTransitionHandler;
}

- (void)setFirstListViewIconLocationTransitionHandler:(id)a3
{
}

- (double)scrollingAdjustment
{
  return self->_scrollingAdjustment;
}

- (SBHRootFolderSettings)folderSettings
{
  return self->_folderSettings;
}

- (void)setFolderSettings:(id)a3
{
}

- (unint64_t)ignoresOverscrollOnFirstPageOrientations
{
  return self->_ignoresOverscrollOnFirstPageOrientations;
}

- (unint64_t)ignoresOverscrollOnLastPageOrientations
{
  return self->_ignoresOverscrollOnLastPageOrientations;
}

- (void)setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:(BOOL)a3
{
  self->_userAttemptedToOverscrollFirstPageDuringCurrentGesture = a3;
}

- (void)setUserAttemptedToOverscrollLastPageDuringCurrentGesture:(BOOL)a3
{
  self->_userAttemptedToOverscrollLastPageDuringCurrentGesture = a3;
}

- (UILabel)idleTextView
{
  return self->_idleTextView;
}

- (NSArray)leadingCustomViewControllers
{
  return self->_leadingCustomViewControllers;
}

- (NSArray)trailingCustomViewControllers
{
  return self->_trailingCustomViewControllers;
}

- (_SBRootFolderLayoutWrapperView)searchPulldownWrapperView
{
  return self->_searchPulldownWrapperView;
}

- (SBHMinusPageStepper)customPageAnimationStepper
{
  return self->_customPageAnimationStepper;
}

- (SBRootFolderViewLayoutManager)transitioningNewSpecialLayoutManager
{
  return self->_transitioningNewSpecialLayoutManager;
}

- (void)setTransitioningNewSpecialLayoutManager:(id)a3
{
}

- (SBRootFolderViewLayoutManager)transitioningOldSpecialLayoutManager
{
  return self->_transitioningOldSpecialLayoutManager;
}

- (void)setTransitioningOldSpecialLayoutManager:(id)a3
{
}

- (unint64_t)folderPageManagementAllowedOrientations
{
  return self->_folderPageManagementAllowedOrientations;
}

- (UIView)scrollAccessoryBackgroundView
{
  return self->_scrollAccessoryBackgroundView;
}

- (SBHHomePullToSearchSettings)pullToSearchSettings
{
  return self->_pullToSearchSettings;
}

- (double)pullToSearchFadeInThreshold
{
  return self->_pullToSearchFadeInThreshold;
}

- (void)setPullToSearchFadeInThreshold:(double)a3
{
  self->_pullToSearchFadeInThreshold = a3;
}

- (double)pullToSearchActivationThreshold
{
  return self->_pullToSearchActivationThreshold;
}

- (void)setPullToSearchActivationThreshold:(double)a3
{
  self->_pullToSearchActivationThreshold = a3;
}

- (double)pullToSearchTranslatesIcons
{
  return self->_pullToSearchTranslatesIcons;
}

- (void)setPullToSearchTranslatesIcons:(double)a3
{
  self->_pullToSearchTranslatesIcons = a3;
}

- (NSIndexSet)hiddenLeadingCustomPageIndexes
{
  return self->_hiddenLeadingCustomPageIndexes;
}

- (void)setHiddenLeadingCustomPageIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialLayoutManager, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryView, 0);
  objc_storeStrong((id *)&self->_hiddenLeadingCustomPageIndexes, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_searchPresentableView, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_transitioningOldSpecialLayoutManager, 0);
  objc_storeStrong((id *)&self->_transitioningNewSpecialLayoutManager, 0);
  objc_storeStrong((id *)&self->_customPageAnimationStepper, 0);
  objc_storeStrong((id *)&self->_trailingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_leadingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_idleTextView, 0);
  objc_storeStrong((id *)&self->_folderSettings, 0);
  objc_storeStrong((id *)&self->_firstListViewIconLocationTransitionHandler, 0);
  objc_storeStrong((id *)&self->_widgetButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_titledButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_pageDotsVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_configuredForSnapshotPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_searchButtonUnsupportedHardwarePageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_searchButtonDisabledPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_editingPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_scrubbingPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_scrollingPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_pageDotsVisibilityAssertions, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_dockStateDumpHandle, 0);
  objc_storeStrong((id *)&self->_dockOffscreenProgressSettingClients, 0);
  objc_storeStrong((id *)&self->_trailingCustomSearchDimmingView, 0);
  objc_storeStrong((id *)&self->_trailingCustomBackdropView, 0);
  objc_storeStrong((id *)&self->_leadingCustomBackdropView, 0);
  objc_storeStrong((id *)&self->_searchBackdropView, 0);
  objc_storeStrong((id *)&self->_searchableTrailingCustomWrapperViews, 0);
  objc_storeStrong((id *)&self->_searchableLeadingCustomWrapperViews, 0);
  objc_storeStrong((id *)&self->_searchPulldownWrapperView, 0);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_dockListView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
}

- (void)elementBorrowedAssertionDidInvalidate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 reason];
  int v5 = 138412546;
  double v6 = a1;
  __int16 v7 = 2114;
  double v8 = v4;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Unknown borrowed element assertion invalidated: %@ (reason: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end