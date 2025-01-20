@interface SASidekickHubDeviceInfo
- (BOOL)mediaPlaybackEnabled;
- (BOOL)requiresResponse;
- (NSString)accessoryIdentifier;
- (NSString)hubDeviceType;
- (NSString)hubUserId;
- (NSString)sidekickBrand;
- (NSString)sidekickDeviceType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setHubDeviceType:(id)a3;
- (void)setHubUserId:(id)a3;
- (void)setMediaPlaybackEnabled:(BOOL)a3;
- (void)setSidekickBrand:(id)a3;
- (void)setSidekickDeviceType:(id)a3;
@end

@implementation SASidekickHubDeviceInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SidekickHubDeviceInfo";
}

- (NSString)accessoryIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accessoryIdentifier"];
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)hubDeviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hubDeviceType"];
}

- (void)setHubDeviceType:(id)a3
{
}

- (NSString)hubUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hubUserId"];
}

- (void)setHubUserId:(id)a3
{
}

- (BOOL)mediaPlaybackEnabled
{
  return AceObjectBoolForProperty(self, @"mediaPlaybackEnabled");
}

- (void)setMediaPlaybackEnabled:(BOOL)a3
{
}

- (NSString)sidekickBrand
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sidekickBrand"];
}

- (void)setSidekickBrand:(id)a3
{
}

- (NSString)sidekickDeviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sidekickDeviceType"];
}

- (void)setSidekickDeviceType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end