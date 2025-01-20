@interface UIDragStatisticsLogTextDelegateItems
@end

@implementation UIDragStatisticsLogTextDelegateItems

void ___UIDragStatisticsLogTextDelegateItems_block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  v4 = v3;
  if (v2 != v3 && v2 != 0 && v3 != 0)
  {
    uint64_t v7 = [v2 count];
    if (v7 == [v4 count])
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D30]), "initWithOptions:capacity:", 256, objc_msgSend(v4, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            [v8 addObject:*(void *)(*((void *)&v23 + 1) + 8 * v13++)];
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v11);
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v14 = v2;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v20;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v14);
            }
            if (!objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v19 + 1) + 8 * v18), (void)v19))
            {

              goto LABEL_26;
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_26:
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"itemsModifiedByTextDelegate"];
    }
  }
}

@end