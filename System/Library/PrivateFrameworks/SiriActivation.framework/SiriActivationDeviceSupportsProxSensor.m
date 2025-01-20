@interface SiriActivationDeviceSupportsProxSensor
@end

@implementation SiriActivationDeviceSupportsProxSensor

uint64_t ___SiriActivationDeviceSupportsProxSensor_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _SiriActivationDeviceSupportsProxSensor_deviceSupportsProxSensor = result;
  return result;
}

@end