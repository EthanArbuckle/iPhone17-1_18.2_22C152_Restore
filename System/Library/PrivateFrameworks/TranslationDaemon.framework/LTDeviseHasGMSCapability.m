@interface LTDeviseHasGMSCapability
@end

@implementation LTDeviseHasGMSCapability

uint64_t ___LTDeviseHasGMSCapability_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _LTDeviseHasGMSCapability_deviceSupportsGenerativeModelSystems = result;
  return result;
}

@end