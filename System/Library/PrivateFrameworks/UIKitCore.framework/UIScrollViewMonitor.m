@interface UIScrollViewMonitor
- (BOOL)_monitorsView:(id)a3;
- (UIScrollViewMonitor)initWithScrollView:(id)a3;
- (UIScrollViewMonitorDelegate)delegate;
- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopMonitoring;
@end

@implementation UIScrollViewMonitor

- (UIScrollViewMonitor)initWithScrollView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIScrollViewMonitor;
  v6 = [(UIScrollViewMonitor *)&v11 init];
  if (v6)
  {
    v7 = [v5 window];

    if (v7)
    {
      objc_storeStrong((id *)&v6->_scrollView, a3);
      v8 = [v5 window];
      objc_storeWeak((id *)&v6->_window, v8);

      [(UIScrollView *)v6->_scrollView _addScrollViewScrollObserver:v6];
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_window);
      [WeakRetained _registerSubtreeMonitor:v6];
    }
    else
    {
      id WeakRetained = v6;
      v6 = 0;
    }
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  objc_setAssociatedObject(self, &_UIScrollViewDelegateAssociationKey, obj, (void *)0x301);
  id v4 = objc_storeWeak((id *)&self->_delegate, obj);
  [obj scrollViewMonitorDidStartMonitoring:self->_scrollView];
}

- (void)stopMonitoring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained scrollViewMonitorDidStopMonitoring:self->_scrollView];

  [(UIScrollView *)self->_scrollView _removeScrollViewScrollObserver:self];
  id v4 = objc_loadWeakRetained((id *)&self->_window);
  [v4 _unregisterSubtreeMonitor:self];
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained scrollViewMonitorScrollDidScrolled:v4];
}

- (BOOL)_monitorsView:(id)a3
{
  return [a3 isDescendantOfView:self->_scrollView];
}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v13 = a3;
  if ([v13 isDescendantOfView:self->_scrollView])
  {
    if (a5)
    {
      if (a4) {
        goto LABEL_7;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = WeakRetained;
      scrollView = self->_scrollView;
      id v11 = v13;
      id v12 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = WeakRetained;
      scrollView = self->_scrollView;
      id v11 = 0;
      id v12 = v13;
    }
    [WeakRetained scrollViewMonitorScrollDid:scrollView addView:v11 removeView:v12];
  }
LABEL_7:
}

- (UIScrollViewMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIScrollViewMonitorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end