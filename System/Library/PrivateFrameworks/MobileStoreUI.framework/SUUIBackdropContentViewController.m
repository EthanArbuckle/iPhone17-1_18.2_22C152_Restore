@interface SUUIBackdropContentViewController
- (SUUIBackdropContentViewController)initWithContentViewController:(id)a3;
- (UIViewController)contentViewController;
- (int64_t)backdropViewPrivateStyle;
- (void)loadView;
- (void)setBackdropViewPrivateStyle:(int64_t)a3;
- (void)setContentViewController:(id)a3;
@end

@implementation SUUIBackdropContentViewController

- (SUUIBackdropContentViewController)initWithContentViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIBackdropContentViewController;
  v5 = [(SUUIBackdropContentViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_backdropViewPrivateStyle = 10060;
    [(SUUIBackdropContentViewController *)v5 setModalPresentationStyle:17];
    [(SUUIBackdropContentViewController *)v6 setContentViewController:v4];
  }

  return v6;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIBackdropContentViewController;
  [(SUUIBackdropContentViewController *)&v6 loadView];
  v3 = [(SUUIBackdropContentViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x263F82EB8]);
  [v3 bounds];
  v5 = objc_msgSend(v4, "initWithFrame:privateStyle:", self->_backdropViewPrivateStyle);
  [v5 setAutoresizingMask:18];
  [v3 addSubview:v5];
}

- (void)setBackdropViewPrivateStyle:(int64_t)a3
{
  if (self->_backdropViewPrivateStyle != a3)
  {
    self->_backdropViewPrivateStyle = a3;
    if ([(SUUIBackdropContentViewController *)self isViewLoaded])
    {
      id v5 = [(SUUIBackdropContentViewController *)self view];
      [v5 transitionToPrivateStyle:a3];
    }
  }
}

- (void)setContentViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v11 = v5;
    v7 = [(UIViewController *)v5 parentViewController];

    if (v7 == self)
    {
      [(UIViewController *)v11 willMoveToParentViewController:0];
      objc_super v8 = [(UIViewController *)v11 view];
      [v8 removeFromSuperview];

      [(UIViewController *)v11 removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    id v5 = v11;
    if (*p_contentViewController)
    {
      -[SUUIBackdropContentViewController addChildViewController:](self, "addChildViewController:");
      v9 = [(SUUIBackdropContentViewController *)self view];
      v10 = [(UIViewController *)*p_contentViewController view];
      [v9 bounds];
      objc_msgSend(v10, "setFrame:");
      [v10 setAutoresizingMask:18];
      [v9 addSubview:v10];
      [(UIViewController *)*p_contentViewController didMoveToParentViewController:self];

      id v5 = v11;
    }
  }
}

- (int64_t)backdropViewPrivateStyle
{
  return self->_backdropViewPrivateStyle;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
}

@end