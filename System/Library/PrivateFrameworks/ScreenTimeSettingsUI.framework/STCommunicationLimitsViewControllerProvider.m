@interface STCommunicationLimitsViewControllerProvider
+ (id)communicationLimitsViewControllerForDSID:(id)a3;
@end

@implementation STCommunicationLimitsViewControllerProvider

+ (id)communicationLimitsViewControllerForDSID:(id)a3
{
  id v3 = a3;
  v4 = [[STRootViewModelCoordinator alloc] initWithUserDSID:v3 deviceIdentifier:0 usageReportType:0 usageContext:0];

  v5 = [[STCommunicationLimitsListController alloc] initWithRootViewModelCoordinator:v4];
  v6 = +[STScreenTimeSettingsUIBundle bundle];
  v7 = [v6 localizedStringForKey:@"CommunicationLimitsSpecifierName" value:&stru_26D9391A8 table:0];
  [(STCommunicationLimitsListController *)v5 setTitle:v7];

  v8 = [(STRootViewModelCoordinator *)v4 viewModel];
  v9 = [v8 me];
  int v10 = [v9 isRemoteUser];

  if (v10) {
    [MEMORY[0x263EFE9D0] requestAccountSyncWithOptions:1];
  }

  return v5;
}

@end