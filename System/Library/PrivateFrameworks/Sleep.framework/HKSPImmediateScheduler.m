@interface HKSPImmediateScheduler
@end

@implementation HKSPImmediateScheduler

uint64_t __51___HKSPImmediateScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performOnMainThreadIfNecessary:*(void *)(a1 + 40)];
}

uint64_t __40___HKSPImmediateScheduler_performBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performOnMainThreadIfNecessary:*(void *)(a1 + 40)];
}

void __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke_2;
  v2[3] = &unk_1E5D33D90;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _performOnMainThreadIfNecessary:v2];
}

void __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F7A0B8]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end