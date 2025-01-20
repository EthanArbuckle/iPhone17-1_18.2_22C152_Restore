@interface WBSUserDefinedContentBlockerManager
@end

@implementation WBSUserDefinedContentBlockerManager

uint64_t __104__WBSUserDefinedContentBlockerManager_ScribbleUtilities__deleteAllContentBlockersWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5E43AA8;
  id v5 = v4;
  id v16 = v5;
  v6 = (void (**)(void, void))MEMORY[0x1AD115160](v15);
  v7 = [v3 actions];

  ((void (**)(void, void *))v6)[2](v6, v7);
  int v8 = [*(id *)(a1 + 32) didLoadGlobalContentBlockerActions];
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10 = [*(id *)(a1 + 32) cachedGlobalContentBlockerActions];
    ((void (**)(void, void *))v6)[2](v6, v10);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3;
    v11[3] = &unk_1E5E43AD0;
    v13 = v6;
    id v14 = *(id *)(a1 + 40);
    id v12 = v5;
    [v9 getGlobalContentBlockerWithCompletionHandler:v11];
  }
}

void __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        int v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) allSelectorsIncludingShadowHosts];
        if ([v8 count]) {
          [*(id *)(a1 + 32) addObjectsFromArray:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [a2 actions];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

@end