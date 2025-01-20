@interface _UIQueuingScrollView
- (BOOL)_dataSourceProvidesViews;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)_isDeceleratingInOppositionToNavigationDirection:(int64_t)a3;
- (BOOL)_isScrollInProgress:(BOOL)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isManualScrollInProgress;
- (BOOL)isPreviousScrollCompatibleWithScrollInDirection:(int64_t)a3;
- (CGRect)disabledScrollingRegion;
- (_UIQueuingScrollView)initWithFrame:(CGRect)a3 navigationOrientation:(int64_t)a4;
- (_UIQueuingScrollViewDataSource)qDataSource;
- (_UIQueuingScrollViewDelegate)qDelegate;
- (double)pageSpacing;
- (id)_dequeueViewForIndex:(int64_t)a3;
- (id)_requestViewForIndex:(int64_t)a3;
- (id)_viewAfterView:(id)a3;
- (id)_viewAtIndex:(int64_t)a3 loadingIfNecessary:(BOOL)a4 updatingContents:(BOOL)a5 animated:(BOOL)a6;
- (id)_viewBefore:(BOOL)a3 view:(id)a4;
- (id)_viewBeforeView:(id)a3;
- (id)_visibleView;
- (int64_t)_navigationDirectionForActiveScroll:(BOOL)a3;
- (int64_t)_navigationDirectionFromCurrentOffset;
- (unint64_t)_abuttedPagingEdges;
- (void)_adjustContentInsets;
- (void)_boundsDidChangeToSize:(CGSize)a3;
- (void)_cleanUpCompletionState:(id)a3 didFinish:(BOOL)a4 didComplete:(BOOL)a5;
- (void)_commitGestureDrivenScrollRevealingView:(id)a3 concealingView:(id)a4 inDirection:(int64_t)a5 canComplete:(BOOL)a6;
- (void)_didEndDraggingManualScroll;
- (void)_didEndManualScroll;
- (void)_didEndProgrammaticScroll;
- (void)_didEndScroll:(BOOL)a3;
- (void)_didScrollWithAnimation:(BOOL)a3 force:(BOOL)a4;
- (void)_enqueueAnimatedScrollInDirection:(int64_t)a3 withView:(id)a4 completion:(id)a5;
- (void)_enqueueCompletionState:(id)a3;
- (void)_flushView:(id)a3 animated:(BOOL)a4;
- (void)_handleDirectionalPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4;
- (void)_invalidateOffscreenViews;
- (void)_notifyDelegateDidBailoutOfScrollAndRevealedView:(id)a3;
- (void)_notifyDelegateDidCommitManualScroll:(BOOL)a3 toRevealView:(id)a4 concealView:(id)a5 direction:(int64_t)a6 animated:(BOOL)a7 canComplete:(BOOL)a8;
- (void)_notifyDelegateDidEndManualScroll:(BOOL)a3 toRevealView:(id)a4 direction:(int64_t)a5 animated:(BOOL)a6 didFinish:(BOOL)a7 didComplete:(BOOL)a8;
- (void)_notifyDelegateDidFinishScrolling;
- (void)_notifyDelegateWillManuallyScroll:(BOOL)a3 toRevealView:(id)a4 concealingView:(id)a5 animated:(BOOL)a6;
- (void)_replaceViews:(id)a3 updatingContents:(BOOL)a4 adjustContentInsets:(BOOL)a5 animated:(BOOL)a6;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_scrollViewDidEndDecelerating;
- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3;
- (void)_setFrameAndApplyPageSpacing:(CGRect)a3;
- (void)_setWrappedViewAtIndex:(int64_t)a3 withView:(id)a4;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setDisabledScrollingRegion:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPageSpacing:(double)a3;
- (void)setQDataSource:(id)a3;
- (void)setQDelegate:(id)a3;
- (void)setView:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation _UIQueuingScrollView

- (_UIQueuingScrollView)initWithFrame:(CGRect)a3 navigationOrientation:(int64_t)a4
{
  v24.receiver = self;
  v24.super_class = (Class)_UIQueuingScrollView;
  v5 = -[UIScrollView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_navigationOrientation = a4;
    [(UIScrollView *)v5 setPagingEnabled:1];
    [(UIScrollView *)v6 setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v6 setShowsVerticalScrollIndicator:0];
    if (v6->_navigationOrientation) {
      [(UIScrollView *)v6 setAlwaysBounceVertical:1];
    }
    else {
      [(UIScrollView *)v6 setAlwaysBounceHorizontal:1];
    }
    if (dyld_program_sdk_at_least()) {
      [(UIScrollView *)v6 setContentInsetAdjustmentBehavior:2];
    }
    [(UIScrollView *)v6 setScrollsToTop:0];
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"kUIFaultingViewSentinel", @"kUIFaultingViewSentinel", 0);
    views = v6->_views;
    v6->_views = (NSArray *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    viewStateQueue = v6->_viewStateQueue;
    v6->_viewStateQueue = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionStateQueue = v6->_completionStateQueue;
    v6->_completionStateQueue = v11;

    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v18 = 3;
    do
    {
      v19 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v14, v15, v16, v17);
      [(NSArray *)v13 addObject:v19];
      [(UIView *)v6 addSubview:v19];

      --v18;
    }
    while (v18);
    wrapperViews = v6->_wrapperViews;
    v6->_wrapperViews = v13;

    [(UIView *)v6 bounds];
    -[_UIQueuingScrollView _boundsDidChangeToSize:](v6, "_boundsDidChangeToSize:", v21, v22);
  }
  return v6;
}

- (void)setQDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_qDelegate, obj);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v9;
  }
}

- (void)setQDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_qDataSource, obj);
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 128;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 64;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 256;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v7;
  }
}

- (void)_setFrameAndApplyPageSpacing:(CGRect)a3
{
  double pageSpacing = self->_pageSpacing;
  int64_t navigationOrientation = self->_navigationOrientation;
  double v5 = pageSpacing + pageSpacing;
  double v6 = a3.origin.y - pageSpacing;
  double v7 = a3.size.height + pageSpacing + pageSpacing;
  double v8 = a3.origin.x - pageSpacing;
  double v9 = a3.size.width + v5;
  if (navigationOrientation) {
    a3.origin.y = v6;
  }
  else {
    a3.origin.x = v8;
  }
  if (navigationOrientation) {
    a3.size.height = v7;
  }
  else {
    a3.size.width = v9;
  }
  -[_UIQueuingScrollView setFrame:](self, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v8, v9);
}

- (void)setPageSpacing:(double)a3
{
  if (self->_pageSpacing != a3)
  {
    [(UIView *)self frame];
    double pageSpacing = self->_pageSpacing;
    int64_t navigationOrientation = self->_navigationOrientation;
    double v11 = pageSpacing * -2.0;
    double v12 = pageSpacing + v6;
    double v13 = v8 + pageSpacing * -2.0;
    double v14 = pageSpacing + v5;
    double v15 = v7 + v11;
    if (navigationOrientation) {
      double v6 = v12;
    }
    else {
      double v5 = v14;
    }
    if (!navigationOrientation) {
      double v7 = v15;
    }
    self->_double pageSpacing = a3;
    if (navigationOrientation) {
      double v8 = v13;
    }
    -[_UIQueuingScrollView _setFrameAndApplyPageSpacing:](self, "_setFrameAndApplyPageSpacing:", v5, v6, v7, v8, v14, v15);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UIView *)self bounds];
    -[_UIQueuingScrollView _boundsDidChangeToSize:](self, "_boundsDidChangeToSize:", v13, v14);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UIView *)self bounds];
    -[_UIQueuingScrollView _boundsDidChangeToSize:](self, "_boundsDidChangeToSize:", v13, v14);
  }
}

- (void)layoutSubviews
{
  if ((*(_WORD *)&self->_delegateFlags & 0x20) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate),
        int v4 = [WeakRetained queuingScrollViewShouldLayoutSubviews:self],
        WeakRetained,
        v4))
  {
    BOOL v5 = [(UIScrollView *)self isScrollAnimating];
    if (![(_UIQueuingScrollView *)self _isScrollInProgress:v5]
      || [(_UIQueuingScrollView *)self _navigationDirectionForActiveScroll:v5] != -1)
    {
      [(_UIQueuingScrollView *)self _didScrollWithAnimation:v5 force:0];
    }
    v6.receiver = self;
    v6.super_class = (Class)_UIQueuingScrollView;
    [(UIScrollView *)&v6 layoutSubviews];
  }
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(_UIQueuingScrollView *)self _didEndDraggingManualScroll];
  }
  else
  {
    [(_UIQueuingScrollView *)self _didScrollWithAnimation:[(UIScrollView *)self isScrollAnimating] force:0];
    [(_UIQueuingScrollView *)self _didEndManualScroll];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIQueuingScrollView;
  [(UIScrollView *)&v5 _scrollViewDidEndDraggingWithDeceleration:v3];
}

- (void)_scrollViewDidEndDecelerating
{
  [(_UIQueuingScrollView *)self _didScrollWithAnimation:[(UIScrollView *)self isScrollAnimating] force:1];
  [(_UIQueuingScrollView *)self _didEndManualScroll];
  v3.receiver = self;
  v3.super_class = (Class)_UIQueuingScrollView;
  [(UIScrollView *)&v3 _scrollViewDidEndDecelerating];
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView _scrollViewAnimationEnded:finished:](&v6, sel__scrollViewAnimationEnded_finished_, a3);
  if (v4)
  {
    [(_UIQueuingScrollView *)self _didScrollWithAnimation:[(UIScrollView *)self isScrollAnimating] force:1];
    [(_UIQueuingScrollView *)self _didEndProgrammaticScroll];
  }
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UIView *)self gestureRecognizers];
  uint64_t v9 = [v8 indexOfObject:v6];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || CGRectIsEmpty(self->_disabledScrollingRegion))
  {
    int v10 = 0;
    goto LABEL_4;
  }
  double v8 = [(UIView *)self superview];
  [v7 locationInView:v8];
  v16.double x = v12;
  v16.double y = v13;
  if (!CGRectContainsPoint(self->_disabledScrollingRegion, v16))
  {
    int v10 = 1;
LABEL_4:
    v15.receiver = self;
    v15.super_class = (Class)_UIQueuingScrollView;
    BOOL v11 = [(UIScrollView *)&v15 _gestureRecognizer:v6 shouldReceiveTouch:v7];
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v11 = 0;
LABEL_8:

LABEL_9:
  return v11;
}

- (unint64_t)_abuttedPagingEdges
{
  [(_UIQueuingScrollView *)self _adjustContentInsets];
  v31.receiver = self;
  v31.super_class = (Class)_UIQueuingScrollView;
  unint64_t v3 = [(UIScrollView *)&v31 _abuttedPagingEdges];
  if (![(UIScrollView *)self _isHorizontalBouncing]
    && ![(UIScrollView *)self _isVerticalBouncing]
    && [(_UIQueuingScrollView *)self _dataSourceProvidesViews])
  {
    int64_t navigationOrientation = self->_navigationOrientation;
    [(UIScrollView *)self _pageDecelerationTarget];
    double v6 = v5;
    double v8 = v7;
    [(UIScrollView *)self contentOffset];
    double v10 = v6 - v9;
    double v12 = v8 - v11;
    double v13 = navigationOrientation ? v12 : v10;
    if ([(UIScrollView *)self isDecelerating] && fabs(v13) >= 2.22044605e-16)
    {
      int64_t v14 = self->_navigationOrientation;
      if (!v14)
      {
        [(UIScrollView *)self _pageDecelerationTarget];
        double v16 = v15;
        [(UIView *)self bounds];
        if (v16 < CGRectGetWidth(v32))
        {
LABEL_14:
          uint64_t v19 = 1;
          v20 = [(_UIQueuingScrollView *)self _viewAtIndex:0 loadingIfNecessary:1 updatingContents:0 animated:0];

          if (!v20) {
            return v3;
          }
          uint64_t v21 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 2;
          goto LABEL_24;
        }
        int64_t v14 = self->_navigationOrientation;
      }
      if (v14 == 1)
      {
        [(UIScrollView *)self _pageDecelerationTarget];
        double v18 = v17;
        [(UIView *)self bounds];
        if (v18 < CGRectGetHeight(v33)) {
          goto LABEL_14;
        }
        int64_t v14 = self->_navigationOrientation;
      }
      if (!v14)
      {
        [(UIScrollView *)self _pageDecelerationTarget];
        double v25 = v24;
        [(UIView *)self bounds];
        if (v25 > CGRectGetWidth(v34))
        {
LABEL_22:
          v28 = [(_UIQueuingScrollView *)self _viewAtIndex:2 loadingIfNecessary:1 updatingContents:0 animated:0];

          if (!v28) {
            return v3;
          }
          uint64_t v19 = 0;
          uint64_t v23 = 0;
          uint64_t v22 = 8;
          uint64_t v21 = 4;
LABEL_24:
          int64_t v29 = self->_navigationOrientation;
          if (v29 == 1) {
            return v21 | v19 | v3 & 0xFFFFFFFFFFFFFFFALL;
          }
          if (!v29) {
            return v22 | v23 | v3 & 0xFFFFFFFFFFFFFFF5;
          }
          return v3;
        }
        int64_t v14 = self->_navigationOrientation;
      }
      if (v14 != 1) {
        return v3;
      }
      [(UIScrollView *)self _pageDecelerationTarget];
      double v27 = v26;
      [(UIView *)self bounds];
      if (v27 <= CGRectGetHeight(v35)) {
        return v3;
      }
      goto LABEL_22;
    }
  }
  return v3;
}

- (void)_handleDirectionalPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  double v5 = fabs(a4);
  if (fabs(a3) >= 2.22044605e-16 || v5 >= 2.22044605e-16)
  {
    if (self->_navigationOrientation) {
      a3 = a4;
    }
    BOOL v8 = a3 <= 0.0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    [WeakRetained queuingScrollView:self attemptToPageInDirection:v8];
  }
}

- (void)_setWrappedViewAtIndex:(int64_t)a3 withView:(id)a4
{
  id v7 = a4;
  if (!v7) {
    goto LABEL_9;
  }
  id v14 = v7;
  BOOL v8 = [(NSArray *)self->_wrapperViews objectAtIndex:a3];
  double v9 = [v8 subviews];
  if (![v9 count]) {
    goto LABEL_5;
  }
  double v10 = [v8 subviews];
  objc_msgSend(v10, "_ui_onlyObject");
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  double v12 = v14;
  if (v11 != v14)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIQueuingScrollView.m" lineNumber:354 description:@"Unexpected subviews"];
LABEL_5:

    double v12 = v14;
  }
  double v13 = [v12 superview];

  if (v8 != v13)
  {
    [v8 bounds];
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v14, "setAutoresizingMask:", objc_msgSend(v14, "autoresizingMask") | 0x12);
    [v8 addSubview:v14];
  }

  id v7 = v14;
LABEL_9:
}

- (BOOL)_dataSourceProvidesViews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
  if (WeakRetained)
  {
    $56B4B6F9EF274AA88B3D751FEF707A7A delegateFlags = self->_delegateFlags;
    if ((*(unsigned char *)&delegateFlags & 0x80) != 0) {
      BOOL v5 = (*(unsigned int *)&delegateFlags >> 6) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_viewBefore:(BOOL)a3 view:(id)a4
{
  id v6 = a4;
  if ([(_UIQueuingScrollView *)self _dataSourceProvidesViews])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
    BOOL v8 = WeakRetained;
    if (a3) {
      [WeakRetained queuingScrollView:self viewBeforeView:v6];
    }
    else {
    double v9 = [WeakRetained queuingScrollView:self viewAfterView:v6];
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_viewBeforeView:(id)a3
{
  return [(_UIQueuingScrollView *)self _viewBefore:1 view:a3];
}

- (id)_viewAfterView:(id)a3
{
  return [(_UIQueuingScrollView *)self _viewBefore:0 view:a3];
}

- (id)_visibleView
{
  uint64_t v4 = [(NSArray *)self->_views objectAtIndex:1];
  BOOL v5 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIQueuingScrollView.m" lineNumber:385 description:@"Visible view can't be 'NULL'"];
  }
  if (v4 == @"kUIFaultingViewSentinel") {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)_flushView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (UIView *)a3;
  if (self->_pendingVisibleView == v6)
  {
    self->_pendingVisibleView = 0;
    BOOL v8 = v6;

    id v6 = v8;
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
  {
    double v9 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
    [WeakRetained queuingScrollView:self didFlushView:v9 animated:v4];

    id v6 = v9;
  }
}

- (void)_replaceViews:(id)a3 updatingContents:(BOOL)a4 adjustContentInsets:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v10 = (NSArray *)a3;
  if ([(NSArray *)v10 count] != 3)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 399, @"Invalid parameter not satisfying: %@", @"[views count] == 3" object file lineNumber description];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = self->_views;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
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
        double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v16 removeFromSuperview];
          if (![(NSArray *)v10 containsObject:v16]) {
            [(_UIQueuingScrollView *)self _flushView:v16 animated:v6];
          }
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  for (uint64_t j = 0; j != 3; ++j)
  {
    double v18 = [(NSArray *)v10 objectAtIndex:j];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (a4 || [(NSArray *)self->_views containsObject:v18])) {
      [(_UIQueuingScrollView *)self _setWrappedViewAtIndex:j withView:v18];
    }
  }
  views = self->_views;
  self->_views = v10;

  if (a5) {
    [(_UIQueuingScrollView *)self _adjustContentInsets];
  }
}

- (id)_requestViewForIndex:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 2)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 422, @"Invalid parameter not satisfying: %@", @"LEFT_VIEW_INDEX == index || index == RIGHT_VIEW_INDEX" object file lineNumber description];
    }
    BOOL v6 = [(_UIQueuingScrollView *)self _visibleView];
    uint64_t v7 = [(_UIQueuingScrollView *)self _viewAfterView:v6];
  }
  else
  {
    BOOL v6 = [(_UIQueuingScrollView *)self _visibleView];
    uint64_t v7 = [(_UIQueuingScrollView *)self _viewBeforeView:v6];
  }
  BOOL v8 = (void *)v7;

  return v8;
}

- (id)_dequeueViewForIndex:(int64_t)a3
{
  if ((a3 | 2) != 2)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 428, @"Invalid parameter not satisfying: %@", @"LEFT_VIEW_INDEX == index || index == RIGHT_VIEW_INDEX" object file lineNumber description];
  }
  if (![(NSMutableArray *)self->_viewStateQueue count])
  {
    double v9 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = [(NSMutableArray *)self->_viewStateQueue _ui_peek];
  uint64_t v8 = [v7 transitionDirection];
  if (a3 == 2 && !v8)
  {

LABEL_10:
    uint64_t v12 = [(NSMutableArray *)self->_viewStateQueue _ui_dequeue];
    double v9 = [v12 view];

    goto LABEL_11;
  }
  double v10 = [(NSMutableArray *)self->_viewStateQueue _ui_peek];
  uint64_t v11 = [v10 transitionDirection];

  double v9 = 0;
  if (!a3 && v11 == 1) {
    goto LABEL_10;
  }
LABEL_11:
  return v9;
}

- (id)_viewAtIndex:(int64_t)a3 loadingIfNecessary:(BOOL)a4 updatingContents:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  if ((unint64_t)a3 >= 3)
  {
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 439, @"Invalid parameter not satisfying: %@", @"LEFT_VIEW_INDEX <= index && index <= RIGHT_VIEW_INDEX" object file lineNumber description];
  }
  uint64_t v11 = [(NSArray *)self->_views objectAtIndex:a3];
  uint64_t v12 = v11;
  if (v8 && v11 == @"kUIFaultingViewSentinel")
  {
    uint64_t v13 = [(_UIQueuingScrollView *)self _dequeueViewForIndex:a3];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v12 = v13;
    }
    else
    {
      double v15 = [(_UIQueuingScrollView *)self _requestViewForIndex:a3];
      double v16 = v15;
      if (v15)
      {
        double v17 = v15;
      }
      else
      {
        double v17 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v12 = v17;
    }
    if (v12 != @"kUIFaultingViewSentinel")
    {
      double v18 = v12;
      uint64_t v19 = (void *)[(NSArray *)self->_views mutableCopy];
      [v19 replaceObjectAtIndex:a3 withObject:v18];
      [(_UIQueuingScrollView *)self _replaceViews:v19 updatingContents:v7 adjustContentInsets:1 animated:v6];
    }
  }
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_UIQueuingScrollView *)self _setWrappedViewAtIndex:a3 withView:v12];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v12;
  }
  else {
    v20 = 0;
  }
  uint64_t v21 = v20;

  return v21;
}

- (void)_invalidateOffscreenViews
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = [(_UIQueuingScrollView *)self _visibleView];
  id v7 = (id)v4;
  if (v4) {
    BOOL v5 = (__CFString *)v4;
  }
  else {
    BOOL v5 = @"kUIFaultingViewSentinel";
  }
  BOOL v6 = objc_msgSend(v3, "arrayWithObjects:", v5, @"kUIFaultingViewSentinel", 0);
  [(_UIQueuingScrollView *)self _replaceViews:v6 updatingContents:1 adjustContentInsets:1 animated:0];
}

- (BOOL)isPreviousScrollCompatibleWithScrollInDirection:(int64_t)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_viewStateQueue lastObject];
  BOOL v5 = v4;
  if (v4) {
    char v6 = [v4 isCompatibleWithTransitionInDirection:a3];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isManualScrollInProgress
{
  if (self->_manualScrollInProgress) {
    return 1;
  }
  unint64_t v3 = [(NSMutableArray *)self->_completionStateQueue lastObject];
  char v4 = [v3 isManual];

  return v4;
}

- (int64_t)_navigationDirectionForActiveScroll:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIScrollView *)self _pagingRight] || [(UIScrollView *)self _pagingDown]) {
    return 0;
  }
  if ([(UIScrollView *)self _pagingLeft] || [(UIScrollView *)self _pagingUp]) {
    return 1;
  }
  int64_t navigationOrientation = self->_navigationOrientation;
  if (v3)
  {
    if (!navigationOrientation)
    {
      [(UIScrollView *)self _animatedTargetOffset];
      double v8 = v7;
      [(UIScrollView *)self _animatedOriginalOffset];
      if (v8 > v9) {
        return 0;
      }
      int64_t navigationOrientation = self->_navigationOrientation;
    }
    if (navigationOrientation != 1) {
      goto LABEL_14;
    }
    [(UIScrollView *)self _animatedTargetOffset];
    double v11 = v10;
    [(UIScrollView *)self _animatedOriginalOffset];
    if (v11 <= v12)
    {
      int64_t navigationOrientation = self->_navigationOrientation;
LABEL_14:
      if (!navigationOrientation)
      {
        [(UIScrollView *)self _animatedTargetOffset];
        double v14 = v13;
        [(UIScrollView *)self _animatedOriginalOffset];
        if (v14 < v15) {
          return 1;
        }
        int64_t navigationOrientation = self->_navigationOrientation;
      }
      if (navigationOrientation == 1)
      {
        [(UIScrollView *)self _animatedTargetOffset];
        double v17 = v16;
        [(UIScrollView *)self _animatedOriginalOffset];
        goto LABEL_19;
      }
      return -1;
    }
    return 0;
  }
  if (!navigationOrientation)
  {
    [(UIScrollView *)self _horizontalVelocity];
    if (v19 > 0.0) {
      return 0;
    }
    int64_t navigationOrientation = self->_navigationOrientation;
  }
  if (navigationOrientation == 1)
  {
    [(UIScrollView *)self _verticalVelocity];
    if (v20 > 0.0) {
      return 0;
    }
    int64_t navigationOrientation = self->_navigationOrientation;
  }
  if (!navigationOrientation)
  {
    [(UIScrollView *)self _horizontalVelocity];
    if (v21 < 0.0) {
      return 1;
    }
    int64_t navigationOrientation = self->_navigationOrientation;
  }
  if (navigationOrientation == 1)
  {
    [(UIScrollView *)self _verticalVelocity];
    if (v22 < 0.0) {
      return 1;
    }
  }
  if (![(UIScrollView *)self _isBouncing]) {
    return -1;
  }
  int64_t v23 = self->_navigationOrientation;
  if (!v23)
  {
    [(UIScrollView *)self _pageDecelerationTarget];
    double v25 = v24;
    [(UIScrollView *)self contentOffset];
    if (v25 > v26) {
      return 0;
    }
    int64_t v23 = self->_navigationOrientation;
  }
  if (v23 == 1)
  {
    [(UIScrollView *)self _pageDecelerationTarget];
    double v28 = v27;
    [(UIScrollView *)self contentOffset];
    if (v28 > v29) {
      return 0;
    }
    int64_t v23 = self->_navigationOrientation;
  }
  if (!v23)
  {
    [(UIScrollView *)self _pageDecelerationTarget];
    double v31 = v30;
    [(UIScrollView *)self contentOffset];
    if (v31 < v32) {
      return 1;
    }
    int64_t v23 = self->_navigationOrientation;
  }
  if (v23 == 1)
  {
    [(UIScrollView *)self _pageDecelerationTarget];
    double v17 = v33;
    [(UIScrollView *)self contentOffset];
LABEL_19:
    if (v17 >= v18) {
      return -1;
    }
    return 1;
  }
  return -1;
}

- (int64_t)_navigationDirectionFromCurrentOffset
{
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int64_t navigationOrientation = self->_navigationOrientation;
  [(UIScrollView *)self contentOffset];
  if (navigationOrientation)
  {
    double v14 = v13;
    v21.origin.double x = v4;
    v21.origin.double y = v6;
    v21.size.double width = v8;
    v21.size.double height = v10;
    if (v14 >= CGRectGetHeight(v21))
    {
      [(UIScrollView *)self contentOffset];
      double v16 = v15;
      v22.origin.double x = v4;
      v22.origin.double y = v6;
      v22.size.double width = v8;
      v22.size.double height = v10;
      double Height = CGRectGetHeight(v22);
      goto LABEL_7;
    }
    return 1;
  }
  double v18 = v12;
  v23.origin.double x = v4;
  v23.origin.double y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  if (v18 < CGRectGetWidth(v23)) {
    return 1;
  }
  [(UIScrollView *)self contentOffset];
  double v16 = v20;
  v24.origin.double x = v4;
  v24.origin.double y = v6;
  v24.size.double width = v8;
  v24.size.double height = v10;
  double Height = CGRectGetWidth(v24);
LABEL_7:
  if (v16 > Height) {
    return 0;
  }
  else {
    return -1;
  }
}

- (void)_enqueueCompletionState:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 511, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_completionStateQueue count])
  {
    double v5 = [(NSMutableArray *)self->_completionStateQueue lastObject];
    CGFloat v6 = [v5 view];
    double v7 = [v12 view];
    if (v6 == v7)
    {
      CGFloat v8 = [(NSMutableArray *)self->_completionStateQueue lastObject];
      uint64_t v9 = [v8 transitionDirection];
      uint64_t v10 = [v12 transitionDirection];

      if (v9 != v10) {
        goto LABEL_9;
      }
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"_UIQueuingScrollView.m" lineNumber:513 description:@"Duplicate states in queue"];
    }
    else
    {
    }
  }
LABEL_9:
  [(NSMutableArray *)self->_completionStateQueue _ui_enqueue:v12];
}

- (void)_cleanUpCompletionState:(id)a3 didFinish:(BOOL)a4 didComplete:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    viewStateQueue = self->_viewStateQueue;
    id v8 = a3;
    [(NSMutableArray *)viewStateQueue removeObject:v8];
    [v8 cleanupWithFinishedState:v6 completedState:v5];
  }
}

- (void)_enqueueAnimatedScrollInDirection:(int64_t)a3 withView:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 529, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  [(UIScrollView *)self contentOffset];
  double v12 = v11;
  double v14 = v13;
  if ([(UIScrollView *)self _pagingLeft]
    || [(UIScrollView *)self _pagingRight]
    || [(UIScrollView *)self _pagingUp]
    || [(UIScrollView *)self _pagingDown])
  {
    [(UIScrollView *)self _pageDecelerationTarget];
LABEL_8:
    double v12 = v15;
    double v14 = v16;
    goto LABEL_9;
  }
  if ([(UIScrollView *)self isScrollAnimating])
  {
    [(UIScrollView *)self _animatedTargetOffset];
    goto LABEL_8;
  }
LABEL_9:
  int64_t navigationOrientation = self->_navigationOrientation;
  [(UIView *)self bounds];
  if (navigationOrientation)
  {
    double Height = CGRectGetHeight(*(CGRect *)&v18);
    if (a3) {
      double Height = -Height;
    }
    double v14 = v14 + Height;
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)&v18);
    if (a3) {
      double Width = -Width;
    }
    double v12 = v12 + Width;
  }
  if (![(NSMutableArray *)self->_completionStateQueue count])
  {
    double v29 = [_UIQueuingScrollViewState alloc];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_4;
    v72[3] = &unk_1E52E9010;
    v72[4] = self;
    id v73 = v9;
    int64_t v75 = a3;
    id v74 = v10;
    double v27 = [(_UIQueuingScrollViewState *)v29 initWithTransitionDirection:a3 view:v73 manual:0 completion:v72];
    [(NSMutableArray *)self->_viewStateQueue _ui_enqueue:v27];
    double v30 = (void *)MEMORY[0x1E4F1C978];
    if (a3 == 1)
    {
      double v31 = [(_UIQueuingScrollView *)self _visibleView];
      double v32 = @"kUIFaultingViewSentinel";
    }
    else
    {
      double v32 = [(NSArray *)self->_views objectAtIndex:0];
      double v31 = [(_UIQueuingScrollView *)self _visibleView];
      if (!a3)
      {
        v62 = @"kUIFaultingViewSentinel";
LABEL_37:
        v63 = objc_msgSend(v30, "arrayWithObjects:", v32, v31, v62, 0);
        [(_UIQueuingScrollView *)self _replaceViews:v63 updatingContents:1 adjustContentInsets:1 animated:1];

        if (a3)
        {

          if (a3 == 1) {
            goto LABEL_43;
          }
        }
        else
        {
        }
LABEL_43:
        [(_UIQueuingScrollView *)self _enqueueCompletionState:v27];
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);

        double v28 = v73;
        goto LABEL_44;
      }
    }
    v62 = [(NSArray *)self->_views objectAtIndex:2];
    goto LABEL_37;
  }
  CGRect v24 = [(NSMutableArray *)self->_completionStateQueue lastObject];
  uint64_t v25 = [v24 transitionDirection];

  if (v25 == a3)
  {
    double v26 = [_UIQueuingScrollViewState alloc];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_3;
    v76[3] = &unk_1E52E9010;
    v76[4] = self;
    id v77 = v9;
    int64_t v79 = a3;
    id v78 = v10;
    double v27 = [(_UIQueuingScrollViewState *)v26 initWithTransitionDirection:a3 view:v77 manual:0 completion:v76];
    [(NSMutableArray *)self->_viewStateQueue _ui_enqueue:v27];
    [(_UIQueuingScrollView *)self _enqueueCompletionState:v27];
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);

    double v28 = v77;
LABEL_44:

    goto LABEL_45;
  }
  uint64_t v33 = [(NSMutableArray *)self->_completionStateQueue count];
  completionStateQueue = self->_completionStateQueue;
  if (v33 == 1)
  {
    CGRect v35 = [(NSMutableArray *)completionStateQueue _ui_dequeue];
    [(_UIQueuingScrollView *)self _cleanUpCompletionState:v35 didFinish:0 didComplete:0];

    v36 = [_UIQueuingScrollViewState alloc];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke;
    v87[3] = &unk_1E52E9010;
    v87[4] = self;
    id v37 = v9;
    id v88 = v37;
    int64_t v90 = a3;
    id v71 = v10;
    id v89 = v10;
    double v27 = [(_UIQueuingScrollViewState *)v36 initWithTransitionDirection:a3 view:v37 manual:0 completion:v87];
    [(UIScrollView *)self _stopScrollingAndZoomingAnimationsPinningToContentViewport:0];
    [(_UIQueuingScrollView *)self _enqueueCompletionState:v27];
    v38 = [(_UIQueuingScrollView *)self _visibleView];
    [(_UIQueuingScrollView *)self _notifyDelegateWillManuallyScroll:0 toRevealView:v37 concealingView:v38 animated:1];

    v39 = [(_UIQueuingScrollView *)self _visibleView];
    [(_UIQueuingScrollView *)self _notifyDelegateDidCommitManualScroll:0 toRevealView:v37 concealView:v39 direction:a3 animated:1 canComplete:1];

    v40 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v41 = [(_UIQueuingScrollView *)self _viewAtIndex:0 loadingIfNecessary:0 updatingContents:0 animated:1];
    v42 = (void *)v41;
    if (v41) {
      v43 = (__CFString *)v41;
    }
    else {
      v43 = @"kUIFaultingViewSentinel";
    }
    uint64_t v44 = [(_UIQueuingScrollView *)self _viewAtIndex:2 loadingIfNecessary:0 updatingContents:0 animated:1];
    v45 = (void *)v44;
    if (v44) {
      v46 = (__CFString *)v44;
    }
    else {
      v46 = @"kUIFaultingViewSentinel";
    }
    v47 = objc_msgSend(v40, "arrayWithObjects:", v43, v37, v46, 0);
    [(_UIQueuingScrollView *)self _replaceViews:v47 updatingContents:1 adjustContentInsets:1 animated:1];

    [(UIScrollView *)self _contentOffsetAnimationDuration];
    double v49 = v48;
    int64_t v50 = self->_navigationOrientation;
    [(UIScrollView *)self contentOffset];
    double v52 = v12 - v51;
    double v54 = v14 - v53;
    if (v50) {
      double v52 = v54;
    }
    if (v52 >= 0.0) {
      double v55 = v52;
    }
    else {
      double v55 = -v52;
    }
    int64_t v56 = self->_navigationOrientation;
    [(UIView *)self bounds];
    if (v56) {
      double v61 = CGRectGetHeight(*(CGRect *)&v57);
    }
    else {
      double v61 = CGRectGetWidth(*(CGRect *)&v57);
    }
    [(UIScrollView *)self _setContentOffsetAnimationDuration:v49 * (v55 / v61)];
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);
    [(UIScrollView *)self _setContentOffsetAnimationDuration:v49];

    id v10 = v71;
  }
  else
  {
    v64 = [(NSMutableArray *)completionStateQueue lastObject];
    [(NSMutableArray *)self->_completionStateQueue removeLastObject];
    [(NSMutableArray *)self->_viewStateQueue removeObject:v64];
    v65 = [(NSMutableArray *)self->_completionStateQueue lastObject];
    [(NSMutableArray *)self->_completionStateQueue removeLastObject];
    v66 = [_UIQueuingScrollViewState alloc];
    uint64_t v67 = [v65 transitionDirection];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_2;
    v80[3] = &unk_1E52E9038;
    v80[4] = self;
    id v81 = v65;
    id v82 = v64;
    id v83 = v9;
    int64_t v85 = a3;
    id v84 = v10;
    SEL v86 = a2;
    id v68 = v64;
    id v69 = v65;
    double v27 = [(_UIQueuingScrollViewState *)v66 initWithTransitionDirection:v67 view:v83 manual:0 completion:v80];
    [(_UIQueuingScrollView *)self _enqueueCompletionState:v27];
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);
  }
LABEL_45:
}

- (void)_notifyDelegateWillManuallyScroll:(BOOL)a3 toRevealView:(id)a4 concealingView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v12 = a4;
  id v10 = a5;
  if (v12 && (*(_WORD *)&self->_delegateFlags & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    [WeakRetained queuingScrollView:self willManuallyScroll:v8 toRevealView:v12 concealView:v10 animated:v6];
  }
}

- (void)_notifyDelegateDidCommitManualScroll:(BOOL)a3 toRevealView:(id)a4 concealView:(id)a5 direction:(int64_t)a6 animated:(BOOL)a7 canComplete:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v12 = a3;
  id v17 = a4;
  id v14 = a5;
  if (v17 && (*(_WORD *)&self->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    LOBYTE(v16) = a8;
    [WeakRetained queuingScrollView:self didCommitManualScroll:v12 toRevealView:v17 concealView:v14 direction:a6 animated:v9 canComplete:v16];
  }
}

- (void)_notifyDelegateDidEndManualScroll:(BOOL)a3 toRevealView:(id)a4 direction:(int64_t)a5 animated:(BOOL)a6 didFinish:(BOOL)a7 didComplete:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v12 = a3;
  id v14 = a4;
  if (v14 && (*(_WORD *)&self->_delegateFlags & 4) != 0)
  {
    id v17 = v14;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    LOBYTE(v16) = a8;
    [WeakRetained queuingScrollView:self didEndManualScroll:v12 toRevealView:v17 direction:a5 animated:v10 didFinish:v9 didComplete:v16];

    id v14 = v17;
  }
}

- (void)_notifyDelegateDidBailoutOfScrollAndRevealedView:(id)a3
{
  if ((*(_WORD *)&self->_delegateFlags & 8) != 0)
  {
    p_qDelegate = &self->_qDelegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_qDelegate);
    [WeakRetained queuingScrollView:self didBailoutOfScrollAndRevealedView:v5];
  }
}

- (void)_notifyDelegateDidFinishScrolling
{
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    [WeakRetained queuingScrollViewDidFinishScrolling:self];
  }
}

- (void)setView:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v17 = a3;
  double v11 = (void (**)(id, uint64_t, uint64_t))a6;
  if (!v17)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIQueuingScrollView.m", 681, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  if (![(UIScrollView *)self isTracking] || ![(UIScrollView *)self isDragging])
  {
    if (a5)
    {
      [(_UIQueuingScrollView *)self _enqueueAnimatedScrollInDirection:a4 withView:v17 completion:v11];
    }
    else
    {
      while ([(NSMutableArray *)self->_completionStateQueue count])
      {
        BOOL v12 = [(NSMutableArray *)self->_completionStateQueue _ui_dequeue];
        [(_UIQueuingScrollView *)self _cleanUpCompletionState:v12 didFinish:0 didComplete:0];
      }
      [(NSMutableArray *)self->_viewStateQueue removeAllObjects];
      double v13 = [(_UIQueuingScrollView *)self _visibleView];
      [(_UIQueuingScrollView *)self _notifyDelegateWillManuallyScroll:0 toRevealView:v17 concealingView:v13 animated:0];

      id v14 = [(_UIQueuingScrollView *)self _visibleView];
      [(_UIQueuingScrollView *)self _notifyDelegateDidCommitManualScroll:0 toRevealView:v17 concealView:v14 direction:a4 animated:0 canComplete:1];

      double v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v17, @"kUIFaultingViewSentinel", 0);
      [(_UIQueuingScrollView *)self _replaceViews:v15 updatingContents:1 adjustContentInsets:1 animated:0];

      [(_UIQueuingScrollView *)self _notifyDelegateDidEndManualScroll:0 toRevealView:v17 direction:a4 animated:0 didFinish:1 didComplete:1];
      if (v11) {
        v11[2](v11, 1, 1);
      }
    }
  }
}

- (void)_adjustContentInsets
{
  double v3 = [(_UIQueuingScrollView *)self _visibleView];

  if (v3)
  {
    [(UIView *)self bounds];
    double v6 = v4;
    double v7 = v5;
    int64_t navigationOrientation = self->_navigationOrientation;
    if (navigationOrientation) {
      double v9 = v5 * 100.0;
    }
    else {
      double v9 = 0.0;
    }
    if (navigationOrientation) {
      double v10 = 0.0;
    }
    else {
      double v10 = v4 * 100.0;
    }
    double v11 = [(_UIQueuingScrollView *)self _viewAtIndex:0 loadingIfNecessary:1 updatingContents:0 animated:0];

    double v12 = v10;
    double v13 = v9;
    if (!v11)
    {
      int64_t v14 = self->_navigationOrientation;
      if (v14) {
        double v12 = v10;
      }
      else {
        double v12 = -v6;
      }
      if (v14) {
        double v13 = -v7;
      }
      else {
        double v13 = v9;
      }
    }
    double v15 = [(_UIQueuingScrollView *)self _viewAtIndex:2 loadingIfNecessary:1 updatingContents:0 animated:0];

    if (!v15)
    {
      if (self->_navigationOrientation) {
        double v9 = -v7;
      }
      else {
        double v10 = -v6;
      }
    }
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
  }
  -[UIScrollView setContentInset:](self, "setContentInset:", v13, v12, v9, v10);
}

- (void)_boundsDidChangeToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = a3.height * 3.0;
  if (self->_navigationOrientation) {
    a3.double height = a3.height * 3.0;
  }
  else {
    a3.double width = a3.width * 3.0;
  }
  -[UIScrollView setContentSize:](self, "setContentSize:", a3.width, a3.height, v6);
  int64_t navigationOrientation = self->_navigationOrientation;
  if (navigationOrientation) {
    double v8 = 0.0;
  }
  else {
    double v8 = width;
  }
  if (navigationOrientation) {
    double v9 = height;
  }
  else {
    double v9 = 0.0;
  }
  -[UIScrollView setContentOffset:](self, "setContentOffset:", v8, v9);
  double v10 = [(NSArray *)self->_wrapperViews objectAtIndex:0];
  double v11 = v10;
  int64_t v12 = self->_navigationOrientation;
  double pageSpacing = self->_pageSpacing;
  double v14 = height - (pageSpacing + pageSpacing);
  double v15 = width - (pageSpacing + pageSpacing);
  if (v12) {
    double v16 = 0.0;
  }
  else {
    double v16 = self->_pageSpacing;
  }
  if (v12)
  {
    double v15 = width;
  }
  else
  {
    double pageSpacing = 0.0;
    double v14 = height;
  }
  objc_msgSend(v10, "setFrame:", v16, pageSpacing, v15, v14);

  id v17 = [(NSArray *)self->_wrapperViews objectAtIndex:1];
  uint64_t v18 = v17;
  int64_t v19 = self->_navigationOrientation;
  double v20 = self->_pageSpacing;
  double v21 = v20 + v20;
  double v22 = height + v20;
  double v23 = height - (v20 + v20);
  double v24 = width + v20;
  double v25 = width - v21;
  if (v19)
  {
    double v24 = 0.0;
    double v26 = v22;
  }
  else
  {
    double v26 = 0.0;
  }
  if (v19) {
    double v27 = width;
  }
  else {
    double v27 = v25;
  }
  if (!v19) {
    double v23 = height;
  }
  objc_msgSend(v17, "setFrame:", v24, v26, v27, v23, v25);

  double v28 = [(NSArray *)self->_wrapperViews objectAtIndex:2];
  double v29 = v28;
  int64_t v30 = self->_navigationOrientation;
  double v31 = self->_pageSpacing;
  double v32 = v31 + v31;
  double v33 = height + height + v31;
  double v34 = height - (v31 + v31);
  double v35 = width + width + v31;
  double v36 = width - v32;
  if (v30)
  {
    double v35 = 0.0;
    double v37 = v33;
  }
  else
  {
    double v37 = 0.0;
  }
  if (v30) {
    double v38 = width;
  }
  else {
    double v38 = v36;
  }
  if (!v30) {
    double v34 = height;
  }
  objc_msgSend(v28, "setFrame:", v35, v37, v38, v34, v36);

  [(_UIQueuingScrollView *)self _adjustContentInsets];
}

- (void)_commitGestureDrivenScrollRevealingView:(id)a3 concealingView:(id)a4 inDirection:(int64_t)a5 canComplete:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  int64_t v12 = v11;
  if (v10 && v11)
  {
    double v13 = [(NSMutableArray *)self->_completionStateQueue lastObject];
    if ([v13 isManual])
    {
      id v14 = [v13 view];
      if (v14 == v10)
      {
        uint64_t v15 = [v13 transitionDirection];

        if (v15 == a5)
        {
          double v16 = 0;
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    id v17 = [_UIQueuingScrollViewState alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __103___UIQueuingScrollView__commitGestureDrivenScrollRevealingView_concealingView_inDirection_canComplete___block_invoke;
    v24[3] = &unk_1E52E9060;
    v24[4] = self;
    id v25 = v10;
    int64_t v26 = a5;
    double v16 = [(_UIQueuingScrollViewState *)v17 initWithTransitionDirection:a5 view:v25 manual:1 completion:v24];

LABEL_9:
    if ([v13 isManual])
    {
      uint64_t v18 = [v13 view];

      if (v18 == v12)
      {
        double v22 = [v13 view];
        double v23 = [(_UIQueuingScrollView *)self _visibleView];
        BOOL v20 = v22 == v23;

LABEL_21:
        [(NSMutableArray *)self->_completionStateQueue removeLastObject];
        [(_UIQueuingScrollView *)self _cleanUpCompletionState:v13 didFinish:v20 didComplete:v20];
        if (!v16) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      uint64_t v19 = [v13 transitionDirection];
      if (v19 != [(_UITransitionState *)v16 transitionDirection])
      {
        BOOL v20 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      while ([(NSMutableArray *)self->_completionStateQueue count])
      {
        double v21 = [(NSMutableArray *)self->_completionStateQueue _ui_dequeue];
        [(_UIQueuingScrollView *)self _cleanUpCompletionState:v21 didFinish:0 didComplete:0];
      }
      [(NSMutableArray *)self->_viewStateQueue removeAllObjects];
    }
    if (!v16)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    [(_UIQueuingScrollView *)self _enqueueCompletionState:v16];
    [(_UIQueuingScrollView *)self _notifyDelegateDidCommitManualScroll:1 toRevealView:v10 concealView:v12 direction:a5 animated:1 canComplete:v6];
    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)_isDeceleratingInOppositionToNavigationDirection:(int64_t)a3
{
  if (a3 == -1)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIQueuingScrollView.m" lineNumber:779 description:@"'Undetermined' is not a valid navigation direction for this method"];
  }
  BOOL v5 = [(UIScrollView *)self isDecelerating];
  if (v5)
  {
    int64_t navigationOrientation = self->_navigationOrientation;
    [(UIScrollView *)self contentOffset];
    if (navigationOrientation) {
      double v9 = v8;
    }
    else {
      double v9 = v7;
    }
    int64_t v10 = self->_navigationOrientation;
    [(UIScrollView *)self _pageDecelerationTarget];
    if (v10) {
      double v11 = v12;
    }
    if (a3) {
      LOBYTE(v5) = v9 < v11;
    }
    else {
      LOBYTE(v5) = v11 < v9;
    }
  }
  return v5;
}

- (BOOL)_isScrollInProgress:(BOOL)a3
{
  if ([(UIScrollView *)self isTracking]) {
    return 1;
  }
  else {
    return [(UIScrollView *)self isDecelerating] || a3;
  }
}

- (void)_didScrollWithAnimation:(BOOL)a3 force:(BOOL)a4
{
  BOOL v5 = a3;
  v45[3] = *MEMORY[0x1E4F143B8];
  BOOL v8 = -[_UIQueuingScrollView _isScrollInProgress:](self, "_isScrollInProgress:");
  BOOL v9 = v8;
  if (a4
    || v8
    && ![(UIScrollView *)self _isHorizontalBouncing]
    && ![(UIScrollView *)self _isVerticalBouncing])
  {
    if ([(UIScrollView *)self isTracking]) {
      LOBYTE(v10) = 1;
    }
    else {
      BOOL v10 = [(UIScrollView *)self isDecelerating] && !v5;
    }
    self->_manualScrollInProgress = v10;
    [(UIView *)self bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    if (v9) {
      int64_t v19 = [(_UIQueuingScrollView *)self _navigationDirectionForActiveScroll:v5];
    }
    else {
      int64_t v19 = [(_UIQueuingScrollView *)self _navigationDirectionFromCurrentOffset];
    }
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54___UIQueuingScrollView__didScrollWithAnimation_force___block_invoke;
    v37[3] = &unk_1E52E9088;
    v37[4] = self;
    v37[5] = &v40;
    BOOL v38 = v5;
    BOOL v39 = v9;
    v37[6] = v19;
    v37[7] = a2;
    *(double *)&v37[8] = v12;
    *(double *)&v37[9] = v14;
    *(double *)&v37[10] = v12;
    *(double *)&v37[11] = v14;
    *(double *)&v37[12] = v16;
    *(double *)&v37[13] = v18;
    BOOL v20 = _Block_copy(v37);
    double v21 = v20;
    int64_t navigationOrientation = self->_navigationOrientation;
    if ((navigationOrientation || v12 >= v16) && (navigationOrientation != 1 || v14 >= v18))
    {
      BOOL v29 = v14 > v18 && navigationOrientation == 1;
      BOOL v30 = v12 > v16 && navigationOrientation == 0;
      uint64_t v23 = 2;
      if (!v30 && !v29) {
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    if (!(*((unsigned int (**)(void *, uint64_t))v20 + 2))(v20, v23))
    {
LABEL_57:

      _Block_object_dispose(&v40, 8);
      return;
    }
    double v24 = [(NSMutableArray *)self->_completionStateQueue _ui_dequeue];
    [(_UIQueuingScrollView *)self _cleanUpCompletionState:v24 didFinish:1 didComplete:1];

    uint64_t v25 = v41[3];
    if (v25 == -1)
    {
      uint64_t v31 = [(_UIQueuingScrollView *)self _viewAtIndex:0 loadingIfNecessary:0 updatingContents:0 animated:v5];
      int64_t v26 = (void *)v31;
      if (v31)
      {
        double v32 = @"kUIFaultingViewSentinel";
        v44[0] = @"kUIFaultingViewSentinel";
        v44[1] = v31;
        if (!v5)
        {
          double v32 = [(_UIQueuingScrollView *)self _visibleView];
        }
        v44[2] = v32;
        double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
        if (!v5) {
      }
        }
      else
      {
        double v33 = 0;
      }
      int64_t v34 = self->_navigationOrientation;
      double v35 = v12 + v16;
      double v36 = v14 + v18;
    }
    else
    {
      if (v25 != 1)
      {
        double v33 = 0;
LABEL_56:
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v12, v14);
        [(_UIQueuingScrollView *)self _adjustContentInsets];

        goto LABEL_57;
      }
      int64_t v26 = [(_UIQueuingScrollView *)self _viewAtIndex:2 loadingIfNecessary:0 updatingContents:0 animated:v5];
      if (v26)
      {
        if (v5)
        {
          double v27 = @"kUIFaultingViewSentinel";
        }
        else
        {
          double v27 = [(_UIQueuingScrollView *)self _visibleView];
        }
        v45[0] = v27;
        v45[1] = v26;
        v45[2] = @"kUIFaultingViewSentinel";
        double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
        if (!v5) {
      }
        }
      else
      {
        double v33 = 0;
      }
      int64_t v34 = self->_navigationOrientation;
      double v35 = v12 - v16;
      double v36 = v14 - v18;
    }
    if (v34) {
      double v12 = 0.0;
    }
    else {
      double v12 = v35;
    }
    if (v34) {
      double v14 = v36;
    }
    else {
      double v14 = 0.0;
    }

    if (v33) {
      [(_UIQueuingScrollView *)self _replaceViews:v33 updatingContents:1 adjustContentInsets:1 animated:v5];
    }
    goto LABEL_56;
  }
}

- (void)_didEndDraggingManualScroll
{
  int64_t v3 = [(_UIQueuingScrollView *)self _navigationDirectionForActiveScroll:0];
  if (v3 == -1) {
    return;
  }
  int64_t v4 = v3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v34 = [(NSMutableArray *)self->_completionStateQueue lastObject];
  int64_t navigationOrientation = self->_navigationOrientation;
  if (navigationOrientation) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v6 < v10;
  }
  if (v14 || (navigationOrientation == 1 ? (BOOL v15 = v8 < v12) : (BOOL v15 = 0), v15))
  {
    BOOL v20 = [(_UIQueuingScrollView *)self _viewAtIndex:0 loadingIfNecessary:1 updatingContents:1 animated:1];
    if (!v34
      || (uint64_t v24 = [v34 transitionDirection], v4)
      || v24 != 1
      || ([v34 view], uint64_t v25 = (UIView *)objc_claimAutoreleasedReturnValue(), v25, v25 != v20))
    {
      if ([(UIScrollView *)self _pagingLeft] || [(UIScrollView *)self _pagingUp]) {
        goto LABEL_37;
      }
      if (v4)
      {
        pendingVisibleView = self->_pendingVisibleView;
        if (!pendingVisibleView) {
          goto LABEL_37;
        }
        BOOL v29 = [(_UIQueuingScrollView *)self _visibleView];

        BOOL v23 = 0;
        if (pendingVisibleView == v29) {
          goto LABEL_37;
        }
      }
      else
      {
        BOOL v23 = 1;
      }
      uint64_t v31 = self->_pendingVisibleView;
LABEL_47:
      if (!v31) {
        uint64_t v31 = v20;
      }
      double v27 = v31;
      int64_t v26 = [(_UIQueuingScrollView *)self _visibleView];
      uint64_t v30 = 0;
      goto LABEL_50;
    }
    double v27 = [(_UIQueuingScrollView *)self _visibleView];
    int64_t v26 = v20;
    BOOL v23 = 0;
LABEL_44:
    uint64_t v30 = 1;
LABEL_50:
    [(_UIQueuingScrollView *)self _commitGestureDrivenScrollRevealingView:v27 concealingView:v26 inDirection:v23 canComplete:v30];
    goto LABEL_51;
  }
  BOOL v17 = v8 > v12 && navigationOrientation == 1;
  if ((v6 <= v10 || navigationOrientation != 0) && !v17) {
    goto LABEL_52;
  }
  BOOL v20 = [(_UIQueuingScrollView *)self _viewAtIndex:2 loadingIfNecessary:1 updatingContents:1 animated:1];
  if (v34)
  {
    uint64_t v21 = [v34 transitionDirection];
    if (v4 == 1 && !v21)
    {
      double v22 = [v34 view];

      if (v22 == v20)
      {
        double v27 = [(_UIQueuingScrollView *)self _visibleView];
        int64_t v26 = v20;
        BOOL v23 = 1;
        goto LABEL_44;
      }
    }
  }
  if (![(UIScrollView *)self _pagingRight] && ![(UIScrollView *)self _pagingDown])
  {
    if (v4 == 1)
    {
      BOOL v23 = 0;
LABEL_59:
      uint64_t v31 = self->_pendingVisibleView;
      goto LABEL_47;
    }
    double v32 = self->_pendingVisibleView;
    if (v32)
    {
      double v33 = [(_UIQueuingScrollView *)self _visibleView];

      if (v32 != v33)
      {
        BOOL v23 = v4 == 0;
        goto LABEL_59;
      }
    }
  }
LABEL_37:
  int64_t v26 = 0;
  double v27 = 0;
LABEL_51:

LABEL_52:
}

- (void)_didEndScroll:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || (unint64_t)[(NSMutableArray *)self->_completionStateQueue count] > 1)
  {
    int v6 = 0;
  }
  else if (self->_manualScrollInProgress)
  {
    double v5 = [(NSMutableArray *)self->_completionStateQueue _ui_peek];
    int v6 = [v5 isManual];
  }
  else
  {
    int v6 = 1;
  }
  int64_t v7 = [(_UIQueuingScrollView *)self _navigationDirectionFromCurrentOffset];
  int64_t v8 = [(_UIQueuingScrollView *)self _navigationDirectionForActiveScroll:v3];
  if (v6 && v7 == v8)
  {
    if ([(NSMutableArray *)self->_completionStateQueue count] == 1)
    {
      double v9 = [(NSMutableArray *)self->_completionStateQueue _ui_dequeue];
      double v10 = [v9 view];
      double v11 = [(_UIQueuingScrollView *)self _visibleView];
      [(_UIQueuingScrollView *)self _cleanUpCompletionState:v9 didFinish:1 didComplete:v10 == v11];

      if (![(UIScrollView *)self isTracking])
      {
        pendingVisibleView = self->_pendingVisibleView;
        self->_pendingVisibleView = 0;
      }
    }
    [(UIScrollView *)self contentOffset];
    double v14 = v13;
    double v16 = v15;
    int64_t navigationOrientation = self->_navigationOrientation;
    [(UIView *)self bounds];
    if (navigationOrientation)
    {
      if (v16 != CGRectGetHeight(*(CGRect *)&v18))
      {
        [(UIView *)self bounds];
        double Height = CGRectGetHeight(v27);
LABEL_18:
        double Width = v14;
        goto LABEL_19;
      }
    }
    else if (v14 != CGRectGetWidth(*(CGRect *)&v18))
    {
      [(UIView *)self bounds];
      double Width = CGRectGetWidth(v28);
      double Height = v16;
LABEL_19:
      if (v14 != Width || v16 != Height)
      {
        [(UIScrollView *)self _stopScrollingAndZoomingAnimationsPinningToContentViewport:0];
        -[UIScrollView setContentOffset:](self, "setContentOffset:", Width, Height);
        while ([(NSMutableArray *)self->_completionStateQueue count])
        {
          uint64_t v24 = [(NSMutableArray *)self->_completionStateQueue _ui_dequeue];
          [(_UIQueuingScrollView *)self _cleanUpCompletionState:v24 didFinish:0 didComplete:0];
        }
        id v25 = [(_UIQueuingScrollView *)self _visibleView];
        [(_UIQueuingScrollView *)self _notifyDelegateDidBailoutOfScrollAndRevealedView:v25];
      }
      return;
    }
    double Height = v16;
    goto LABEL_18;
  }
}

- (void)_didEndManualScroll
{
  [(_UIQueuingScrollView *)self _didEndScroll:[(UIScrollView *)self isScrollAnimating]];
  self->_manualScrollInProgress = 0;
  [(_UIQueuingScrollView *)self _notifyDelegateDidFinishScrolling];
}

- (void)_didEndProgrammaticScroll
{
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_UIQueuingScrollViewDelegate)qDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
  return (_UIQueuingScrollViewDelegate *)WeakRetained;
}

- (_UIQueuingScrollViewDataSource)qDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
  return (_UIQueuingScrollViewDataSource *)WeakRetained;
}

- (double)pageSpacing
{
  return self->_pageSpacing;
}

- (CGRect)disabledScrollingRegion
{
  double x = self->_disabledScrollingRegion.origin.x;
  double y = self->_disabledScrollingRegion.origin.y;
  double width = self->_disabledScrollingRegion.size.width;
  double height = self->_disabledScrollingRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDisabledScrollingRegion:(CGRect)a3
{
  self->_disabledScrollingRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionStateQueue, 0);
  objc_storeStrong((id *)&self->_viewStateQueue, 0);
  objc_storeStrong((id *)&self->_pendingVisibleView, 0);
  objc_storeStrong((id *)&self->_wrapperViews, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_destroyWeak((id *)&self->_qDataSource);
  objc_destroyWeak((id *)&self->_qDelegate);
}

@end