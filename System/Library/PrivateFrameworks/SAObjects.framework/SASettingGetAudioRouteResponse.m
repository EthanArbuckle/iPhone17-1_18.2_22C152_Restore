@interface SASettingGetAudioRouteResponse
+ (id)getAudioRouteResponse;
- (BOOL)requiresResponse;
- (SASettingAudioRoute)audioRoute;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioRoute:(id)a3;
@end

@implementation SASettingGetAudioRouteResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"GetAudioRouteResponse";
}

+ (id)getAudioRouteResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASettingAudioRoute)audioRoute
{
  return (SASettingAudioRoute *)AceObjectAceObjectForProperty(self, @"audioRoute");
}

- (void)setAudioRoute:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end