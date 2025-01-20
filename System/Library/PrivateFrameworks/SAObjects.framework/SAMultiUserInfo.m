@interface SAMultiUserInfo
+ (id)multiUserInfo;
- (BOOL)requiresResponse;
- (BOOL)voiceProfilesAreInFlight;
- (NSArray)homeMembers;
- (NSArray)multiUserPitchComposition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHomeMembers:(id)a3;
- (void)setMultiUserPitchComposition:(id)a3;
- (void)setVoiceProfilesAreInFlight:(BOOL)a3;
@end

@implementation SAMultiUserInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"MultiUserInfo";
}

+ (id)multiUserInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)homeMembers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"homeMembers", v3);
}

- (void)setHomeMembers:(id)a3
{
}

- (NSArray)multiUserPitchComposition
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"multiUserPitchComposition"];
}

- (void)setMultiUserPitchComposition:(id)a3
{
}

- (BOOL)voiceProfilesAreInFlight
{
  return AceObjectBoolForProperty(self, @"voiceProfilesAreInFlight");
}

- (void)setVoiceProfilesAreInFlight:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end