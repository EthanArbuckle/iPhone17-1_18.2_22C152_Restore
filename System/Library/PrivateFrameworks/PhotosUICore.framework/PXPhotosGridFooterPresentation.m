@interface PXPhotosGridFooterPresentation
- (BOOL)_shouldAutoRevealFooterView;
- (BOOL)isFooterFullyMasked;
- (BOOL)shouldAutoReveal;
- (BOOL)wantsFooter;
- (BOOL)wantsFooterMask;
- (PXPhotosGridFooterPresentation)init;
- (PXPhotosGridFooterPresentation)initWithViewModel:(id)a3 gridView:(id)a4 layout:(id)a5;
- (PXPhotosGridFooterPresentationDelegate)delegate;
- (UIEdgeInsets)footerMaskPadding;
- (UIView)footerMaskView;
- (double)_footerVisibleAmountIncludingSafeAreaInsets:(BOOL)a3;
- (void)_conditionallyAutoRevealFooterView;
- (void)_conditionallyAutoRevealFooterViewWithLastUserScrollTime:(double)a3;
- (void)_updateFooterAndMaskVisibility;
- (void)_updateFooterMaskPadding;
- (void)_updateFooterMaskViewFrame;
- (void)_updateFooterMaskViewOrder;
- (void)_updateFooterView;
- (void)_updateWantsFooter;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)photosGlobalFooterViewDidChangeHeight:(id)a3;
- (void)photosGlobalFooterViewDidMoveToWindow:(id)a3;
- (void)scrollViewControllerContentBoundsDidChange:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterFullyMasked:(BOOL)a3;
- (void)setFooterMaskPadding:(UIEdgeInsets)a3;
- (void)setFooterMaskView:(id)a3;
- (void)setShouldAutoReveal:(BOOL)a3;
- (void)setWantsFooter:(BOOL)a3;
- (void)setWantsFooterMask:(BOOL)a3;
- (void)viewDidAppear;
- (void)viewDidScrollToInitialPosition;
- (void)viewWillAppear;
@end

@implementation PXPhotosGridFooterPresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerMaskView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoRevealMinimumIdleTimer, 0);
  objc_storeStrong((id *)&self->_reusableFooterView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (BOOL)isFooterFullyMasked
{
  return self->_footerFullyMasked;
}

- (void)setFooterMaskPadding:(UIEdgeInsets)a3
{
  self->_footerMaskPadding = a3;
}

- (UIEdgeInsets)footerMaskPadding
{
  double top = self->_footerMaskPadding.top;
  double left = self->_footerMaskPadding.left;
  double bottom = self->_footerMaskPadding.bottom;
  double right = self->_footerMaskPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFooterMaskView:(id)a3
{
}

- (UIView)footerMaskView
{
  return self->_footerMaskView;
}

- (void)setWantsFooterMask:(BOOL)a3
{
  self->_wantsFooterMask = a3;
}

- (BOOL)wantsFooter
{
  return self->_wantsFooter;
}

- (BOOL)shouldAutoReveal
{
  return self->_shouldAutoReveal;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosGridFooterPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosGridFooterPresentationDelegate *)WeakRetained;
}

- (void)photosGlobalFooterViewDidMoveToWindow:(id)a3
{
  [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewOrder];
  [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewFrame];
}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  v4 = [(PXGLayout *)self->_layout createAnchorForVisibleArea];
  id v5 = (id)[v4 autoInvalidate];

  [(PXPhotosLayout *)self->_layout invalidateFooterHeight];
  [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewFrame];
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v7 = a4;
  id v5 = [(PXPhotosGridFooterPresentation *)self delegate];
  v6 = v5;
  if (v7) {
    [v5 footerPresentation:self presentViewController:v7];
  }
  else {
    [v5 dismissPresentedViewControllerForFooterPresentation:self];
  }
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3);
  self->_lastUserScrollTime = v4;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXPhotosViewModelObserverContext_261072 == a5)
  {
    if ([(PXPhotosViewModel *)self->_viewModel hideFooterInSelectMode]) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 0;
    }
    if (((v7 | 0x41) & a4) != 0) {
      [(PXPhotosGridFooterPresentation *)self _updateWantsFooter];
    }
    if (((v7 | 0xC0) & a4) != 0) {
      [(PXPhotosGridFooterPresentation *)self _conditionallyAutoRevealFooterView];
    }
    if (((v7 | 0x100000000000) & a4) != 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__PXPhotosGridFooterPresentation_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __63__PXPhotosGridFooterPresentation_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFooterMaskViewFrame];
}

- (void)_updateFooterAndMaskVisibility
{
  BOOL v3 = [(PXPhotosGridFooterPresentation *)self isFooterFullyMasked];
  double v4 = [(PXPhotosGridFooterPresentation *)self footerMaskView];
  [v4 setHidden:v3];

  id v5 = [(PXPhotosLayout *)self->_layout footerView];
  [v5 setHidden:v3];
}

- (void)_updateFooterMaskViewFrame
{
  id v31 = [(PXPhotosGridFooterPresentation *)self footerMaskView];
  if (v31)
  {
    BOOL v3 = [(PXGView *)self->_gridView scrollViewController];
    [v3 visibleRect];
    double v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    [(PXPhotosGridFooterPresentation *)self footerMaskPadding];
    double v13 = v12;
    CGFloat v16 = v9 - (v14 + v15);
    CGFloat v17 = v5 + v14;
    v33.origin.x = v5;
    v33.origin.y = v7;
    v33.size.width = v9;
    v33.size.height = v11;
    double MaxY = CGRectGetMaxY(v33);
    [v3 contentInset];
    CGFloat v20 = v13 + MaxY - v19;
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    double v21 = CGRectGetMaxY(v34);
    v35.origin.x = v17;
    v35.origin.y = v20;
    v35.size.width = v16;
    v35.size.height = v11;
    objc_msgSend(v31, "setFrame:", v17, v20, v16, v21 - CGRectGetMinY(v35));
    v22 = [(PXPhotosLayout *)self->_layout footerView];
    objc_msgSend(v22, "convertPoint:toView:", v31, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v24 = v23;
    v25 = [v22 window];
    BOOL v26 = v25 == 0;

    double v27 = v24 + 1.0;
    if (v24 + 1.0 >= 0.0 && (objc_msgSend(v3, "isManuallyChanging", v27) & 1) == 0)
    {
      v28 = [v22 window];
      v29 = [v31 window];
      if (v28 == v29)
      {
        v30 = [v22 window];
        BOOL v26 = v30 != 0;
      }
      else
      {
        BOOL v26 = 0;
      }
    }
    -[PXPhotosGridFooterPresentation setFooterFullyMasked:](self, "setFooterFullyMasked:", v26, v27);
  }
  else
  {
    [(PXPhotosGridFooterPresentation *)self setFooterFullyMasked:0];
  }
}

- (void)_updateFooterMaskViewOrder
{
  id v4 = [(PXPhotosGridFooterPresentation *)self footerMaskView];
  v2 = [v4 window];

  if (v2)
  {
    BOOL v3 = [v4 superview];
    [v3 bringSubviewToFront:v4];
  }
}

- (void)_updateFooterMaskPadding
{
  id v3 = [(PXPhotosGridFooterPresentation *)self delegate];
  [v3 maskPaddingForFooterPresentation:self];
  -[PXPhotosGridFooterPresentation setFooterMaskPadding:](self, "setFooterMaskPadding:");
}

- (void)_updateFooterView
{
  uint64_t v4 = [(PXPhotosLayout *)self->_layout footerView];
  BOOL v5 = v4 == 0;
  if (!v4)
  {
    if (![(PXPhotosGridFooterPresentation *)self wantsFooter])
    {
      BOOL v5 = 0;
      id obj = 0;
      goto LABEL_13;
    }
    reusableFooterView = self->_reusableFooterView;
    if (reusableFooterView)
    {
      CGFloat v7 = reusableFooterView;
    }
    else
    {
      CGFloat v7 = objc_alloc_init(PXPhotosGlobalFooterView);
      double v14 = [(PXPhotosViewModel *)self->_viewModel footerViewModel];
      [(PXPhotosGlobalFooterView *)v7 setViewModel:v14];

      [(PXPhotosGlobalFooterView *)v7 setDelegate:self];
    }
    id obj = v7;
    goto LABEL_11;
  }
  id obj = (id)v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v16 = (objc_class *)objc_opt_class();
    CGFloat v17 = NSStringFromClass(v16);
    v18 = objc_msgSend(obj, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXPhotosGridFooterPresentation.m", 279, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"_layout.footerView", v17, v18 object file lineNumber description];
  }
  if (![(PXPhotosGridFooterPresentation *)self wantsFooter])
  {
    objc_storeStrong((id *)&self->_reusableFooterView, obj);
    CGFloat v7 = 0;
LABEL_11:
    [(PXPhotosLayout *)self->_layout setFooterView:v7];
    goto LABEL_13;
  }
  BOOL v5 = 1;
LABEL_13:
  double v8 = [(PXPhotosGridFooterPresentation *)self footerMaskView];
  BOOL v9 = [(PXPhotosGridFooterPresentation *)self wantsFooterMask];
  if (v5 && v9)
  {
    if (!v8)
    {
      double v10 = objc_alloc_init(_PXPhotosGridFooterMaskView);
      [(_PXPhotosGridFooterMaskView *)v10 setDelegate:self];
      gridView = self->_gridView;
      double v8 = v10;
      double v12 = [(PXGView *)gridView backgroundColor];
      [(_PXPhotosGridFooterMaskView *)v8 setBackgroundColor:v12];

      [(_PXPhotosGridFooterMaskView *)v8 setUserInteractionEnabled:0];
      double v13 = [(PXGView *)self->_gridView scrollViewController];
      [v13 addSubview:v8];
    }
    [(PXPhotosGridFooterPresentation *)self setFooterMaskView:v8];
    [(PXPhotosGridFooterPresentation *)self _updateFooterMaskPadding];
    [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewFrame];
  }
  else
  {
    [(_PXPhotosGridFooterMaskView *)v8 removeFromSuperview];

    [(PXPhotosGridFooterPresentation *)self setFooterMaskView:0];
  }
}

- (void)_updateWantsFooter
{
  BOOL v3 = [(PXPhotosViewModel *)self->_viewModel wantsFooterVisibleImmediately];
  if (self->_hasAppearedOnce || v3)
  {
    BOOL v5 = v3;
    if ([(PXPhotosViewModel *)self->_viewModel wantsFooterVisible]
      && (self->_hasReachedInitialPosition ? (int v6 = 1) : (int v6 = v5),
          v6 == 1
       && (![(PXPhotosViewModel *)self->_viewModel isInSelectMode]
        || ![(PXPhotosViewModel *)self->_viewModel hideFooterInSelectMode])))
    {
      if ([(PXPhotosViewModel *)self->_viewModel wantsFooterVisibleWhenEmpty])
      {
        BOOL v7 = 1;
      }
      else
      {
        double v8 = [(PXPhotosViewModel *)self->_viewModel currentDataSource];
        BOOL v7 = [v8 totalNumberOfItems] > 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    [(PXPhotosGridFooterPresentation *)self setWantsFooter:v7];
  }
}

- (void)_conditionallyAutoRevealFooterView
{
  if ([(PXPhotosGridFooterPresentation *)self _shouldAutoRevealFooterView])
  {
    BOOL v3 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "[GZFooter] Should auto-reveal, waiting for idle timer", (uint8_t *)buf, 2u);
    }

    [(PXPhotosGridFooterPresentation *)self setShouldAutoReveal:1];
    double lastUserScrollTime = self->_lastUserScrollTime;
    objc_initWeak(buf, self);
    BOOL v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PXPhotosGridFooterPresentation__conditionallyAutoRevealFooterView__block_invoke;
    v8[3] = &unk_1E5DCD798;
    objc_copyWeak(v9, buf);
    v9[1] = *(id *)&lastUserScrollTime;
    int v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:2.0];
    autoRevealMinimumIdleTimer = self->_autoRevealMinimumIdleTimer;
    self->_autoRevealMinimumIdleTimer = v6;

    objc_destroyWeak(v9);
    objc_destroyWeak(buf);
  }
}

void __68__PXPhotosGridFooterPresentation__conditionallyAutoRevealFooterView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _conditionallyAutoRevealFooterViewWithLastUserScrollTime:*(double *)(a1 + 40)];
}

- (void)_conditionallyAutoRevealFooterViewWithLastUserScrollTime:(double)a3
{
  autoRevealMinimumIdleTimer = self->_autoRevealMinimumIdleTimer;
  self->_autoRevealMinimumIdleTimer = 0;

  if (self->_lastUserScrollTime == a3)
  {
    if ([(PXPhotosGridFooterPresentation *)self _shouldAutoRevealFooterView])
    {
      self->_didAutoReveal = 1;
      BOOL v9 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "[GZFooter] Performing auto-reveal", v10, 2u);
      }

      int v6 = [(PXGView *)self->_gridView scrollViewController];
      [v6 scrollToEdge:3 animated:1];
    }
    else
    {
      int v6 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        BOOL v7 = "[GZFooter] Suppressing auto-reveal: conditions changed";
        double v8 = buf;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v6 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = 0;
      BOOL v7 = "[GZFooter] Suppressing auto-reveal: user scrolled";
      double v8 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, v7, v8, 2u);
    }
  }

  [(PXPhotosGridFooterPresentation *)self setShouldAutoReveal:0];
}

- (BOOL)_shouldAutoRevealFooterView
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXGView *)self->_gridView window];

  if (v3)
  {
    if (self->_autoRevealMinimumIdleTimer)
    {
      uint64_t v4 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        BOOL v5 = "[GZFooter] Suppressing auto-reveal: Waiting for idle timer";
LABEL_11:
        _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v10, 2u);
      }
    }
    else
    {
      if ([(PXPhotosViewModel *)self->_viewModel footerHasImportantInformation])
      {
        int v6 = [(PXGView *)self->_gridView scrollViewController];
        BOOL v7 = [(PXPhotosLayout *)self->_layout footerView];
        [v7 bounds];
        [v6 isScrolledAtEdge:3 tolerance:v8 + 1.0];

        [(PXPhotosGridFooterPresentation *)self _footerVisibleAmountIncludingSafeAreaInsets:0];
        PXFloatEqualToFloatWithTolerance();
      }
      uint64_t v4 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        BOOL v5 = "[GZFooter] Suppressing auto-reveal: No important information";
        goto LABEL_11;
      }
    }
  }
  else
  {
    uint64_t v4 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      BOOL v5 = "[GZFooter] Suppressing auto-reveal: Not visible";
      goto LABEL_11;
    }
  }

  return 0;
}

- (double)_footerVisibleAmountIncludingSafeAreaInsets:(BOOL)a3
{
  int v6 = [(PXPhotosLayout *)self->_layout footerView];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      v39 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v36 handleFailureInMethod:a2, self, @"PXPhotosGridFooterPresentation.m", 152, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"_layout.footerView", v38, v39 object file lineNumber description];
    }
    BOOL v7 = [(PXGView *)self->_gridView scrollViewController];
    [v6 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    CGFloat v16 = [v7 scrollView];
    objc_msgSend(v6, "convertRect:toView:", v16, v9, v11, v13, v15);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v41.origin.CGFloat x = v18;
    v41.origin.CGFloat y = v20;
    v41.size.CGFloat width = v22;
    v41.size.height = v24;
    double Height = CGRectGetHeight(v41);
    double v26 = 0.0;
    if (Height > 0.0)
    {
      double v40 = Height;
      [v7 scrollViewVisibleRect];
      if (!a3)
      {
        [(PXGView *)self->_gridView safeAreaInsets];
        PXEdgeInsetsInsetRect();
      }
      v44.origin.CGFloat x = v18;
      v44.origin.CGFloat y = v20;
      v44.size.CGFloat width = v22;
      v44.size.height = v24;
      CGRect v42 = CGRectIntersection(*(CGRect *)&v27, v44);
      CGFloat x = v42.origin.x;
      CGFloat y = v42.origin.y;
      CGFloat width = v42.size.width;
      CGFloat v34 = v42.size.height;
      if (!CGRectIsEmpty(v42))
      {
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.height = v34;
        double v26 = CGRectGetHeight(v43) / v40;
      }
    }
  }
  else
  {
    double v26 = 0.0;
  }

  return v26;
}

- (void)setFooterFullyMasked:(BOOL)a3
{
  if (self->_footerFullyMasked != a3)
  {
    self->_footerFullyMasked = a3;
    [(PXPhotosGridFooterPresentation *)self _updateFooterAndMaskVisibility];
  }
}

- (BOOL)wantsFooterMask
{
  return [(PXPhotosViewModel *)self->_viewModel wantsFooterMask];
}

- (void)setWantsFooter:(BOOL)a3
{
  if (self->_wantsFooter != a3)
  {
    self->_wantsFooter = a3;
    [(PXPhotosGridFooterPresentation *)self _updateFooterView];
  }
}

- (void)setShouldAutoReveal:(BOOL)a3
{
  if (self->_shouldAutoReveal != a3)
  {
    self->_shouldAutoReveal = a3;
    [(PXPhotosGridFooterPresentation *)self _updateWantsFooter];
  }
}

- (void)viewDidScrollToInitialPosition
{
  self->_hasReachedInitialPosition = 1;
  [(PXPhotosGridFooterPresentation *)self _updateWantsFooter];
  [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewFrame];
}

- (void)viewDidAppear
{
  self->_hasAppearedOnce = 1;
  [(PXPhotosGridFooterPresentation *)self _updateWantsFooter];
  [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewFrame];
}

- (void)viewWillAppear
{
  [(PXPhotosGridFooterPresentation *)self _updateWantsFooter];
  [(PXPhotosGridFooterPresentation *)self _updateFooterMaskViewFrame];
}

- (PXPhotosGridFooterPresentation)initWithViewModel:(id)a3 gridView:(id)a4 layout:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    CGFloat v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPhotosGridFooterPresentation.m", 81, @"Invalid parameter not satisfying: %@", @"gridView" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  double v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXPhotosGridFooterPresentation.m", 80, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  double v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PXPhotosGridFooterPresentation.m", 82, @"Invalid parameter not satisfying: %@", @"layout" object file lineNumber description];

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosGridFooterPresentation;
  double v13 = [(PXPhotosGridFooterPresentation *)&v20 init];
  double v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_gridView, a4);
    double v15 = [(PXGView *)v14->_gridView scrollViewController];
    [v15 registerObserver:v14];
    objc_storeStrong((id *)&v14->_layout, a5);
    objc_storeStrong((id *)&v14->_viewModel, a3);
    [(PXPhotosViewModel *)v14->_viewModel registerChangeObserver:v14 context:PXPhotosViewModelObserverContext_261072];
  }
  return v14;
}

- (PXPhotosGridFooterPresentation)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridFooterPresentation.m", 76, @"%s is not available as initializer", "-[PXPhotosGridFooterPresentation init]");

  abort();
}

@end