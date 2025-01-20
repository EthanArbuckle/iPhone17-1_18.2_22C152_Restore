@interface PXObservable
@end

@implementation PXObservable

void __77__PXObservable_PXStory__pxStory_enumerateStatesByWatchingChanges_usingBlock___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && (a1[8] & a3) != 0)
  {
    id v6 = v5;
    (*(void (**)(void))(a1[5] + 16))();
    id v5 = v6;
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      [*(id *)(*(void *)(a1[7] + 8) + 40) cancel];
      id v5 = v6;
    }
  }
}

uint64_t __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t result = *(void *)(a1 + 40);
  if (result && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end