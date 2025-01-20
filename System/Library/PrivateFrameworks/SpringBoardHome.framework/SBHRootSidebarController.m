@interface SBHRootSidebarController
- (BOOL)_canShowWhileLocked;
- (NSMutableArray)widgetViewControllerConstraints;
- (SBHSidebarProviderDelegate)delegate;
- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration;
- (UIViewController)avocadoViewController;
- (_UILegibilitySettings)legibilitySettings;
- (unint64_t)layoutInsetsIgnoredEdges;
- (void)_configureAvocadoViewController;
- (void)_configureLayoutMargins;
- (void)_setupConstraintsForViewController:(id)a3;
- (void)setAvocadoViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setLayoutInsetsIgnoredEdges:(unint64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setSidebarVisualConfiguration:(id)a3;
- (void)setWidgetViewControllerConstraints:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBHRootSidebarController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SBHRootSidebarController;
  [(SBHRootSidebarController *)&v6 viewDidLoad];
  v3 = [(SBHRootSidebarController *)self view];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  v4 = (NSMutableArray *)objc_opt_new();
  widgetViewControllerConstraints = self->_widgetViewControllerConstraints;
  self->_widgetViewControllerConstraints = v4;

  [(SBHRootSidebarController *)self _configureAvocadoViewController];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHRootSidebarController;
  [(SBHRootSidebarController *)&v5 viewWillAppear:a3];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Sidebar viewWillAppear:", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBHRootSidebarController;
  [(SBHRootSidebarController *)&v8 viewDidAppear:a3];
  v4 = [(SBHRootSidebarController *)self view];
  objc_super v5 = [v4 window];

  objc_super v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = SBHStringFromUIInterfaceOrientation([v5 interfaceOrientation]);
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "[Overlay Position] Root side bar viewDidAppear:, orientation: %{public}@", buf, 0xCu);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHRootSidebarController;
  [(SBHRootSidebarController *)&v5 viewWillDisappear:a3];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Sidebar viewWillDisappear:", v4, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHRootSidebarController;
  [(SBHRootSidebarController *)&v5 viewDidDisappear:a3];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Sidebar viewDidDisappear:", v4, 2u);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSidebarVisualConfiguration:(id)a3
{
  objc_super v5 = (SBHSidebarVisualConfiguration *)a3;
  if (self->_sidebarVisualConfiguration != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_sidebarVisualConfiguration, a3);
    [(SBHRootSidebarController *)self _configureLayoutMargins];
    objc_super v5 = v6;
  }
}

- (void)setLayoutInsetsIgnoredEdges:(unint64_t)a3
{
  if (self->_layoutInsetsIgnoredEdges != a3)
  {
    self->_layoutInsetsIgnoredEdges = a3;
    [(SBHRootSidebarController *)self _configureLayoutMargins];
  }
}

- (void)setEditingIcons:(BOOL)a3
{
}

- (void)setAvocadoViewController:(id)a3
{
  objc_super v5 = (UIViewController *)a3;
  if (self->_avocadoViewController != v5)
  {
    v7 = v5;
    -[SBHRootSidebarController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    objc_super v6 = [(SBHRootSidebarController *)self widgetViewControllerConstraints];
    [v6 removeAllObjects];

    objc_storeStrong((id *)&self->_avocadoViewController, a3);
    [(SBHRootSidebarController *)self _configureAvocadoViewController];
    objc_super v5 = v7;
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    if (objc_opt_respondsToSelector()) {
      [(UIViewController *)self->_avocadoViewController setLegibilitySettings:v5];
    }
  }
}

- (void)_setupConstraintsForViewController:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHRootSidebarController *)self view];
  objc_super v6 = [v4 view];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [v6 leadingAnchor];
  objc_super v8 = [v5 leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];

  v10 = [v6 trailingAnchor];
  uint64_t v11 = [v5 trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];

  v13 = [v6 topAnchor];
  v14 = [v5 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];

  v16 = [v6 bottomAnchor];
  v17 = [v5 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];

  v19 = [(SBHRootSidebarController *)self widgetViewControllerConstraints];
  v23[0] = v9;
  v23[1] = v12;
  v23[2] = v15;
  v23[3] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v19 addObjectsFromArray:v20];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(SBHRootSidebarController *)self widgetViewControllerConstraints];
  [v21 activateConstraints:v22];
}

- (void)_configureAvocadoViewController
{
  id v3 = [(SBHRootSidebarController *)self avocadoViewController];
  if ([(SBHRootSidebarController *)self isViewLoaded] && v3)
  {
    [(SBHRootSidebarController *)self bs_addChildViewController:v3];
    [(SBHRootSidebarController *)self _setupConstraintsForViewController:v3];
  }
}

- (void)_configureLayoutMargins
{
  id v3 = [(SBHRootSidebarController *)self sidebarVisualConfiguration];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(SBHSidebarVisualConfiguration);
  }
  v15 = v5;

  char v6 = [(SBHRootSidebarController *)self layoutInsetsIgnoredEdges];
  [(SBHSidebarVisualConfiguration *)v15 insets];
  double v7 = SBHDirectionalEdgeInsetsByClearingEdges(v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(SBHRootSidebarController *)self view];
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v7, v9, v11, v13);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration
{
  return self->_sidebarVisualConfiguration;
}

- (unint64_t)layoutInsetsIgnoredEdges
{
  return self->_layoutInsetsIgnoredEdges;
}

- (SBHSidebarProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHSidebarProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)avocadoViewController
{
  return self->_avocadoViewController;
}

- (NSMutableArray)widgetViewControllerConstraints
{
  return self->_widgetViewControllerConstraints;
}

- (void)setWidgetViewControllerConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_avocadoViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sidebarVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end