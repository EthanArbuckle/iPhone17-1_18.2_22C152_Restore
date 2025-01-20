@interface STFamilyRootViewController
- (BOOL)presentedAsModal;
- (STFamilyRootViewController)init;
- (STFamilyRootViewController)initWithModalPresentation:(BOOL)a3;
- (STRootViewModelCoordinator)coordinator;
- (void)setPresentedAsModal:(BOOL)a3;
@end

@implementation STFamilyRootViewController

- (STFamilyRootViewController)init
{
  return [(STFamilyRootViewController *)self initWithModalPresentation:0];
}

- (STFamilyRootViewController)initWithModalPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)STFamilyRootViewController;
  v4 = [(STListViewController *)&v13 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    coordinator = v4->_coordinator;
    v4->_coordinator = (STRootViewModelCoordinator *)v5;

    v4->_presentedAsModal = v3;
    v7 = +[STScreenTimeSettingsUIBundle bundle];
    v8 = [v7 localizedStringForKey:@"ScreenTimeControllerTitle" value:&stru_26D9391A8 table:0];
    [(STFamilyRootViewController *)v4 setTitle:v8];

    v9 = [(STFamilyRootViewController *)v4 coordinator];
    v10 = +[STFamilyMemberGroupSpecifierProvider providerWithCoordinator:v9 presentedAsModal:v3];
    v14[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(STListViewController *)v4 setSpecifierProviders:v11];
  }
  return v4;
}

- (BOOL)presentedAsModal
{
  return self->_presentedAsModal;
}

- (void)setPresentedAsModal:(BOOL)a3
{
  self->_presentedAsModal = a3;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
}

@end