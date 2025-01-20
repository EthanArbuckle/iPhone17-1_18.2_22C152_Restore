@interface _PXUIScrollView
- (BOOL)deferContentOffsetUpdates;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)ignoresSafeAreaInsets;
- (BOOL)isFocusFastScrolling;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)respectsContentZOrder;
- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView;
- (CGPoint)pagingOriginOffset;
- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3;
- (NSMutableArray)scrollIndicatorViews;
- (PXUIScrollViewDelegate)px_delegate;
- (UIEdgeInsets)hitTestContentInsets;
- (UIEdgeInsets)safeAreaInsets;
- (_PXUIScrollView)initWithFrame:(CGRect)a3;
- (_PXUIScrollViewFocusItemProvider)focusItemProvider;
- (id)focusItemsInRect:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updatePagingOrigin;
- (void)addSubview:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)px_addSubview:(id)a3;
- (void)px_setDelegate:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDeferContentOffsetUpdates:(BOOL)a3;
- (void)setFocusItemProvider:(id)a3;
- (void)setHitTestContentInsets:(UIEdgeInsets)a3;
- (void)setIgnoresSafeAreaInsets:(BOOL)a3;
- (void)setIsFocusFastScrolling:(BOOL)a3;
- (void)setPagingOriginOffset:(CGPoint)a3;
- (void)setRespectsContentZOrder:(BOOL)a3;
- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation _PXUIScrollView

- (UIEdgeInsets)safeAreaInsets
{
  if ([(_PXUIScrollView *)self ignoresSafeAreaInsets])
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_PXUIScrollView;
    [(_PXUIScrollView *)&v7 safeAreaInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)ignoresSafeAreaInsets
{
  return self->_ignoresSafeAreaInsets;
}

- (BOOL)deferContentOffsetUpdates
{
  return self->_deferContentOffsetUpdates;
}

- (void)layoutSubviews
{
  double v3 = [(_PXUIScrollView *)self px_delegate];
  [v3 scrollViewWillLayoutSubviews:self];

  v5.receiver = self;
  v5.super_class = (Class)_PXUIScrollView;
  [(_PXUIScrollView *)&v5 layoutSubviews];
  double v4 = [(_PXUIScrollView *)self px_delegate];
  [v4 scrollViewDidLayoutSubviews:self];
}

- (PXUIScrollViewDelegate)px_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_px_delegate);
  return (PXUIScrollViewDelegate *)WeakRetained;
}

- (void)setDeferContentOffsetUpdates:(BOOL)a3
{
  if (self->_deferContentOffsetUpdates != a3)
  {
    self->_deferContentOffsetUpdates = a3;
    kdebug_trace();
  }
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  self->_respectsContentZOrder = a3;
}

- (void)px_setDelegate:(id)a3
{
}

- (_PXUIScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PXUIScrollView;
  double v3 = -[_PXUIScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scrollIndicatorViews = v3->_scrollIndicatorViews;
    v3->_scrollIndicatorViews = v4;

    [(_PXUIScrollView *)v3 setAccessibilityIdentifier:@"scroll_view"];
  }
  return v3;
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSMutableArray *)self->_scrollIndicatorViews addObject:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)_PXUIScrollView;
  [(_PXUIScrollView *)&v5 addSubview:v4];
}

- (void)setFocusItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollIndicatorViews, 0);
  objc_destroyWeak((id *)&self->_focusItemProvider);
  objc_destroyWeak((id *)&self->_px_delegate);
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  self->_hitTestContentInsets = a3;
}

- (UIEdgeInsets)hitTestContentInsets
{
  double top = self->_hitTestContentInsets.top;
  double left = self->_hitTestContentInsets.left;
  double bottom = self->_hitTestContentInsets.bottom;
  double right = self->_hitTestContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSMutableArray)scrollIndicatorViews
{
  return self->_scrollIndicatorViews;
}

- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3
{
  self->_shouldScrollSimultaneouslyWithDescendantScrollView = a3;
}

- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView
{
  return self->_shouldScrollSimultaneouslyWithDescendantScrollView;
}

- (BOOL)isFocusFastScrolling
{
  return self->_isFocusFastScrolling;
}

- (void)setIgnoresSafeAreaInsets:(BOOL)a3
{
  self->_ignoresSafeAreaInsets = a3;
}

- (BOOL)respectsContentZOrder
{
  return self->_respectsContentZOrder;
}

- (CGPoint)pagingOriginOffset
{
  double x = self->_pagingOriginOffset.x;
  double y = self->_pagingOriginOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_PXUIScrollViewFocusItemProvider)focusItemProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusItemProvider);
  return (_PXUIScrollViewFocusItemProvider *)WeakRetained;
}

- (void)setIsFocusFastScrolling:(BOOL)a3
{
  if (self->_isFocusFastScrolling != a3)
  {
    BOOL v3 = a3;
    self->_isFocusFastScrolling = a3;
    objc_super v5 = [(_PXUIScrollView *)self px_delegate];
    id v6 = v5;
    if (v3) {
      [v5 scrollViewDidBeginFocusFastScrolling:self];
    }
    else {
      [v5 scrollViewDidEndFocusFastScrolling:self];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_PXUIScrollView *)self shouldScrollSimultaneouslyWithDescendantScrollView])
  {
    id v8 = [(_PXUIScrollView *)self panGestureRecognizer];
    if (v8 == v6)
    {
      id v15 = 0;
      int v11 = objc_msgSend(v7, "px_isPanGestureRecognizerOfScrollView:", &v15);
      id v12 = v15;
      v9 = v12;
      if (v11)
      {
        uint64_t v13 = objc_msgSend(v12, "px_scrollableAxis");
        if (v13 != [(UIScrollView *)self px_scrollableAxis])
        {
          char v10 = [v9 isDescendantOfView:self];
          goto LABEL_8;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    char v10 = 0;
LABEL_8:

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_PXUIScrollView *)self panGestureRecognizer];
  if (v5 == v4)
  {
    [v4 velocityInView:self];
    double v7 = v6;
    double v9 = v8;
    if ([(_PXUIScrollView *)self shouldScrollSimultaneouslyWithDescendantScrollView])
    {
      [(UIScrollView *)self px_scrollableAxis];
      MEMORY[0x1AD10AEE0](v9, v7);
      PXRadiansToDegrees();
    }
    [v4 locationInView:self];
    double v11 = v10;
    double v13 = v12;
    v14 = [(_PXUIScrollView *)self px_delegate];
    char v15 = objc_msgSend(v14, "scrollView:shouldBeginScrollingWithPanAtLocation:velocity:", self, v11, v13, v7, v9);
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_PXUIScrollView;
  [(_PXUIScrollView *)&v6 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68___PXUIScrollView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v5[3] = &unk_1E5DD36F8;
  v5[4] = self;
  [MEMORY[0x1E4F39CF8] addCommitHandler:v5 forPhase:0];
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)_PXUIScrollView;
  double v8 = -[_PXUIScrollView focusItemsInRect:](&v14, sel_focusItemsInRect_);
  double v9 = [(_PXUIScrollView *)self focusItemProvider];
  double v10 = v9;
  if (v9)
  {
    double v11 = objc_msgSend(v9, "focusItemsForScrollView:inRect:", self, x, y, width, height);
    uint64_t v12 = [v8 arrayByAddingObjectsFromArray:v11];

    double v8 = (void *)v12;
  }

  return v8;
}

- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(_PXUIScrollView *)self scrollIndicatorViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        if (a3 == 2)
        {
          [*(id *)(*((void *)&v29 + 1) + 8 * v9) frame];
          double v15 = v14;
          [v10 frame];
          if (v15 > v16) {
            goto LABEL_14;
          }
        }
        else if (a3 == 1)
        {
          [*(id *)(*((void *)&v29 + 1) + 8 * v9) frame];
          double v12 = v11;
          [v10 frame];
          if (v12 > v13)
          {
LABEL_14:
            [(_PXUIScrollView *)self _scrollIndicatorContainerRect];
            double v22 = v21;
            double v24 = v23;
            [v10 frame];
            CGRect v36 = CGRectOffset(v35, -v22, -v24);
            CGFloat x = v36.origin.x;
            CGFloat y = v36.origin.y;
            CGFloat width = v36.size.width;
            CGFloat height = v36.size.height;

            goto LABEL_15;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_15:
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = __Block_byref_object_copy__4682;
  long long v29 = __Block_byref_object_dispose__4683;
  id v30 = 0;
  if ([(_PXUIScrollView *)self respectsContentZOrder]
    && (![v7 type] || objc_msgSend(v7, "type") == 11))
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v8 = [(_PXUIScrollView *)self subviews];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37___PXUIScrollView_hitTest_withEvent___block_invoke;
    v18[3] = &unk_1E5DAF0D0;
    double v22 = x;
    double v23 = y;
    v20 = v24;
    v18[4] = self;
    id v9 = v7;
    id v19 = v9;
    double v21 = &v25;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v18];

    if (!v26[5])
    {
      v17.receiver = self;
      v17.super_class = (Class)_PXUIScrollView;
      uint64_t v10 = -[_PXUIScrollView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v9, x, y);
      double v11 = (void *)v26[5];
      v26[5] = v10;
    }
    _Block_object_dispose(v24, 8);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)_PXUIScrollView;
    uint64_t v12 = -[_PXUIScrollView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    double v13 = (void *)v26[5];
    v26[5] = v12;
  }
  id v14 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(_PXUIScrollView *)self traitCollection];
  [v8 displayScale];

  if (v4) {
    PXPointRoundToPixel();
  }
  v9.receiver = self;
  v9.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView setContentOffset:animated:](&v9, sel_setContentOffset_animated_, v4, x, y);
}

- (void)_updatePagingOrigin
{
}

- (void)setPagingOriginOffset:(CGPoint)a3
{
  if (a3.x != self->_pagingOriginOffset.x || a3.y != self->_pagingOriginOffset.y)
  {
    self->_pagingOriginOffset = a3;
    [(_PXUIScrollView *)self _updatePagingOrigin];
  }
}

- (void)px_addSubview:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_PXUIScrollView;
  [(_PXUIScrollView *)&v3 addSubview:a3];
}

- (void)willRemoveSubview:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSMutableArray *)self->_scrollIndicatorViews removeObject:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)_PXUIScrollView;
  [(_PXUIScrollView *)&v5 willRemoveSubview:v4];
}

@end