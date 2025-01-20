@interface NavSettingsTraceSpeedMultiplierController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation NavSettingsTraceSpeedMultiplierController

+ (id)navigationDestinationTitle
{
  return @"Default Speed Multiplier";
}

- (void)prepareContent
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100D8B3D8;
  v3[3] = &unk_1012EE018;
  v4 = &off_1013AE958;
  id v2 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v3];
}

@end