@interface SearchUIToggleWatchListStatusHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (BOOL)shouldDeselectAfterExecution;
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIToggleWatchListStatusHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 hasLoaded]) {
    v5 = objc_opt_new();
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = [v7 watchListDelegate];
  objc_initWeak(&location, v8);

  id v9 = objc_loadWeakRetained(&location);
  v10 = [v9 watchListState];

  if (v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke;
    v19[3] = &unk_1E6E738D0;
    v11 = &v21;
    objc_copyWeak(&v21, &location);
    id v20 = v10;
    [v20 toggleStateWithCompletion:v19];
    v12 = &v20;
  }
  else
  {
    uint64_t v13 = [v6 shouldAddToWatchList];
    v14 = [v6 watchListItem];
    v15 = [v14 watchListIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke_2;
    v16[3] = &unk_1E6E738F8;
    v11 = &v18;
    objc_copyWeak(&v18, &location);
    uint64_t v17 = 0;
    +[SearchUIWatchListUtilities updateStatusIsInWatchList:v13 watchListItemWithIdentifier:v15 completion:v16];
    v12 = (id *)&v17;
  }
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

void __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained watchListStateDidChange:*(void *)(a1 + 32)];
}

void __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained watchListStateDidChange:*(void *)(a1 + 32)];
}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

- (unint64_t)destination
{
  return 3;
}

@end