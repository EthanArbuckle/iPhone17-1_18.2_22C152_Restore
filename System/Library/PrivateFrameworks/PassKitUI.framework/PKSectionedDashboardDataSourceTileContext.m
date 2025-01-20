@interface PKSectionedDashboardDataSourceTileContext
- (PKSectionedDashboardDataSourceTileContext)initWithSectionDataSources:(id)a3;
- (id)footerTextItemForSection:(unint64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (unint64_t)_sectionOffsetForDataSource:(id)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_applyDiff:(id)a3;
- (void)_notifyContentLoadedIfNecessary;
- (void)_reloadSectionMap;
- (void)setDataSourceDelegate:(id)a3;
- (void)updateSectionDataSource:(id)a3 withUpdates:(id)a4 diff:(id)a5;
@end

@implementation PKSectionedDashboardDataSourceTileContext

- (PKSectionedDashboardDataSourceTileContext)initWithSectionDataSources:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSectionedDashboardDataSourceTileContext;
  v6 = [(PKSectionedDashboardDataSourceTileContext *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionDataSources, a3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKSectionedDashboardDataSourceTileContext_initWithSectionDataSources___block_invoke;
    v10[3] = &unk_1E59D80B8;
    v8 = v7;
    v11 = v8;
    [v5 enumerateObjectsUsingBlock:v10];
    [(PKSectionedDashboardDataSourceTileContext *)v8 _reloadSectionMap];
  }
  return v7;
}

uint64_t __72__PKSectionedDashboardDataSourceTileContext_initWithSectionDataSources___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

- (void)setDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(PKSectionedDashboardDataSourceTileContext *)self _notifyContentLoadedIfNecessary];
}

- (void)_reloadSectionMap
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = self;
  obuint64_t j = self->_sectionDataSources;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "sectionIdentifiers", v19);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              [v4 setObject:v9 forKey:*(void *)(*((void *)&v21 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v15 = [v3 copy];
  sectionIdentifiers = v19->_sectionIdentifiers;
  v19->_sectionIdentifiers = (NSArray *)v15;

  uint64_t v17 = [v4 copy];
  sectionMap = v19->_sectionMap;
  v19->_sectionMap = (NSDictionary *)v17;
}

- (unint64_t)_sectionOffsetForDataSource:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_sectionDataSources;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v3 = 0;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v10);
      if (v11 == v5) {
        break;
      }
      uint64_t v12 = objc_msgSend(v11, "sectionIdentifiers", (void)v14);
      v3 += [v12 count];

      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    __break(1u);
  }

  return v3;
}

- (void)_notifyContentLoadedIfNecessary
{
  if (!self->_isAllContentLoaded)
  {
    uint64_t v3 = [(NSArray *)self->_sectionDataSources pk_countObjectsPassingTest:&__block_literal_global_140];
    if (v3 == [(NSArray *)self->_sectionDataSources count])
    {
      self->_isAllContentLoaded = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained contentIsLoaded];
    }
  }
}

uint64_t __76__PKSectionedDashboardDataSourceTileContext__notifyContentLoadedIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isContentLoaded];
}

- (id)itemAtIndexPath:(id)a3
{
  sectionIdentifiers = self->_sectionIdentifiers;
  id v5 = a3;
  uint64_t v6 = -[NSArray objectAtIndexedSubscript:](sectionIdentifiers, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [(NSDictionary *)self->_sectionMap objectForKeyedSubscript:v6];
  uint64_t v8 = [v5 item];

  uint64_t v9 = [v7 itemForSectionIdentifier:v6 atIndex:v8];

  return v9;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  if (!self->_isAllContentLoaded) {
    return 0;
  }
  id v4 = [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a3];
  id v5 = [(NSDictionary *)self->_sectionMap objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 numberOfItemsInSection:v4];

  return v6;
}

- (unint64_t)numberOfSections
{
  if (self->_isAllContentLoaded) {
    return [(NSArray *)self->_sectionIdentifiers count];
  }
  else {
    return 0;
  }
}

- (id)titleForSection:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a3];
  id v5 = [(NSDictionary *)self->_sectionMap objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 titleForSectionIdentifier:v4];

  return v6;
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a3];
  id v5 = [(NSDictionary *)self->_sectionMap objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 footerTextItemForSectionIdentifier:v4];

  return v6;
}

- (void)updateSectionDataSource:(id)a3 withUpdates:(id)a4 diff:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a4;
  id v10 = a5;
  if (self->_isAllContentLoaded)
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__PKSectionedDashboardDataSourceTileContext_updateSectionDataSource_withUpdates_diff___block_invoke;
    v12[3] = &unk_1E59D8100;
    objc_copyWeak(&v16, &location);
    long long v14 = v9;
    v12[4] = self;
    id v13 = v8;
    id v15 = v10;
    [WeakRetained performBatchUpdates:v12 completion:0];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v9[2](v9);
    [(PKSectionedDashboardDataSourceTileContext *)self _reloadSectionMap];
    [(PKSectionedDashboardDataSourceTileContext *)self _notifyContentLoadedIfNecessary];
  }
}

void __86__PKSectionedDashboardDataSourceTileContext_updateSectionDataSource_withUpdates_diff___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) _reloadSectionMap];
    [WeakRetained _sectionOffsetForDataSource:*(void *)(a1 + 40)];
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [v2 _applyDiff:v3];
  }
}

- (void)_applyDiff:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v6 = [v4 deletedIndexPaths];
    [WeakRetained deleteItemsAtIndexPaths:v6];

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v4 deletedSections];
    [v7 deleteSections:v8];

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = [v4 insertedIndexPaths];
    [v9 insertItemsAtIndexPaths:v10];

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = [v4 insertedSections];
    [v11 insertSections:v12];

    id v13 = [v4 movedFromIndexPaths];
    long long v14 = [v4 movedToIndexPaths];
    if ([v13 count])
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        long long v17 = [v13 objectAtIndexedSubscript:v15];
        v18 = [v14 objectAtIndexedSubscript:v15];
        [v16 moveItemAtIndexPath:v17 toIndexPath:v18];

        ++v15;
      }
      while ([v13 count] > v15);
    }
    id v28 = v4;
    uint64_t v19 = objc_msgSend(v4, "changedIndexPaths", v14);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * v23);
          id v25 = objc_loadWeakRetained((id *)&self->_delegate);
          long long v26 = [(PKSectionedDashboardDataSourceTileContext *)self itemAtIndexPath:v24];
          [v25 itemChanged:v26 atIndexPath:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v21);
    }

    id v4 = v28;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionDataSources, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end