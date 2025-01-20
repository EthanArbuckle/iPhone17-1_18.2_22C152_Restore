@interface MapKitDebugController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation MapKitDebugController

+ (id)navigationDestinationTitle
{
  return @"MapKit";
}

- (void)prepareContent
{
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"User Location" content:&stru_1013181B8];
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Elevated Terrain" content:&stru_101318258];
}

@end