@interface SALocalSearchSetNavigationVoiceMuted
+ (id)setNavigationVoiceMuted;
- (BOOL)requiresResponse;
- (BOOL)voiceMuted;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVoiceMuted:(BOOL)a3;
@end

@implementation SALocalSearchSetNavigationVoiceMuted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"SetNavigationVoiceMuted";
}

+ (id)setNavigationVoiceMuted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)voiceMuted
{
  return AceObjectBoolForProperty(self, @"voiceMuted");
}

- (void)setVoiceMuted:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end