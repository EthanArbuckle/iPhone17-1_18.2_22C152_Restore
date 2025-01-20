@interface SKUISimpleContainerViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (UIViewController)contentViewController;
- (void)loadView;
- (void)setContentViewController:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation SKUISimpleContainerViewController

- (void)setContentViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUISimpleContainerViewController setContentViewController:]();
  }
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v5)
  {
    if ([(UIViewController *)contentViewController isViewLoaded])
    {
      v8 = [(UIViewController *)*p_contentViewController view];
      [v8 removeFromSuperview];
    }
    [(UIViewController *)*p_contentViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[SKUISimpleContainerViewController addChildViewController:](self, "addChildViewController:");
      v9 = *p_contentViewController;
      [(SKUISimpleContainerViewController *)self preferredContentSize];
      -[UIViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
      if ([(SKUISimpleContainerViewController *)self isViewLoaded])
      {
        v10 = [(SKUISimpleContainerViewController *)self view];
        v11 = [(UIViewController *)*p_contentViewController view];
        [v11 setAutoresizingMask:18];
        [v10 bounds];
        objc_msgSend(v11, "setFrame:");
        [v10 addSubview:v11];
      }
    }
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISimpleContainerViewController loadView]";
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SKUISimpleContainerViewController;
  -[SKUISimpleContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:", width, height);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
}

- (void)setContentViewController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISimpleContainerViewController setContentViewController:]";
}

@end