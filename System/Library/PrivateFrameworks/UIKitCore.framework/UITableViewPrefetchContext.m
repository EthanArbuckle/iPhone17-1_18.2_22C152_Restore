@interface UITableViewPrefetchContext
@end

@implementation UITableViewPrefetchContext

void __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke(void *a1, unint64_t a2)
{
  unint64_t v2 = a1[5];
  BOOL v4 = a2 >= v2;
  unint64_t v3 = a2 - v2;
  BOOL v4 = !v4 || v3 >= a1[6];
  if (v4)
  {
    v7 = *(void **)(*(void *)(a1[4] + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(a1[4] + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v7 = *(void **)(*(void *)(a1[4] + 8) + 40);
    }
    id v11 = [NSNumber numberWithUnsignedInteger:a2];
    [v7 addObject:v11];
  }
}

uint64_t __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [a2 unsignedIntegerValue];
  return [v2 removeIndex:v3];
}

BOOL __91___UITableViewPrefetchContext_shouldRefreshForVisibleIndexRange_effectiveRefreshDirection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (unint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "countOfIndexesInRange:", a2, a3) <= *(void *)(*(void *)(a1 + 32) + 80);
}

void __101___UITableViewPrefetchContext_computeIndexesToRefreshForVisibleIndexRange_effectiveRefreshDirection___block_invoke(void *a1, unint64_t a2)
{
  if (a1[6] <= a2)
  {
    uint64_t v3 = (void *)a1[5];
    id v4 = [NSNumber numberWithUnsignedInteger:a2];
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    unint64_t v2 = (void *)a1[4];
    id v4 = [NSNumber numberWithUnsignedInteger:a2];
    objc_msgSend(v2, "insertObject:atIndex:");
  }
}

uint64_t __72___UITableViewPrefetchContext_schedulePrefetchRequestAfterNextCACommit___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    result = *(void *)(v1 + 16);
    if (result)
    {
      result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(v2 + 40));
      uint64_t v1 = *(void *)(v2 + 32);
    }
    *(unsigned char *)(v1 + 8) = 0;
  }
  return result;
}

void __53___UITableViewPrefetchContext_cancelWithNewMaxIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

@end