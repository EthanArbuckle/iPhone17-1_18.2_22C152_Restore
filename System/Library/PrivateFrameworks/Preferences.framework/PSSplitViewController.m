@interface PSSplitViewController
- (PSRootController)containerNavigationController;
- (PSSplitViewControllerNavigationDelegate)navigationDelegate;
- (id)categoryController;
- (id)childViewControllerForStatusBarStyle;
- (void)popRecursivelyToRootController;
- (void)setContainerNavigationController:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setupControllerForToolbar:(id)a3;
- (void)showInitialViewController:(id)a3;
@end

@implementation PSSplitViewController

- (void)setViewControllers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = [v4 objectAtIndexedSubscript:0];
      v8 = [v7 navigationBar];
      [v8 setPrefersLargeTitles:1];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PSSplitViewController;
  [(PSSplitViewController *)&v9 setViewControllers:v4];
}

- (id)childViewControllerForStatusBarStyle
{
  v2 = [(PSSplitViewController *)self viewControllers];
  v3 = [v2 firstObject];

  return v3;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (void)setContainerNavigationController:(id)a3
{
}

- (void)popRecursivelyToRootController
{
  v4.receiver = self;
  v4.super_class = (Class)PSSplitViewController;
  [(UIViewController *)&v4 popRecursivelyToRootController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  [WeakRetained splitViewControllerDidPopToRootController:self];
}

- (void)showInitialViewController:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v19 = [MEMORY[0x1E4F42948] currentDevice];
    int v20 = objc_msgSend(v19, "sf_isInternalInstall");

    if (v20) {
      NSLog(&cfstr_TryingToShowAN.isa);
    }
    goto LABEL_18;
  }
  if (![v4 conformsToProtocol:&unk_1EFB7BC28]) {
    goto LABEL_10;
  }
  v6 = [(PSSplitViewController *)self containerNavigationController];
  v7 = [v6 viewControllers];
  v8 = [v7 firstObject];
  int v9 = [v8 conformsToProtocol:&unk_1EFB7BC28];

  if (!v9) {
    goto LABEL_10;
  }
  v10 = [(PSSplitViewController *)self containerNavigationController];
  v11 = [v10 viewControllers];
  if (![v11 count])
  {

    goto LABEL_10;
  }
  v12 = [(PSSplitViewController *)self containerNavigationController];
  v13 = [v12 viewControllers];
  v14 = [v13 objectAtIndexedSubscript:0];
  v15 = [v14 specifier];
  v16 = [v5 specifier];

  if (v15 != v16)
  {
LABEL_10:
    v21 = [(PSSplitViewController *)self containerNavigationController];
    v22 = [v21 toolbar];
    [v22 setHidden:1];

    v29[0] = v5;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v24 = [(PSSplitViewController *)self containerNavigationController];
    [v24 setViewControllers:v23];

    if ([v5 conformsToProtocol:&unk_1EFB7BC28]) {
      [v5 setRootController:self->_containerNavigationController];
    }
    [(PSSplitViewController *)self setupControllerForToolbar:v5];
    goto LABEL_13;
  }
  v17 = [(PSSplitViewController *)self containerNavigationController];
  id v18 = (id)[v17 popToRootViewControllerAnimated:1];

LABEL_13:
  v25 = [(PSSplitViewController *)self viewControllers];
  v26 = [(PSSplitViewController *)self containerNavigationController];
  if ([v25 containsObject:v26])
  {

LABEL_17:
    goto LABEL_18;
  }
  v27 = [(PSSplitViewController *)self containerNavigationController];
  v28 = [v27 splitViewController];

  if (v28 != self)
  {
    v25 = [(PSSplitViewController *)self containerNavigationController];
    [(PSSplitViewController *)self showDetailViewController:v25 sender:self];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)setupControllerForToolbar:(id)a3
{
  id v3 = a3;
  [v3 _setSuppressesBottomBar:1];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "_setSuppressesBottomBar:", objc_msgSend(v3, "performSelector:", sel_needsToShowToolbarInPrefsAppRoot) == 0);
  }
}

- (PSRootController)containerNavigationController
{
  containerNavigationController = self->_containerNavigationController;
  if (!containerNavigationController)
  {
    id v4 = objc_alloc_init(PSRootController);
    v5 = self->_containerNavigationController;
    self->_containerNavigationController = v4;

    [(PSSplitViewController *)self setupControllerForToolbar:self->_containerNavigationController];
    containerNavigationController = self->_containerNavigationController;
  }
  return containerNavigationController;
}

- (id)categoryController
{
  v2 = [(PSSplitViewController *)self containerNavigationController];
  id v3 = [v2 viewControllers];
  id v4 = [v3 firstObject];

  return v4;
}

- (PSSplitViewControllerNavigationDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  return (PSSplitViewControllerNavigationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_containerNavigationController, 0);
}

@end