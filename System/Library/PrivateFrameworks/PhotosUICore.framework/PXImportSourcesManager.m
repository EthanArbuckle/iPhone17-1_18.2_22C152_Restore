@interface PXImportSourcesManager
+ (PXImportSourcesManager)sharedController;
- (NSArray)importSources;
- (PHImportController)importController;
- (PXImportSourcesManager)init;
- (void)_notifyObserversDidAddImportSource:(id)a3;
- (void)_notifyObserversDidRemoveImportSource:(id)a3;
- (void)_notifyObserversDidUpdateImportSource:(id)a3;
- (void)_updateImportURLSource:(id)a3;
- (void)importController:(id)a3 addedImportSource:(id)a4;
- (void)importController:(id)a3 failedToAddImportSource:(id)a4 exceptions:(id)a5;
- (void)importController:(id)a3 removedImportSource:(id)a4;
@end

@implementation PXImportSourcesManager

- (NSArray)importSources
{
  v2 = (void *)[(NSMutableArray *)self->_importSources copy];
  return (NSArray *)v2;
}

+ (PXImportSourcesManager)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXImportSourcesManager_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_59879 != -1) {
    dispatch_once(&sharedController_onceToken_59879, block);
  }
  v2 = (void *)sharedController_sharedController;
  return (PXImportSourcesManager *)v2;
}

void __42__PXImportSourcesManager_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v1;
}

- (PXImportSourcesManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXImportSourcesManager;
  v2 = [(PXImportSourcesManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F390E8] sharedInstance];
    importController = v2->_importController;
    v2->_importController = (PHImportController *)v3;

    [(PHImportController *)v2->_importController enableDeviceImport];
    uint64_t v5 = objc_opt_new();
    importSources = v2->_importSources;
    v2->_importSources = (NSMutableArray *)v5;

    [(PHImportController *)v2->_importController addImportControllerObserver:v2];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importController, 0);
  objc_storeStrong((id *)&self->_URLImportSource, 0);
  objc_storeStrong((id *)&self->_importSources, 0);
}

- (PHImportController)importController
{
  return self->_importController;
}

- (void)importController:(id)a3 failedToAddImportSource:(id)a4 exceptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__PXImportSourcesManager_importController_failedToAddImportSource_exceptions___block_invoke;
  v11[3] = &unk_1E5DB49B8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(PXImportSourcesManager *)self enumerateObserversUsingBlock:v11];
}

void __78__PXImportSourcesManager_importController_failedToAddImportSource_exceptions___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 importSourcesManager:a1[4] didFailToAddImportSource:a1[5] exceptions:a1[6]];
  }
}

- (void)importController:(id)a3 removedImportSource:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PXImportSourcesManager_importController_removedImportSource___block_invoke;
  v7[3] = &unk_1E5DD0328;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [(PXImportSourcesManager *)self performChanges:v7];
}

uint64_t __63__PXImportSourcesManager_importController_removedImportSource___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isCamera];
  id v3 = *(id **)(a1 + 40);
  if (v2)
  {
    [v3[12] removeObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) removeImportSourceObserver:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) _notifyObserversDidRemoveImportSource:*(void *)(a1 + 32)];
    v4 = *(void **)(a1 + 40);
    return [v4 signalChange:1];
  }
  else
  {
    return [v3 _updateImportURLSource:0];
  }
}

- (void)importController:(id)a3 addedImportSource:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PXImportSourcesManager_importController_addedImportSource___block_invoke;
  v7[3] = &unk_1E5DD0328;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [(PXImportSourcesManager *)self performChanges:v7];
}

uint64_t __61__PXImportSourcesManager_importController_addedImportSource___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isCamera];
  id v3 = *(id **)(a1 + 40);
  if (v2)
  {
    [v3[12] addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) addImportSourceObserver:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) _notifyObserversDidAddImportSource:*(void *)(a1 + 32)];
    v4 = *(void **)(a1 + 40);
    return [v4 signalChange:1];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    return [v3 _updateImportURLSource:v6];
  }
}

- (void)_updateImportURLSource:(id)a3
{
  v4 = (PHImportSource *)a3;
  id v5 = self->_URLImportSource;
  if (v5 == v4)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PHImportSource *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__PXImportSourcesManager__updateImportURLSource___block_invoke;
      v8[3] = &unk_1E5DD0328;
      v8[4] = self;
      id v9 = v4;
      [(PXImportSourcesManager *)self performChanges:v8];
    }
  }
}

void __49__PXImportSourcesManager__updateImportURLSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 104);
  id v9 = v3;
  if (v5)
  {
    id v6 = v5;
    [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(*(void *)(a1 + 32) + 104)];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v4 + 104), *(id *)(a1 + 40));
  char v7 = *(void **)(a1 + 32);
  if (v7[13])
  {
    id v8 = *(id *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(*(void *)(a1 + 32) + 104)];
    char v7 = *(void **)(a1 + 32);
    if (v8)
    {
      [v7 _notifyObserversDidAddImportSource:v8];
      char v7 = *(void **)(a1 + 32);
    }
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v8 = 0;
    if (v5)
    {
LABEL_7:
      [v7 _notifyObserversDidRemoveImportSource:v5];
      char v7 = *(void **)(a1 + 32);
    }
  }
  [v7 signalChange:1];
}

- (void)_notifyObserversDidRemoveImportSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PXImportSourcesManager__notifyObserversDidRemoveImportSource___block_invoke;
  v6[3] = &unk_1E5DB4990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXImportSourcesManager *)self enumerateObserversUsingBlock:v6];
}

void __64__PXImportSourcesManager__notifyObserversDidRemoveImportSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 importSourcesManager:*(void *)(a1 + 32) didRemoveImportSource:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversDidUpdateImportSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PXImportSourcesManager__notifyObserversDidUpdateImportSource___block_invoke;
  v6[3] = &unk_1E5DB4990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXImportSourcesManager *)self enumerateObserversUsingBlock:v6];
}

void __64__PXImportSourcesManager__notifyObserversDidUpdateImportSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 importSourcesManager:*(void *)(a1 + 32) didUpdateImportSource:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversDidAddImportSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PXImportSourcesManager__notifyObserversDidAddImportSource___block_invoke;
  v6[3] = &unk_1E5DB4990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXImportSourcesManager *)self enumerateObserversUsingBlock:v6];
}

void __61__PXImportSourcesManager__notifyObserversDidAddImportSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 importSourcesManager:*(void *)(a1 + 32) didAddImportSource:*(void *)(a1 + 40)];
  }
}

@end