@interface FCPeopleAlsoReadInventoryManager
- (FCFeedItemInventoryType)inventory;
- (FCOperationThrottler)refreshThrottler;
- (FCPeopleAlsoReadInventoryManager)init;
- (FCPeopleAlsoReadInventoryManager)initWithInventory:(id)a3 readingHistory:(id)a4;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4;
- (void)readingHistoryDidClear:(id)a3;
- (void)readingHistoryLikelyClearedRemotely:(id)a3;
@end

@implementation FCPeopleAlsoReadInventoryManager

- (FCPeopleAlsoReadInventoryManager)initWithInventory:(id)a3 readingHistory:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "inventory");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPeopleAlsoReadInventoryManager initWithInventory:readingHistory:]";
    __int16 v19 = 2080;
    v20 = "FCPeopleAlsoReadInventoryManager.m";
    __int16 v21 = 1024;
    int v22 = 32;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "readingHistory");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPeopleAlsoReadInventoryManager initWithInventory:readingHistory:]";
    __int16 v19 = 2080;
    v20 = "FCPeopleAlsoReadInventoryManager.m";
    __int16 v21 = 1024;
    int v22 = 33;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCPeopleAlsoReadInventoryManager;
  v9 = [(FCPeopleAlsoReadInventoryManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inventory, a3);
    [v8 addObserver:v10];
    v11 = [[FCOperationThrottler alloc] initWithDelegate:v10];
    refreshThrottler = v10->_refreshThrottler;
    v10->_refreshThrottler = v11;
  }
  return v10;
}

- (FCPeopleAlsoReadInventoryManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPeopleAlsoReadInventoryManager init]";
    __int16 v9 = 2080;
    v10 = "FCPeopleAlsoReadInventoryManager.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPeopleAlsoReadInventoryManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(FCPeopleAlsoReadInventoryManager *)self inventory];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__FCPeopleAlsoReadInventoryManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v8[3] = &unk_1E5B556D8;
  id v9 = v5;
  id v7 = v5;
  [v6 refreshIfNeededWithCompletion:v8];
}

uint64_t __91__FCPeopleAlsoReadInventoryManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readingHistoryDidClear:(id)a3
{
  id v3 = [(FCPeopleAlsoReadInventoryManager *)self refreshThrottler];
  [v3 tickle];
}

- (void)readingHistoryLikelyClearedRemotely:(id)a3
{
  id v3 = [(FCPeopleAlsoReadInventoryManager *)self refreshThrottler];
  [v3 tickle];
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  id v4 = [(FCPeopleAlsoReadInventoryManager *)self refreshThrottler];
  [v4 tickle];
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  id v4 = [(FCPeopleAlsoReadInventoryManager *)self refreshThrottler];
  [v4 tickle];
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(a4, "allValues", a3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntegerValue] == 1)
        {
          v10 = [(FCPeopleAlsoReadInventoryManager *)self refreshThrottler];
          [v10 tickle];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (FCFeedItemInventoryType)inventory
{
  return self->_inventory;
}

- (FCOperationThrottler)refreshThrottler
{
  return self->_refreshThrottler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshThrottler, 0);
  objc_storeStrong((id *)&self->_inventory, 0);
}

@end