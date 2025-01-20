@interface SKUIMoreNavigationController
+ (Class)_moreListControllerClass;
- (SKUIMoreNavigationControllerDelegate)storeKitDelegate;
- (id)displayedViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)displayedViewController;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDisplayedViewController:(id)a3;
- (void)setStoreKitDelegate:(id)a3;
- (void)supportedInterfaceOrientations;
@end

@implementation SKUIMoreNavigationController

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (id)displayedViewController
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIMoreNavigationController *)v3 displayedViewController];
      }
    }
  }
  displayedViewController = self->_displayedViewController;
  if (displayedViewController)
  {
    v12 = displayedViewController;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIMoreNavigationController;
    v12 = [(UIMoreNavigationController *)&v14 displayedViewController];
  }

  return v12;
}

- (void)setDisplayedViewController:(id)a3
{
  uint64_t v4 = (UINavigationController *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMoreNavigationController setDisplayedViewController:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [(SKUIMoreNavigationController *)self displayedViewController];

  if (v13 != v4)
  {
    displayedViewController = self->_displayedViewController;
    self->_displayedViewController = 0;

    uint64_t v4 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [(UINavigationController *)v4 viewControllers];
      uint64_t v16 = [v15 count];

      if (v16)
      {
LABEL_11:
        v19.receiver = self;
        v19.super_class = (Class)SKUIMoreNavigationController;
        [(UIMoreNavigationController *)&v19 setDisplayedViewController:v4];
        goto LABEL_12;
      }
      v17 = 0;
      v18 = self->_displayedViewController;
      self->_displayedViewController = v4;
      uint64_t v4 = v18;
    }
    else
    {
      v17 = v4;
    }

    uint64_t v4 = v17;
    goto LABEL_11;
  }
LABEL_12:
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIMoreNavigationController didShowViewController:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = [(UIMoreNavigationController *)self moreListController];

  if (v15 == v6)
  {
    if (self->_firstActualViewController)
    {
      displayedViewController = self->_displayedViewController;
      v21[0] = self->_firstActualViewController;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [(UINavigationController *)displayedViewController setViewControllers:v17 animated:0];

      firstActualViewController = self->_firstActualViewController;
      self->_firstActualViewController = 0;
    }
    objc_super v19 = self->_displayedViewController;
    self->_displayedViewController = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMoreNavigationController;
  [(UIMoreNavigationController *)&v20 didShowViewController:v6 animated:v4];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIMoreNavigationController pushViewController:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v15 viewControllers];
    uint64_t v17 = [v16 count];

    if (!v17)
    {
      [(SKUIMoreNavigationController *)self setDisplayedViewController:v15];
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (!self->_firstActualViewController && self->_displayedViewController)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [v15 viewControllers];
      objc_super v19 = [v18 firstObject];
      firstActualViewController = self->_firstActualViewController;
      self->_firstActualViewController = v19;
    }
    else
    {
      v21 = (UIViewController *)v15;
      v18 = self->_firstActualViewController;
      self->_firstActualViewController = v21;
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIMoreNavigationController;
  [(UIMoreNavigationController *)&v22 pushViewController:v15 animated:v4];
LABEL_16:
}

- (unint64_t)supportedInterfaceOrientations
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIMoreNavigationController *)v3 supportedInterfaceOrientations];
      }
    }
  }
  uint64_t v11 = [(SKUIMoreNavigationController *)self topViewController];
  uint64_t v12 = v11;
  if (v11)
  {
    unint64_t v13 = [v11 supportedInterfaceOrientations];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (v15 == 1)
    {
      unint64_t v13 = 30;
    }
    else if (SKUIAllowsLandscapePhone())
    {
      unint64_t v13 = 26;
    }
    else
    {
      unint64_t v13 = 2;
    }
  }

  return v13;
}

- (SKUIMoreNavigationControllerDelegate)storeKitDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storeKitDelegate);

  return (SKUIMoreNavigationControllerDelegate *)WeakRetained;
}

- (void)setStoreKitDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storeKitDelegate);
  objc_storeStrong((id *)&self->_firstActualViewController, 0);

  objc_storeStrong((id *)&self->_displayedViewController, 0);
}

- (void)displayedViewController
{
}

- (void)setDisplayedViewController:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didShowViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pushViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)supportedInterfaceOrientations
{
}

@end