@interface PKRemoteAssetManager
- (BOOL)addRemoteAssetData:(id)a3 forManifestItem:(id)a4 error:(id *)a5;
- (BOOL)addRemoteAssetData:(id)a3 shouldWriteData:(BOOL)a4 forManifestItem:(id)a5 error:(id *)a6;
- (BOOL)assetExistsLocally:(id)a3;
- (BOOL)hasEncryptedDeviceSpecificItemWithRelativePath:(id)a3;
- (NSArray)seids;
- (PKRemoteAssetManager)init;
- (PKRemoteAssetManager)initWithDirectoryCoordinator:(id)a3;
- (PKRemoteAssetManager)initWithFileURL:(id)a3;
- (id)deviceSpecificItems;
- (id)deviceSpecificItemsForScreenScale:(double)a3 suffix:(id)a4;
- (id)itemWithRelativePath:(id)a3;
- (id)pendingRemoteAssetsItems;
- (id)pendingRemoteAssetsItemsForScreenScale:(double)a3 suffix:(id)a4;
- (id)remoteAssetManifests;
- (id)sha1HexFromRelativeManifestWithRelativePath:(id)a3;
- (void)_callCompletionHandlersWithFinishState:(BOOL)a3 progress:(float)a4 error:(id)a5;
- (void)_downloadRemoteAssetItem:(id)a3 withCloudStoreCoordinatorDelegate:(id)a4 shouldWriteData:(BOOL)a5 completion:(id)a6;
- (void)_downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 requireRequiredAssets:(BOOL)a6 completion:(id)a7;
- (void)_flushBundleCaches;
- (void)downloadRemoteAssetItem:(id)a3 withCloudStoreCoordinatorDelegate:(id)a4 completion:(id)a5;
- (void)downloadRemoteAssetsWithCompletion:(id)a3;
- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ignoreRequiredAssetDownloadFailures:(BOOL)a6 completion:(id)a7;
- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 completion:(id)a5;
- (void)setSeids:(id)a3;
@end

@implementation PKRemoteAssetManager

- (PKRemoteAssetManager)init
{
  return 0;
}

- (PKRemoteAssetManager)initWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [[PKDirectoryCoordinator alloc] initWithURL:v4];

  v6 = [(PKRemoteAssetManager *)self initWithDirectoryCoordinator:v5];
  return v6;
}

- (PKRemoteAssetManager)initWithDirectoryCoordinator:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKRemoteAssetManager;
  v6 = [(PKRemoteAssetManager *)&v18 init];
  if (v6)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PKRemoteAssetManager_initWithDirectoryCoordinator___block_invoke;
    v13[3] = &unk_1E56EBF28;
    v13[4] = &v14;
    [v5 performCoordinatedAction:v13];
    if (*((unsigned char *)v15 + 24))
    {
      objc_storeStrong((id *)&v6->_coordinator, a3);
      p_super = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.passKitCore.remoteAssetManager", p_super);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v8;

      v6->_lock._os_unfair_lock_opaque = 0;
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      completionHandlers = v6->_completionHandlers;
      v6->_completionHandlers = v10;
    }
    else
    {
      p_super = &v6->super;
      v6 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v6;
}

void __53__PKRemoteAssetManager_initWithDirectoryCoordinator___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = 0;
    [a2 getResourceValue:&v4 forKey:*MEMORY[0x1E4F1C628] error:0];
    id v3 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
  }
}

- (id)remoteAssetManifests
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  coordinator = self->_coordinator;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PKRemoteAssetManager_remoteAssetManifests__block_invoke;
  v9[3] = &unk_1E56EBF50;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v9];
  v6 = v10;
  id v7 = v5;

  return v7;
}

void __44__PKRemoteAssetManager_remoteAssetManifests__block_invoke(uint64_t a1, void *a2)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v23 = a1;
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = *MEMORY[0x1E4F1C628];
    v33[0] = *MEMORY[0x1E4F1C5F8];
    v33[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1C680];
    v33[2] = *MEMORY[0x1E4F1C680];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
    id v24 = v3;
    dispatch_queue_t v8 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v7 options:0 errorHandler:0];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v27 = 0;
          int v14 = [v13 getResourceValue:&v27 forKey:v6 error:0];
          id v15 = v27;
          uint64_t v16 = v15;
          if (v14 && ([v15 BOOLValue] & 1) != 0)
          {
            char v17 = 0;
          }
          else
          {
            id v26 = 0;
            int v18 = [v13 getResourceValue:&v26 forKey:v5 error:0];
            id v19 = v26;
            char v17 = v19;
            if (!v18 || ([v19 BOOLValue] & 1) == 0)
            {
              v20 = [v13 pathExtension];
              int v21 = [v20 isEqualToString:@"urls"];

              if (v21)
              {
                v22 = [[PKRemoteAssetManifest alloc] initWithFileURL:v13 passURL:v24 deviceSEIDs:*(void *)(*(void *)(v23 + 32) + 56) error:0];
                if (v22) {
                  [*(id *)(v23 + 40) addObject:v22];
                }
              }
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    id v3 = v24;
  }
}

- (id)deviceSpecificItems
{
  double v3 = PKScreenScale();
  return [(PKRemoteAssetManager *)self deviceSpecificItemsForScreenScale:0 suffix:v3];
}

- (id)deviceSpecificItemsForScreenScale:(double)a3 suffix:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PKRemoteAssetManager *)self remoteAssetManifests];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "deviceSpecificAssetForScreenScale:suffix:", v6, a3, (void)v19);
        id v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 seid];
          if (!v16 || (seids = self->_seids) == 0 || [(NSArray *)seids containsObject:v16]) {
            [v8 addObject:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)pendingRemoteAssetsItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKRemoteAssetManager *)self pendingRemoteAssetsItemsForScreenScale:0 suffix:PKScreenScale()];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)pendingRemoteAssetsItemsForScreenScale:(double)a3 suffix:(id)a4
{
  uint64_t v5 = [(PKRemoteAssetManager *)self deviceSpecificItemsForScreenScale:a4 suffix:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKRemoteAssetManager_pendingRemoteAssetsItemsForScreenScale_suffix___block_invoke;
  v8[3] = &unk_1E56EBF78;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "pk_objectsPassingTest:", v8);

  return v6;
}

uint64_t __70__PKRemoteAssetManager_pendingRemoteAssetsItemsForScreenScale_suffix___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) assetExistsLocally:a2] ^ 1;
}

- (id)itemWithRelativePath:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  manifestItemsByRelativeURL = self->_manifestItemsByRelativeURL;
  if (!manifestItemsByRelativeURL)
  {
    id v21 = v4;
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = self->_manifestItemsByRelativeURL;
    self->_manifestItemsByRelativeURL = v6;

    [(PKRemoteAssetManager *)self remoteAssetManifests];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) remoteAssets];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = [v11 objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                char v17 = [v16 relativeLocalPath];
                if (v17) {
                  [(NSMutableDictionary *)self->_manifestItemsByRelativeURL setObject:v16 forKey:v17];
                }
                int v18 = [v16 relativeEncryptedContentsLocalPath];
                if (v18) {
                  [(NSMutableDictionary *)self->_manifestItemsByRelativeURL setObject:v16 forKey:v18];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    manifestItemsByRelativeURL = self->_manifestItemsByRelativeURL;
    id v4 = v21;
  }
  long long v19 = [(NSMutableDictionary *)manifestItemsByRelativeURL objectForKey:v4];

  return v19;
}

- (id)sha1HexFromRelativeManifestWithRelativePath:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sha1HexFromRelativeManifest = self->_sha1HexFromRelativeManifest;
  if (!sha1HexFromRelativeManifest)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = self->_sha1HexFromRelativeManifest;
    self->_sha1HexFromRelativeManifest = v6;

    uint64_t v8 = [(PKRemoteAssetManager *)self remoteAssetManifests];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) remoteAssets];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke;
          v16[3] = &unk_1E56EBFC8;
          v16[4] = self;
          [v13 enumerateKeysAndObjectsUsingBlock:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    sha1HexFromRelativeManifest = self->_sha1HexFromRelativeManifest;
  }
  uint64_t v14 = [(NSMutableDictionary *)sha1HexFromRelativeManifest objectForKey:v4];

  return v14;
}

void __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 manifest];
  if ([v6 count])
  {
    id v7 = [v5 stringByDeletingPathExtension];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke_2;
    v10[3] = &unk_1E56EBFA0;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    id v9 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  if (v5) {
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v6 forKey:v5];
  }
}

- (BOOL)hasEncryptedDeviceSpecificItemWithRelativePath:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKRemoteAssetManager *)self remoteAssetManifests];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__42;
  v38 = __Block_byref_object_dispose__42;
  id v39 = 0;
  coordinator = self->_coordinator;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__PKRemoteAssetManager_hasEncryptedDeviceSpecificItemWithRelativePath___block_invoke;
  v33[3] = &unk_1E56EBF28;
  v33[4] = &v34;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v33];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v8)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v23 = v8;
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v11 = (void *)v35[5];
        uint64_t v12 = objc_msgSend(v10, "fileURL", v23);
        uint64_t v13 = [v12 URLByDeletingLastPathComponent];
        uint64_t v14 = PKRelativePathAfterResolvingSymlinks(v11, v13);

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = [v10 encryptedDeviceSpecificRemoteAssetFilenames];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v15);
              }
              long long v19 = [v14 stringByAppendingString:*(void *)(*((void *)&v25 + 1) + 8 * j)];
              char v20 = [v4 isEqualToString:v19];

              if (v20)
              {

                BOOL v21 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v40 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
      BOOL v21 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_19:

  _Block_object_dispose(&v34, 8);
  return v21;
}

void __71__PKRemoteAssetManager_hasEncryptedDeviceSpecificItemWithRelativePath___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)assetExistsLocally:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  coordinator = self->_coordinator;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PKRemoteAssetManager_assetExistsLocally___block_invoke;
  v8[3] = &unk_1E56DC3C0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v8];
  LOBYTE(coordinator) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)coordinator;
}

void __43__PKRemoteAssetManager_assetExistsLocally___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v15 = v3;
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = [*(id *)(a1 + 32) localURL];
    id v6 = [v5 path];
    int v7 = [v4 fileExistsAtPath:v6];

    id v3 = v15;
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9B8];
      id v9 = [*(id *)(a1 + 32) localURL];
      uint64_t v10 = [v8 dataWithContentsOfURL:v9];

      if (v10)
      {
        uint64_t v11 = [v10 SHA1Hash];
        uint64_t v12 = [v11 hexEncoding];
        uint64_t v13 = [*(id *)(a1 + 32) sha1Hex];
        int v14 = [v12 isEqualToString:v13];

        if (v14) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
      }

      id v3 = v15;
    }
  }
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ignoreRequiredAssetDownloadFailures:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v15 = [(NSMutableArray *)self->_completionHandlers count];
  if (v14)
  {
    completionHandlers = self->_completionHandlers;
    uint64_t v17 = _Block_copy(v14);
    [(NSMutableArray *)completionHandlers addObject:v17];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (!v15)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __144__PKRemoteAssetManager_downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_ignoreRequiredAssetDownloadFailures_completion___block_invoke;
    v20[3] = &unk_1E56E3A98;
    v20[4] = self;
    double v24 = a3;
    id v21 = v12;
    id v22 = v13;
    BOOL v25 = a6;
    id v23 = v14;
    long long v18 = _Block_copy(v20);
    if (PKPaymentPassArtDownloadDelayEnabled())
    {
      dispatch_time_t v19 = dispatch_time(0, 30000000000);
      dispatch_after(v19, (dispatch_queue_t)self->_queue, v18);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_queue, v18);
    }
  }
}

uint64_t __144__PKRemoteAssetManager_downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_ignoreRequiredAssetDownloadFailures_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadRemoteAssetsWithScreenScale:*(void *)(a1 + 40) suffix:*(void *)(a1 + 48) cloudStoreCoordinatorDelegate:*(unsigned char *)(a1 + 72) == 0 requireRequiredAssets:*(void *)(a1 + 56) completion:*(double *)(a1 + 64)];
}

- (void)_downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 requireRequiredAssets:(BOOL)a6 completion:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v34 = a5;
  long long v31 = v12;
  id v32 = a7;
  v35 = self;
  v33 = [(PKRemoteAssetManager *)self pendingRemoteAssetsItemsForScreenScale:v12 suffix:a3];
  id v13 = v33;
  if ([v33 count])
  {
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v55[3] = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    uint64_t v54 = 0;
    uint64_t v54 = [v33 count];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v15 = v33;
    uint64_t v16 = 0;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v15);
          }
          char v20 = [*(id *)(*((void *)&v49 + 1) + 8 * i) size];
          uint64_t v21 = [v20 unsignedIntegerValue];

          v16 += v21;
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v17);
    }

    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__42;
    v47[4] = __Block_byref_object_dispose__42;
    id v48 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke;
    aBlock[3] = &unk_1E56EBFF0;
    BOOL v46 = a6;
    aBlock[6] = v55;
    aBlock[7] = v47;
    aBlock[8] = v16;
    aBlock[4] = v35;
    aBlock[5] = v53;
    id v22 = _Block_copy(aBlock);
    id v23 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    id v24 = v15;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_36;
          v37[3] = &unk_1E56EC040;
          v37[4] = v35;
          v37[5] = v28;
          id v38 = v34;
          id v39 = v22;
          v40 = v47;
          [(PKAsyncUnaryOperationComposer *)v23 addOperation:v37];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v56 count:16];
      }
      while (v25);
    }

    long long v29 = [MEMORY[0x1E4F1CA98] null];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_3;
    v36[3] = &unk_1E56EC068;
    v36[4] = v35;
    v36[5] = v47;
    id v30 = [(PKAsyncUnaryOperationComposer *)v23 evaluateWithInput:v29 completion:v36];

    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);
    id v13 = v33;
  }
  else
  {
    LODWORD(v14) = 1.0;
    [(PKRemoteAssetManager *)self _callCompletionHandlersWithFinishState:1 progress:0 error:v14];
  }
}

void __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v9)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error downloading remote asset - %@", (uint8_t *)&v15, 0xCu);
    }

    if (*(unsigned char *)(a1 + 72))
    {
      if ([v7 isRequired])
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v14 = *(void *)(v12 + 40);
        id v13 = (id *)(v12 + 40);
        if (!v14)
        {
          objc_storeStrong(v13, a4);
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v8 length];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(float *)&double v11 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
                   / (float)*(unint64_t *)(a1 + 64);
    [*(id *)(a1 + 32) _callCompletionHandlersWithFinishState:0 progress:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:v11];
  }
LABEL_11:
}

void __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_36(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_2;
  v15[3] = &unk_1E56EC018;
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 40);
  id v17 = v11;
  id v18 = v7;
  v15[4] = v12;
  id v16 = v6;
  uint64_t v19 = *(void *)(a1 + 64);
  id v13 = v6;
  id v14 = v7;
  [v8 _downloadRemoteAssetItem:v9 withCloudStoreCoordinatorDelegate:v10 shouldWriteData:1 completion:v15];
}

uint64_t __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

uint64_t __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  return [*(id *)(a1 + 32) _callCompletionHandlersWithFinishState:1 progress:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

- (void)downloadRemoteAssetItem:(id)a3 withCloudStoreCoordinatorDelegate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__PKRemoteAssetManager_downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_completion___block_invoke;
  v10[3] = &unk_1E56D8EB0;
  id v11 = v8;
  id v9 = v8;
  [(PKRemoteAssetManager *)self _downloadRemoteAssetItem:a3 withCloudStoreCoordinatorDelegate:a4 shouldWriteData:1 completion:v10];
}

uint64_t __93__PKRemoteAssetManager_downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2) {
      BOOL v4 = a3 == 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t v5 = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

- (void)_downloadRemoteAssetItem:(id)a3 withCloudStoreCoordinatorDelegate:(id)a4 shouldWriteData:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t, void))a6;
  id v13 = [v10 localURL];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__42;
  v40 = __Block_byref_object_dispose__42;
  id v41 = 0;
  coordinator = self->_coordinator;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke;
  v32[3] = &unk_1E56EC0E0;
  id v15 = v13;
  id v33 = v15;
  id v16 = v10;
  id v34 = v16;
  v35 = &v36;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v32];
  if (v37[5])
  {
    id v17 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v16 remoteURL];
      *(_DWORD *)buf = 138412290;
      id v43 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Not downloading: %@ since the asset already exists in the pass directory", buf, 0xCu);
    }
    [(PKRemoteAssetManager *)self addRemoteAssetData:v37[5] shouldWriteData:0 forManifestItem:v16 error:0];
    v12[2](v12, v37[5], 0);
  }
  else
  {
    uint64_t v19 = [v16 sha1Hex];
    char v20 = PKCachedFileForSHA1(v19);

    if (v20)
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v11;
        id v27 = [v16 localURL];
        uint64_t v26 = PKPassAssetDownloadCachePath();
        id v22 = [v16 sha1Hex];
        id v23 = [v26 stringByAppendingString:v22];
        *(_DWORD *)buf = 138412546;
        id v43 = v27;
        __int16 v44 = 2112;
        v45 = v23;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Using cached copy of %@ at %@", buf, 0x16u);

        id v11 = v25;
      }

      if (v7)
      {
        id v31 = 0;
        [(PKRemoteAssetManager *)self addRemoteAssetData:v20 forManifestItem:v16 error:&v31];
        id v24 = v31;
      }
      else
      {
        id v24 = 0;
      }
      ((void (**)(id, uint64_t, id))v12)[2](v12, (uint64_t)v20, v24);
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke_41;
      v28[3] = &unk_1E56EC090;
      v28[4] = self;
      id v29 = v16;
      id v30 = v12;
      [v29 downloadAssetWithCloudStoreCoordinatorDelegate:v11 completion:v28];
    }
  }

  _Block_object_dispose(&v36, 8);
}

void __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v18 = v3;
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [*(id *)(a1 + 32) path];
    int v6 = [v4 fileExistsAtPath:v5];

    id v3 = v18;
    if (v6)
    {
      BOOL v7 = (void *)MEMORY[0x192FDC630](v18);
      id v8 = [*(id *)(a1 + 40) sha1Hex];
      id v9 = objc_msgSend(v8, "pk_decodeHexadecimal");

      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 32)];
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) SHA1Hash];
        if (!v13 || (id v14 = (void *)v13, v15 = [v9 isEqual:v13], v14, (v15 & 1) == 0))
        {
          uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
          id v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = 0;
        }
      }

      id v3 = v18;
    }
  }
}

void __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke_41(void *a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    if (a3)
    {
      id v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      id v14 = v8;
      [v9 addRemoteAssetData:v7 forManifestItem:v10 error:&v14];
      id v11 = v14;

      id v8 = v11;
    }
    uint64_t v12 = [v7 SHA1Hash];
    uint64_t v13 = [v12 hexEncoding];

    if ([(id)a1[5] itemType] != 1 && (PKCachedFileForSHA1Exists(v13) & 1) == 0) {
      PKCacheFile(v7, v13);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_callCompletionHandlersWithFinishState:(BOOL)a3 progress:(float)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void *)[(NSMutableArray *)self->_completionHandlers copy];
  if (v6) {
    [(NSMutableArray *)self->_completionHandlers removeAllObjects];
  }
  os_unfair_lock_unlock(&self->_lock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKRemoteAssetManager__callCompletionHandlersWithFinishState_progress_error___block_invoke;
  block[3] = &unk_1E56EC0B8;
  BOOL v17 = v6;
  float v16 = a4;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, block);
}

void __78__PKRemoteAssetManager__callCompletionHandlersWithFinishState_progress_error___block_invoke(uint64_t a1)
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
        (*(void (**)(float))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))(*(float *)(a1 + 48));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)addRemoteAssetData:(id)a3 forManifestItem:(id)a4 error:(id *)a5
{
  return [(PKRemoteAssetManager *)self addRemoteAssetData:a3 shouldWriteData:1 forManifestItem:a4 error:a5];
}

- (BOOL)addRemoteAssetData:(id)a3 shouldWriteData:(BOOL)a4 forManifestItem:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    uint64_t v12 = [v10 SHA1Hash];
    uint64_t v13 = [v12 hexEncoding];

    id v14 = [v11 sha1Hex];
    char v15 = [v14 isEqualToString:v13];

    if ((v15 & 1) == 0)
    {
      char v20 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v11 localURL];
        id v22 = [v11 sha1Hex];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2112;
        v59 = v13;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "SHA1 Invalid Hash: For file %@, manifest's listed SHA1 hash %@ doesn't match computed hash, %@. Please file a radar and include this faulty pass", buf, 0x20u);
      }
      if (a6)
      {
        id v23 = [v11 localURL];
        v47 = [v11 sha1Hex];
        PKSignatureErrorWithReason(@"For file %@, manifest's listed SHA1 hash %@ doesn't match computed hash, %@", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v19 = 0;
      goto LABEL_27;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v59) = 0;
    if (v8)
    {
      float v16 = [v11 encryptedContentsLocalURL];
      BOOL v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [v11 localURL];
      }
      id v32 = v18;

      id v33 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v56 = 138412290;
        v57 = v32;
        _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Writing %@", v56, 0xCu);
      }

      coordinator = self->_coordinator;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke;
      v52[3] = &unk_1E56EC0E0;
      v55 = buf;
      id v53 = v10;
      id v35 = v32;
      id v54 = v35;
      [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v52];
      BOOL v31 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

      if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v31 = 0;
      LOBYTE(v59) = 1;
    }
    if ([v11 isZipFile])
    {
      uint64_t v36 = [v11 localURL];
      v37 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = [v36 lastPathComponent];
        *(_DWORD *)v56 = 138412290;
        v57 = v38;
        _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Unpacking zip file \"%@\".", v56, 0xCu);
      }
      id v39 = [v36 URLByDeletingPathExtension];
      v40 = [v39 lastPathComponent];

      id v41 = [v11 passURL];
      long long v42 = [v41 URLByAppendingPathComponent:v40];

      id v43 = self->_coordinator;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke_46;
      v48[3] = &unk_1E56DC348;
      id v44 = v42;
      id v49 = v44;
      long long v51 = buf;
      id v50 = v10;
      [(PKDirectoryCoordinator *)v43 performCoordinatedAction:v48];
      if (v31)
      {
      }
      else
      {
        BOOL v45 = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;

        if (v45)
        {
LABEL_26:
          BOOL v19 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
          _Block_object_dispose(buf, 8);
LABEL_27:

          goto LABEL_28;
        }
      }
LABEL_25:
      [(PKRemoteAssetManager *)self _flushBundleCaches];
      goto LABEL_26;
    }
LABEL_22:
    if (!v31) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  BOOL v19 = 0;
LABEL_28:

  return v19;
}

uint64_t __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2)
  {
    uint64_t result = [*(id *)(result + 32) writeToURL:*(void *)(result + 40) atomically:1];
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = 0;
  }
  return result;
}

void __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = [*(id *)(a1 + 32) path];
    char v5 = [v3 fileExistsAtPath:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v12 = 0;
      char v7 = [v3 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v12];
      id v8 = v12;
      long long v9 = v8;
      if ((v7 & 1) == 0 && v8)
      {
        id v10 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = v11;
          _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Could not create directory at %@", buf, 0xCu);
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = PKUnarchiverZip(*(NSData **)(a1 + 40), *(NSURL **)(a1 + 32));
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)_flushBundleCaches
{
}

void __42__PKRemoteAssetManager__flushBundleCaches__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = (objc_class *)MEMORY[0x1E4F28B50];
    id v3 = a2;
    id v5 = (id)[[v2 alloc] initWithURL:v3];

    uint64_t v4 = v5;
    if (v5)
    {
      [v5 _cfBundle];
      _CFBundleFlushBundleCaches();
      uint64_t v4 = v5;
    }
  }
}

- (NSArray)seids
{
  return self->_seids;
}

- (void)setSeids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seids, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_sha1HexFromRelativeManifest, 0);
  objc_storeStrong((id *)&self->_manifestItemsByRelativeURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)downloadRemoteAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  [(PKRemoteAssetManager *)self downloadRemoteAssetsWithScreenScale:0 suffix:v4 completion:PKScreenScale()];
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 completion:(id)a5
{
}

@end