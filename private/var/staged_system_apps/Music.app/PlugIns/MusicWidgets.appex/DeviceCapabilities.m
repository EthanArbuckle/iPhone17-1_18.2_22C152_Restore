@interface DeviceCapabilities
+ (BOOL)hasWAPICapability;
- (DeviceCapabilities)init;
@end

@implementation DeviceCapabilities

+ (BOOL)hasWAPICapability
{
  id v2 = (id)MobileGestalt_get_current_device();
  if (v2)
  {
    v3 = v2;
    char wapiCapability = MobileGestalt_get_wapiCapability();

    LOBYTE(v2) = wapiCapability;
  }
  else
  {
    __break(1u);
  }
  return (char)v2;
}

- (DeviceCapabilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(DeviceCapabilities *)&v3 init];
}

@end