@interface SFDeviceHasHomeButton
@end

@implementation SFDeviceHasHomeButton

uint64_t ___SFDeviceHasHomeButton_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _SFDeviceHasHomeButton::hasHomeButton = result != 2;
  return result;
}

@end