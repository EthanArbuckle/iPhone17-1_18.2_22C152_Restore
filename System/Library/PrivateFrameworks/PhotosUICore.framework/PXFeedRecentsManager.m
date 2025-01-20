@interface PXFeedRecentsManager
- (BOOL)_updateCachedRecentAssets;
- (NSArray)_cachedRecentPHAssets;
- (NSArray)recentPHAssets;
- (NSOrderedSet)_cachedRecentAssets;
- (NSOrderedSet)recentAssets;
- (PHPhotoLibrary)photoLibrary;
- (PXFeedRecentsManager)initWithPhotoLibrary:(id)a3 count:(int64_t)a4;
- (PXFeedRecentsManagerDelegate)delegate;
- (int64_t)count;
- (void)_didFinishPostingNotifications:(id)a3;
- (void)_invalidateCachedRecentAssets;
- (void)_setCachedRecentAssets:(id)a3;
- (void)_setCachedRecentPHAssets:(id)a3;
- (void)_setCount:(int64_t)a3;
- (void)_setPhotoLibrary:(id)a3;
- (void)assetsDidChange:(id)a3;
- (void)cloudFeedEntriesDidChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)shouldReload:(id)a3;
@end

@implementation PXFeedRecentsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedRecentPHAssets, 0);
  objc_storeStrong((id *)&self->__cachedRecentAssets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pendingAssetsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingFeedEntriesChangeNotifications, 0);
}

- (void)_setCachedRecentPHAssets:(id)a3
{
}

- (NSArray)_cachedRecentPHAssets
{
  return self->__cachedRecentPHAssets;
}

- (NSOrderedSet)_cachedRecentAssets
{
  return self->__cachedRecentAssets;
}

- (void)setDelegate:(id)a3
{
}

- (PXFeedRecentsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFeedRecentsManagerDelegate *)WeakRetained;
}

- (void)_setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)_setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_didFinishPostingNotifications:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications count]
    || [(NSMutableArray *)self->_pendingAssetsChangeNotifications count])
  {
    v4 = (void *)[(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications copy];
    [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications removeAllObjects];
    v5 = (void *)[(NSMutableArray *)self->_pendingAssetsChangeNotifications copy];
    [(NSMutableArray *)self->_pendingAssetsChangeNotifications removeAllObjects];
    if ([v4 count])
    {
      [(PXFeedRecentsManager *)self _invalidateCachedRecentAssets];
LABEL_5:
      v6 = [(PXFeedRecentsManager *)self delegate];
      [v6 feedRecentsManagerRecentAssetsDidChange:self];
    }
    else
    {
      v6 = [(PXFeedRecentsManager *)self _cachedRecentAssets];
      if ([v6 count])
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v7 = v5;
        uint64_t v17 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v17)
        {
          uint64_t v8 = *(void *)v24;
          v18 = v7;
          uint64_t v16 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v7);
              }
              v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) updatedAssets];
              long long v19 = 0u;
              long long v20 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              id v11 = v6;
              uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v20;
                while (2)
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v20 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    if ([v10 containsObject:*(void *)(*((void *)&v19 + 1) + 8 * j)])
                    {

                      goto LABEL_5;
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
                  if (v13) {
                    continue;
                  }
                  break;
                }
              }

              id v7 = v18;
              uint64_t v8 = v16;
            }
            uint64_t v17 = [v18 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v17);

          goto LABEL_7;
        }
      }
    }

LABEL_7:
  }
}

- (void)shouldReload:(id)a3
{
  [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications removeAllObjects];
  [(NSMutableArray *)self->_pendingAssetsChangeNotifications removeAllObjects];
  [(PXFeedRecentsManager *)self _invalidateCachedRecentAssets];
  id v4 = [(PXFeedRecentsManager *)self delegate];
  [v4 feedRecentsManagerRecentAssetsDidChange:self];
}

- (void)assetsDidChange:(id)a3
{
}

- (void)cloudFeedEntriesDidChange:(id)a3
{
}

- (void)_invalidateCachedRecentAssets
{
}

- (BOOL)_updateCachedRecentAssets
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  unint64_t v4 = [(PXFeedRecentsManager *)self count];
  v5 = (void *)MEMORY[0x1E4F8A710];
  v6 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
  id v7 = [v5 recentAssetsEntriesInLibrary:v6 limit:v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "entryAssets", (void)v22);
        uint64_t v14 = [v13 count];
        if ([v3 count] + v14 >= v4)
        {
          unint64_t v16 = v4 - [v3 count];
          uint64_t v17 = [v13 array];
          v18 = objc_msgSend(v17, "subarrayWithRange:", 0, v16);
          [v3 addObjectsFromArray:v18];

          goto LABEL_11;
        }
        v15 = [v13 array];
        [v3 addObjectsFromArray:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v19 = [(PXFeedRecentsManager *)self _cachedRecentAssets];
  char v20 = [v3 isEqualToOrderedSet:v19];
  if ((v20 & 1) == 0) {
    [(PXFeedRecentsManager *)self _setCachedRecentAssets:v3];
  }

  return v20 ^ 1;
}

- (NSArray)recentPHAssets
{
  v3 = [(PXFeedRecentsManager *)self _cachedRecentPHAssets];
  if (!v3)
  {
    unint64_t v4 = [(PXFeedRecentsManager *)self recentAssets];
    v5 = [v4 array];

    v3 = objc_msgSend(MEMORY[0x1E4F8A950], "pl_PHAssetsForManagedAssets:photoLibrary:", v5, self->_photoLibrary);
    [(PXFeedRecentsManager *)self _setCachedRecentPHAssets:v3];
  }
  return (NSArray *)v3;
}

- (NSOrderedSet)recentAssets
{
  v3 = [(PXFeedRecentsManager *)self _cachedRecentAssets];
  if (!v3)
  {
    [(PXFeedRecentsManager *)self _updateCachedRecentAssets];
    v3 = [(PXFeedRecentsManager *)self _cachedRecentAssets];
  }
  return (NSOrderedSet *)v3;
}

- (void)_setCachedRecentAssets:(id)a3
{
  v5 = (NSOrderedSet *)a3;
  if (self->__cachedRecentAssets != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->__cachedRecentAssets, a3);
    cachedRecentPHAssets = self->__cachedRecentPHAssets;
    self->__cachedRecentPHAssets = 0;

    v5 = v7;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F8A6E8] defaultCenter];
  [v3 removeCloudFeedEntriesObserver:self];
  [v3 removeAssetChangeObserver:self];
  [v3 removeShouldReloadObserver:self];
  unint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F8AD20] object:0];

  v5.receiver = self;
  v5.super_class = (Class)PXFeedRecentsManager;
  [(PXFeedRecentsManager *)&v5 dealloc];
}

- (PXFeedRecentsManager)initWithPhotoLibrary:(id)a3 count:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXFeedRecentsManager;
  id v7 = [(PXFeedRecentsManager *)&v16 init];
  id v8 = v7;
  if (v7)
  {
    [(PXFeedRecentsManager *)v7 _setPhotoLibrary:v6];
    [(PXFeedRecentsManager *)v8 _setCount:a4];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    pendingFeedEntriesChangeNotifications = v8->_pendingFeedEntriesChangeNotifications;
    v8->_pendingFeedEntriesChangeNotifications = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    pendingAssetsChangeNotifications = v8->_pendingAssetsChangeNotifications;
    v8->_pendingAssetsChangeNotifications = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F8A6E8] defaultCenter];
    [v13 addCloudFeedEntriesObserver:v8];
    [v13 addAssetChangeObserver:v8];
    [v13 addShouldReloadObserver:v8];
    uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel__didFinishPostingNotifications_ name:*MEMORY[0x1E4F8AD20] object:0];

    [(PXFeedRecentsManager *)v8 _invalidateCachedRecentAssets];
  }

  return v8;
}

@end