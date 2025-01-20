@interface SBBatteryDeviceChargeTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBBatteryDeviceChargeTestRecipe

- (id)title
{
  return @"Change Battery Device Charge";
}

- (void)handleVolumeIncrease
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SBBatteryDeviceChargeTestRecipeIncreaseNotification", 0, 0, 0);
}

- (void)handleVolumeDecrease
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SBBatteryDeviceChargeTestRecipeDecreaseNotification", 0, 0, 0);
}

@end