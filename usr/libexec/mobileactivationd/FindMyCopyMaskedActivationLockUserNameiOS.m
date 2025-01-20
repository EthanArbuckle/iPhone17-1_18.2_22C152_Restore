@interface FindMyCopyMaskedActivationLockUserNameiOS
@end

@implementation FindMyCopyMaskedActivationLockUserNameiOS

void ___FindMyCopyMaskedActivationLockUserNameiOS_block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || (id v9 = [v5 maskedAppleID], v9, !v9))
  {
    v7 = createMobileActivationError((uint64_t)"_FindMyCopyMaskedActivationLockUserNameiOS_block_invoke", 329, @"com.apple.MobileActivation.ErrorDomain", -1, v6, @"Failed to retrieve activation lock info.");
    uint64_t v8 = *(void *)(a1 + 40);
  }
  else
  {
    v7 = (NSError *)[v5 maskedAppleID];
    uint64_t v8 = *(void *)(a1 + 48);
  }
  uint64_t v10 = *(void *)(v8 + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end