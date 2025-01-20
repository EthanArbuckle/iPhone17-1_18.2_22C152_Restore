@interface KeyColorDebugController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation KeyColorDebugController

+ (id)navigationDestinationTitle
{
  return @"Key Color";
}

- (void)prepareContent
{
  id v2 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Key Color Override" content:&stru_101313BC8];
}

@end