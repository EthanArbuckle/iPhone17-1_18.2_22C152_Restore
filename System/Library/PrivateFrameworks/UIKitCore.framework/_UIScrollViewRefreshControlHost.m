@interface _UIScrollViewRefreshControlHost
- (BOOL)refreshControlInsetsAffectScrollViewRubberBanding;
- (UIScrollView)scrollView;
- (_UIScrollViewRefreshControlHost)initWithScrollView:(id)a3;
- (void)decrementInsetHeight:(double)a3;
- (void)incrementInsetHeight:(double)a3;
- (void)refreshControl:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5;
@end

@implementation _UIScrollViewRefreshControlHost

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (BOOL)refreshControlInsetsAffectScrollViewRubberBanding
{
  return 1;
}

- (_UIScrollViewRefreshControlHost)initWithScrollView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIScrollViewRefreshControlHost;
  v5 = [(_UIScrollViewRefreshControlHost *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scrollView, v4);
  }

  return v6;
}

- (void)refreshControl:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5
{
  id v8 = a3;
  if (!a5)
  {
    id v15 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    int v10 = [WeakRetained isTracking];

    id v8 = v15;
    if (v10)
    {
      self->_refreshControlAutomaticContentOffsetAdjustmentEnabledNeedsReset = 1;
      id v11 = objc_loadWeakRetained((id *)&self->_scrollView);
      self->_BOOL refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle = [v11 _isAutomaticContentOffsetAdjustmentEnabled];

      id v12 = objc_loadWeakRetained((id *)&self->_scrollView);
      v13 = v12;
      BOOL refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle = 0;
LABEL_7:
      [v12 _setAutomaticContentOffsetAdjustmentEnabled:refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle];

      id v8 = v15;
      goto LABEL_8;
    }
  }
  if (!a4 && self->_refreshControlAutomaticContentOffsetAdjustmentEnabledNeedsReset)
  {
    id v15 = v8;
    self->_refreshControlAutomaticContentOffsetAdjustmentEnabledNeedsReset = 0;
    id v12 = objc_loadWeakRetained((id *)&self->_scrollView);
    v13 = v12;
    BOOL refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle = self->_refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle;
    goto LABEL_7;
  }
LABEL_8:
}

- (void).cxx_destruct
{
}

- (void)decrementInsetHeight:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained _removeRefreshInset:a3];
}

- (void)incrementInsetHeight:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained _addRefreshInset:a3];
}

@end