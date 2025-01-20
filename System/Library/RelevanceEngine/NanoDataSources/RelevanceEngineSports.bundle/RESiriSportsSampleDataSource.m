@interface RESiriSportsSampleDataSource
+ (id)applicationBundleIdentifier;
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation RESiriSportsSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.upnext.siri.sports";
}

+ (id)applicationBundleIdentifier
{
  return @"com.apple.tv";
}

- (id)supportedSections
{
  return &__NSArray0__struct;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void *))a4 + 2))(a4, &__NSArray0__struct);
  }
}

@end