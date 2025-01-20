@interface PXAssetMetadataDonator
+ (PXAssetMetadataDonator)sharedDonator;
+ (id)new;
- (NSCountedSet)locationDescriptions;
- (NSMutableDictionary)locationDescriptionsByAssetLocalIdentifiers;
- (OS_dispatch_queue)backgroundQueue;
- (PXAssetMetadataDonator)init;
- (id)_init;
- (void)_notifyWhenDonationIsComplete:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)donate:(id)a3;
- (void)donateMetadataForAsset:(id)a3;
- (void)setBackgroundQueue:(id)a3;
- (void)setLocationDescriptions:(id)a3;
- (void)setLocationDescriptionsByAssetLocalIdentifiers:(id)a3;
@end

@implementation PXAssetMetadataDonator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDescriptionsByAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_locationDescriptions, 0);
}

- (void)setLocationDescriptionsByAssetLocalIdentifiers:(id)a3
{
}

- (NSMutableDictionary)locationDescriptionsByAssetLocalIdentifiers
{
  return self->_locationDescriptionsByAssetLocalIdentifiers;
}

- (void)setBackgroundQueue:(id)a3
{
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setLocationDescriptions:(id)a3
{
}

- (NSCountedSet)locationDescriptions
{
  return self->_locationDescriptions;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke;
  v12[3] = &unk_1E5DD0588;
  id v6 = v5;
  id v13 = v6;
  v14 = &v15;
  uint64_t v7 = [v6 beginBackgroundTaskWithName:@"Asset Metadata Donation" expirationHandler:v12];
  v16[3] = v7;
  [(PXAssetMetadataDonator *)self donate:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke_2;
  v9[3] = &unk_1E5DD0588;
  id v8 = v6;
  id v10 = v8;
  v11 = &v15;
  [(PXAssetMetadataDonator *)self _notifyWhenDonationIsComplete:v9];

  _Block_object_dispose(&v15, 8);
}

uint64_t __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke_2(uint64_t a1)
{
}

uint64_t __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)_notifyWhenDonationIsComplete:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    char v12 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXAssetMetadataDonator__notifyWhenDonationIsComplete___block_invoke;
    aBlock[3] = &unk_1E5DCA938;
    aBlock[4] = self;
    id v10 = v11;
    id v9 = v4;
    id v6 = _Block_copy(aBlock);
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_after(v7, MEMORY[0x1E4F14428], v6);
    dispatch_async((dispatch_queue_t)self->_backgroundQueue, v6);

    _Block_object_dispose(v11, 8);
  }
}

void __56__PXAssetMetadataDonator__notifyWhenDonationIsComplete___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_sync_exit(obj);
}

- (void)donate:(id)a3
{
  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXAssetMetadataDonator_donate___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(backgroundQueue, block);
}

void __33__PXAssetMetadataDonator_donate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = [*(id *)(a1 + 32) locationDescriptions];
  if ([v17 count])
  {
    v1 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v2 = v17;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v20;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v20 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void *)(*((void *)&v19 + 1) + 8 * v5);
          uint64_t v23 = 0;
          v24 = &v23;
          uint64_t v25 = 0x2050000000;
          dispatch_time_t v7 = (void *)getPPLocationNamedEntitiesClass_softClass;
          uint64_t v26 = getPPLocationNamedEntitiesClass_softClass;
          if (!getPPLocationNamedEntitiesClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getPPLocationNamedEntitiesClass_block_invoke;
            v29 = &unk_1E5DD2B08;
            v30 = &v23;
            __getPPLocationNamedEntitiesClass_block_invoke((uint64_t)buf);
            dispatch_time_t v7 = (void *)v24[3];
          }
          id v8 = v7;
          _Block_object_dispose(&v23, 8);
          id v9 = objc_alloc_init(v8);
          [v9 setUnstructuredLocationString:v6];
          [v1 addObject:v9];

          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v3);
    }

    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v10 = (void *)getPPCustomDonationClass_softClass;
    uint64_t v26 = getPPCustomDonationClass_softClass;
    if (!getPPCustomDonationClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getPPCustomDonationClass_block_invoke;
      v29 = &unk_1E5DD2B08;
      v30 = &v23;
      __getPPCustomDonationClass_block_invoke((uint64_t)buf);
      id v10 = (void *)v24[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v23, 8);
    id v18 = 0;
    char v12 = [v11 donatePhotosOneUpLocationNamedEntities:v1 bundleId:@"com.apple.mobileslideshow" error:&v18];
    id v13 = v18;
    if (v12)
    {
      v14 = [*(id *)(a1 + 32) locationDescriptions];
      [v14 removeAllObjects];

      uint64_t v15 = [*(id *)(a1 + 32) locationDescriptionsByAssetLocalIdentifiers];
      [v15 removeAllObjects];
    }
    else
    {
      uint64_t v15 = PLUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PXAssetMetadataDonator donate:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
      }
    }
  }
}

- (void)donateMetadataForAsset:(id)a3
{
  id v4 = a3;
  backgroundQueue = self->_backgroundQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PXAssetMetadataDonator_donateMetadataForAsset___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(backgroundQueue, v7);
}

void __49__PXAssetMetadataDonator_donateMetadataForAsset___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locationDescriptionsByAssetLocalIdentifiers];
  uint64_t v3 = [*(id *)(a1 + 40) localIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    char v10 = 0;
    [*(id *)(a1 + 40) fetchPropertySetsIfNeeded];
    uint64_t v5 = [*(id *)(a1 + 40) photosOneUpProperties];
    id v6 = [v5 localizedGeoDescriptionIsHome:&v10];

    if (v6)
    {
      dispatch_time_t v7 = [*(id *)(a1 + 32) locationDescriptionsByAssetLocalIdentifiers];
      id v8 = [*(id *)(a1 + 40) localIdentifier];
      [v7 setObject:v6 forKeyedSubscript:v8];

      if (!v10)
      {
        id v9 = [*(id *)(a1 + 32) locationDescriptions];
        [v9 addObject:v6];
      }
    }
  }
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)PXAssetMetadataDonator;
  id v2 = [(PXAssetMetadataDonator *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    [(PXAssetMetadataDonator *)v2 setLocationDescriptions:v3];

    dispatch_queue_t v4 = dispatch_queue_create("PXAssetMetadataDonator Background Queue", 0);
    [(PXAssetMetadataDonator *)v2 setBackgroundQueue:v4];

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PXAssetMetadataDonator *)v2 setLocationDescriptionsByAssetLocalIdentifiers:v5];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    dispatch_time_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v6 addObserver:v2 selector:sel_donate_ name:*MEMORY[0x1E4FB2738] object:v7];
    [v6 addObserver:v2 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:v7];
  }
  return v2;
}

- (PXAssetMetadataDonator)init
{
  dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetMetadataDonator.m", 48, @"%s is not available as initializer", "-[PXAssetMetadataDonator init]");

  abort();
}

+ (PXAssetMetadataDonator)sharedDonator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXAssetMetadataDonator_sharedDonator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDonator_onceToken != -1) {
    dispatch_once(&sharedDonator_onceToken, block);
  }
  id v2 = (void *)sharedDonator_sharedDonator;
  return (PXAssetMetadataDonator *)v2;
}

void __39__PXAssetMetadataDonator_sharedDonator__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  id v2 = (void *)sharedDonator_sharedDonator;
  sharedDonator_sharedDonator = v1;
}

+ (id)new
{
  dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXAssetMetadataDonator.m", 44, @"%s is not available as initializer", "+[PXAssetMetadataDonator new]");

  abort();
}

@end