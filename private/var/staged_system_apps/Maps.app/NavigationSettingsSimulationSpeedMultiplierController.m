@interface NavigationSettingsSimulationSpeedMultiplierController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation NavigationSettingsSimulationSpeedMultiplierController

+ (id)navigationDestinationTitle
{
  return @"Simulation Speed Multiplier";
}

- (void)prepareContent
{
  id v2 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_1013021D8];
}

@end