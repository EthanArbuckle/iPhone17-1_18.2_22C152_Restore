@interface SKUIBackdropContentViewController
- (SKUIBackdropContentViewController)initWithContentViewController:(id)a3;
- (UIViewController)contentViewController;
- (int64_t)backdropViewPrivateStyle;
- (void)loadView;
- (void)setBackdropViewPrivateStyle:(int64_t)a3;
- (void)setContentViewController:(id)a3;
@end

@implementation SKUIBackdropContentViewController

- (SKUIBackdropContentViewController)initWithContentViewController:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBackdropContentViewController initWithContentViewController:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIBackdropContentViewController;
  v5 = [(SKUIBackdropContentViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_backdropViewPrivateStyle = 10060;
    [(SKUIBackdropContentViewController *)v5 setModalPresentationStyle:17];
    [(SKUIBackdropContentViewController *)v6 setContentViewController:v4];
  }

  return v6;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIBackdropContentViewController;
  [(SKUIBackdropContentViewController *)&v6 loadView];
  v3 = [(SKUIBackdropContentViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1FE0]);
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
    if ([(SKUIBackdropContentViewController *)self isViewLoaded])
    {
      id v5 = [(SKUIBackdropContentViewController *)self view];
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
      -[SKUIBackdropContentViewController addChildViewController:](self, "addChildViewController:");
      v9 = [(SKUIBackdropContentViewController *)self view];
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

- (void)initWithContentViewController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBackdropContentViewController initWithContentViewController:]";
}

@end