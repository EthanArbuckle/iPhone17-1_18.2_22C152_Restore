@interface TabDocumentManager
+ (TabDocumentManager)sharedManager;
- (TabDocumentManager)init;
- (void)addTab:(id)a3;
- (void)beginSuppressingTabRecycling;
- (void)endSuppressingTabRecycling;
- (void)reclaimTabsIfNeeded;
- (void)removeTab:(id)a3;
@end

@implementation TabDocumentManager

- (void)addTab:(id)a3
{
}

void __35__TabDocumentManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(TabDocumentManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;
}

- (TabDocumentManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)TabDocumentManager;
  v2 = [(TabDocumentManager *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F78290] sharedFeatureManager];
    int v4 = [v3 allowsUnlimitedTabs];

    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      tabs = v2->_tabs;
      v2->_tabs = (NSHashTable *)v5;
    }
    v7 = v2;
  }

  return v2;
}

+ (TabDocumentManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return (TabDocumentManager *)v2;
}

- (void)reclaimTabsIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  int v4 = [v3 allowsUnlimitedTabs];

  if (v4 && !self->_suppressTabRecycling)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    objc_msgSend(v5, "safari_doubleForKey:defaultValue:", @"DebugTabDocumentCapacity", 1000.0);
    uint64_t v7 = (uint64_t)v6;

    uint64_t v8 = v7 >= 1 ? v7 : 0x7FFFFFFFLL;
    uint64_t v9 = [(NSHashTable *)self->_tabs count] - v8;
    if (v9 >= 1)
    {
      v10 = [(NSHashTable *)self->_tabs allObjects];
      v11 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_7_0);

      v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_10];

      v13 = objc_msgSend(v12, "safari_prefixWithMaxLength:", v9);

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            -[NSHashTable removeObject:](self->_tabs, "removeObject:", v19, (void)v22);
            v20 = [v19 browserController];
            v21 = [v20 tabController];
            -[TabController _hibernateTab:](v21, v19);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }
    }
  }
}

- (void)beginSuppressingTabRecycling
{
}

- (void)endSuppressingTabRecycling
{
}

- (void)removeTab:(id)a3
{
}

uint64_t __41__TabDocumentManager_reclaimTabsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 lastViewedTime];
  if (v3 == -1.0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v2 canHibernate];
  }

  return v4;
}

uint64_t __41__TabDocumentManager_reclaimTabsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 lastViewedTime];
  double v7 = v6;
  [v5 lastViewedTime];
  if (v7 >= v8)
  {
    [v4 lastViewedTime];
    double v11 = v10;
    [v5 lastViewedTime];
    uint64_t v9 = v11 != v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end