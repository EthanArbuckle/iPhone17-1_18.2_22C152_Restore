@interface SANPGetVolumeLevelResponse
+ (id)getVolumeLevelResponse;
- (BOOL)requiresResponse;
- (NSNumber)volumeValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVolumeValue:(id)a3;
@end

@implementation SANPGetVolumeLevelResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"GetVolumeLevelResponse";
}

+ (id)getVolumeLevelResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)volumeValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"volumeValue"];
}

- (void)setVolumeValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end