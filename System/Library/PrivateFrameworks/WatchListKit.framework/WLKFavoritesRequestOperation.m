@interface WLKFavoritesRequestOperation
- (NSArray)favorites;
- (WLKFavoritesRequestOperation)initWithCaller:(id)a3;
- (void)prepareURLRequest:(id)a3;
- (void)processResponse;
@end

@implementation WLKFavoritesRequestOperation

- (WLKFavoritesRequestOperation)initWithCaller:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11 = @"type";
  v12[0] = @"Team";
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v7 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"favorites" queryParameters:v6 httpMethod:0 headers:0 caller:v5 timeout:0 options:0];

  v10.receiver = self;
  v10.super_class = (Class)WLKFavoritesRequestOperation;
  v8 = [(WLKUTSNetworkRequestOperation *)&v10 initWithRequestProperties:v7];

  return v8;
}

- (void)prepareURLRequest:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke;
  v7[3] = &unk_1E620A148;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WLKFavoritesRequestOperation;
  id v5 = v4;
  [(WLKUTSNetworkRequestOperation *)&v6 prepareURLRequest:v7];
}

void __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[WLKSettingsStore sharedSettings];
  int v5 = [v4 optedIn];

  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke_2;
    v12[3] = &unk_1E620A120;
    id v15 = *(id *)(a1 + 40);
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    id v13 = v6;
    uint64_t v14 = v7;
    WLKFetchIsSportsEnabled(v12);

    id v8 = v15;
  }
  else
  {
    v9 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2112;
      v19 = @"User is not opted into TV.app";
      id v10 = v17;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", buf, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v8 = WLKError(300, 0, @"User is not opted into TV.app");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v8);
  }
}

void __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void (**)(uint64_t, uint64_t, id))(v4 + 16);
    id v7 = a3;
    v6(v4, v5, v7);
  }
  else
  {
    id v8 = a3;
    v9 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2112;
      id v15 = @"Sports is not enabled";
      id v10 = v13;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    WLKError(400, v8, @"Sports is not enabled");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v7);
  }
}

- (void)processResponse
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"data"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [[WLKFavorite alloc] initWithDictionary:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  uint64_t v11 = (NSArray *)[v4 copy];
  favorites = self->_favorites;
  self->_favorites = v11;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
}

@end