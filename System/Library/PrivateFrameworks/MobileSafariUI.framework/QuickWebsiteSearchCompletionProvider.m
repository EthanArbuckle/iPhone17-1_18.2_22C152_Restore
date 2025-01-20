@interface QuickWebsiteSearchCompletionProvider
- (void)setQueryToComplete:(id)a3;
@end

@implementation QuickWebsiteSearchCompletionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4 = a3;
  v5 = [v4 queryString];
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"DisableWebsiteSpecificSearch"];

  if (v7)
  {
    [(CompletionProvider *)self setCompletions:MEMORY[0x1E4F1CBF0] forString:v5];
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [[QuickWebsiteSearchQuery alloc] initWithUserEnteredQuery:v4];
    v9 = [MEMORY[0x1E4F98D50] sharedController];
    v10 = [(QuickWebsiteSearchQuery *)v8 searchTerms];

    if (v10)
    {
      v11 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke;
      block[3] = &unk_1E6D7BE38;
      id v13 = v9;
      id v14 = v5;
      v15 = self;
      v16 = v8;
      id v17 = v4;
      objc_copyWeak(&v18, &location);
      dispatch_async(v11, block);

      objc_destroyWeak(&v18);
    }
    else
    {
      [(CompletionProvider *)self setCompletions:MEMORY[0x1E4F1CBF0] forString:v5];
    }

    objc_destroyWeak(&location);
  }
}

void __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) delegate];
  v5 = [v4 currentSearchEngineHostSuffixes];
  v6 = [v2 providersMatchingQueryString:v3 excludingSearchEngineHostSuffixes:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_2;
  v13[3] = &unk_1E6D7BE10;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  int v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v13);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_3;
  block[3] = &unk_1E6D7A508;
  objc_copyWeak(&v12, (id *)(a1 + 72));
  id v10 = v7;
  id v11 = *(id *)(a1 + 40);
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

QuickWebsiteSearchCompletionItem *__59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[QuickWebsiteSearchCompletionItem initWithProvider:query:forQueryID:]([QuickWebsiteSearchCompletionItem alloc], "initWithProvider:query:forQueryID:", v3, *(void *)(a1 + 32), [*(id *)(a1 + 40) queryID]);

  return v4;
}

void __59__QuickWebsiteSearchCompletionProvider_setQueryToComplete___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setCompletions:*(void *)(a1 + 32) forString:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

@end