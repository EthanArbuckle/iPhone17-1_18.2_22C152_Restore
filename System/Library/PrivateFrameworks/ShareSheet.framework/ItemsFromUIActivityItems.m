@interface ItemsFromUIActivityItems
@end

@implementation ItemsFromUIActivityItems

void ____ItemsFromUIActivityItems_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (_UIActivityItemIsLivePhoto(v5))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObjectAtIndex:a3];
  }
}

void ____ItemsFromUIActivityItems_block_invoke_2(int8x16_t *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v5 = _UIActivityItemsWithTypes(*(void **)(*(void *)(a1[2].i64[0] + 8) + 40), a2, 0, a4, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ____ItemsFromUIActivityItems_block_invoke_3;
  v6[3] = &unk_1E5A22628;
  int8x16_t v7 = vextq_s8(a1[2], a1[2], 8uLL);
  [v5 enumerateObjectsUsingBlock:v6];
}

void ____ItemsFromUIActivityItems_block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v3 addObject:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObjectIdenticalTo:v4];
}

void ____ItemsFromUIActivityItems_block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v4 = [v5 string];
    [v3 addObject:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObjectIdenticalTo:v5];
LABEL_6:
}

void ____ItemsFromUIActivityItems_block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([v3 hasItemConformingToTypeIdentifier:v9])
        {
          dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = ____ItemsFromUIActivityItems_block_invoke_6;
          v14[3] = &unk_1E5A22678;
          uint64_t v12 = *(void *)(a1 + 40);
          uint64_t v11 = *(void *)(a1 + 48);
          dispatch_semaphore_t v15 = v10;
          uint64_t v16 = v11;
          v13 = v10;
          [v3 loadItemForTypeIdentifier:v9 options:v12 completionHandler:v14];
          dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObjectIdenticalTo:v3];
}

intptr_t ____ItemsFromUIActivityItems_block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:a2];
  id v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

@end