@interface PTUISettingsController
- (BOOL)_canShowWhileLocked;
- (PTUISettingsController)initWithRootModule:(id)a3;
- (PTUISettingsController)initWithRootModuleController:(id)a3;
- (PTUISettingsController)initWithRootSettings:(id)a3;
- (UIBarButtonItem)dismissButton;
- (id)_defaultDismissButton;
- (void)_didTap:(id)a3;
- (void)_dismiss;
- (void)_reloadWithRootModule:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDismissButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation PTUISettingsController

- (PTUISettingsController)initWithRootSettings:(id)a3
{
  id v4 = a3;
  v5 = [[PTUIModuleController alloc] initWithSettings:v4];

  v6 = [(PTUISettingsController *)self initWithRootModuleController:v5];
  return v6;
}

- (PTUISettingsController)initWithRootModule:(id)a3
{
  id v4 = a3;
  id v5 = [[PTUIModuleController alloc] _initWithModule:v4 presentingRow:0];

  v6 = [(PTUISettingsController *)self initWithRootModuleController:v5];
  return v6;
}

- (PTUISettingsController)initWithRootModuleController:(id)a3
{
  v3 = [(PTUISettingsController *)self initWithRootViewController:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [(PTUISettingsController *)v3 _defaultDismissButton];
    [(PTUISettingsController *)v4 setDismissButton:v5];
  }
  return v4;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PTUISettingsController;
  [(PTUISettingsController *)&v8 viewDidLoad];
  v3 = [(PTUISettingsController *)self view];
  id v4 = [MEMORY[0x263F1C550] orangeColor];
  [v3 setTintColor:v4];

  id v5 = [(PTUISettingsController *)self view];
  [v5 _setContinuousCornerRadius:16.0];

  v6 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__didTap_];
  [v6 setCancelsTouchesInView:0];
  v7 = [(PTUISettingsController *)self view];
  [v7 addGestureRecognizer:v6];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDismissButton:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_dismissButton = &self->_dismissButton;
  objc_storeStrong((id *)&self->_dismissButton, a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = [(PTUISettingsController *)self viewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) navigationItem];
        [v12 setRightBarButtonItem:*p_dismissButton];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 navigationItem];
  [v7 setRightBarButtonItem:self->_dismissButton];

  v8.receiver = self;
  v8.super_class = (Class)PTUISettingsController;
  [(PTUISettingsController *)&v8 pushViewController:v6 animated:v4];
}

- (void)_didTap:(id)a3
{
  id v3 = [(PTUISettingsController *)self view];
  [v3 endEditing:1];
}

- (id)_defaultDismissButton
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__dismiss];

  return v2;
}

- (void)_dismiss
{
  id v2 = [(PTUISettingsController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_reloadWithRootModule:(id)a3
{
  id v4 = a3;
  id v5 = [(PTUISettingsController *)self viewControllers];
  id v10 = [v5 firstObject];

  id v6 = [v10 tableView];
  v7 = [(PTUISettingsController *)self view];
  objc_super v8 = [v7 tintColor];
  [v6 setTintColor:v8];

  [v10 _reloadWithModule:v4];
  id v9 = (id)[(PTUISettingsController *)self popToViewController:v10 animated:0];
}

- (UIBarButtonItem)dismissButton
{
  return self->_dismissButton;
}

- (void).cxx_destruct
{
}

@end