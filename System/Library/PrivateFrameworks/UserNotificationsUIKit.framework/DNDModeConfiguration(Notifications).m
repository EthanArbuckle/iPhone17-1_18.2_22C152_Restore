@interface DNDModeConfiguration(Notifications)
- (BOOL)nc_modeConfigurationHasExclusiveAppConfigurationType;
@end

@implementation DNDModeConfiguration(Notifications)

- (BOOL)nc_modeConfigurationHasExclusiveAppConfigurationType
{
  v1 = [a1 configuration];
  uint64_t v2 = [v1 applicationConfigurationType];

  return v2 == 0;
}

@end