@interface TKTonePickerTableView
- (TKTonePickerTableViewLayoutMarginsObserver)layoutMarginsObserver;
- (TKTonePickerTableViewSeparatorObserver)separatorObserver;
- (void)_handleSeparatorColorDidChange;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)performBlockEnsuringContentOffsetRemainsUnchanged:(id)a3;
- (void)setLayoutMarginsObserver:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorObserver:(id)a3;
@end

@implementation TKTonePickerTableView

- (void)performBlockEnsuringContentOffsetRemainsUnchanged:(id)a3
{
  v4 = (void (**)(void))a3;
  [(TKTonePickerTableView *)self contentOffset];
  double v6 = v5;
  double v8 = v7;
  v4[2](v4);

  [(TKTonePickerTableView *)self contentOffset];
  if (!TKPointEqualToPoint(v6, v8, v9, v10))
  {
    -[TKTonePickerTableView setContentOffset:](self, "setContentOffset:", v6, v8);
  }
}

- (void)layoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)TKTonePickerTableView;
  [(TKTonePickerTableView *)&v4 layoutMarginsDidChange];
  v3 = [(TKTonePickerTableView *)self layoutMarginsObserver];
  if (objc_opt_respondsToSelector()) {
    [v3 layoutMarginsDidChangeInTonePickerTableView:self];
  }
}

- (void)_handleSeparatorColorDidChange
{
  id v3 = [(TKTonePickerTableView *)self separatorObserver];
  if (objc_opt_respondsToSelector()) {
    [v3 separatorColorDidChangeInTonePickerTableView:self];
  }
}

- (void)setSeparatorColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKTonePickerTableView;
  [(TKTonePickerTableView *)&v4 setSeparatorColor:a3];
  [(TKTonePickerTableView *)self _handleSeparatorColorDidChange];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TKTonePickerTableView;
  [(TKTonePickerTableView *)&v3 layoutSubviews];
  [(TKTonePickerTableView *)self _handleSeparatorColorDidChange];
}

- (TKTonePickerTableViewLayoutMarginsObserver)layoutMarginsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutMarginsObserver);

  return (TKTonePickerTableViewLayoutMarginsObserver *)WeakRetained;
}

- (void)setLayoutMarginsObserver:(id)a3
{
}

- (TKTonePickerTableViewSeparatorObserver)separatorObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorObserver);

  return (TKTonePickerTableViewSeparatorObserver *)WeakRetained;
}

- (void)setSeparatorObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_separatorObserver);

  objc_destroyWeak((id *)&self->_layoutMarginsObserver);
}

@end