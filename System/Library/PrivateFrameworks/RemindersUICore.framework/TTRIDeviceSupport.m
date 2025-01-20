@interface TTRIDeviceSupport
+ (BOOL)deviceSupportsPencil;
@end

@implementation TTRIDeviceSupport

+ (BOOL)deviceSupportsPencil
{
  if (deviceSupportsPencil_onceToken[0] != -1) {
    dispatch_once(deviceSupportsPencil_onceToken, &__block_literal_global_0);
  }
  return deviceSupportsPencil_supportsPencil;
}

uint64_t __41__TTRIDeviceSupport_deviceSupportsPencil__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  deviceSupportsPencil_supportsPencil = result;
  return result;
}

@end