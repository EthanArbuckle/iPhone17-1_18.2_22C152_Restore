@interface PUSwipeSelectionManager
- (CGPoint)screenTouchLocation;
- (NSIndexPath)_startingIndexPath;
- (PUPhotoSelectionManager)_restorePhotoSelectionManager;
- (PUSwipeSelectionManager)init;
- (PUSwipeSelectionManager)initWithSelectionMode:(int64_t)a3 photoSelectionManager:(id)a4;
- (PUSwipeSelectionManagerDataSource)datasource;
- (PUSwipeSelectionManagerDelegate)delegate;
- (PXUIAutoScroller)selectionAutoScroller;
- (id)_indexesPathsRangeForIndexPath:(id)a3;
- (id)_pausingChangesToken;
- (int64_t)_selectionMode;
- (int64_t)_selectionModeForRestoringStateOfIndexPath:(id)a3;
- (void)_setPausingChangesToken:(id)a3;
- (void)_setRestorePhotoSelectionManager:(id)a3;
- (void)_setSelectionMode:(int64_t)a3;
- (void)_setStartingIndexPath:(id)a3;
- (void)beginSelectionFromIndexPath:(id)a3;
- (void)dealloc;
- (void)endSelection;
- (void)setDatasource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScreenTouchLocation:(CGPoint)a3;
- (void)setSelectionAutoScroller:(id)a3;
- (void)updateSelectionWithCurrentIndexPath:(id)a3 leftClosestIndexPath:(id)a4 aboveClosestIndexPath:(id)a5;
@end

@implementation PUSwipeSelectionManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->__pausingChangesToken, 0);
  objc_storeStrong((id *)&self->__restorePhotoSelectionManager, 0);
  objc_storeStrong((id *)&self->__startingIndexPath, 0);
  objc_storeStrong((id *)&self->_selectionAutoScroller, 0);
  objc_destroyWeak((id *)&self->_datasource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oldIndexesPaths, 0);
}

- (void)_setPausingChangesToken:(id)a3
{
}

- (id)_pausingChangesToken
{
  return self->__pausingChangesToken;
}

- (void)_setRestorePhotoSelectionManager:(id)a3
{
}

- (PUPhotoSelectionManager)_restorePhotoSelectionManager
{
  return self->__restorePhotoSelectionManager;
}

- (void)_setStartingIndexPath:(id)a3
{
}

- (NSIndexPath)_startingIndexPath
{
  return self->__startingIndexPath;
}

- (void)_setSelectionMode:(int64_t)a3
{
  self->__selectionMode = a3;
}

- (int64_t)_selectionMode
{
  return self->__selectionMode;
}

- (void)setScreenTouchLocation:(CGPoint)a3
{
  self->_screenTouchLocation = a3;
}

- (CGPoint)screenTouchLocation
{
  double x = self->_screenTouchLocation.x;
  double y = self->_screenTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSelectionAutoScroller:(id)a3
{
}

- (PXUIAutoScroller)selectionAutoScroller
{
  return self->_selectionAutoScroller;
}

- (void)setDatasource:(id)a3
{
}

- (PUSwipeSelectionManagerDataSource)datasource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  return (PUSwipeSelectionManagerDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PUSwipeSelectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSwipeSelectionManagerDelegate *)WeakRetained;
}

- (void)updateSelectionWithCurrentIndexPath:(id)a3 leftClosestIndexPath:(id)a4 aboveClosestIndexPath:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  v12 = [(PUSwipeSelectionManager *)self _startingIndexPath];

  if (!v12)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PUSwipeSelectionManager.m" lineNumber:148 description:@"Starting indexPath should be set"];
  }
  if (v9 | v10 || v11)
  {
    if (v9 | v10)
    {
      if (v9) {
        v13 = (void *)v9;
      }
      else {
        v13 = (void *)v10;
      }
      id v14 = v13;
LABEL_10:
      v15 = [(PUSwipeSelectionManager *)self _indexesPathsRangeForIndexPath:v14];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      oldIndexesPaths = self->_oldIndexesPaths;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke;
      v34[3] = &unk_1E5F2C1D0;
      v18 = v15;
      v35 = v18;
      v36 = self;
      id v37 = v16;
      SEL v38 = a2;
      id v19 = v16;
      [(NSMutableDictionary *)oldIndexesPaths enumerateKeysAndObjectsUsingBlock:v34];
      v20 = self->_oldIndexesPaths;
      self->_oldIndexesPaths = v18;
      v21 = v18;

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_3;
      v33[3] = &unk_1E5F2C1F8;
      v33[4] = self;
      [(NSMutableDictionary *)v21 enumerateKeysAndObjectsUsingBlock:v33];
      int64_t v22 = [(PUSwipeSelectionManager *)self _selectionMode];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_4;
      v32[3] = &unk_1E5F2C220;
      v32[4] = self;
      v32[5] = v22 == 0;
      [v19 enumerateKeysAndObjectsUsingBlock:v32];

      goto LABEL_19;
    }
    if (!v11) {
      goto LABEL_19;
    }
    v23 = [(PUSwipeSelectionManager *)self _startingIndexPath];
    uint64_t v24 = [v23 compare:v11];

    if (v24 != 1)
    {
      if (v24 != -1) {
        goto LABEL_19;
      }
      uint64_t v25 = [v11 copy];
      goto LABEL_18;
    }
    uint64_t v26 = [v11 section];
    v27 = [(PUSwipeSelectionManager *)self _startingIndexPath];
    uint64_t v28 = [v27 section];

    if (v26 < v28)
    {
      v29 = [(PUSwipeSelectionManager *)self datasource];
      uint64_t v30 = objc_msgSend(v29, "swipeSelectionManager:numberOfItemsInSection:", self, objc_msgSend(v11, "section") + 1);

      if (v30 >= 1)
      {
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v11, "section") + 1);
LABEL_18:
        id v14 = (id)v25;
        if (!v25) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_19:
}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_2;
  v11[3] = &unk_1E5F2C1A8;
  id v12 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v10;
  long long v15 = v10;
  id v9 = v5;
  [a3 enumerateIndexesUsingBlock:v11];
}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  id v7 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v7, "swipeSelectionManager:updatePhotoSelectionWithIndexes:inSection:selectionMode:", *(void *)(a1 + 32), v5, v6, objc_msgSend(*(id *)(a1 + 32), "_selectionMode"));
}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 swipeSelectionManager:*(void *)(a1 + 32) updatePhotoSelectionWithIndexes:v5 inSection:v6 selectionMode:*(void *)(a1 + 40)];
}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "pu_containsIndexPath:") & 1) == 0)
  {
    uint64_t v3 = [v13 item];
    v4 = [*(id *)(a1 + 48) datasource];
    uint64_t v5 = objc_msgSend(v4, "swipeSelectionManager:numberOfItemsInSection:", *(void *)(a1 + 48), objc_msgSend(v13, "section"));

    if (v3 >= v5)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 48) file:@"PUSwipeSelectionManager.m" lineNumber:188 description:@"IndexPath should still be valid"];
    }
    uint64_t v6 = [*(id *)(a1 + 48) _selectionModeForRestoringStateOfIndexPath:v13];
    if (v6 != [*(id *)(a1 + 48) _selectionMode])
    {
      id v7 = *(void **)(a1 + 56);
      id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "section"));
      id v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        objc_msgSend(v9, "addIndex:", objc_msgSend(v13, "item"));
      }
      else
      {
        id v9 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndex:", objc_msgSend(v13, "item"));
        long long v10 = *(void **)(a1 + 56);
        id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "section"));
        [v10 setObject:v9 forKeyedSubscript:v11];
      }
    }
  }
}

- (void)endSelection
{
  selectionAutoScroller = self->_selectionAutoScroller;
  if (selectionAutoScroller) {
    [(PXUIAutoScroller *)selectionAutoScroller stop];
  }
  v4 = [(PUSwipeSelectionManager *)self _pausingChangesToken];

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [(PUSwipeSelectionManager *)self _pausingChangesToken];
    objc_msgSend(v6, "px_endPausingChanges:", v5);

    [(PUSwipeSelectionManager *)self _setPausingChangesToken:0];
  }
}

- (void)beginSelectionFromIndexPath:(id)a3
{
  [(PUSwipeSelectionManager *)self _setStartingIndexPath:a3];
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "px_beginPausingChangesWithTimeout:identifier:", @"PUSwipeSelectionManager", 60.0);
  [(PUSwipeSelectionManager *)self _setPausingChangesToken:v4];
}

- (int64_t)_selectionModeForRestoringStateOfIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSwipeSelectionManager *)self datasource];
  id v6 = objc_msgSend(v5, "swipeSelectionManager:photoCollectionAtIndex:", self, objc_msgSend(v4, "section"));

  id v7 = [(PUSwipeSelectionManager *)self _restorePhotoSelectionManager];
  uint64_t v8 = [v4 item];

  LODWORD(v4) = [v7 isAssetAtIndexSelected:v8 inAssetCollection:v6];
  return v4 ^ 1;
}

- (id)_indexesPathsRangeForIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(PUSwipeSelectionManager *)self _startingIndexPath];

  if (!v6)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PUSwipeSelectionManager.m" lineNumber:68 description:@"Starting indexPath should be set"];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [(PUSwipeSelectionManager *)self _startingIndexPath];
  uint64_t v9 = [v8 compare:v5];

  if (v9 == 1)
  {
    SEL v33 = a2;
    uint64_t v11 = [v5 section];
    uint64_t v13 = [v5 item];
    id v16 = [(PUSwipeSelectionManager *)self _startingIndexPath];
    uint64_t v14 = [v16 section];

    [(PUSwipeSelectionManager *)self _startingIndexPath];
    v18 = id v17 = v5;
    uint64_t v15 = [v18 item];

    id v5 = v17;
  }
  else
  {
    if (v9 && v9 != -1)
    {
      uint64_t v11 = 0;
      uint64_t v13 = 0;
      uint64_t v15 = 0;
      goto LABEL_21;
    }
    SEL v33 = a2;
    long long v10 = [(PUSwipeSelectionManager *)self _startingIndexPath];
    uint64_t v11 = [v10 section];

    id v12 = [(PUSwipeSelectionManager *)self _startingIndexPath];
    uint64_t v13 = [v12 item];

    uint64_t v14 = [v5 section];
    uint64_t v15 = [v5 item];
  }
  if (v11 >= v14)
  {
    if (v11 == v14)
    {
      uint64_t v11 = v14;
    }
    else
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:v33 object:self file:@"PUSwipeSelectionManager.m" lineNumber:109 description:@"Must be same section"];
    }
  }
  else
  {
    id v32 = v5;
    do
    {
      id v19 = [(PUSwipeSelectionManager *)self datasource];

      if (!v19)
      {
        uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:v33 object:self file:@"PUSwipeSelectionManager.m" lineNumber:98 description:@"Datasource should be set"];
      }
      v20 = [(PUSwipeSelectionManager *)self datasource];
      uint64_t v21 = [v20 swipeSelectionManager:self numberOfItemsInSection:v11];

      if (v21)
      {
        BOOL v22 = v21 < v13;
        uint64_t v23 = v21 - v13;
        if (!v22)
        {
          uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v13, v23);
          uint64_t v25 = [NSNumber numberWithInteger:v11];
          [v7 setObject:v24 forKeyedSubscript:v25];
        }
      }
      uint64_t v13 = 0;
      ++v11;
    }
    while (v14 != v11);
    uint64_t v11 = v14;
    id v5 = v32;
  }
LABEL_21:
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v13, v15 - v13 + 1);
  uint64_t v28 = [NSNumber numberWithInteger:v11];
  [v7 setObject:v27 forKeyedSubscript:v28];

  return v7;
}

- (void)dealloc
{
  selectionAutoScroller = self->_selectionAutoScroller;
  if (selectionAutoScroller) {
    [(PXUIAutoScroller *)selectionAutoScroller stop];
  }
  id v4 = [(PUSwipeSelectionManager *)self _pausingChangesToken];

  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v6 = [(PUSwipeSelectionManager *)self _pausingChangesToken];
    objc_msgSend(v5, "px_endPausingChanges:", v6);

    [(PUSwipeSelectionManager *)self _setPausingChangesToken:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)PUSwipeSelectionManager;
  [(PUSwipeSelectionManager *)&v7 dealloc];
}

- (PUSwipeSelectionManager)initWithSelectionMode:(int64_t)a3 photoSelectionManager:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUSwipeSelectionManager;
  objc_super v7 = [(PUSwipeSelectionManager *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->__selectionMode = a3;
    uint64_t v9 = [v6 copy];
    restorePhotoSelectionManager = v8->__restorePhotoSelectionManager;
    v8->__restorePhotoSelectionManager = (PUPhotoSelectionManager *)v9;
  }
  return v8;
}

- (PUSwipeSelectionManager)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Must use initWithStartingIndexPath:mode:photoSelectionManager:" userInfo:0];
  objc_exception_throw(v2);
}

@end