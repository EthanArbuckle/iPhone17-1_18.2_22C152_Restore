@interface PUJoiningDataSourceManager
- (NSArray)dataSourceManagers;
- (PUJoiningDataSourceManager)initWithDataSourceManagers:(id)a3;
- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3;
- (int64_t)_currentUpdateID;
- (void)_handleScheduledUpdateWithID:(int64_t)a3;
- (void)_scheduleUpdate;
- (void)_setCurrentUpdateId:(int64_t)a3;
- (void)_update;
@end

@implementation PUJoiningDataSourceManager

- (void).cxx_destruct
{
}

- (void)_setCurrentUpdateId:(int64_t)a3
{
  self->__currentUpdateID = a3;
}

- (int64_t)_currentUpdateID
{
  return self->__currentUpdateID;
}

- (NSArray)dataSourceManagers
{
  return self->_dataSourceManagers;
}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  v4 = [(PUAssetsDataSourceManager *)self delegate];
  v5 = [v4 assetsDataSourceManagerInterestingAssetReferences:self];

  return v5;
}

- (void)_update
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(PUJoiningDataSourceManager *)self dataSourceManagers];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(PUJoiningDataSourceManager *)self dataSourceManagers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) assetsDataSource];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12 = [[PUJoiningAssetsDataSource alloc] initWithDataSources:v5];
  [(PUAssetsDataSourceManager *)self setAssetsDataSource:v12];
}

- (void)_handleScheduledUpdateWithID:(int64_t)a3
{
  if ([(PUJoiningDataSourceManager *)self _currentUpdateID] == a3)
  {
    [(PUJoiningDataSourceManager *)self _update];
  }
}

- (void)_scheduleUpdate
{
  v3 = (void *)([(PUJoiningDataSourceManager *)self _currentUpdateID] + 1);
  [(PUJoiningDataSourceManager *)self _setCurrentUpdateId:v3];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUJoiningDataSourceManager__scheduleUpdate__block_invoke;
  block[3] = &unk_1E5F2B980;
  objc_copyWeak(v5, &location);
  v5[1] = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __45__PUJoiningDataSourceManager__scheduleUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleScheduledUpdateWithID:*(void *)(a1 + 40)];
}

- (PUJoiningDataSourceManager)initWithDataSourceManagers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUJoiningDataSourceManager;
  v6 = [(PUJoiningDataSourceManager *)&v18 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManagers, a3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "setDelegate:", v7, (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v10);
    }

    [(PUJoiningDataSourceManager *)v7 _update];
  }

  return v7;
}

@end