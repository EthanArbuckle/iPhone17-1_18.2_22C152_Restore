@interface PXUIScrollViewController
- (BOOL)adjustsContentInsetWhenScrollDisabled;
- (BOOL)allowsKeyboardScrolling;
- (BOOL)alwaysBounceHorizontal;
- (BOOL)alwaysBounceVertical;
- (BOOL)clipsToBounds;
- (BOOL)deferContentOffsetUpdates;
- (BOOL)hasWindow;
- (BOOL)ignoresSafeAreaInsets;
- (BOOL)isBouncing;
- (BOOL)isDecelerating;
- (BOOL)isDragging;
- (BOOL)isFloatingSublayer:(id)a3;
- (BOOL)isInterruptingScrollWithDirection:(CGPoint *)a3;
- (BOOL)isScrollEnabled;
- (BOOL)isScrolledAtEdge:(unsigned int)a3 tolerance:(double)a4;
- (BOOL)isScrollingToTop;
- (BOOL)isScrubbing;
- (BOOL)isSubview:(id)a3;
- (BOOL)isTracking;
- (BOOL)respectsContentZOrder;
- (BOOL)scrollView:(id)a3 shouldBeginScrollingWithPanAtLocation:(CGPoint)a4 velocity:(CGPoint)a5;
- (BOOL)scrollViewIsAnimatingScroll;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3;
- (CGRect)scrollViewActiveRect;
- (CGRect)scrollViewConstrainedVisibleRect;
- (CGRect)scrollViewContentBounds;
- (CGRect)scrollViewTargetRect;
- (CGRect)scrollViewVisibleRect;
- (CGRect)scrollViewVisibleRectOutsideBounds;
- (CGSize)scrollViewContentSize;
- (CGSize)scrollViewReferenceSize;
- (PXUIScrollViewController)initWithFrame:(CGRect)a3;
- (PXUIScrollViewControllerFocusItemProvider)focusItemProvider;
- (UIEdgeInsets)horizontalScrollIndicatorInsets;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (UIScrollView)scrollView;
- (double)horizontalInterPageSpacing;
- (id)childScrollViewAccessibilityIdentifier;
- (id)contentCoordinateSpace;
- (id)focusItemsForScrollView:(id)a3 inRect:(CGRect)a4;
- (void)_checkScrollViewDeceleration;
- (void)_scheduleScrollViewDecelerationCheck;
- (void)addFloatingSublayer:(id)a3 forAxis:(int64_t)a4;
- (void)addGestureRecognizer:(id)a3;
- (void)addSubview:(id)a3;
- (void)addSubviewToScrollView:(id)a3;
- (void)applyScrollInfo:(id)a3;
- (void)contentInsetAdjustmentBehaviorDidChange;
- (void)decelerationRateDidChange;
- (void)indicatorStyleDidChange;
- (void)removeGestureRecognizer:(id)a3;
- (void)scrollRectToVisible:(CGRect)a3 avoidingContentInsetEdges:(unint64_t)a4 animated:(BOOL)a5;
- (void)scrollToEdge:(unsigned int)a3 padding:(UIEdgeInsets)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)scrollView:(id)a3 willBeginScrollingAnimationTowardsContentEdges:(unint64_t)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewLayoutIfNeeded;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3;
- (void)setAllowsKeyboardScrolling:(BOOL)a3;
- (void)setAlwaysBounceHorizontal:(BOOL)a3;
- (void)setAlwaysBounceVertical:(BOOL)a3;
- (void)setChildScrollViewAccessibilityIdentifier:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setDeferContentOffsetUpdates:(BOOL)a3;
- (void)setFocusItemProvider:(id)a3;
- (void)setHitTestContentInsets:(UIEdgeInsets)a3;
- (void)setHorizontalInterPageSpacing:(double)a3;
- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setIgnoresSafeAreaInsets:(BOOL)a3;
- (void)setIsScrollEnabled:(BOOL)a3;
- (void)setRespectsContentZOrder:(BOOL)a3;
- (void)setScrollViewContentBounds:(CGRect)a3;
- (void)setScrollViewNeedsLayout;
- (void)setScrollingToTop:(BOOL)a3;
- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setVisibleOrigin:(CGPoint)a3;
- (void)stopScrollingAndZoomingAnimations;
- (void)transfersScrollToContainerDidChange;
@end

@implementation PXUIScrollViewController

- (BOOL)isScrolledAtEdge:(unsigned int)a3 tolerance:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = [(PXUIScrollViewController *)self scrollView];
  LOBYTE(v5) = objc_msgSend(v6, "px_isScrolledAtEdge:tolerance:", v5, a4);

  return v5;
}

- (void)setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3
{
}

- (BOOL)deferContentOffsetUpdates
{
  return [(_PXUIScrollView *)self->_scrollView deferContentOffsetUpdates];
}

- (CGRect)scrollViewVisibleRect
{
  [(_PXUIScrollView *)self->_scrollView bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)scrollViewTargetRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)scrollViewReferenceSize
{
  [(_PXUIScrollView *)self->_scrollView bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)scrollViewContentBounds
{
}

- (CGSize)scrollViewContentSize
{
  [(_PXUIScrollView *)self->_scrollView contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)scrollViewConstrainedVisibleRect
{
  [(_PXUIScrollView *)self->_scrollView bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIScrollView px_constrainedContentOffset:](self->_scrollView, "px_constrainedContentOffset:");
  double v9 = v4;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isScrubbing
{
  return [(_PXUIScrollView *)self->_scrollView _isScrubbing];
}

- (BOOL)isBouncing
{
  BOOL v3 = [(UIScrollView *)self->_scrollView px_isBouncing];
  if (v3)
  {
    if ([(PXUIScrollViewController *)self isDragging]
      || [(PXUIScrollViewController *)self isDecelerating])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(PXUIScrollViewController *)self isTracking];
    }
  }
  return v3;
}

- (void)setDeferContentOffsetUpdates:(BOOL)a3
{
}

- (void)setScrollViewNeedsLayout
{
}

- (void)setScrollViewContentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXUIScrollViewController *)self scrollViewContentBounds];
  v20.origin.double x = v8;
  v20.origin.double y = v9;
  v20.size.double width = v10;
  v20.size.double height = v11;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (!CGRectEqualToRect(v17, v20))
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGFloat v12 = -CGRectGetMinY(v18);
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    CGFloat v13 = -CGRectGetMinX(v19);
    [(_PXUIScrollView *)self->_scrollView contentInset];
    double v15 = v14;
    [(_PXUIScrollView *)self->_scrollView contentInset];
    -[_PXUIScrollView setContentInset:](self->_scrollView, "setContentInset:", v12, v13, v15);
    -[_PXUIScrollView setContentSize:](self->_scrollView, "setContentSize:", width + x, height + y);
    [(PXScrollViewController *)self scrollViewContentBoundsDidChange];
  }
}

- (BOOL)isDragging
{
  return [(_PXUIScrollView *)self->_scrollView isDragging];
}

- (BOOL)isTracking
{
  return [(_PXUIScrollView *)self->_scrollView isTracking];
}

- (BOOL)isDecelerating
{
  return [(_PXUIScrollView *)self->_scrollView isDecelerating];
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PXUIScrollViewController_setVisibleOrigin___block_invoke;
  v3[3] = &unk_1E5DAF0A8;
  v3[4] = self;
  CGPoint v4 = a3;
  [(PXScrollViewController *)self performManualChange:v3];
}

- (BOOL)scrollViewIsAnimatingScroll
{
  return [(_PXUIScrollView *)self->_scrollView isScrollAnimating];
}

void __45__PXUIScrollViewController_setVisibleOrigin___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v2, "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (CGRect)scrollViewVisibleRectOutsideBounds
{
  BOOL v3 = [(PXUIScrollViewController *)self scrollView];
  if (([v3 clipsToBounds] & 1) == 0)
  {
    while (1)
    {
      double v5 = [v3 superview];

      if (!v5) {
        break;
      }
      CGPoint v4 = [v3 superview];

      BOOL v3 = v4;
      if ([v4 clipsToBounds]) {
        goto LABEL_5;
      }
    }
  }
  CGPoint v4 = v3;
LABEL_5:
  double v6 = [(PXUIScrollViewController *)self scrollView];
  [v4 bounds];
  objc_msgSend(v6, "convertRect:fromView:", v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_scrollView;
}

- (void)setChildScrollViewAccessibilityIdentifier:(id)a3
{
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
}

- (PXUIScrollViewController)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PXUIScrollViewController;
  double v7 = -[PXScrollViewController initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    double v8 = -[_PXUIScrollView initWithFrame:]([_PXUIScrollView alloc], "initWithFrame:", x, y, width, height);
    scrollView = v7->_scrollView;
    v7->_scrollView = v8;

    [(_PXUIScrollView *)v7->_scrollView _setIndicatorInsetAdjustmentBehavior:1];
    [(_PXUIScrollView *)v7->_scrollView px_setDelegate:v7];
    [(_PXUIScrollView *)v7->_scrollView setDelegate:v7];
    [(PXUIScrollViewController *)v7 contentInsetAdjustmentBehaviorDidChange];
    [(_PXUIScrollView *)v7->_scrollView _autoScrollTouchInsets];
    v7->_defaultAutoScrollTouchInsets.top = v10;
    v7->_defaultAutoScrollTouchInsets.left = v11;
    v7->_defaultAutoScrollTouchInsets.bottom = v12;
    v7->_defaultAutoScrollTouchInsets.right = v13;
  }
  return v7;
}

- (void)contentInsetAdjustmentBehaviorDidChange
{
  int64_t v3 = [(PXScrollViewController *)self contentInsetAdjustmentBehavior];
  uint64_t v4 = v3;
  if (v3)
  {
    if (v3 != 1)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"UIScrollViewContentInsetAdjustmentBehavior UIScrollViewContentInsetAdjustmentBehaviorFromPXScrollViewContentInsetAdjustmentBehavior(PXScrollViewContentInsetAdjustmentBehavior)"];
      [v5 handleFailureInFunction:v6 file:@"PXUIScrollViewController.m" lineNumber:104 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v4 = 2;
  }
  id v7 = [(PXUIScrollViewController *)self scrollView];
  [v7 setContentInsetAdjustmentBehavior:v4];
}

- (void)setIsScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXUIScrollViewController *)self isScrollEnabled] != a3)
  {
    scrollView = self->_scrollView;
    [(_PXUIScrollView *)scrollView setScrollEnabled:v3];
  }
}

- (BOOL)isScrollEnabled
{
  return [(_PXUIScrollView *)self->_scrollView isScrollEnabled];
}

- (void)stopScrollingAndZoomingAnimations
{
  id v2 = [(PXUIScrollViewController *)self scrollView];
  [v2 _stopScrollingAndZoomingAnimations];
}

- (void)setFocusItemProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusItemProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_focusItemProvider, obj);
    if (obj) {
      double v5 = self;
    }
    else {
      double v5 = 0;
    }
    [(_PXUIScrollView *)self->_scrollView setFocusItemProvider:v5];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusItemProvider);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (BOOL)isScrollingToTop
{
  return self->_isScrollingToTop;
}

- (BOOL)ignoresSafeAreaInsets
{
  return self->_ignoresSafeAreaInsets;
}

- (PXUIScrollViewControllerFocusItemProvider)focusItemProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusItemProvider);
  return (PXUIScrollViewControllerFocusItemProvider *)WeakRetained;
}

- (id)focusItemsForScrollView:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = [(PXUIScrollViewController *)self focusItemProvider];
  CGFloat v10 = v9;
  if (v9)
  {
    CGFloat v11 = objc_msgSend(v9, "focusItemsForScrollViewController:inRect:", self, x, y, width, height);
  }
  else
  {
    CGFloat v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  BOOL v4 = [(PXScrollViewController *)self scrollViewShouldScrollToTop];
  if (v4) {
    [(PXUIScrollViewController *)self setScrollingToTop:1];
  }
  return v4;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_isScrollViewDecelerating)
  {
    self->_isScrollViewDecelerating = 0;
    [(PXScrollViewController *)self scrollViewDidEndScrolling];
  }
}

- (void)_checkScrollViewDeceleration
{
  if (self->_isScrollViewDecelerating)
  {
    if ([(_PXUIScrollView *)self->_scrollView isDecelerating])
    {
      [(PXUIScrollViewController *)self _scheduleScrollViewDecelerationCheck];
    }
    else
    {
      [(PXUIScrollViewController *)self scrollViewDidEndDecelerating:self->_scrollView];
      if (_checkScrollViewDeceleration_onceToken != -1)
      {
        dispatch_once(&_checkScrollViewDeceleration_onceToken, &__block_literal_global_4607);
      }
    }
  }
}

void __56__PXUIScrollViewController__checkScrollViewDeceleration__block_invoke()
{
  v0 = dispatch_get_global_queue(9, 0);
  dispatch_async(v0, &__block_literal_global_4);
}

void __56__PXUIScrollViewController__checkScrollViewDeceleration__block_invoke_2()
{
  v0 = PFUIGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A9AE7000, v0, OS_LOG_TYPE_FAULT, "Working around rdar://78312989", v1, 2u);
  }
}

- (void)_scheduleScrollViewDecelerationCheck
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PXUIScrollViewController__scheduleScrollViewDecelerationCheck__block_invoke;
  v3[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __64__PXUIScrollViewController__scheduleScrollViewDecelerationCheck__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkScrollViewDeceleration];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (a4)
  {
    self->_isScrollViewDecelerating = 1;
    [(PXUIScrollViewController *)self _scheduleScrollViewDecelerationCheck];
  }
  else
  {
    [(PXScrollViewController *)self scrollViewDidEndScrolling];
  }
  self->_isInterruptingDeceleration = 0;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  BOOL v9 = x == *MEMORY[0x1E4F1DAD8] && y == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v9 && self->_scrollViewWasDeceleratingWhenDragBegan)
  {
    self->_isInterruptingDeceleration = 1;
    PXFloatSign();
  }
  -[PXScrollViewController willEndScrollingWithVelocity:targetContentOffset:](self, "willEndScrollingWithVelocity:targetContentOffset:", a5, x, y);
  self->_lastDragVelocity.double x = x;
  self->_lastDragVelocity.double y = y;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_scrollViewWasDeceleratingWhenDragBegan = self->_isScrollViewDecelerating;
  self->_isScrollViewDecelerating = 0;
  [(PXScrollViewController *)self scrollViewWillBeginScrolling];
}

- (void)scrollView:(id)a3 willBeginScrollingAnimationTowardsContentEdges:(unint64_t)a4
{
  [(PXUIScrollViewController *)self setScrollingToTop:0];
  [(PXScrollViewController *)self scrollViewWillBeginScrollingAnimationTowardsContentEdges:a4];
}

- (BOOL)scrollView:(id)a3 shouldBeginScrollingWithPanAtLocation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  BOOL v9 = self;
  id v10 = [(PXUIScrollViewController *)self scrollView];
  LOBYTE(v9) = -[PXScrollViewController scrollViewShouldBeginScrollingWithPanAtLocation:inCoordinateSpace:velocity:](v9, "scrollViewShouldBeginScrollingWithPanAtLocation:inCoordinateSpace:velocity:", v10, v8, v7, x, y);

  return (char)v9;
}

- (BOOL)isInterruptingScrollWithDirection:(CGPoint *)a3
{
  BOOL isInterruptingDeceleration = self->_isInterruptingDeceleration;
  if (a3 && self->_isInterruptingDeceleration) {
    *a3 = self->_interruptedDecelerationDirection;
  }
  return isInterruptingDeceleration;
}

- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3
{
}

- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView
{
  return [(_PXUIScrollView *)self->_scrollView shouldScrollSimultaneouslyWithDescendantScrollView];
}

- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3
{
  [(_PXUIScrollView *)self->_scrollView scrollIndicatorFrameForAxis:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)contentCoordinateSpace
{
  return self->_scrollView;
}

- (void)applyScrollInfo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 axis];
  uint64_t v6 = (v5 >> 2) & 1;
  [(_PXUIScrollView *)self->_scrollView setAlwaysBounceHorizontal:(v5 >> 1) & 1];
  [(_PXUIScrollView *)self->_scrollView setAlwaysBounceVertical:v6];
  -[_PXUIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", [v4 isPagingEnabled]);
  scrollView = self->_scrollView;
  [v4 interpageSpacing];
  -[_PXUIScrollView _setInterpageSpacing:](scrollView, "_setInterpageSpacing:");
  double v8 = self->_scrollView;
  [v4 pagingOrigin];
  double v10 = v9;
  double v12 = v11;

  -[_PXUIScrollView setPagingOriginOffset:](v8, "setPagingOriginOffset:", v10, v12);
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  [(_PXUIScrollView *)self->_scrollView _interpageSpacing];
  if (v5 != a3)
  {
    [(_PXUIScrollView *)self->_scrollView _interpageSpacing];
    [(_PXUIScrollView *)self->_scrollView _setInterpageSpacing:a3];
    char v6 = [(_PXUIScrollView *)self->_scrollView isPagingEnabled];
    if (a3 > 0.0 && (v6 & 1) == 0)
    {
      scrollView = self->_scrollView;
      [(_PXUIScrollView *)scrollView setPagingEnabled:1];
    }
  }
}

- (double)horizontalInterPageSpacing
{
  [(_PXUIScrollView *)self->_scrollView _interpageSpacing];
  return result;
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  [(_PXUIScrollView *)self->_scrollView verticalScrollIndicatorInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  [(_PXUIScrollView *)self->_scrollView horizontalScrollIndicatorInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)alwaysBounceHorizontal
{
  return [(_PXUIScrollView *)self->_scrollView alwaysBounceHorizontal];
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
}

- (BOOL)alwaysBounceVertical
{
  return [(_PXUIScrollView *)self->_scrollView alwaysBounceVertical];
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
}

- (BOOL)showsHorizontalScrollIndicator
{
  return [(_PXUIScrollView *)self->_scrollView showsHorizontalScrollIndicator];
}

- (BOOL)showsVerticalScrollIndicator
{
  return [(_PXUIScrollView *)self->_scrollView showsVerticalScrollIndicator];
}

- (void)setClipsToBounds:(BOOL)a3
{
}

- (BOOL)clipsToBounds
{
  return [(_PXUIScrollView *)self->_scrollView clipsToBounds];
}

- (BOOL)adjustsContentInsetWhenScrollDisabled
{
  return [(_PXUIScrollView *)self->_scrollView _adjustsContentInsetWhenScrollDisabled];
}

- (void)setAllowsKeyboardScrolling:(BOOL)a3
{
}

- (BOOL)allowsKeyboardScrolling
{
  return [(_PXUIScrollView *)self->_scrollView allowsKeyboardScrolling];
}

- (BOOL)respectsContentZOrder
{
  return [(_PXUIScrollView *)self->_scrollView respectsContentZOrder];
}

- (CGRect)scrollViewActiveRect
{
  [(_PXUIScrollView *)self->_scrollView bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  double width = v7;
  double height = v9;
  double v11 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self->_scrollView];

  if (v11)
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.double width = width;
    v16.size.double height = height;
    CGRect v17 = CGRectInset(v16, width * -0.5, height * -0.5);
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)transfersScrollToContainerDidChange
{
  BOOL v3 = [(PXScrollViewController *)self transfersScrollToContainer];
  id v4 = [(PXUIScrollViewController *)self scrollView];
  [v4 _setTransfersScrollToContainer:v3];
}

- (void)indicatorStyleDidChange
{
  unint64_t v3 = [(PXScrollViewController *)self indicatorStyle];
  if (v3 >= 3)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    char v6 = [NSString stringWithUTF8String:"UIScrollViewIndicatorStyle _UIScrollViewIndicatorStyleFromPXScrollViewIndicatorStyle(PXScrollViewIndicatorStyle)"];
    [v5 handleFailureInFunction:v6 file:@"PXUIScrollViewController.m" lineNumber:94 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  unint64_t v4 = v3;
  id v7 = [(PXUIScrollViewController *)self scrollView];
  [v7 setIndicatorStyle:v4];
}

- (void)decelerationRateDidChange
{
  int64_t v3 = [(PXScrollViewController *)self decelerationRate];
  if (v3)
  {
    if (v3 != 1)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"UIScrollViewDecelerationRate UIScrollViewDecelerationRateFromPXScrollViewDecelerationRate(PXScrollViewDecelerationRate)"];
      [v6 handleFailureInFunction:v7 file:@"PXUIScrollViewController.m" lineNumber:82 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    unint64_t v4 = (double *)MEMORY[0x1E4FB2EE8];
  }
  else
  {
    unint64_t v4 = (double *)MEMORY[0x1E4FB2EF0];
  }
  double v5 = *v4;
  id v8 = [(PXUIScrollViewController *)self scrollView];
  [v8 setDecelerationRate:v5];
}

- (void)scrollViewLayoutIfNeeded
{
}

- (void)scrollRectToVisible:(CGRect)a3 avoidingContentInsetEdges:(unint64_t)a4 animated:(BOOL)a5
{
}

- (void)scrollToEdge:(unsigned int)a3 padding:(UIEdgeInsets)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v11 = *(void *)&a3;
  id v14 = a6;
  -[UIScrollView px_contentOffsetForEdge:padding:](self->_scrollView, "px_contentOffsetForEdge:padding:", v11, top, left, bottom, right);
  -[UIScrollView px_scrollToContentOffset:animated:](self->_scrollView, "px_scrollToContentOffset:animated:", v6);
  double v13 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    double v13 = v14;
  }
}

- (void)setScrollingToTop:(BOOL)a3
{
  if (self->_isScrollingToTop != a3)
  {
    self->_isScrollingToTop = a3;
    if (a3) {
      [(PXScrollViewController *)self scrollViewWillBeginScrollingAnimationTowardsContentEdges:1];
    }
    else {
      [(PXScrollViewController *)self scrollViewDidEndScrollingAnimation];
    }
  }
}

- (void)removeGestureRecognizer:(id)a3
{
}

- (void)addGestureRecognizer:(id)a3
{
}

- (BOOL)isFloatingSublayer:(id)a3
{
  unint64_t v4 = [a3 superlayer];
  double v5 = [(_PXUIScrollView *)self->_scrollView layer];
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (void)addFloatingSublayer:(id)a3 forAxis:(int64_t)a4
{
  scrollView = self->_scrollView;
  id v5 = a3;
  id v6 = [(_PXUIScrollView *)scrollView layer];
  [v6 addSublayer:v5];
}

- (void)addSubviewToScrollView:(id)a3
{
}

- (BOOL)isSubview:(id)a3
{
  unint64_t v4 = [a3 superview];
  LOBYTE(self) = v4 == self->_scrollView;

  return (char)self;
}

- (void)addSubview:(id)a3
{
}

- (BOOL)hasWindow
{
  double v2 = [(_PXUIScrollView *)self->_scrollView window];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setIgnoresSafeAreaInsets:(BOOL)a3
{
  if (self->_ignoresSafeAreaInsets != a3)
  {
    self->_ignoresSafeAreaInsets = a3;
    -[_PXUIScrollView setIgnoresSafeAreaInsets:](self->_scrollView, "setIgnoresSafeAreaInsets:");
    scrollView = self->_scrollView;
    [(_PXUIScrollView *)scrollView safeAreaInsetsDidChange];
  }
}

- (id)childScrollViewAccessibilityIdentifier
{
  return (id)[(_PXUIScrollView *)self->_scrollView accessibilityIdentifier];
}

@end