@interface SSScreenshotsWindowRootViewController
- (BOOL)_canShowWhileLocked;
- (SSScreenshotsWindowRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)managedViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)setManagedViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SSScreenshotsWindowRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (UIViewController)managedViewController
{
  return self->_managedViewController;
}

- (SSScreenshotsWindowRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SSScreenshotsWindowRootViewController;
  v4 = [(SSScreenshotsWindowRootViewController *)&v6 initWithNibName:a3 bundle:a4];
  [(SSScreenshotsWindowRootViewController *)v4 _setIgnoreAppSupportedOrientations:1];
  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SSScreenshotsWindowRootViewController;
  [(SSScreenshotsWindowRootViewController *)&v5 viewDidLoad];
  v3 = [(SSScreenshotsWindowRootViewController *)self view];
  v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  a3->var6 = 0;
}

- (void)setManagedViewController:(id)a3
{
  id v12 = a3;
  p_managedViewController = &self->_managedViewController;
  [(UIViewController *)self->_managedViewController willMoveToParentViewController:0];
  objc_super v6 = [(UIViewController *)self->_managedViewController view];
  [v6 removeFromSuperview];

  [(UIViewController *)self->_managedViewController removeFromParentViewController];
  managedViewController = self->_managedViewController;
  self->_managedViewController = 0;

  objc_storeStrong((id *)&self->_managedViewController, a3);
  if (self->_managedViewController)
  {
    -[SSScreenshotsWindowRootViewController addChildViewController:](self, "addChildViewController:");
    v8 = [(SSScreenshotsWindowRootViewController *)self view];
    v9 = [(UIViewController *)*p_managedViewController view];
    [v8 addSubview:v9];

    [(UIViewController *)*p_managedViewController didMoveToParentViewController:self];
    v10 = [(UIViewController *)*p_managedViewController view];
    v11 = [(SSScreenshotsWindowRootViewController *)self view];
    [v11 bounds];
    objc_msgSend(v10, "setFrame:");
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end