@interface FCOfflineIssueList
- (BOOL)containsIssueID:(id)a3;
- (BOOL)everContainedIssueID:(id)a3;
- (FCOfflineIssueList)init;
- (FCOfflineIssueList)initWithStoreDirectoryFileURL:(id)a3;
- (FCOfflineIssueList)initWithStoreDirectoryFileURL:(id)a3 appActivityMonitor:(id)a4 backgroundTaskable:(id)a5;
- (NSArray)issueIDs;
- (NSArray)sortedIssueIDs;
- (id)dateAddedForIssueID:(id)a3;
- (id)dateRemovedForIssueID:(id)a3;
- (int64_t)sourceForIssueID:(id)a3;
- (void)addIssueID:(id)a3 source:(int64_t)a4;
- (void)addObserver:(id)a3;
- (void)removeAllIssues;
- (void)removeIssueIDs:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation FCOfflineIssueList

- (FCOfflineIssueList)initWithStoreDirectoryFileURL:(id)a3 appActivityMonitor:(id)a4 backgroundTaskable:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storeDirectoryFileURL != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCOfflineIssueList initWithStoreDirectoryFileURL:appActivityMonitor:backgroundTaskable:]";
    __int16 v24 = 2080;
    v25 = "FCOfflineIssueList.m";
    __int16 v26 = 1024;
    int v27 = 50;
    __int16 v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v21.receiver = self;
  v21.super_class = (Class)FCOfflineIssueList;
  v11 = [(FCOfflineIssueList *)&v21 init];
  if (v11)
  {
    v12 = +[FCKeyValueStoreSavePolicy defaultPolicy];
    if (v9 && v10)
    {
      uint64_t v13 = +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:v9 backgroundTaskable:v10];

      v12 = (void *)v13;
    }
    v14 = [v8 path];
    v15 = [[FCKeyValueStore alloc] initWithName:@"offline-issue-list" directory:v14 version:2 options:8 classRegistry:0 migrator:0 savePolicy:v12];
    localStore = v11->_localStore;
    v11->_localStore = v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v17;
  }
  return v11;
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      observers = self->_observers;
    }
    else {
      observers = 0;
    }
    if ([(NSHashTable *)observers containsObject:v4]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", v4);
      *(_DWORD *)buf = 136315906;
      id v10 = "-[FCOfflineIssueList addObserver:]";
      __int16 v11 = 2080;
      v12 = "FCOfflineIssueList.m";
      __int16 v13 = 1024;
      int v14 = 227;
      __int16 v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self) {
        goto LABEL_7;
      }
    }
    else if (self)
    {
LABEL_7:
      v6 = self->_observers;
LABEL_8:
      [(NSHashTable *)v6 addObject:v4];
      goto LABEL_11;
    }
    v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCOfflineIssueList addObserver:]";
    __int16 v11 = 2080;
    v12 = "FCOfflineIssueList.m";
    __int16 v13 = 1024;
    int v14 = 223;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
}

- (FCOfflineIssueList)init
{
  v3 = FCURLForContainerizedUserAccountDocumentDirectory(1);
  id v4 = [(FCOfflineIssueList *)self initWithStoreDirectoryFileURL:v3];

  return v4;
}

- (FCOfflineIssueList)initWithStoreDirectoryFileURL:(id)a3
{
  return [(FCOfflineIssueList *)self initWithStoreDirectoryFileURL:a3 appActivityMonitor:0 backgroundTaskable:0];
}

- (void)addIssueID:(id)a3 source:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if (a4 == 2)
    {
      v7 = @"auto";
    }
    else if (a4)
    {
      v7 = @"manual";
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)[[NSString alloc] initWithFormat:@"issues should always be added from a known source"];
        *(_DWORD *)buf = 136315906;
        v20 = "-[FCOfflineIssueList addIssueID:source:]";
        __int16 v21 = 2080;
        v22 = "FCOfflineIssueList.m";
        __int16 v23 = 1024;
        int v24 = 92;
        __int16 v25 = 2114;
        __int16 v26 = v16;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      v7 = @"unknown";
    }
    if (self) {
      localStore = self->_localStore;
    }
    else {
      localStore = 0;
    }
    id v9 = [(FCKeyValueStore *)localStore objectForKey:v6];
    id v10 = (void *)[v9 mutableCopy];
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    __int16 v13 = v12;

    [v13 setObject:v6 forKeyedSubscript:@"issueID"];
    [v13 setObject:v7 forKeyedSubscript:@"source"];
    int v14 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setObject:v14 forKeyedSubscript:@"dateAdded"];

    if (self) {
      __int16 v15 = self->_localStore;
    }
    else {
      __int16 v15 = 0;
    }
    [(FCKeyValueStore *)v15 setObject:v13 forKey:v6];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__FCOfflineIssueList_addIssueID_source___block_invoke_36;
    v17[3] = &unk_1E5B4BE70;
    v17[4] = self;
    id v18 = v6;
    FCPerformBlockOnMainThread(v17);
  }
}

void __40__FCOfflineIssueList_addIssueID_source___block_invoke_36(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 16);
  }
  else {
    v3 = 0;
  }
  id v4 = objc_msgSend(v3, "copy", (void)v13);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
        [v10 offlineIssueList:v11 didAddIssues:v12 removeIssues:v8];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
}

- (BOOL)containsIssueID:(id)a3
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  v3 = [(FCOfflineIssueList *)self objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"dateRemoved"];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"dateRemoved"];
      uint64_t v7 = [v4 objectForKeyedSubscript:@"dateAdded"];
      char v8 = objc_msgSend(v6, "fc_isEarlierThan:", v7);
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)everContainedIssueID:(id)a3
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  return [(FCOfflineIssueList *)self containsObjectForKey:a3];
}

- (int64_t)sourceForIssueID:(id)a3
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  v3 = [(FCOfflineIssueList *)self objectForKey:a3];
  id v4 = [v3 objectForKeyedSubscript:@"source"];
  if ([v4 isEqualToString:@"manual"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"auto"])
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)dateAddedForIssueID:(id)a3
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  v3 = [(FCOfflineIssueList *)self objectForKey:a3];
  id v4 = [v3 objectForKeyedSubscript:@"dateAdded"];

  return v4;
}

- (id)dateRemovedForIssueID:(id)a3
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  v3 = [(FCOfflineIssueList *)self objectForKey:a3];
  id v4 = [v3 objectForKeyedSubscript:@"dateRemoved"];

  return v4;
}

- (NSArray)issueIDs
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  uint64_t v2 = [(FCOfflineIssueList *)self keysOfEntriesPassingTest:&__block_literal_global_40_0];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

uint64_t __30__FCOfflineIssueList_issueIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"dateRemoved"];
  if (v4)
  {
    int64_t v5 = [v3 objectForKeyedSubscript:@"dateRemoved"];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"dateAdded"];
    uint64_t v7 = objc_msgSend(v5, "fc_isEarlierThan:", v6);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (NSArray)sortedIssueIDs
{
  if (self) {
    self = (FCOfflineIssueList *)self->_localStore;
  }
  uint64_t v2 = [(FCOfflineIssueList *)self allObjects];
  id v3 = objc_msgSend(v2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_43_3);

  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_46_0];
  int64_t v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_49_2);

  return (NSArray *)v5;
}

uint64_t __36__FCOfflineIssueList_sortedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:@"dateRemoved"];
  if (v3)
  {
    id v4 = [v2 objectForKeyedSubscript:@"dateRemoved"];
    int64_t v5 = [v2 objectForKeyedSubscript:@"dateAdded"];
    uint64_t v6 = objc_msgSend(v4, "fc_isEarlierThan:", v5);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __36__FCOfflineIssueList_sortedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  int64_t v5 = [a3 objectForKeyedSubscript:@"dateAdded"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"dateAdded"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __36__FCOfflineIssueList_sortedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"issueID"];
}

- (void)removeIssueIDs:(id)a3
{
  id v4 = a3;
  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  [(FCKeyValueStore *)localStore updateObjectsForKeys:v4 withBlock:&__block_literal_global_52_1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__FCOfflineIssueList_removeIssueIDs___block_invoke_2;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  FCPerformBlockOnMainThread(v7);
}

id __37__FCOfflineIssueList_removeIssueIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setObject:v3 forKeyedSubscript:@"dateRemoved"];

  return v2;
}

void __37__FCOfflineIssueList_removeIssueIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = objc_msgSend(v3, "copy", (void)v10);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) offlineIssueList:*(void *)(a1 + 32) didAddIssues:v8 removeIssues:*(void *)(a1 + 40)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)removeAllIssues
{
  id v3 = [(FCOfflineIssueList *)self issueIDs];
  [(FCOfflineIssueList *)self removeIssueIDs:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__FCOfflineIssueList_removeAllIssues__block_invoke;
  v5[3] = &unk_1E5B4BE70;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  FCPerformBlockOnMainThread(v5);
}

void __37__FCOfflineIssueList_removeAllIssues__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = objc_msgSend(v3, "copy", (void)v10);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) offlineIssueList:*(void *)(a1 + 32) didAddIssues:v8 removeIssues:*(void *)(a1 + 40)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)removeObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      observers = self->_observers;
    }
    else {
      observers = 0;
    }
    [(NSHashTable *)observers removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCOfflineIssueList removeObserver:]";
    __int16 v9 = 2080;
    long long v10 = "FCOfflineIssueList.m";
    __int16 v11 = 1024;
    int v12 = 236;
    __int16 v13 = 2114;
    long long v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
}

@end