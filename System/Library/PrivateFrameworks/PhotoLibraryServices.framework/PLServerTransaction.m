@interface PLServerTransaction
@end

@implementation PLServerTransaction

uint64_t __49___PLServerTransaction_completeTransactionScope___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) count];
  [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateChangeScopesDescriptionSnapshot];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) count];
  if (result != v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[12];
    return [v4 persistTransactionScopes:v5];
  }
  return result;
}

void __36___PLServerTransaction_changeScopes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

unint64_t __45___PLServerTransaction__enqueueChangeScopes___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 96) count];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * v8), (void)v9);
          [*(id *)(a1 + 40) _updateChangeScopesDescriptionSnapshot];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    unint64_t result = [*(id *)(*(void *)(a1 + 40) + 96) count];
    if (result > v3) {
      return [*(id *)(a1 + 40) persistTransactionScopes:*(void *)(*(void *)(a1 + 40) + 96)];
    }
  }
  return result;
}

@end