@interface PSSuggesterCache
@end

@implementation PSSuggesterCache

void __48___PSSuggesterCache_initWithMaxSuggestionCount___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    uint64_t v3 = v2[8];
    v2[8] = v3 + 1;
    v4 = +[_PSLogging generalChannel];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = v2[9];
        int v8 = 134218240;
        uint64_t v9 = v3;
        __int16 v10 = 2048;
        uint64_t v11 = v6;
        _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Timer tick: Refreshing cache (ticks=%tu, fetches=%tu)", (uint8_t *)&v8, 0x16u);
      }

      [v2 refetch];
    }
    else
    {
      if (v5)
      {
        uint64_t v7 = v2[9];
        int v8 = 134218240;
        uint64_t v9 = 0;
        __int16 v10 = 2048;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Timer tick: Initial fetch (ticks=%tu, fetches=%tu)", (uint8_t *)&v8, 0x16u);
      }

      [v2 performInitialFetchIfNeeded];
    }
  }
}

void __58___PSSuggesterCache_defaultServiceWithMaxSuggestionCount___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6243860]();
  uint64_t v3 = [[_PSSuggesterCache alloc] initWithMaxSuggestionCount:*(void *)(a1 + 32)];
  v4 = (void *)defaultServiceWithMaxSuggestionCount___pasExprOnceResult;
  defaultServiceWithMaxSuggestionCount___pasExprOnceResult = (uint64_t)v3;
}

uint64_t __38___PSSuggesterCache_backgroundRefetch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refetch];
}

id __29___PSSuggesterCache__refetch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NSString alloc];
  v4 = [v2 reason];
  BOOL v5 = (void *)[v3 initWithFormat:@"%@\n%@", v4, @"Cached Suggestion"];
  [v2 setReason:v5];

  return v2;
}

@end