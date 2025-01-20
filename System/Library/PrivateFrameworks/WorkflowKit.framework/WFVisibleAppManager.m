@interface WFVisibleAppManager
- (NSMutableArray)monitorPool;
- (WFVisibleAppManager)init;
- (void)_getLayoutsWithCompletionHandler:(id)a3;
- (void)getCurrentAppWithCompletionHandler:(id)a3;
- (void)getVisibleAppsWithCompletionHandler:(id)a3;
- (void)setMonitorPool:(id)a3;
@end

@implementation WFVisibleAppManager

- (void).cxx_destruct
{
}

- (void)setMonitorPool:(id)a3
{
}

- (NSMutableArray)monitorPool
{
  return self->_monitorPool;
}

- (void)_getLayoutsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F70BF0]);
  [v5 resume];
  v6 = [(WFVisibleAppManager *)self monitorPool];
  [v6 addObject:v5];

  dispatch_time_t v7 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WFVisibleAppManager__getLayoutsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6557D28;
  id v11 = v5;
  v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

void __56__WFVisibleAppManager__getLayoutsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) currentDisplayLayouts];
  v3 = getWFActionsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 allValues];
    int v6 = 136315394;
    dispatch_time_t v7 = "-[WFVisibleAppManager _getLayoutsWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s WFVisibleAppManager saw layout: %@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) invalidate];
  id v5 = [*(id *)(a1 + 40) monitorPool];
  [v5 removeObject:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getVisibleAppsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__WFVisibleAppManager_getVisibleAppsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6551E68;
  id v7 = v4;
  id v5 = v4;
  [(WFVisibleAppManager *)self _getLayoutsWithCompletionHandler:v6];
}

void __59__WFVisibleAppManager_getVisibleAppsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v3, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) elements];
        id v11 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_162);
        [v4 addObjectsFromArray:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = (void *)[v4 mutableCopy];
  (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
}

id __59__WFVisibleAppManager_getVisibleAppsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A778];
  id v3 = [a2 bundleIdentifier];
  id v4 = [v2 findAppWithBundleIdentifier:v3 name:0];

  return v4;
}

- (void)getCurrentAppWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__WFVisibleAppManager_getCurrentAppWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6551E68;
  id v7 = v4;
  id v5 = v4;
  [(WFVisibleAppManager *)self _getLayoutsWithCompletionHandler:v6];
}

void __58__WFVisibleAppManager_getCurrentAppWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v15 = v2;
  id v4 = [v2 allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "elements", v14);
        uint64_t v10 = objc_msgSend(v9, "if_firstObjectPassingTest:", &__block_literal_global_34921);

        id v11 = (void *)MEMORY[0x1E4F5A778];
        uint64_t v12 = [v10 bundleIdentifier];
        id v13 = [v11 findAppWithBundleIdentifier:v12 name:0];
        [v3 addObject:v13];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(v14 + 32) + 16))();
}

BOOL __58__WFVisibleAppManager_getCurrentAppWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 layoutRole] == 1;
}

- (WFVisibleAppManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFVisibleAppManager;
  id v2 = [(WFVisibleAppManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    monitorPool = v2->_monitorPool;
    v2->_monitorPool = (NSMutableArray *)v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end