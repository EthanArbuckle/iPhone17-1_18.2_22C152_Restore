@interface SAScreenActionShowHomeScreen
+ (id)showHomeScreen;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAScreenActionShowHomeScreen

- (id)groupIdentifier
{
  return @"com.apple.ace.onscreenaction";
}

- (id)encodedClassName
{
  return @"ShowHomeScreen";
}

+ (id)showHomeScreen
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end