@interface SADPDevicePlaySound
+ (id)devicePlaySound;
- (BOOL)requiresResponse;
- (NSArray)devices;
- (NSString)action;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation SADPDevicePlaySound

- (id)groupIdentifier
{
  return @"com.apple.ace.devicePlaySound";
}

- (id)encodedClassName
{
  return @"DevicePlaySound";
}

+ (id)devicePlaySound
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)action
{
  return (NSString *)[(AceObject *)self propertyForKey:@"action"];
}

- (void)setAction:(id)a3
{
}

- (NSArray)devices
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"devices", v3);
}

- (void)setDevices:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end