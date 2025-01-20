@interface SBWidgetLaunchStatsTestRecipe
- (id)title;
- (void)handleVolumeIncrease;
@end

@implementation SBWidgetLaunchStatsTestRecipe

- (id)title
{
  return @"Trigger Duet for Widgets";
}

- (void)handleVolumeIncrease
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:@"DuetWidgetLaunchStatsUpdate" object:0];
}

@end