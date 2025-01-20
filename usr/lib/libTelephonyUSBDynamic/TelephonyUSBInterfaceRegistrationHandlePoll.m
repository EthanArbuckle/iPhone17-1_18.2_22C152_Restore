@interface TelephonyUSBInterfaceRegistrationHandlePoll
@end

@implementation TelephonyUSBInterfaceRegistrationHandlePoll

uint64_t ___TelephonyUSBInterfaceRegistrationHandlePoll_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(v2 + 24);
  _TelephonyUtilDebugPrint();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 32) + 16))(*(void *)(v2 + 32), v3, v4, v5);
  uint64_t v6 = *(void *)(a1 + 32);
  _TelephonyUtilDebugPrint();
  v7 = *(uint64_t (**)(void))(*(void *)(v6 + 40) + 16);

  return v7();
}

@end