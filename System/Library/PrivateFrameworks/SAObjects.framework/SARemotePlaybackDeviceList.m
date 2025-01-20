@interface SARemotePlaybackDeviceList
+ (id)remotePlaybackDeviceList;
- (NSArray)remotePlaybackDevices;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRemotePlaybackDevices:(id)a3;
@end

@implementation SARemotePlaybackDeviceList

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RemotePlaybackDeviceList";
}

+ (id)remotePlaybackDeviceList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)remotePlaybackDevices
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"remotePlaybackDevices", v3);
}

- (void)setRemotePlaybackDevices:(id)a3
{
}

@end