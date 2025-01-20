@interface PSCellularDataSettingsDetail
+ (BOOL)deviceSupportsCellularData;
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSCellularDataSettingsDetail

+ (BOOL)isEnabled
{
  return CTCellularDataPlanGetIsEnabled() != 0;
}

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MOBILE_DATA_SETTINGS_ID"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.cellular-settings");
}

+ (void)setEnabled:(BOOL)a3
{
}

+ (BOOL)deviceSupportsCellularData
{
  return MGGetBoolAnswer();
}

@end