@interface SUUIViewControllerContainerView
- (SUUIViewControllerContainerView)initWithFrame:(CGRect)a3;
- (UIViewController)viewController;
- (void)_updateLayoutOfViewControllerView;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setViewController:(id)a3;
@end

@implementation SUUIViewControllerContainerView

- (SUUIViewControllerContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIViewControllerContainerView;
  v3 = -[SUUIViewControllerContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SUUIViewControllerContainerView *)v3 setPreservesSuperviewLayoutMargins:1];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewControllerContainerView;
  [(SUUIViewControllerContainerView *)&v3 layoutSubviews];
  [(SUUIViewControllerContainerView *)self _updateLayoutOfViewControllerView];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIViewControllerContainerView;
  -[SUUIViewControllerContainerView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SUUIViewControllerContainerView *)self _updateLayoutOfViewControllerView];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIViewControllerContainerView;
  -[SUUIViewControllerContainerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SUUIViewControllerContainerView *)self _updateLayoutOfViewControllerView];
}

- (void)setViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  viewController = self->_viewController;
  v7 = v5;
  v11 = v5;
  if (viewController != v5)
  {
    if (viewController)
    {
      v8 = [(UIViewController *)viewController view];
      if ([v8 isDescendantOfView:self]) {
        [v8 removeFromSuperview];
      }
    }
    objc_storeStrong((id *)&self->_viewController, a3);
    v7 = self->_viewController;
  }
  if (v7)
  {
    v9 = [(UIViewController *)v7 view];
    v10 = v9;
    if (v9 && ([v9 isDescendantOfView:self] & 1) == 0)
    {
      [v10 removeFromSuperview];
      [(SUUIViewControllerContainerView *)self addSubview:v10];
      [(SUUIViewControllerContainerView *)self setNeedsLayout];
    }
  }
}

- (void)_updateLayoutOfViewControllerView
{
  id v3 = [(UIViewController *)self->_viewController view];
  [(SUUIViewControllerContainerView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
}

@end