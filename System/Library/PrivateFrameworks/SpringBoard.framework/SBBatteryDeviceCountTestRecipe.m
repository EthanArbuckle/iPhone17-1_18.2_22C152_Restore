@interface SBBatteryDeviceCountTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBBatteryDeviceCountTestRecipe

- (id)title
{
  return @"Change Battery Device Count";
}

- (void)handleVolumeIncrease
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SBBatteryDeviceCountTestRecipeIncreaseNotification", 0, 0, 0);
}

- (void)handleVolumeDecrease
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SBBatteryDeviceCountTestRecipeDecreaseNotification", 0, 0, 0);
}

@end