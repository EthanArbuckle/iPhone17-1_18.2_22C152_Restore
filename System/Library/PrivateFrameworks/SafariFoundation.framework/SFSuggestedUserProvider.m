@interface SFSuggestedUserProvider
+ (id)sharedProvider;
- (SFSuggestedUserProvider)init;
- (id)_allCachedSuggestedUsersWithType:(int64_t)a3;
- (id)_cachedSuggestedUsersWithType:(int64_t)a3 matchingText:(id)a4 limit:(unint64_t)a5;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_getSuggestedUsersFromSavedAccounts:(id)a3 suggestedEmails:(id *)a4 suggestedNonEmails:(id *)a5;
- (void)suggestedUsersOfType:(int64_t)a3 completionHandler:(id)a4;
- (void)suggestedUsersOfType:(int64_t)a3 matchingText:(id)a4 completionHandler:(id)a5;
- (void)suggestedUsersOfType:(int64_t)a3 matchingText:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation SFSuggestedUserProvider

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedProvider_provider;
  return v2;
}

uint64_t __41__SFSuggestedUserProvider_sharedProvider__block_invoke()
{
  sharedProvider_provider = objc_alloc_init(SFSuggestedUserProvider);
  return MEMORY[0x270F9A758]();
}

- (SFSuggestedUserProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)SFSuggestedUserProvider;
  v2 = [(SFSuggestedUserProvider *)&v12 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.SafariFoundation.%@.%p", v5, v2];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__accountStoreChangedNotification_ name:*MEMORY[0x263F66538] object:0];

    v10 = v2;
  }

  return v2;
}

- (void)_accountStoreChangedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SFSuggestedUserProvider__accountStoreChangedNotification___block_invoke;
  block[3] = &unk_264390880;
  block[4] = self;
  dispatch_async(queue, block);
}

void __60__SFSuggestedUserProvider__accountStoreChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

- (id)_allCachedSuggestedUsersWithType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      suggestedNonEmails = self->_suggestedNonEmails;
      goto LABEL_13;
    }
    if (a3 == 1)
    {
      suggestedNonEmails = self->_suggestedEmails;
LABEL_13:
      id v6 = suggestedNonEmails;
      goto LABEL_15;
    }
  }
  else if (!self->_suggestedEmails || !self->_suggestedNonEmails)
  {
    id v6 = 0;
    goto LABEL_15;
  }
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = v5;
  if (self->_suggestedEmails) {
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:");
  }
  if (self->_suggestedNonEmails) {
    -[NSArray addObjectsFromArray:](v6, "addObjectsFromArray:");
  }
  [(NSArray *)v6 sortUsingSelector:sel_compare_];
LABEL_15:
  return v6;
}

- (id)_cachedSuggestedUsersWithType:(int64_t)a3 matchingText:(id)a4 limit:(unint64_t)a5
{
  id v8 = a4;
  v9 = [(SFSuggestedUserProvider *)self _allCachedSuggestedUsersWithType:a3];
  if ([v8 length])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__SFSuggestedUserProvider__cachedSuggestedUsersWithType_matchingText_limit___block_invoke;
    v13[3] = &unk_264391538;
    id v14 = v8;
    uint64_t v10 = objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v13);

    v9 = (void *)v10;
  }
  if ([v9 count] < a5) {
    a5 = [v9 count];
  }
  v11 = objc_msgSend(v9, "subarrayWithRange:", 0, a5);

  return v11;
}

uint64_t __76__SFSuggestedUserProvider__cachedSuggestedUsersWithType_matchingText_limit___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  if (objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", *(void *)(a1 + 32))) {
    uint64_t v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", *(void *)(a1 + 32)) ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)suggestedUsersOfType:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)suggestedUsersOfType:(int64_t)a3 matchingText:(id)a4 completionHandler:(id)a5
{
}

- (void)suggestedUsersOfType:(int64_t)a3 matchingText:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__SFSuggestedUserProvider_suggestedUsersOfType_matchingText_limit_completionHandler___block_invoke;
    block[3] = &unk_264391560;
    block[4] = self;
    int64_t v16 = a3;
    id v14 = v10;
    unint64_t v17 = a5;
    id v15 = v11;
    dispatch_async(queue, block);
  }
}

void __85__SFSuggestedUserProvider_suggestedUsersOfType_matchingText_limit_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedSuggestedUsersWithType:*(void *)(a1 + 56) matchingText:*(void *)(a1 + 40) limit:*(void *)(a1 + 64)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [MEMORY[0x263F663B0] sharedStore];
    v5 = [v4 savedAccountsWithPasswords];
    id v16 = 0;
    id v17 = 0;
    [v3 _getSuggestedUsersFromSavedAccounts:v5 suggestedEmails:&v17 suggestedNonEmails:&v16];
    id v6 = v17;
    id v7 = v16;

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v6;
    id v10 = v6;

    uint64_t v11 = *(void *)(a1 + 32);
    objc_super v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v7;
    id v13 = v7;

    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [*(id *)(a1 + 32) _cachedSuggestedUsersWithType:*(void *)(a1 + 56) matchingText:*(void *)(a1 + 40) limit:*(void *)(a1 + 64)];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

- (void)_getSuggestedUsersFromSavedAccounts:(id)a3 suggestedEmails:(id *)a4 suggestedNonEmails:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF9C0] set];
  id v7 = [MEMORY[0x263EFF9C0] set];
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  v9 = [MEMORY[0x263EFF9A0] dictionary];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __98__SFSuggestedUserProvider__getSuggestedUsersFromSavedAccounts_suggestedEmails_suggestedNonEmails___block_invoke;
  v30[3] = &unk_264391588;
  id v23 = v8;
  id v31 = v23;
  id v22 = v9;
  id v32 = v22;
  id v10 = (void (**)(void, void, void))MEMORY[0x21D47DB00](v30);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v17 = [v16 user];
        if ([v17 length] && (objc_msgSend(v16, "userIsNeverSaveMarker") & 1) == 0)
        {
          if (([v6 containsObject:v17] & 1) != 0
            || ([v7 containsObject:v17] & 1) == 0
            && (objc_msgSend(v17, "safari_looksLikeEmailAddress") & 1) != 0)
          {
            v18 = v6;
            uint64_t v19 = 1;
          }
          else
          {
            v18 = v7;
            uint64_t v19 = 2;
          }
          [v18 addObject:v17];
          ((void (**)(void, uint64_t, void *))v10)[2](v10, v19, v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v13);
  }

  v20 = [v23 allValues];
  *a4 = [v20 sortedArrayUsingSelector:sel_compare_];

  v21 = [v22 allValues];
  *a5 = [v21 sortedArrayUsingSelector:sel_compare_];
}

void __98__SFSuggestedUserProvider__getSuggestedUsersFromSavedAccounts_suggestedEmails_suggestedNonEmails___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = 40;
  if (a2 == 1) {
    uint64_t v5 = 32;
  }
  id v6 = *(id *)(a1 + v5);
  id v7 = [v6 objectForKeyedSubscript:v9];
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(v7, "setUsageFrequency:", objc_msgSend(v7, "usageFrequency") + 1);
  }
  else
  {
    uint64_t v8 = +[SFSuggestedUser suggestedUserWithValue:v9 type:a2];
    [v8 setUsageFrequency:1];
    [v6 setObject:v8 forKeyedSubscript:v9];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedNonEmails, 0);
  objc_storeStrong((id *)&self->_suggestedEmails, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end