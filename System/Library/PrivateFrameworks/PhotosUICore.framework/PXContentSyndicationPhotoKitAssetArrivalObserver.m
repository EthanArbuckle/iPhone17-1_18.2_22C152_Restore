@interface PXContentSyndicationPhotoKitAssetArrivalObserver
- (NSDate)waitStartTimestamp;
- (NSSet)expectedUUIDs;
- (PHFetchResult)assetsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXContentSyndicationPhotoKitAssetArrivalObserver)initWithExpectedAssetUUIDs:(id)a3 inPhotoLibrary:(id)a4;
- (id)completionHandler;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setWaitStartTimestamp:(id)a3;
- (void)updateWithFetchResult:(id)a3;
- (void)waitForAssetArrivalsWithCompletion:(id)a3;
@end

@implementation PXContentSyndicationPhotoKitAssetArrivalObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_waitStartTimestamp, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_expectedUUIDs, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setWaitStartTimestamp:(id)a3
{
}

- (NSDate)waitStartTimestamp
{
  return self->_waitStartTimestamp;
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSSet)expectedUUIDs
{
  return self->_expectedUUIDs;
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self assetsFetchResult];
  v6 = [v4 changeDetailsForFetchResult:v5];

  if (v6)
  {
    v7 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[AssetArrivalObserver] Received updated fetch result.", buf, 2u);
    }

    if ([v6 hasIncrementalChanges])
    {
      v8 = [v6 insertedObjects];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E4F1CA48];
        v11 = [v6 insertedObjects];
        v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v13 = objc_msgSend(v6, "insertedObjects", 0);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [*(id *)(*((void *)&v22 + 1) + 8 * v17) localIdentifier];
              [v12 addObject:v18];

              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v15);
        }

        v19 = PLSyndicationUIGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v12 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v27 = v20;
          __int16 v28 = 2114;
          v29 = v12;
          _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] %lu assets in updated fetch result %{public}@", buf, 0x16u);
        }
      }
    }
    v21 = [v6 fetchResultAfterChanges];
    [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self updateWithFetchResult:v21];
  }
}

- (void)updateWithFetchResult:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_assetsFetchResult, a3);
  NSUInteger v6 = [(PHFetchResult *)self->_assetsFetchResult count];
  v7 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self expectedUUIDs];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    v10 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self waitStartTimestamp];
    [v9 timeIntervalSinceDate:v10];
    unint64_t v12 = v11;

    v13 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      unint64_t v18 = v8;
      __int16 v19 = 2048;
      unint64_t v20 = v12;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] Expected number of assets (%lu) have arrived. Completing observation. Took %.3f seconds", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v14 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self photoLibrary];
    [v14 unregisterChangeObserver:self];

    uint64_t v15 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self completionHandler];
    [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self setCompletionHandler:0];
    if (v15)
    {
      uint64_t v16 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self assetsFetchResult];
      ((void (**)(void, void *, void))v15)[2](v15, v16, 0);
    }
  }
  else
  {
    uint64_t v9 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      unint64_t v18 = v6;
      __int16 v19 = 2048;
      unint64_t v20 = v8;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] %lu out of %lu assets now in library.", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)waitForAssetArrivalsWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, PHFetchResult *, void))a3;
  id v5 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self photoLibrary];
  NSUInteger v6 = [v5 librarySpecificFetchOptions];

  [v6 setIncludePlaceholderAssets:0];
  [v6 setIncludeGuestAssets:0];
  v7 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self expectedUUIDs];
  uint64_t v8 = [v7 count];

  uint64_t v9 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self expectedUUIDs];
    int v23 = 134218242;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = (uint64_t)v10;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] Waiting for the existence of %lu assets in the user library: %{public}@", (uint8_t *)&v23, 0x16u);
  }
  unint64_t v11 = (void *)MEMORY[0x1E4F38EB8];
  unint64_t v12 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self expectedUUIDs];
  v13 = [v12 allObjects];
  uint64_t v14 = [v11 fetchAssetsWithLocalIdentifiers:v13 options:v6];

  uint64_t v15 = [(PHFetchResult *)v14 count];
  uint64_t v16 = PLSyndicationUIGetLog();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15 == v8)
  {
    if (v17)
    {
      int v23 = 134217984;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] Expected number of assets (%lu) already found in library. Returning early.", (uint8_t *)&v23, 0xCu);
    }

    if (v4) {
      v4[2](v4, v14, 0);
    }
  }
  else
  {
    if (v17)
    {
      uint64_t v18 = [(PHFetchResult *)v14 count];
      int v23 = 134218240;
      uint64_t v24 = v18;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] %lu out of %lu assets found in library. Waiting for assets to arrive...", (uint8_t *)&v23, 0x16u);
    }

    __int16 v19 = [MEMORY[0x1E4F1C9C8] now];
    [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self setWaitStartTimestamp:v19];

    unint64_t v20 = (void *)[v4 copy];
    [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self setCompletionHandler:v20];

    uint64_t v21 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)self photoLibrary];
    [v21 registerChangeObserver:self];
  }
  assetsFetchResult = self->_assetsFetchResult;
  self->_assetsFetchResult = v14;
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary unregisterChangeObserver:self];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationPhotoKitAssetArrivalObserver;
  [(PXContentSyndicationPhotoKitAssetArrivalObserver *)&v4 dealloc];
}

- (PXContentSyndicationPhotoKitAssetArrivalObserver)initWithExpectedAssetUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXContentSyndicationPhotoKitAssetArrivalObserver;
  uint64_t v8 = [(PXContentSyndicationPhotoKitAssetArrivalObserver *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    expectedUUIDs = v8->_expectedUUIDs;
    v8->_expectedUUIDs = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_photoLibrary, a4);
  }

  return v8;
}

@end