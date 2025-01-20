@interface PLUtilityAssetPool
- (PLUtilityAssetPool)init;
- (id)_dequeueRecylableAsset;
- (id)_dequeueRecylableClassification;
- (void)recycleAsset:(id)a3;
@end

@implementation PLUtilityAssetPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locked_recycledClassifications, 0);
  objc_storeStrong((id *)&self->_locked_recycledAssets, 0);
}

- (void)recycleAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = objc_msgSend(v4, "sceneClassifications", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(NSMutableArray *)self->_locked_recycledClassifications addObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_locked_recycledAssets addObject:v4];
    [v4 _prepareForRecycle];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (PLUtilityAssetPool)init
{
  v9.receiver = self;
  v9.super_class = (Class)PLUtilityAssetPool;
  v2 = [(PLUtilityAssetPool *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    locked_recycledAssets = v3->_locked_recycledAssets;
    v3->_locked_recycledAssets = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    locked_recycledClassifications = v3->_locked_recycledClassifications;
    v3->_locked_recycledClassifications = (NSMutableArray *)v6;
  }
  return v3;
}

- (id)_dequeueRecylableClassification
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableArray *)self->_locked_recycledClassifications lastObject];
  if (v4) {
    [(NSMutableArray *)self->_locked_recycledClassifications removeLastObject];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_dequeueRecylableAsset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableArray *)self->_locked_recycledAssets lastObject];
  if (v4) {
    [(NSMutableArray *)self->_locked_recycledAssets removeLastObject];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

@end