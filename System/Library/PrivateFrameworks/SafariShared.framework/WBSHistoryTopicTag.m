@interface WBSHistoryTopicTag
+ (void)initialize;
- (BOOL)containsHistoryItem:(id)a3;
- (NSArray)historyItems;
- (WBSHistoryTopicTag)initWithTag:(id)a3 historyItems:(id)a4;
- (WBSHistoryTopicTag)initWithTitle:(id)a3 identifier:(id)a4 databaseID:(int64_t)a5 modificationTimestamp:(double)a6 level:(int64_t)a7;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)dealloc;
- (void)groupHistoryItemsBySessionWithCompletionHandler:(id)a3;
- (void)removeHistoryItems:(id)a3;
- (void)tagHistoryItem:(id)a3;
@end

@implementation WBSHistoryTopicTag

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryTopicTag.Synchronization", 0);
    v3 = (void *)historyTopicSynchronizationQueue;
    historyTopicSynchronizationQueue = (uint64_t)v2;
  }
}

- (WBSHistoryTopicTag)initWithTag:(id)a3 historyItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 title];
  v9 = [v7 identifier];
  uint64_t v10 = [v7 databaseID];
  [v7 modificationTimestamp];
  double v12 = v11;
  uint64_t v13 = [v7 level];

  v14 = [(WBSHistoryTopicTag *)self initWithTitle:v8 identifier:v9 databaseID:v10 modificationTimestamp:v13 level:v12];
  if (v14)
  {
    [(NSMutableOrderedSet *)v14->_taggedItems addObjectsFromArray:v6];
    v15 = v14;
  }

  return v14;
}

- (WBSHistoryTopicTag)initWithTitle:(id)a3 identifier:(id)a4 databaseID:(int64_t)a5 modificationTimestamp:(double)a6 level:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryTopicTag;
  id v7 = [(WBSHistoryTag *)&v13 initWithTitle:a3 identifier:a4 databaseID:a5 modificationTimestamp:a7 level:a6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
    taggedItems = v7->_taggedItems;
    v7->_taggedItems = (NSMutableOrderedSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__historyItemsWereRemoved_ name:@"WBSHistoryItemsWereRemovedNotification" object:0];

    double v11 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSHistoryTopicTag;
  [(WBSHistoryTopicTag *)&v4 dealloc];
}

- (void)tagHistoryItem:(id)a3
{
  id v4 = a3;
  v5 = historyTopicSynchronizationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__WBSHistoryTopicTag_tagHistoryItem___block_invoke;
  v7[3] = &unk_1E5C8C920;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__WBSHistoryTopicTag_tagHistoryItem___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 48);
  return objc_msgSend(v3, "safari_insertObject:inSortedOrderUsingComparator:", v2, &__block_literal_global_72);
}

uint64_t __37__WBSHistoryTopicTag_tagHistoryItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 lastVisitedDate];
  id v6 = [v4 lastVisitedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)historyItems
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__27;
  v9 = __Block_byref_object_dispose__27;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__WBSHistoryTopicTag_historyItems__block_invoke;
  v4[3] = &unk_1E5C8CF00;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)historyTopicSynchronizationQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __34__WBSHistoryTopicTag_historyItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) array];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)groupHistoryItemsBySessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = historyTopicSynchronizationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v8 lastVisitedDate];
        id v10 = objc_msgSend(v9, "safari_startOfDay");

        double v11 = [v2 objectForKeyedSubscript:v10];
        if (!v11)
        {
          double v11 = [MEMORY[0x1E4F1CA48] array];
          [v2 setObject:v11 forKeyedSubscript:v10];
        }
        [v11 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  double v12 = [MEMORY[0x1E4F1CA48] array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E5C9DA40;
  id v15 = v12;
  id v13 = v12;
  [v2 enumerateKeysAndObjectsUsingBlock:v14];
  [v13 sortUsingComparator:&__block_literal_global_17_0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v5 sortUsingComparator:&__block_literal_global_12_0];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [[WBSHistorySessionWithItems alloc] initWithSessionStartDate:v6 items:v5];

  [v7 addObject:v8];
}

uint64_t __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 lastVisitedTimeInterval];
  double v6 = v5;
  [v4 lastVisitedTimeInterval];
  double v8 = v7;

  if (v6 < v8) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 startDate];
  double v6 = [v4 startDate];

  if ([v5 compare:v6] == 1) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

- (BOOL)containsHistoryItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  double v5 = historyTopicSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WBSHistoryTopicTag_containsHistoryItem___block_invoke;
  block[3] = &unk_1E5C9DA88;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);
  LOBYTE(v5) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

uint64_t __42__WBSHistoryTopicTag_containsHistoryItem___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 48) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)removeHistoryItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = historyTopicSynchronizationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__WBSHistoryTopicTag_removeHistoryItems___block_invoke;
    v6[3] = &unk_1E5C8C920;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __41__WBSHistoryTopicTag_removeHistoryItems___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsInArray:*(void *)(a1 + 40)];
}

- (void)_historyItemsWereRemoved:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = objc_msgSend(v5, "safari_arrayForKey:", @"WBSHistoryItemsKey");
  [(WBSHistoryTopicTag *)self removeHistoryItems:v4];
}

- (void).cxx_destruct
{
}

@end