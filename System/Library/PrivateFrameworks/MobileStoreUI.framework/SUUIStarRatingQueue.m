@interface SUUIStarRatingQueue
- (SUUIStarRatingQueue)init;
- (SUUIStarRatingQueue)initWithClientContext:(id)a3 reviewConfiguration:(id)a4;
- (UIWindow)window;
- (void)_setRating:(int64_t)a3 forItemID:(id)a4 account:(id)a5 completionBlock:(id)a6;
- (void)setRating:(int64_t)a3 forItemID:(id)a4 completionBlock:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SUUIStarRatingQueue

- (SUUIStarRatingQueue)init
{
  return [(SUUIStarRatingQueue *)self initWithClientContext:0 reviewConfiguration:0];
}

- (SUUIStarRatingQueue)initWithClientContext:(id)a3 reviewConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIStarRatingQueue;
  v9 = [(SUUIStarRatingQueue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a3);
    objc_storeStrong((id *)&v10->_reviewConfiguration, a4);
  }

  return v10;
}

- (void)setRating:(int64_t)a3 forItemID:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F7B0E8] defaultStore];
  v11 = [v10 activeAccount];

  if (v11)
  {
    [(SUUIStarRatingQueue *)self _setRating:a3 forItemID:v8 account:v11 completionBlock:v9];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F7B118]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__SUUIStarRatingQueue_setRating_forItemID_completionBlock___block_invoke;
    v13[3] = &unk_265407B60;
    v13[4] = self;
    int64_t v16 = a3;
    id v14 = v8;
    id v15 = v9;
    [v12 startWithAuthenticateResponseBlock:v13];
  }
}

void __59__SUUIStarRatingQueue_setRating_forItemID_completionBlock___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  if ([v8 authenticateResponseType] == 4)
  {
    uint64_t v3 = a1[7];
    v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    v6 = [v8 authenticatedAccount];
    [v4 _setRating:v3 forItemID:v5 account:v6 completionBlock:a1[6]];
  }
  else
  {
    uint64_t v7 = a1[6];
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
    }
  }
}

- (void)_setRating:(int64_t)a3 forItemID:(id)a4 account:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x263F833E0];
  id v14 = [MEMORY[0x263F82438] sharedApplication];
  id v15 = (objc_class *)objc_opt_class();
  int64_t v16 = NSStringFromClass(v15);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __68__SUUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke;
  v25[3] = &__block_descriptor_40_e5_v8__0l;
  v25[4] = v13;
  v17 = (void *)[v14 beginBackgroundTaskWithName:v16 expirationHandler:v25];

  v18 = [[SUUIPostRatingOperation alloc] initWithRating:a3 forItemID:v10 reviewConfiguration:self->_reviewConfiguration];
  objc_initWeak(&location, v18);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__SUUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_2;
  v21[3] = &unk_265407B88;
  objc_copyWeak(v23, &location);
  id v19 = v12;
  id v22 = v19;
  v23[1] = v17;
  [(SUUIPostRatingOperation *)v18 setCompletionBlock:v21];
  v20 = [MEMORY[0x263F894E0] mainQueue];
  [v20 addOperation:v18];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __68__SUUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

void __68__SUUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SUUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_3;
  block[3] = &unk_265406EC8;
  id v7 = WeakRetained;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__SUUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) responseDictionary];
  int v3 = 0;
  if (([*(id *)(a1 + 32) success] & 1) == 0 && v2)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F7B150]) initWithResponseDictionary:v2];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = objc_msgSend(v4, "actions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      uint64_t v9 = *MEMORY[0x263F7BC48];
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) actionType];
          char v12 = [v11 isEqualToString:v9];

          if (v12)
          {
            int v3 = 1;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int v3 = 0;
LABEL_13:
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    uint64_t v14 = v3 ^ 1u;
    id v15 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v14, v15);
  }
  if (*(void *)(a1 + 48) != *MEMORY[0x263F833E0])
  {
    int64_t v16 = [MEMORY[0x263F82438] sharedApplication];
    [v16 endBackgroundTask:*(void *)(a1 + 48)];
  }
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end