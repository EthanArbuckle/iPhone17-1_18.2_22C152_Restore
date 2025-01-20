@interface UIAlertController(ScreenTimeAdditions)
+ (id)alertControllerForFeatureNotAvailable;
@end

@implementation UIAlertController(ScreenTimeAdditions)

+ (id)alertControllerForFeatureNotAvailable
{
  v0 = +[STScreenTimeSettingsUIBundle bundle];
  v1 = (void *)MEMORY[0x263F82418];
  v2 = [v0 localizedStringForKey:@"NotAvailableInDemoMode" value:&stru_26D9391A8 table:0];
  v3 = [v1 alertControllerWithTitle:v2 message:0 preferredStyle:1];

  v4 = (void *)MEMORY[0x263F82400];
  v5 = [v0 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
  v6 = [v4 actionWithTitle:v5 style:0 handler:0];
  [v3 addAction:v6];

  return v3;
}

@end