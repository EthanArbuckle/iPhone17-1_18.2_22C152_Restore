@interface SALocalSearchShowNavigationOverview
+ (id)showNavigationOverview;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALocalSearchShowNavigationOverview

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ShowNavigationOverview";
}

+ (id)showNavigationOverview
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end