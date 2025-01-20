@interface TelephonyUSBDeviceRegistrationHandleDestroy
@end

@implementation TelephonyUSBDeviceRegistrationHandleDestroy

void ___TelephonyUSBDeviceRegistrationHandleDestroy_block_invoke(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  v2 = *(void **)(a1 + 48);

  free(v2);
}

@end