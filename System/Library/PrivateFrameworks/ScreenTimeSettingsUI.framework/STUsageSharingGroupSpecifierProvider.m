@interface STUsageSharingGroupSpecifierProvider
- (STUsageSharingGroupSpecifierProvider)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
@end

@implementation STUsageSharingGroupSpecifierProvider

- (STUsageSharingGroupSpecifierProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)STUsageSharingGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v11 init];
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = objc_opt_new();
  v5 = [v4 UUIDString];
  v6 = [v3 groupSpecifierWithID:v5];

  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AADC_ScreenTimeGroupSpecifierFooterText"];
  v9 = [v7 localizedStringForKey:v8 value:&stru_26D9391A8 table:0];
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x263F600F8]];

  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.isSharingUsageData" context:@"KVOContextUsageSharingGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STUsageSharingGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.isSharingUsageData" options:5 context:@"KVOContextUsageSharingGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == @"KVOContextUsageSharingGroupSpecifierProvider")
  {
    if ([a3 isEqualToString:@"viewModel.isSharingUsageData"])
    {
      objc_super v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v12 = [MEMORY[0x263EFF9D0] null];

      if (v11 == v12)
      {

        objc_super v11 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v11 BOOLValue] ^ 1);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUsageSharingGroupSpecifierProvider;
    [(STUsageSharingGroupSpecifierProvider *)&v13 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

@end