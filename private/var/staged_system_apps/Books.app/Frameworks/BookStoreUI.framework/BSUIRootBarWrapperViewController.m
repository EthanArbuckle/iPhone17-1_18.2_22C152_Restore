@interface BSUIRootBarWrapperViewController
- (BOOL)bc_analyticsVisibilityOfSelf;
- (BSUINavigationController)contentNavigationController;
- (BSUIRootBarWrapperViewController)init;
- (BSUIRootBarWrapperViewController)initWithContentNavigationController:(id)a3;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)im_childViewControllerForTabBarVisibility;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateContentNavigationControllerFrom:(id)a3 to:(id)a4;
- (void)setContentNavigationController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BSUIRootBarWrapperViewController

- (BSUIRootBarWrapperViewController)init
{
  return [(BSUIRootBarWrapperViewController *)self initWithContentNavigationController:0];
}

- (BSUIRootBarWrapperViewController)initWithContentNavigationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSUIRootBarWrapperViewController;
  v6 = [(BSUIRootBarWrapperViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentNavigationController, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BSUIRootBarWrapperViewController;
  [(BSUIRootBarWrapperViewController *)&v3 viewDidLoad];
  if (self->_contentNavigationController) {
    -[BSUIRootBarWrapperViewController _updateContentNavigationControllerFrom:to:](self, "_updateContentNavigationControllerFrom:to:", 0);
  }
}

- (void)setContentNavigationController:(id)a3
{
  v4 = (BSUINavigationController *)a3;
  id v7 = [(BSUIRootBarWrapperViewController *)self viewIfLoaded];
  if (v7)
  {
    contentNavigationController = self->_contentNavigationController;
    if (contentNavigationController != v4) {
      [(BSUIRootBarWrapperViewController *)self _updateContentNavigationControllerFrom:contentNavigationController to:v4];
    }
  }
  v6 = self->_contentNavigationController;
  self->_contentNavigationController = v4;
}

- (void)_updateContentNavigationControllerFrom:(id)a3 to:(id)a4
{
  id v20 = a4;
  id v6 = a3;
  [v6 willMoveToParentViewController:0];
  id v7 = [v6 wrapperView];
  [v7 removeFromSuperview];

  [v6 removeFromParentViewController];
  if (v20)
  {
    [(BSUIRootBarWrapperViewController *)self addChildViewController:v20];
    v8 = [(BSUIRootBarWrapperViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [v20 wrapperView];
    [v17 setFrame:v10, v12, v14, v16];

    v18 = [(BSUIRootBarWrapperViewController *)self view];
    v19 = [v20 wrapperView];
    [v18 addSubview:v19];

    [v20 didMoveToParentViewController:self];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3 = [(BSUIRootBarWrapperViewController *)self contentNavigationController];

  if (v3)
  {
    v4 = [(BSUIRootBarWrapperViewController *)self contentNavigationController];
    id v5 = [v4 supportedInterfaceOrientations];

    return (unint64_t)v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BSUIRootBarWrapperViewController;
    return [(BSUIRootBarWrapperViewController *)&v7 supportedInterfaceOrientations];
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BSUIRootBarWrapperViewController;
  id v5 = -[BSUIRootBarWrapperViewController contentScrollViewForEdge:](&v8, "contentScrollViewForEdge:");
  if (!v5)
  {
    id v6 = [(BSUIRootBarWrapperViewController *)self contentNavigationController];
    id v5 = [v6 contentScrollViewForEdge:a3];
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIRootBarWrapperViewController;
  [(BSUIRootBarWrapperViewController *)&v4 viewDidAppear:a3];
  [(BSUIRootBarWrapperViewController *)self bc_analyticsVisibilityUpdateSubtree];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIRootBarWrapperViewController;
  [(BSUIRootBarWrapperViewController *)&v4 viewWillDisappear:a3];
  [(BSUIRootBarWrapperViewController *)self bc_analyticsVisibilitySubtreeWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIRootBarWrapperViewController;
  [(BSUIRootBarWrapperViewController *)&v4 viewDidDisappear:a3];
  [(BSUIRootBarWrapperViewController *)self bc_analyticsVisibilitySubtreeDidDisappear];
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  v2 = [(BSUIRootBarWrapperViewController *)self contentNavigationController];
  objc_super v3 = [v2 visibleViewController];

  if (v3)
  {
    objc_opt_class();
    objc_super v4 = BUDynamicCast();
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)im_childViewControllerForTabBarVisibility
{
  v2 = [(BSUIRootBarWrapperViewController *)self contentNavigationController];
  objc_super v3 = [v2 im_childViewControllerForTabBarVisibility];

  return v3;
}

- (BSUINavigationController)contentNavigationController
{
  return self->_contentNavigationController;
}

- (void).cxx_destruct
{
}

@end