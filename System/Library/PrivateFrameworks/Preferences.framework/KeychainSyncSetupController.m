@interface KeychainSyncSetupController
- (KeychainSyncSetupController)initWithManager:(id)a3;
- (void)cancelPressed;
- (void)showController:(id)a3;
@end

@implementation KeychainSyncSetupController

- (KeychainSyncSetupController)initWithManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncSetupController;
  v5 = [(PSSetupController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_manager, v4);
  }

  return v6;
}

- (void)showController:(id)a3
{
  id v4 = a3;
  v5 = [(KeychainSyncSetupController *)self viewControllers];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPressed];
    objc_super v8 = [v4 navigationItem];
    [v8 setLeftBarButtonItem:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [v4 setDelegate:WeakRetained];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setRootController:self];
  }
  v10.receiver = self;
  v10.super_class = (Class)KeychainSyncSetupController;
  [(PSRootController *)&v10 showController:v4];
}

- (void)cancelPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained keychainSyncControllerCancel:self];
}

- (void).cxx_destruct
{
}

@end