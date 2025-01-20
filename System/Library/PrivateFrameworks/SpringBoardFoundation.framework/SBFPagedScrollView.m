@interface SBFPagedScrollView
- ($84C2DBCCA2B823D09AAE1B571F67BB87)currentScrollInterval;
- (BOOL)gestureEnabled;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)resetContentOffsetToCurrentPage;
- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)scrollToPageAtIndex:(unint64_t)a3 withAnimationSettings:(id)a4 withCompletion:(id)a5;
- (CGPoint)contentOffsetForPageAtIndex:(unint64_t)a3;
- (NSArray)pageViews;
- (SBFPagedScrollView)initWithFrame:(CGRect)a3;
- (_NSRange)visiblePageRange;
- (double)pageRelativeScrollOffset;
- (double)unclippedPageRelativeScrollOffset;
- (unint64_t)currentPageIndex;
- (void)_bs_didEndScrolling;
- (void)_bs_didScrollWithContext:(id *)a3;
- (void)_bs_willBeginScrolling;
- (void)_layoutScrollView;
- (void)_updateCurrentPageForScrollOffset;
- (void)_updateVisiblePages;
- (void)layoutPages;
- (void)layoutSubviews;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGestureEnabled:(BOOL)a3;
- (void)setPageViews:(id)a3;
- (void)setVisiblePageRange:(_NSRange)a3;
@end

@implementation SBFPagedScrollView

- (SBFPagedScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFPagedScrollView;
  v3 = -[BSUIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentPageIndex = 0;
    v3->_visiblePageRange.location = 0;
    v3->_visiblePageRange.length = 0;
    v3->_gestureEnabled = 1;
    v3->_changingScrollViewLayout = 0;
    [(SBFPagedScrollView *)v3 setPagingEnabled:1];
    [(SBFPagedScrollView *)v4 setAlwaysBounceHorizontal:1];
    [(SBFPagedScrollView *)v4 setShowsHorizontalScrollIndicator:0];
  }
  return v4;
}

- (void)setPageViews:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_pageViews isEqualToArray:v4]) {
    goto LABEL_27;
  }
  pageViews = self->_pageViews;
  objc_super v6 = (void *)MEMORY[0x1E4F28F60];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __35__SBFPagedScrollView_setPageViews___block_invoke;
  v38[3] = &unk_1E548C878;
  id v7 = v4;
  id v39 = v7;
  v8 = [v6 predicateWithBlock:v38];
  v9 = [(NSArray *)pageViews filteredArrayUsingPredicate:v8];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __35__SBFPagedScrollView_setPageViews___block_invoke_2;
  v37[3] = &unk_1E548C878;
  v37[4] = self;
  v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v37];
  v11 = [v7 filteredArrayUsingPredicate:v10];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v7 containsObject:v17] & 1) == 0) {
          [v17 removeFromSuperview];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v14);
  }

  unint64_t v18 = [(SBFPagedScrollView *)self currentPageIndex];
  if (v18 >= [(NSArray *)self->_pageViews count])
  {
    v19 = 0;
    if (!v7) {
      goto LABEL_16;
    }
  }
  else
  {
    v19 = [(NSArray *)self->_pageViews objectAtIndex:[(SBFPagedScrollView *)self currentPageIndex]];
    if (!v7)
    {
LABEL_16:
      uint64_t v21 = [v7 count];
      if (v21 - 1 >= self->_currentPageIndex) {
        unint64_t currentPageIndex = self->_currentPageIndex;
      }
      else {
        unint64_t currentPageIndex = v21 - 1;
      }
      goto LABEL_19;
    }
  }
  unint64_t currentPageIndex = [v7 indexOfObjectIdenticalTo:v19];
  if (currentPageIndex == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_16;
  }
LABEL_19:
  v22 = (NSArray *)[v7 copy];
  v23 = self->_pageViews;
  self->_pageViews = v22;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = v11;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[SBFPagedScrollView insertSubview:atIndex:](self, "insertSubview:atIndex:", *(void *)(*((void *)&v29 + 1) + 8 * j), 0, (void)v29);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v26);
  }

  [(SBFPagedScrollView *)self setCurrentPageIndex:currentPageIndex];
  [(SBFPagedScrollView *)self _layoutScrollView];
  [(SBFPagedScrollView *)self _updateVisiblePages];

LABEL_27:
}

uint64_t __35__SBFPagedScrollView_setPageViews___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __35__SBFPagedScrollView_setPageViews___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 2128) containsObject:a2] ^ 1;
}

- ($84C2DBCCA2B823D09AAE1B571F67BB87)currentScrollInterval
{
  [(BSUIScrollView *)self currentScrollContext];
  $06DF839FA51B3C3CDB187C0923524556 v5 = *($06DF839FA51B3C3CDB187C0923524556 *)(MEMORY[0x1E4F4F638] + 16);
  retstr->var0 = ($06DF839FA51B3C3CDB187C0923524556)*MEMORY[0x1E4F4F638];
  retstr->var1 = v5;
  objc_super v6 = [(SBFPagedScrollView *)self pageViews];
  [v6 count];

  result = [(SBFPagedScrollView *)self currentPageIndex];
  *((_DWORD *)&retstr->var0.var1 + 1) = 0;
  *(_DWORD *)(&retstr->var0.var1 + 1) = 0;
  *(_DWORD *)(&retstr->var1.var1 + 1) = 0;
  *((_DWORD *)&retstr->var1.var1 + 1) = 0;
  retstr->var0.var0 = (double)(unint64_t)result;
  retstr->var0.var1 = 1;
  retstr->var1.var0 = (double)(unint64_t)result;
  retstr->var1.var1 = 1;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBFPagedScrollView *)self frame];
  if (width != v9 || height != v8) {
    self->_changingScrollViewLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SBFPagedScrollView;
  -[SBFPagedScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  self->_changingScrollViewLayout = 0;
}

- (void)setVisiblePageRange:(_NSRange)a3
{
  if (self->_visiblePageRange.location != a3.location || self->_visiblePageRange.length != a3.length)
  {
    self->_visiblePageRange = a3;
    if (a3.length) {
      -[SBFPagedScrollView setCurrentPageIndex:](self, "setCurrentPageIndex:");
    }
  }
}

- (void)setGestureEnabled:(BOOL)a3
{
  if (self->_gestureEnabled != a3)
  {
    BOOL v3 = a3;
    self->_gestureEnabled = a3;
    id v4 = [(SBFPagedScrollView *)self panGestureRecognizer];
    [v4 setEnabled:v3];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBFPagedScrollView;
  [(SBFPagedScrollView *)&v3 layoutSubviews];
  [(SBFPagedScrollView *)self _layoutScrollView];
}

- (void)_layoutScrollView
{
  objc_super v3 = [(SBFPagedScrollView *)self pageViews];
  unint64_t v4 = [v3 count];

  [(SBFPagedScrollView *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v9 = CGRectGetWidth(v14) * (double)v4;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v15);
  self->_changingScrollViewLayout = 1;
  [(SBFPagedScrollView *)self contentSize];
  if (v9 != v12 || v10 != v11)
  {
    [(SBFPagedScrollView *)self layoutPages];
    -[SBFPagedScrollView setContentSize:](self, "setContentSize:", v9, v10);
    [(SBFPagedScrollView *)self resetContentOffsetToCurrentPage];
  }
  self->_changingScrollViewLayout = 0;
}

- (void)layoutPages
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x4010000000;
  uint64_t v13 = &unk_18B5F9286;
  long long v14 = 0u;
  long long v15 = 0u;
  [(SBFPagedScrollView *)self bounds];
  *(void *)&long long v14 = v3;
  *((void *)&v14 + 1) = v4;
  *(void *)&long long v15 = v5;
  *((void *)&v15 + 1) = v6;
  *((_OWORD *)v11 + 2) = *MEMORY[0x1E4F1DAD8];
  id v7 = [(SBFPagedScrollView *)self pageViews];
  BOOL v8 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__SBFPagedScrollView_layoutPages__block_invoke;
  v9[3] = &unk_1E548C8A0;
  v9[4] = &v10;
  [v7 enumerateObjectsWithOptions:2 * v8 usingBlock:v9];

  _Block_object_dispose(&v10, 8);
}

double __33__SBFPagedScrollView_layoutPages__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v3 + 48) + *(double *)(v3 + 32);
  *(double *)(v3 + 32) = result;
  return result;
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  return [(SBFPagedScrollView *)self scrollToPageAtIndex:a3 animated:a4 withCompletion:0];
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = [(SBFPagedScrollView *)self pageViews];
  unint64_t v10 = [v9 count];

  if (v10 >= a3) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = v10;
  }
  [(SBFPagedScrollView *)self contentOffsetForPageAtIndex:v11];
  double v13 = v12;
  double v15 = v14;
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__SBFPagedScrollView_scrollToPageAtIndex_animated_withCompletion___block_invoke;
  v19[3] = &unk_1E548C8C8;
  objc_copyWeak(&v21, &location);
  id v16 = v8;
  id v20 = v16;
  BOOL v17 = -[BSUIScrollView setContentOffset:animated:completion:](self, "setContentOffset:animated:completion:", v5, v19, v13, v15);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

uint64_t __66__SBFPagedScrollView_scrollToPageAtIndex_animated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCurrentPageForScrollOffset];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 withAnimationSettings:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(SBFPagedScrollView *)self pageViews];
  unint64_t v11 = [v10 count];

  if (v11 >= a3) {
    unint64_t v12 = a3;
  }
  else {
    unint64_t v12 = v11;
  }
  [(SBFPagedScrollView *)self contentOffsetForPageAtIndex:v12];
  double v14 = v13;
  double v16 = v15;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__SBFPagedScrollView_scrollToPageAtIndex_withAnimationSettings_withCompletion___block_invoke;
  v20[3] = &unk_1E548C8C8;
  objc_copyWeak(&v22, &location);
  id v17 = v9;
  id v21 = v17;
  BOOL v18 = -[BSUIScrollView setContentOffset:withAnimationSettings:completion:](self, "setContentOffset:withAnimationSettings:completion:", v8, v20, v14, v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

uint64_t __79__SBFPagedScrollView_scrollToPageAtIndex_withAnimationSettings_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCurrentPageForScrollOffset];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)resetContentOffsetToCurrentPage
{
  unint64_t v3 = [(SBFPagedScrollView *)self currentPageIndex];
  return [(SBFPagedScrollView *)self scrollToPageAtIndex:v3 animated:0 withCompletion:0];
}

- (double)pageRelativeScrollOffset
{
  unint64_t v3 = [(SBFPagedScrollView *)self pageViews];
  double v4 = (double)(unint64_t)([v3 count] - 1);
  [(SBFPagedScrollView *)self unclippedPageRelativeScrollOffset];
  double v6 = fmax(v5, 0.0);

  if (v6 >= v4) {
    return v4;
  }
  else {
    return v6;
  }
}

- (double)unclippedPageRelativeScrollOffset
{
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    [(SBFPagedScrollView *)self contentSize];
    double v4 = v3;
    [(SBFPagedScrollView *)self frame];
    double v6 = v4 - v5;
    [(SBFPagedScrollView *)self contentOffset];
    double v8 = v6 - v7;
  }
  else
  {
    [(SBFPagedScrollView *)self contentOffset];
    double v8 = v9;
  }
  [(SBFPagedScrollView *)self bounds];
  double Width = CGRectGetWidth(v13);
  int IsZero = BSFloatIsZero();
  double result = v8 / Width;
  if (IsZero) {
    return 0.0;
  }
  return result;
}

- (CGPoint)contentOffsetForPageAtIndex:(unint64_t)a3
{
  double v4 = self;
  [(SBFPagedScrollView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  if (v13 == 1)
  {
    double v4 = [v4 pageViews];
    a3 = [v4 count] + ~a3;
  }
  v18.origin.CGFloat x = v6;
  v18.origin.CGFloat y = v8;
  v18.size.CGFloat width = v10;
  v18.size.CGFloat height = v12;
  double Width = CGRectGetWidth(v18);
  if (v13 == 1) {

  }
  double v15 = Width * (double)a3;
  double v16 = 0.0;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (void)_updateVisiblePages
{
  [(SBFPagedScrollView *)self bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (!CGRectEqualToRect(v20, *MEMORY[0x1E4F1DB28]) && !self->_changingScrollViewLayout)
  {
    [(SBFPagedScrollView *)self _layoutScrollView];
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    double v7 = [(SBFPagedScrollView *)self pageViews];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__SBFPagedScrollView__updateVisiblePages__block_invoke;
    v11[3] = &unk_1E548C8F0;
    *(CGFloat *)&v11[6] = x;
    *(CGFloat *)&v11[7] = y;
    *(CGFloat *)&v11[8] = width;
    *(CGFloat *)&v11[9] = height;
    v11[4] = &v16;
    v11[5] = &v12;
    [v7 enumerateObjectsUsingBlock:v11];

    CGFloat v8 = v17;
    uint64_t v9 = v17[3];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      v13[3] = 0;
      v8[3] = 0;
    }
    else
    {
      uint64_t v10 = v13[3] - v9 + 1;
    }
    -[SBFPagedScrollView setVisiblePageRange:](self, "setVisiblePageRange:", v9, v10);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
}

BOOL __41__SBFPagedScrollView__updateVisiblePages__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  [a2 frame];
  v14.origin.CGFloat x = v5;
  v14.origin.CGFloat y = v6;
  v14.size.CGFloat width = v7;
  v14.size.CGFloat height = v8;
  BOOL result = CGRectIntersectsRect(*(CGRect *)(a1 + 48), v14);
  if (result)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v11 = *(void *)(v10 + 24);
    if (a3 < v11) {
      unint64_t v11 = a3;
    }
    *(void *)(v10 + 24) = v11;
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v13 = *(void *)(v12 + 24);
    if (a3 > v13) {
      unint64_t v13 = a3;
    }
    *(void *)(v12 + 24) = v13;
  }
  return result;
}

- (void)_updateCurrentPageForScrollOffset
{
  if (!self->_changingScrollViewLayout)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      [(SBFPagedScrollView *)self contentSize];
      double v4 = v3;
      [(SBFPagedScrollView *)self frame];
      double v6 = v4 - v5;
      [(SBFPagedScrollView *)self contentOffset];
      double v8 = v6 - v7;
    }
    else
    {
      [(SBFPagedScrollView *)self contentOffset];
      double v8 = v9;
    }
    [(SBFPagedScrollView *)self bounds];
    unint64_t v10 = (unint64_t)(v8 / CGRectGetWidth(v12));
    [(SBFPagedScrollView *)self setCurrentPageIndex:v10];
  }
}

- (void)_bs_willBeginScrolling
{
  v3.receiver = self;
  v3.super_class = (Class)SBFPagedScrollView;
  [(BSUIScrollView *)&v3 _bs_willBeginScrolling];
  [(SBFPagedScrollView *)self _updateVisiblePages];
  [(SBFPagedScrollView *)self _updateCurrentPageForScrollOffset];
}

- (void)_bs_didScrollWithContext:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFPagedScrollView;
  long long v4 = *(_OWORD *)&a3->var1.y;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  CGFloat y = a3->var2.y;
  [(BSUIScrollView *)&v7 _bs_didScrollWithContext:v5];
  [(SBFPagedScrollView *)self _updateVisiblePages];
}

- (void)_bs_didEndScrolling
{
  v3.receiver = self;
  v3.super_class = (Class)SBFPagedScrollView;
  [(BSUIScrollView *)&v3 _bs_didEndScrolling];
  [(SBFPagedScrollView *)self _updateVisiblePages];
  [(SBFPagedScrollView *)self _updateCurrentPageForScrollOffset];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (!self->_gestureEnabled) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFPagedScrollView;
  return [(SBFPagedScrollView *)&v5 gestureRecognizer:a3 shouldReceiveTouch:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(BSUIScrollView *)self isScrolling]
    && ([(SBFPagedScrollView *)self panGestureRecognizer],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v6)
    && [v7 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v7;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v11 = v10;
      }
      else {
        unint64_t v11 = 0;
      }
    }
    else
    {
      unint64_t v11 = 0;
    }
    id v14 = v11;

    if ([v14 _canPanHorizontally]) {
      int v12 = [v14 _canPanVertically] ^ 1;
    }
    else {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSArray)pageViews
{
  return self->_pageViews;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_unint64_t currentPageIndex = a3;
}

- (_NSRange)visiblePageRange
{
  p_visiblePageRange = &self->_visiblePageRange;
  NSUInteger location = self->_visiblePageRange.location;
  NSUInteger length = p_visiblePageRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)gestureEnabled
{
  return self->_gestureEnabled;
}

- (void).cxx_destruct
{
}

@end