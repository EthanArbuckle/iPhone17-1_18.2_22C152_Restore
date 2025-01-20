@interface SUUIMoreNavigationController
+ (Class)_moreListControllerClass;
- (SUUIMoreNavigationControllerDelegate)storeKitDelegate;
- (id)displayedViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDisplayedViewController:(id)a3;
- (void)setStoreKitDelegate:(id)a3;
@end

@implementation SUUIMoreNavigationController

- (void)setStoreKitDelegate:(id)a3
{
}

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 viewControllers],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    [(SUUIMoreNavigationController *)self setDisplayedViewController:v6];
  }
  else
  {
    if (!self->_firstActualViewController && self->_displayedViewController)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v6 viewControllers];
        v10 = [v9 firstObject];
        firstActualViewController = self->_firstActualViewController;
        self->_firstActualViewController = v10;
      }
      else
      {
        v12 = (UIViewController *)v6;
        v9 = self->_firstActualViewController;
        self->_firstActualViewController = v12;
      }
    }
    v13.receiver = self;
    v13.super_class = (Class)SUUIMoreNavigationController;
    [(UIMoreNavigationController *)&v13 pushViewController:v6 animated:v4];
  }
}

- (id)displayedViewController
{
  displayedViewController = self->_displayedViewController;
  if (displayedViewController)
  {
    v3 = displayedViewController;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIMoreNavigationController;
    v3 = [(UIMoreNavigationController *)&v5 displayedViewController];
  }
  return v3;
}

- (void)setDisplayedViewController:(id)a3
{
  BOOL v4 = (UINavigationController *)a3;
  objc_super v5 = [(SUUIMoreNavigationController *)self displayedViewController];

  if (v5 != v4)
  {
    displayedViewController = self->_displayedViewController;
    self->_displayedViewController = 0;

    BOOL v4 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(UINavigationController *)v4 viewControllers];
      uint64_t v8 = [v7 count];

      if (v8)
      {
LABEL_7:
        v11.receiver = self;
        v11.super_class = (Class)SUUIMoreNavigationController;
        [(UIMoreNavigationController *)&v11 setDisplayedViewController:v4];
        goto LABEL_8;
      }
      v9 = 0;
      v10 = self->_displayedViewController;
      self->_displayedViewController = v4;
      BOOL v4 = v10;
    }
    else
    {
      v9 = v4;
    }

    BOOL v4 = v9;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(UIMoreNavigationController *)self moreListController];

  if (v7 == v6)
  {
    if (self->_firstActualViewController)
    {
      displayedViewController = self->_displayedViewController;
      v13[0] = self->_firstActualViewController;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      [(UINavigationController *)displayedViewController setViewControllers:v9 animated:0];

      firstActualViewController = self->_firstActualViewController;
      self->_firstActualViewController = 0;
    }
    objc_super v11 = self->_displayedViewController;
    self->_displayedViewController = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIMoreNavigationController;
  [(UIMoreNavigationController *)&v12 didShowViewController:v6 animated:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SUUIMoreNavigationController *)self topViewController];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 supportedInterfaceOrientations];
  }
  else
  {
    objc_super v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      unint64_t v4 = 30;
    }
    else if (SUUIAllowsLandscapePhone())
    {
      unint64_t v4 = 26;
    }
    else
    {
      unint64_t v4 = 2;
    }
  }

  return v4;
}

- (SUUIMoreNavigationControllerDelegate)storeKitDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storeKitDelegate);
  return (SUUIMoreNavigationControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storeKitDelegate);
  objc_storeStrong((id *)&self->_firstActualViewController, 0);
  objc_storeStrong((id *)&self->_displayedViewController, 0);
}

@end