@interface SiriActivationDeviceSupportsPearlID
@end

@implementation SiriActivationDeviceSupportsPearlID

uint64_t ___SiriActivationDeviceSupportsPearlID_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _SiriActivationDeviceSupportsPearlID_deviceSupportsPearlID = result;
  return result;
}

@end