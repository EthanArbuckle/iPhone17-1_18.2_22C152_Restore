@interface SUUIScrollingSegmentedControllerItemContext
- (SUUIScrollingSegmentedControllerItemContext)init;
- (SUUIScrollingSegmentedControllerItemContext)initWithViewController:(id)a3;
- (SUUIScrollingSegmentedControllerItemContextDelegate)delegate;
- (UIViewController)viewController;
- (void)_applyNewContentInset:(UIEdgeInsets)a3 withOldContentInset:(UIEdgeInsets)a4 toContentScrollView:(id)a5;
- (void)applyNewContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)updateAppliedContentInsetsAdjustment;
@end

@implementation SUUIScrollingSegmentedControllerItemContext

- (SUUIScrollingSegmentedControllerItemContext)init
{
  return [(SUUIScrollingSegmentedControllerItemContext *)self initWithViewController:0];
}

- (SUUIScrollingSegmentedControllerItemContext)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIScrollingSegmentedControllerItemContext;
  v6 = [(SUUIScrollingSegmentedControllerItemContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_viewController, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)applyNewContentInset:(UIEdgeInsets)a3
{
  if (self->_desiredContentInsetsAdjustment.left != a3.left
    || self->_desiredContentInsetsAdjustment.top != a3.top
    || self->_desiredContentInsetsAdjustment.right != a3.right
    || self->_desiredContentInsetsAdjustment.bottom != a3.bottom)
  {
    self->_desiredContentInsetsAdjustment = a3;
    [(SUUIScrollingSegmentedControllerItemContext *)self updateAppliedContentInsetsAdjustment];
  }
}

- (void)updateAppliedContentInsetsAdjustment
{
  uint64_t v3 = [(UIViewController *)self->_viewController contentScrollView];
  insetAdjustedContentScrollView = self->_insetAdjustedContentScrollView;
  id v5 = (UIScrollView *)v3;
  obj = (UIScrollView *)v3;
  if (insetAdjustedContentScrollView != (UIScrollView *)v3)
  {
    v6 = (_OWORD *)MEMORY[0x263F834E8];
    if (insetAdjustedContentScrollView) {
      -[SUUIScrollingSegmentedControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", insetAdjustedContentScrollView, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24), self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    }
    long long v7 = v6[1];
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.top = *v6;
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.bottom = v7;
    objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, obj);
    id v5 = self->_insetAdjustedContentScrollView;
  }
  if (v5)
  {
    -[SUUIScrollingSegmentedControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", self->_desiredContentInsetsAdjustment.top, self->_desiredContentInsetsAdjustment.left, self->_desiredContentInsetsAdjustment.bottom, self->_desiredContentInsetsAdjustment.right, self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.top = *(_OWORD *)&self->_desiredContentInsetsAdjustment.top;
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.bottom = *(_OWORD *)&self->_desiredContentInsetsAdjustment.bottom;
  }
  if (insetAdjustedContentScrollView != obj)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained contentScrollViewDidChangeForScrollingSegmentedControllerItemContext:self];
    }
  }
}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 withOldContentInset:(UIEdgeInsets)a4 toContentScrollView:(id)a5
{
  if (a4.left != a3.left || a4.top != a3.top || a4.right != a3.right || a4.bottom != a3.bottom)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    double v13 = a3.right;
    double v14 = a3.bottom;
    double v15 = a3.left;
    double v16 = a3.top;
    id v37 = a5;
    [v37 contentInset];
    double v27 = v17;
    double v28 = v18;
    double v29 = v19;
    double v30 = v20;
    [v37 scrollIndicatorInsets];
    double v31 = v21;
    double v32 = v22;
    double v33 = v23;
    double v34 = v24;
    [v37 contentOffset];
    double v35 = v26;
    double v36 = v25;
    objc_msgSend(v37, "setContentInset:", v16 + v27 - top, v15 + v28 - left, v14 + v29 - bottom, v13 + v30 - right);
    objc_msgSend(v37, "setScrollIndicatorInsets:", v16 + v31 - top, v15 + v32 - left, v14 + v33 - bottom, v13 + v34 - right);
    objc_msgSend(v37, "setContentOffset:", v36, top + v35 - v16);
  }
}

- (SUUIScrollingSegmentedControllerItemContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIScrollingSegmentedControllerItemContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, 0);
}

@end