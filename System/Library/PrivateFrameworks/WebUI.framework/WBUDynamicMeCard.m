@interface WBUDynamicMeCard
@end

@implementation WBUDynamicMeCard

void __38___WBUDynamicMeCard_performWhenReady___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38___WBUDynamicMeCard_performWhenReady___block_invoke_2;
  v5[3] = &unk_2643F0108;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __38___WBUDynamicMeCard_performWhenReady___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = 0;
}

uint64_t __38___WBUDynamicMeCard_performWhenReady___block_invoke_3(uint64_t a1, char a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _fetchContactKeysWithHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __50___WBUDynamicMeCard__fetchContactKeysWithHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ios_meContactWithKeysToFetch:error:", *(void *)(a1 + 40), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end