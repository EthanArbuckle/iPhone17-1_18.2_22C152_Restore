@interface SADPDeviceSearchCompleted
+ (id)deviceSearchCompleted;
- (BOOL)remotePlaySoundRestricted;
- (BOOL)requiresResponse;
- (NSArray)resolvedDevices;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRemotePlaySoundRestricted:(BOOL)a3;
- (void)setResolvedDevices:(id)a3;
@end

@implementation SADPDeviceSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.devicePlaySound";
}

- (id)encodedClassName
{
  return @"DeviceSearchCompleted";
}

+ (id)deviceSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)remotePlaySoundRestricted
{
  return AceObjectBoolForProperty(self, @"remotePlaySoundRestricted");
}

- (void)setRemotePlaySoundRestricted:(BOOL)a3
{
}

- (NSArray)resolvedDevices
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"resolvedDevices", v3);
}

- (void)setResolvedDevices:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end