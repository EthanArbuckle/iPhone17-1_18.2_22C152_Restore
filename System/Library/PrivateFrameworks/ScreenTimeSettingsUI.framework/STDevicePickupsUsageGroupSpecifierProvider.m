@interface STDevicePickupsUsageGroupSpecifierProvider
- (STDevicePickupsUsageGroupSpecifierProvider)init;
- (id)_usageDetailsCoordinator:(id)a3;
- (id)getPickupsInfo:(id)a3;
- (id)newSpecifierWithUsageItem:(id)a3;
- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4;
- (void)_specifierIdentifierDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)showMostUsedDetailListController:(id)a3;
- (void)updateSpecifier:(id)a3 usageItem:(id)a4;
@end

@implementation STDevicePickupsUsageGroupSpecifierProvider

- (STDevicePickupsUsageGroupSpecifierProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)STDevicePickupsUsageGroupSpecifierProvider;
  v2 = [(STShowMoreUsageGroupSpecifierProvider *)&v11 init];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = [v3 localizedStringForKey:@"PickupsGroupName" value:&stru_26D9391A8 table:0];
  v6 = [v4 groupSpecifierWithName:v5];
  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];

  v7 = [v3 localizedStringForKey:@"DevicePickupSummaryName" value:&stru_26D9391A8 table:0];
  v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:v2 set:0 get:sel__usageDetailsCoordinator_ detail:0 cell:-1 edit:0];
  [v8 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  [(STShowMoreUsageGroupSpecifierProvider *)v2 setSummarySpecifier:v8];
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:v2 selector:sel__specifierIdentifierDidChange_ name:0x26D93EA08 object:0];

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STUsageGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" context:"KVOContextDevicePickupsUsageGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextDevicePickupsUsageGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STDevicePickupsUsageGroupSpecifierProvider;
  [(STUsageGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" options:5 context:"KVOContextDevicePickupsUsageGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" options:7 context:"KVOContextDevicePickupsUsageGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextDevicePickupsUsageGroupSpecifierProvider")
  {
    [(STUsageGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.hasUsageData"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v12 BOOLValue] ^ 1);
    }
    else
    {
      [(STUsageGroupSpecifierProvider *)self coordinator];

      if (![v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedUsageReport"])goto LABEL_14; {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      }
      v14 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v14)
      {

        v12 = 0;
      }
      v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v16 = [MEMORY[0x263EFF9D0] null];

      if (v15 == v16)
      {

        v15 = 0;
      }
      [(STDevicePickupsUsageGroupSpecifierProvider *)self _selectedUsageReportDidChangeFrom:v12 to:v15];
    }
    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)STDevicePickupsUsageGroupSpecifierProvider;
  [(STDevicePickupsUsageGroupSpecifierProvider *)&v17 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_14:
}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6 && ([v11 isEqual:v6] & 1) == 0)
  {
    uint64_t v7 = [v11 type];
    BOOL v8 = v7 == [v6 type];
    v9 = [(STShowMoreUsageGroupSpecifierProvider *)self summarySpecifier];
    [(STGroupSpecifierProvider *)self reloadSpecifier:v9 animated:v8];

    id v10 = [v6 pickups];
    [(STShowMoreUsageGroupSpecifierProvider *)self setUsageItems:v10];
  }
}

- (id)newSpecifierWithUsageItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  id v6 = [v5 displayName];
  uint64_t v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:sel_getPickupsInfo_ detail:0 cell:2 edit:0];

  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  BOOL v8 = [MEMORY[0x263F825C8] systemTealColor];
  [v7 setObject:v8 forKeyedSubscript:0x26D942068];

  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  [v7 setUserInfo:v5];

  [v7 setControllerLoadAction:sel_showMostUsedDetailListController_];
  return v7;
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 userInfo];

  if (v6 != v5)
  {
    uint64_t v7 = [v5 displayName];
    [v8 setName:v7];

    [v8 setUserInfo:v5];
  }
}

- (id)_usageDetailsCoordinator:(id)a3
{
  v3 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];

  return v4;
}

- (id)getPickupsInfo:(id)a3
{
  return (id)[a3 userInfo];
}

- (void)showMostUsedDetailListController:(id)a3
{
  id v4 = a3;
  id v10 = [v4 userInfo];
  id v5 = [STDrillInDetailListController alloc];
  id v6 = [(STUsageGroupSpecifierProvider *)self coordinator];
  uint64_t v7 = [(STDrillInDetailListController *)v5 initWithUsageItem:v10 coordinator:v6];

  id v8 = [(STGroupSpecifierProvider *)self delegate];
  [(STDrillInDetailListController *)v7 setParentController:v8];
  v9 = [v8 rootController];
  [(STDrillInDetailListController *)v7 setRootController:v9];

  [(STDrillInDetailListController *)v7 setSpecifier:v4];
  [(STGroupSpecifierProvider *)self showController:v7 animated:1];
}

- (void)_specifierIdentifierDidChange:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKeyedSubscript:0x26D93EA28];
  id v5 = [(STShowMoreUsageGroupSpecifierProvider *)self summarySpecifier];
  [v5 setIdentifier:v4];
}

@end