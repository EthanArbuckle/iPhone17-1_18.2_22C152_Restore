@interface SBFolderView
+ (Class)_scrollViewClass;
+ (Class)defaultIconListViewClass;
+ (NSString)defaultIconLocation;
+ (int64_t)_pageIndexForOffset:(double)a3 minimumPage:(int64_t)a4 maximumPage:(int64_t)a5 pageCount:(unint64_t)a6 pageWidth:(double)a7 pageSpacing:(double)a8 userInterfaceLayoutDirection:(int64_t)a9 behavior:(int64_t)a10 fractionOfDistanceThroughPage:(double *)a11;
+ (unint64_t)_pageOffsetForOffset:(double)a3 behavior:(int64_t)a4 pageWidth:(double)a5 pageSpacing:(double)a6 pageCount:(unint64_t)a7 userInterfaceLayoutDirection:(int64_t)a8 fractionOfDistanceThroughPage:(double *)a9;
+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection;
- (BOOL)_animatesRotationForAllVisibleIconListViews;
- (BOOL)_hasLeadingCustomPages;
- (BOOL)_hasTrailingCustomPages;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isValidIconListViewIndex:(int64_t)a3;
- (BOOL)_isValidPageIndex:(int64_t)a3;
- (BOOL)_shouldIgnoreScrollingDidEndNotifications;
- (BOOL)_shouldUseScrollableIconViewInteraction;
- (BOOL)_showsTitle;
- (BOOL)_useParallaxOnPageControl;
- (BOOL)addsFocusGuidesForWrapping;
- (BOOL)automaticallyCreatesIconListViews;
- (BOOL)canChangeCurrentPageIndexToIndex:(unint64_t)a3;
- (BOOL)doesPageContainIconListView:(int64_t)a3;
- (BOOL)hasEverBeenInAWindow;
- (BOOL)hasIconPages;
- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4;
- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5;
- (BOOL)iconScrollView:(id)a3 shouldSetAutoscrollContentOffset:(CGPoint)a4;
- (BOOL)iconScrollView:(id)a3 shouldSetContentOffset:(CGPoint *)a4 animated:(BOOL)a5;
- (BOOL)includesHiddenIconListPages;
- (BOOL)isEditing;
- (BOOL)isLeadingCustomViewPageHidden;
- (BOOL)isLeadingCustomViewPageHiddenAtIndex:(unint64_t)a3;
- (BOOL)isPageControlHidden;
- (BOOL)isPageTypeIcon:(int64_t)a3;
- (BOOL)isParallaxEnabled;
- (BOOL)isRTL;
- (BOOL)isRegisteredForIdleUpdates;
- (BOOL)isRotating;
- (BOOL)isScalingViewBorrowed;
- (BOOL)isScrolling;
- (BOOL)isScrollingDisabled;
- (BOOL)isScrollingUsingDecelerationAnimation;
- (BOOL)isVertical;
- (BOOL)isVisibleColumnRangeValid:(SBVisibleColumnRange *)a3;
- (BOOL)locationCountsAsInsideFolder:(CGPoint)a3;
- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)snapsToPageBoundariesAfterScrolling;
- (BOOL)suppressesEditingStateForListViews;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)updatesPredictedVisibleColumnWhileScrolling;
- (CGPoint)_scrollOffsetForContentAtPageIndex:(int64_t)a3;
- (CGPoint)_scrollOffsetForFirstListView;
- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3;
- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageHeight:(double)a4;
- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageWidth:(double)a4;
- (CGPoint)pointForScrollingDimension:(double)a3;
- (CGRect)_frameForIconListAtIndex:(unint64_t)a3;
- (CGSize)_iconListViewSize;
- (CGSize)_scrollViewContentSize;
- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5;
- (Class)listViewClass;
- (NSArray)iconListViews;
- (NSArray)visibleIconListViews;
- (NSString)description;
- (NSString)iconLocation;
- (SBFolder)folder;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBFolderTitleTextField)_titleTextField;
- (SBFolderView)initWithConfiguration:(id)a3;
- (SBFolderViewDelegate)delegate;
- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageHeight:(double)a4;
- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageWidth:(double)a4;
- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageWidthOrHeight:(double)a4;
- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3;
- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3 pageHeight:(double)a4;
- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3 pageWidth:(double)a4;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListModel)currentIconListModel;
- (SBIconListPageControl)pageControl;
- (SBIconListView)currentIconListView;
- (SBIconViewProviding)iconViewProvider;
- (SBVisibleColumnRange)visibleColumnRangeExcludingAdditionalWidthKeptVisible;
- (SBVisibleColumnRange)visibleColumnRangeWithTotalLists:(SEL)a3 iconVisibilityHandling:(unint64_t)a4 predictedVisibleColumn:(int64_t)a5 includingAdditionalColumnsKeptVisible:(SBFolderPredictedVisibleColumn *)a6;
- (UIEdgeInsets)_scrollingInteractionVisibleInsets;
- (UIPanGestureRecognizer)scrollingDisabledGestureRecognizer;
- (UIScrollView)scrollView;
- (UIView)headerView;
- (UIView)scalingView;
- (_UILegibilitySettings)legibilitySettings;
- (double)_offsetToCenterPageControlInSpaceForPageControl;
- (double)_pageHeight;
- (double)_pageSpacing;
- (double)_pageWidth;
- (double)_pageWidthOrHeight;
- (double)_titleFontSize;
- (double)additionalScrollWidthToKeepVisibleInOneDirection;
- (double)currentScrollOffset;
- (double)headerHeight;
- (double)maximumVisibleScrollOffset;
- (double)minimumVisibleScrollOffset;
- (double)pageControlAlpha;
- (double)pageControlAreaHeight;
- (double)scrollOffsetForPageIndexCalculation;
- (double)scrollableWidthForVisibleColumnRange;
- (double)scrollingDimensionForPoint:(CGPoint)a3;
- (id)_createIconListViewForList:(id)a3;
- (id)_dragDelegate;
- (id)_interactionTintColor;
- (id)_legibilitySettingsWithPrimaryColor:(id)a3;
- (id)_newPageControl;
- (id)accessibilityLegibilitySettingsForRect:(CGRect)a3 tintStyle:(unint64_t)a4;
- (id)accessibilityTintColorForRect:(CGRect)a3 tintStyle:(unint64_t)a4;
- (id)additionalIconListViews;
- (id)allIconListViews;
- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (id)borrowScalingView;
- (id)currentPageUniqueIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)disableAutoScrollForReason:(id)a3;
- (id)effectiveIconImageAppearance;
- (id)firstIconListView;
- (id)highlightingViewForPageControl:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)iconListModelForPageIndex:(int64_t)a3;
- (id)iconListView:(id)a3 animatorForLayingOutIconView:(id)a4 proposedAnimator:(id)a5;
- (id)iconListView:(id)a3 animatorForRemovingIcons:(id)a4 proposedAnimator:(id)a5;
- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4;
- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5;
- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5;
- (id)iconListViewAtIndex:(unint64_t)a3;
- (id)iconListViewAtPoint:(CGPoint)a3;
- (id)iconListViewAtScrollPoint:(CGPoint)a3;
- (id)iconListViewDisplayingIconView:(id)a3;
- (id)iconListViewForDrag:(id)a3;
- (id)iconListViewForIconListModelIndex:(unint64_t)a3;
- (id)iconListViewForPageIndex:(int64_t)a3;
- (id)iconListViewForTouch:(id)a3;
- (id)iconListViewWithList:(id)a3;
- (id)iconVisibilityDescription;
- (id)lastIconListView;
- (id)preferredFocusEnvironments;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)uniqueIdentifierForPageIndex:(int64_t)a3;
- (int64_t)_adjustPageIndexForPageControl:(int64_t)a3;
- (int64_t)_adjustPageIndexFromPageControl:(int64_t)a3;
- (int64_t)_pageIndexForOffset:(double)a3;
- (int64_t)_pageIndexForOffset:(double)a3 behavior:(int64_t)a4 fractionOfDistanceThroughPage:(double *)a5;
- (int64_t)closestIconPageIndexForPageIndex:(int64_t)a3;
- (int64_t)currentPageIndex;
- (int64_t)firstIconPageIndex;
- (int64_t)firstLeadingCustomPageIndex;
- (int64_t)firstTrailingCustomPageIndex;
- (int64_t)iconInsertionAnimationOriginatingEdgeForIconListView:(id)a3;
- (int64_t)iconRemovalAnimationDestinationEdgeForIconListView:(id)a3;
- (int64_t)iconSpacingAxisMatchingBehavior;
- (int64_t)iconVisibilityHandling;
- (int64_t)lastIconPageIndex;
- (int64_t)lastLeadingCustomPageIndex;
- (int64_t)lastTrailingCustomPageIndex;
- (int64_t)maximumPageIndex;
- (int64_t)minimumPageIndex;
- (int64_t)nearestIconPageIndex;
- (int64_t)orientation;
- (int64_t)pageIndexForIconListModel:(id)a3;
- (int64_t)pageIndexForIconListModelIndex:(unint64_t)a3;
- (int64_t)pageIndexForIconListViewIndex:(unint64_t)a3;
- (int64_t)pageIndexForLeadingCustomPageIndex:(unint64_t)a3;
- (int64_t)pageIndexForTrailingCustomPageIndex:(unint64_t)a3;
- (int64_t)pageIndexForUniqueIdentifier:(id)a3;
- (int64_t)scrollAnimationTargetPageIndex;
- (int64_t)userInterfaceLayoutDirection;
- (unint64_t)allowedOrientations;
- (unint64_t)columnCountForPageIndex:(int64_t)a3;
- (unint64_t)columnCountInVisibleColumnRange:(SBVisibleColumnRange *)a3;
- (unint64_t)columnOrRowCountForScrollingForPageIndex:(int64_t)a3;
- (unint64_t)contentVisibility;
- (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection;
- (unint64_t)currentPageType;
- (unint64_t)extraPageCountDuringScrolling;
- (unint64_t)iconListModelIndexForPageIndex:(int64_t)a3;
- (unint64_t)iconListViewCount;
- (unint64_t)iconListViewIndexForIconListModelIndex:(unint64_t)a3;
- (unint64_t)iconListViewIndexForPageIndex:(int64_t)a3;
- (unint64_t)iconPageCount;
- (unint64_t)indexOfIconListView:(id)a3;
- (unint64_t)leadingCustomPageCount;
- (unint64_t)leadingCustomPageIndexForPageIndex:(int64_t)a3;
- (unint64_t)pageCount;
- (unint64_t)totalLeadingCustomPageCount;
- (unint64_t)trailingCustomPageCount;
- (unint64_t)trailingCustomPageIndexForPageIndex:(int64_t)a3;
- (unint64_t)typeForPage:(int64_t)a3;
- (unint64_t)userInterfaceLayoutDirectionHandling;
- (unsigned)scrollingDirection;
- (unsigned)scrollingDirectionTracking:(BOOL)a3;
- (unsigned)userInterfaceLayoutDirectionAwareScrollingDirection;
- (void)_addIconListView:(id)a3;
- (void)_addIconListView:(id)a3 atEnd:(BOOL)a4;
- (void)_addIconListViewsForModels:(id)a3;
- (void)_addScrollingCompletionBlock:(id)a3;
- (void)_checkIfScrollStateChanged;
- (void)_configureIconListView:(id)a3;
- (void)_didAddIconListView:(id)a3;
- (void)_didRemoveIconListView:(id)a3;
- (void)_enumerateScrollableIconViewsUsingBlock:(id)a3;
- (void)_ignoreScrollingDidEndNotifications;
- (void)_layoutSubviews;
- (void)_markListViewsAsPurged;
- (void)_orientationDidChange:(int64_t)a3;
- (void)_precacheIconImages;
- (void)_removeDisableAutoScrollAssertion:(id)a3;
- (void)_removeIconListView:(id)a3;
- (void)_removeIconListView:(id)a3 purge:(BOOL)a4;
- (void)_resetIconListViews;
- (void)_scrollingInteractionScrollViewDidScroll:(id)a3;
- (void)_setCurrentPageIndex:(int64_t)a3;
- (void)_setCurrentPageIndex:(int64_t)a3 deferringPageControlUpdate:(BOOL)a4;
- (void)_setFolderName:(id)a3;
- (void)_setPageControlDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setParallaxDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setScrollViewContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)_setScrollingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_unignoreScrollingDidEndNotifications;
- (void)_updateEditingStateAnimated:(BOOL)a3;
- (void)_updateIconListContainment:(id)a3 atIndex:(unint64_t)a4;
- (void)_updateIconListFrames;
- (void)_updateIconListLegibilitySettings;
- (void)_updateIconListViews:(int64_t)a3;
- (void)_updateIconListViewsWithCurrentPageIndex:(int64_t)a3 currentPageUniqueIdentifier:(id)a4;
- (void)_updateIconListViewsWithCurrentPageUniqueIdentifier:(id)a3;
- (void)_updatePageControlCurrentPage;
- (void)_updatePageControlNumberOfPages;
- (void)_updatePageControlToIndex:(int64_t)a3;
- (void)_updatePageControlUserInterfaceStyle;
- (void)_updateParallaxSettings;
- (void)_updateScalingViewFrame;
- (void)_updateScrollingInteractionIsScrolling:(BOOL)a3;
- (void)_updateScrollingState:(BOOL)a3;
- (void)_updateTitleLegibilitySettings;
- (void)_willScrollToPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)addScrollViewIsScrollingOverrideReason:(id)a3;
- (void)cancelScrolling;
- (void)clearVisibleColumnRange;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)enumerateIconListViewsUsingBlock:(id)a3;
- (void)enumerateIconListViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateScrollViewPageViewsUsingBlock:(id)a3;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5;
- (void)folder:(id)a3 listHiddenWillChange:(id)a4;
- (void)folder:(id)a3 willRemoveLists:(id)a4 atIndexes:(id)a5;
- (void)folder:(id)a3 willRestoreOverflowIcon:(id)a4 toList:(id)a5;
- (void)folderDidChange;
- (void)folderDisplayNameDidChange:(id)a3;
- (void)folderWillChange:(id)a3;
- (void)getLeadingVisiblePageIndex:(int64_t *)a3 trailingVisiblePageIndex:(int64_t *)a4;
- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4;
- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4;
- (void)iconListView:(id)a3 performIconDrop:(id)a4;
- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4;
- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5;
- (void)iconListViewDidLayoutIcons:(id)a3;
- (void)layoutHidingCompoundAssertionDidInvalidate:(id)a3;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)layoutSubviews;
- (void)noteUserIsInteractingWithIcons;
- (void)pageControl:(id)a3 didMoveCurrentPageToPage:(int64_t)a4 withScrubbing:(BOOL)a5;
- (void)prefetchNextVisibleColumn;
- (void)prepareToOpen;
- (void)removeAssertion:(id)a3;
- (void)removeScrollViewIsScrollingOverrideReason:(id)a3;
- (void)resetContentOffsetToCurrentPageAnimated:(BOOL)a3;
- (void)returnScalingView;
- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)scrollingDisabledGestureDidUpdate:(id)a3;
- (void)setAddsFocusGuidesForWrapping:(BOOL)a3;
- (void)setAutomaticallyCreatesIconListViews:(BOOL)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setCurrentPageType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExtraPageCountDuringScrolling:(unint64_t)a3;
- (void)setFolder:(id)a3;
- (void)setFolderIconImageCache:(id)a3;
- (void)setHasEverBeenInAWindow:(BOOL)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIncludesHiddenIconListPages:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setNeedsLayout;
- (void)setOrientation:(int64_t)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlAlpha:(double)a3;
- (void)setPageControlHidden:(BOOL)a3;
- (void)setRegisteredForIdleUpdates:(BOOL)a3;
- (void)setRotating:(BOOL)a3;
- (void)setScrollingDisabledGestureRecognizer:(id)a3;
- (void)setScrollingUsingDecelerationAnimation:(BOOL)a3;
- (void)setSuppressesEditingStateForListViews:(BOOL)a3;
- (void)setSuppressesEditingStateForListViews:(BOOL)a3 animated:(BOOL)a4;
- (void)tearDownListViews;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)transitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)updateIconListIndexAndVisibility;
- (void)updateIconListIndexAndVisibility:(BOOL)a3;
- (void)updateIconListViews;
- (void)updateVisibleColumnRange;
- (void)updateVisibleColumnRangeWithTotalLists:(unint64_t)a3 iconVisibilityHandling:(int64_t)a4;
- (void)validateVisibleColumnRange;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBFolderView

- (NSArray)iconListViews
{
  v2 = (void *)[(NSMutableArray *)self->_iconListViews copy];
  return (NSArray *)v2;
}

- (SBVisibleColumnRange)visibleColumnRangeWithTotalLists:(SEL)a3 iconVisibilityHandling:(unint64_t)a4 predictedVisibleColumn:(int64_t)a5 includingAdditionalColumnsKeptVisible:(SBFolderPredictedVisibleColumn *)a6
{
  BOOL v7 = a7;
  [(SBFolderView *)self _pageWidthOrHeight];
  double v14 = v13;
  unint64_t v15 = [(SBFolderView *)self countOfAdditionalPagesToKeepVisibleInOneDirection];
  [(SBFolderView *)self additionalScrollWidthToKeepVisibleInOneDirection];
  double v17 = v16 + v14 * (double)v15;
  if (v7) {
    double v18 = v17;
  }
  else {
    double v18 = 0.0;
  }
  [(SBFolderView *)self scrollableWidthForVisibleColumnRange];
  double v20 = v19;
  [(SBFolderView *)self minimumVisibleScrollOffset];
  double v22 = v21 - v18;
  double v23 = nexttoward(v18 + v20 + v21, v21);
  int v24 = [(SBFolderView *)self isRTL];
  BOOL v25 = [(SBFolderView *)self isVertical];
  if (v24) {
    double v26 = v23;
  }
  else {
    double v26 = v22;
  }
  if (v24) {
    double v27 = v22;
  }
  else {
    double v27 = v23;
  }
  unint64_t v28 = [(SBFolderView *)self iconListViewCount];
  result = (SBVisibleColumnRange *)BSFloatIsZero();
  if (!a4 || (result & 1) != 0) {
    goto LABEL_15;
  }
  v30 = [(SBFolderView *)self window];
  if (v30)
  {

    goto LABEL_16;
  }
  result = (SBVisibleColumnRange *)[(SBFolderView *)self hasEverBeenInAWindow];
  if (result)
  {
LABEL_15:
    retstr->endIconListIndex = 0;
    retstr->endColumnIndex = 0;
    retstr->startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
    retstr->startColumnIndex = 0;
    return result;
  }
LABEL_16:
  BOOL v82 = v25;
  unint64_t v85 = v28;
  double v31 = v18 + v14 + v18;
  if (((a5 == 1) & [(SBFolderView *)self isScrollingUsingDecelerationAnimation]) != 0) {
    int64_t v32 = 0;
  }
  else {
    int64_t v32 = a5;
  }
  int64_t v33 = [(SBFolderView *)self _pageIndexForOffset:0 behavior:0 fractionOfDistanceThroughPage:v26];
  unint64_t v34 = [(SBFolderView *)self iconListViewIndexForPageIndex:v33];
  int64_t v35 = [(SBFolderView *)self _pageIndexForOffset:0 behavior:0 fractionOfDistanceThroughPage:v27];
  unint64_t v36 = [(SBFolderView *)self iconListViewIndexForPageIndex:v35];
  v84 = a6;
  if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v33 = [(SBFolderView *)self closestIconPageIndexForPageIndex:v33];
  }
  unint64_t v37 = [(SBFolderView *)self iconListViewIndexForPageIndex:v33];
  [(SBFolderView *)self _scrollRangeForContentAtPageIndex:v33 pageWidthOrHeight:v14];
  double v39 = v38;
  double v41 = SBHIntersectionFloatRange(v38, v40, v22, v18 + v14 + v18);
  double v43 = v42;
  if (BSFloatIsZero()) {
    BOOL v44 = v37 + 1 >= v85;
  }
  else {
    BOOL v44 = 1;
  }
  if (!v44)
  {
    [(SBFolderView *)self _scrollRangeForContentAtPageIndex:v33 + 1 pageWidthOrHeight:v14];
    double v39 = v45;
    double v41 = SBHIntersectionFloatRange(v45, v46, v22, v31);
    double v43 = v47;
    ++v37;
  }
  if (v37 == 0x7FFFFFFFFFFFFFFFLL || v37 >= a4)
  {
    v49 = 0;
    double v88 = 0.0;
    uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_42;
  }
  uint64_t v51 = [(SBFolderView *)self iconListViewAtIndex:v37];
  v49 = (void *)v51;
  double v88 = 0.0;
  uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
  if (v51 && v43 > 0.0)
  {
    if (v32 == 2)
    {
      unint64_t v37 = 0;
    }
    else if (v32 == 1)
    {
      double v52 = SBHRTLAwarePositionInFloatRange(0, v24, v41, v43);
      if (v82) {
        uint64_t v53 = objc_msgSend(v49, "rowAtPoint:fractionOfDistanceThroughRow:", &v88, 0.0, v52 - v39);
      }
      else {
        uint64_t v53 = objc_msgSend(v49, "columnAtPoint:fractionOfDistanceThroughColumn:", &v88, v52 - v39, 0.0);
      }
      uint64_t v50 = v53;
      goto LABEL_42;
    }
    uint64_t v50 = 0;
  }
LABEL_42:
  if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v35 = [(SBFolderView *)self closestIconPageIndexForPageIndex:v35];
  }
  [(SBFolderView *)self _scrollRangeForContentAtPageIndex:v35 pageWidthOrHeight:v14];
  double v55 = v54;
  double v57 = SBHIntersectionFloatRange(v54, v56, v22, v31);
  double v59 = v58;
  unint64_t v60 = [(SBFolderView *)self iconListViewIndexForPageIndex:v35];
  double v87 = 0.0;
  v83 = v49;
  if (v60 >= a4 || v59 <= 0.0)
  {
    v64 = [(SBFolderView *)self folder];
    v62 = v64;
    if (v60 == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v65 = [v64 precedingVisibleListIndexBeforeIndex:v60], v65 == 0x7FFFFFFFFFFFFFFFLL)
      || (unint64_t v66 = v65,
          [(SBFolderView *)self iconListViewForIconListModelIndex:v65],
          (v67 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      unint64_t v70 = 0;
      unint64_t v71 = 0;
    }
    else
    {
      v68 = v67;
      if (v82) {
        uint64_t v69 = [v67 iconRowsForCurrentOrientation];
      }
      else {
        uint64_t v69 = [v67 iconColumnsForCurrentOrientation];
      }
      unint64_t v71 = v69;
      unint64_t v70 = v69 - 1;

      unint64_t v60 = v66;
    }
  }
  else
  {
    v61 = [(SBFolderView *)self iconListViewAtIndex:v60];
    v62 = v61;
    if (v82) {
      uint64_t v63 = [v61 iconRowsForCurrentOrientation];
    }
    else {
      uint64_t v63 = [v61 iconColumnsForCurrentOrientation];
    }
    unint64_t v71 = v63;
    if (!v32 || v32 == 2)
    {
      unint64_t v70 = v63 - 1;
    }
    else if (v32 == 1)
    {
      double v72 = SBHRTLAwarePositionInFloatRange(2, v24, v57, v59);
      if (v82) {
        uint64_t v73 = objc_msgSend(v62, "rowAtPoint:fractionOfDistanceThroughRow:", &v87, 0.0, v72 - v55);
      }
      else {
        uint64_t v73 = objc_msgSend(v62, "columnAtPoint:fractionOfDistanceThroughColumn:", &v87, v72 - v55, 0.0);
      }
      unint64_t v70 = v73;
    }
    else
    {
      unint64_t v70 = 0;
    }
  }

  if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v74 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v74 = v37;
  }
  if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v75 = 0;
  }
  else {
    unint64_t v75 = v50;
  }
  retstr->startIconListIndex = v74;
  retstr->startColumnIndex = v75;
  retstr->endIconListIndex = v60;
  retstr->endColumnIndex = v70;
  if (!v84) {
    goto LABEL_95;
  }
  BOOL v76 = [(SBFolderView *)self isScrolling];
  if (v74 == 0x7FFFFFFFFFFFFFFFLL || !v76 || v85 == 0) {
    goto LABEL_81;
  }
  long long v79 = *(_OWORD *)&retstr->endIconListIndex;
  v86[0] = *(_OWORD *)&retstr->startIconListIndex;
  v86[1] = v79;
  if (SBVisibleColumnRangeIsEmpty((unint64_t *)v86)) {
    goto LABEL_81;
  }
  if ([(SBFolderView *)self userInterfaceLayoutDirectionAwareScrollingDirection])
  {
    if (v70 + 1 >= v71)
    {
      if (v60 + 1 >= v85)
      {
        v84->var0 = v60 + 1;
        v84->var1.column = 0;
      }
      else
      {
        v84->var0 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v84->var0 = v60;
      v84->var1.column = v70 + 1;
    }
    double v80 = v87;
LABEL_94:
    v84->var1.confidence = v80;
    goto LABEL_95;
  }
  if (v74 | v75)
  {
    if (v75)
    {
      v84->var0 = v74;
      v84->var1.column = v75 - 1;
    }
    else
    {
      v84->var0 = v74 - 1;
      v81 = -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:");
      v84->var1.column = [v81 iconColumnsForCurrentOrientation] - 1;
    }
    double v80 = 1.0 - v88;
    goto LABEL_94;
  }
LABEL_81:
  v84->var0 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_95:

  return result;
}

- (unint64_t)iconListViewIndexForPageIndex:(int64_t)a3
{
  int64_t v5 = [(SBFolderView *)self firstIconPageIndex];
  if ((int64_t)([(SBFolderView *)self iconListViewCount] + v5) <= a3 || a3 < v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 - v5;
  }
}

+ (int64_t)_pageIndexForOffset:(double)a3 minimumPage:(int64_t)a4 maximumPage:(int64_t)a5 pageCount:(unint64_t)a6 pageWidth:(double)a7 pageSpacing:(double)a8 userInterfaceLayoutDirection:(int64_t)a9 behavior:(int64_t)a10 fractionOfDistanceThroughPage:(double *)a11
{
  uint64_t v13 = [(id)objc_opt_class() _pageOffsetForOffset:a10 behavior:a6 pageWidth:a9 pageSpacing:a11 pageCount:a3 userInterfaceLayoutDirection:a7 fractionOfDistanceThroughPage:a8];
  int64_t v14 = v13 + a4;
  if (a4 > v13 + a4) {
    int64_t v14 = a4;
  }
  if (a5 >= v14) {
    return v14;
  }
  else {
    return a5;
  }
}

+ (unint64_t)_pageOffsetForOffset:(double)a3 behavior:(int64_t)a4 pageWidth:(double)a5 pageSpacing:(double)a6 pageCount:(unint64_t)a7 userInterfaceLayoutDirection:(int64_t)a8 fractionOfDistanceThroughPage:(double *)a9
{
  if (fabs(a5) < 2.22044605e-16)
  {
    unint64_t result = 0;
    if (a9) {
      *a9 = 0.0;
    }
    return result;
  }
  double __y = 0.0;
  double v17 = (double)a7 * a5;
  if (a6 <= 0.0)
  {
    double v18 = a3 / a5;
    double v22 = modf(a3 / a5, &__y);
  }
  else
  {
    double v18 = a3 / (a5 + a6);
    modf(v18, &__y);
    double v19 = fmod(a3, a5 + a6);
    double v20 = v19 / a5;
    BOOL v21 = v19 < a5;
    double v22 = 1.0;
    if (v21) {
      double v22 = v20;
    }
    if (a7 > 1) {
      double v17 = v17 + (double)(a7 - 1) * a6;
    }
  }
  double v23 = 0.0;
  if (v18 >= 0.0)
  {
    double v23 = v22;
    if (v18 > v17) {
      double v23 = 0.0;
    }
  }
  BOOL v24 = v23 >= 1.0 || v23 <= 0.0;
  double v25 = 1.0 - v23;
  if (v24) {
    double v25 = v23;
  }
  if (a8 == 1)
  {
    unint64_t result = ~(uint64_t)__y + a7;
  }
  else
  {
    double v25 = v23;
    unint64_t result = (uint64_t)__y;
  }
  if (a4 != 1) {
    goto LABEL_26;
  }
  if (v25 < 0.01)
  {
    double v25 = 0.0;
LABEL_26:
    if (!a9) {
      return result;
    }
    goto LABEL_27;
  }
  if (v25 > 0.99)
  {
    double v25 = 0.0;
    ++result;
  }
  if (a9) {
LABEL_27:
  }
    *a9 = v25;
  return result;
}

- (id)iconListViewAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_iconListViews objectAtIndex:a3];
}

- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageWidthOrHeight:(double)a4
{
  if ([(SBFolderView *)self isVertical])
  {
    [(SBFolderView *)self _scrollRangeForContentAtPageIndex:a3 pageHeight:a4];
  }
  else
  {
    [(SBFolderView *)self _scrollRangeForContentAtPageIndex:a3 pageWidth:a4];
  }
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageWidth:(double)a4
{
  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:");
  double v8 = v7;
  [(SBFolderView *)self _scrollOffsetForContentAtPageIndex:a3];
  double v10 = a4 - (v9 - v8);
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (int64_t)_pageIndexForOffset:(double)a3 behavior:(int64_t)a4 fractionOfDistanceThroughPage:(double *)a5
{
  double v9 = objc_opt_class();
  int64_t v10 = [(SBFolderView *)self minimumPageIndex];
  int64_t v11 = [(SBFolderView *)self maximumPageIndex];
  unint64_t v12 = [(SBFolderView *)self pageCount];
  [(SBFolderView *)self _pageWidthOrHeight];
  double v14 = v13;
  [(SBFolderView *)self _pageSpacing];
  double v16 = v15;
  int64_t v17 = [(SBFolderView *)self userInterfaceLayoutDirection];
  return [v9 _pageIndexForOffset:v10 minimumPage:v11 maximumPage:v12 pageCount:v17 pageWidth:a4 pageSpacing:a5 userInterfaceLayoutDirection:a3 behavior:v14 fractionOfDistanceThroughPage:v16];
}

- (int64_t)firstIconPageIndex
{
  int64_t v3 = [(SBFolderView *)self minimumPageIndex];
  return [(SBFolderView *)self leadingCustomPageCount] + v3;
}

- (int64_t)maximumPageIndex
{
  unint64_t v3 = [(SBFolderView *)self pageCount];
  int64_t v4 = [(SBFolderView *)self minimumPageIndex];
  unint64_t v5 = v3 - 1;
  if (!v3) {
    unint64_t v5 = 0;
  }
  return v4 + v5;
}

- (int64_t)minimumPageIndex
{
  return 100;
}

- (unint64_t)pageCount
{
  unint64_t v3 = [(SBFolderView *)self leadingCustomPageCount];
  unint64_t v4 = [(SBFolderView *)self iconPageCount] + v3;
  return v4 + [(SBFolderView *)self trailingCustomPageCount];
}

- (unint64_t)iconPageCount
{
  BOOL v3 = [(SBFolderView *)self includesHiddenIconListPages];
  folder = self->_folder;
  if (v3)
  {
    return [(SBFolder *)folder listCount];
  }
  else
  {
    return [(SBFolder *)folder visibleListCount];
  }
}

- (BOOL)includesHiddenIconListPages
{
  return self->_includesHiddenIconListPages;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageWidth:(double)a4
{
  int64_t v6 = a3 - [(SBFolderView *)self minimumPageIndex];
  [(SBFolderView *)self _pageSpacing];
  double v8 = v7;
  if ([(SBFolderView *)self isRTL])
  {
    [(SBIconScrollView *)self->_scrollView contentSize];
    double v10 = v9 - (double)(v6 + 1) * a4 - (double)v6 * v8;
  }
  else
  {
    double v10 = (double)v6 * a4;
    if (v6 >= 1 && v8 > 0.0) {
      double v10 = v10 + (double)(v6 - 1) * v8;
    }
  }
  double v11 = 0.0;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)_pageSpacing
{
  return 0.0;
}

- (unint64_t)iconListViewCount
{
  return [(NSMutableArray *)self->_iconListViews count];
}

- (double)_pageWidthOrHeight
{
  if ([(SBFolderView *)self isVertical])
  {
    [(SBFolderView *)self _pageHeight];
  }
  else
  {
    [(SBFolderView *)self _pageWidth];
  }
  return result;
}

- (BOOL)isRTL
{
  return [(SBFolderView *)self userInterfaceLayoutDirection] == 1;
}

- (double)_pageWidth
{
  [(SBIconScrollView *)self->_scrollView _interpageSpacing];
  [(SBIconScrollView *)self->_scrollView bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  if ([(SBFolderView *)self isVertical])
  {
    uint64_t v11 = v4;
    uint64_t v12 = v6;
    uint64_t v13 = v8;
    uint64_t v14 = v10;
    return CGRectGetWidth(*(CGRect *)&v11);
  }
  else
  {
    UISizeRoundToViewScale();
  }
  return result;
}

- (int64_t)userInterfaceLayoutDirection
{
  if ([(SBFolderView *)self isVertical]) {
    return 0;
  }
  unint64_t v3 = [(SBFolderView *)self userInterfaceLayoutDirectionHandling];
  if (v3 == 2) {
    return 1;
  }
  if (v3) {
    return 0;
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4FB2608];
  return [v4 userInterfaceLayoutDirection];
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  return self->_userInterfaceLayoutDirectionHandling;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3
{
  if ([(SBFolderView *)self isVertical])
  {
    [(SBFolderView *)self _pageHeight];
    -[SBFolderView _scrollOffsetForPageAtIndex:pageHeight:](self, "_scrollOffsetForPageAtIndex:pageHeight:", a3);
  }
  else
  {
    [(SBFolderView *)self _pageWidth];
    -[SBFolderView _scrollOffsetForPageAtIndex:pageWidth:](self, "_scrollOffsetForPageAtIndex:pageWidth:", a3);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_scrollOffsetForContentAtPageIndex:(int64_t)a3
{
  if ([(SBFolderView *)self isVertical])
  {
    [(SBFolderView *)self _pageHeight];
    -[SBFolderView _scrollOffsetForPageAtIndex:pageHeight:](self, "_scrollOffsetForPageAtIndex:pageHeight:", a3);
  }
  else
  {
    [(SBFolderView *)self _pageWidth];
    -[SBFolderView _scrollOffsetForPageAtIndex:pageWidth:](self, "_scrollOffsetForPageAtIndex:pageWidth:", a3);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)minimumVisibleScrollOffset
{
  [(SBIconScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  if ([(SBFolderView *)self isVertical]) {
    return v6;
  }
  else {
    return v4;
  }
}

- (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  v2 = objc_opt_class();
  return [v2 countOfAdditionalPagesToKeepVisibleInOneDirection];
}

+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  return 0;
}

- (BOOL)isScrollingUsingDecelerationAnimation
{
  return self->_scrollingUsingDecelerationAnimation;
}

- (double)additionalScrollWidthToKeepVisibleInOneDirection
{
  return 0.0;
}

- (SBVisibleColumnRange)visibleColumnRangeExcludingAdditionalWidthKeptVisible
{
  uint64_t v4 = [(NSMutableArray *)self->_iconListViews count];
  int64_t v5 = [(SBFolderView *)self iconVisibilityHandling];
  return [(SBFolderView *)self visibleColumnRangeWithTotalLists:v4 iconVisibilityHandling:v5 predictedVisibleColumn:0 includingAdditionalColumnsKeptVisible:0];
}

- (int64_t)iconVisibilityHandling
{
  return 1;
}

- (BOOL)hasEverBeenInAWindow
{
  return self->_hasEverBeenInAWindow;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)enumerateIconListViewsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v5 = [(SBFolderView *)self allIconListViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __37__SBFolderView_setContentVisibility___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentVisibility:*(void *)(a1 + 32)];
}

- (id)allIconListViews
{
  iconListViews = self->_iconListViews;
  double v3 = [(SBFolderView *)self additionalIconListViews];
  uint64_t v4 = [(NSMutableArray *)iconListViews arrayByAddingObjectsFromArray:v3];

  return v4;
}

uint64_t __38__SBFolderView__updateScrollingState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisiblySettled:0];
}

- (id)additionalIconListViews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

uint64_t __47__SBFolderView_setOverrideIconImageAppearance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOverrideIconImageAppearance:*(void *)(a1 + 32)];
}

- (void)_updateTitleLegibilitySettings
{
  id v6 = [(SBFolderView *)self legibilitySettings];
  if (UIAccessibilityIsReduceTransparencyEnabled() && [v6 style] == 2)
  {
    titleTextField = self->_titleTextField;
    uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
    int64_t v5 = [(SBFolderView *)self _legibilitySettingsWithPrimaryColor:v4];
    [(SBFolderTitleTextField *)titleTextField setLegibilitySettings:v5];
  }
  else
  {
    [(SBFolderTitleTextField *)self->_titleTextField setLegibilitySettings:v6];
  }
}

- (void)_updateIconListLegibilitySettings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = [(SBFolderView *)self legibilitySettingsForIconListViews];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_iconListViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setLegibilitySettings:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(SBIconListPageControl *)self->_pageControl setLegibilitySettings:v3];
}

- (SBIconListModel)currentIconListModel
{
  unint64_t v3 = [(SBFolderView *)self iconListModelIndexForPageIndex:[(SBFolderView *)self currentPageIndex]];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    unint64_t v5 = v3;
    uint64_t v6 = [(SBFolderView *)self folder];
    uint64_t v4 = [v6 listAtIndex:v5];
  }
  return (SBIconListModel *)v4;
}

- (unint64_t)iconListModelIndexForPageIndex:(int64_t)a3
{
  if (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:")) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(SBFolderView *)self isPageTypeIcon:a3]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v5 = [(SBFolderView *)self firstIconPageIndex];
  BOOL v6 = a3 < v5;
  unint64_t v7 = a3 - v5;
  if (v6 || ![(SBFolderView *)self hasIconPages]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(SBFolderView *)self includesHiddenIconListPages])
  {
    uint64_t v8 = [(SBFolderView *)self folder];
    unint64_t v7 = [v8 indexForVisibleIndex:v7];
  }
  return v7;
}

- (BOOL)isPageTypeIcon:(int64_t)a3
{
  return [(SBFolderView *)self typeForPage:a3] == 1;
}

- (BOOL)hasIconPages
{
  BOOL v3 = [(SBFolderView *)self includesHiddenIconListPages];
  folder = self->_folder;
  if (v3) {
    return [(SBFolder *)folder listCount] != 0;
  }
  return [(SBFolder *)folder hasVisibleLists];
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(void))a5;
  if (![(SBFolderView *)self _isValidPageIndex:a3]
    || ![(SBFolderView *)self canChangeCurrentPageIndexToIndex:a3])
  {
    if (!v8)
    {
LABEL_15:
      BOOL v23 = 0;
      goto LABEL_16;
    }
LABEL_14:
    v8[2](v8);
    goto LABEL_15;
  }
  [(SBFolderView *)self _scrollOffsetForPageAtIndex:a3];
  double v10 = v9;
  double v12 = v11;
  [(SBIconScrollView *)self->_scrollView contentOffset];
  if (v10 == v14 && v12 == v13)
  {
    [(SBFolderView *)self _setCurrentPageIndex:a3];
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ([(SBFolderView *)self isRotating])
  {
    double v16 = SBLogIcon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v34 = a3;
      __int16 v35 = 1024;
      BOOL v36 = v5;
      _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Delaying request to change to page %li because we are rotating (animated: %{BOOL}u)", buf, 0x12u);
    }

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    double v27 = __56__SBFolderView_setCurrentPageIndex_animated_completion___block_invoke;
    unint64_t v28 = &unk_1E6AB5988;
    v29 = self;
    int64_t v31 = a3;
    BOOL v32 = v5;
    v30 = v8;
    uint64_t v17 = _Block_copy(&v25);
    rotationCompletionBlocks = self->_rotationCompletionBlocks;
    if (!rotationCompletionBlocks)
    {
      double v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v20 = self->_rotationCompletionBlocks;
      self->_rotationCompletionBlocks = v19;

      rotationCompletionBlocks = self->_rotationCompletionBlocks;
    }
    BOOL v21 = objc_msgSend(v17, "copy", v25, v26, v27, v28, v29);
    double v22 = _Block_copy(v21);
    [(NSMutableArray *)rotationCompletionBlocks addObject:v22];
  }
  else
  {
    [(SBFolderView *)self _willScrollToPageIndex:a3 animated:v5];
    if (v8) {
      [(SBFolderView *)self _addScrollingCompletionBlock:v8];
    }
    -[SBFolderView _setScrollViewContentOffset:animated:](self, "_setScrollViewContentOffset:animated:", v5, v10, v12);
    if (!v5) {
      [(SBFolderView *)self layoutIconListsWithAnimationType:-1 forceRelayout:0];
    }
  }
  BOOL v23 = 1;
LABEL_16:

  return v23;
}

- (BOOL)canChangeCurrentPageIndexToIndex:(unint64_t)a3
{
  BOOL v5 = [(SBFolderView *)self delegate];
  BOOL v6 = v5;
  if (v5) {
    char v7 = [v5 folderView:self canChangeCurrentPageIndexToIndex:a3];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)iconListViewForPageIndex:(int64_t)a3
{
  unint64_t v4 = [(SBFolderView *)self iconListViewIndexForPageIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(SBFolderView *)self iconListViewAtIndex:v4];
  }
  return v5;
}

- (void)_setCurrentPageIndex:(int64_t)a3 deferringPageControlUpdate:(BOOL)a4
{
  if (-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:") && self->_currentPageIndex != a3)
  {
    id v8 = [(SBFolderView *)self delegate];
    [v8 folderView:self currentPageIndexWillChange:a3];
    int64_t currentPageIndex = self->_currentPageIndex;
    self->_int64_t currentPageIndex = a3;
    if (!a4) {
      [(SBFolderView *)self _updatePageControlToIndex:a3];
    }
    [(SBFolderView *)self setCurrentPageType:[(SBFolderView *)self typeForPage:a3]];
    [(SBFolderView *)self _currentPageIndexDidChange];
    [(SBFolderView *)self _currentPageIndexDidChangeFromPageIndex:currentPageIndex];
    [v8 folderView:self currentPageIndexDidChange:self->_currentPageIndex];
  }
}

- (BOOL)_isValidPageIndex:(int64_t)a3
{
  return [(SBFolderView *)self minimumPageIndex] <= a3
      && [(SBFolderView *)self maximumPageIndex] >= a3;
}

- (void)getLeadingVisiblePageIndex:(int64_t *)a3 trailingVisiblePageIndex:(int64_t *)a4
{
  [(SBFolderView *)self minimumVisibleScrollOffset];
  double v8 = v7;
  [(SBFolderView *)self maximumVisibleScrollOffset];
  double v10 = v9;
  BOOL v11 = [(SBFolderView *)self isRTL];
  if (v11) {
    double v12 = v10;
  }
  else {
    double v12 = v8;
  }
  if (v11) {
    double v13 = v8;
  }
  else {
    double v13 = v10;
  }
  if (v8 == v10)
  {
    int64_t v14 = [(SBFolderView *)self defaultPageIndex];
    if (a3) {
      *a3 = v14;
    }
    if (!a4) {
      return;
    }
LABEL_16:
    *a4 = v14;
    return;
  }
  BOOL v15 = v11;
  if (a3) {
    *a3 = [(SBFolderView *)self _pageIndexForOffset:!v11 behavior:0 fractionOfDistanceThroughPage:v12];
  }
  if (a4)
  {
    int64_t v14 = [(SBFolderView *)self _pageIndexForOffset:v15 behavior:0 fractionOfDistanceThroughPage:v13];
    goto LABEL_16;
  }
}

- (double)maximumVisibleScrollOffset
{
  [(SBFolderView *)self minimumVisibleScrollOffset];
  long double v4 = v3;
  [(SBFolderView *)self scrollableWidthForVisibleColumnRange];
  double v6 = v4 + v5;
  return nexttoward(v6, v4);
}

- (double)scrollableWidthForVisibleColumnRange
{
  [(SBIconScrollView *)self->_scrollView frame];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  BOOL v11 = [(SBFolderView *)self isVertical];
  uint64_t v12 = v4;
  uint64_t v13 = v6;
  uint64_t v14 = v8;
  uint64_t v15 = v10;
  if (v11)
  {
    return CGRectGetHeight(*(CGRect *)&v12);
  }
  else
  {
    return CGRectGetWidth(*(CGRect *)&v12);
  }
}

- (void)_setCurrentPageIndex:(int64_t)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (SBIconListPageControl)pageControl
{
  return self->_pageControl;
}

- (NSString)iconLocation
{
  uint64_t v3 = [(SBFolderView *)self delegate];
  uint64_t v4 = v3;
  if (!v3
    || ([v3 iconLocationForFolderView:self], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(SBFolderView *)self currentIconListView];
    uint64_t v5 = [v6 iconLocation];

    if (!v5)
    {
      uint64_t v5 = [(id)objc_opt_class() defaultIconLocation];
    }
  }

  return (NSString *)v5;
}

- (SBFolderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFolderViewDelegate *)WeakRetained;
}

- (void)setCurrentPageType:(unint64_t)a3
{
  self->_currentPageType = a3;
}

- (double)headerHeight
{
  double headerHeight = self->_headerHeight;
  if (headerHeight == *MEMORY[0x1E4FB30D8])
  {
    uint64_t v4 = [(SBFolderView *)self headerView];
    if (v4)
    {
      [(SBFolderView *)self bounds];
      objc_msgSend(v4, "sizeThatFits:", v5, v6);
    }
    else
    {
      double v7 = 0.0;
    }
    self->_double headerHeight = v7;
  }
  return headerHeight;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  v2 = [(SBFolderView *)self folder];
  uint64_t v3 = [v2 effectiveGridSizeClassDomain];

  return (SBHIconGridSizeClassDomain *)v3;
}

- (void)_addScrollingCompletionBlock:(id)a3
{
  id v4 = a3;
  scrollCompletionBlocks = self->_scrollCompletionBlocks;
  id v10 = v4;
  if (!scrollCompletionBlocks)
  {
    double v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v7 = self->_scrollCompletionBlocks;
    self->_scrollCompletionBlocks = v6;

    id v4 = v10;
    scrollCompletionBlocks = self->_scrollCompletionBlocks;
  }
  uint64_t v8 = (void *)[v4 copy];
  uint64_t v9 = _Block_copy(v8);
  [(NSMutableArray *)scrollCompletionBlocks addObject:v9];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBFolderView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)_interactionTintColor
{
  return 0;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(SBFolderView *)self updateIconListIndexAndVisibility:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v7 = [(SBFolderView *)self iconListViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (v4) {
          [*(id *)(*((void *)&v13 + 1) + 8 * v11) setIconsNeedLayout];
        }
        [v12 layoutIconsIfNeededWithAnimationType:a3 options:0];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

void __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = v5;
  if (*(unsigned char *)(a1 + 88)) {
    [v5 iconRowsForCurrentOrientation];
  }
  else {
    [v5 iconColumnsForCurrentOrientation];
  }
  long long v7 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&buf[16] = v7;
  uint64_t VisibleColumnsForIconListIndex = SBVisibleColumnRangeGetVisibleColumnsForIconListIndex((unint64_t *)buf, a3);
  uint64_t v10 = v9;
  uint64_t v11 = [v6 layer];
  [v11 setNeedsLayoutOnGeometryChange:0];

  uint64_t v12 = [v6 visibleColumnRange];
  uint64_t v14 = v13;
  uint64_t v16 = [v6 visibleRowRange];
  uint64_t v17 = v15;
  if (VisibleColumnsForIconListIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = SBLogIcon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_1(a3, v18);
    }

    [v6 hideAllIcons];
  }
  else if (v10 == -1)
  {
    double v22 = SBLogIcon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_2(a3, v22);
    }

    [v6 showAllIcons];
  }
  else
  {
    uint64_t v28 = v15;
    int v19 = *(unsigned __int8 *)(a1 + 88);
    double v20 = SBLogIcon();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = a3;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = VisibleColumnsForIconListIndex;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v10;
        _os_log_debug_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEBUG, "Telling page at index %lu to show icons in range {%lu,%lu} (vertical)", buf, 0x20u);
      }

      objc_msgSend(v6, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", 0, -1, 0x7FFFFFFFFFFFFFFFLL, 0, VisibleColumnsForIconListIndex, v10, 0x7FFFFFFFFFFFFFFFLL, 0);
      uint64_t v17 = v28;
    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = a3;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = VisibleColumnsForIconListIndex;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v10;
        _os_log_debug_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEBUG, "Telling page at index %lu to show icons in range {%lu,%lu}", buf, 0x20u);
      }

      uint64_t v17 = v28;
      if (*(unsigned char *)(a1 + 89) && *(void *)(a1 + 64) == a3)
      {
        uint64_t v23 = *(void *)(a1 + 72);
        uint64_t v24 = *(void *)(a1 + 80);
      }
      else
      {
        uint64_t v24 = 0;
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      objc_msgSend(v6, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", VisibleColumnsForIconListIndex, v10, v23, v24, 0, -1, 0x7FFFFFFFFFFFFFFFLL, 0);
    }
  }
  if (v12 != [v6 visibleColumnRange]
    || v14 != v25
    || v16 != [v6 visibleRowRange]
    || v17 != v26)
  {
    [v6 layoutIconsIfNeeded];
  }
  double v27 = [v6 layer];
  [v27 setNeedsLayoutOnGeometryChange:1];
}

- (void)layoutSubviews
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBLogWidgets();
  if (os_signpost_enabled(v3))
  {
    BOOL v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    long long v7 = [v4 stringWithFormat:@"<%@: %p>", v6, self];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_FOLDER_VIEW", "iconListView=%{public}@", buf, 0xCu);
  }
  int64_t v8 = [(SBFolderView *)self currentPageIndex];
  BOOL v9 = [(SBFolderView *)self isScrolling];
  [(SBFolderView *)self _updateScalingViewFrame];
  if (![(SBFolderView *)self iconListViewCount]
    && [(SBFolder *)self->_folder hasVisibleLists]
    && [(SBFolderView *)self automaticallyCreatesIconListViews])
  {
    [(SBFolderView *)self resetIconListViews];
  }
  [(SBFolderView *)self _layoutSubviews];
  char v10 = self->_isScalingViewBorrowed || v9;
  if ((v10 & 1) == 0 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(SBFolderView *)self currentPageIndex] == v8) {
      [(SBFolderView *)self resetContentOffsetToCurrentPageAnimated:0];
    }
    else {
      [(SBFolderView *)self setCurrentPageIndex:v8 animated:0];
    }
  }
  [(SBFolderView *)self _updateIconListFrames];
  [(SBFolderView *)self updateVisibleColumnRange];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = self->_iconListViews;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) layoutIconsIfNeeded];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v13);
  }

  long long v16 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  *(_OWORD *)buf = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  long long v23 = v16;
  if (SBVisibleColumnRangeIsEmpty((unint64_t *)buf)) {
    [(SBFolderView *)self updateVisibleColumnRange];
  }
  [(SBFolderView *)self _updatePageControlNumberOfPages];
  [(SBIconListPageControl *)self->_pageControl layoutIfNeeded];
  uint64_t v17 = SBLogWidgets();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_FOLDER_VIEW", " isAnimation=YES ", buf, 2u);
  }
}

- (void)_updatePageControlToIndex:(int64_t)a3
{
  int64_t v5 = [(SBFolderView *)self minimumPageIndex];
  int64_t v6 = [(SBFolderView *)self _adjustPageIndexForPageControl:a3 - v5];
  int64_t v7 = [(UIPageControl *)self->_pageControl currentPage];
  if (v6 != v7)
  {
    int64_t v8 = v7;
    BOOL v9 = self->_scrollView;
    if (![(SBIconScrollView *)v9 isScrollAnimating]
      || ([(SBIconScrollView *)v9 isTracking] & 1) != 0
      || v8 != [(SBFolderView *)self _adjustPageIndexForPageControl:[(SBFolderView *)self scrollAnimationTargetPageIndex] - v5])
    {
      [(UIPageControl *)self->_pageControl setCurrentPage:v6];
    }
  }
}

- (int64_t)_adjustPageIndexForPageControl:(int64_t)a3
{
  return a3;
}

- (void)updateVisibleColumnRange
{
  if (![(SBFolderView *)self isRotating])
  {
    uint64_t v3 = [(NSMutableArray *)self->_iconListViews count];
    int64_t v4 = [(SBFolderView *)self iconVisibilityHandling];
    [(SBFolderView *)self updateVisibleColumnRangeWithTotalLists:v3 iconVisibilityHandling:v4];
  }
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)resetContentOffsetToCurrentPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(SBFolderView *)self currentPageIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = v5;
    [(SBFolderView *)self _scrollOffsetForPageAtIndex:v5];
    double v8 = v7;
    double v10 = v9;
    [(SBIconScrollView *)self->_scrollView contentOffset];
    if (!BSFloatApproximatelyEqualToFloat() || (BSFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      uint64_t v11 = SBLogIcon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543874;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2048;
        int64_t v16 = v6;
        __int16 v17 = 1024;
        BOOL v18 = v3;
        id v12 = v14;
        _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ initiating programmatic scroll to page: %li animated: %{BOOL}u", (uint8_t *)&v13, 0x1Cu);
      }
      -[SBIconScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, v8, v10);
    }
  }
}

- (void)_updatePageControlCurrentPage
{
  int64_t v3 = [(SBFolderView *)self currentPageIndex];
  [(SBFolderView *)self _updatePageControlToIndex:v3];
}

- (void)_updateIconListFrames
{
  [(SBFolderView *)self _scrollViewContentSize];
  double v4 = v3;
  double v6 = v5;
  [(SBIconScrollView *)self->_scrollView contentSize];
  if (v4 != v8 || v6 != v7) {
    -[SBIconScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v6);
  }
  [(SBFolderView *)self _pageWidth];
  uint64_t v11 = v10;
  [(SBFolderView *)self _pageHeight];
  uint64_t v13 = v12;
  [(SBFolderView *)self _pageSpacing];
  uint64_t v15 = v14;
  BOOL v16 = [(SBFolderView *)self isRTL];
  BOOL v17 = [(SBFolderView *)self isVertical];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x4010000000;
  v26[3] = &unk_1D821E08B;
  long long v27 = 0u;
  long long v28 = 0u;
  [(SBFolderView *)self _frameForIconListAtIndex:0];
  *(void *)&long long v27 = v18;
  *((void *)&v27 + 1) = v19;
  *(void *)&long long v28 = v20;
  *((void *)&v28 + 1) = v21;
  iconListViews = self->_iconListViews;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __37__SBFolderView__updateIconListFrames__block_invoke;
  v23[3] = &unk_1E6AB5A48;
  v23[4] = self;
  v23[5] = v26;
  BOOL v24 = v17;
  BOOL v25 = v16;
  v23[6] = v11;
  v23[7] = v15;
  v23[8] = v13;
  [(NSMutableArray *)iconListViews enumerateObjectsUsingBlock:v23];
  _Block_object_dispose(v26, 8);
}

- (CGSize)_scrollViewContentSize
{
  unint64_t v3 = [(SBFolderView *)self pageCount];
  unint64_t v4 = [(SBFolderView *)self extraPageCountDuringScrolling] + v3;
  [(SBFolderView *)self _pageSpacing];
  double v6 = v5;
  [(SBIconScrollView *)self->_scrollView bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  BOOL v15 = [(SBFolderView *)self isVertical];
  double v16 = (double)v4;
  unint64_t v17 = v4 - 1;
  BOOL v18 = v6 > 0.0 && v4 != 0;
  double v19 = (double)v17;
  if (v15)
  {
    [(SBFolderView *)self _pageHeight];
    double v21 = v20 * v16;
    if (v18) {
      double Height = v21 + v19 * v6;
    }
    else {
      double Height = v21;
    }
    v29.origin.x = v8;
    v29.origin.y = v10;
    v29.size.width = v12;
    v29.size.height = v14;
    double Width = CGRectGetWidth(v29);
  }
  else
  {
    [(SBFolderView *)self _pageWidth];
    double v25 = v24 * v16;
    if (v18) {
      double Width = v25 + v19 * v6;
    }
    else {
      double Width = v25;
    }
    v30.origin.x = v8;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    double Height = CGRectGetHeight(v30);
  }
  double v26 = Width;
  double v27 = Height;
  result.height = v27;
  result.width = v26;
  return result;
}

- (unint64_t)extraPageCountDuringScrolling
{
  return self->_extraPageCountDuringScrolling;
}

- (CGRect)_frameForIconListAtIndex:(unint64_t)a3
{
  [(SBFolderView *)self _iconListViewSize];
  double v6 = v5;
  double v8 = v7;
  [(SBFolderView *)self _pageWidth];
  double v10 = v9;
  [(SBFolderView *)self _pageHeight];
  double v12 = v11;
  [(SBFolderView *)self _pageSpacing];
  double v14 = v13;
  BOOL v15 = [(SBFolderView *)self isRTL];
  BOOL v16 = [(SBFolderView *)self isVertical];
  [(SBFolderView *)self _scrollOffsetForFirstListView];
  double v19 = v10 + v14;
  if (v15) {
    double v19 = -(v10 + v14);
  }
  double v20 = v19 * (double)a3;
  double v21 = v12 * 0.5 + v18;
  double v22 = v10 * 0.5 + v17;
  if (v16) {
    double v23 = 0.0;
  }
  else {
    double v23 = v19 * (double)a3;
  }
  if (!v16) {
    double v20 = 0.0;
  }
  double v24 = v22 - v6 * 0.5 + v23;
  double v25 = v21 - v8 * 0.5 + v20;
  double v26 = v6;
  double v27 = v8;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (double)_pageHeight
{
  [(SBIconScrollView *)self->_scrollView bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if ([(SBFolderView *)self isVertical])
  {
    [(SBIconScrollView *)self->_scrollView _interpageSpacing];
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    CGRectGetHeight(v18);
    UISizeRoundToViewScale();
    return v11;
  }
  else
  {
    CGFloat v13 = v4;
    CGFloat v14 = v6;
    CGFloat v15 = v8;
    CGFloat v16 = v10;
    return CGRectGetHeight(*(CGRect *)&v13);
  }
}

- (CGPoint)_scrollOffsetForFirstListView
{
  int64_t v3 = [(SBFolderView *)self firstIconPageIndex];
  [(SBFolderView *)self _scrollOffsetForPageAtIndex:v3];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)_iconListViewSize
{
  [(SBIconScrollView *)self->_scrollView bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)_updateScalingViewFrame
{
  if (!self->_isScalingViewBorrowed)
  {
    scalingView = self->_scalingView;
    [(SBFolderView *)self _frameForScalingView];
    -[UIView sbf_setBoundsAndPositionFromFrame:](scalingView, "sbf_setBoundsAndPositionFromFrame:");
  }
}

- (UIView)scalingView
{
  return self->_scalingView;
}

- (SBFolderTitleTextField)_titleTextField
{
  return self->_titleTextField;
}

- (void)_setParallaxDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  BOOL v6 = [(SBFolderView *)self isParallaxEnabled];
  parallaxDisabledReasons = self->_parallaxDisabledReasons;
  if (v4)
  {
    if (!parallaxDisabledReasons)
    {
      CGFloat v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      double v9 = self->_parallaxDisabledReasons;
      self->_parallaxDisabledReasons = v8;

      parallaxDisabledReasons = self->_parallaxDisabledReasons;
    }
    [(NSMutableSet *)parallaxDisabledReasons addObject:v10];
  }
  else
  {
    [(NSMutableSet *)parallaxDisabledReasons removeObject:v10];
  }
  if (v6 != [(SBFolderView *)self isParallaxEnabled]) {
    [(SBFolderView *)self _updateParallaxSettings];
  }
}

- (BOOL)isParallaxEnabled
{
  return [(NSMutableSet *)self->_parallaxDisabledReasons count] == 0;
}

uint64_t __38__SBFolderView__updateScrollingState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBFolderView *)self succinctDescriptionBuilder];
  [(SBFolderView *)self frame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"frame");
  BOOL v6 = [(SBFolderView *)self folder];
  id v7 = (id)[v4 appendObject:v6 withName:@"folder"];

  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderView isEditing](self, "isEditing"), @"editing");
  id v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderView isScrolling](self, "isScrolling"), @"scrolling");
  if ([(SBFolderView *)self orientation] == 1)
  {
    id v10 = @"UIInterfaceOrientationPortrait";
  }
  else if ([(SBFolderView *)self orientation] == 4)
  {
    id v10 = @"UIInterfaceOrientationLandscapeLeft";
  }
  else if ([(SBFolderView *)self orientation] == 3)
  {
    id v10 = @"UIInterfaceOrientationLandscapeRight";
  }
  else if ([(SBFolderView *)self orientation] == 2)
  {
    id v10 = @"UIInterfaceOrientationPortraitUpsideDown";
  }
  else
  {
    id v10 = 0;
  }
  [v4 appendString:v10 withName:@"orientation"];
  id v11 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView currentPageIndex](self, "currentPageIndex"), @"currentPageIndex");
  id v12 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView iconListViewCount](self, "iconListViewCount"), @"iconListViewCount");
  id v13 = (id)[v4 appendBool:self->_isScalingViewBorrowed withName:@"isScalingViewBorrowed" ifEqualTo:1];
  id v14 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView leadingCustomPageCount](self, "leadingCustomPageCount"), @"leadingCustomPageCount");
  id v15 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView trailingCustomPageCount](self, "trailingCustomPageCount"), @"trailingCustomPageCount");
  CGFloat v16 = [(NSMutableSet *)self->_scrollViewIsScrollingOverrides allObjects];
  [v4 appendArraySection:v16 withName:@"scrollViewIsScrollingOverrides" skipIfEmpty:0];

  long long v17 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  v20[0] = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  v20[1] = v17;
  CGRect v18 = SBStringFromVisibleColumnRange(v20);
  [v4 appendString:v18 withName:@"visibleColumnRange"];

  return v4;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)SBFolderView;
  -[SBFolderView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
  id v7 = (SBFolderView *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  BOOL v9 = self->_isScalingViewBorrowed && v7 == self;
  if (v9
    && ([(SBFolderView *)self _frameForScalingView],
        v14.CGFloat x = x,
        v14.CGFloat y = y,
        CGRectContainsPoint(v15, v14)))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (unint64_t)typeForPage:(int64_t)a3
{
  int64_t v5 = [(SBFolderView *)self minimumPageIndex];
  unint64_t v6 = [(SBFolderView *)self leadingCustomPageCount];
  int64_t v7 = [(SBFolderView *)self maximumPageIndex];
  unint64_t v8 = [(SBFolderView *)self trailingCustomPageCount];
  if (v6 && (uint64_t)(v6 + v5) > a3) {
    return 0;
  }
  if ((uint64_t)(v7 - v8) >= a3 || v8 == 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)updateIconListIndexAndVisibility:(BOOL)a3
{
  int64_t v5 = [(SBFolderView *)self iconVisibilityHandling];
  int v6 = [(SBIconScrollView *)self->_scrollView isTracking];
  unsigned int v7 = [(SBIconScrollView *)self->_scrollView isDragging];
  int v8 = [(SBIconScrollView *)self->_scrollView isDecelerating];
  if (a3
    || !v8
    || (v6 & 1) != 0
    || (v7 & 1) != 0
    || v5 == 1
    || ([(SBIconScrollView *)self->_scrollView _pageDecelerationTarget],
        -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:"),
        int64_t v9 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 1, 0), [(SBFolderView *)self currentPageIndex] != v9))
  {
    uint64_t v10 = [(NSMutableArray *)self->_iconListViews count];
    int64_t v11 = [(SBFolderView *)self currentPageIndex];
    [(SBFolderView *)self bounds];
    if (CGRectGetWidth(v14) > 0.0)
    {
      [(SBFolderView *)self scrollOffsetForPageIndexCalculation];
      int64_t v11 = [(SBFolderView *)self _pageIndexForOffset:[(SBFolderView *)self isScrolling] ^ 1 behavior:0 fractionOfDistanceThroughPage:v12];
    }
    [(SBFolderView *)self updateVisibleColumnRangeWithTotalLists:v10 iconVisibilityHandling:v5];
    [(SBFolderView *)self _setCurrentPageIndex:v11 deferringPageControlUpdate:v6 | v7];
  }
}

- (int64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)updateVisibleColumnRangeWithTotalLists:(unint64_t)a3 iconVisibilityHandling:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v35 = xmmword_1D81E99F8;
  uint64_t v36 = 0;
  if ([(SBFolderView *)self updatesPredictedVisibleColumnWhileScrolling]) {
    unsigned int v7 = &v35;
  }
  else {
    unsigned int v7 = 0;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  [(SBFolderView *)self visibleColumnRangeWithTotalLists:a3 iconVisibilityHandling:a4 predictedVisibleColumn:v7 includingAdditionalColumnsKeptVisible:1];
  BOOL v8 = [(SBFolderView *)self isScrolling];
  BOOL v9 = [(SBFolderView *)self isVertical];
  long long v31 = 0u;
  long long v32 = 0u;
  if (self->_prefetchedColumnRange.startIconListIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v31 = v33;
    long long v32 = v34;
  }
  else
  {
    *(_OWORD *)buf = v33;
    *(_OWORD *)&uint8_t buf[16] = v34;
    long long v10 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
    long long v29 = *(_OWORD *)&self->_prefetchedColumnRange.startIconListIndex;
    long long v30 = v10;
    SBVisibleColumnRangeUnion((uint64_t *)buf, &v29, (uint64_t)&v31);
  }
  p_visibleColumnRange = &self->_visibleColumnRange;
  *(_OWORD *)buf = v31;
  *(_OWORD *)&uint8_t buf[16] = v32;
  long long v12 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  long long v29 = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  long long v30 = v12;
  if (!SBVisibleColumnRangeEqualToRange(buf, &v29))
  {
    id v13 = SBLogIcon();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    if (v14)
    {
      CGRect v15 = SBLogIcon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        long long v19 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
        *(_OWORD *)buf = *(_OWORD *)&p_visibleColumnRange->startIconListIndex;
        *(_OWORD *)&uint8_t buf[16] = v19;
        double v20 = SBStringFromVisibleColumnRange(buf);
        *(_OWORD *)buf = v31;
        *(_OWORD *)&uint8_t buf[16] = v32;
        double v21 = SBStringFromVisibleColumnRange(buf);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_log_debug_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEBUG, "Visible column range changed. Was %{public}@, now %{public}@", buf, 0x16u);
      }
    }
    _UIScrollViewNotifyForScrollView();
    iconListViews = self->_iconListViews;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke;
    v22[3] = &__block_descriptor_90_e31_v32__0__SBIconListView_8Q16_B24l;
    BOOL v27 = v9;
    long long v23 = v31;
    long long v24 = v32;
    BOOL v28 = v8;
    long long v25 = v35;
    uint64_t v26 = v36;
    [(NSMutableArray *)iconListViews enumerateObjectsUsingBlock:v22];
    long long v17 = v32;
    *(_OWORD *)&p_visibleColumnRange->startIconListIndeCGFloat x = v31;
    *(_OWORD *)&self->_visibleColumnRange.endIconListIndeCGFloat x = v17;
    long long v18 = v34;
    *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndeCGFloat x = v33;
    *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndeCGFloat x = v18;
  }
}

- (BOOL)isScrolling
{
  double v3 = [(SBFolderView *)self scrollView];
  char v4 = [v3 isScrolling];

  return (v4 & 1) != 0 || [(NSMutableSet *)self->_scrollViewIsScrollingOverrides count] != 0;
}

- (UIScrollView)scrollView
{
  return &self->_scrollView->super.super;
}

- (BOOL)updatesPredictedVisibleColumnWhileScrolling
{
  return 0;
}

- (double)scrollOffsetForPageIndexCalculation
{
  double v3 = [(SBFolderView *)self scrollView];
  [v3 contentOffset];
  long double v5 = v4;
  double v7 = v6;
  BOOL v8 = [(SBFolderView *)self isRTL];
  if ([(SBFolderView *)self isVertical])
  {
    long double v5 = v7;
  }
  else if (v8)
  {
    [v3 frame];
    CGFloat Width = CGRectGetWidth(v11);
    long double v5 = nexttoward(v5 + Width, v5);
  }

  return v5;
}

- (double)currentScrollOffset
{
  [(SBIconScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  if ([(SBFolderView *)self isVertical]) {
    return v6;
  }
  else {
    return v4;
  }
}

- (id)iconListViewForIconListModelIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBFolderView *)self iconListViewIndexForIconListModelIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(SBFolderView *)self iconListViewAtIndex:v4];
  }
  return v5;
}

- (unint64_t)iconListViewIndexForIconListModelIndex:(unint64_t)a3
{
  int64_t v4 = [(SBFolderView *)self pageIndexForIconListModelIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBFolderView *)self iconListViewIndexForPageIndex:v4];
}

- (int64_t)pageIndexForIconListModelIndex:(unint64_t)a3
{
  double v5 = [(SBFolderView *)self folder];
  if (![(SBFolderView *)self includesHiddenIconListPages]) {
    a3 = [v5 visibleIndexForIndex:a3];
  }
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v6 = [(SBFolderView *)self firstIconPageIndex] + a3;
  }

  return v6;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBIconListView)currentIconListView
{
  unint64_t v3 = [(SBFolderView *)self iconListViewIndexForPageIndex:[(SBFolderView *)self currentPageIndex]];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [(SBFolderView *)self iconListViewAtIndex:v3];
  }
  return (SBIconListView *)v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (int64_t)_pageIndexForOffset:(double)a3
{
  return [(SBFolderView *)self _pageIndexForOffset:0 behavior:0 fractionOfDistanceThroughPage:a3];
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v5 = (SBHIconImageAppearance *)[v4 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__SBFolderView_setOverrideIconImageAppearance___block_invoke;
    v7[3] = &unk_1E6AADAE0;
    id v8 = v4;
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:v7];
  }
}

- (void)_setScrollViewContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SBFolderView *)self _ignoreScrollingDidEndNotifications];
  id v8 = SBLogIcon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 1024;
    BOOL v13 = v4;
    id v9 = v11;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ initiating programmatic scroll - animated: %{BOOL}u", (uint8_t *)&v10, 0x12u);
  }
  -[SBIconScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v4, x, y);
  [(SBFolderView *)self _unignoreScrollingDidEndNotifications];
}

- (BOOL)iconScrollView:(id)a3 shouldSetContentOffset:(CGPoint *)a4 animated:(BOOL)a5
{
  return 1;
}

- (void)_unignoreScrollingDidEndNotifications
{
}

- (void)_ignoreScrollingDidEndNotifications
{
}

- (BOOL)isScalingViewBorrowed
{
  return self->_isScalingViewBorrowed;
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBFolderView *)self isEditing];
  BOOL v6 = [(SBFolderView *)self suppressesEditingStateForListViews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v7 = [(SBFolderView *)self iconListViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    BOOL v11 = v5 && !v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v13 setEditing:v11];
        [v13 updateEditingStateAnimated:v3];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  [(SBFolderView *)self updateIconListIndexAndVisibility];
  if (v5
    && (p_titleTextField = &self->_titleTextField,
        [(SBFolderTitleTextField *)self->_titleTextField allowsEditing]))
  {
    uint64_t v15 = 1;
  }
  else
  {
    p_titleTextField = &self->_titleTextField;
    [(SBFolderTitleTextField *)self->_titleTextField endEditing:1];
    uint64_t v15 = 0;
  }
  [(SBFolderTitleTextField *)*p_titleTextField setShowsEditUI:v15 animated:v3];
  BOOL v16 = [(SBFolderView *)self _isEligibleForFocusInteraction];
  long long v17 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  long long v18 = [v17 focusedItem];

  if (v16 != (v18 != 0)) {
    [(SBFolderView *)self setNeedsFocusUpdate];
  }
  [(SBFolderView *)self setNeedsLayout];
  if (v3)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _OWORD v20[2] = __44__SBFolderView__updateEditingStateAnimated___block_invoke;
    v20[3] = &unk_1E6AAC810;
    v20[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__SBFolderView__updateEditingStateAnimated___block_invoke_2;
    v19[3] = &unk_1E6AAC810;
    v19[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v19 animations:0.3];
  }
}

- (void)setContentVisibility:(unint64_t)a3
{
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibilitdouble y = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__SBFolderView_setContentVisibility___block_invoke;
    v7[3] = &__block_descriptor_40_e28_v24__0__SBIconListView_8_B16l;
    void v7[4] = a3;
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:v7];
    BOOL v4 = [(SBFolderView *)self _isEligibleForFocusInteraction];
    BOOL v5 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
    BOOL v6 = [v5 focusedItem];

    if (v4 != (v6 != 0)) {
      [(SBFolderView *)self setNeedsFocusUpdate];
    }
  }
}

- (BOOL)_isEligibleForFocusInteraction
{
  if (self->_isEditing || [(SBFolderView *)self contentVisibility]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFolderView;
  return [(SBFolderView *)&v4 _isEligibleForFocusInteraction];
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4 = (SBIconScrollView *)a3;
  if (self->_scrollView == v4)
  {
    long long v18 = v4;
    BOOL v5 = SBLogIcon();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    double v7 = 0.0;
    if (v6)
    {
      ++self->_scrollFrameCount;
      double v7 = CACurrentMediaTime();
    }
    if (self->_rotating)
    {
      if (!v6)
      {
LABEL_7:
        p_scrollTrackingContentOffset = &self->_scrollTrackingContentOffset;
        [(SBIconScrollView *)v18 contentOffset];
        objc_super v4 = v18;
        p_scrollTrackingContentOffset->double x = v15;
        p_scrollTrackingContentOffset->double y = v16;
        goto LABEL_8;
      }
    }
    else
    {
      [(SBFolderView *)self _checkIfScrollStateChanged];
      long long v17 = [(SBFolderView *)self delegate];
      [v17 folderViewWillUpdatePageDuringScrolling:self];
      [(SBFolderView *)self updateIconListIndexAndVisibility];
      [v17 folderViewDidScroll:self];

      if (!v6) {
        goto LABEL_7;
      }
    }
    double v8 = CACurrentMediaTime();
    scrollFrames = self->_scrollFrames;
    uint64_t v10 = NSString;
    unint64_t scrollFrameCount = self->_scrollFrameCount;
    [(SBIconScrollView *)self->_scrollView contentOffset];
    __int16 v12 = NSStringFromCGPoint(v20);
    BOOL v13 = [v10 stringWithFormat:@"scroll view did scroll time: frame=%u, offset: %@, time: %f ms", scrollFrameCount, v12, (v8 - v7) * 100.0];
    [(NSMutableArray *)scrollFrames addObject:v13];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateIconListIndexAndVisibility
{
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  if (self->_scrollView == a3)
  {
    [(SBFolderView *)self _checkIfScrollStateChanged];
    self->_scrollTrackingContentOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
  }
}

- (void)_checkIfScrollStateChanged
{
  BOOL v3 = [(SBFolderView *)self isScrolling];
  if (self->_wasScrolling != v3)
  {
    BOOL v4 = v3;
    [(SBFolderView *)self _updateScrollingState:v3];
    self->_wasScrolling = v4;
  }
}

- (void)_updateScrollingState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_wasScrolling == a3) {
    NSLog(&cfstr_SomehowThisGot.isa, a2);
  }
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CGPoint v20 = 138412546;
    *(void *)&v20[4] = objc_opt_class();
    *(_WORD *)&v20[12] = 1024;
    *(_DWORD *)&v20[14] = v3;
    id v6 = *(id *)&v20[4];
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "%@ updating scrolling: %{BOOL}u", v20, 0x12u);
  }
  double v7 = [(SBFolderView *)self delegate];
  if (v3)
  {
    [(SBFolderView *)self noteUserIsInteractingWithIcons];
    double v8 = [(SBFolderView *)self scrollView];
    [v8 contentOffset];
    self->_scrollStartContentOffset.double x = v9;
    self->_scrollStartContentOffset.double y = v10;

    self->_scrollTrackingContentOffset = self->_scrollStartContentOffset;
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:&__block_literal_global_81_0];
    [v7 folderViewWillBeginScrolling:self];
  }
  else
  {
    BOOL v11 = SBLogIcon();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if (v12)
    {
      self->_unint64_t scrollFrameCount = 0;
      BOOL v13 = SBLogIcon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        scrollFrames = self->_scrollFrames;
        *(_DWORD *)CGPoint v20 = 138543362;
        *(void *)&v20[4] = scrollFrames;
        _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "Scroll frames: %{public}@", v20, 0xCu);
      }

      [(NSMutableArray *)self->_scrollFrames removeAllObjects];
    }
    if ([(SBFolderView *)self extraPageCountDuringScrolling])
    {
      [(SBFolderView *)self setExtraPageCountDuringScrolling:0];
      [(SBFolderView *)self _updateIconListFrames];
    }
    [(SBFolderView *)self updateIconListIndexAndVisibility:1];
    if ([(SBFolderView *)self snapsToPageBoundariesAfterScrolling]) {
      [(SBFolderView *)self resetContentOffsetToCurrentPageAnimated:0];
    }
    [(SBFolderView *)self _updatePageControlToIndex:self->_currentPageIndex];
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:&__block_literal_global_84_0];
    self->_prefetchedColumnRange.startIconListIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    [(SBFolderView *)self updateVisibleColumnRange];
    if ([(SBFolderView *)self addsFocusGuidesForWrapping])
    {
      CGFloat v15 = [(SBFolderView *)self currentIconListView];
      CGFloat v16 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
      long long v17 = [v16 focusedItem];

      if (v17)
      {
        if (v15)
        {
          long long v18 = [v17 parentFocusEnvironment];

          if (v18 != v15) {
            [(SBFolderView *)self setNeedsFocusUpdate];
          }
        }
      }
    }
    [v7 folderViewDidEndScrolling:self];
    long long v19 = (void *)[(NSMutableArray *)self->_scrollCompletionBlocks copy];
    [(NSMutableArray *)self->_scrollCompletionBlocks removeAllObjects];
    [v19 enumerateObjectsUsingBlock:&__block_literal_global_87];
  }
}

- (BOOL)snapsToPageBoundariesAfterScrolling
{
  return self->_snapsToPageBoundariesAfterScrolling;
}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (void)_willScrollToPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    id v6 = [(SBFolderView *)self delegate];
    [v6 folderView:self willAnimateScrollToPageIndex:a3];
  }
}

- (unsigned)userInterfaceLayoutDirectionAwareScrollingDirection
{
  unsigned int v3 = [(SBFolderView *)self scrollingDirection];
  BOOL v4 = [(SBFolderView *)self isRTL];
  if (v3 == 2) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = v3;
  }
  if (v3) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = 2;
  }
  if (v4) {
    return v6;
  }
  else {
    return v3;
  }
}

- (unsigned)scrollingDirection
{
  return [(SBFolderView *)self scrollingDirectionTracking:1];
}

- (unsigned)scrollingDirectionTracking:(BOOL)a3
{
  unsigned int v3 = &OBJC_IVAR___SBFolderView__scrollStartContentOffset;
  if (a3) {
    unsigned int v3 = &OBJC_IVAR___SBFolderView__scrollTrackingContentOffset;
  }
  BOOL v4 = (double *)((char *)self + *v3);
  double v6 = *v4;
  double v5 = v4[1];
  double v7 = [(SBFolderView *)self scrollView];
  [v7 contentOffset];
  double v9 = v8;
  double v11 = v10;

  double v12 = vabdd_f64(v11, v5);
  double v13 = vabdd_f64(v9, v6);
  if (v11 - v5 < 0.0) {
    unsigned int v14 = 1;
  }
  else {
    unsigned int v14 = 3;
  }
  if (v12 <= v13) {
    return 2 * (v9 - v6 >= 0.0);
  }
  else {
    return v14;
  }
}

- (void)noteUserIsInteractingWithIcons
{
}

uint64_t __44__SBFolderView__updateEditingStateAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __44__SBFolderView__updateEditingStateAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePageControlNumberOfPages];
  double v2 = *(void **)(*(void *)(a1 + 32) + 432);
  return [v2 layoutIfNeeded];
}

- (SBFolderView)initWithConfiguration:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 initialViewFrame];
  v53.receiver = self;
  v53.super_class = (Class)SBFolderView;
  double v5 = -[SBFolderView initWithFrame:](&v53, sel_initWithFrame_);
  if (v5)
  {
    double v6 = [v4 folder];
    objc_storeStrong((id *)&v5->_folder, v6);
    uint64_t v7 = [v4 listLayoutProvider];
    listLayoutProvider = v5->_listLayoutProvider;
    v5->_listLayoutProvider = (SBIconListLayoutProvider *)v7;

    v5->_orientation = [v4 orientation];
    v5->_allowedOrientations = [v4 allowedOrientations];
    double v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    iconListViews = v5->_iconListViews;
    v5->_iconListViews = v9;

    double v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    scrollingDisabledReasons = v5->_scrollingDisabledReasons;
    v5->_scrollingDisabledReasons = v11;

    double v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pageControlDisabledReasons = v5->_pageControlDisabledReasons;
    v5->_pageControlDisabledReasons = v13;

    v5->_int64_t currentPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5->_currentPageType = 1;
    CGFloat v15 = [v4 iconViewProvider];
    objc_storeWeak((id *)&v5->_iconViewProvider, v15);

    CGFloat v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scrollFrames = v5->_scrollFrames;
    v5->_scrollFrames = v16;

    uint64_t v18 = [v4 legibilitySettings];
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v18;

    uint64_t v20 = [v4 folderIconImageCache];
    folderIconImageCache = v5->_folderIconImageCache;
    v5->_folderIconImageCache = (SBFolderIconImageCache *)v20;

    uint64_t v22 = [v4 iconImageCache];
    iconImageCache = v5->_iconImageCache;
    v5->_iconImageCache = (SBHIconImageCache *)v22;

    uint64_t v24 = [v4 headerView];
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v24;

    [v4 headerHeight];
    v5->_double headerHeight = v26;
    v5->_userInterfaceLayoutDirectionHandling = [v4 userInterfaceLayoutDirectionHandling];
    v5->_vertical = [v4 isVertical];
    v5->_snapsToPageBoundariesAfterScrolling = [v4 snapsToPageBoundariesAfterScrolling];
    v5->_addsFocusGuidesForWrapping = [v4 addsFocusGuidesForWrapping];
    BOOL v27 = [v4 overrideIconImageAppearance];
    uint64_t v28 = [v27 copy];
    overrideIconImageAppearance = v5->_overrideIconImageAppearance;
    v5->_overrideIconImageAppearance = (SBHIconImageAppearance *)v28;

    v5->_iconSpacingAxisMatchingBehavior = [v4 iconSpacingAxisMatchingBehavior];
    v5->_prefetchedColumnRange.startIconListIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    v5->_automaticallyCreatesIconListViews = 1;
    v5->_contentVisibilitdouble y = 0;
    [v6 addFolderObserver:v5];
    long long v30 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    scalingView = v5->_scalingView;
    v5->_scalingView = v30;

    [(SBFolderView *)v5 addSubview:v5->_scalingView];
    if ([(SBFolderView *)v5 _showsTitle])
    {
      long long v32 = [SBFolderTitleTextField alloc];
      uint64_t v33 = -[SBFolderTitleTextField initWithFrame:](v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      titleTextField = v5->_titleTextField;
      v5->_titleTextField = (SBFolderTitleTextField *)v33;

      long long v35 = v5->_titleTextField;
      [(SBFolderView *)v5 _titleFontSize];
      -[SBFolderTitleTextField setFontSize:](v35, "setFontSize:");
      uint64_t v36 = v5->_titleTextField;
      uint64_t v37 = [v6 displayName];
      [(SBFolderTitleTextField *)v36 setText:v37];

      [(SBFolderTitleTextField *)v5->_titleTextField setDelegate:v5];
      -[SBFolderTitleTextField setAllowsEditing:](v5->_titleTextField, "setAllowsEditing:", [v6 canEditDisplayName]);
      [(SBFolderTitleTextField *)v5->_titleTextField setLegibilitySettings:v5->_legibilitySettings];
    }
    uint64_t v38 = (SBIconScrollView *)objc_alloc_init((Class)[(id)objc_opt_class() _scrollViewClass]);
    scrollView = v5->_scrollView;
    v5->_scrollView = v38;

    [(BSUIScrollView *)v5->_scrollView setDelegate:v5];
    [(SBIconScrollView *)v5->_scrollView setPagingEnabled:1];
    [(SBIconScrollView *)v5->_scrollView setBounces:1];
    [(SBIconScrollView *)v5->_scrollView setScrollsToTop:0];
    [(SBIconScrollView *)v5->_scrollView setShowsHorizontalScrollIndicator:0];
    [(SBIconScrollView *)v5->_scrollView setShowsVerticalScrollIndicator:0];
    [(SBIconScrollView *)v5->_scrollView setDelaysContentTouches:0];
    [(SBIconScrollView *)v5->_scrollView setClipsToBounds:0];
    [(SBIconScrollView *)v5->_scrollView setAlwaysBounceHorizontal:!v5->_vertical];
    [(SBIconScrollView *)v5->_scrollView setAlwaysBounceVertical:v5->_vertical];
    [(SBIconScrollView *)v5->_scrollView _setSupportsPointerDragScrolling:1];
    uint64_t v40 = [(SBFolderView *)v5 _newPageControl];
    pageControl = v5->_pageControl;
    v5->_pageControl = (SBIconListPageControl *)v40;

    [(SBFolderView *)v5 _updatePageControlToIndex:[(SBFolderView *)v5 minimumPageIndex]];
    [(UIPageControl *)v5->_pageControl setHidesForSinglePage:1];
    -[UIPageControl _setPreferredNumberOfVisibleIndicators:](v5->_pageControl, "_setPreferredNumberOfVisibleIndicators:", [v6 maxListCount]);
    [(SBIconListPageControl *)v5->_pageControl setLegibilitySettings:v5->_legibilitySettings];
    [(SBIconListPageControl *)v5->_pageControl setDelegate:v5];
    if ([(SBFolderView *)v5 _useParallaxOnPageControl]) {
      [(SBIconListPageControl *)v5->_pageControl _setVisualAltitude:*MEMORY[0x1E4FB3330]];
    }
    [(SBIconListPageControl *)v5->_pageControl setAccessibilityIdentifier:@"Page control"];
    if ([(SBFolderView *)v5 _shouldUseScrollableIconViewInteraction])
    {
      double v42 = [(SBHScrollableIconViewInteraction *)[SBHScrollableZoomingIconViewInteraction alloc] initWithContainer:v5];
      scrollingInteraction = v5->_scrollingInteraction;
      v5->_scrollingInteraction = v42;

      [(SBFolderView *)v5 _configureScrollingInteraction:v5->_scrollingInteraction];
    }
    BOOL v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v44 addObserver:v5 selector:sel__backgroundContrastDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
    double v45 = self;
    v55[0] = v45;
    double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    id v47 = (id)[(SBFolderView *)v5 registerForTraitChanges:v46 withAction:sel_setNeedsLayout];

    v48 = self;
    v54[0] = v48;
    v49 = self;
    v54[1] = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    id v51 = (id)[(SBFolderView *)v5 registerForTraitChanges:v50 withTarget:v5 action:sel__updatePageControlUserInterfaceStyle];

    [(SBFolderView *)v5 _updatePageControlUserInterfaceStyle];
  }

  return v5;
}

- (void)_updatePageControlNumberOfPages
{
  int64_t v3 = [(SBFolderView *)self _pageCountForPageControl];
  if (v3 != [(UIPageControl *)self->_pageControl numberOfPages]) {
    [(UIPageControl *)self->_pageControl setNumberOfPages:v3];
  }
  [(SBFolderView *)self _updatePageControlCurrentPage];
}

- (BOOL)_useParallaxOnPageControl
{
  return 1;
}

- (id)_newPageControl
{
  double v2 = [SBIconListPageControl alloc];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBIconListPageControl initWithFrame:](v2, "initWithFrame:", v3, v4, v5, v6);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isEditing != a3)
  {
    self->_isEditing = a3;
    [(SBFolderView *)self _updateEditingStateAnimated:a4];
  }
}

- (void)_resetIconListViews
{
  [(SBFolderView *)self tearDownListViews];
  BOOL v3 = [(SBFolderView *)self includesHiddenIconListPages];
  folder = self->_folder;
  if (v3) {
    [(SBFolder *)folder lists];
  }
  else {
  id v5 = [(SBFolder *)folder visibleLists];
  }
  [(SBFolderView *)self _addIconListViewsForModels:v5];
}

- (void)tearDownListViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSMutableArray *)self->_iconListViews copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
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
        -[SBFolderView _removeIconListView:](self, "_removeIconListView:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_iconListViews removeAllObjects];
  [(SBFolderView *)self validateVisibleColumnRange];
}

- (void)validateVisibleColumnRange
{
  p_visibleColumnRange = &self->_visibleColumnRange;
  long long v4 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  long long v6 = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  long long v7 = v4;
  if (!SBVisibleColumnRangeIsEmpty((unint64_t *)&v6))
  {
    long long v5 = *(_OWORD *)&p_visibleColumnRange->endIconListIndex;
    long long v6 = *(_OWORD *)&p_visibleColumnRange->startIconListIndex;
    long long v7 = v5;
    if (![(SBFolderView *)self isVisibleColumnRangeValid:&v6])
    {
      [(SBFolderView *)self clearVisibleColumnRange];
      [(SBFolderView *)self updateVisibleColumnRange];
    }
  }
}

- (BOOL)isVisibleColumnRangeValid:(SBVisibleColumnRange *)a3
{
  long long v5 = *(_OWORD *)&a3->endIconListIndex;
  long long v9 = *(_OWORD *)&a3->startIconListIndex;
  long long v10 = v5;
  if (SBVisibleColumnRangeIsEmpty((unint64_t *)&v9)) {
    return 1;
  }
  unint64_t v7 = [(SBFolderView *)self iconListViewCount];
  if (a3->startIconListIndex >= v7 || a3->endIconListIndex >= v7) {
    return 0;
  }
  long long v8 = *(_OWORD *)&a3->endIconListIndex;
  long long v9 = *(_OWORD *)&a3->startIconListIndex;
  long long v10 = v8;
  return SBVisibleColumnRangeMaxIconListIndex((uint64_t *)&v9) < v7;
}

- (void)clearVisibleColumnRange
{
  self->_visibleColumnRange.startIconListIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  self->_userVisibleColumnRange.startIconListIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_addIconListViewsForModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        long long v10 = (void *)MEMORY[0x1D9484600](v5);
        long long v11 = -[SBFolderView _createIconListViewForList:](self, "_createIconListViewForList:", v9, (void)v12);
        [(SBFolderView *)self _addIconListView:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  [(SBFolderView *)self setNeedsLayout];
  [(SBFolderView *)self layoutIfNeeded];
  [(SBFolderView *)self updateIconListIndexAndVisibility:1];
  [(SBFolderView *)self _updateEditingStateAnimated:0];
}

- (void)_addIconListView:(id)a3 atEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    long long v15 = v6;
    [(SBFolderView *)self _configureIconListView:v6];
    if (v4)
    {
      [(NSMutableArray *)self->_iconListViews addObject:v15];
    }
    else
    {
      uint64_t v7 = [(SBFolderView *)self folder];
      uint64_t v8 = [v15 model];
      if ([(SBFolderView *)self includesHiddenIconListPages]) {
        uint64_t v9 = [v7 indexOfList:v8];
      }
      else {
        uint64_t v9 = [v7 visibleIndexOfList:v8];
      }
      unint64_t v10 = v9;
      unint64_t v11 = [(NSMutableArray *)self->_iconListViews count];
      iconListViews = self->_iconListViews;
      if (v10 >= v11) {
        [(NSMutableArray *)iconListViews addObject:v15];
      }
      else {
        [(NSMutableArray *)iconListViews insertObject:v15 atIndex:v10];
      }
    }
    long long v13 = [(SBFolderView *)self scrollView];
    [v13 addSubview:v15];

    [(SBFolderView *)self _updatePageControlNumberOfPages];
    [(SBFolderView *)self _didAddIconListView:v15];
    long long v14 = [(SBFolderView *)self delegate];
    [v14 folderView:self didAddIconListView:v15];

    id v6 = v15;
  }
}

- (void)_configureIconListView:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setVisiblySettled:", -[SBFolderView isScrolling](self, "isScrolling") ^ 1);
}

- (void)_addIconListView:(id)a3
{
}

- (int64_t)pageIndexForIconListViewIndex:(unint64_t)a3
{
  return [(SBFolderView *)self firstIconPageIndex] + a3;
}

- (void)_didAddIconListView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_layoutHidingAssertions;
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

void __35__SBFolderView__precacheIconImages__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v2 = SBLogIcon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_INFO, "finished asynchronous precache of remaining icons for folder %@", (uint8_t *)&v4, 0xCu);
  }
}

double __37__SBFolderView__updateIconListFrames__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _updateIconListContainment:v6 atIndex:a3];
  objc_msgSend(*(id *)(a1 + 32), "_iconListFrameForPageRect:atIndex:", a3, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  objc_msgSend(v6, "setBounds:", 0.0, 0.0);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");

  double v7 = *(double *)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(a1 + 72))
  {
    double v9 = *(double *)(a1 + 64) + v7;
    if (*(unsigned char *)(a1 + 73)) {
      double v9 = -v9;
    }
    long long v10 = (double *)(v8 + 40);
  }
  else
  {
    double v9 = *(double *)(a1 + 48) + v7;
    if (*(unsigned char *)(a1 + 73)) {
      double v9 = -v9;
    }
    long long v10 = (double *)(v8 + 32);
  }
  double result = v9 + *v10;
  *long long v10 = result;
  return result;
}

- (void)_updateIconListContainment:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v5 = [v7 superview];
  scrollView = self->_scrollView;

  if (v5 != scrollView) {
    [(SBIconScrollView *)self->_scrollView addSubview:v7];
  }
}

- (id)_createIconListViewForList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderView *)self listViewClass];
  id v6 = [(SBFolderView *)self listLayoutProvider];
  id v7 = [(SBFolderView *)self iconLocationForList:v4];
  uint64_t v8 = [(SBFolderView *)self iconViewProvider];
  double v9 = (void *)[[v5 alloc] initWithModel:v4 layoutProvider:v6 iconLocation:v7 orientation:self->_orientation iconViewProvider:v8];
  objc_msgSend(v9, "setUserInterfaceLayoutDirectionHandling:", -[SBFolderView userInterfaceLayoutDirectionHandling](self, "userInterfaceLayoutDirectionHandling"));
  objc_msgSend(v9, "setEditing:", -[SBFolderView isEditing](self, "isEditing"));
  [v9 setLayoutDelegate:self];
  [v9 setDragDelegate:self];
  long long v10 = [(SBFolderView *)self legibilitySettingsForIconListViews];
  [v9 setLegibilitySettings:v10];

  long long v11 = [(SBFolderView *)self folderIconImageCache];
  [v9 setFolderIconImageCache:v11];

  [v9 setAddsFocusGuidesForWrapping:self->_addsFocusGuidesForWrapping];
  long long v12 = [(SBFolderView *)self iconImageCache];
  [v9 setIconImageCache:v12];

  long long v13 = [(SBFolderView *)self overrideIconImageAppearance];
  [v9 setOverrideIconImageAppearance:v13];

  objc_msgSend(v9, "setIconSpacingAxisMatchingBehavior:", -[SBFolderView iconSpacingAxisMatchingBehavior](self, "iconSpacingAxisMatchingBehavior"));
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v7))
  {
    [v9 setFocusGroupIdentifier:@"FolderViewFocusGroup"];
  }
  else
  {
    long long v14 = [v4 uniqueIdentifier];
    [v9 setFocusGroupIdentifier:v14];
  }
  [v9 hideAllIcons];

  return v9;
}

- (void)prepareToOpen
{
  if (![(SBFolderView *)self _isValidPageIndex:[(SBFolderView *)self currentPageIndex]])[(SBFolderView *)self setCurrentPageIndex:[(SBFolderView *)self defaultPageIndex] animated:0]; {
  [(SBFolderView *)self _precacheIconImages];
  }
  [(SBFolderView *)self setHidden:0];
  [(SBFolderView *)self setNeedsLayout];
  [(SBFolderView *)self layoutIfNeeded];
}

- (void)_precacheIconImages
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBLogIcon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    folder = self->_folder;
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = folder;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "beginning precache of icons for folder %@", buf, 0xCu);
  }

  uint64_t v5 = [(SBFolderView *)self currentIconListModel];
  id v6 = [v5 icons];
  id v7 = [(SBFolderView *)self folder];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v9 = [(SBFolder *)v7 lists];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        if (v14 != v5)
        {
          uint64_t v15 = [v14 icons];
          [v8 addObjectsFromArray:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  CGFloat v16 = [(SBFolderView *)self iconImageCache];
  uint64_t v17 = [(SBFolderView *)self effectiveIconImageAppearance];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = (id)[v16 imageForIcon:*(void *)(*((void *)&v29 + 1) + 8 * v22++) imageAppearance:v17 options:0];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
  }

  uint64_t v24 = SBLogIcon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v7;
    _os_log_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_INFO, "finished synchronous precache of first page of icons for folder %@", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __35__SBFolderView__precacheIconImages__block_invoke;
  v27[3] = &unk_1E6AB59D0;
  uint64_t v28 = v7;
  long long v25 = v7;
  id v26 = (id)[v16 cacheImagesForIcons:v8 imageAppearance:v17 reason:@"SBFolderView _precacheIconImages" options:0 completionHandler:v27];
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (id)effectiveIconImageAppearance
{
  uint64_t v3 = [(SBFolderView *)self overrideIconImageAppearance];
  id v4 = [(SBFolderView *)self traitCollection];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);

  return v5;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (void)setNeedsLayout
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_iconListViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setIconsNeedLayout];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBFolderView;
  [(SBFolderView *)&v8 setNeedsLayout];
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    [(SBFolderView *)self _updateEditingStateAnimated:a4];
  }
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBFolderView *)self updateAccessibilityTintColors];
    uint64_t v6 = [(SBFolderView *)self firstIconListView];
    uint64_t v7 = objc_opt_class();

    objc_super v8 = [(SBFolderView *)self listViewClass];
    uint64_t v5 = obj;
    if (v7)
    {
      char v9 = [v7 isEqual:v8];
      uint64_t v5 = obj;
      if ((v9 & 1) == 0)
      {
        [(SBFolderView *)self resetIconListViews];
        uint64_t v5 = obj;
      }
    }
  }
}

- (Class)listViewClass
{
  uint64_t v3 = [(SBFolderView *)self delegate];
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = (void *)[v3 iconListViewClassForFolderView:self];
  }
  else {
    uint64_t v5 = (void *)[(id)objc_opt_class() defaultIconListViewClass];
  }
  uint64_t v6 = v5;

  return v6;
}

+ (Class)defaultIconListViewClass
{
  return (Class)self;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (id)firstIconListView
{
  return (id)[(NSMutableArray *)self->_iconListViews firstObject];
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBFolderView;
  [(SBFolderView *)&v7 didAddSubview:v4];
  uint64_t v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_msgSend(v4, "setContentVisibility:", -[SBFolderView contentVisibility](self, "contentVisibility"));
  }
}

- (BOOL)doesPageContainIconListView:(int64_t)a3
{
  BOOL v5 = -[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:");
  if (v5)
  {
    LOBYTE(v5) = [(SBFolderView *)self _isValidIconListViewIndex:a3];
  }
  return v5;
}

- (BOOL)_isValidIconListViewIndex:(int64_t)a3
{
  return [(SBFolderView *)self iconListViewIndexForPageIndex:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderView;
  [(SBFolderView *)&v3 didMoveToSuperview];
  [(SBFolderView *)self _updateScrollingIfNeeded];
}

- (void)didMoveToWindow
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBFolderView;
  [(SBFolderView *)&v9 didMoveToWindow];
  [(SBFolderView *)self _updateScrollingIfNeeded];
  objc_super v3 = [(SBFolderView *)self window];
  uint64_t v4 = [v3 interfaceOrientation];
  int64_t v5 = [(SBFolderView *)self orientation];
  uint64_t v6 = SBLogIcon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    long long v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    int64_t v15 = v5;
    _os_log_debug_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEBUG, "adding folder view to window %@ with orientation %li, current: %li", buf, 0x20u);
  }

  if (v3 && v4 && v4 != v5)
  {
    [(SBFolderView *)self setOrientation:v4];
    objc_super v7 = [(SBFolderView *)self delegate];
    [v7 folderViewDidChangeOrientation:self];
  }
  else if (!v3)
  {
    if (![(SBFolderView *)self isRegisteredForIdleUpdates]) {
      goto LABEL_11;
    }
    _UIUpdateCycleUnregisterIdleObserver();
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  if (![(SBFolderView *)self isRegisteredForIdleUpdates])
  {
    _UIUpdateCycleRegisterIdleObserver();
    uint64_t v8 = 1;
LABEL_10:
    [(SBFolderView *)self setRegisteredForIdleUpdates:v8];
  }
LABEL_11:
  [(SBFolderView *)self updateVisibleColumnRange];
}

- (void)setRegisteredForIdleUpdates:(BOOL)a3
{
  self->_registeredForIdleUpdates = a3;
}

- (BOOL)isRegisteredForIdleUpdates
{
  return self->_registeredForIdleUpdates;
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  if (self->_scrollView == a3)
  {
    [(SBFolderView *)self _scrollViewContentSize];
    a5.double height = v6;
  }
  else
  {
    double width = a5.width;
  }
  double height = a5.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBFolderView;
  -[SBFolderView willMoveToWindow:](&v12, sel_willMoveToWindow_);
  int64_t v5 = [(SBFolderView *)self window];
  if (v5) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = a3 != 0;
  }

  objc_super v7 = [(SBFolderView *)self window];

  if (v7) {
    BOOL v8 = a3 != 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v6 || !v8)
  {
    uint64_t v9 = [(SBFolderView *)self minimumPageIndex];
    uint64_t v10 = [(SBFolderView *)self maximumPageIndex];
    int64_t currentPageIndex = self->_currentPageIndex;
    if (currentPageIndex < v9 || (uint64_t v9 = v10 & ~(v10 >> 63), currentPageIndex > v9)) {
      [(SBFolderView *)self setCurrentPageIndex:v9 animated:0];
    }
  }
  if (a3) {
    [(SBFolderView *)self setHasEverBeenInAWindow:1];
  }
}

- (void)setHasEverBeenInAWindow:(BOOL)a3
{
  self->_hasEverBeenInAWindow = a3;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  [(SBFolderView *)self _markListViewsAsPurged];
  v4.receiver = self;
  v4.super_class = (Class)SBFolderView;
  [(SBFolderView *)&v4 dealloc];
}

- (void)folderWillChange:(id)a3
{
  id v8 = a3;
  [v8 removeFolderObserver:self];
  unint64_t v4 = [v8 visibleListCount];
  unint64_t v5 = [(SBFolderView *)self iconListViewCount];
  if (v4 < v5)
  {
    unint64_t v6 = v5;
    do
    {
      objc_super v7 = [(SBFolderView *)self iconListViewAtIndex:v4];
      [(SBFolderView *)self _removeIconListView:v7];

      --v6;
    }
    while (v4 != v6);
  }
  [(SBFolderView *)self validateVisibleColumnRange];
}

- (void)folderDidChange
{
  id v14 = [(SBFolderView *)self folder];
  objc_super v3 = [v14 visibleLists];
  unint64_t v4 = [v3 count];
  unint64_t v5 = [(SBFolderView *)self iconListViews];
  unint64_t v6 = [v5 count];
  unint64_t v7 = v6;
  if (v4 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v4;
  }
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = [v3 objectAtIndex:i];
      long long v11 = [v5 objectAtIndex:i];
      [v11 setModel:v10];
    }
  }
  if (v4 > v7)
  {
    do
    {
      objc_super v12 = [v3 objectAtIndex:v8];
      uint64_t v13 = [(SBFolderView *)self _createIconListViewForList:v12];
      [(SBFolderView *)self _addIconListView:v13];

      ++v8;
    }
    while (v4 != v8);
  }
  [(SBFolderView *)self setNeedsLayout];
  [(SBFolderView *)self layoutIfNeeded];
  [(SBFolderView *)self updateIconListIndexAndVisibility:1];
  [(SBFolderView *)self _updateEditingStateAnimated:0];
  [v14 addFolderObserver:self];
}

- (void)setFolder:(id)a3
{
  unint64_t v5 = (SBFolder *)a3;
  if (self->_folder != v5)
  {
    unint64_t v6 = v5;
    [(SBFolderView *)self folderWillChange:v5];
    objc_storeStrong((id *)&self->_folder, a3);
    [(SBFolderView *)self folderDidChange];
    unint64_t v5 = v6;
  }
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  unint64_t v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    unint64_t v8 = [(SBFolderView *)self iconLocation];
    SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self->_listLayoutProvider, v7, v8, 1);
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__SBFolderView_setListLayoutProvider_animated___block_invoke;
    v9[3] = &unk_1E6AB5960;
    uint64_t v10 = v7;
    BOOL v11 = a4;
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:v9];
  }
}

uint64_t __47__SBFolderView_setListLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLayoutProvider:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

+ (Class)_scrollViewClass
{
  return (Class)self;
}

- (void)cancelScrolling
{
  objc_super v3 = [(SBFolderView *)self scrollView];
  [v3 cancelTouchTracking];

  [(SBFolderView *)self _updateScrollingIfNeeded];
}

- (void)_setPageControlDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  pageControlDisabledReasons = self->_pageControlDisabledReasons;
  id v8 = v6;
  if (v4)
  {
    [(NSMutableSet *)pageControlDisabledReasons addObject:v6];
LABEL_3:
    [(SBIconListPageControl *)self->_pageControl setUserInteractionEnabled:!v4];
    goto LABEL_6;
  }
  if ([(NSMutableSet *)pageControlDisabledReasons containsObject:v6])
  {
    [(NSMutableSet *)self->_pageControlDisabledReasons removeObject:v8];
    if (![(NSMutableSet *)self->_pageControlDisabledReasons count]) {
      goto LABEL_3;
    }
  }
LABEL_6:
}

- (BOOL)isScrollingDisabled
{
  return [(NSMutableSet *)self->_scrollingDisabledReasons count] != 0;
}

- (void)_setScrollingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  scrollingDisabledReasons = self->_scrollingDisabledReasons;
  if (v4)
  {
    [(NSMutableSet *)scrollingDisabledReasons addObject:v6];
    [(SBIconScrollView *)self->_scrollView setScrollEnabled:0];
    id v8 = SBLogIcon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "Disabling scrolling for reason: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = [(SBFolderView *)self scrollingDisabledGestureRecognizer];
    if (!v9)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_scrollingDisabledGestureDidUpdate_];
      [(SBFolderView *)self setScrollingDisabledGestureRecognizer:v9];
      [(SBIconScrollView *)self->_scrollView addGestureRecognizer:v9];
    }
LABEL_14:

    goto LABEL_15;
  }
  if ([(NSMutableSet *)scrollingDisabledReasons containsObject:v6])
  {
    uint64_t v10 = SBLogIcon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Removing reason to disable scrolling: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [(NSMutableSet *)self->_scrollingDisabledReasons removeObject:v6];
    if (![(NSMutableSet *)self->_scrollingDisabledReasons count])
    {
      BOOL v11 = SBLogIcon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Re-allowing scrolling after all reasons have gone away", (uint8_t *)&v12, 2u);
      }

      [(SBIconScrollView *)self->_scrollView setScrollEnabled:1];
      uint64_t v9 = [(SBFolderView *)self scrollingDisabledGestureRecognizer];
      if (v9)
      {
        [(SBIconScrollView *)self->_scrollView removeGestureRecognizer:v9];
        [(SBFolderView *)self setScrollingDisabledGestureRecognizer:0];
      }
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)scrollingDisabledGestureDidUpdate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a3 state] == 1)
  {
    BOOL v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = [(NSMutableSet *)self->_scrollingDisabledReasons allObjects];
      id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
      unint64_t v7 = [v6 componentsJoinedByString:@", "];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Scrolling is disabled for reasons: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)removeAssertion:(id)a3
{
  id v4 = a3;
  if (![v4 assertionType]) {
    [(SBFolderView *)self _removeDisableAutoScrollAssertion:v4];
  }
}

- (id)disableAutoScrollForReason:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_autoScrollDisabledAssertions)
  {
    unint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    autoScrollDisabledAssertions = self->_autoScrollDisabledAssertions;
    self->_autoScrollDisabledAssertions = v5;
  }
  unint64_t v7 = [SBFolderViewAssertion alloc];
  int v12 = @"reason";
  v13[0] = v4;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = [(SBFolderViewAssertion *)v7 initWithAssertionType:0 folderView:self extraInfo:v8];

  [(NSHashTable *)self->_autoScrollDisabledAssertions addObject:v9];
  uint64_t v10 = [(SBFolderView *)self scrollView];
  [v10 _setAutoScrollEnabled:0];

  return v9;
}

- (void)_removeDisableAutoScrollAssertion:(id)a3
{
  [(NSHashTable *)self->_autoScrollDisabledAssertions removeObject:a3];
  if (![(NSHashTable *)self->_autoScrollDisabledAssertions count])
  {
    id v4 = [(SBFolderView *)self scrollView];
    [v4 _setAutoScrollEnabled:1];
  }
}

- (int64_t)_adjustPageIndexFromPageControl:(int64_t)a3
{
  return a3;
}

- (BOOL)isPageControlHidden
{
  return [(SBIconListPageControl *)self->_pageControl isHidden];
}

- (void)setPageControlHidden:(BOOL)a3
{
}

- (double)pageControlAlpha
{
  [(SBIconListPageControl *)self->_pageControl alpha];
  return result;
}

- (void)setPageControlAlpha:(double)a3
{
}

- (void)setOrientation:(int64_t)a3
{
  int64_t orientation = self->_orientation;
  if (orientation != a3 && SBFInterfaceOrientationMaskContainsInterfaceOrientation())
  {
    self->_int64_t orientation = a3;
    [(SBFolderView *)self _orientationDidChange:orientation];
  }
}

- (void)_orientationDidChange:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SBFolderView *)self clearVisibleColumnRange];
  [(SBFolderView *)self setNeedsLayout];
  [(SBFolderView *)self layoutIfNeeded];
  int64_t v4 = [(SBFolderView *)self orientation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = [(SBFolderView *)self iconListViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 setOrientation:v4];
        [v10 layoutIconsNow];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(SBFolderView *)self updateVisibleColumnRange];
}

- (int64_t)scrollAnimationTargetPageIndex
{
  int64_t currentPageIndex = self->_currentPageIndex;
  int64_t v4 = self->_scrollView;
  if ([(SBIconScrollView *)v4 isScrollAnimating]
    && ([(SBIconScrollView *)v4 isTracking] & 1) == 0)
  {
    if ([(SBIconScrollView *)v4 isDecelerating]) {
      [(SBIconScrollView *)v4 _pageDecelerationTarget];
    }
    else {
      [(SBIconScrollView *)v4 lastAnimatedScrollContentOffset];
    }
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
    int64_t currentPageIndex = -[SBFolderView _pageIndexForOffset:](self, "_pageIndexForOffset:");
  }

  return currentPageIndex;
}

- (id)iconListModelForPageIndex:(int64_t)a3
{
  unint64_t v4 = [(SBFolderView *)self iconListModelIndexForPageIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(SBFolderView *)self folder];
    unint64_t v5 = [v7 listAtIndex:v6];
  }
  return v5;
}

- (unint64_t)leadingCustomPageIndexForPageIndex:(int64_t)a3
{
  if (-[SBFolderView typeForPage:](self, "typeForPage:")) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = [(SBFolderView *)self totalLeadingCustomPageCount];
  unint64_t v5 = a3 - [(SBFolderView *)self minimumPageIndex];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      if ([(SBFolderView *)self isLeadingCustomViewPageHiddenAtIndex:v8])
      {
        ++v5;
      }
      else if (++v9 >= v5)
      {
        return v5;
      }
      ++v8;
    }
    while (v7 != v8);
  }
  return v5;
}

- (unint64_t)trailingCustomPageIndexForPageIndex:(int64_t)a3
{
  if (-[SBFolderView typeForPage:](self, "typeForPage:") == 2) {
    return ~[(SBFolderView *)self lastIconPageIndex] + a3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)pageIndexForIconListModel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBFolderView *)self folder];
  uint64_t v6 = [v5 indexOfList:v4];

  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v7 = [(SBFolderView *)self pageIndexForIconListModelIndex:v6];
  }

  return v7;
}

- (int64_t)closestIconPageIndexForPageIndex:(int64_t)a3
{
  int64_t result = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:");
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t result = [(SBFolderView *)self firstIconPageIndex];
    if (result <= a3)
    {
      int64_t result = [(SBFolderView *)self lastIconPageIndex];
      if (result >= a3) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return result;
}

- (id)uniqueIdentifierForPageIndex:(int64_t)a3
{
  if (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:"))
  {
LABEL_6:
    int64_t v7 = 0;
    goto LABEL_10;
  }
  unint64_t v5 = [(SBFolderView *)self typeForPage:a3];
  if (v5)
  {
    if (v5 != 2)
    {
      if (v5 == 1)
      {
        uint64_t v6 = [(SBFolderView *)self iconListModelForPageIndex:a3];
        int64_t v7 = [v6 uniqueIdentifier];

        goto LABEL_10;
      }
      goto LABEL_6;
    }
    unint64_t v9 = [(SBFolderView *)self trailingCustomPageIndexForPageIndex:a3];
    objc_msgSend(NSString, "stringWithFormat:", @"SBFolderView-Trailing-%lu", v9);
  }
  else
  {
    unint64_t v8 = [(SBFolderView *)self leadingCustomPageIndexForPageIndex:a3];
    objc_msgSend(NSString, "stringWithFormat:", @"SBFolderView-Leading-%lu", v8);
  int64_t v7 = };
LABEL_10:
  return v7;
}

- (int64_t)pageIndexForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v7 = [v4 rangeOfString:@"SBFolderView-Leading-" options:8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = [v5 substringFromIndex:v7 + v8];
    uint64_t v14 = [v13 integerValue];

    int64_t v15 = [(SBFolderView *)self pageIndexForLeadingCustomPageIndex:v14];
LABEL_9:
    int64_t v6 = v15;
    goto LABEL_10;
  }
  uint64_t v9 = [v5 rangeOfString:@"SBFolderView-Trailing-" options:8];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = [v5 substringFromIndex:v9 + v10];
    uint64_t v17 = [v16 integerValue];

    int64_t v15 = [(SBFolderView *)self pageIndexForTrailingCustomPageIndex:v17];
    goto LABEL_9;
  }
  long long v11 = [(SBFolderView *)self folder];
  long long v12 = [v11 listWithIdentifier:v5];
  if (v12) {
    int64_t v6 = [(SBFolderView *)self pageIndexForIconListModel:v12];
  }

LABEL_10:
  return v6;
}

- (id)currentPageUniqueIdentifier
{
  int64_t v3 = [(SBFolderView *)self currentPageIndex];
  return [(SBFolderView *)self uniqueIdentifierForPageIndex:v3];
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  return [(SBFolderView *)self setCurrentPageIndex:a3 animated:a4 completion:0];
}

uint64_t __56__SBFolderView_setCurrentPageIndex_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentPageIndex:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t v6 = (void (**)(void))a4;
  if ([(SBFolderView *)self isScrollingDisabled]
    || [(SBFolderView *)self currentPageIndex] == a3
    && ![(SBFolderView *)self isScrolling])
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else if (UIAccessibilityIsReduceMotionEnabled())
  {
    [(SBFolderView *)self setCurrentPageIndex:a3 animated:0 completion:0];
    uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__SBFolderView_scrollUsingDecelerationAnimationToPageIndex_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E6AADF78;
    int64_t v15 = v6;
    [v7 transitionWithView:self duration:5242880 options:&__block_literal_global_84 animations:v14 completion:0.3];
  }
  else
  {
    [(SBFolderView *)self setScrollingUsingDecelerationAnimation:1];
    if (v6) {
      [(SBFolderView *)self _addScrollingCompletionBlock:v6];
    }
    [(SBFolderView *)self _willScrollToPageIndex:a3 animated:1];
    [(SBFolderView *)self _scrollOffsetForPageAtIndex:a3];
    double v9 = v8;
    double v11 = v10;
    [(SBFolderView *)self _ignoreScrollingDidEndNotifications];
    long long v12 = SBLogIcon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initiating programmatic scroll to page zero - animated: YES", buf, 0xCu);
    }
    -[SBIconScrollView _setContentOffsetWithDecelerationAnimation:](self->_scrollView, "_setContentOffsetWithDecelerationAnimation:", v9, v11);
    [(SBFolderView *)self _unignoreScrollingDidEndNotifications];
  }
}

uint64_t __82__SBFolderView_scrollUsingDecelerationAnimationToPageIndex_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)borrowScalingView
{
  self->_isScalingViewBorrowed = 1;
  return self->_scalingView;
}

- (void)returnScalingView
{
  self->_isScalingViewBorrowed = 0;
  [(SBFolderView *)self insertSubview:self->_scalingView atIndex:0];
  [(SBFolderView *)self _updateScalingViewFrame];
}

- (BOOL)locationCountsAsInsideFolder:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBFolderView *)self bounds];
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)setContentAlpha:(double)a3
{
  uint64_t v5 = [(SBFolderView *)self scrollView];
  [v5 setAlpha:a3];

  [(SBFolderView *)self setPageControlAlpha:a3];
}

- (void)_updateParallaxSettings
{
  if ([(SBFolderView *)self isParallaxEnabled])
  {
    BOOL v3 = [(SBFolderView *)self _useParallaxOnPageControl];
    id v4 = (double *)MEMORY[0x1E4FB3330];
    if (!v3) {
      id v4 = (double *)MEMORY[0x1E4FB3328];
    }
  }
  else
  {
    id v4 = (double *)MEMORY[0x1E4FB3328];
  }
  double v5 = *v4;
  pageControl = self->_pageControl;
  [(SBIconListPageControl *)pageControl _setVisualAltitude:v5];
}

- (void)_layoutSubviews
{
  id v4 = [(SBFolderView *)self scrollView];
  [(SBFolderView *)self bounds];
  objc_msgSend(v4, "setFrame:");
  BOOL v3 = [v4 superview];

  if (!v3) {
    [(SBFolderView *)self addSubview:v4];
  }
}

- (double)_offsetToCenterPageControlInSpaceForPageControl
{
  [(SBFolderView *)self pageControlAreaHeight];
  double v4 = v3;
  [(SBIconListPageControl *)self->_pageControl defaultHeight];
  v5.n128_f64[0] = (v4 - v5.n128_f64[0]) * 0.5;
  MEMORY[0x1F4166EC8](self, v5);
  return result;
}

- (double)pageControlAreaHeight
{
  [(UIPageControl *)self->_pageControl intrinsicContentSize];
  return v2;
}

- (void)_updatePageControlUserInterfaceStyle
{
  id v3 = [(SBFolderView *)self traitCollection];
  -[SBIconListPageControl setOverrideUserInterfaceStyle:](self->_pageControl, "setOverrideUserInterfaceStyle:", objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v3));
}

- (int64_t)lastIconPageIndex
{
  int64_t v3 = [(SBFolderView *)self maximumPageIndex];
  return v3 - [(SBFolderView *)self trailingCustomPageCount];
}

- (int64_t)nearestIconPageIndex
{
  unint64_t v3 = [(SBFolderView *)self currentPageType];
  int64_t v4 = [(SBFolderView *)self currentPageIndex];
  int64_t v5 = v4;
  if (v3 != 1)
  {
    int64_t v6 = v4 - 1;
    while (2)
    {
      ++v5;
      do
      {
        if (![(SBFolderView *)self _isValidPageIndex:v6]
          && ![(SBFolderView *)self _isValidPageIndex:v5])
        {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
        if ([(SBFolderView *)self _isValidPageIndex:v6])
        {
          if ([(SBFolderView *)self typeForPage:v6] == 1) {
            return v6;
          }
          --v6;
        }
      }
      while (![(SBFolderView *)self _isValidPageIndex:v5]);
      if ([(SBFolderView *)self typeForPage:v5] != 1) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)isLeadingCustomViewPageHidden
{
  return 0;
}

- (BOOL)isLeadingCustomViewPageHiddenAtIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)firstLeadingCustomPageIndex
{
  if (![(SBFolderView *)self leadingCustomPageCount]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBFolderView *)self minimumPageIndex];
}

- (int64_t)lastLeadingCustomPageIndex
{
  unint64_t v3 = [(SBFolderView *)self leadingCustomPageCount];
  if (v3) {
    return v3 + [(SBFolderView *)self minimumPageIndex] - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)pageIndexForLeadingCustomPageIndex:(unint64_t)a3
{
  if ([(SBFolderView *)self isLeadingCustomViewPageHidden]
    || [(SBFolderView *)self isLeadingCustomViewPageHiddenAtIndex:a3])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
      v6 += [(SBFolderView *)self isLeadingCustomViewPageHiddenAtIndex:v5++];
    while (a3 != v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (![(SBFolderView *)self leadingCustomPageCount]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 - v6 + [(SBFolderView *)self minimumPageIndex];
  }
}

- (int64_t)firstTrailingCustomPageIndex
{
  unint64_t v3 = [(SBFolderView *)self trailingCustomPageCount];
  if (v3) {
    return [(SBFolderView *)self maximumPageIndex] - v3 + 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)lastTrailingCustomPageIndex
{
  if (![(SBFolderView *)self trailingCustomPageCount]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBFolderView *)self maximumPageIndex];
}

- (int64_t)pageIndexForTrailingCustomPageIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBFolderView *)self trailingCustomPageCount];
  if (v5) {
    return a3 - v5 + [(SBFolderView *)self maximumPageIndex] + 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)leadingCustomPageCount
{
  return 0;
}

- (unint64_t)totalLeadingCustomPageCount
{
  return 0;
}

- (BOOL)_hasLeadingCustomPages
{
  return [(SBFolderView *)self leadingCustomPageCount] != 0;
}

- (unint64_t)trailingCustomPageCount
{
  return 0;
}

- (BOOL)_hasTrailingCustomPages
{
  return [(SBFolderView *)self trailingCustomPageCount] != 0;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageHeight:(double)a4
{
  int64_t v6 = a3 - [(SBFolderView *)self minimumPageIndex];
  [(SBFolderView *)self _pageSpacing];
  double v8 = (double)v6 * a4;
  BOOL v9 = v7 <= 0.0 || v6 <= 0;
  double v10 = v8 + (double)(v6 - 1) * v7;
  if (!v9) {
    double v8 = v10;
  }
  double v11 = 0.0;
  result.CGFloat y = v8;
  result.CGFloat x = v11;
  return result;
}

- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3
{
  if ([(SBFolderView *)self isVertical])
  {
    [(SBFolderView *)self _pageHeight];
    -[SBFolderView _scrollRangeForPageAtIndex:pageHeight:](self, "_scrollRangeForPageAtIndex:pageHeight:", a3);
  }
  else
  {
    [(SBFolderView *)self _pageWidth];
    -[SBFolderView _scrollRangeForPageAtIndex:pageWidth:](self, "_scrollRangeForPageAtIndex:pageWidth:", a3);
  }
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3 pageWidth:(double)a4
{
  [(SBFolderView *)self _scrollOffsetForContentAtPageIndex:a3];
  double v6 = a4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3 pageHeight:(double)a4
{
  [(SBFolderView *)self _scrollOffsetForContentAtPageIndex:a3];
  double v6 = v5;
  double v7 = a4;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageHeight:(double)a4
{
  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:");
  double v8 = v7;
  [(SBFolderView *)self _scrollOffsetForContentAtPageIndex:a3];
  double v10 = v9;
  double v11 = a4 - (v9 - v8);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)_showsTitle
{
  return 0;
}

- (double)_titleFontSize
{
  return 0.0;
}

- (void)_removeIconListView:(id)a3
{
}

- (void)_removeIconListView:(id)a3 purge:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (v4)
  {
    [v9 setPurged:1];
    [v9 setDragDelegate:0];
    [v9 removeAllIconViews];
  }
  double v6 = [v9 superview];
  double v7 = [(SBFolderView *)self scrollView];

  if (v6 == v7) {
    [v9 removeFromSuperview];
  }
  [(NSMutableArray *)self->_iconListViews removeObject:v9];
  [(SBFolderView *)self _updatePageControlNumberOfPages];
  [(SBFolderView *)self _didRemoveIconListView:v9];
  double v8 = [(SBFolderView *)self delegate];
  [v8 folderView:self didRemoveIconListView:v9];
}

- (void)_didRemoveIconListView:(id)a3
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

- (id)iconListViewWithList:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = self->_iconListViews;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "model", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)iconListViewDisplayingIconView:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__24;
  long long v15 = __Block_byref_object_dispose__24;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SBFolderView_iconListViewDisplayingIconView___block_invoke;
  v8[3] = &unk_1E6AB59F8;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(SBFolderView *)self enumerateIconListViewsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__SBFolderView_iconListViewDisplayingIconView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isDisplayingIconView:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (unint64_t)indexOfIconListView:(id)a3
{
  return [(NSMutableArray *)self->_iconListViews indexOfObjectIdenticalTo:a3];
}

- (void)enumerateIconListViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = self->_iconListViews;
  }
  else
  {
    uint64_t v7 = [(SBFolderView *)self allIconListViews];
  }
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__SBFolderView_enumerateIconListViewsWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E6AB5A20;
  id v11 = v6;
  id v9 = v6;
  [(NSMutableArray *)v8 enumerateObjectsWithOptions:2 * (v4 & 1) usingBlock:v10];
}

uint64_t __61__SBFolderView_enumerateIconListViewsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateScrollViewPageViewsUsingBlock:(id)a3
{
}

+ (NSString)defaultIconLocation
{
  return (NSString *)@"SBIconLocationNone";
}

- (void)updateIconListViews
{
  int64_t v3 = [(SBFolderView *)self currentPageIndex];
  [(SBFolderView *)self _updateIconListViews:v3];
}

- (void)_updateIconListViews:(int64_t)a3
{
  -[SBFolderView uniqueIdentifierForPageIndex:](self, "uniqueIdentifierForPageIndex:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBFolderView *)self _updateIconListViewsWithCurrentPageIndex:a3 currentPageUniqueIdentifier:v5];
}

- (void)_updateIconListViewsWithCurrentPageUniqueIdentifier:(id)a3
{
  id v4 = a3;
  [(SBFolderView *)self _updateIconListViewsWithCurrentPageIndex:[(SBFolderView *)self pageIndexForUniqueIdentifier:v4] currentPageUniqueIdentifier:v4];
}

- (void)_updateIconListViewsWithCurrentPageIndex:(int64_t)a3 currentPageUniqueIdentifier:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v33 = [(SBFolderView *)self typeForPage:a3];
  BOOL v7 = [(SBFolderView *)self includesHiddenIconListPages];
  BOOL v8 = [(SBFolderView *)self automaticallyCreatesIconListViews];
  id v9 = [(SBFolderView *)self iconListViewForPageIndex:a3];
  int v34 = [v9 isShowingAllIcons];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  folder = self->_folder;
  long long v36 = v9;
  uint64_t v37 = v6;
  int64_t v35 = a3;
  if (v7) {
    [(SBFolder *)folder lists];
  }
  else {
    [(SBFolder *)folder visibleLists];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v18 = [(SBFolderView *)self iconListViewWithList:v17];
        if (v18) {
          BOOL v19 = 0;
        }
        else {
          BOOL v19 = v8;
        }
        if (v19)
        {
          uint64_t v18 = [(SBFolderView *)self _createIconListViewForList:v17];
          uint64_t v20 = SBLogIcon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v17;
            _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_INFO, "adding new view for %@", buf, 0xCu);
          }

          [(SBFolderView *)self _addIconListView:v18 atEnd:0];
        }
        if (v18) {
          [v10 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v14);
  }

  uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_iconListViews];
  [v21 removeObjectsInArray:v10];
  if ([v21 count])
  {
    uint64_t v22 = SBLogIcon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v21;
      _os_log_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_INFO, "removing leftover views: %@", buf, 0xCu);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          [(SBFolderView *)self _removeIconListView:*(void *)(*((void *)&v38 + 1) + 8 * j)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v25);
    }
  }
  [(NSMutableArray *)self->_iconListViews setArray:v10];
  [(SBFolderView *)self clearVisibleColumnRange];
  [(SBFolderView *)self _updateIconListFrames];
  [(SBFolderView *)self _layoutSubviews];
  [(SBFolderView *)self _updatePageControlNumberOfPages];
  int64_t v28 = v35;
  if (v37) {
    int64_t v28 = [(SBFolderView *)self pageIndexForUniqueIdentifier:v37];
  }
  if ([(SBFolderView *)self _isValidPageIndex:v28])
  {
    if (v33 == 1
      && [(SBFolderView *)self iconListViewIndexForPageIndex:v28] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v29 = [(SBFolderView *)self firstIconPageIndex];
      int64_t v30 = [(SBFolderView *)self lastIconPageIndex];
      if (v28 >= v30) {
        int64_t v31 = v30;
      }
      else {
        int64_t v31 = v28;
      }
      if (v28 >= v29) {
        int64_t v28 = v31;
      }
      else {
        int64_t v28 = v29;
      }
    }
    [(SBFolderView *)self setCurrentPageIndex:v28 animated:0];
  }
  if (v34)
  {
    long long v32 = [(SBFolderView *)self iconListViewForPageIndex:v28];

    if (v32 == v36) {
      [v36 showAllIcons];
    }
  }
  [(SBFolderView *)self updateIconListIndexAndVisibility:1];
}

- (id)lastIconListView
{
  return (id)[(NSMutableArray *)self->_iconListViews lastObject];
}

- (id)iconListViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = [(SBFolderView *)self scrollView];
  -[SBFolderView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(SBFolderView *)self currentIconListView];
  id v12 = [(SBFolderView *)self currentIconListView];
  id v13 = v12;
  if (!v12 || ([v12 frame], v26.x = v8, v26.double y = v10, !CGRectContainsPoint(v28, v26)))
  {

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = self->_iconListViews;
    id v13 = (id)[(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v14);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (v17 != v11)
          {
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "frame", (void)v19);
            v27.double x = v8;
            v27.double y = v10;
            if (CGRectContainsPoint(v29, v27))
            {
              id v13 = v17;
              goto LABEL_14;
            }
          }
        }
        id v13 = (id)[(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v13;
}

- (id)iconListViewForTouch:(id)a3
{
  [a3 locationInView:self];
  return -[SBFolderView iconListViewAtPoint:](self, "iconListViewAtPoint:");
}

- (id)iconListViewForDrag:(id)a3
{
  [a3 locationInView:self];
  return -[SBFolderView iconListViewAtPoint:](self, "iconListViewAtPoint:");
}

- (id)iconListViewAtScrollPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_iconListViews;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "frame", (void)v11);
        v18.CGFloat x = x;
        v18.CGFloat y = y;
        if (CGRectContainsPoint(v19, v18))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)visibleIconListViews
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  [(SBFolderView *)self getLeadingVisiblePageIndex:&v9 trailingVisiblePageIndex:&v8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v9;
  if (v9 <= v8)
  {
    do
    {
      id v5 = [(SBFolderView *)self iconListViewForPageIndex:v4];
      if (v5) {
        [v3 addObject:v5];
      }
    }
    while (v4++ < v8);
  }
  return (NSArray *)v3;
}

- (void)setIncludesHiddenIconListPages:(BOOL)a3
{
  if (self->_includesHiddenIconListPages != a3)
  {
    id v5 = [(SBFolderView *)self currentPageUniqueIdentifier];
    self->_includesHiddenIconListPages = a3;
    [(SBFolderView *)self _updateIconListViewsWithCurrentPageUniqueIdentifier:v5];
  }
}

- (void)setAutomaticallyCreatesIconListViews:(BOOL)a3
{
  if (self->_automaticallyCreatesIconListViews != a3)
  {
    self->_automaticallyCreatesIconListViews = a3;
    [(SBFolderView *)self setNeedsLayout];
  }
}

- (double)scrollingDimensionForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(SBFolderView *)self isVertical]) {
    return y;
  }
  else {
    return x;
  }
}

- (CGPoint)pointForScrollingDimension:(double)a3
{
  BOOL v4 = [(SBFolderView *)self isVertical];
  double v5 = 0.0;
  if (v4) {
    double v6 = 0.0;
  }
  else {
    double v6 = a3;
  }
  if (v4) {
    double v5 = a3;
  }
  result.double y = v5;
  result.double x = v6;
  return result;
}

- (void)prefetchNextVisibleColumn
{
  int64_t v3 = [(SBFolderView *)self scrollView];
  int v4 = [v3 isDragging];

  if (v4)
  {
    unsigned int v5 = [(SBFolderView *)self userInterfaceLayoutDirectionAwareScrollingDirection];
    unsigned int v6 = v5;
    if (v5 != self->_prefetchedColumnDirection)
    {
      self->_prefetchedColumnRange.startIconListIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
      self->_prefetchedColumnDirection = v5;
    }
    p_prefetchedColumnRange = &self->_prefetchedColumnRange;
    if (self->_prefetchedColumnRange.startIconListIndex == 0x7FFFFFFFFFFFFFFFLL
      || (long long v8 = *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex,
          long long v30 = *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex,
          long long v31 = v8,
          long long v9 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex,
          v29[0] = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex,
          v29[1] = v9,
          SBVisibleColumnRangeContainsVisibleColumnRange(&v30, v29)))
    {
      if (v6 != 2)
      {
        if (!v6)
        {
          unint64_t v10 = [(SBFolderView *)self columnCountForPageIndex:self->_userVisibleColumnRange.startIconListIndex];
          uint64_t v11 = [(SBFolderView *)self iconListViewCount];
          unint64_t v28 = 0;
          *(void *)&v29[0] = 0;
          long long v12 = *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex;
          long long v30 = *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex;
          long long v31 = v12;
          if (SBVisibleColumnRangeGetPreviousColumn((unint64_t *)&v30, v10, v11, v29, &v28))
          {
            unint64_t v14 = v28;
            uint64_t v13 = *(void *)&v29[0];
            self->_prefetchedColumnRange.endIconListIndedouble x = *(void *)&v29[0];
            self->_prefetchedColumnRange.endColumnIndedouble x = v14;
            self->_prefetchedColumnRange.startColumnIndedouble x = v14;
          }
          else
          {
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          p_prefetchedColumnRange->startIconListIndedouble x = v13;
        }
        goto LABEL_20;
      }
      unint64_t v21 = [(SBFolderView *)self columnCountForPageIndex:self->_userVisibleColumnRange.endIconListIndex];
      unint64_t v22 = [(SBFolderView *)self iconListViewCount];
      unint64_t v28 = 0;
      *(void *)&v29[0] = 0;
      long long v23 = *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex;
      long long v30 = *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex;
      long long v31 = v23;
      if (SBVisibleColumnRangeGetNextColumn((unint64_t *)&v30, v21, v22, (unint64_t *)v29, &v28))
      {
        unint64_t v20 = v28;
        unint64_t v19 = *(void *)&v29[0];
        self->_prefetchedColumnRange.endIconListIndedouble x = *(void *)&v29[0];
        self->_prefetchedColumnRange.endColumnIndedouble x = v20;
        goto LABEL_17;
      }
    }
    else
    {
      long long v15 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
      long long v30 = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex;
      long long v31 = v15;
      if ([(SBFolderView *)self columnCountInVisibleColumnRange:&v30] <= 3)
      {
        if (v6 == 2)
        {
          unint64_t v24 = [(SBFolderView *)self columnOrRowCountForScrollingForPageIndex:self->_prefetchedColumnRange.endIconListIndex];
          unint64_t v25 = [(SBFolderView *)self iconListViewCount];
          unint64_t v28 = 0;
          *(void *)&v29[0] = 0;
          long long v26 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
          long long v30 = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex;
          long long v31 = v26;
          if (SBVisibleColumnRangeGetNextColumn((unint64_t *)&v30, v24, v25, (unint64_t *)v29, &v28))
          {
            unint64_t v27 = v28;
            self->_prefetchedColumnRange.endIconListIndedouble x = *(void *)&v29[0];
            self->_prefetchedColumnRange.endColumnIndedouble x = v27;
          }
          goto LABEL_20;
        }
        if (!v6)
        {
          unint64_t v16 = [(SBFolderView *)self columnOrRowCountForScrollingForPageIndex:self->_userVisibleColumnRange.startIconListIndex];
          uint64_t v17 = [(SBFolderView *)self iconListViewCount];
          unint64_t v28 = 0;
          *(void *)&v29[0] = 0;
          long long v18 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
          long long v30 = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex;
          long long v31 = v18;
          if (SBVisibleColumnRangeGetPreviousColumn((unint64_t *)&v30, v16, v17, v29, &v28))
          {
            unint64_t v20 = v28;
            unint64_t v19 = *(void *)&v29[0];
LABEL_17:
            p_prefetchedColumnRange->startIconListIndedouble x = v19;
            self->_prefetchedColumnRange.startColumnIndedouble x = v20;
          }
        }
      }
    }
LABEL_20:
    [(SBFolderView *)self updateVisibleColumnRange];
  }
}

- (unint64_t)columnCountForPageIndex:(int64_t)a3
{
  unint64_t v4 = [(SBFolderView *)self iconListModelIndexForPageIndex:a3];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(SBFolderView *)self folder];
    long long v8 = [v7 listAtIndex:v6];
    unint64_t v5 = (unsigned __int16)[v8 gridSize];
  }
  return v5;
}

- (unint64_t)columnOrRowCountForScrollingForPageIndex:(int64_t)a3
{
  unint64_t v4 = [(SBFolderView *)self iconListModelIndexForPageIndex:a3];
  BOOL v5 = [(SBFolderView *)self isVertical];
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = v5;
    long long v8 = [(SBFolderView *)self folder];
    long long v9 = [v8 listAtIndex:v4];
    unsigned int v10 = [v9 gridSize];
    if (v7) {
      unint64_t v6 = HIWORD(v10);
    }
    else {
      unint64_t v6 = (unsigned __int16)v10;
    }
  }
  return v6;
}

- (unint64_t)columnCountInVisibleColumnRange:(SBVisibleColumnRange *)a3
{
  startIconListIndedouble x = a3->startIconListIndex;
  if (startIconListIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (startIconListIndex == a3->endIconListIndex) {
    return a3->endColumnIndex - a3->startColumnIndex + 1;
  }
  if (-[SBFolderView columnCountForPageIndex:](self, "columnCountForPageIndex:") == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = -a3->startColumnIndex;
  }
  unint64_t v5 = a3->endColumnIndex + v7;
  for (unint64_t i = a3->startIconListIndex + 1; i < a3->endIconListIndex; ++i)
    v5 += [(SBFolderView *)self columnCountForPageIndex:i];
  return v5;
}

- (id)iconVisibilityDescription
{
  int64_t v3 = NSString;
  long long v4 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  long long v10 = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  long long v11 = v4;
  unint64_t v5 = SBStringFromVisibleColumnRange(&v10);
  long long v6 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
  long long v10 = *(_OWORD *)&self->_prefetchedColumnRange.startIconListIndex;
  long long v11 = v6;
  unint64_t v7 = SBStringFromVisibleColumnRange(&v10);
  long long v8 = [v3 stringWithFormat:@"Visible column range: %@, prefetched column range: %@", v5, v7];

  return v8;
}

- (void)_markListViewsAsPurged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = self->_iconListViews;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setPurged:", 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_shouldIgnoreScrollingDidEndNotifications
{
  return self->_ignoreScrollingDidEndNotificationsCount != 0;
}

- (void)addScrollViewIsScrollingOverrideReason:(id)a3
{
  id v4 = a3;
  scrollViewIsScrollingOverrides = self->_scrollViewIsScrollingOverrides;
  id v8 = v4;
  if (!scrollViewIsScrollingOverrides)
  {
    uint64_t v6 = (NSMutableSet *)objc_opt_new();
    long long v7 = self->_scrollViewIsScrollingOverrides;
    self->_scrollViewIsScrollingOverrides = v6;

    id v4 = v8;
    scrollViewIsScrollingOverrides = self->_scrollViewIsScrollingOverrides;
  }
  [(NSMutableSet *)scrollViewIsScrollingOverrides addObject:v4];
  [(SBFolderView *)self _checkIfScrollStateChanged];
}

- (void)removeScrollViewIsScrollingOverrideReason:(id)a3
{
  [(NSMutableSet *)self->_scrollViewIsScrollingOverrides removeObject:a3];
  [(SBFolderView *)self _checkIfScrollStateChanged];
}

uint64_t __38__SBFolderView__updateScrollingState___block_invoke_82(uint64_t a1, void *a2)
{
  return [a2 setVisiblySettled:1];
}

- (void)setIconImageCache:(id)a3
{
  uint64_t v5 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__SBFolderView_setIconImageCache___block_invoke;
    v6[3] = &unk_1E6AADAE0;
    long long v7 = v5;
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:v6];
  }
}

uint64_t __34__SBFolderView_setIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIconImageCache:*(void *)(a1 + 32)];
}

- (void)setFolderIconImageCache:(id)a3
{
  uint64_t v5 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SBFolderView_setFolderIconImageCache___block_invoke;
    v6[3] = &unk_1E6AADAE0;
    long long v7 = v5;
    [(SBFolderView *)self enumerateIconListViewsUsingBlock:v6];
  }
}

uint64_t __40__SBFolderView_setFolderIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFolderIconImageCache:*(void *)(a1 + 32)];
}

- (BOOL)_shouldUseScrollableIconViewInteraction
{
  return 0;
}

- (UIEdgeInsets)_scrollingInteractionVisibleInsets
{
  [(SBIconScrollView *)self->_scrollView adjustedContentInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updateScrollingInteractionIsScrolling:(BOOL)a3
{
}

- (void)_scrollingInteractionScrollViewDidScroll:(id)a3
{
}

- (void)_enumerateScrollableIconViewsUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, void *, unsigned char *))a3;
  double v5 = [(SBFolderView *)self currentIconListView];
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend(v5, "icons", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [v5 displayedIconViewForIcon:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v11)
        {
          v4[2](v4, v11, &v16);
          if (v16)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  long long v10 = [[SBHIconLayoutHidingCompoundAssertion alloc] initWithInvalidationHandler:self icons:v9 reason:v8 options:a5];

  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    long long v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    long long v13 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v12;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  [(NSHashTable *)layoutHidingAssertions addObject:v10];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__SBFolderView_beginHidingIconsFromLayout_reason_options___block_invoke;
  v16[3] = &unk_1E6AADAE0;
  long long v14 = v10;
  uint64_t v17 = v14;
  [(SBFolderView *)self enumerateIconListViewsUsingBlock:v16];

  return v14;
}

uint64_t __58__SBFolderView_beginHidingIconsFromLayout_reason_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAssertionFromChild:a2];
}

- (void)layoutHidingCompoundAssertionDidInvalidate:(id)a3
{
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBFolderView *)self iconListViewForPageIndex:[(SBFolderView *)self currentPageIndex]];
  double v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (void)transitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(SBFolderView *)self _window];
  uint64_t v7 = [v6 _toWindowOrientation];
  if ([(SBFolderView *)self orientation] != v7)
  {
    [(SBFolderView *)self setRotating:1];
    [(SBFolderView *)self willTransitionAnimated:1 withSettings:0];
    if ([(SBFolderView *)self _animatesRotationForAllVisibleIconListViews])
    {
      [(SBFolderView *)self minimumVisibleScrollOffset];
      double v9 = v8;
      [(SBFolderView *)self maximumVisibleScrollOffset];
      double v11 = v10;
      long long v12 = [(SBFolderView *)self currentIconListView];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v13 = [(SBFolderView *)self iconListViews];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        double v16 = v11 - v9;
        uint64_t v17 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v13);
            }
            unint64_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            [v19 frame];
            CGFloat x = v46.origin.x;
            CGFloat y = v46.origin.y;
            CGFloat width = v46.size.width;
            CGFloat height = v46.size.height;
            double MinX = CGRectGetMinX(v46);
            v47.origin.CGFloat x = x;
            v47.origin.CGFloat y = y;
            v47.size.CGFloat width = width;
            v47.size.CGFloat height = height;
            double v25 = CGRectGetWidth(v47);
            double v26 = SBHIntersectionFloatRange(MinX, v25, v9, v16);
            if (v27 <= 0.0)
            {
              if (v19 != v12) {
                objc_msgSend(v19, "setHidden:", 1, v26);
              }
            }
            else
            {
              objc_msgSend(v19, "willRotateWithTransitionCoordinator:", v5, v26);
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v15);
      }
    }
    else
    {
      long long v12 = [(SBFolderView *)self currentIconListView];
      [v12 willRotateWithTransitionCoordinator:v5];
      long long v38 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
      long long v13 = [(SBFolderView *)self iconListViews];
      uint64_t v28 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v36 != v30) {
              objc_enumerationMutation(v13);
            }
            long long v32 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (v32 != v12) {
              [v32 setHidden:1];
            }
          }
          uint64_t v29 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v29);
      }
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke;
    v34[3] = &unk_1E6AAEFB0;
    v34[4] = self;
    v34[5] = v7;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke_2;
    v33[3] = &unk_1E6AACFA8;
    v33[4] = self;
    [v5 animateAlongsideTransition:v34 completion:v33];
  }
}

uint64_t __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateIconListFrames];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setOrientation:v3];
}

void __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRotating:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) iconListViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v6++) setHidden:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) cancelScrolling];
  [*(id *)(a1 + 32) resetContentOffsetToCurrentPageAnimated:1];
  [*(id *)(a1 + 32) didTransitionAnimated:1];
  uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 680) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 680);
  *(void *)(v8 + 680) = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)_animatesRotationForAllVisibleIconListViews
{
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_scrollView == a3)
  {
    uint64_t v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning user-initiated scroll", (uint8_t *)&v6, 0xCu);
    }
    [(SBFolderView *)self _checkIfScrollStateChanged];
    self->_unint64_t scrollFrameCount = 0;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_scrollView == a3)
  {
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:", a5->x, a5->y);
    int64_t v6 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 1, 0);
    [(SBFolderView *)self _updatePageControlToIndex:v6];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_scrollView == a3)
  {
    BOOL v4 = a4;
    int64_t v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 1024;
      BOOL v11 = v4;
      id v7 = v9;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ending user-initiated scroll - willDecelerate: %{BOOL}u", (uint8_t *)&v8, 0x12u);
    }
    if (!v4) {
      [(SBFolderView *)self _checkIfScrollStateChanged];
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_scrollView == a3)
  {
    BOOL v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ending deceleration of user-initiated scroll", (uint8_t *)&v6, 0xCu);
    }
    [(SBFolderView *)self _checkIfScrollStateChanged];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_scrollView == a3)
  {
    BOOL v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v6 = 138543362;
      *(void *)&void v6[4] = objc_opt_class();
      id v5 = *(id *)&v6[4];
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ending programmatic scroll animation", v6, 0xCu);
    }
    if (![(SBFolderView *)self _shouldIgnoreScrollingDidEndNotifications]) {
      [(SBFolderView *)self _checkIfScrollStateChanged];
    }
    -[SBFolderView setScrollingUsingDecelerationAnimation:](self, "setScrollingUsingDecelerationAnimation:", 0, *(_OWORD *)v6);
  }
}

- (BOOL)iconScrollView:(id)a3 shouldSetAutoscrollContentOffset:(CGPoint)a4
{
  return [(SBFolderView *)self contentVisibility] == 0;
}

- (void)pageControl:(id)a3 didMoveCurrentPageToPage:(int64_t)a4 withScrubbing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int64_t v9 = [(SBFolderView *)self _adjustPageIndexFromPageControl:a4];
  int64_t v10 = [(SBFolderView *)self scrollAnimationTargetPageIndex];
  int64_t v11 = [(SBFolderView *)self minimumPageIndex];
  int64_t v12 = v10 - 1;
  if (v11 + v9 >= v10) {
    int64_t v12 = v10 + 1;
  }
  if (v5) {
    int64_t v13 = v11 + v9;
  }
  else {
    int64_t v13 = v12;
  }
  if (v5)
  {
    uint64_t v14 = +[SBHHomeScreenDomain rootSettings];
    long long v15 = [v14 folderSettings];
    uint64_t v16 = [v15 animatesPageScrubbing];
  }
  else
  {
    uint64_t v16 = 1;
  }
  objc_initWeak(&location, self);
  [(SBFolderView *)self _disableUserInteractionBeforeSignificantAnimation];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__SBFolderView_pageControl_didMoveCurrentPageToPage_withScrubbing___block_invoke;
  v17[3] = &unk_1E6AB0278;
  objc_copyWeak(&v18, &location);
  [(SBFolderView *)self setCurrentPageIndex:v13 animated:v16 completion:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __67__SBFolderView_pageControl_didMoveCurrentPageToPage_withScrubbing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enableUserInteractionAfterSignificantAnimation];
}

- (id)highlightingViewForPageControl:(id)a3
{
  return 0;
}

- (void)_setFolderName:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  int v6 = [v4 whitespaceCharacterSet];
  id v11 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v11 length])
  {
    uint64_t v7 = [(SBFolderView *)self folder];
    [v7 setDisplayName:v11];

    [(SBFolderTitleTextField *)self->_titleTextField setText:v11];
  }
  else
  {
    titleTextField = self->_titleTextField;
    int64_t v9 = [(SBFolderView *)self folder];
    int64_t v10 = [v9 displayName];
    [(SBFolderTitleTextField *)titleTextField setText:v10];
  }
  [(SBFolderView *)self setNeedsLayout];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  BOOL v4 = [(SBFolderView *)self isEditing];
  if (v4)
  {
    id v5 = [(SBFolderView *)self folder];
    char v6 = [v5 canEditDisplayName];

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 folderView:self didBeginEditingTitle:v5];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v6 = a3;
  BOOL v4 = [v6 text];
  [(SBFolderView *)self _setFolderName:v4];

  id v5 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 folderView:self didEndEditingTitle:v6];
  }
}

- (id)iconListView:(id)a3 animatorForLayingOutIconView:(id)a4 proposedAnimator:(id)a5
{
  id v7 = a5;
  id v8 = [a4 icon];
  int64_t v9 = (SBIconListViewSlideInAnimator *)v7;
  int64_t v10 = v9;
  if ([(NSMutableSet *)self->_iconsNeedingSlideInAnimator containsObject:v8])
  {
    int64_t v10 = objc_alloc_init(SBIconListViewSlideInAnimator);

    [(NSMutableSet *)self->_iconsNeedingSlideInAnimator removeObject:v8];
  }

  return v10;
}

- (void)iconListViewDidLayoutIcons:(id)a3
{
  iconsNeedingSlideInAnimator = self->_iconsNeedingSlideInAnimator;
  self->_iconsNeedingSlideInAnimator = 0;
}

- (id)iconListView:(id)a3 animatorForRemovingIcons:(id)a4 proposedAnimator:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int64_t v10 = [v7 displayedModel];
  id v11 = [v10 folder];
  uint64_t v29 = [v11 indexPathForList:v10];
  int v12 = [v11 isExtraList:v10];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v26 = v10;
    id v27 = v9;
    id v28 = v7;
    long long v15 = 0;
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(v18, "isPlaceholder", v26, v27, v28) & 1) == 0)
        {
          long long v19 = [v11 indexPathForIcon:v18];
          id v31 = 0;
          long long v20 = [v11 folderContainingIndexPath:v19 relativeIndexPath:&v31];
          id v21 = v31;
          int v22 = objc_msgSend(v20, "isExtraListIndex:", objc_msgSend(v21, "sbListIndex"));
          if (v19) {
            BOOL v23 = v20 == v11;
          }
          else {
            BOOL v23 = 0;
          }
          if (!v23 || ((v12 ^ v22) & 1) != 0)
          {

            id v9 = v27;
            id v7 = v28;
            int64_t v10 = v26;
            goto LABEL_22;
          }
          if (!v15) {
            long long v15 = objc_alloc_init(SBIconListViewClusterAnimator);
          }
          -[SBIconListViewClusterAnimator setRemovalDirection:forIcon:](v15, "setRemovalDirection:forIcon:", [v19 sbListIndex] < (unint64_t)objc_msgSend(v29, "sbListIndex"), v18);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }

    if (v15)
    {
      long long v15 = v15;
      unint64_t v24 = v15;
      id v9 = v27;
      id v7 = v28;
      int64_t v10 = v26;
      goto LABEL_24;
    }
    id v9 = v27;
    id v7 = v28;
    int64_t v10 = v26;
  }
  else
  {
    long long v15 = 0;
LABEL_22:
  }
  unint64_t v24 = (SBIconListViewClusterAnimator *)v9;
LABEL_24:

  return v24;
}

- (int64_t)iconRemovalAnimationDestinationEdgeForIconListView:(id)a3
{
  return [(SBFolderView *)self isVertical];
}

- (int64_t)iconInsertionAnimationOriginatingEdgeForIconListView:(id)a3
{
  return [(SBFolderView *)self isVertical];
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    char v9 = [v8 folderView:self iconListView:v6 canHandleIconDropSession:v7];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderView:self iconListView:v8 iconDropSessionDidEnter:v6];
  }
}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderView *)self _dragDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v8 folderView:self iconListView:v6 iconDropSessionDidUpdate:v7],
        (char v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderView:self iconListView:v8 iconDropSessionDidExit:v6];
  }
}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderView:self iconListView:v8 performIconDrop:v6];
  }
}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBFolderView *)self _dragDelegate];
  int v12 = v10;
  if (objc_opt_respondsToSelector())
  {
    int v12 = [v11 folderView:self iconListView:v8 iconViewForDroppingIconDragItem:v9 proposedIconView:v10];
  }
  return v12;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v10 folderView:self iconListView:v11 willUseIconView:v8 forDroppingIconDragItem:v9];
  }
}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBFolderView *)self _dragDelegate];
  int v12 = v10;
  if (objc_opt_respondsToSelector())
  {
    int v12 = [v11 folderView:self iconListView:v8 previewForDroppingIconDragItem:v9 proposedPreview:v10];
  }
  return v12;
}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v10 folderView:self iconListView:v11 iconDragItem:v8 willAnimateDropWithAnimator:v9];
  }
}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    char v12 = [v11 folderView:self iconListView:v8 shouldAllowSpringLoadedInteractionForIconDropSession:v9 onIconView:v10];
  }
  else {
    char v12 = 0;
  }

  return v12;
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 folderView:self iconListView:v8 springLoadedInteractionForIconDragDidCompleteOnIconView:v6];
  }
}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderView *)self _dragDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 folderView:self iconListView:v6 customSpringAnimationBehaviorForDroppingItem:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 indexOfList:v7];
  int64_t v9 = [(SBFolderView *)self currentPageIndex];
  unint64_t v10 = [(SBFolderView *)self iconListModelIndexForPageIndex:v9];
  id v11 = SBLogIcon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138413058;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    unint64_t v17 = v8;
    __int16 v18 = 2048;
    int64_t v19 = v9;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "%@ --> %@; indeCGFloat x = %lu; currentPage: %li",
      (uint8_t *)&v12,
      0x2Au);
  }

  if (v10 != 0x7FFFFFFFFFFFFFFFLL
    && v8 <= v10
    && (![v7 isHidden]
     || [(SBFolderView *)self includesHiddenIconListPages]))
  {
    ++v9;
  }
  [(SBFolderView *)self _noteFolderListsDidChange:v9];
}

- (void)folder:(id)a3 willRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(SBFolderView *)self currentPageIndex];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke;
  v34[3] = &unk_1E6AB5AB0;
  v34[4] = self;
  v34[5] = v11;
  int v12 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v34);
  uint64_t v13 = [v8 lastVisibleListIndex];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_2;
  v31[3] = &unk_1E6AB5AB0;
  id v14 = v8;
  id v32 = v14;
  uint64_t v33 = v13;
  int v15 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v31);
  if (v12 && v15)
  {
    uint64_t v25 = 0;
    double v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__24;
    uint64_t v29 = __Block_byref_object_dispose__24;
    id v30 = 0;
    __int16 v16 = [v14 lists];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_3;
    int v22 = &unk_1E6AAF210;
    id v23 = v9;
    unint64_t v24 = &v25;
    [v16 enumerateObjectsWithOptions:2 usingBlock:&v19];

    if (!v26[5]
      || (int64_t v17 = -[SBFolderView pageIndexForIconListModel:](self, "pageIndexForIconListModel:", v19, v20, v21, v22),
          v17 == 0x7FFFFFFFFFFFFFFFLL))
    {
      int64_t v17 = [(SBFolderView *)self firstIconPageIndex];
    }
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v18 = 0;
    }
    else {
      int64_t v18 = v11 - v17;
    }
    [(SBFolderView *)self setExtraPageCountDuringScrolling:v18];
    [(SBFolderView *)self setCurrentPageIndex:v17 animated:1];

    _Block_object_dispose(&v25, 8);
  }
}

BOOL __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) pageIndexForIconListModel:a2] == *(void *)(a1 + 40);
}

BOOL __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexOfList:a2] == *(void *)(a1 + 40);
}

void __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isHidden] & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = SBLogIcon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "%@ --> %@; indexes = %@", (uint8_t *)&v12, 0x20u);
  }

  [(SBFolderView *)self _noteFolderListsDidChange:[(SBFolderView *)self currentPageIndex]];
}

- (void)folder:(id)a3 listHiddenWillChange:(id)a4
{
  if ((objc_msgSend(a4, "isHidden", a3) & 1) == 0)
  {
    int64_t v5 = [(SBFolderView *)self currentPageIndex];
    if (v5 == [(SBFolderView *)self lastIconPageIndex])
    {
      int64_t v6 = v5 - 1;
      int64_t v7 = [(SBFolderView *)self firstIconPageIndex];
      if (v6 <= v7) {
        int64_t v8 = v7;
      }
      else {
        int64_t v8 = v6;
      }
      [(SBFolderView *)self setCurrentPageIndex:v8 animated:0];
    }
  }
}

- (void)folderDisplayNameDidChange:(id)a3
{
  id v4 = [a3 displayName];
  [(SBFolderView *)self _setFolderName:v4];
}

- (void)folder:(id)a3 willRestoreOverflowIcon:(id)a4 toList:(id)a5
{
  id v13 = a4;
  int64_t v7 = [(SBFolderView *)self iconListViewWithList:a5];
  int64_t v8 = [v7 visibleGridCellIndexes];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    iconsNeedingSlideInAnimator = self->_iconsNeedingSlideInAnimator;
    if (!iconsNeedingSlideInAnimator)
    {
      int64_t v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      int v12 = self->_iconsNeedingSlideInAnimator;
      self->_iconsNeedingSlideInAnimator = v11;

      iconsNeedingSlideInAnimator = self->_iconsNeedingSlideInAnimator;
    }
    [(NSMutableSet *)iconsNeedingSlideInAnimator addObject:v13];
  }
}

- (id)_legibilitySettingsWithPrimaryColor:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBFolderView *)self legibilitySettings];
  id v6 = objc_alloc(MEMORY[0x1E4FB21E0]);
  uint64_t v7 = [v5 style];
  int64_t v8 = [v5 secondaryColor];
  uint64_t v9 = [v5 shadowColor];
  id v10 = (void *)[v6 initWithStyle:v7 primaryColor:v4 secondaryColor:v8 shadowColor:v9];

  return v10;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBFolderView *)self _updateTitleLegibilitySettings];
    [(SBFolderView *)self _updateIconListLegibilitySettings];
  }
}

- (id)accessibilityTintColorForRect:(CGRect)a3 tintStyle:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v11 = objc_msgSend(v10, "folderView:accessibilityTintColorForRect:", self, x, y, width, height);
  }
  else
  {
    int64_t v11 = 0;
  }
  int v12 = SBHomeAccessibilityTintColor(a4, v11);

  return v12;
}

- (id)accessibilityLegibilitySettingsForRect:(CGRect)a3 tintStyle:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(SBFolderView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v11 = objc_msgSend(v10, "folderView:accessibilityTintColorForRect:", self, x, y, width, height);
  }
  else
  {
    int64_t v11 = 0;
  }
  int v12 = SBHomeAccessibilityTintLegibiliitySettings(a4, v11);

  return v12;
}

- (NSString)description
{
  return (NSString *)[(SBFolderView *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBFolderView *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)_dragDelegate
{
  id v3 = [(SBFolderView *)self delegate];
  id v4 = v3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 draggingDelegateForFolderView:self];
  }
  return v4;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setAddsFocusGuidesForWrapping:(BOOL)a3
{
  self->_addsFocusGuidesForWrapping = a3;
}

- (void)setScrollingUsingDecelerationAnimation:(BOOL)a3
{
  self->_scrollingUsingDecelerationAnimation = a3;
}

- (UIPanGestureRecognizer)scrollingDisabledGestureRecognizer
{
  return self->_scrollingDisabledGestureRecognizer;
}

- (void)setScrollingDisabledGestureRecognizer:(id)a3
{
}

- (void)setExtraPageCountDuringScrolling:(unint64_t)a3
{
  self->_extraPageCountDuringScrolling = a3;
}

- (void)setPageControl:(id)a3
{
}

- (unint64_t)currentPageType
{
  return self->_currentPageType;
}

- (BOOL)automaticallyCreatesIconListViews
{
  return self->_automaticallyCreatesIconListViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollingDisabledGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconsNeedingSlideInAnimator, 0);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_rotationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_scrollCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_scrollFrames, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_autoScrollDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_parallaxDisabledReasons, 0);
  objc_storeStrong((id *)&self->_scrollViewIsScrollingOverrides, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageControlDisabledReasons, 0);
  objc_storeStrong((id *)&self->_scrollingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_iconListViews, 0);
}

void __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "Telling page at index %lu to hide all icons", (uint8_t *)&v2, 0xCu);
}

void __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "Telling page at index %lu to show all icons", (uint8_t *)&v2, 0xCu);
}

@end