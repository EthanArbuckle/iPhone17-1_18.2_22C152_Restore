@interface PassThroughViewController
- (BOOL)hasParentView;
- (PassThroughViewControllerDelegate)delegate;
- (UIView)passThroughView;
- (UIView)targetView;
- (void)_reloadAXIdentifierWithParentViewController:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)passThroughView:(id)a3 didMoveToView:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation PassThroughViewController

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PassThroughViewController;
  id v4 = a3;
  [(PassThroughViewController *)&v5 didMoveToParentViewController:v4];
  -[PassThroughViewController _reloadAXIdentifierWithParentViewController:](self, "_reloadAXIdentifierWithParentViewController:", v4, v5.receiver, v5.super_class);
}

- (void)_reloadAXIdentifierWithParentViewController:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = +[NSString stringWithFormat:@"%@<%p>.%@<%p>", v5, v10, v7, self];
    v9 = [(PassThroughViewController *)self view];
    [v9 setAccessibilityIdentifier:v8];
  }
  else
  {
    objc_super v5 = [(PassThroughViewController *)self view];
    [v5 setAccessibilityIdentifier:0];
  }
}

- (void)loadView
{
  v3 = -[PassThroughView initWithFrame:]([PassThroughView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(PassThroughView *)v3 setDelegate:self];
  [(PassThroughViewController *)self setView:v3];
}

- (void)passThroughView:(id)a3 didMoveToView:(id)a4
{
  id v6 = a3;
  id v7 = [(PassThroughViewController *)self viewIfLoaded];

  if (v7 == v6)
  {
    if (a4)
    {
      self->_hasParentView = 1;
      [(PassThroughViewController *)self viewDidMoveToParent];
    }
    else
    {
      self->_hasParentView = 0;
      [(PassThroughViewController *)self viewDidRemoveFromParent];
    }
  }
}

- (UIView)passThroughView
{
  v2 = [(PassThroughViewController *)self delegate];
  v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (void)setTargetView:(id)a3
{
  id v4 = a3;
  id v5 = [(PassThroughViewController *)self view];
  [v5 setTargetView:v4];
}

- (UIView)targetView
{
  v2 = [(PassThroughViewController *)self view];
  v3 = [v2 targetView];

  return (UIView *)v3;
}

- (PassThroughViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PassThroughViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasParentView
{
  return self->_hasParentView;
}

- (void).cxx_destruct
{
}

@end