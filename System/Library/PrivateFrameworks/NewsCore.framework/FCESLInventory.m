@interface FCESLInventory
- (FCESLInventory)initWithGlobalInventory:(id)a3 tagInventory:(id)a4;
- (FCFeedItemInventoryType)globalInventory;
- (FCFeedItemInventoryType)tagInventory;
- (NSArray)allFeedItems;
- (id)_childInventories;
- (id)allFeedItemScoreProfilesForConfigurationSet:(int64_t)a3 scoringVersion:(unint64_t)a4;
- (id)allFeedItemsWithTopic:(id)a3;
- (void)_enumerateChildInventories:(id)a3;
- (void)prewarmScoreCache:(id)a3 configuration:(id)a4;
- (void)refreshIfNeededWithCompletion:(id)a3;
@end

@implementation FCESLInventory

- (FCESLInventory)initWithGlobalInventory:(id)a3 tagInventory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCESLInventory;
  v9 = [(FCESLInventory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_globalInventory, a3);
    objc_storeStrong((id *)&v10->_tagInventory, a4);
  }

  return v10;
}

- (void)prewarmScoreCache:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 personalizationTreatment];
  uint64_t v8 = [v7 scoringVersion];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FCESLInventory_prewarmScoreCache_configuration___block_invoke;
  v10[3] = &unk_1E5B51EA0;
  id v11 = v6;
  uint64_t v12 = v8;
  id v9 = v6;
  [(FCESLInventory *)self _enumerateChildInventories:v10];
}

void __50__FCESLInventory_prewarmScoreCache_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = [v4 allFeedItemScoreProfilesForConfigurationSet:0 scoringVersion:v3];
  [*(id *)(a1 + 32) addScoreProfiles:v6 configurationSet:0];
  v5 = [v4 allFeedItemScoreProfilesForConfigurationSet:11 scoringVersion:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) addScoreProfiles:v5 configurationSet:11];
}

- (NSArray)allFeedItems
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__FCESLInventory_allFeedItems__block_invoke;
  aBlock[3] = &unk_1E5B51EC8;
  id v15 = v4;
  id v5 = v3;
  id v16 = v5;
  id v6 = v4;
  id v7 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__FCESLInventory_allFeedItems__block_invoke_2;
  v12[3] = &unk_1E5B51EF0;
  v13 = v7;
  id v8 = v7;
  [(FCESLInventory *)self _enumerateChildInventories:v12];
  id v9 = v13;
  v10 = (NSArray *)v5;

  return v10;
}

void __30__FCESLInventory_allFeedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  id v5 = [v3 articleID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v8];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 articleID];
    [v6 addObject:v7];
  }
}

void __30__FCESLInventory_allFeedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 allFeedItems];
  [v3 enumerateObjectsUsingBlock:*(void *)(a1 + 32)];
}

- (id)allFeedItemScoreProfilesForConfigurationSet:(int64_t)a3 scoringVersion:(unint64_t)a4
{
  id v7 = +[FCMapTable mapTableWithKeyOptions:512 valueOptions:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__FCESLInventory_allFeedItemScoreProfilesForConfigurationSet_scoringVersion___block_invoke;
  v10[3] = &unk_1E5B51F18;
  id v8 = v7;
  id v11 = v8;
  int64_t v12 = a3;
  unint64_t v13 = a4;
  [(FCESLInventory *)self _enumerateChildInventories:v10];

  return v8;
}

void __77__FCESLInventory_allFeedItemScoreProfilesForConfigurationSet_scoringVersion___block_invoke(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  id v3 = [a2 allFeedItemScoreProfilesForConfigurationSet:a1[5] scoringVersion:a1[6]];
  [v2 addObjectsFromMapTable:v3];
}

- (id)allFeedItemsWithTopic:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__FCESLInventory_allFeedItemsWithTopic___block_invoke;
  aBlock[3] = &unk_1E5B51EC8;
  id v19 = v6;
  id v7 = v5;
  id v20 = v7;
  id v8 = v6;
  id v9 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__FCESLInventory_allFeedItemsWithTopic___block_invoke_2;
  v15[3] = &unk_1E5B51F40;
  id v16 = v4;
  v17 = v9;
  id v10 = v9;
  id v11 = v4;
  [(FCESLInventory *)self _enumerateChildInventories:v15];
  int64_t v12 = v17;
  id v13 = v7;

  return v13;
}

void __40__FCESLInventory_allFeedItemsWithTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  id v5 = [v3 articleID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v8];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 articleID];
    [v6 addObject:v7];
  }
}

void __40__FCESLInventory_allFeedItemsWithTopic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 allFeedItemsWithTopic:*(void *)(a1 + 32)];
  [v3 enumerateObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (void)refreshIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke;
  v13[3] = &unk_1E5B51F90;
  id v6 = v5;
  v14 = v6;
  id v15 = &v16;
  [(FCESLInventory *)self _enumerateChildInventories:v13];
  if (FCDispatchGroupIsEmpty(v6))
  {
    v11[2] = MEMORY[0x1E4F143A8];
    v11[3] = 3221225472;
    v11[4] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_3;
    v11[5] = &unk_1E5B4CDE8;
    v12[0] = v4;
    v12[1] = &v16;
    (*(void (**)(void, void))(v12[0] + 16))(v12[0], *((unsigned __int8 *)v17 + 24));
    id v7 = (id *)v12;
  }
  else
  {
    uint64_t v8 = FCCurrentQoS();
    id v9 = FCDispatchQueueForQualityOfService(v8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_4;
    v10[3] = &unk_1E5B4CDE8;
    id v7 = (id *)v11;
    v11[0] = v4;
    v11[1] = &v16;
    dispatch_group_notify(v6, v9, v10);
  }
  _Block_object_dispose(&v16, 8);
}

void __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5B51F68;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v6;
  long long v8 = v6;
  [v4 refreshIfNeededWithCompletion:v7];
}

void __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    a2 = 1;
  }
  *(unsigned char *)(v2 + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (id)_childInventories
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCESLInventory *)self globalInventory];
  v7[0] = v3;
  id v4 = [(FCESLInventory *)self tagInventory];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)_enumerateChildInventories:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(FCESLInventory *)self _childInventories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1A6260FD0]();
        v4[2](v4, v10);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (FCFeedItemInventoryType)globalInventory
{
  return self->_globalInventory;
}

- (FCFeedItemInventoryType)tagInventory
{
  return self->_tagInventory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagInventory, 0);
  objc_storeStrong((id *)&self->_globalInventory, 0);
}

@end