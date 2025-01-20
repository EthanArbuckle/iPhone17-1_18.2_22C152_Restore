@interface SUUIProxyScrollView
- (void)didMoveToWindow;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIProxyScrollView

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(SUUIProxyScrollView *)self contentInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v24.receiver = self;
  v24.super_class = (Class)SUUIProxyScrollView;
  -[SUUIProxyScrollView setContentInset:](&v24, sel_setContentInset_, top, left, bottom, right);
  [(SUUIProxyScrollView *)self contentInset];
  if (v19 != v11 || v16 != v9 || v18 != v15 || v17 != v13)
  {
    v23 = [(SUUIProxyScrollView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v23 scrollViewDidChangeContentInset:self];
    }
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProxyScrollView;
  [(SUUIProxyScrollView *)&v4 didMoveToWindow];
  v3 = [(SUUIProxyScrollView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 scrollViewDidMoveToWindow:self];
  }
}

@end