@interface NSArray
@end

@implementation NSArray

void __87__NSArray_TransformUtilities__sl_mapAsynchronouslyOnQueue_transform_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(a1 + 32) setObject:v4 atIndexedSubscript:*(void *)(a1 + 56)];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  }
  v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

void __87__NSArray_TransformUtilities__sl_mapAsynchronouslyOnQueue_transform_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_msgSend(v2, "addObject:", v8, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end