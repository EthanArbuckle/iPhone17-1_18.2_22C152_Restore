@interface PSContactCache
@end

@implementation PSContactCache

void __23___PSContactCache_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Received ContactStore change notification. Processing...", buf, 2u);
    }

    v3 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23___PSContactCache_init__block_invoke_39;
    block[3] = &unk_1E5ADE940;
    v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __23___PSContactCache_init__block_invoke_39(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncChangeHistory];
}

uint64_t __23___PSContactCache_init__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __33___PSContactCache_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

void __41___PSContactCache__setContact_forHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v6 = [v3 distantFuture];
  v5 = [[_PSCachedContact alloc] initWithExpirationDate:v6 contact:*(void *)(a1 + 32)];
  [v4 setObject:v5 forKey:*(void *)(a1 + 40)];
}

void __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke_2;
  v15[3] = &unk_1E5AE0F78;
  id v16 = *(id *)(a1 + 32);
  id v5 = v4;
  id v17 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v15];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v3, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v8);
  }
}

void __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = [a3 contact];
  id v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

uint64_t __25___PSContactCache__purge__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

uint64_t __25___PSContactCache__purge__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

void __46___PSContactCache__getCachedContactForHandle___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    int v7 = [v6 expirationDate];
    [v7 timeIntervalSinceNow];
    double v9 = v8;

    if (v9 <= 0.0)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;

      [v12 removeObjectForKey:*(void *)(a1 + 32)];
    }
  }
}

void __65___PSContactCache__setLikelyFaceTimeHandle_forContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v6 = [v3 distantFuture];
  id v5 = [[_PSCachedFaceTimeableHandle alloc] initWithExpirationDate:v6 handle:*(void *)(a1 + 32)];
  [v4 setObject:v5 forKey:*(void *)(a1 + 40)];
}

void __68___PSContactCache__getCachedFaceTimeableHandleForContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    int v7 = [v6 expirationDate];
    [v7 timeIntervalSinceNow];
    double v9 = v8;

    if (v9 <= 0.0)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;

      [v12 removeObjectForKey:*(void *)(a1 + 32)];
    }
  }
}

id __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  uint64_t v3 = [v2 formattedInternationalStringValue];

  return v3;
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personId];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personId];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personId];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

@end