@interface BKWelcomeNavigationController
- (BKWelcomeNavigationControllerDelegate)bkDelegate;
- (BOOL)im_tabBarVisible;
- (BOOL)shouldAutorotate;
- (id)im_childViewControllerForTabBarVisibility;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)setBkDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BKWelcomeNavigationController

- (id)im_childViewControllerForTabBarVisibility
{
  return 0;
}

- (BOOL)im_tabBarVisible
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKWelcomeNavigationController;
  [(BKWelcomeNavigationController *)&v3 viewDidAppear:a3];
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3 = [(BKWelcomeNavigationController *)self topViewController];
  if (v3)
  {
    v4 = [(BKWelcomeNavigationController *)self topViewController];
    unint64_t v5 = (unint64_t)[v4 supportedInterfaceOrientations];
  }
  else
  {
    unint64_t v5 = 30;
  }

  return v5;
}

- (BOOL)shouldAutorotate
{
  objc_super v3 = [(BKWelcomeNavigationController *)self topViewController];
  if (v3)
  {
    v4 = [(BKWelcomeNavigationController *)self topViewController];
    unsigned __int8 v5 = [v4 shouldAutorotate];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKWelcomeNavigationController;
    unsigned __int8 v5 = [(BKWelcomeNavigationController *)&v7 shouldAutorotate];
  }

  return v5;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  objc_super v3 = [(BKWelcomeNavigationController *)self topViewController];
  if (v3)
  {
    v4 = [(BKWelcomeNavigationController *)self topViewController];
    id v5 = [v4 preferredInterfaceOrientationForPresentation];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKWelcomeNavigationController;
    id v5 = [(BKWelcomeNavigationController *)&v7 preferredInterfaceOrientationForPresentation];
  }

  return (int64_t)v5;
}

- (BKWelcomeNavigationControllerDelegate)bkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bkDelegate);

  return (BKWelcomeNavigationControllerDelegate *)WeakRetained;
}

- (void)setBkDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end