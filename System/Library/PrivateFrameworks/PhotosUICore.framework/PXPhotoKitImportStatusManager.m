@interface PXPhotoKitImportStatusManager
- (BOOL)supportsStateSimulation;
- (PXPhotoKitImportStatusManager)init;
- (id)initAllowingSimulation:(BOOL)a3;
- (int64_t)_simulatedStateForAsset:(id)a3;
- (int64_t)importStateForAsset:(id)a3;
- (void)_notifySimulationObserversForAssetReference:(id)a3;
- (void)addAssetImportStatusObserver:(id)a3;
- (void)beginSimulatedImportForAssetReference:(id)a3;
- (void)completeSimulatedImportForAssetReference:(id)a3 withSuccess:(BOOL)a4;
- (void)removeAssetImportStatusObserver:(id)a3;
@end

@implementation PXPhotoKitImportStatusManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedStateByAssetID, 0);
  objc_storeStrong((id *)&self->_statusObservers, 0);
}

- (BOOL)supportsStateSimulation
{
  return self->_supportsStateSimulation;
}

- (void)removeAssetImportStatusObserver:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitImportStatusManager.m", 119, @"%s must be called on the main thread", "-[PXPhotoKitImportStatusManager removeAssetImportStatusObserver:]");
  }
  [(NSHashTable *)self->_statusObservers removeObject:v6];
}

- (void)addAssetImportStatusObserver:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitImportStatusManager.m", 114, @"%s must be called on the main thread", "-[PXPhotoKitImportStatusManager addAssetImportStatusObserver:]");
  }
  [(NSHashTable *)self->_statusObservers addObject:v6];
}

- (int64_t)_simulatedStateForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 106, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v12 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 106, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v12, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  id v6 = [v5 localIdentifier];
  v7 = [(NSMutableDictionary *)self->_simulatedStateByAssetID objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

- (void)completeSimulatedImportForAssetReference:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v17 = v7;
  if (!self->_supportsStateSimulation)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 94, @"Invalid parameter not satisfying: %@", @"_supportsStateSimulation" object file lineNumber description];

    id v7 = v17;
  }
  int64_t v8 = [v7 asset];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 97, @"%@ should be an instance inheriting from %@, but it is %@", @"assetReference.asset", v14, v16 object file lineNumber description];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 97, @"%@ should be an instance inheriting from %@, but it is nil", @"assetReference.asset", v14 object file lineNumber description];
  }

LABEL_5:
  v9 = [v8 localIdentifier];
  if (v4) {
    v10 = &unk_1F02D61D8;
  }
  else {
    v10 = &unk_1F02D61F0;
  }
  [(NSMutableDictionary *)self->_simulatedStateByAssetID setObject:v10 forKeyedSubscript:v9];
  [(PXPhotoKitImportStatusManager *)self _notifySimulationObserversForAssetReference:v17];
}

- (void)beginSimulatedImportForAssetReference:(id)a3
{
  id v5 = a3;
  id v14 = v5;
  if (!self->_supportsStateSimulation)
  {
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 83, @"Invalid parameter not satisfying: %@", @"_supportsStateSimulation" object file lineNumber description];

    id v5 = v14;
  }
  id v6 = [v5 asset];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 86, @"%@ should be an instance inheriting from %@, but it is %@", @"assetReference.asset", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitImportStatusManager.m", 86, @"%@ should be an instance inheriting from %@, but it is nil", @"assetReference.asset", v11 object file lineNumber description];
  }

LABEL_5:
  id v7 = [v6 localIdentifier];
  [(NSMutableDictionary *)self->_simulatedStateByAssetID setObject:&unk_1F02D61C0 forKeyedSubscript:v7];
  [(PXPhotoKitImportStatusManager *)self _notifySimulationObserversForAssetReference:v14];
}

- (void)_notifySimulationObserversForAssetReference:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitImportStatusManager.m", 75, @"%s must be called on the main thread", "-[PXPhotoKitImportStatusManager _notifySimulationObserversForAssetReference:]");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_statusObservers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1AD10CB00]();
        [v11 assetImportStatusManager:self didChangeStatusForAssetReference:v5];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (int64_t)importStateForAsset:(id)a3
{
  id v4 = a3;
  if (![(PXPhotoKitImportStatusManager *)self supportsStateSimulation])
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v4 destinationAssetCopyProperties];
      id v5 = v6;
      if (!v6) {
        goto LABEL_8;
      }
      uint64_t v7 = [v6 destinationAssetCopyState];

      if ((unint64_t)(v7 + 1) <= 3)
      {
        id v5 = (void *)qword_1AB35A968[v7 + 1];
        goto LABEL_8;
      }
    }
    id v5 = 0;
    goto LABEL_8;
  }
  id v5 = [(PXPhotoKitImportStatusManager *)self _simulatedStateForAsset:v4];
LABEL_8:

  return (int64_t)v5;
}

- (PXPhotoKitImportStatusManager)init
{
  return (PXPhotoKitImportStatusManager *)[(PXPhotoKitImportStatusManager *)self initAllowingSimulation:0];
}

- (id)initAllowingSimulation:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPhotoKitImportStatusManager;
  id v4 = [(PXPhotoKitImportStatusManager *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    statusObservers = v4->_statusObservers;
    v4->_statusObservers = (NSHashTable *)v5;

    v4->_supportsStateSimulation = v3;
    if (v3)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
      simulatedStateByAssetID = v4->_simulatedStateByAssetID;
      v4->_simulatedStateByAssetID = (NSMutableDictionary *)v7;
    }
  }
  return v4;
}

@end