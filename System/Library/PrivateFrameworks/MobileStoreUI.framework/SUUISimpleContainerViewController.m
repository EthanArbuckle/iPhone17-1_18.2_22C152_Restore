@interface SUUISimpleContainerViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (UIViewController)contentViewController;
- (void)loadView;
- (void)setContentViewController:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation SUUISimpleContainerViewController

- (void)setContentViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  v12 = v5;
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
      -[SUUISimpleContainerViewController addChildViewController:](self, "addChildViewController:");
      v9 = *p_contentViewController;
      [(SUUISimpleContainerViewController *)self preferredContentSize];
      -[UIViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
      if ([(SUUISimpleContainerViewController *)self isViewLoaded])
      {
        v10 = [(SUUISimpleContainerViewController *)self view];
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
  v5.receiver = self;
  v5.super_class = (Class)SUUISimpleContainerViewController;
  [(SUUISimpleContainerViewController *)&v5 loadView];
  if (self->_contentViewController)
  {
    v3 = [(SUUISimpleContainerViewController *)self view];
    v4 = [(UIViewController *)self->_contentViewController view];
    [v4 setAutoresizingMask:18];
    [v3 bounds];
    objc_msgSend(v4, "setFrame:");
    [v3 addSubview:v4];
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUISimpleContainerViewController;
  -[SUUISimpleContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:", width, height);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
}

@end