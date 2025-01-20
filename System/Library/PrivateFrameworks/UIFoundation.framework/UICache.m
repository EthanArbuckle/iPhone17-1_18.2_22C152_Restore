@interface UICache
@end

@implementation UICache

uint64_t __29___UICache_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

id __33___UICache_retainedObjectForKey___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 16) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __31___UICache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

void __19___UICache_dealloc__block_invoke(uint64_t a1)
{
}

void __16___UICache_init__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___UICache_clearing_cache_due_to_memory_note_block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = v2;
  dispatch_sync(v1, block);
}

uint64_t __28___UICache_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

void __50___UICache_setClearsCacheOnApplicationBackground___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___UICache_clearing_cache_due_to_app_background_note_block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = v2;
  dispatch_sync(v1, block);
}

uint64_t __21___UICache_cacheKeys__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 16) allKeys];

  return [v1 addObjectsFromArray:v2];
}

uint64_t ___UICache_clearing_cache_due_to_memory_note_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

uint64_t ___UICache_clearing_cache_due_to_app_background_note_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

@end