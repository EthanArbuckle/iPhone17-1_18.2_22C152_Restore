@interface DOCTabbedBrowserView
- (DOCTabbedBrowserViewDelegate)delegate;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation DOCTabbedBrowserView

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserView;
  [(DOCTabbedBrowserView *)&v7 didMoveToWindow];
  v3 = [(DOCTabbedBrowserView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(DOCTabbedBrowserView *)self delegate];
    v6 = [(DOCTabbedBrowserView *)self window];
    [v5 tabbedBrowserView:self didMoveToWindow:v6];
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCTabbedBrowserView;
  [(DOCTabbedBrowserView *)&v8 willMoveToWindow:v4];
  v5 = [(DOCTabbedBrowserView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(DOCTabbedBrowserView *)self delegate];
    [v7 tabbedBrowserView:self willMoveToWindow:v4];
  }
}

- (DOCTabbedBrowserViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DOCTabbedBrowserViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end