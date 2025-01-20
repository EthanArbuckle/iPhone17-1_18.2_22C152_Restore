@interface STDevicesMenu
+ (void)updateWithCoordinator:(id)a3 viewController:(id)a4;
@end

@implementation STDevicesMenu

+ (void)updateWithCoordinator:(id)a3 viewController:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  v6 = [v19 viewModel];
  v7 = [v6 me];

  v8 = [v19 usageDetailsCoordinator];
  v9 = [v8 devices];
  unint64_t v10 = [v9 count];

  v11 = [v19 viewModel];
  int v12 = [v11 isCloudSyncEnabled];

  if (v10 >= 2 && ([v7 isRemoteUser] | v12) == 1)
  {
    v13 = +[STScreenTimeSettingsUIBundle bundle];
    v14 = [v13 localizedStringForKey:@"DevicesButtonTitle" value:&stru_26D9391A8 table:0];

    id v15 = objc_alloc(MEMORY[0x263F824A8]);
    v16 = +[STUsageDetailListController _getDevicesDropDownMenuWithCoordinator:v19 viewController:v5];
    v17 = (void *)[v15 initWithTitle:v14 menu:v16];
    v18 = [v5 navigationItem];
    [v18 setRightBarButtonItem:v17];
  }
  else
  {
    v14 = [v5 navigationItem];
    [v14 setRightBarButtonItem:0];
  }
}

@end