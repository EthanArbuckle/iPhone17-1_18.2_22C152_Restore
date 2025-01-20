@interface SALocalSearchSetNavigationVoiceVolumeCompleted
+ (id)setNavigationVoiceVolumeCompleted;
- (BOOL)requiresResponse;
- (NSString)volume;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVolume:(id)a3;
@end

@implementation SALocalSearchSetNavigationVoiceVolumeCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"SetNavigationVoiceVolumeCompleted";
}

+ (id)setNavigationVoiceVolumeCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)volume
{
  return (NSString *)[(AceObject *)self propertyForKey:@"volume"];
}

- (void)setVolume:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end