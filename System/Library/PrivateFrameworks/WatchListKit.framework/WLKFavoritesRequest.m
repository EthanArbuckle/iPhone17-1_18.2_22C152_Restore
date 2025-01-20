@interface WLKFavoritesRequest
- (id)convertToWLKFavorite:(id)a3;
- (void)makeRequestWithCompletion:(id)a3;
@end

@implementation WLKFavoritesRequest

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [[WLKSportsFavoriteRequestOperation alloc] initWithAction:0 ids:0];
    objc_initWeak(&location, v5);
    objc_initWeak(&from, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__WLKFavoritesRequest_makeRequestWithCompletion___block_invoke;
    v7[3] = &unk_1E620A2E8;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    id v8 = v4;
    [(WLKSportsFavoriteRequestOperation *)v5 setCompletionBlock:v7];
    v6 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
    [v6 addOperation:v5];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __49__WLKFavoritesRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained response];
  id v4 = [v3 favorites];

  v5 = [v2 convertToWLKFavorite:v4];
  if (WLKIsTVApp())
  {
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    id v8 = WLKTVAppBundleID();
    v6 = (void *)[v7 initWithSuiteName:v8];
  }
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  [v6 setObject:v9 forKey:@"WLKSettingsLastSyncDate"];

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = [WeakRetained error];
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v5, v11);
}

- (id)convertToWLKFavorite:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [WLKFavorite alloc];
        v12 = objc_msgSend(v10, "ID", (void)v18);
        v13 = [v10 name];
        v14 = [v10 leagueId];
        v15 = [(WLKFavorite *)v11 initWithID:v12 name:v13 leagueID:v14];
        [v4 addObject:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v16 = (void *)[v4 copy];

  return v16;
}

@end