@interface TelephonyUSBInterfaceRegistrationFreeCallbacks
@end

@implementation TelephonyUSBInterfaceRegistrationFreeCallbacks

void ___TelephonyUSBInterfaceRegistrationFreeCallbacks_block_invoke(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 32);
    *(void *)(v2 + 32) = 0;
  }
  v4 = *(const void **)(v2 + 40);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
  }
}

@end