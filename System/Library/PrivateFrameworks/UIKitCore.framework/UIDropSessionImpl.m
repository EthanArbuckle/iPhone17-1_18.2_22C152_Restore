@interface UIDropSessionImpl
@end

@implementation UIDropSessionImpl

void __42___UIDropSessionImpl_requestVisibleItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___UIDropSessionImpl_requestVisibleItems___block_invoke_2;
  block[3] = &unk_1E52E3298;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42___UIDropSessionImpl_requestVisibleItems___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
        id v8 = [[_UIPlatterView alloc] initWithDroppedItem:v7];
        if (v8)
        {
          unint64_t v9 = [v7 itemIndex];
          id v10 = [*(id *)(a1 + 40) items];
          unint64_t v11 = [v10 count];

          if (v9 < v11)
          {
            [v15 addObject:v8];
            v12 = [*(id *)(a1 + 40) items];
            v13 = [v12 objectAtIndex:v9];
            [v14 addObject:v13];
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    v7 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v7 setObject:v9 forKey:v8];

    objc_sync_exit(v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v2 = arrayOfItemsFromDictionaryOfItemsByIndex(*(void **)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke_3;
  v5[3] = &unk_1E52DB330;
  id v3 = *(id *)(a1 + 48);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end