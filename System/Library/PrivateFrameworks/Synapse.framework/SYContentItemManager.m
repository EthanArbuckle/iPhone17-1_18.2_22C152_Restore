@interface SYContentItemManager
+ (id)sharedManager;
- (void)_navigateToURL:(id)a3 completion:(id)a4;
- (void)_navigateToUserActivity:(id)a3 completion:(id)a4;
- (void)fetchLinkableContentItemsWithCompletion:(id)a3;
- (void)navigateToContentItem:(id)a3 completion:(id)a4;
@end

@implementation SYContentItemManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __37__SYContentItemManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(SYContentItemManager);
  return MEMORY[0x1F41817F8]();
}

- (void)navigateToContentItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SYContentItemManager_navigateToContentItem_completion___block_invoke;
  v14[3] = &unk_1E6463968;
  id v15 = v7;
  id v8 = v7;
  v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v14);
  v10 = [v6 userActivity];

  if (v10)
  {
    v11 = [v6 userActivity];
    [(SYContentItemManager *)self _navigateToUserActivity:v11 completion:v9];
LABEL_5:

    goto LABEL_6;
  }
  v12 = [v6 itemURL];

  if (v12)
  {
    v11 = [v6 itemURL];
    [(SYContentItemManager *)self _navigateToURL:v11 completion:v9];
    goto LABEL_5;
  }
  v13 = os_log_create("com.apple.synapse", "ContentItemManager");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[SYContentItemManager navigateToContentItem:completion:](v13);
  }

  v9[2](v9, 0, 0);
LABEL_6:
}

void __57__SYContentItemManager_navigateToContentItem_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SYContentItemManager_navigateToContentItem_completion___block_invoke_2;
    block[3] = &unk_1E64648C8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __57__SYContentItemManager_navigateToContentItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_navigateToUserActivity:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SYContentItemManager.m", 62, @"Invalid parameter not satisfying: %@", @"userActivity" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SYContentItemManager__navigateToUserActivity_completion___block_invoke;
  v12[3] = &unk_1E6463968;
  id v13 = v8;
  id v10 = v8;
  [v9 openUserActivity:v7 usingApplicationRecord:0 configuration:0 completionHandler:v12];
}

uint64_t __59__SYContentItemManager__navigateToUserActivity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_navigateToURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SYContentItemManager.m", 72, @"Invalid parameter not satisfying: %@", @"targetURL" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__SYContentItemManager__navigateToURL_completion___block_invoke;
  v12[3] = &unk_1E64643D0;
  id v13 = v8;
  id v10 = v8;
  [v9 openURL:v7 configuration:0 completionHandler:v12];
}

uint64_t __50__SYContentItemManager__navigateToURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLinkableContentItemsWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SYLinkableContentItemFinder);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SYContentItemManager_fetchLinkableContentItemsWithCompletion___block_invoke;
  v6[3] = &unk_1E6464180;
  id v7 = v3;
  id v5 = v3;
  [(SYLinkableContentItemFinder *)v4 fetchLinkableContentItemsExcludingActivities:0 completion:v6];
}

uint64_t __64__SYContentItemManager_fetchLinkableContentItemsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)navigateToContentItem:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Requested navigation to an item that has no URL or user activity.", v1, 2u);
}

@end