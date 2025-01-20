@interface TelephonyUSBDeviceFreeCallbacks
@end

@implementation TelephonyUSBDeviceFreeCallbacks

void ___TelephonyUSBDeviceFreeCallbacks_block_invoke(uint64_t a1)
{
  v2 = **(const void ***)(a1 + 32);
  if (!v2)
  {
    __TUAssertTrigger();
    v2 = **(const void ***)(a1 + 32);
  }
  _Block_release(v2);
  v3 = *(void **)(a1 + 32);

  free(v3);
}

@end