@interface SBHWidgetContainerViewSnapshotResizeCoordinator
- (SBHViewResizeCoordinatorDelegate)delegate;
- (SBHWidgetContainerViewSnapshotResizeCoordinator)initWithResizableView:(id)a3 multiplexingView:(id)a4 newSize:(CGSize)a5 hideMultiplexingViewInitially:(BOOL)a6 showMultiplexingViewWhenFinished:(BOOL)a7;
- (double)_deltaHeight;
- (double)_deltaWidth;
- (void)finishResize;
- (void)resize;
- (void)setDelegate:(id)a3;
- (void)setUpResize;
@end

@implementation SBHWidgetContainerViewSnapshotResizeCoordinator

- (SBHWidgetContainerViewSnapshotResizeCoordinator)initWithResizableView:(id)a3 multiplexingView:(id)a4 newSize:(CGSize)a5 hideMultiplexingViewInitially:(BOOL)a6 showMultiplexingViewWhenFinished:(BOOL)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v14 = a3;
  id v15 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBHWidgetContainerViewSnapshotResizeCoordinator;
  v16 = [(SBHWidgetContainerViewSnapshotResizeCoordinator *)&v24 init];
  if (v16 == self)
  {
    objc_storeStrong((id *)&self->_resizableView, a3);
    objc_storeStrong((id *)&self->_multiplexingView, a4);
    self->_newSize.CGFloat width = width;
    self->_newSize.CGFloat height = height;
    [v14 bounds];
    self->_currentSize.CGFloat width = v17;
    self->_currentSize.CGFloat height = v18;
    self->_shouldHideMultiplexingViewInitially = a6;
    self->_shouldShowMultiplexingViewWhenFinished = a7;
    id v19 = v14;
    v20 = v19;
    if (v19)
    {
      v21 = [v19 backgroundView];
      backgroundView = self->_backgroundView;
      self->_backgroundView = v21;
    }
  }

  return v16;
}

- (void)resize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained coordinatorWillResize:self];
  }
  double height = self->_currentSize.height;
  [(SBHWidgetContainerViewSnapshotResizeCoordinator *)self _deltaHeight];
  -[UIView setFrame:](self->_resizableView, "setFrame:", 0.0, height + v4, self->_currentSize.width, self->_currentSize.height);
  [(UIView *)self->_resizableView setNeedsLayout];
}

- (void)setUpResize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained coordinatorWillSetUpResize:self];
  }
  [(UIView *)self->_resizableView frame];
  double v4 = v3;
  double v6 = v5;
  [(SBHWidgetContainerViewSnapshotResizeCoordinator *)self _deltaWidth];
  double v8 = v7 * -0.5;
  [(SBHWidgetContainerViewSnapshotResizeCoordinator *)self _deltaHeight];
  -[UIView setFrame:](self->_resizableView, "setFrame:", v8, v6 + v9 * -0.5, v4, v6);
  [(UIView *)self->_resizableView setNeedsLayout];
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    self->_backgroundViewAutoresizing = [(UIView *)backgroundView autoresizingMask];
    [(UIView *)self->_backgroundView setAutoresizingMask:18];
  }
  if (self->_shouldHideMultiplexingViewInitially) {
    [(UIView *)self->_multiplexingView setAlpha:0.0];
  }
}

- (void)finishResize
{
  backgroundView = self->_backgroundView;
  if (backgroundView) {
    [(UIView *)backgroundView setAutoresizingMask:self->_backgroundViewAutoresizing];
  }
  if (self->_shouldShowMultiplexingViewWhenFinished)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained coordinatorWillFinishResize:self];
    }
    [(UIView *)self->_multiplexingView setAlpha:1.0];
  }
}

- (double)_deltaHeight
{
  return self->_newSize.height - self->_currentSize.height;
}

- (double)_deltaWidth
{
  return self->_newSize.width - self->_currentSize.width;
}

- (SBHViewResizeCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHViewResizeCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_multiplexingView, 0);
  objc_storeStrong((id *)&self->_resizableView, 0);
}

@end