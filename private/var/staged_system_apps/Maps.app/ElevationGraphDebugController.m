@interface ElevationGraphDebugController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation ElevationGraphDebugController

+ (id)navigationDestinationTitle
{
  return @"Elevation Graph";
}

- (void)prepareContent
{
  id v2 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Chart Bucketing Algorithm" content:&stru_1012F6940];
}

@end