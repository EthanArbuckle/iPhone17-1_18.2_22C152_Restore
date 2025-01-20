@interface NTKCNavigationController
- (NTKCNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (NTKCNavigationController)initWithRootViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_commonInit;
@end

@implementation NTKCNavigationController

- (NTKCNavigationController)initWithRootViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCNavigationController;
  v3 = [(NTKCNavigationController *)&v6 initWithRootViewController:a3];
  v4 = v3;
  if (v3) {
    [(NTKCNavigationController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = [(NTKCNavigationController *)self navigationBar];
  BPSApplyStyleToNavBarOptions();

  id v4 = [(NTKCNavigationController *)self toolbar];
  BPSApplyStyleToToolbar();
}

- (NTKCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCNavigationController;
  id v4 = [(NTKCNavigationController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(NTKCNavigationController *)v4 _commonInit];
  }
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end