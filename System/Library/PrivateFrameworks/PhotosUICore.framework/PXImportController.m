@interface PXImportController
+ (id)assetsForModels:(id)a3;
+ (id)importFilesAtURLs:(id)a3 photoLibrary:(id)a4 collection:(id)a5 checkDuplicates:(BOOL)a6 referenced:(BOOL)a7 delegate:(id)a8 completionHandler:(id)a9;
+ (id)importOperationQueue;
+ (id)itemsConstrainedByAvailableDiskSpaceFromItems:(id)a3 additionalBytesRequired:(int64_t *)a4;
+ (int64_t)diskSpaceRequiredToImportItems:(id)a3;
+ (void)favoriteAssetsFromImportResults:(id)a3 photoLibrary:(id)a4;
- (BOOL)alreadyImportedItemsSelectable;
- (BOOL)hasLoadedAssets;
- (BOOL)hasLoadedInitialBatchOfAssets;
- (BOOL)hasReceivedImportSourceAssetChanges;
- (BOOL)isDeletingAssets;
- (BOOL)isImportingAssets;
- (BOOL)isLoadingContent;
- (BOOL)isLoadingInitialBatchOfAssets;
- (BOOL)isUserRequiredToTrustHostOnSourceDevice;
- (NSMutableDictionary)sharedViewModelsById;
- (NSMutableSet)otherDataSourceManagers;
- (NSProgress)importProgress;
- (NSTimer)assetLoadingPowerAssertionTimer;
- (NSTimer)initialBatchOfAssetsTimer;
- (OS_dispatch_queue)otherDataSourceManagersQueue;
- (OS_dispatch_queue)sharedViewModelsUpdateQueue;
- (PHAssetCollection)importDestinationAlbum;
- (PHImportSource)importSource;
- (PHPhotoLibrary)photoLibrary;
- (PXImportAssetsDataSourceManager)dataSourceManager;
- (PXImportController)init;
- (PXImportController)initWithImportSource:(id)a3 photoLibrary:(id)a4 imageFormat:(unsigned __int16)a5;
- (PXImportController)initWithImportSource:(id)a3 photoLibrary:(id)a4 imageFormat:(unsigned __int16)a5 dateOrder:(int64_t)a6;
- (PXImportControllerTopLevelCompletionDelegate)importCompletionDelegate;
- (PXImportDeleteAction)deleteAction;
- (PXImportMediaLoadingCoordinator)mediaLoadingCoordinator;
- (PXImportMediaProvider)importMediaProvider;
- (PXImportSessionInfo)importSessionInfo;
- (PXPowerController)powerController;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)lastSelectionSnapshot;
- (id)createDataSourceManagerWithLogIdentifier:(id)a3;
- (id)deleteCompletionHandler;
- (id)importCompletionHandler;
- (id)selectedItems;
- (id)viewModelMapForImportAssetsDataSourceManager:(id)a3;
- (int64_t)dateOrder;
- (int64_t)importAsset:(id)a3 asDuplicateOfLibraryAsset:(id)a4 applyToAll:(BOOL *)a5;
- (unsigned)deleteAssetsPowerAssertionIdentifier;
- (unsigned)imageFormat;
- (unsigned)importAssetsPowerAssertionIdentifier;
- (unsigned)loadAssetsPowerAssertionIdentifier;
- (void)adoptImportSource:(id)a3;
- (void)assetLoadingPowerAssertionTimerFired;
- (void)capabilitiesDidChangeForImportSource:(id)a3;
- (void)completedImportRecord:(id)a3;
- (void)dealloc;
- (void)deleteItems:(id)a3 withCompletionHandler:(id)a4;
- (void)deselectItem:(id)a3;
- (void)finishDeletingItems;
- (void)finishImportingWithResults:(id)a3;
- (void)handleImportSourceModifiedAssets;
- (void)importItems:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)importSource:(id)a3 didAddAssets:(id)a4;
- (void)importSource:(id)a3 didRemoveAssets:(id)a4;
- (void)loadAssets;
- (void)nameDidChangeForImportSource:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performChanges:(id)a3;
- (void)removeDataSourceManager:(id)a3;
- (void)restartTimedAssetsLoadingPowerAssertion;
- (void)selectItem:(id)a3;
- (void)sendActionProgress:(double)a3;
- (void)setAlreadyImportedItemsSelectable:(BOOL)a3;
- (void)setAssetLoadingPowerAssertionTimer:(id)a3;
- (void)setDeleteAction:(id)a3;
- (void)setDeleteAssetsPowerAssertionIdentifier:(unsigned int)a3;
- (void)setDeleteCompletionHandler:(id)a3;
- (void)setDeletingAssets:(BOOL)a3;
- (void)setHasLoadedAssets:(BOOL)a3;
- (void)setHasLoadedInitialBatchOfAssets:(BOOL)a3;
- (void)setHasReceivedImportSourceAssetChanges:(BOOL)a3;
- (void)setImportAssetsPowerAssertionIdentifier:(unsigned int)a3;
- (void)setImportCompletionDelegate:(id)a3;
- (void)setImportCompletionHandler:(id)a3;
- (void)setImportDestinationAlbum:(id)a3;
- (void)setImportProgress:(id)a3;
- (void)setImportSessionInfo:(id)a3;
- (void)setImportingAssets:(BOOL)a3;
- (void)setInitialBatchOfAssetsTimer:(id)a3;
- (void)setIsLoadingInitialBatchOfAssets:(BOOL)a3;
- (void)setLastSelectionSnapshot:(id)a3;
- (void)setLoadAssetsPowerAssertionIdentifier:(unsigned int)a3;
- (void)setLoadingContent:(BOOL)a3;
- (void)setLoadingInitialBatchOfAssets:(BOOL)a3;
- (void)setPowerController:(id)a3;
- (void)setSelected:(BOOL)a3 forItems:(id)a4;
- (void)setUserRequiredToTrustHostOnSourceDevice:(BOOL)a3;
- (void)shutdown;
- (void)startInitialBatchOfAssetsTimerWithTimeout:(double)a3;
- (void)startObservingImportProgress;
- (void)stopImport;
- (void)stopObservingImportProgress;
- (void)stopTimedAssetsLoadingPowerAssertion;
- (void)userHasTrustedHostForImportSource:(id)a3;
- (void)userRequiredToTrustHostForImportSource:(id)a3;
@end

@implementation PXImportController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLoadingCoordinator, 0);
  objc_storeStrong((id *)&self->_lastSelectionSnapshot, 0);
  objc_storeStrong(&self->_deleteCompletionHandler, 0);
  objc_storeStrong(&self->_importCompletionHandler, 0);
  objc_storeStrong((id *)&self->_assetLoadingPowerAssertionTimer, 0);
  objc_storeStrong((id *)&self->_powerController, 0);
  objc_storeStrong((id *)&self->_otherDataSourceManagersQueue, 0);
  objc_storeStrong((id *)&self->_otherDataSourceManagers, 0);
  objc_storeStrong((id *)&self->_sharedViewModelsUpdateQueue, 0);
  objc_storeStrong((id *)&self->_sharedViewModelsById, 0);
  objc_storeStrong((id *)&self->_initialBatchOfAssetsTimer, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_deleteAction, 0);
  objc_storeStrong((id *)&self->_importDestinationAlbum, 0);
  objc_storeStrong((id *)&self->_importProgress, 0);
  objc_storeStrong((id *)&self->_importSessionInfo, 0);
  objc_destroyWeak((id *)&self->_importCompletionDelegate);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_importMediaProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
  objc_storeStrong((id *)&self->_lastSelectedModels, 0);
}

- (PXImportMediaLoadingCoordinator)mediaLoadingCoordinator
{
  return self->_mediaLoadingCoordinator;
}

- (void)setLastSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)lastSelectionSnapshot
{
  return self->_lastSelectionSnapshot;
}

- (void)setDeleteCompletionHandler:(id)a3
{
}

- (id)deleteCompletionHandler
{
  return self->_deleteCompletionHandler;
}

- (void)setImportCompletionHandler:(id)a3
{
}

- (id)importCompletionHandler
{
  return self->_importCompletionHandler;
}

- (void)setAssetLoadingPowerAssertionTimer:(id)a3
{
}

- (NSTimer)assetLoadingPowerAssertionTimer
{
  return self->_assetLoadingPowerAssertionTimer;
}

- (void)setLoadAssetsPowerAssertionIdentifier:(unsigned int)a3
{
  self->_loadAssetsPowerAssertionIdentifier = a3;
}

- (unsigned)loadAssetsPowerAssertionIdentifier
{
  return self->_loadAssetsPowerAssertionIdentifier;
}

- (void)setDeleteAssetsPowerAssertionIdentifier:(unsigned int)a3
{
  self->_deleteAssetsPowerAssertionIdentifier = a3;
}

- (unsigned)deleteAssetsPowerAssertionIdentifier
{
  return self->_deleteAssetsPowerAssertionIdentifier;
}

- (void)setImportAssetsPowerAssertionIdentifier:(unsigned int)a3
{
  self->_importAssetsPowerAssertionIdentifier = a3;
}

- (unsigned)importAssetsPowerAssertionIdentifier
{
  return self->_importAssetsPowerAssertionIdentifier;
}

- (void)setPowerController:(id)a3
{
}

- (PXPowerController)powerController
{
  return self->_powerController;
}

- (OS_dispatch_queue)otherDataSourceManagersQueue
{
  return self->_otherDataSourceManagersQueue;
}

- (NSMutableSet)otherDataSourceManagers
{
  return self->_otherDataSourceManagers;
}

- (OS_dispatch_queue)sharedViewModelsUpdateQueue
{
  return self->_sharedViewModelsUpdateQueue;
}

- (NSMutableDictionary)sharedViewModelsById
{
  return self->_sharedViewModelsById;
}

- (void)setInitialBatchOfAssetsTimer:(id)a3
{
}

- (NSTimer)initialBatchOfAssetsTimer
{
  return self->_initialBatchOfAssetsTimer;
}

- (void)setIsLoadingInitialBatchOfAssets:(BOOL)a3
{
  self->_isLoadingInitialBatchOfAssets = a3;
}

- (BOOL)isLoadingInitialBatchOfAssets
{
  return self->_loadingInitialBatchOfAssets;
}

- (void)setHasReceivedImportSourceAssetChanges:(BOOL)a3
{
  self->_hasReceivedImportSourceAssetChanges = a3;
}

- (BOOL)hasReceivedImportSourceAssetChanges
{
  return self->_hasReceivedImportSourceAssetChanges;
}

- (void)setHasLoadedAssets:(BOOL)a3
{
  self->_hasLoadedAssets = a3;
}

- (BOOL)hasLoadedAssets
{
  return self->_hasLoadedAssets;
}

- (BOOL)alreadyImportedItemsSelectable
{
  return self->_alreadyImportedItemsSelectable;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setDeleteAction:(id)a3
{
}

- (PXImportDeleteAction)deleteAction
{
  return self->_deleteAction;
}

- (BOOL)isDeletingAssets
{
  return self->_deletingAssets;
}

- (void)setImportDestinationAlbum:(id)a3
{
}

- (PHAssetCollection)importDestinationAlbum
{
  return self->_importDestinationAlbum;
}

- (void)setImportProgress:(id)a3
{
}

- (NSProgress)importProgress
{
  return self->_importProgress;
}

- (void)setImportSessionInfo:(id)a3
{
}

- (PXImportSessionInfo)importSessionInfo
{
  return self->_importSessionInfo;
}

- (BOOL)isImportingAssets
{
  return self->_importingAssets;
}

- (BOOL)isUserRequiredToTrustHostOnSourceDevice
{
  return self->_userRequiredToTrustHostOnSourceDevice;
}

- (BOOL)hasLoadedInitialBatchOfAssets
{
  return self->_hasLoadedInitialBatchOfAssets;
}

- (BOOL)isLoadingContent
{
  return self->_loadingContent;
}

- (void)setImportCompletionDelegate:(id)a3
{
}

- (PXImportControllerTopLevelCompletionDelegate)importCompletionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importCompletionDelegate);
  return (PXImportControllerTopLevelCompletionDelegate *)WeakRetained;
}

- (PXImportAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXImportMediaProvider)importMediaProvider
{
  return self->_importMediaProvider;
}

- (int64_t)dateOrder
{
  return self->_dateOrder;
}

- (unsigned)imageFormat
{
  return self->_imageFormat;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((a4 & 1) != 0 && (void *)PXImportControllerSelectionManagerObserverContext == a5)
  {
    v6 = [(PXImportController *)self selectionManager];
    v7 = [v6 selectionSnapshot];

    v8 = [v7 dataSource];
    v9 = [v7 selectedIndexPaths];
    v10 = objc_opt_new();
    if ([v9 count] >= 1)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51__PXImportController_observable_didChange_context___block_invoke;
      v25[3] = &unk_1E5DC8CF0;
      id v26 = v8;
      id v27 = v10;
      id v28 = v7;
      [v9 enumerateItemIndexPathsUsingBlock:v25];
    }
    v19 = v9;
    v20 = v8;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v11 = self->_lastSelectedModels;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v10, "containsObject:", v16, v19, v20, (void)v21) & 1) == 0
            && [v16 isSelected]
            && ([v16 isDeleted] & 1) == 0)
          {
            [v16 performChanges:&__block_literal_global_347_221590];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v13);
    }

    [(PXImportController *)self setLastSelectionSnapshot:v7];
    v17 = (NSArray *)[v10 copy];
    lastSelectedModels = self->_lastSelectedModels;
    self->_lastSelectedModels = v17;
  }
}

void __51__PXImportController_observable_didChange_context___block_invoke(uint64_t a1, long long *a2)
{
  v4 = *(void **)(a1 + 32);
  long long v5 = a2[1];
  long long v13 = *a2;
  long long v14 = v5;
  v6 = [v4 assetReferenceAtItemIndexPath:&v13];
  id v7 = [v6 asset];
  if (v7) {
    [*(id *)(a1 + 40) addObject:v7];
  }
  v8 = *(void **)(a1 + 48);
  long long v9 = a2[1];
  long long v13 = *a2;
  long long v14 = v9;
  int v10 = [v8 isIndexPathSelected:&v13];
  if (v10 != [v7 isSelected])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__PXImportController_observable_didChange_context___block_invoke_2;
    v11[3] = &__block_descriptor_33_e40_v16__0___PXMutableImportItemViewModel__8l;
    char v12 = v10;
    [v7 performChanges:v11];
  }
}

uint64_t __51__PXImportController_observable_didChange_context___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setSelected:0];
}

uint64_t __51__PXImportController_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelected:*(unsigned __int8 *)(a1 + 32)];
}

- (void)assetLoadingPowerAssertionTimerFired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _importControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    long long v5 = "-[PXImportController assetLoadingPowerAssertionTimerFired]";
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PXImportController *)self stopTimedAssetsLoadingPowerAssertion];
}

- (void)stopTimedAssetsLoadingPowerAssertion
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _importControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    long long v9 = "-[PXImportController stopTimedAssetsLoadingPowerAssertion]";
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  int v4 = [(PXImportController *)self assetLoadingPowerAssertionTimer];
  int v5 = [v4 isValid];

  if (v5)
  {
    uint64_t v6 = [(PXImportController *)self assetLoadingPowerAssertionTimer];
    [v6 invalidate];

    [(PXImportController *)self setAssetLoadingPowerAssertionTimer:0];
    id v7 = [(PXImportController *)self powerController];
    objc_msgSend(v7, "removePowerAssertionForIdentifier:withReason:completion:", -[PXImportController loadAssetsPowerAssertionIdentifier](self, "loadAssetsPowerAssertionIdentifier"), 4, 0);
  }
}

- (void)restartTimedAssetsLoadingPowerAssertion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(PXImportController *)self assetLoadingPowerAssertionTimer];
  int v4 = [v3 isValid];

  int v5 = _importControllerLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PXImportController restartTimedAssetsLoadingPowerAssertion]";
      __int16 v12 = 2048;
      uint64_t v13 = 0x4024000000000000;
      _os_log_debug_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%s: Timer already running, resetting timeout to %.0f seconds.", buf, 0x16u);
    }

    id v7 = [(PXImportController *)self assetLoadingPowerAssertionTimer];
    [v7 invalidate];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PXImportController restartTimedAssetsLoadingPowerAssertion]";
      __int16 v12 = 2048;
      uint64_t v13 = 0x4024000000000000;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_INFO, "%s: Timer not running, taking assets-loading power assertion and starting timer for %.0f seconds.", buf, 0x16u);
    }

    id v7 = [(PXImportController *)self powerController];
    objc_msgSend(v7, "addPowerAssertionForIdentifier:withReason:completion:", -[PXImportController loadAssetsPowerAssertionIdentifier](self, "loadAssetsPowerAssertionIdentifier"), 4, 0);
  }

  int v8 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_assetLoadingPowerAssertionTimerFired selector:0 userInfo:0 repeats:10.0];
  [(PXImportController *)self setAssetLoadingPowerAssertionTimer:v8];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXImportController_restartTimedAssetsLoadingPowerAssertion__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__PXImportController_restartTimedAssetsLoadingPowerAssertion__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetLoadingPowerAssertionTimer];

  if (v2)
  {
    id v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v3 = [*(id *)(a1 + 32) assetLoadingPowerAssertionTimer];
    [v4 addTimer:v3 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)stopObservingImportProgress
{
}

uint64_t __49__PXImportController_stopObservingImportProgress__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) importProgress];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted" context:PXImportProgressObservationContext];

  [*(id *)(a1 + 32) setImportProgress:0];
  v3 = *(void **)(a1 + 32);
  return [v3 sendActionProgress:0.0];
}

- (void)startObservingImportProgress
{
}

void __50__PXImportController_startObservingImportProgress__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 importProgress];
  [v3 fractionCompleted];
  objc_msgSend(v2, "sendActionProgress:");

  id v4 = [*(id *)(a1 + 32) importProgress];
  [v4 addObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted" options:0 context:PXImportProgressObservationContext];
}

- (void)sendActionProgress:(double)a3
{
}

void __41__PXImportController_sendActionProgress___block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) importProgress];
  v12[0] = @"PXImportControllerFractionCompleted";
  v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v13[0] = v3;
  v12[1] = @"PXImportControllerCompletedItemCount";
  id v4 = NSNumber;
  if (v2) {
    uint64_t v5 = [v2 completedUnitCount];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v4 numberWithLongLong:v5];
  v13[1] = v6;
  v12[2] = @"PXImportControllerTotalItemCount";
  id v7 = NSNumber;
  if (v2) {
    uint64_t v8 = [v2 totalUnitCount];
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = [v7 numberWithLongLong:v8];
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"PXImportControllerProgressNotification" object:*(void *)(a1 + 32) userInfo:v10];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v11 = v10;
  if ((void *)PXImportProgressObservationContext == a6)
  {
    [v10 fractionCompleted];
    -[PXImportController sendActionProgress:](self, "sendActionProgress:");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXImportController;
    [(PXImportController *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)setAlreadyImportedItemsSelectable:(BOOL)a3
{
  if (self->_alreadyImportedItemsSelectable != a3)
  {
    self->_BOOL alreadyImportedItemsSelectable = a3;
    id v4 = [(PXImportController *)self selectionManager];
    uint64_t v5 = [v4 selectionSnapshot];

    uint64_t v6 = [v5 dataSource];
    if (self->_alreadyImportedItemsSelectable)
    {
      BOOL alreadyImportedItemsSelectable = 1;
    }
    else
    {
      uint64_t v8 = +[PXImportItemViewModel alreadyImportedGroupIdentifier];
      long long v9 = [v6 assetCollectionForIdentifier:v8];
      if (v9)
      {
        uint64_t v10 = [v6 sectionForAssetCollection:v9];
        v11 = [v5 selectedIndexPaths];
        id v12 = objc_alloc_init((Class)off_1E5DA7430);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke;
        v21[3] = &unk_1E5DC66D8;
        uint64_t v23 = v10;
        id v13 = v12;
        id v22 = v13;
        [v11 enumerateAllIndexPathsUsingBlock:v21];
        uint64_t v14 = [(PXImportController *)self selectionManager];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_2;
        v19[3] = &unk_1E5DC9F28;
        id v20 = v13;
        id v15 = v13;
        [v14 performChanges:v19];
      }
      BOOL alreadyImportedItemsSelectable = self->_alreadyImportedItemsSelectable;
    }
    v16 = [(PXImportController *)self dataSourceManager];
    [v16 setAlreadyImportedItemsSelectable:alreadyImportedItemsSelectable];

    v17 = [(PXImportController *)self otherDataSourceManagersQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_3;
    v18[3] = &unk_1E5DD36F8;
    v18[4] = self;
    dispatch_sync(v17, v18);
  }
}

uint64_t __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 8) != *(void *)(result + 40))
  {
    v2 = *(void **)(result + 32);
    long long v3 = *(_OWORD *)(a2 + 16);
    v4[0] = *(_OWORD *)a2;
    v4[1] = v3;
    return [v2 addIndexPath:v4];
  }
  return result;
}

uint64_t __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

void __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setAlreadyImportedItemsSelectable:*(unsigned __int8 *)(*(void *)(a1 + 32) + 110)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)selectedItems
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = [(PXImportController *)self selectionManager];
  uint64_t v4 = [v3 selectionSnapshot];

  uint64_t v5 = [v4 selectedIndexPaths];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__221611;
  v17 = __Block_byref_object_dispose__221612;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 dataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__PXImportController_selectedItems__block_invoke;
  v10[3] = &unk_1E5DC66B0;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v5 enumerateAllIndexPathsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __35__PXImportController_selectedItems__block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  uint64_t v5 = [v3 assetAtItemIndexPath:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

- (void)deselectItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(PXImportController *)self selectionManager];
  uint64_t v6 = [v5 selectionSnapshot];

  id v7 = [v6 dataSource];
  id v8 = v7;
  long long v18 = 0u;
  long long v19 = 0u;
  if (v7) {
    [v7 itemIndexPathForItem:v4];
  }
  *(_OWORD *)buf = v18;
  *(_OWORD *)&buf[16] = v19;
  if ([v6 isIndexPathSelected:buf])
  {
    long long v9 = [(PXImportController *)self selectionManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__PXImportController_deselectItem___block_invoke;
    v15[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v16 = v18;
    long long v17 = v19;
    [v9 performChanges:v15];

    long long v10 = [(PXImportController *)self selectionManager];
    id v11 = [v10 selectionSnapshot];

    uint64_t v12 = _importControllerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v11 selectedIndexPaths];
      uint64_t v14 = [v13 count];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[PXImportController deselectItem:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v14;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "%s: %@ (selected count %lu)", buf, 0x20u);
    }
  }
}

uint64_t __35__PXImportController_deselectItem___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedState:0 forIndexPath:v4];
}

- (void)selectItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([v4 isSelectable])
  {
    uint64_t v5 = [(PXImportController *)self selectionManager];
    uint64_t v6 = [v5 selectionSnapshot];

    id v7 = [v6 dataSource];
    id v8 = v7;
    long long v18 = 0u;
    long long v19 = 0u;
    if (v7) {
      [v7 itemIndexPathForItem:v4];
    }
    *(_OWORD *)buf = v18;
    *(_OWORD *)&buf[16] = v19;
    if (([v6 isIndexPathSelected:buf] & 1) == 0)
    {
      long long v9 = [(PXImportController *)self selectionManager];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __33__PXImportController_selectItem___block_invoke;
      v15[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
      long long v16 = v18;
      long long v17 = v19;
      [v9 performChanges:v15];

      long long v10 = [(PXImportController *)self selectionManager];
      id v11 = [v10 selectionSnapshot];

      uint64_t v12 = _importControllerLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v11 selectedIndexPaths];
        uint64_t v14 = [v13 count];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[PXImportController selectItem:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v14;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "%s: %@ (selected count %lu)", buf, 0x20u);
      }
    }
  }
}

uint64_t __33__PXImportController_selectItem___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedState:1 forIndexPath:v4];
}

- (void)setSelected:(BOOL)a3 forItems:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = [(PXImportController *)self selectionManager];
  id v8 = [v7 selectionSnapshot];

  long long v9 = [v8 dataSource];
  long long v10 = [v8 selectedIndexPaths];
  id v11 = (void *)[v10 mutableCopy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        memset(buf, 0, 32);
        if (v9) {
          [v9 itemIndexPathForItem:v17];
        }
        v28[0] = *(_OWORD *)buf;
        v28[1] = *(_OWORD *)&buf[16];
        if (v4) {
          [v11 addIndexPath:v28];
        }
        else {
          [v11 removeIndexPath:v28];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v18 = [(PXImportController *)self selectionManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __43__PXImportController_setSelected_forItems___block_invoke;
  v26[3] = &unk_1E5DC9F28;
  id v27 = v11;
  id v19 = v11;
  [v18 performChanges:v26];

  id v20 = [(PXImportController *)self selectionManager];
  uint64_t v21 = [v20 selectionSnapshot];

  id v22 = _importControllerLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = [v12 count];
    long long v24 = [v21 selectedIndexPaths];
    uint64_t v25 = [v24 count];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[PXImportController setSelected:forItems:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v23;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v25;
    _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_INFO, "%s: Selected: %d (%lu models) (selected count %lu)", buf, 0x26u);
  }
}

uint64_t __43__PXImportController_setSelected_forItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

- (void)finishDeletingItems
{
  id v8 = [(PXImportController *)self deleteAction];
  uint64_t v3 = [v8 didSucceed];
  BOOL v4 = [v8 error];
  uint64_t v5 = [(PXImportController *)self deleteCompletionHandler];
  id v6 = (void (**)(void, void, void))[v5 copy];

  [(PXImportController *)self setDeleteCompletionHandler:0];
  [(PXImportController *)self setDeleteAction:0];
  [(PXImportController *)self performChanges:&__block_literal_global_330_221616];
  id v7 = [(PXImportController *)self powerController];
  objc_msgSend(v7, "removePowerAssertionForIdentifier:withReason:completion:", -[PXImportController deleteAssetsPowerAssertionIdentifier](self, "deleteAssetsPowerAssertionIdentifier"), 2, 0);

  if (v6) {
    ((void (**)(void, uint64_t, void *))v6)[2](v6, v3, v4);
  }
  [(PXImportMediaLoadingCoordinator *)self->_mediaLoadingCoordinator setPaused:0];
}

uint64_t __41__PXImportController_finishDeletingItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeletingAssets:0];
}

- (void)deleteItems:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = _importControllerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v29 = "-[PXImportController deleteItems:withCompletionHandler:]";
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v10 = [(PXImportController *)self deleteAction];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXImportController.m" lineNumber:794 description:@"Attempted to delete import items while another delete is in progress"];
  }
  id v12 = +[PXImportItemViewModel importAssetsFromModels:v7];
  uint64_t v13 = [[PXImportDeleteAction alloc] initWithAssets:v12];
  [(PXImportDeleteAction *)v13 setImportController:self];
  [(PXImportController *)self setDeleteCompletionHandler:v8];
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__PXImportController_deleteItems_withCompletionHandler___block_invoke;
  v25[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v26, (id *)buf);
  [(PXImportDeleteAction *)v13 setCompletionBlock:v25];
  [(PXImportController *)self setDeleteAction:v13];
  [(PXImportController *)self performChanges:&__block_literal_global_328_221624];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        -[PXImportController deselectItem:](self, "deselectItem:", *(void *)(*((void *)&v21 + 1) + 8 * v17++), (void)v21);
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v15);
  }

  long long v18 = [(PXImportController *)self powerController];
  objc_msgSend(v18, "addPowerAssertionForIdentifier:withReason:completion:", -[PXImportController deleteAssetsPowerAssertionIdentifier](self, "deleteAssetsPowerAssertionIdentifier"), 2, 0);

  id v19 = [(id)objc_opt_class() importOperationQueue];
  [v19 addOperation:v13];

  [(PXImportMediaLoadingCoordinator *)self->_mediaLoadingCoordinator setPaused:1];
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __56__PXImportController_deleteItems_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v2 = _importControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[PXImportController deleteItems:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%s: Delete operation done", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXImportController_deleteItems_withCompletionHandler___block_invoke_326;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

uint64_t __56__PXImportController_deleteItems_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDeletingAssets:1];
}

void __56__PXImportController_deleteItems_withCompletionHandler___block_invoke_326(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishDeletingItems];
}

- (void)setDeletingAssets:(BOOL)a3
{
  if (self->_deletingAssets != a3)
  {
    self->_deletingAssets = a3;
    [(PXImportController *)self signalChange:4];
  }
}

- (void)completedImportRecord:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _importDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 importAsset];
    uint64_t v7 = [v6 fileName];
    *(_DWORD *)buf = 136315394;
    id v12 = "-[PXImportController completedImportRecord:]";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "%s: import complete for %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PXImportController_completedImportRecord___block_invoke;
  v9[3] = &unk_1E5DD32A8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __44__PXImportController_completedImportRecord___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v2 = [*(id *)(a1 + 32) dataSourceManager];
  uint64_t v3 = [v2 unfilteredDataSource];

  id v4 = [*(id *)(a1 + 40) importAsset];
  uint64_t v5 = [v4 uuid];
  id v6 = [v3 itemForImportAssetUuid:v5];

  if (v6)
  {
    [*(id *)(a1 + 32) deselectItem:v6];
    uint64_t v7 = [*(id *)(a1 + 40) exceptions];
    uint64_t v8 = [v7 count];

    long long v9 = *(void **)(*(void *)(a1 + 32) + 176);
    if (v8)
    {
      id v10 = [v9 errorItems];

      if (!v10)
      {
        BOOL v11 = objc_opt_new();
        [*(id *)(*(void *)(a1 + 32) + 176) setErrorItems:v11];
      }
      id v12 = [*(id *)(*(void *)(a1 + 32) + 176) errorItems];
      [v12 addObject:v6];

      __int16 v13 = &__block_literal_global_319_221632;
    }
    else
    {
      uint64_t v15 = [v9 importedItems];

      if (!v15)
      {
        uint64_t v16 = objc_opt_new();
        [*(id *)(*(void *)(a1 + 32) + 176) setImportedItems:v16];
      }
      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 176) importedItems];
      [v17 addObject:v6];

      long long v18 = _importDataLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        long long v23 = "-[PXImportController completedImportRecord:]_block_invoke";
        _os_log_debug_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "%s: ====   TBD:  move imported items into the top section? ===", buf, 0xCu);
      }

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __44__PXImportController_completedImportRecord___block_invoke_320;
      v21[3] = &unk_1E5DC6688;
      void v21[4] = *(void *)(a1 + 32);
      __int16 v13 = v21;
    }
    [v6 performChanges:v13];
  }
  else
  {
    id v14 = _importDataLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [*(id *)(a1 + 40) importAsset];
      id v20 = [v19 fileName];
      *(_DWORD *)buf = 136315394;
      long long v23 = "-[PXImportController completedImportRecord:]_block_invoke_2";
      __int16 v24 = 2112;
      uint64_t v25 = v20;
      _os_log_debug_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "%s: Model not found in data source for import item %@", buf, 0x16u);
    }
  }
}

void __44__PXImportController_completedImportRecord___block_invoke_320(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(*(void *)(a1 + 32) + 176);
  id v4 = a2;
  uint64_t v3 = [v2 startDate];
  [v4 setImportDate:v3];

  [v4 setState:2];
}

uint64_t __44__PXImportController_completedImportRecord___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setState:3];
}

- (void)finishImportingWithResults:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _importControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[PXImportController finishImportingWithResults:]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(PXImportController *)self stopObservingImportProgress];
  id v6 = [(PXImportController *)self importSessionInfo];
  [v6 setImportComplete:1];

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [(PXImportController *)self importSessionInfo];
  [v8 setEndDate:v7];

  long long v9 = (void *)MEMORY[0x1E4F1CA80];
  id v10 = [(PXImportController *)self importSessionInfo];
  BOOL v11 = [v10 itemsToImport];
  id v12 = objc_msgSend(v9, "setWithCapacity:", objc_msgSend(v11, "count"));

  __int16 v13 = [(PXImportController *)self importSessionInfo];
  id v14 = [v13 errorItems];
  [v12 addObjectsFromArray:v14];

  uint64_t v15 = [(PXImportController *)self importSessionInfo];
  uint64_t v16 = [v15 importedItems];
  [v12 addObjectsFromArray:v16];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v40;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v17);
        }
        [(PXImportController *)self deselectItem:*(void *)(*((void *)&v39 + 1) + 8 * v20++)];
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v18);
  }

  long long v21 = (void *)MEMORY[0x1E4F1CA80];
  long long v22 = [(PXImportController *)self importSessionInfo];
  long long v23 = [v22 itemsToImport];
  __int16 v24 = [v21 setWithArray:v23];

  [v24 minusSet:v17];
  if ([v24 count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v36;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v28++) performChanges:&__block_literal_global_315_221639];
        }
        while (v26 != v28);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v26);
    }
  }
  long long v29 = [(PXImportController *)self importCompletionHandler];
  uint64_t v30 = [(PXImportController *)self importSessionInfo];
  [(PXImportController *)self setImportCompletionHandler:0];
  [(PXImportController *)self setImportSessionInfo:0];
  [(PXImportController *)self setImportProgress:0];
  [(PXImportController *)self performChanges:&__block_literal_global_317];
  if (v29) {
    ((void (**)(void, void *, id))v29)[2](v29, v30, v4);
  }
  objc_initWeak((id *)buf, self);
  long long v31 = [(PXImportController *)self importCompletionDelegate];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __49__PXImportController_finishImportingWithResults___block_invoke_3;
  v33[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v34, (id *)buf);
  [v31 importController:self didCompleteImportWithImportSession:v30 results:v4 completion:v33];

  long long v32 = [(PXImportController *)self mediaLoadingCoordinator];
  [v32 setPaused:0];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

void __49__PXImportController_finishImportingWithResults___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = [WeakRetained powerController];
  id v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "removePowerAssertionForIdentifier:withReason:completion:", objc_msgSend(v3, "importAssetsPowerAssertionIdentifier"), 1, 0);
}

uint64_t __49__PXImportController_finishImportingWithResults___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setImportingAssets:0];
}

uint64_t __49__PXImportController_finishImportingWithResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setState:0];
}

- (void)stopImport
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _importControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    long long v9 = "-[PXImportController stopImport]";
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (![(PXImportController *)self isImportingAssets])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXImportController.m" lineNumber:671 description:@"Attempted to stop import while there was no active import."];
  }
  [(PXImportSessionInfo *)self->_importSessionInfo setImportStopped:1];
  uint64_t v5 = [(PXImportController *)self importProgress];
  [v5 cancel];

  id v6 = [(PXImportController *)self mediaLoadingCoordinator];
  [v6 setPaused:0];
}

- (void)importItems:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v35 = (void (**)(id, id))a4;
  id v34 = a5;
  val = self;
  uint64_t v10 = [(PXImportController *)self importSessionInfo];

  if (v10)
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportController.m", 615, @"%s: There is an import already in progress.", "-[PXImportController importItems:configuration:completion:]");
  }
  BOOL v11 = [(PXImportController *)self importProgress];

  if (v11)
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportController.m", 616, @"%s: Import progress should be nil when import is started.", "-[PXImportController importItems:configuration:completion:]");
  }
  if (![v9 count])
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportController.m", 617, @"%s: There are no items to import.", "-[PXImportController importItems:configuration:completion:]");
  }
  id v12 = _importControllerLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[PXImportController importItems:configuration:completion:]";
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  __int16 v13 = objc_alloc_init(PXImportSessionInfo);
  [(PXImportController *)self setImportSessionInfo:v13];

  id v14 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v15 = [(PXImportController *)self importSessionInfo];
  [v15 setStartDate:v14];

  uint64_t v16 = [(PXImportController *)self importSessionInfo];
  [v16 setItemsToImport:v9];

  id v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v22 performChanges:&__block_literal_global_305_221650];
        long long v23 = [v22 importAsset];
        if (v23)
        {
          [v17 addObject:v23];
        }
        else
        {
          __int16 v24 = _importDataLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v45 = "-[PXImportController importItems:configuration:completion:]";
            __int16 v46 = 2112;
            uint64_t v47 = v22;
            _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_INFO, "%s: Warning: view model missing import asset: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v19);
  }

  [(PXImportController *)val setImportCompletionHandler:v34];
  if (v35)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F390F8]);
    v35[2](v35, v25);
  }
  else
  {
    id v25 = 0;
  }
  uint64_t v26 = [(PXImportController *)val powerController];
  objc_msgSend(v26, "addPowerAssertionForIdentifier:withReason:completion:", -[PXImportController importAssetsPowerAssertionIdentifier](val, "importAssetsPowerAssertionIdentifier"), 1, 0);

  [(PXImportMediaLoadingCoordinator *)val->_mediaLoadingCoordinator setPaused:1];
  objc_initWeak((id *)buf, val);
  uint64_t v27 = [MEMORY[0x1E4F390E8] sharedInstance];
  uint64_t v28 = [(PXImportController *)val importSource];
  long long v29 = [(PXImportController *)val photoLibrary];
  id v39 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __59__PXImportController_importItems_configuration_completion___block_invoke_306;
  v37[3] = &unk_1E5DC6660;
  objc_copyWeak(&v38, (id *)buf);
  [v27 importAssets:v17 fromImportSource:v28 intoLibrary:v29 withOptions:v25 progress:&v39 delegate:val performanceDelegate:0 atEnd:v37];
  id v30 = v39;

  [(PXImportController *)val setImportProgress:v30];
  [(PXImportController *)val startObservingImportProgress];
  [(PXImportController *)val performChanges:&__block_literal_global_310_221654];
  objc_destroyWeak(&v38);

  objc_destroyWeak((id *)buf);
}

void __59__PXImportController_importItems_configuration_completion___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v5;
  px_dispatch_on_main_queue();
}

uint64_t __59__PXImportController_importItems_configuration_completion___block_invoke_308(uint64_t a1, void *a2)
{
  return [a2 setImportingAssets:1];
}

void __59__PXImportController_importItems_configuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v2 = _importControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[PXImportController importItems:configuration:completion:]_block_invoke_2";
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%s: PHImportController completion block called", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finishImportingWithResults:*(void *)(a1 + 32)];
}

uint64_t __59__PXImportController_importItems_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setState:1];
}

- (void)setImportingAssets:(BOOL)a3
{
  if (self->_importingAssets != a3)
  {
    self->_importingAssets = a3;
    [(PXImportController *)self signalChange:2];
  }
}

- (void)setUserRequiredToTrustHostOnSourceDevice:(BOOL)a3
{
  if (self->_userRequiredToTrustHostOnSourceDevice != a3)
  {
    self->_userRequiredToTrustHostOnSourceDevice = a3;
    [(PXImportController *)self signalChange:8];
  }
}

- (id)viewModelMapForImportAssetsDataSourceManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__221611;
  __int16 v13 = __Block_byref_object_dispose__221612;
  id v14 = 0;
  id v5 = [(PXImportController *)self sharedViewModelsUpdateQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PXImportController_viewModelMapForImportAssetsDataSourceManager___block_invoke;
  v8[3] = &unk_1E5DD0588;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __67__PXImportController_viewModelMapForImportAssetsDataSourceManager___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sharedViewModelsById];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeDataSourceManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PXImportController *)self otherDataSourceManagersQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PXImportController_removeDataSourceManager___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__PXImportController_removeDataSourceManager___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) dataSourceManager];

  if (v2 == v3)
  {
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  id v4 = [*(id *)(a1 + 40) otherDataSourceManagers];
  id v5 = [v4 member:*(void *)(a1 + 32)];

  if (!v5)
  {
LABEL_7:
    id v6 = (PXImportController *)_PFAssertFailHandler();
    [(PXImportController *)v6 createDataSourceManagerWithLogIdentifier:v8];
    return;
  }
  id v9 = [*(id *)(a1 + 40) otherDataSourceManagers];
  [v9 removeObject:*(void *)(a1 + 32)];
}

- (id)createDataSourceManagerWithLogIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [PXImportAssetsDataSourceManager alloc];
  id v6 = [(PXImportController *)self dataSourceManager];
  SEL v7 = [(PXImportAssetsDataSourceManager *)v5 initWithAssetsFromDataSourceManager:v6 delegate:self logIdentifier:v4];

  id v8 = [(PXImportController *)self otherDataSourceManagersQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PXImportController_createDataSourceManagerWithLogIdentifier___block_invoke;
  v13[3] = &unk_1E5DD32A8;
  void v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  dispatch_sync(v8, v13);

  uint64_t v10 = v14;
  uint64_t v11 = v9;

  return v11;
}

void __63__PXImportController_createDataSourceManagerWithLogIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) otherDataSourceManagers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)userHasTrustedHostForImportSource:(id)a3
{
}

uint64_t __56__PXImportController_userHasTrustedHostForImportSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserRequiredToTrustHostOnSourceDevice:0];
}

- (void)userRequiredToTrustHostForImportSource:(id)a3
{
}

uint64_t __61__PXImportController_userRequiredToTrustHostForImportSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserRequiredToTrustHostOnSourceDevice:1];
}

- (void)nameDidChangeForImportSource:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXImportController_nameDidChangeForImportSource___block_invoke;
  v3[3] = &unk_1E5DC6618;
  v3[4] = self;
  [(PXImportController *)self performChanges:v3];
}

uint64_t __51__PXImportController_nameDidChangeForImportSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:128];
}

- (void)capabilitiesDidChangeForImportSource:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PXImportController_capabilitiesDidChangeForImportSource___block_invoke;
  v3[3] = &unk_1E5DC6618;
  v3[4] = self;
  [(PXImportController *)self performChanges:v3];
}

uint64_t __59__PXImportController_capabilitiesDidChangeForImportSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:64];
}

- (int64_t)importAsset:(id)a3 asDuplicateOfLibraryAsset:(id)a4 applyToAll:(BOOL *)a5
{
  return 0;
}

- (void)importSource:(id)a3 didRemoveAssets:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[PXImportSettings sharedInstance];
  char v7 = [v6 simulateEmptyImportSource];

  if ((v7 & 1) == 0)
  {
    id v8 = _importDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v42 = "-[PXImportController importSource:didRemoveAssets:]";
      __int16 v43 = 2048;
      uint64_t v44 = [v5 count];
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "%s: Did remove %tu assets", buf, 0x16u);
    }

    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v26 = self;
    uint64_t v10 = [(PXImportController *)self dataSourceManager];
    uint64_t v11 = [v10 dataSource];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v5;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v36 + 1) + 8 * v16) uuid];
          id v18 = [v11 itemForImportAssetUuid:v17];

          if (v18)
          {
            [v9 addObject:v18];
          }
          else
          {
            uint64_t v19 = _importDataLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              long long v42 = "-[PXImportController importSource:didRemoveAssets:]";
              _os_log_debug_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "%s: Unable to find view model for removed asset", buf, 0xCu);
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v14);
    }

    [(PXImportController *)v26 handleImportSourceModifiedAssets];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXImportController_importSource_didRemoveAssets___block_invoke;
    block[3] = &unk_1E5DD32A8;
    id v20 = v9;
    id v34 = v20;
    long long v35 = v26;
    dispatch_async(MEMORY[0x1E4F14428], block);
    long long v21 = [(PXImportController *)v26 dataSourceManager];
    [v21 removeAssets:v12];

    long long v22 = [(PXImportController *)v26 otherDataSourceManagersQueue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__PXImportController_importSource_didRemoveAssets___block_invoke_2;
    v31[3] = &unk_1E5DD32A8;
    v31[4] = v26;
    id v23 = v12;
    id v32 = v23;
    dispatch_sync(v22, v31);

    __int16 v24 = [(PXImportController *)v26 sharedViewModelsUpdateQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    _OWORD v28[2] = __51__PXImportController_importSource_didRemoveAssets___block_invoke_3;
    v28[3] = &unk_1E5DD32A8;
    id v29 = v23;
    id v30 = v26;
    dispatch_sync(v24, v28);

    if ([v20 count])
    {
      id v25 = [(PXImportController *)v26 deleteAction];
      [v25 didRemoveAssets:v20];
    }
    [(PXImportController *)v26 restartTimedAssetsLoadingPowerAssertion];
    [(PXImportController *)v26 performChanges:&__block_literal_global_281];

    id v5 = v27;
  }
}

void __51__PXImportController_importSource_didRemoveAssets___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "deselectItem:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __51__PXImportController_importSource_didRemoveAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeAssets:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __51__PXImportController_importSource_didRemoveAssets___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        long long v8 = objc_msgSend(*(id *)(a1 + 40), "sharedViewModelsById", (void)v10);
        long long v9 = [v7 uuid];
        [v8 removeObjectForKey:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t __51__PXImportController_importSource_didRemoveAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setUserRequiredToTrustHostOnSourceDevice:0];
}

- (void)importSource:(id)a3 didAddAssets:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[PXImportSettings sharedInstance];
  char v7 = [v6 simulateEmptyImportSource];

  if ((v7 & 1) == 0)
  {
    long long v8 = [(PXImportController *)self sharedViewModelsUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PXImportController_importSource_didAddAssets___block_invoke;
    block[3] = &unk_1E5DD32A8;
    id v9 = v5;
    id v19 = v9;
    id v20 = self;
    dispatch_sync(v8, block);

    [(PXImportController *)self handleImportSourceModifiedAssets];
    long long v10 = [(PXImportController *)self dataSourceManager];
    [v10 addAssets:v9];

    long long v11 = [(PXImportController *)self otherDataSourceManagersQueue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __48__PXImportController_importSource_didAddAssets___block_invoke_2;
    uint64_t v15 = &unk_1E5DD32A8;
    uint64_t v16 = self;
    id v17 = v9;
    dispatch_sync(v11, &v12);

    [(PXImportController *)self restartTimedAssetsLoadingPowerAssertion];
    [(PXImportController *)self performChanges:&__block_literal_global_279_221680];
  }
}

void __48__PXImportController_importSource_didAddAssets___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        long long v8 = objc_msgSend(*(id *)(a1 + 40), "sharedViewModelsById", (void)v13);
        id v9 = [v7 uuid];
        long long v10 = [v8 objectForKeyedSubscript:v9];

        if (!v10)
        {
          long long v10 = [[PXImportItemViewModel alloc] initWithImportAsset:v7];
          long long v11 = [*(id *)(a1 + 40) sharedViewModelsById];
          uint64_t v12 = [v7 uuid];
          [v11 setObject:v10 forKeyedSubscript:v12];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __48__PXImportController_importSource_didAddAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) addAssets:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __48__PXImportController_importSource_didAddAssets___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setUserRequiredToTrustHostOnSourceDevice:0];
}

- (void)startInitialBatchOfAssetsTimerWithTimeout:(double)a3
{
  uint64_t v5 = [(PXImportController *)self initialBatchOfAssetsTimer];
  int v6 = [v5 isValid];

  if (v6)
  {
    long long v7 = [(PXImportController *)self initialBatchOfAssetsTimer];
    [v7 invalidate];
  }
  objc_initWeak(&location, self);
  long long v8 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __64__PXImportController_startInitialBatchOfAssetsTimerWithTimeout___block_invoke;
  long long v13 = &unk_1E5DCD920;
  objc_copyWeak(&v14, &location);
  long long v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:&v10 block:a3];
  -[PXImportController setInitialBatchOfAssetsTimer:](self, "setInitialBatchOfAssetsTimer:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__PXImportController_startInitialBatchOfAssetsTimerWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _importControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v8 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Initial batch of assets have been loaded.", v8, 2u);
  }

  [v3 invalidate];
  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setInitialBatchOfAssetsTimer:0];

  id v7 = objc_loadWeakRetained(v5);
  [v7 performChanges:&__block_literal_global_275_221683];
}

void __64__PXImportController_startInitialBatchOfAssetsTimerWithTimeout___block_invoke_273(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setLoadingInitialBatchOfAssets:0];
  [v2 setHasLoadedInitialBatchOfAssets:1];
}

- (void)handleImportSourceModifiedAssets
{
  [(PXImportController *)self setHasReceivedImportSourceAssetChanges:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PXImportController_handleImportSourceModifiedAssets__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PXImportController_handleImportSourceModifiedAssets__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasLoadedInitialBatchOfAssets];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) performChanges:&__block_literal_global_271_221685];
    id v3 = *(void **)(a1 + 32);
    return [v3 startInitialBatchOfAssetsTimerWithTimeout:1.5];
  }
  return result;
}

uint64_t __54__PXImportController_handleImportSourceModifiedAssets__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLoadingInitialBatchOfAssets:1];
}

- (void)loadAssets
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXImportController *)self importSource];

  if (!v4)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v21 = NSStringFromSelector(sel_adoptImportSource_);
    [v20 handleFailureInMethod:a2, self, @"PXImportController.m", 339, @"%@ was asked to load assets with a nil import source. Call %@ first to set an import source.", self, v21 object file lineNumber description];
  }
  uint64_t v5 = _importControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[PXImportController loadAssets]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "%s: start", buf, 0xCu);
  }

  if (![(PXImportController *)self hasLoadedAssets])
  {
    [(PXImportController *)self performChanges:&__block_literal_global_263_221690];
    int64_t v6 = [(PXImportController *)self dateOrder];
    id v7 = +[PXImportSettings sharedInstance];
    uint64_t v8 = [v7 assetEnumerationBehavior];

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PXImportController_loadAssets__block_invoke_2;
    aBlock[3] = &unk_1E5DC65F0;
    objc_copyWeak(&v23, (id *)buf);
    aBlock[4] = self;
    long long v9 = _Block_copy(aBlock);
    +[PXImportSettings sharedInstance];
    if (v8) {
      uint64_t v10 = {;
    }
      uint64_t v11 = [v10 assetEnumerationBatchSize];

      importSource = self->_importSource;
      long long v13 = [(PXImportController *)self photoLibrary];
      id v14 = (id)[(PHImportSource *)importSource loadAssetsForLibrary:v13 allowDuplicates:0 order:v6 batchSize:v11 atEnd:v9];
    }
    else {
      long long v15 = {;
    }
      [v15 assetEnumerationBatchInterval];
      double v17 = v16;

      uint64_t v18 = self->_importSource;
      long long v13 = [(PXImportController *)self photoLibrary];
      id v19 = (id)[(PHImportSource *)v18 loadAssetsForLibrary:v13 allowDuplicates:0 order:v6 batchInterval:v9 atEnd:v17];
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __32__PXImportController_loadAssets__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _importControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[PXImportController loadAssets]_block_invoke_2";
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "%s: done", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHasLoadedAssets:1];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = [v9 mediaLoadingCoordinator];
  [v10 setPaused:0];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __32__PXImportController_loadAssets__block_invoke_265;
  v14[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  uint64_t v11 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v11;
  id v17 = v5;
  id v12 = v5;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v14);

  objc_destroyWeak(&v18);
}

void __32__PXImportController_loadAssets__block_invoke_265(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (([WeakRetained hasReceivedImportSourceAssetChanges] & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v2);
    id v5 = [v4 initialBatchOfAssetsTimer];

    if (v5) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained startInitialBatchOfAssetsTimerWithTimeout:5.0];
  }

LABEL_5:
  id v6 = objc_loadWeakRetained(v2);
  [v6 performChanges:&__block_literal_global_268_221693];

  if ([*(id *)(a1 + 32) count])
  {
    id v7 = _importControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_error_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Exceptions during asset loading: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = [*(id *)(a1 + 40) importCompletionDelegate];
    [v8 importController:*(void *)(a1 + 40) didLoadAssets:*(void *)(a1 + 48) exceptions:*(void *)(a1 + 32)];
  }
}

uint64_t __32__PXImportController_loadAssets__block_invoke_2_266(uint64_t a1, void *a2)
{
  return [a2 setLoadingContent:0];
}

void __32__PXImportController_loadAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setLoadingContent:1];
  [v2 setLoadingInitialBatchOfAssets:1];
}

- (void)setLoadingInitialBatchOfAssets:(BOOL)a3
{
  if (self->_loadingInitialBatchOfAssets != a3)
  {
    self->_loadingInitialBatchOfAssets = a3;
    [(PXImportController *)self signalChange:32];
  }
}

- (void)setHasLoadedInitialBatchOfAssets:(BOOL)a3
{
  if (self->_hasLoadedInitialBatchOfAssets != a3)
  {
    self->_hasLoadedInitialBatchOfAssets = a3;
    [(PXImportController *)self signalChange:16];
  }
}

- (void)setLoadingContent:(BOOL)a3
{
  if (self->_loadingContent != a3)
  {
    self->_loadingContent = a3;
    [(PXImportController *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXImportController;
  [(PXImportController *)&v3 performChanges:a3];
}

- (void)dealloc
{
  [(NSTimer *)self->_initialBatchOfAssetsTimer invalidate];
  initialBatchOfAssetsTimer = self->_initialBatchOfAssetsTimer;
  self->_initialBatchOfAssetsTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXImportController;
  [(PXImportController *)&v4 dealloc];
}

- (void)shutdown
{
}

void __30__PXImportController_shutdown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopObservingImportProgress];
  [*(id *)(a1 + 32) stopTimedAssetsLoadingPowerAssertion];
  [*(id *)(a1 + 32) performChanges:&__block_literal_global_221701];
  [*(id *)(*(void *)(a1 + 32) + 216) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 216);
  *(void *)(v2 + 216) = 0;

  [*(id *)(*(void *)(a1 + 32) + 296) shutdown];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 296);
  *(void *)(v4 + 296) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 272);
  *(void *)(v8 + 272) = 0;
}

void __30__PXImportController_shutdown__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setHasLoadedInitialBatchOfAssets:0];
  [v2 setLoadingInitialBatchOfAssets:0];
}

- (void)adoptImportSource:(id)a3
{
  id v5 = (PHImportSource *)a3;
  importSource = self->_importSource;
  uint64_t v8 = v5;
  if (importSource != v5)
  {
    [(PHImportSource *)importSource removeImportSourceObserver:self];
    objc_storeStrong((id *)&self->_importSource, a3);
    id v7 = [(PHImportSource *)v8 assets];
    [(PXImportController *)self importSource:v8 didAddAssets:v7];

    [(PHImportSource *)v8 addImportSourceObserver:self];
  }
}

- (PXImportController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportController.m", 153, @"%s is not available as initializer", "-[PXImportController init]");

  abort();
}

- (PXImportController)initWithImportSource:(id)a3 photoLibrary:(id)a4 imageFormat:(unsigned __int16)a5 dateOrder:(int64_t)a6
{
  uint64_t v7 = a5;
  id v11 = a3;
  id v12 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PXImportController;
  id v13 = [(PXImportController *)&v45 init];
  id v14 = v13;
  if (v13)
  {
    v13->_dateOrder = a6;
    objc_storeStrong((id *)&v13->_importSource, a3);
    [(PHImportSource *)v14->_importSource addImportSourceObserver:v14];
    objc_storeStrong((id *)&v14->_photoLibrary, a4);
    v14->_imageFormat = v7;
    id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedViewModelsById = v14->_sharedViewModelsById;
    v14->_sharedViewModelsById = v15;

    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);

    id v19 = NSString;
    id v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    id v22 = [v19 stringWithFormat:@"%@-sharedViewModelsUpdateQueue", v21];
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], v18);
    sharedViewModelsUpdateQueue = v14->_sharedViewModelsUpdateQueue;
    v14->_sharedViewModelsUpdateQueue = (OS_dispatch_queue *)v23;

    id v25 = NSString;
    uint64_t v26 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v26);
    id v28 = [v25 stringWithFormat:@"%@-otherDataSourceManagersQueue", v27];
    dispatch_queue_t v29 = dispatch_queue_create((const char *)[v28 UTF8String], v18);
    otherDataSourceManagersQueue = v14->_otherDataSourceManagersQueue;
    v14->_otherDataSourceManagersQueue = (OS_dispatch_queue *)v29;

    long long v31 = [[PXImportAssetsDataSourceManager alloc] initWithDelegate:v14 logIdentifier:@"primary"];
    dataSourceManager = v14->_dataSourceManager;
    v14->_dataSourceManager = v31;

    v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    otherDataSourceManagers = v14->_otherDataSourceManagers;
    v14->_otherDataSourceManagers = v33;

    v14->_BOOL alreadyImportedItemsSelectable = 1;
    long long v35 = [(PXImportController *)v14 createDataSourceManagerWithLogIdentifier:@"selection"];
    [v35 setDispatchesDataSourceUpdatesOnMainQueue:1];
    uint64_t v36 = [objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v35];
    selectionManager = v14->_selectionManager;
    v14->_selectionManager = (PXSectionedSelectionManager *)v36;

    [(PXSectionedSelectionManager *)v14->_selectionManager registerChangeObserver:v14 context:PXImportControllerSelectionManagerObserverContext];
    long long v38 = [[PXImportMediaProvider alloc] initWithImageFormat:v7];
    importMediaProvider = v14->_importMediaProvider;
    v14->_importMediaProvider = v38;

    uint64_t v40 = +[PXPowerController sharedController];
    powerController = v14->_powerController;
    v14->_powerController = (PXPowerController *)v40;

    v14->_importAssetsPowerAssertionIdentifier = [(PXPowerController *)v14->_powerController generateAssertionIdentifier];
    v14->_deleteAssetsPowerAssertionIdentifier = [(PXPowerController *)v14->_powerController generateAssertionIdentifier];
    v14->_loadAssetsPowerAssertionIdentifier = [(PXPowerController *)v14->_powerController generateAssertionIdentifier];
    long long v42 = [[PXImportMediaLoadingCoordinator alloc] initWithImportController:v14];
    mediaLoadingCoordinator = v14->_mediaLoadingCoordinator;
    v14->_mediaLoadingCoordinator = v42;
  }
  return v14;
}

- (PXImportController)initWithImportSource:(id)a3 photoLibrary:(id)a4 imageFormat:(unsigned __int16)a5
{
  return [(PXImportController *)self initWithImportSource:a3 photoLibrary:a4 imageFormat:a5 dateOrder:0];
}

+ (id)importFilesAtURLs:(id)a3 photoLibrary:(id)a4 collection:(id)a5 checkDuplicates:(BOOL)a6 referenced:(BOOL)a7 delegate:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a5;
  id v19 = a3;
  int v20 = objc_msgSend(v18, "px_isFavoritesSmartAlbum");
  id v21 = objc_alloc_init(MEMORY[0x1E4F390F8]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v20) {
    id v23 = 0;
  }
  else {
    id v23 = v18;
  }
  if (isKindOfClass) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }
  [v21 setDestinationAlbum:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v25 = v18;
  }
  else {
    id v25 = 0;
  }
  [v21 setDestinationFolder:v25];

  uint64_t v26 = [v21 destinationFolder];
  [v21 setPreserveFolderStructure:v26 != 0];

  [v21 setAllowDuplicates:!v11];
  [v21 setShouldImportAsReferenced:v10];
  id v27 = [MEMORY[0x1E4F390E8] sharedInstance];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __118__PXImportController_importFilesAtURLs_photoLibrary_collection_checkDuplicates_referenced_delegate_completionHandler___block_invoke;
  v32[3] = &unk_1E5DC65C8;
  char v36 = v20;
  id v34 = v16;
  id v35 = a1;
  id v33 = v15;
  id v28 = v16;
  id v29 = v15;
  id v30 = [v27 importUrls:v19 intoLibrary:v29 withOptions:v21 delegate:v17 performanceDelegate:0 atEnd:v32];

  return v30;
}

void __118__PXImportController_importFilesAtURLs_photoLibrary_collection_checkDuplicates_referenced_delegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 48) favoriteAssetsFromImportResults:v3 photoLibrary:*(void *)(a1 + 32)];
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v4;
    v3;
    px_dispatch_on_main_queue();
  }
}

uint64_t __118__PXImportController_importFilesAtURLs_photoLibrary_collection_checkDuplicates_referenced_delegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)favoriteAssetsFromImportResults:(id)a3 photoLibrary:(id)a4
{
  id v5 = a4;
  [a3 importRecords];
  objc_claimAutoreleasedReturnValue();
  PXMap();
}

void __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F38ED0], "changeRequestForAsset:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFavorite:1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Error marking assets as favorite: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

+ (id)itemsConstrainedByAvailableDiskSpaceFromItems:(id)a3 additionalBytesRequired:(int64_t *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  uint64_t v7 = [v6 path];

  uint64_t v8 = [MEMORY[0x1E4F8B8D8] diskSpaceAvailableForPath:v7];
  id v28 = (id)objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v26 = a4;
    id v27 = v7;
    char v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v17 = [v16 importAsset];
        uint64_t v18 = [v17 approximateBytesRequiredToImport];

        if (!v18) {
          _PFAssertContinueHandler();
        }
        v13 += v18;
        uint64_t v19 = v13 + 0x200000;
        if (v13 + 0x200000 >= v8) {
          char v12 = 1;
        }
        else {
          [v28 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v43 count:16];
    }
    while (v11);

    if (v12) {
      int64_t v20 = v13 + 0x200000 - v8;
    }
    else {
      int64_t v20 = 0;
    }
    a4 = v26;
    uint64_t v7 = v27;
  }
  else
  {

    int64_t v20 = 0;
    uint64_t v19 = 0x200000;
  }
  *a4 = v20;
  id v21 = _importControllerLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [v9 count];
    int64_t v24 = *a4;
    uint64_t v25 = [v28 count];
    *(_DWORD *)buf = 134219008;
    uint64_t v34 = v23;
    __int16 v35 = 2048;
    uint64_t v36 = v19;
    __int16 v37 = 2048;
    uint64_t v38 = v8;
    __int16 v39 = 2048;
    int64_t v40 = v24;
    __int16 v41 = 2048;
    uint64_t v42 = v25;
    _os_log_debug_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEBUG, "%lu items totalling %lld bytes with %lld bytes available leaves %lld additional bytes required. (%lu items importable.)", buf, 0x34u);
  }

  return v28;
}

+ (int64_t)diskSpaceRequiredToImportItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) importAsset];
        uint64_t v10 = [v9 approximateBytesRequiredToImport];

        if (!v10) {
          _PFAssertContinueHandler();
        }
        v6 += v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
    int64_t v11 = v6 + 0x200000;
  }
  else
  {
    int64_t v11 = 0x200000;
  }

  return v11;
}

+ (id)assetsForModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "importAsset", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)importOperationQueue
{
  if (importOperationQueue_onceToken != -1) {
    dispatch_once(&importOperationQueue_onceToken, &__block_literal_global_233_221753);
  }
  uint64_t v2 = (void *)importOperationQueue__importQueue;
  return v2;
}

uint64_t __42__PXImportController_importOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v1 = (void *)importOperationQueue__importQueue;
  importOperationQueue__importQueue = (uint64_t)v0;

  [(id)importOperationQueue__importQueue setQualityOfService:25];
  uint64_t v2 = (void *)importOperationQueue__importQueue;
  return [v2 setMaxConcurrentOperationCount:2];
}

@end