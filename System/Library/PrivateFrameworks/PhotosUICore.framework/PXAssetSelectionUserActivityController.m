@interface PXAssetSelectionUserActivityController
- (BOOL)hasSelection;
- (BOOL)isActive;
- (NSUserActivity)currentUserActivity;
- (PXAssetSelectionUserActivityController)init;
- (PXAssetSelectionUserActivityController)initWithSelectionManager:(id)a3;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (void)_updateActivity;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setActive:(BOOL)a3;
- (void)setCurrentUserActivity:(id)a3;
- (void)setHasSelection:(BOOL)a3;
- (void)setSelectionManager:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)userActivityWillSave:(id)a3;
@end

@implementation PXAssetSelectionUserActivityController

- (PXAssetSelectionUserActivityController)initWithSelectionManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXAssetSelectionUserActivityController;
  v5 = [(PXAssetSelectionUserActivityController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_snapshotLock._os_unfair_lock_opaque = 0;
    [(PXAssetSelectionUserActivityController *)v5 setSelectionManager:v4];
  }

  return v6;
}

- (void)setSelectionManager:(id)a3
{
  v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->_selectionManager;
  if (selectionManager != v5)
  {
    objc_super v8 = v5;
    [(PXSectionedSelectionManager *)selectionManager unregisterChangeObserver:self context:SelectionManagerObservationContext_142276];
    objc_storeStrong((id *)&self->_selectionManager, a3);
    [(PXSectionedSelectionManager *)self->_selectionManager registerChangeObserver:self context:SelectionManagerObservationContext_142276];
    v7 = [(PXSectionedSelectionManager *)self->_selectionManager selectionSnapshot];
    [(PXAssetSelectionUserActivityController *)self setSelectionSnapshot:v7];

    v5 = v8;
  }
}

- (void)_updateActivity
{
  if ([(PXAssetSelectionUserActivityController *)self isActive]
    && [(PXAssetSelectionUserActivityController *)self hasSelection])
  {
    v3 = [(PXAssetSelectionUserActivityController *)self currentUserActivity];

    if (!v3)
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mobileslideshow.assetselection"];
      [v6 setEligibleForHandoff:0];
      [v6 setDelegate:self];
      [v6 becomeCurrent];
      [(PXAssetSelectionUserActivityController *)self setCurrentUserActivity:v6];
    }
  }
  else
  {
    id v4 = [(PXAssetSelectionUserActivityController *)self currentUserActivity];

    if (v4)
    {
      v5 = [(PXAssetSelectionUserActivityController *)self currentUserActivity];
      [v5 resignCurrent];

      [(PXAssetSelectionUserActivityController *)self setCurrentUserActivity:0];
    }
  }
}

- (void)setSelectionSnapshot:(id)a3
{
  v9 = (PXSelectionSnapshot *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetSelectionUserActivityController.m", 72, @"%s must be called on the main thread", "-[PXAssetSelectionUserActivityController setSelectionSnapshot:]");
  }
  BOOL v6 = [(PXAssetSelectionUserActivityController *)self hasSelection];
  os_unfair_lock_lock(&self->_snapshotLock);
  if (self->_selectionSnapshot != v9)
  {
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    v7 = [(PXSelectionSnapshot *)v9 selectedIndexPaths];
    BOOL v6 = [v7 itemCount] > 0;
  }
  os_unfair_lock_unlock(&self->_snapshotLock);
  [(PXAssetSelectionUserActivityController *)self setHasSelection:v6];
}

- (BOOL)hasSelection
{
  return self->_hasSelection;
}

- (void)setHasSelection:(BOOL)a3
{
  if (self->_hasSelection != a3)
  {
    self->_hasSelection = a3;
    [(PXAssetSelectionUserActivityController *)self _updateActivity];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSUserActivity)currentUserActivity
{
  return self->_currentUserActivity;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(PXAssetSelectionUserActivityController *)self _updateActivity];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)SelectionManagerObservationContext_142276 != a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXAssetSelectionUserActivityController.m" lineNumber:123 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v13 = v9;
    v10 = [(PXAssetSelectionUserActivityController *)self selectionManager];
    v11 = [v10 selectionSnapshot];
    [(PXAssetSelectionUserActivityController *)self setSelectionSnapshot:v11];

    id v9 = v13;
  }
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

- (void)setCurrentUserActivity:(id)a3
{
}

- (void)userActivityWillSave:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(PXAssetSelectionUserActivityController *)self selectionSnapshot];
  v7 = [v6 dataSource];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v22);
    v23 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXAssetSelectionUserActivityController.m", 132, @"%@ should be an instance inheriting from %@, but it is %@", @"currentSelection.dataSource", v21, v23 object file lineNumber description];
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXAssetSelectionUserActivityController.m", 132, @"%@ should be an instance inheriting from %@, but it is nil", @"currentSelection.dataSource", v21 object file lineNumber description];
  }

LABEL_3:
  objc_super v8 = [v6 selectedIndexPaths];
  id v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = [v8 itemCount];
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Selection user activity has been requested with %lu assets selected", buf, 0xCu);
  }

  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "itemCount"));
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__PXAssetSelectionUserActivityController_userActivityWillSave___block_invoke;
  v24[3] = &unk_1E5DCA3B8;
  id v11 = v7;
  id v25 = v11;
  id v12 = v10;
  id v26 = v12;
  [v8 enumerateItemIndexPathsUsingBlock:v24];
  id v13 = [v5 userInfo];
  v14 = (void *)[v13 mutableCopy];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v17 = v16;

  v18 = (void *)[v12 copy];
  [v17 setObject:v18 forKeyedSubscript:@"selectedUUIDs"];

  [v5 setUserInfo:v17];
}

void __63__PXAssetSelectionUserActivityController_userActivityWillSave___block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  id v5 = [v3 assetAtItemIndexPath:v8];
  char v6 = *(void **)(a1 + 40);
  v7 = [v5 uuid];
  [v6 addObject:v7];
}

- (PXSelectionSnapshot)selectionSnapshot
{
  p_snapshotLock = &self->_snapshotLock;
  os_unfair_lock_lock(&self->_snapshotLock);
  long long v4 = self->_selectionSnapshot;
  os_unfair_lock_unlock(p_snapshotLock);
  return v4;
}

- (void)dealloc
{
  v3 = [(PXAssetSelectionUserActivityController *)self currentUserActivity];
  [v3 resignCurrent];

  [(PXAssetSelectionUserActivityController *)self setCurrentUserActivity:0];
  v4.receiver = self;
  v4.super_class = (Class)PXAssetSelectionUserActivityController;
  [(PXAssetSelectionUserActivityController *)&v4 dealloc];
}

- (PXAssetSelectionUserActivityController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetSelectionUserActivityController.m", 44, @"%s is not available as initializer", "-[PXAssetSelectionUserActivityController init]");

  abort();
}

@end