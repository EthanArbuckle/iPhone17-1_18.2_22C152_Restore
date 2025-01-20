@interface UIPrintPanelNavigationController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (UIPrintOptionsTableViewController)printOptionsTableViewController;
- (UIPrintPanelAppearanceDelegate)appearanceDelegate;
- (UIPrintPanelNavigationController)initWithPrintOptionsTableViewController:(id)a3 rootViewController:(id)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_presentationControllerDidDismiss:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setAppearanceDelegate:(id)a3;
- (void)setPrintOptionsTableViewController:(id)a3;
@end

@implementation UIPrintPanelNavigationController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  [WeakRetained printNavigationConrollerDidDismiss];
}

- (UIPrintPanelNavigationController)initWithPrintOptionsTableViewController:(id)a3 rootViewController:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIPrintPanelNavigationController;
  v7 = [(UIPrintPanelNavigationController *)&v10 initWithRootViewController:a4];
  v8 = v7;
  if (v7) {
    [(UIPrintPanelNavigationController *)v7 setPrintOptionsTableViewController:v6];
  }

  return v8;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIPrintPanelNavigationController *)self topViewController];
  id v6 = [(UIPrintPanelNavigationController *)self printOptionsTableViewController];

  if (v5 == v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPrintPanelNavigationController;
    v7 = [(UIPrintPanelNavigationController *)&v9 popViewControllerAnimated:v3];
  }
  return v7;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [(UIPrintPanelNavigationController *)self view];
    v8 = [v7 window];
    [v8 endEditing:1];
  }
  v9.receiver = self;
  v9.super_class = (Class)UIPrintPanelNavigationController;
  [(UIPrintPanelNavigationController *)&v9 pushViewController:v6 animated:v4];
}

- (UIPrintPanelAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (UIPrintPanelAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (UIPrintOptionsTableViewController)printOptionsTableViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printOptionsTableViewController);
  return (UIPrintOptionsTableViewController *)WeakRetained;
}

- (void)setPrintOptionsTableViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printOptionsTableViewController);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
}

@end