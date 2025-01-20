@interface HORotatableNavigationController
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HORotatableNavigationController

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HORotatableNavigationController;
  [(HORotatableNavigationController *)&v5 viewDidAppear:a3];
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (!v4) {
    [(id)objc_opt_class() attemptRotationToDeviceOrientation];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (![(HORotatableNavigationController *)self isBeingPresented]) {
    return 30;
  }
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 2;
  }
}

@end