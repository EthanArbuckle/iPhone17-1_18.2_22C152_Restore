@interface SASettingUnsetAirPlayRoute
+ (id)unsetAirPlayRoute;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingUnsetAirPlayRoute

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"UnsetAirPlayRoute";
}

+ (id)unsetAirPlayRoute
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end