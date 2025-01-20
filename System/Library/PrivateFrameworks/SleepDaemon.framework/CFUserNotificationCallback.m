@interface CFUserNotificationCallback
@end

@implementation CFUserNotificationCallback

void ___CFUserNotificationCallback_block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) registrations];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = ___CFUserNotificationCallback_block_invoke_2;
  v7[3] = &__block_descriptor_40_e51_B16__0___HDSPCFUserNotificationCenterRegistration_8l;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", v7);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v6 = [*(id *)(a1 + 32) registrations];
    [v6 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

BOOL ___CFUserNotificationCallback_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 notification];
  BOOL v4 = [v3 notification] == *(void *)(a1 + 32);

  return v4;
}

@end