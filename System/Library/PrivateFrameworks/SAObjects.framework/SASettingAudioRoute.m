@interface SASettingAudioRoute
+ (id)audioRoute;
- (NSString)audioRouteType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioRouteType:(id)a3;
@end

@implementation SASettingAudioRoute

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"AudioRoute";
}

+ (id)audioRoute
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)audioRouteType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioRouteType"];
}

- (void)setAudioRouteType:(id)a3
{
}

@end