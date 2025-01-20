@interface STContentPrivacyStoreDetailController
- (BOOL)isEligibleForAppDistribution;
- (STContentPrivacyListController)contentPrivacyController;
- (id)specifiers;
- (void)_isLoadedDidChange:(BOOL)a3;
- (void)dealloc;
- (void)didCancelEnteringPIN;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentPrivacyController:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation STContentPrivacyStoreDetailController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)STContentPrivacyStoreDetailController;
  [(STContentPrivacyStoreDetailController *)&v7 viewDidLoad];
  v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  if ([(STContentPrivacyStoreDetailController *)self isEligibleForAppDistribution]) {
    v5 = @"AppsInstallationsAndPurchasesSpecifierName";
  }
  else {
    v5 = @"ITunesAppStorePurchasesSpecifierName";
  }
  v6 = [v4 localizedStringForKey:v5 value:&stru_26D9391A8 table:v3];
  [(STContentPrivacyStoreDetailController *)self setTitle:v6];
}

- (id)specifiers
{
  BOOL v3 = [(STContentPrivacyStoreDetailController *)self isEligibleForAppDistribution];
  v4 = [(STContentPrivacyStoreDetailController *)self contentPrivacyController];
  v5 = v4;
  if (v3) {
    [v4 distributionStoreDetailSpecifiers];
  }
  else {
  v6 = [v4 storeDetailSpecifiers];
  }
  uint64_t v7 = (int)*MEMORY[0x263F5FDB8];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v7) = v6;

  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v7);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STContentPrivacyStoreDetailController *)self specifierAtIndexPath:v7];
  v9 = [(STContentPrivacyStoreDetailController *)self getGroupSpecifierForSpecifier:v8];
  v10 = [v9 objectForKeyedSubscript:0x26D93CEC8];
  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60308]];
    if ([(STPINListViewController *)self shouldShowPINSheetForSpecifier:v8])
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __75__STContentPrivacyStoreDetailController_tableView_didSelectRowAtIndexPath___block_invoke;
      v23[3] = &unk_2647677E0;
      v23[4] = self;
      id v24 = v11;
      id v25 = v10;
      id v26 = v6;
      id v27 = v7;
      [(PSListController *)self st_showPINSheetWithCompletion:v23];
    }
    else
    {
      v12 = [(STPINListViewController *)self coordinator];
      v13 = [v12 contentPrivacyCoordinator];
      [v13 saveRestrictionValue:v11 forItem:v10 completionHandler:&__block_literal_global_42];

      v22.receiver = self;
      v22.super_class = (Class)STContentPrivacyStoreDetailController;
      [(STPINListViewController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
      if (_os_feature_enabled_impl())
      {
        v14 = [MEMORY[0x263F67088] sharedController];
        v15 = [MEMORY[0x263F67088] sharedController];
        v16 = [v15 viewContext];
        id v21 = 0;
        char v19 = [v14 saveContext:v16 error:&v21];
        id v17 = v21;

        if ((v19 & 1) == 0)
        {
          v18 = +[STUILog communicationSafety];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
            -[STContentPrivacyStoreDetailController tableView:didSelectRowAtIndexPath:]();
          }
        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STContentPrivacyStoreDetailController;
    [(STPINListViewController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

id *__75__STContentPrivacyStoreDetailController_tableView_didSelectRowAtIndexPath___block_invoke(id *result, int a2)
{
  if (a2)
  {
    v2 = result;
    BOOL v3 = [result[4] coordinator];
    v4 = [v3 contentPrivacyCoordinator];
    [v4 saveRestrictionValue:v2[5] forItem:v2[6] completionHandler:&__block_literal_global_6];

    id v5 = v2[7];
    id v6 = v2[8];
    v7.receiver = v2[4];
    v7.super_class = (Class)STContentPrivacyStoreDetailController;
    return (id *)objc_msgSendSuper2(&v7, sel_tableView_didSelectRowAtIndexPath_, v5, v6);
  }
  return result;
}

- (BOOL)isEligibleForAppDistribution
{
  BOOL v3 = [(STPINListViewController *)self coordinator];
  v4 = [v3 viewModel];
  id v5 = [v4 me];
  if ([v5 isRemoteUser])
  {
    char v6 = 0;
  }
  else
  {
    objc_super v7 = [(STPINListViewController *)self coordinator];
    v8 = [v7 contentPrivacyCoordinator];
    v9 = [v8 viewModel];
    char v6 = [v9 isEligibleForAppDistribution];
  }
  return v6;
}

- (void)dealloc
{
  BOOL v3 = [(STPINListViewController *)self coordinator];
  [v3 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.isLoaded" context:@"KVOContextContentPrivacyStoreDetailController"];

  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacyStoreDetailController;
  [(STListViewController *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];
  char v6 = v5;
  if (v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyStoreDetailController;
    [(STPINListViewController *)&v7 setCoordinator:v4];
  }
  else
  {
    [v5 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.isLoaded" context:@"KVOContextContentPrivacyStoreDetailController"];
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyStoreDetailController;
    [(STPINListViewController *)&v7 setCoordinator:v4];
    [v4 addObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.isLoaded" options:1 context:@"KVOContextContentPrivacyStoreDetailController"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == @"KVOContextContentPrivacyStoreDetailController")
  {
    id v12 = a3;
    [(STPINListViewController *)self coordinator];

    int v13 = [v12 isEqualToString:@"contentPrivacyCoordinator.viewModel.isLoaded"];
    if (v13)
    {
      v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STContentPrivacyStoreDetailController _isLoadedDidChange:](self, "_isLoadedDidChange:", [v14 BOOLValue]);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STContentPrivacyStoreDetailController;
    id v11 = a3;
    [(STListViewController *)&v16 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_isLoadedDidChange:(BOOL)a3
{
  if (a3) {
    [(STContentPrivacyStoreDetailController *)self reloadSpecifiers];
  }
}

- (void)didCancelEnteringPIN
{
  v3.receiver = self;
  v3.super_class = (Class)STContentPrivacyStoreDetailController;
  [(STPINListViewController *)&v3 didCancelEnteringPIN];
  [(STContentPrivacyStoreDetailController *)self reloadSpecifiers];
}

- (STContentPrivacyListController)contentPrivacyController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPrivacyController);

  return (STContentPrivacyListController *)WeakRetained;
}

- (void)setContentPrivacyController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to save ContentPrivacyListController settings: %{public}@", v2, v3, v4, v5, v6);
}

@end