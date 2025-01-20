@interface PUTileHider
- (NSMutableDictionary)_hiddenTileControllersByLayoutInfo;
- (PUTileHider)init;
- (PUTileHider)initWithTilingView:(id)a3;
- (PUTilingView)tilingView;
- (double)_animationDuration;
- (void)dealloc;
- (void)hideTilesAtIndexPath:(id)a3 withKinds:(id)a4 dataSourceIdentifier:(id)a5 animated:(BOOL)a6;
- (void)reattachTiles;
- (void)unhideTilesAnimated:(BOOL)a3;
@end

@implementation PUTileHider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hiddenTileControllersByLayoutInfo, 0);
  objc_storeStrong((id *)&self->_tilingView, 0);
}

- (double)_animationDuration
{
  return self->__animationDuration;
}

- (NSMutableDictionary)_hiddenTileControllersByLayoutInfo
{
  return self->__hiddenTileControllersByLayoutInfo;
}

- (PUTilingView)tilingView
{
  return self->_tilingView;
}

- (void)reattachTiles
{
  id v5 = [(PUTileHider *)self _hiddenTileControllersByLayoutInfo];
  v3 = [v5 allValues];
  v4 = [(PUTileHider *)self tilingView];
  [v4 reattachTileControllers:v3 withContext:0];

  [v5 removeAllObjects];
}

- (void)unhideTilesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUTileHider *)self tilingView];
  v6 = [v5 tileAnimator];
  v7 = [(PUTileHider *)self _hiddenTileControllersByLayoutInfo];
  if (v3)
  {
    v8 = objc_alloc_init(PUTileAnimationOptions);
    [(PUTileHider *)self _animationDuration];
    -[PUTileAnimationOptions setDuration:](v8, "setDuration:");
  }
  else
  {
    v8 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__PUTileHider_unhideTilesAnimated___block_invoke;
  v12[3] = &unk_1E5F2C570;
  id v13 = v6;
  v14 = v8;
  id v15 = v5;
  id v9 = v5;
  v10 = v8;
  id v11 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
  [v7 removeAllObjects];
}

void __35__PUTileHider_unhideTilesAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__PUTileHider_unhideTilesAnimated___block_invoke_2;
  v9[3] = &unk_1E5F2ECC8;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v8 = v5;
  [v6 animateTileController:v8 toLayoutInfo:a2 withOptions:v7 completionHandler:v9];
}

void __35__PUTileHider_unhideTilesAnimated___block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 reattachTileControllers:v2 withContext:0];
}

- (void)hideTilesAtIndexPath:(id)a3 withKinds:(id)a4 dataSourceIdentifier:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(PUTileHider *)self tilingView];
  v26 = [v13 tileAnimator];
  v24 = [(PUTileHider *)self _hiddenTileControllersByLayoutInfo];
  if (v6)
  {
    v14 = objc_alloc_init(PUTileAnimationOptions);
    [(PUTileHider *)self _animationDuration];
    v25 = v14;
    -[PUTileAnimationOptions setDuration:](v14, "setDuration:");
  }
  else
  {
    v25 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [v13 presentedTileControllerWithIndexPath:v10 kind:*(void *)(*((void *)&v27 + 1) + 8 * v19) dataSourceIdentifier:v12];
        if (v20)
        {
          v21 = [v13 freezeTileController:v20];
          if (([v20 isDetached] & 1) == 0)
          {
            [v24 setObject:v20 forKey:v21];
            v31 = v20;
            v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
            [v13 detachTileControllers:v22];
          }
          v23 = [v21 layoutInfoWithAlpha:0.0];
          [v26 animateTileController:v20 toLayoutInfo:v23 withOptions:v25 completionHandler:0];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)dealloc
{
  if ([(NSMutableDictionary *)self->__hiddenTileControllersByLayoutInfo count])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PUTileHider.m", 38, @"tile hider deallocated while tiles are still hidden %@", self->__hiddenTileControllersByLayoutInfo object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)PUTileHider;
  [(PUTileHider *)&v5 dealloc];
}

- (PUTileHider)initWithTilingView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUTileHider;
  BOOL v6 = [(PUTileHider *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tilingView, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    hiddenTileControllersByLayoutInfo = v7->__hiddenTileControllersByLayoutInfo;
    v7->__hiddenTileControllersByLayoutInfo = (NSMutableDictionary *)v8;

    v7->__animationDuration = 0.2;
  }

  return v7;
}

- (PUTileHider)init
{
  return [(PUTileHider *)self initWithTilingView:0];
}

@end