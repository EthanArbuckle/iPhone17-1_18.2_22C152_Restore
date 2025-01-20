@interface PUPhotosGridBarsHelper
- (BOOL)_hadSelectionOnLastUpdate;
- (BOOL)_isUpdatingItemsWithCount;
- (BOOL)_needsUpdate;
- (BOOL)_shouldUpdateBarItemsLazily;
- (BOOL)_shouldUpdateItemsWithCount;
- (BOOL)isSwipeSelecting;
- (BOOL)shouldHideBackButton;
- (NSArray)leftBarButtonItems;
- (NSArray)rightBarButtonItems;
- (NSString)prompt;
- (NSString)title;
- (OS_dispatch_queue)_queue;
- (PUPhotoSelectionManager)_photoSelectionManager;
- (PUPhotosGridBarsHelper)init;
- (PUPhotosGridBarsHelperDelegate)delegate;
- (void)_handleItemsWithCountUpdateWithTitle:(id)a3 shouldReloadAllItems:(BOOL)a4;
- (void)_invalidateBarItems;
- (void)_invalidatePhotoSelectionManager;
- (void)_invalidateShouldUpdateBarItemsLazily;
- (void)_notifyBarItemsDidChange;
- (void)_setHadSelectionOnLastUpdate:(BOOL)a3;
- (void)_setLeftBarButtonItems:(id)a3;
- (void)_setPhotoSelectionManager:(id)a3;
- (void)_setPrompt:(id)a3;
- (void)_setRightBarButtonItems:(id)a3;
- (void)_setShouldHideBackButton:(BOOL)a3;
- (void)_setShouldUpdateBarItemsLazily:(BOOL)a3;
- (void)_setShouldUpdateItemsWithCount:(BOOL)a3;
- (void)_setTitle:(id)a3;
- (void)_setUpdatingItemsWithCount:(BOOL)a3;
- (void)_startUpdatingItemsWithCountIfNeeded;
- (void)_stopUpdatingItemsWithCount;
- (void)_updateAllBarItems;
- (void)_updateBarItemsIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateItemsWithCountInBackgroundWithDelegate:(id)a3 photoSelectionManagerSnapshot:(id)a4;
- (void)_updatePhotoSelectionManagerIfNeeded;
- (void)_updateShouldUpdateBarItemsLazilyIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setSwipeSelecting:(BOOL)a3;
@end

@implementation PUPhotosGridBarsHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue, 0);
  objc_storeStrong((id *)&self->__photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setHadSelectionOnLastUpdate:(BOOL)a3
{
  self->__hadSelectionOnLastUpdate = a3;
}

- (BOOL)_hadSelectionOnLastUpdate
{
  return self->__hadSelectionOnLastUpdate;
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (void)_setShouldUpdateItemsWithCount:(BOOL)a3
{
  self->__shouldUpdateItemsWithCount = a3;
}

- (BOOL)_shouldUpdateItemsWithCount
{
  return self->__shouldUpdateItemsWithCount;
}

- (void)_setUpdatingItemsWithCount:(BOOL)a3
{
  self->__updatingItemsWithCount = a3;
}

- (BOOL)_isUpdatingItemsWithCount
{
  return self->__updatingItemsWithCount;
}

- (BOOL)_shouldUpdateBarItemsLazily
{
  return self->__shouldUpdateBarItemsLazily;
}

- (PUPhotoSelectionManager)_photoSelectionManager
{
  return self->__photoSelectionManager;
}

- (void)_setRightBarButtonItems:(id)a3
{
}

- (void)_setLeftBarButtonItems:(id)a3
{
}

- (void)_setShouldHideBackButton:(BOOL)a3
{
  self->_shouldHideBackButton = a3;
}

- (void)_setPrompt:(id)a3
{
}

- (void)_setTitle:(id)a3
{
}

- (BOOL)isSwipeSelecting
{
  return self->_swipeSelecting;
}

- (PUPhotosGridBarsHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotosGridBarsHelperDelegate *)WeakRetained;
}

- (void)_handleItemsWithCountUpdateWithTitle:(id)a3 shouldReloadAllItems:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(PUPhotosGridBarsHelper *)self _shouldUpdateBarItemsLazily])
  {
    if (v4) {
      [(PUPhotosGridBarsHelper *)self _updateAllBarItems];
    }
    else {
      [(PUPhotosGridBarsHelper *)self _setTitle:v6];
    }
    [(PUPhotosGridBarsHelper *)self _notifyBarItemsDidChange];
  }
  [(PUPhotosGridBarsHelper *)self _setUpdatingItemsWithCount:0];
  [(PUPhotosGridBarsHelper *)self _startUpdatingItemsWithCountIfNeeded];
}

- (void)_updateItemsWithCountInBackgroundWithDelegate:(id)a3 photoSelectionManagerSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PUPhotosGridBarsHelper *)self _hadSelectionOnLastUpdate];
  uint64_t v9 = [v7 isAnyAssetSelected];
  [(PUPhotosGridBarsHelper *)self _setHadSelectionOnLastUpdate:v9];
  int v10 = v9 & v8;
  if (v10 == 1)
  {
    v11 = [v6 photosGridBarsHelper:self titleForPhotoSelectionManager:v7];
  }
  else
  {
    v11 = 0;
  }
  objc_initWeak(&location, self);
  id v12 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v14, &location);
  id v13 = v11;
  char v15 = v10 ^ 1;
  pl_dispatch_async();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __102__PUPhotosGridBarsHelper__updateItemsWithCountInBackgroundWithDelegate_photoSelectionManagerSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleItemsWithCountUpdateWithTitle:*(void *)(a1 + 32) shouldReloadAllItems:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_stopUpdatingItemsWithCount
{
  [(PUPhotosGridBarsHelper *)self _setShouldUpdateItemsWithCount:0];
  objc_initWeak(&location, self);
  v3 = [(PUPhotosGridBarsHelper *)self _queue];
  objc_copyWeak(&v4, &location);
  pl_dispatch_async();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __53__PUPhotosGridBarsHelper__stopUpdatingItemsWithCount__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setHadSelectionOnLastUpdate:0];
}

- (void)_startUpdatingItemsWithCountIfNeeded
{
  if ([(PUPhotosGridBarsHelper *)self _shouldUpdateItemsWithCount])
  {
    if (![(PUPhotosGridBarsHelper *)self _isUpdatingItemsWithCount])
    {
      [(PUPhotosGridBarsHelper *)self _setShouldUpdateItemsWithCount:0];
      [(PUPhotosGridBarsHelper *)self _setUpdatingItemsWithCount:1];
      v3 = [(PUPhotosGridBarsHelper *)self delegate];
      id v4 = [(PUPhotosGridBarsHelper *)self _photoSelectionManager];
      v5 = (void *)[v4 copy];

      objc_initWeak(&location, self);
      id v6 = [(PUPhotosGridBarsHelper *)self _queue];
      objc_copyWeak(&v9, &location);
      id v7 = v3;
      id v8 = v5;
      pl_dispatch_async();

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __62__PUPhotosGridBarsHelper__startUpdatingItemsWithCountIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateItemsWithCountInBackgroundWithDelegate:*(void *)(a1 + 32) photoSelectionManagerSnapshot:*(void *)(a1 + 40)];
}

- (void)_updateAllBarItems
{
  unsigned __int8 v16 = 0;
  v3 = [(PUPhotosGridBarsHelper *)self delegate];
  id v14 = 0;
  char v15 = 0;
  id v12 = 0;
  id v13 = 0;
  id v4 = [(PUPhotosGridBarsHelper *)self _photoSelectionManager];
  [v3 photosGridBarsHelper:self getTitle:&v15 prompt:&v14 shouldHideBackButton:&v16 leftBarButtonItems:&v13 rightBarButtonItems:&v12 forPhotoSelectionManager:v4];
  v5 = v14;
  id v6 = v15;
  id v7 = v13;
  id v8 = v12;
  id v9 = v7;
  id v10 = v5;
  id v11 = v6;

  [(PUPhotosGridBarsHelper *)self _setTitle:v11];
  [(PUPhotosGridBarsHelper *)self _setPrompt:v10];
  [(PUPhotosGridBarsHelper *)self _setShouldHideBackButton:v16];
  [(PUPhotosGridBarsHelper *)self _setLeftBarButtonItems:v9];
  [(PUPhotosGridBarsHelper *)self _setRightBarButtonItems:v8];
}

- (void)_updateBarItemsIfNeeded
{
  if (self->_needsUpdateFlags.barItems)
  {
    self->_needsUpdateFlags.barItems = 0;
    if ([(PUPhotosGridBarsHelper *)self _shouldUpdateBarItemsLazily])
    {
      [(PUPhotosGridBarsHelper *)self _setShouldUpdateItemsWithCount:1];
      [(PUPhotosGridBarsHelper *)self _startUpdatingItemsWithCountIfNeeded];
    }
    else
    {
      [(PUPhotosGridBarsHelper *)self _updateAllBarItems];
    }
  }
}

- (void)_invalidateBarItems
{
  self->_needsUpdateFlags.barItems = 1;
  [(PUPhotosGridBarsHelper *)self _setNeedsUpdate];
}

- (void)_updateShouldUpdateBarItemsLazilyIfNeeded
{
  if (self->_needsUpdateFlags.shouldUpdateBarItemsLazily)
  {
    self->_needsUpdateFlags.shouldUpdateBarItemsLazily = 0;
    BOOL v3 = [(PUPhotosGridBarsHelper *)self isSwipeSelecting];
    [(PUPhotosGridBarsHelper *)self _setShouldUpdateBarItemsLazily:v3];
  }
}

- (void)_invalidateShouldUpdateBarItemsLazily
{
  self->_needsUpdateFlags.shouldUpdateBarItemsLazily = 1;
  [(PUPhotosGridBarsHelper *)self _setNeedsUpdate];
}

- (void)_updatePhotoSelectionManagerIfNeeded
{
  if (self->_needsUpdateFlags.photoSelectionManager)
  {
    self->_needsUpdateFlags.photoSelectionManager = 0;
    BOOL v3 = [(PUPhotosGridBarsHelper *)self delegate];
    id v4 = [v3 photosGridBarsHelperPhotoSelectionManager:self];

    [(PUPhotosGridBarsHelper *)self _setPhotoSelectionManager:v4];
  }
}

- (void)_invalidatePhotoSelectionManager
{
  self->_needsUpdateFlags.photoSelectionManager = 1;
  [(PUPhotosGridBarsHelper *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.photoSelectionManager
      || self->_needsUpdateFlags.shouldUpdateBarItemsLazily
      || self->_needsUpdateFlags.barItems;
}

- (void)_updateIfNeeded
{
  if ([(PUPhotosGridBarsHelper *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PUPhotosGridBarsHelper *)self _updatePhotoSelectionManagerIfNeeded];
    [(PUPhotosGridBarsHelper *)self _updateShouldUpdateBarItemsLazilyIfNeeded];
    [(PUPhotosGridBarsHelper *)self _updateBarItemsIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_notifyBarItemsDidChange
{
  id v3 = [(PUPhotosGridBarsHelper *)self delegate];
  [v3 photosGridBarsHelper:self didChange:1];
}

- (void)_setShouldUpdateBarItemsLazily:(BOOL)a3
{
  if (self->__shouldUpdateBarItemsLazily != a3)
  {
    self->__shouldUpdateBarItemsLazily = a3;
    if (!a3)
    {
      [(PUPhotosGridBarsHelper *)self _notifyBarItemsDidChange];
      [(PUPhotosGridBarsHelper *)self _stopUpdatingItemsWithCount];
      [(PUPhotosGridBarsHelper *)self _invalidateBarItems];
    }
  }
}

- (void)_setPhotoSelectionManager:(id)a3
{
  v5 = (PUPhotoSelectionManager *)a3;
  photoSelectionManager = self->__photoSelectionManager;
  if (photoSelectionManager != v5)
  {
    id v7 = v5;
    [(PUPhotoSelectionManager *)photoSelectionManager unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->__photoSelectionManager, a3);
    [(PUPhotoSelectionManager *)self->__photoSelectionManager registerChangeObserver:self];
    [(PUPhotosGridBarsHelper *)self _invalidateBarItems];
    v5 = v7;
  }
}

- (NSArray)rightBarButtonItems
{
  [(PUPhotosGridBarsHelper *)self _updateIfNeeded];
  rightBarButtonItems = self->_rightBarButtonItems;
  return rightBarButtonItems;
}

- (NSArray)leftBarButtonItems
{
  [(PUPhotosGridBarsHelper *)self _updateIfNeeded];
  leftBarButtonItems = self->_leftBarButtonItems;
  return leftBarButtonItems;
}

- (BOOL)shouldHideBackButton
{
  return self->_shouldHideBackButton;
}

- (NSString)prompt
{
  [(PUPhotosGridBarsHelper *)self _updateIfNeeded];
  prompt = self->_prompt;
  return prompt;
}

- (NSString)title
{
  [(PUPhotosGridBarsHelper *)self _updateIfNeeded];
  title = self->_title;
  return title;
}

- (void)setSwipeSelecting:(BOOL)a3
{
  if (self->_swipeSelecting != a3)
  {
    self->_swipeSelecting = a3;
    [(PUPhotosGridBarsHelper *)self _invalidateShouldUpdateBarItemsLazily];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PUPhotosGridBarsHelper *)self _invalidatePhotoSelectionManager];
    v5 = obj;
  }
}

- (PUPhotosGridBarsHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridBarsHelper;
  v2 = [(PUPhotosGridBarsHelper *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PUPhotosGridBarsHelper", v3);
    queue = v2->__queue;
    v2->__queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end