@interface PPSocialHighlightStore
+ (double)decayInterval;
- (BOOL)iterRankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7;
- (BOOL)iterRankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7;
- (BOOL)iterRankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7;
- (BOOL)iterRankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6 error:(id *)a7 block:(id)a8;
- (PPSocialHighlightStore)init;
- (id)attributionForIdentifier:(id)a3 error:(id *)a4;
- (void)feedbackForAttributionIdentifier:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7;
- (void)feedbackForHighlightIdentifier:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7;
- (void)feedbackForHighlightResourceURL:(id)a3 resolvedURL:(id)a4 type:(unint64_t)a5 client:(id)a6 variant:(id)a7 completion:(id)a8;
@end

@implementation PPSocialHighlightStore

- (BOOL)iterRankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6 error:(id *)a7 block:(id)a8
{
  id v15 = a8;
  v16 = +[PPSocialHighlightStoreRequestKey socialHighlightStoreRequestKeyWithLimit:a3 client:a4 variant:a5 reason:a6];
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = MEMORY[0x192F975A0](v15);

  v19 = *(void **)(v17 + 24);
  *(void *)(v17 + 24) = v18;

  *(unsigned char *)(v17 + 8) = 0;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v21 = *(void **)(v17 + 32);
  *(void *)(v17 + 32) = v20;

  self;
  if (_sharedAdaptiveCoalescer__pasOnceToken2 != -1) {
    dispatch_once(&_sharedAdaptiveCoalescer__pasOnceToken2, &__block_literal_global_5679);
  }
  id v22 = (id)_sharedAdaptiveCoalescer__pasExprOnceResult;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke;
  v26[3] = &unk_1E550EC70;
  v26[4] = self;
  v26[5] = a2;
  v23 = (void *)MEMORY[0x192F975A0](v26);
  [v22 coalesceRequestKey:v16 handler:v17 executeRequestAndInvokeHandlersBlock:v23];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v17 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (a7) {
    *a7 = *(id *)(v17 + 16);
  }
  char v24 = *(unsigned char *)(v17 + 8);

  return v24;
}

void __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) count];
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      --v5;
      v6 = (void *)MEMORY[0x192F97350]();
      char v21 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v16;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = (void *)MEMORY[0x192F97350]();
            uint64_t v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
            if (*(unsigned char *)(v13 + 8))
            {
              v14 = [MEMORY[0x1E4F28B00] currentHandler];
              [v14 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PPSocialHighlightStore.m", 246, @"Invalid parameter not satisfying: %@", @"remainingHandler->_successful == NO" object file lineNumber description];
            }
            (*(void (**)(void))(*(void *)(v13 + 24) + 16))();
            if (v21)
            {
              *(unsigned char *)(v13 + 8) = 1;
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v13 + 32));
              [*(id *)(a1 + 32) removeObjectAtIndex:v5];

              goto LABEL_15;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    while (v5);
  }
  if (![*(id *)(a1 + 32) count]) {
    *a3 = 1;
  }
}

void __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = (void *)[a3 mutableCopy];
  id v7 = +[PPSocialHighlightClient sharedInstance];
  uint64_t v8 = [v5 limit];
  uint64_t v9 = [v5 client];
  uint64_t v10 = [v5 variant];
  id v28 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__PPSocialHighlightStore_iterRankedHighlightsWithLimit_client_variant_reason_error_block___block_invoke_2;
  v25[3] = &unk_1E550EC48;
  id v11 = v6;
  id v26 = v11;
  long long v27 = *(_OWORD *)(a1 + 32);
  char v12 = [v7 rankedHighlightsWithLimit:v8 client:v9 variant:v10 error:&v28 handleBatch:v25];
  id v13 = v28;
  id v14 = v28;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * v19);
        *(unsigned char *)(v20 + 8) = v12;
        objc_storeStrong((id *)(v20 + 16), v13);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v20 + 32));
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }
}

- (PPSocialHighlightStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPSocialHighlightStore;
  return [(PPSocialHighlightStore *)&v3 init];
}

void __50__PPSocialHighlightStore__sharedAdaptiveCoalescer__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)_sharedAdaptiveCoalescer__pasExprOnceResult;
  _sharedAdaptiveCoalescer__pasExprOnceResult = v1;
}

- (void)feedbackForAttributionIdentifier:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = +[PPSocialHighlightClient sharedInstance];
  [v15 feedbackForAttribution:v14 type:a4 client:v13 variant:v12 completion:v11];
}

- (void)feedbackForHighlightResourceURL:(id)a3 resolvedURL:(id)a4 type:(unint64_t)a5 client:(id)a6 variant:(id)a7 completion:(id)a8
{
}

- (void)feedbackForHighlightIdentifier:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = +[PPSocialHighlightClient sharedInstance];
  [v15 feedbackForHighlight:v14 type:a4 client:v13 variant:v12 completion:v11];
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[PPSocialHighlightClient sharedInstance];
  id v7 = [v6 attributionForIdentifier:v5 error:a4];

  return v7;
}

- (BOOL)iterRankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[PPSocialHighlightClient sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PPSocialHighlightStore_iterRankedHighlightsForSyncedItems_client_variant_error_block___block_invoke;
  v18[3] = &unk_1E550F880;
  id v19 = v11;
  id v16 = v11;
  LOBYTE(a6) = [v15 rankedHighlightsForSyncedItems:v14 client:v13 variant:v12 error:a6 handleBatch:v18];

  return (char)a6;
}

void __88__PPSocialHighlightStore_iterRankedHighlightsForSyncedItems_client_variant_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)iterRankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  long long v14 = +[PPSocialHighlightClient sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PPSocialHighlightStore_iterRankedCollaborationsWithLimit_client_variant_error_block___block_invoke;
  v17[3] = &unk_1E550F880;
  id v18 = v11;
  id v15 = v11;
  LOBYTE(a6) = [v14 rankedCollaborationsWithLimit:a3 client:v13 variant:v12 error:a6 handleBatch:v17];

  return (char)a6;
}

void __87__PPSocialHighlightStore_iterRankedCollaborationsWithLimit_client_variant_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)iterRankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 block:(id)a7
{
  return [(PPSocialHighlightStore *)self iterRankedHighlightsWithLimit:a3 client:a4 variant:a5 reason:0 error:a6 block:a7];
}

+ (double)decayInterval
{
  v2 = +[PPSocialHighlightClient sharedInstance];
  [v2 decayInterval];
  double v4 = v3;

  return v4;
}

@end