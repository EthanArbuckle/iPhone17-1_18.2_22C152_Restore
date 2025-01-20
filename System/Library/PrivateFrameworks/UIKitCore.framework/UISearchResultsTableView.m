@interface UISearchResultsTableView
- (UISearchDisplayController)controller;
- (UISearchResultsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIView)_topShadowView;
- (double)_offsetForNoResultsMessage;
- (void)_numberOfRowsDidChange;
- (void)_setOffsetForNoResultsMessage:(double)a3;
- (void)_setTopShadowView:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setController:(id)a3;
@end

@implementation UISearchResultsTableView

- (UISearchResultsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UISearchResultsTableView;
  result = -[UITableView initWithFrame:style:](&v5, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_offsetForNoResultsMessage = -1.0;
  }
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  if (v7 != x || v6 != y)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained _managedTableViewDidScroll];
  }
  v14.receiver = self;
  v14.super_class = (Class)UISearchResultsTableView;
  -[UITableView setContentOffset:](&v14, sel_setContentOffset_, x, y);
  if (self->_topShadowView)
  {
    [(UIScrollView *)self _effectiveContentInset];
    double v11 = y + v10;
    [(UIView *)self frame];
    double v13 = v12;
    [(UIView *)self->_topShadowView frame];
    -[UIView setFrame:](self->_topShadowView, "setFrame:", 0.0, v11, v13);
  }
}

- (void)_numberOfRowsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UISearchResultsTableView;
  [(UITableView *)&v4 _numberOfRowsDidChange];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained _updateNoSearchResultsMessageVisiblity];
}

- (void)_setOffsetForNoResultsMessage:(double)a3
{
  self->_offsetForNoResultsMessage = a3;
}

- (double)_offsetForNoResultsMessage
{
  double offsetForNoResultsMessage = self->_offsetForNoResultsMessage;
  if (offsetForNoResultsMessage < 0.0)
  {
    objc_super v4 = [(UIView *)self window];
    if (v4)
    {
      +[UIKeyboard defaultFrameForInterfaceOrientation:](UIKeyboard, "defaultFrameForInterfaceOrientation:", [(id)UIApp _sceneInterfaceOrientationFromWindow:v4]);
      objc_msgSend(v4, "convertRect:fromWindow:", 0);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", 0);
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      [(UIView *)self bounds];
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        v27 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "keyboardFrame can't be calculated when window is nil", v31, 2u);
        }
      }
      else
      {
        v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_offsetForNoResultsMessage___s_category) + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "keyboardFrame can't be calculated when window is nil", buf, 2u);
        }
      }
      CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      [(UIView *)self bounds];
    }
    CGFloat v15 = v11;
    CGFloat v16 = v12;
    CGFloat v17 = v13;
    double v18 = v14;
    double MinY = CGRectGetMinY(*(CGRect *)&v11);
    v32.origin.double y = v28;
    v32.origin.double x = v29;
    v32.size.width = v6;
    v32.size.height = v8;
    if (MinY < CGRectGetMinY(v32))
    {
      v33.origin.double x = v15;
      v33.origin.double y = v16;
      v33.size.width = v17;
      v33.size.height = v18;
      double MaxY = CGRectGetMaxY(v33);
      v34.origin.double y = v28;
      v34.origin.double x = v29;
      v34.size.width = v6;
      v34.size.height = v8;
      if (MaxY > CGRectGetMinY(v34))
      {
        v35.origin.double y = v28;
        v35.origin.double x = v29;
        v35.size.width = v6;
        v35.size.height = v8;
        double v21 = CGRectGetMinY(v35);
        v36.origin.double x = v15;
        v36.origin.double y = v16;
        v36.size.width = v17;
        v36.size.height = v18;
        double v18 = v21 - CGRectGetMinY(v36);
      }
    }
    if ([(UITableView *)self numberOfSections] >= 1)
    {
      [(UITableView *)self rectForHeaderInSection:0];
      double offsetForNoResultsMessage = CGRectGetMaxY(v37);
    }
    [(UITableView *)self _spacingForExtraSeparators];
    double v23 = v22;
    double v24 = offsetForNoResultsMessage;
    do
    {
      double offsetForNoResultsMessage = v24;
      double v24 = v23 + v24;
      v38.origin.double x = v15;
      v38.origin.double y = v16;
      v38.size.width = v17;
      v38.size.height = v18;
    }
    while (v24 < CGRectGetMidY(v38));
  }
  return offsetForNoResultsMessage;
}

- (UIView)_topShadowView
{
  return self->_topShadowView;
}

- (void)_setTopShadowView:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v5 = (UIView *)a3;
  p_topShadowView = &self->_topShadowView;
  topShadowView = self->_topShadowView;
  if (topShadowView != v5)
  {
    [(UIView *)topShadowView removeFromSuperview];
    objc_storeStrong((id *)&self->_topShadowView, a3);
    [(UIView *)*p_topShadowView setAutoresizingMask:2];
    [(UIView *)self frame];
    double v9 = v8;
    [(UIView *)*p_topShadowView frame];
    -[UIView setFrame:](*p_topShadowView, "setFrame:", 0.0, 0.0, v9);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [(UIView *)self subviews];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v11)
    {

      goto LABEL_17;
    }
    uint64_t v12 = v11;
    double v13 = 0;
    uint64_t v14 = *(void *)v19;
LABEL_4:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v10);
      }
      CGFloat v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;

        double v13 = v17;
      }
      else if (v13)
      {

        goto LABEL_15;
      }
      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_4;
        }

        if (!v13)
        {
LABEL_17:
          [(UIView *)self addSubview:*p_topShadowView];
          break;
        }
LABEL_15:
        [(UIView *)self insertSubview:*p_topShadowView aboveSubview:v13];

        break;
      }
    }
  }
}

- (UISearchDisplayController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (UISearchDisplayController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_topShadowView, 0);
}

@end