@interface SADeviceControlLockDevice
+ (id)lockDevice;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SADeviceControlLockDevice

- (id)groupIdentifier
{
  return @"com.apple.ace.devicecontrol";
}

- (id)encodedClassName
{
  return @"LockDevice";
}

+ (id)lockDevice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end