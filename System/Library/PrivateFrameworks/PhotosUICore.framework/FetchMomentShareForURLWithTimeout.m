@interface FetchMomentShareForURLWithTimeout
@end

@implementation FetchMomentShareForURLWithTimeout

void ___FetchMomentShareForURLWithTimeout_block_invoke(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    v2 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1011, @"Fetch timed out");
    (*(void (**)(void))(a1[4] + 16))();
  }
  v3 = (os_unfair_lock_s *)(*(void *)(a1[5] + 8) + 32);
  os_unfair_lock_unlock(v3);
}

void ___FetchMomentShareForURLWithTimeout_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___FetchMomentShareForURLWithTimeout_block_invoke_3;
    block[3] = &unk_1E5DD0E78;
    id v10 = *(id *)(a1 + 32);
    id v8 = v5;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
}

uint64_t ___FetchMomentShareForURLWithTimeout_block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end