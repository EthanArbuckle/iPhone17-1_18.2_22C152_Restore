@interface UIArrayController
@end

@implementation UIArrayController

void __41___UIArrayController_setSortDescriptors___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 16) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    if ([*(id *)(*(void *)(a1 + 32) + 48) count])
    {
      v7 = *(id **)(a1 + 32);
      id v8 = [v7[6] array];
      [v7 processUpdate:v8 changedObjects:0];
    }
  }
}

void __37___UIArrayController_sortDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __35___UIArrayController_setPredicate___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
}

void __31___UIArrayController_predicate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __32___UIArrayController_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setDelegate:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  return result;
}

void __51___UIArrayController_processUpdate_changedObjects___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    id v3 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v4 = v3;
    if (*(void *)(a1 + 40))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithArray:");
      uint64_t v6 = *(void *)(a1 + 32);
      id v11 = v5;
      if (*(void *)(v6 + 24))
      {
        objc_msgSend(v5, "filterUsingPredicate:");
        uint64_t v6 = *(void *)(a1 + 32);
      }
      if (*(void *)(v6 + 16)) {
        objc_msgSend(v11, "sortUsingDescriptors:");
      }

      id v7 = v11;
    }
    else
    {
      id v7 = v3;
    }
    id v12 = v7;
    uint64_t v8 = [*(id *)(a1 + 32) _computeUpdatesFromOld:*(void *)(*(void *)(a1 + 32) + 48) toNew:v7 changedItems:*(void *)(a1 + 48)];
    v9 = (void *)v8;
    if (*(unsigned char *)(a1 + 56) || v8)
    {
      v10 = (void *)[v12 copy];
      [*(id *)(a1 + 32) callUpdateHandler:v10 changeDictionary:v9];
    }
  }
}

@end