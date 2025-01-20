@interface PXGadgetDataSourceManager
+ (OS_os_log)gadgetDataSourceManagerLog;
- (BOOL)canLoadRemainingDataForProviders;
- (BOOL)didLoadRemainingGadgets;
- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (BOOL)hasLoadedPriorities;
- (BOOL)loadingInitialGadgets;
- (BOOL)needsToLoadAllProviders;
- (NSArray)cachedProviders;
- (NSArray)gadgetProviders;
- (PXGadgetDataSourceManager)init;
- (PXGadgetDataSourceManager)initWithQueueName:(id)a3;
- (PXGadgetDelegate)nextGadgetResponder;
- (id)_dataSourceSnapshot;
- (id)createInitialDataSource;
- (id)gadgetProviderSortComparator;
- (id)gadgetSortComparator;
- (id)gadgetViewControllerHostingGadget:(id)a3;
- (id)hiddenGadgetProviders;
- (id)presentationEnvironmentForGadget:(id)a3;
- (void)_loadDataFromProviders:(id)a3 withGadgetMinimum:(unint64_t)a4;
- (void)_loadPriorityForProviders:(id)a3;
- (void)_updateDataSource;
- (void)beginLoadingInitialGadgets:(unint64_t)a3;
- (void)didPerformChanges;
- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)gadget:(id)a3 animateChanges:(id)a4;
- (void)gadget:(id)a3 didChange:(unint64_t)a4;
- (void)invalidateGadgets;
- (void)loadRemainingGadgetsIfNeeded;
- (void)loadRemainingGadgetsIfNeeded:(id)a3;
- (void)loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock:(id)a3 completion:(id)a4;
- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeCachedProviders;
- (void)setCachedProviders:(id)a3;
- (void)setCanLoadRemainingDataForProviders:(BOOL)a3;
- (void)setHasLoadedPriorities:(BOOL)a3;
- (void)setLoadingInitialGadgets:(BOOL)a3;
- (void)setNeedsToLoadAllProviders:(BOOL)a3;
- (void)setNextGadgetResponder:(id)a3;
- (void)willPerformChanges;
@end

@implementation PXGadgetDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedProviders, 0);
  objc_destroyWeak((id *)&self->_nextGadgetResponder);
  objc_storeStrong((id *)&self->_deferredGadgetQueue, 0);
  objc_storeStrong((id *)&self->_deferredGadgetLoadingGroup, 0);
  objc_storeStrong((id *)&self->_lookupQueue_loadedProviders, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
}

- (void)setNeedsToLoadAllProviders:(BOOL)a3
{
  self->_needsToLoadAllProviders = a3;
}

- (BOOL)needsToLoadAllProviders
{
  return self->_needsToLoadAllProviders;
}

- (void)setLoadingInitialGadgets:(BOOL)a3
{
  self->_loadingInitialGadgets = a3;
}

- (BOOL)loadingInitialGadgets
{
  return self->_loadingInitialGadgets;
}

- (void)setHasLoadedPriorities:(BOOL)a3
{
  self->_hasLoadedPriorities = a3;
}

- (BOOL)hasLoadedPriorities
{
  return self->_hasLoadedPriorities;
}

- (void)setCachedProviders:(id)a3
{
}

- (BOOL)canLoadRemainingDataForProviders
{
  return self->_canLoadRemainingDataForProviders;
}

- (BOOL)didLoadRemainingGadgets
{
  return self->_didLoadRemainingGadgets;
}

- (void)setNextGadgetResponder:(id)a3
{
}

- (PXGadgetDelegate)nextGadgetResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextGadgetResponder);
  return (PXGadgetDelegate *)WeakRetained;
}

- (id)gadgetViewControllerHostingGadget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  if (v5
    && (v6 = (void *)v5,
        [(PXGadgetDataSourceManager *)self nextGadgetResponder],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
    v10 = [v9 gadgetViewControllerHostingGadget:v4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)gadget:(id)a3 animateChanges:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  if (v7)
  {
    char v8 = (void *)v7;
    v9 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
      [v11 gadget:v12 animateChanges:v6];
    }
  }
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v11 = a3;
  uint64_t v6 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    char v8 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      char v10 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
      [v10 gadget:v11 didChange:a4];
    }
  }
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  uint64_t v6 = [v5 presentationEnvironmentForGadget:v4];

  return v6;
}

- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  [v10 dismissGadgetViewController:v9 animated:v5 completion:v8];
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  [v10 presentGadgetViewController:v9 animated:v5 completion:v8];
}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(PXGadgetDataSourceManager *)self nextGadgetResponder];
  v14 = v13;
  if (v13) {
    char v15 = [v13 gadget:v10 transitionToViewController:v11 animated:v7 completion:v12];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (void)invalidateGadgets
{
  if (![(PXGadgetDataSourceManager *)self loadingInitialGadgets])
  {
    if (self->_isPerformingChanges)
    {
      self->_dataSourceNeedsUpdate = 1;
    }
    else
    {
      [(PXGadgetDataSourceManager *)self _updateDataSource];
    }
  }
}

- (id)_dataSourceSnapshot
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(PXGadgetDataSourceManager *)self cachedProviders];
  id v4 = (void *)[v3 mutableCopy];

  v23 = self;
  uint64_t v5 = [(PXGadgetDataSourceManager *)self gadgetProviderSortComparator];
  if (v5) {
    [v4 sortUsingComparator:v5];
  }
  v22 = (void *)v5;
  uint64_t v6 = [(PXGadgetDataSourceManager *)self hiddenGadgetProviders];
  if ([v6 count]) {
    [v4 removeObjectsInArray:v6];
  }
  v21 = v6;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 gadgets];
        if ([v14 count])
        {
          if ((unint64_t)[v14 count] >= 2)
          {
            char v15 = [(PXGadgetDataSourceManager *)v23 gadgetSortComparator];
            if (v15)
            {
              uint64_t v16 = [v14 sortedArrayUsingComparator:v15];

              v14 = (void *)v16;
            }
          }
          v17 = [v13 identifier];
          v18 = [[PXGadgetSection alloc] initWithIdentifier:v17 gadgets:v14];
          [v7 addObject:v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  v19 = [[PXGadgetDataSource alloc] initWithGadgetSections:v7];
  return v19;
}

- (void)_updateDataSource
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isPerformingChanges) {
    PXAssertGetLog();
  }
  self->_dataSourceNeedsUpdate = 0;
  v3 = [(PXSectionedDataSourceManager *)self dataSource];
  id v4 = [(PXGadgetDataSourceManager *)self _dataSourceSnapshot];
  uint64_t v5 = [v3 gadgetSections];
  uint64_t v6 = [v4 gadgetSections];
  id v7 = [off_1E5DA5568 changeDetailsFromArray:v5 toArray:v6 changedObjects:MEMORY[0x1E4F1CBF0] objectComparator:&__block_literal_global_200174];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  char v15 = __46__PXGadgetDataSourceManager__updateDataSource__block_invoke_2;
  uint64_t v16 = &unk_1E5DC41C0;
  id v17 = v3;
  id v18 = v8;
  id v9 = v8;
  id v10 = v3;
  [v6 enumerateObjectsUsingBlock:&v13];
  id v11 = objc_alloc((Class)off_1E5DA8488);
  id v12 = objc_msgSend(v11, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v10, "identifier", v13, v14, v15, v16), objc_msgSend(v4, "identifier"), v7, v9, 0);
  [(PXSectionedDataSourceManager *)self setDataSource:v4 changeDetails:v12];
}

void __46__PXGadgetDataSourceManager__updateDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v5 identifier];
  if (v6)
  {
    [v6 indexPathForGadgetSectionWithIdentifier:v7];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }

  if ((void)v16 != *(void *)off_1E5DAAED8)
  {
    id v8 = *(void **)(a1 + 32);
    v15[0] = v16;
    v15[1] = v17;
    id v9 = [v8 gadgetSectionAtIndexPath:v15];
    id v10 = [v9 gadgets];
    id v11 = [v5 gadgets];
    id v12 = [off_1E5DA5568 changeDetailsFromArray:v10 toArray:v11 changedObjects:MEMORY[0x1E4F1CBF0]];

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
}

uint64_t __46__PXGadgetDataSourceManager__updateDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_loadDataFromProviders:(id)a3 withGadgetMinimum:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v21 = self;
  uint64_t v7 = [(id)objc_opt_class() gadgetDataSourceManagerLog];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v28;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(obj);
      }
      if (v10 >= a4) {
        break;
      }
      uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
      os_signpost_id_t v14 = os_signpost_id_generate(v7);
      char v15 = v7;
      long long v16 = v15;
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        [v13 loadDataForGadgets];
        id v18 = v16;
      }
      else
      {
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LoadDataForGadget", "", buf, 2u);
        }

        [v13 loadDataForGadgets];
        long long v17 = v16;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_END, v14, "LoadDataForGadget", "", buf, 2u);
        }
      }

      [v6 addObject:v13];
      v10 += [v13 estimatedNumberOfGadgets];
      if (v9 == ++v12)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  lookupQueue = v21->_lookupQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PXGadgetDataSourceManager__loadDataFromProviders_withGadgetMinimum___block_invoke;
  block[3] = &unk_1E5DD32A8;
  block[4] = v21;
  id v25 = v6;
  id v20 = v6;
  dispatch_sync(lookupQueue, block);
}

uint64_t __70__PXGadgetDataSourceManager__loadDataFromProviders_withGadgetMinimum___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)_loadPriorityForProviders:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PXGadgetDataSourceManager *)self hasLoadedPriorities])
  {
    id v5 = [(PXGadgetDataSourceManager *)self gadgetProviderSortComparator];

    if (v5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "loadDataForPriority", (void)v11);
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (NSArray)cachedProviders
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  cachedProviders = self->_cachedProviders;
  if (!cachedProviders)
  {
    id v5 = [(PXGadgetDataSourceManager *)self gadgetProviders];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = v5;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      unint64_t v11 = 0x1E4F28000uLL;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v13 setDelegate:self];
          [v13 setNextGadgetResponder:self];
          long long v14 = [v13 identifier];
          if ([v6 containsObject:v14])
          {
            char v15 = [*(id *)(v11 + 2816) currentHandler];
            [v15 handleFailureInMethod:a2, self, @"PXGadgetDataSourceManager.m", 274, @"Invalid parameter not satisfying: %@", @"![gadgetProviderIdentifiers containsObject:gadgetProviderIdentifier]" object file lineNumber description];

            unint64_t v11 = 0x1E4F28000;
          }
          [v6 addObject:v14];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v16 = self->_cachedProviders;
    self->_cachedProviders = v7;

    cachedProviders = self->_cachedProviders;
  }
  return cachedProviders;
}

- (void)setCanLoadRemainingDataForProviders:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_canLoadRemainingDataForProviders != a3)
  {
    self->_canLoadRemainingDataForProviders = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(PXGadgetDataSourceManager *)self cachedProviders];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (self->_canLoadRemainingDataForProviders) {
            [v9 startLoadingRemainingData];
          }
          else {
            [v9 pauseLoadingRemainingData];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = self->_deferredGadgetLoadingGroup;
  if ([(PXGadgetDataSourceManager *)self needsToLoadAllProviders])
  {
    [(PXGadgetDataSourceManager *)self setNeedsToLoadAllProviders:0];
    queue = self->_lookupQueue;
    uint64_t v8 = [(PXGadgetDataSourceManager *)self cachedProviders];
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__200196;
    v43 = __Block_byref_object_dispose__200197;
    id v44 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke;
    block[3] = &unk_1E5DCCA20;
    id v9 = v8;
    id v36 = v9;
    v37 = self;
    v38 = &v39;
    dispatch_sync((dispatch_queue_t)queue, block);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    long long v10 = [(id)objc_opt_class() gadgetDataSourceManagerLog];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)v40[5];
    uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          dispatch_group_enter((dispatch_group_t)v7);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_2;
          v21[3] = &unk_1E5DC4178;
          id v22 = v10;
          uint64_t v23 = v14;
          long long v24 = queue;
          id v25 = self;
          id v27 = v18;
          long long v28 = v34;
          long long v29 = &v39;
          long long v26 = v7;
          dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v21);
          dispatch_async((dispatch_queue_t)self->_deferredGadgetQueue, v15);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v45 count:16];
      }
      while (v11);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_23;
    v19[3] = &unk_1E5DD3280;
    v19[4] = self;
    id v20 = v6;
    dispatch_group_notify((dispatch_group_t)v7, MEMORY[0x1E4F14428], v19);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&v39, 8);
  }
  else if (v6)
  {
    dispatch_group_notify((dispatch_group_t)v7, MEMORY[0x1E4F14428], v6);
  }
}

void __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:a1[4]];
  [v2 removeObjectsInArray:*(void *)(a1[5] + 128)];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_2(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  uint64_t v3 = *(id *)(a1 + 32);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "LoadDataForGadget", "", buf, 2u);
  }

  [*(id *)(a1 + 40) loadDataForGadgets];
  uint64_t v5 = *(id *)(a1 + 32);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v2, "LoadDataForGadget", "", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_21;
  block[3] = &unk_1E5DD32A8;
  uint64_t v7 = *(NSObject **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  void block[4] = *(void *)(a1 + 56);
  void block[5] = v8;
  dispatch_sync(v7, block);
  *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 72);
  *(id *)(a1 + 64);
  px_dispatch_on_main_queue();
}

uint64_t __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_23(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_21(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) addObject:*(void *)(a1 + 40)];
}

void __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_2_22(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  uint64_t v3 = *(id *)(a1 + 32);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "GenerateGadget", "", buf, 2u);
  }

  [*(id *)(a1 + 40) generateGadgets];
  uint64_t v5 = *(id *)(a1 + 32);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v2, "GenerateGadget", "", buf, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  uint64_t v8 = ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v8 == [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count])
  {
    id v9 = *(unsigned char **)(a1 + 48);
    if (v9[155])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v10 = objc_msgSend(v9, "cachedProviders", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * i) startLoadingRemainingData];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)loadRemainingGadgetsIfNeeded:(id)a3
{
}

- (void)loadRemainingGadgetsIfNeeded
{
}

- (void)beginLoadingInitialGadgets:(unint64_t)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() gadgetDataSourceManagerLog];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  id v6 = v5;
  os_signpost_id_t spid = v4;
  unint64_t v26 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "LoadInitialGadgets", "", buf, 2u);
  }

  uint64_t v7 = [(PXGadgetDataSourceManager *)self cachedProviders];
  uint64_t v8 = self->_lookupQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  queue = v8;
  dispatch_sync((dispatch_queue_t)v8, block);
  [(PXGadgetDataSourceManager *)self setLoadingInitialGadgets:1];
  [(PXGadgetDataSourceManager *)self _loadPriorityForProviders:v7];
  [(PXGadgetDataSourceManager *)self didLoadDataForPriorities];
  id v29 = v7;
  id v27 = [(PXGadgetDataSourceManager *)self gadgetProviderSortComparator];
  id v9 = v29;
  if (v27)
  {
    uint64_t v10 = [v29 sortedArrayUsingComparator:v27];

    id v9 = (id)v10;
  }
  id v25 = v9;
  -[PXGadgetDataSourceManager _loadDataFromProviders:withGadgetMinimum:](self, "_loadDataFromProviders:withGadgetMinimum:");
  *(void *)buf = 0;
  v45 = buf;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__200196;
  v48 = __Block_byref_object_dispose__200197;
  id v49 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_19;
  v43[3] = &unk_1E5DD0588;
  v43[5] = buf;
  v43[4] = self;
  dispatch_sync(queue, v43);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = *((id *)v45 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        os_signpost_id_t v16 = os_signpost_id_generate(v6);
        long long v17 = v6;
        long long v18 = v17;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "GenerateGadget", "", v35, 2u);
        }

        [v15 generateGadgets];
        long long v19 = v18;
        id v20 = v19;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v20, OS_SIGNPOST_INTERVAL_END, v16, "GenerateGadget", "", v35, 2u);
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v12);
  }

  [(PXGadgetDataSourceManager *)self _updateDataSource];
  [(PXGadgetDataSourceManager *)self setLoadingInitialGadgets:0];
  *(void *)v35 = 0;
  id v36 = v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_20;
  v32[3] = &unk_1E5DCCA20;
  v34 = v35;
  v32[4] = self;
  id v21 = v29;
  id v33 = v21;
  dispatch_sync(queue, v32);
  if (v36[24]) {
    [(PXGadgetDataSourceManager *)self setNeedsToLoadAllProviders:0];
  }
  id v22 = v6;
  uint64_t v23 = v22;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)long long v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v23, OS_SIGNPOST_INTERVAL_END, spid, "LoadInitialGadgets", "", v31, 2u);
  }

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(buf, 8);
}

uint64_t __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
}

void __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_20(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 128) isEqualToArray:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)hiddenGadgetProviders
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)gadgetProviderSortComparator
{
  return 0;
}

- (id)gadgetSortComparator
{
  return 0;
}

- (NSArray)gadgetProviders
{
  os_signpost_id_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGadgetDataSourceManager.m", 100, @"Method %s is a responsibility of subclass %@", "-[PXGadgetDataSourceManager gadgetProviders]", v6 object file lineNumber description];

  abort();
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXGadgetDataSourceManager;
  [(PXGadgetDataSourceManager *)&v3 didPerformChanges];
  self->_isPerformingChanges = 0;
  if (self->_dataSourceNeedsUpdate) {
    [(PXGadgetDataSourceManager *)self _updateDataSource];
  }
}

- (void)willPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXGadgetDataSourceManager;
  [(PXGadgetDataSourceManager *)&v3 willPerformChanges];
  self->_isPerformingChanges = 1;
}

- (void)removeCachedProviders
{
  objc_super v3 = +[PXSectionedDataSource emptyDataSource];
  [(PXSectionedDataSourceManager *)self setDataSource:v3 changeDetails:0];

  [(PXGadgetDataSourceManager *)self setCachedProviders:0];
  [(PXGadgetDataSourceManager *)self setNeedsToLoadAllProviders:1];
  self->_didLoadRemainingGadgets = 0;
}

- (id)createInitialDataSource
{
  objc_super v3 = [(PXGadgetDataSourceManager *)self _dataSourceSnapshot];
  [(PXGadgetDataSourceManager *)self setNeedsToLoadAllProviders:1];
  return v3;
}

- (PXGadgetDataSourceManager)initWithQueueName:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGadgetDataSourceManager;
  uint64_t v5 = [(PXSectionedDataSourceManager *)&v18 init];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"%@-lookup", v4];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    lookupQueue = v5->_lookupQueue;
    v5->_lookupQueue = (OS_dispatch_queue *)v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lookupQueue_loadedProviders = v5->_lookupQueue_loadedProviders;
    v5->_lookupQueue_loadedProviders = v9;

    dispatch_group_t v11 = dispatch_group_create();
    deferredGadgetLoadingGroup = v5->_deferredGadgetLoadingGroup;
    v5->_deferredGadgetLoadingGroup = (OS_dispatch_group *)v11;

    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photos.deferredGadgetQueue", v14);
    deferredGadgetQueue = v5->_deferredGadgetQueue;
    v5->_deferredGadgetQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (PXGadgetDataSourceManager)init
{
  return [(PXGadgetDataSourceManager *)self initWithQueueName:@"com.mobileSlideShow.GadgetGenerator"];
}

+ (OS_os_log)gadgetDataSourceManagerLog
{
  if (gadgetDataSourceManagerLog_predicate != -1) {
    dispatch_once(&gadgetDataSourceManagerLog_predicate, &__block_literal_global_45);
  }
  uint64_t v2 = (void *)gadgetDataSourceManagerLog_log;
  return (OS_os_log *)v2;
}

void __55__PXGadgetDataSourceManager_gadgetDataSourceManagerLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "GadgetDataSourceManager");
  v1 = (void *)gadgetDataSourceManagerLog_log;
  gadgetDataSourceManagerLog_log = (uint64_t)v0;
}

@end