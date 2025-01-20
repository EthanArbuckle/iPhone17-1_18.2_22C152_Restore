@interface SASetRemoteDevices
+ (id)setRemoteDevices;
- (BOOL)remoteDeviceHasNoAssistantId;
- (BOOL)remoteDeviceNotSetup;
- (BOOL)remoteDeviceUnreachable;
- (BOOL)requiresResponse;
- (NSArray)remoteDevices;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRemoteDeviceHasNoAssistantId:(BOOL)a3;
- (void)setRemoteDeviceNotSetup:(BOOL)a3;
- (void)setRemoteDeviceUnreachable:(BOOL)a3;
- (void)setRemoteDevices:(id)a3;
@end

@implementation SASetRemoteDevices

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetRemoteDevices";
}

+ (id)setRemoteDevices
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)remoteDeviceHasNoAssistantId
{
  return AceObjectBoolForProperty(self, @"remoteDeviceHasNoAssistantId");
}

- (void)setRemoteDeviceHasNoAssistantId:(BOOL)a3
{
}

- (BOOL)remoteDeviceNotSetup
{
  return AceObjectBoolForProperty(self, @"remoteDeviceNotSetup");
}

- (void)setRemoteDeviceNotSetup:(BOOL)a3
{
}

- (BOOL)remoteDeviceUnreachable
{
  return AceObjectBoolForProperty(self, @"remoteDeviceUnreachable");
}

- (void)setRemoteDeviceUnreachable:(BOOL)a3
{
}

- (NSArray)remoteDevices
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"remoteDevices", v3);
}

- (void)setRemoteDevices:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end