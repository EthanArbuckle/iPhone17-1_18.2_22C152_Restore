@interface RELocalTrainingContext
@end

@implementation RELocalTrainingContext

void __46___RELocalTrainingContext_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

void __46___RELocalTrainingContext__handleInvalidation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = 0;
  }
}

void __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) relevanceEngine];
  v3 = [v2 trainingManager];

  if (!v3) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Training context must be added to a relevance engine before trying to train", v4, v5, v6, v7, v8, v9, v12);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke_2;
  block[3] = &unk_2644BDC18;
  v10 = *(NSObject **)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v17 = v3;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v11 = v3;
  dispatch_async(v10, block);
}

void __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  unint64_t v3 = [*(id *)(a1 + 40) count];
  unint64_t v4 = [*(id *)(a1 + 48) count];
  if (v3 >= v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = v3;
  }
  if (v2 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v2;
  }
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      uint64_t v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      uint64_t v10 = [v9 BOOLValue];

      id v11 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
      [*(id *)(a1 + 56) _performTrainingForPredictionElement:v8 isPositiveEvent:v10 interaction:v11 context:*(void *)(a1 + 64)];
    }
  }
  uint64_t v12 = *(NSObject **)(a1 + 72);
  v13 = *(void **)(a1 + 80);
  dispatch_async(v12, v13);
}

uint64_t __67___RELocalTrainingContext_updateRemoteAttribute_forKey_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAttribute:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

@end