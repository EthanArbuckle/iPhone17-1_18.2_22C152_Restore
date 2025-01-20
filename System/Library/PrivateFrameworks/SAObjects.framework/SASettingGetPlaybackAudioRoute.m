@interface SASettingGetPlaybackAudioRoute
+ (id)getPlaybackAudioRoute;
- (BOOL)requiresResponse;
- (NSString)audioCategory;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioCategory:(id)a3;
@end

@implementation SASettingGetPlaybackAudioRoute

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"GetPlaybackAudioRoute";
}

+ (id)getPlaybackAudioRoute
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)audioCategory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioCategory"];
}

- (void)setAudioCategory:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end