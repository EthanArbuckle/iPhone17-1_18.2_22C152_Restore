@interface PASDispatch
@end

@implementation PASDispatch

uint64_t __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke_5(void *a1)
{
  id obj = *(id *)(*(void *)(a1[4] + 8) + 40);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[6] + 8) + 40));
  v4 = WeakRetained;
  if (WeakRetained) {
    dispatch_block_cancel(WeakRetained);
  }

  objc_sync_exit(obj);
}

void __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_sync_enter(obj);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
  objc_sync_exit(obj);
}

@end