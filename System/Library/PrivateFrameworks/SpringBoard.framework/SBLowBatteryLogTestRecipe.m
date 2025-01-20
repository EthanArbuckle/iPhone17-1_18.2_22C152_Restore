@interface SBLowBatteryLogTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBLowBatteryLogTestRecipe

- (id)title
{
  return @"Print LowBattery Log";
}

- (void)handleVolumeIncrease
{
}

- (void)handleVolumeDecrease
{
}

@end