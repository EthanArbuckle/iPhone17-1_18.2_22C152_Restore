@interface TelephonyUSBInterfaceRegistrationHandleDestroy
@end

@implementation TelephonyUSBInterfaceRegistrationHandleDestroy

void ___TelephonyUSBInterfaceRegistrationHandleDestroy_block_invoke(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  v2 = *(void **)(a1 + 48);

  free(v2);
}

@end