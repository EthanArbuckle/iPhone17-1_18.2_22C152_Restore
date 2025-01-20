@interface SANPSetVolumeLevel
+ (id)setVolumeLevel;
- (BOOL)acknowledgedExceedingVolumeLimit;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)volumeValue;
- (NSString)actionType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAcknowledgedExceedingVolumeLimit:(BOOL)a3;
- (void)setActionType:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setVolumeValue:(id)a3;
@end

@implementation SANPSetVolumeLevel

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"SetVolumeLevel";
}

+ (id)setVolumeLevel
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)acknowledgedExceedingVolumeLimit
{
  return AceObjectBoolForProperty(self, @"acknowledgedExceedingVolumeLimit");
}

- (void)setAcknowledgedExceedingVolumeLimit:(BOOL)a3
{
}

- (NSString)actionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"actionType"];
}

- (void)setActionType:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
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