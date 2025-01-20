@interface IsTelephonyDevice
@end

@implementation IsTelephonyDevice

uint64_t ___IsTelephonyDevice_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _IsTelephonyDevice_telephonyDevice = result != 0;
  return result;
}

@end