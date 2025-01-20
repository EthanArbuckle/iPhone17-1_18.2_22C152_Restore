@interface SADeviceControlRebootDevice
+ (id)rebootDevice;
- (BOOL)isShutdownOnly;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIsShutdownOnly:(BOOL)a3;
@end

@implementation SADeviceControlRebootDevice

- (id)groupIdentifier
{
  return @"com.apple.ace.devicecontrol";
}

- (id)encodedClassName
{
  return @"RebootDevice";
}

+ (id)rebootDevice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)isShutdownOnly
{
  return AceObjectBoolForProperty(self, @"isShutdownOnly");
}

- (void)setIsShutdownOnly:(BOOL)a3
{
}

@end