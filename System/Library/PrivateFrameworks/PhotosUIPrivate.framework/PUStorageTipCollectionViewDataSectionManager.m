@interface PUStorageTipCollectionViewDataSectionManager
- (NSMutableDictionary)fetchResults;
- (OS_dispatch_queue)tipQueue;
- (PHPhotoLibrary)photoLibrary;
- (PUStorageTipCollectionViewDataSection)pendingDataSection;
- (PUStorageTipCollectionViewDataSectionManager)initWithPhotoLibrary:(id)a3;
- (id)createDataSection;
- (id)tipQueue_fetchCountsDictionary;
- (id)tipQueue_fetchSizesDictionary;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)setPendingDataSection:(id)a3;
- (void)tipQueue_createPendingDataSection;
- (void)tipQueue_populateInitialFetches;
@end

@implementation PUStorageTipCollectionViewDataSectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDataSection, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_storeStrong((id *)&self->_tipQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setPendingDataSection:(id)a3
{
}

- (PUStorageTipCollectionViewDataSection)pendingDataSection
{
  return self->_pendingDataSection;
}

- (NSMutableDictionary)fetchResults
{
  return self->_fetchResults;
}

- (OS_dispatch_queue)tipQueue
{
  return self->_tipQueue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  tipQueue = self->_tipQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PUStorageTipCollectionViewDataSectionManager_photoLibraryDidChangeOnMainQueue___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(tipQueue, v7);
}

void __81__PUStorageTipCollectionViewDataSectionManager_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSection];
  uint64_t v3 = [v2 count];

  if (v3 >= 1)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      id v6 = *(void **)(a1 + 40);
      v7 = [*(id *)(a1 + 32) fetchResults];
      id v8 = [NSNumber numberWithInteger:v5];
      v9 = [v7 objectForKeyedSubscript:v8];
      v10 = [v6 changeDetailsForFetchResult:v9];

      if (v10)
      {
        v11 = [v10 fetchResultAfterChanges];
        v12 = [*(id *)(a1 + 32) fetchResults];
        v13 = [NSNumber numberWithInteger:v5];
        [v12 setObject:v11 forKeyedSubscript:v13];

        char v4 = 1;
      }

      ++v5;
      v14 = [*(id *)(a1 + 32) dataSection];
      uint64_t v15 = [v14 count];
    }
    while (v5 < v15);
    if (v4)
    {
      v16 = *(void **)(a1 + 32);
      objc_msgSend(v16, "tipQueue_createPendingDataSection");
    }
  }
}

- (id)tipQueue_fetchCountsDictionary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(PUStorageTipCollectionViewDataSectionManager *)self fetchResults];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = (int)[*(id *)(*((void *)&v17 + 1) + 8 * i) intValue];
        id v8 = NSNumber;
        v9 = [(PUStorageTipCollectionViewDataSectionManager *)self fetchResults];
        v10 = [NSNumber numberWithUnsignedInteger:v7];
        v11 = [v9 objectForKeyedSubscript:v10];
        v12 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        v13 = [NSNumber numberWithUnsignedInteger:v7];
        [v16 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v16;
}

- (id)tipQueue_fetchSizesDictionary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [(PUStorageTipCollectionViewDataSectionManager *)self photoLibrary];
  id v22 = 0;
  id v23 = 0;
  char v3 = [v2 cloudQuotaResourceBytesUsed:&v23 error:&v22];
  id v4 = v23;
  id v5 = v22;

  if ((v3 & 1) == 0 && !v5)
  {
    id v6 = PXAssertGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to get iCloud storage used with error %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v14 = +[PUStorageTipListItem storageTipTypeForCloudQuotaUsedBytesIdentifier:](PUStorageTipListItem, "storageTipTypeForCloudQuotaUsedBytesIdentifier:", v13, (void)v18);
        uint64_t v15 = [v8 objectForKeyedSubscript:v13];
        id v16 = [NSNumber numberWithUnsignedInteger:v14];
        [v7 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)tipQueue_createPendingDataSection
{
  char v3 = [PUStorageTipCollectionViewDataSection alloc];
  id v4 = [(PUStorageTipCollectionViewDataSectionManager *)self tipQueue_fetchSizesDictionary];
  id v5 = [(PUStorageTipCollectionViewDataSectionManager *)self tipQueue_fetchCountsDictionary];
  id v6 = [(PUStorageTipCollectionViewDataSection *)v3 initWithSizesDictionary:v4 countsDictionary:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PUStorageTipCollectionViewDataSectionManager_tipQueue_createPendingDataSection__block_invoke;
  v8[3] = &unk_1E5F2ECC8;
  v8[4] = self;
  uint64_t v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __81__PUStorageTipCollectionViewDataSectionManager_tipQueue_createPendingDataSection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingDataSection:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F91218] changeDetailsWithNoIncrementalChanges];
  [v2 updateDataSectionWithChangeDetails:v3];
}

- (void)tipQueue_populateInitialFetches
{
  id v9 = [(PUStorageTipCollectionViewDataSectionManager *)self photoLibrary];
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v4 = +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:i photoLibrary:v9];
    id v5 = +[PUStorageManagementUtility storageTipAssetCollectionForType:i photoLibrary:v9];
    id v6 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v4];
    id v7 = [(PUStorageTipCollectionViewDataSectionManager *)self fetchResults];
    id v8 = [NSNumber numberWithUnsignedInteger:i];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (id)createDataSection
{
  id v3 = [(PUStorageTipCollectionViewDataSectionManager *)self pendingDataSection];
  [(PUStorageTipCollectionViewDataSectionManager *)self setPendingDataSection:0];
  return v3;
}

- (PUStorageTipCollectionViewDataSectionManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUStorageTipCollectionViewDataSectionManager;
  id v6 = [(PXDataSectionManager *)&v19 initWithChildDataSectionManagers:MEMORY[0x1E4F1CBF0]];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    [(PHPhotoLibrary *)v7->_photoLibrary px_registerChangeObserver:v7];
    dispatch_queue_t v8 = dispatch_queue_create("storageTipQueue", 0);
    tipQueue = v7->_tipQueue;
    v7->_tipQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchResults = v7->_fetchResults;
    v7->_fetchResults = v10;

    v12 = [[PUStorageTipCollectionViewDataSection alloc] initWithZerosWithStorageTipCount:3];
    pendingDataSection = v7->_pendingDataSection;
    v7->_pendingDataSection = v12;

    unint64_t v14 = [MEMORY[0x1E4F91218] changeDetailsWithNoIncrementalChanges];
    [(PXDataSectionManager *)v7 updateDataSectionWithChangeDetails:v14];

    uint64_t v15 = v7->_tipQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PUStorageTipCollectionViewDataSectionManager_initWithPhotoLibrary___block_invoke;
    block[3] = &unk_1E5F2ED10;
    long long v18 = v7;
    dispatch_async(v15, block);
  }
  return v7;
}

uint64_t __69__PUStorageTipCollectionViewDataSectionManager_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "tipQueue_populateInitialFetches");
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "tipQueue_createPendingDataSection");
}

@end