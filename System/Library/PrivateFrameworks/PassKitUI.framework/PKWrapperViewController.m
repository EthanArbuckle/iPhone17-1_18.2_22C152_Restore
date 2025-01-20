@interface PKWrapperViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)extendedLayoutIncludesOpaqueBars;
- (PKWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4;
- (UIViewController)wrappedViewController;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)edgesForExtendedLayout;
- (void)_updatePreferredContentSize;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKWrapperViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(PKWrapperViewController *)self initWithWrappedViewController:0 type:0];
}

- (PKWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKWrapperViewController;
  v8 = [(PKWrapperViewController *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    uint64_t v10 = [(PKWrapperViewController *)v8 preferredUserInterfaceStyle];
    p_wrappedViewController = (id *)&v9->_wrappedViewController;
    objc_storeStrong((id *)&v9->_wrappedViewController, a3);
    if (v9->_wrappedViewController)
    {
      -[PKWrapperViewController addChildViewController:](v9, "addChildViewController:");
      [*p_wrappedViewController didMoveToParentViewController:v9];
      [(PKWrapperViewController *)v9 setNeedsStatusBarAppearanceUpdate];
      if (v10 != [(PKWrapperViewController *)v9 preferredUserInterfaceStyle]) {
        [(PKWrapperViewController *)v9 setNeedsUserInterfaceAppearanceUpdate];
      }
      [(PKWrapperViewController *)v9 setNeedsUpdateOfHomeIndicatorAutoHidden];
      [(PKWrapperViewController *)v9 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
      [(PKWrapperViewController *)v9 setNeedsWhitePointAdaptivityStyleUpdate];
      v12 = [*p_wrappedViewController navigationItem];
      [(PKWrapperViewController *)v9 _setExistingNavigationItem:v12];

      [(PKWrapperViewController *)v9 _updatePreferredContentSize];
    }
  }

  return v9;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)PKWrapperViewController;
  [(PKWrapperViewController *)&v7 loadView];
  v3 = [(PKWrapperViewController *)self view];
  [v3 setAutoresizingMask:0];
  v4 = [(UIViewController *)self->_wrappedViewController view];
  v5 = v4;
  if (!self->_type)
  {
    [v4 setAutoresizingMask:0];
    v6 = [v5 backgroundColor];
    [v3 setBackgroundColor:v6];

    objc_msgSend(v3, "setOpaque:", objc_msgSend(v5, "isOpaque"));
  }
  [v3 addSubview:v5];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKWrapperViewController;
  [(PKWrapperViewController *)&v5 viewWillLayoutSubviews];
  if (!self->_type)
  {
    v3 = [(UIViewController *)self->_wrappedViewController view];
    v4 = [(PKWrapperViewController *)self view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
  }
}

- (void)_updatePreferredContentSize
{
  [(UIViewController *)self->_wrappedViewController preferredContentSize];

  -[PKWrapperViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKWrapperViewController;
  v4 = (UIViewController *)a3;
  [(PKWrapperViewController *)&v6 preferredContentSizeDidChangeForChildContentContainer:v4];
  wrappedViewController = self->_wrappedViewController;

  if (wrappedViewController == v4) {
    [(PKWrapperViewController *)self _updatePreferredContentSize];
  }
}

- (unint64_t)edgesForExtendedLayout
{
  return [(UIViewController *)self->_wrappedViewController edgesForExtendedLayout];
}

- (BOOL)extendedLayoutIncludesOpaqueBars
{
  return [(UIViewController *)self->_wrappedViewController extendedLayoutIncludesOpaqueBars];
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_wrappedViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_wrappedViewController;
}

- (int64_t)preferredUserInterfaceStyle
{
  if (self->_wrappedViewController)
  {
    wrappedViewController = self->_wrappedViewController;
    return [(UIViewController *)wrappedViewController preferredUserInterfaceStyle];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PKWrapperViewController;
    return [(PKWrapperViewController *)&v4 preferredUserInterfaceStyle];
  }
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_wrappedViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_wrappedViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_wrappedViewController;
}

- (UIViewController)wrappedViewController
{
  return self->_wrappedViewController;
}

- (void).cxx_destruct
{
}

@end