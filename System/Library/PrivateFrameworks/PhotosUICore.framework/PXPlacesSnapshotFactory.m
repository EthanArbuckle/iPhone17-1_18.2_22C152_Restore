@interface PXPlacesSnapshotFactory
- (BOOL)_imageExistsWithLocalIdentifier:(id)a3;
- (BOOL)countCacheInvalidated;
- (BOOL)isRegisteredForPhotoLibraryChanges;
- (NSMutableArray)localSearches;
- (NSTimer)assetCountChangedTimer;
- (PHAsset)snapshottedAsset;
- (PHAssetCollection)placesCollection;
- (PHFetchResult)assetCountFetchResult;
- (PHFetchResult)placesAssetsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXLibraryFilterState)libraryFilterState;
- (PXPlacesSnapshotFactory)init;
- (PXPlacesSnapshotFactory)initWithPhotoLibrary:(id)a3;
- (PXPlacesSnapshotFactoryDelegate)delegate;
- (id)_placeHolderImageForExtendedTraitCollection:(id)a3;
- (id)_representativeAsset;
- (int64_t)assetCountWithForcedRefresh:(BOOL)a3;
- (int64_t)countLabelStyle;
- (int64_t)currentUserInterfaceStyle;
- (void)_addLocalSearch:(id)a3;
- (void)_fetchImageOfAsset:(id)a3 withSnapshotOptions:(id)a4 andCompletion:(id)a5;
- (void)_handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:(id)a3 andCompletion:(id)a4;
- (void)_removeLocalSearch:(id)a3;
- (void)_saveImage:(id)a3 ofAsset:(id)a4 atPath:(id)a5;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)removePreviousCachedImages;
- (void)requestAssetCountWithForcedRefresh:(BOOL)a3 completion:(id)a4;
- (void)requestBoundingRegionForQuery:(id)a3 completion:(id)a4;
- (void)requestMapSnapshotForQuery:(id)a3 snapshotOptions:(id)a4 completion:(id)a5;
- (void)requestMapSnapshotOfRegion:(id *)a3 snapshotOptions:(id)a4 completion:(id)a5;
- (void)requestMapSnapshotWithAssets:(id)a3 snapshotOptions:(id)a4 popoverImageOptions:(unint64_t)a5 completion:(id)a6;
- (void)requestPlacesImageOfAsset:(id)a3 withSnapshotOptions:(id)a4 andCompletion:(id)a5;
- (void)requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:(id)a3 andCompletion:(id)a4;
- (void)setAssetCountChangedTimer:(id)a3;
- (void)setAssetCountFetchResult:(id)a3;
- (void)setCountCacheInvalidated:(BOOL)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsRegisteredForPhotoLibraryChanges:(BOOL)a3;
- (void)setLocalSearches:(id)a3;
- (void)setPlacesAssetsFetchResult:(id)a3;
- (void)setPlacesCollection:(id)a3;
- (void)setSnapshottedAsset:(id)a3;
- (void)tickAssetCountChangedTimer:(id)a3;
@end

@implementation PXPlacesSnapshotFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_localSearches, 0);
  objc_storeStrong((id *)&self->_assetCountChangedTimer, 0);
  objc_storeStrong((id *)&self->_assetCountFetchResult, 0);
  objc_storeStrong((id *)&self->_placesAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_snapshottedAsset, 0);
  objc_storeStrong((id *)&self->_placesCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_requestedCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_cachedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageDark, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageLight, 0);
  objc_storeStrong((id *)&self->_cachedFilePathDark, 0);
  objc_storeStrong((id *)&self->_cachedFilePathLight, 0);
}

- (int64_t)countLabelStyle
{
  return self->_countLabelStyle;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setLocalSearches:(id)a3
{
}

- (NSMutableArray)localSearches
{
  return self->_localSearches;
}

- (void)setAssetCountChangedTimer:(id)a3
{
}

- (NSTimer)assetCountChangedTimer
{
  return self->_assetCountChangedTimer;
}

- (void)setAssetCountFetchResult:(id)a3
{
}

- (PHFetchResult)assetCountFetchResult
{
  return self->_assetCountFetchResult;
}

- (void)setCountCacheInvalidated:(BOOL)a3
{
  self->_countCacheInvalidated = a3;
}

- (BOOL)countCacheInvalidated
{
  return self->_countCacheInvalidated;
}

- (void)setPlacesAssetsFetchResult:(id)a3
{
}

- (void)setSnapshottedAsset:(id)a3
{
}

- (PHAsset)snapshottedAsset
{
  return self->_snapshottedAsset;
}

- (void)setIsRegisteredForPhotoLibraryChanges:(BOOL)a3
{
  self->_isRegisteredForPhotoLibraryChanges = a3;
}

- (BOOL)isRegisteredForPhotoLibraryChanges
{
  return self->_isRegisteredForPhotoLibraryChanges;
}

- (void)setPlacesCollection:(id)a3
{
}

- (PHAssetCollection)placesCollection
{
  return self->_placesCollection;
}

- (void)setDelegate:(id)a3
{
}

- (PXPlacesSnapshotFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPlacesSnapshotFactoryDelegate *)WeakRetained;
}

- (void)tickAssetCountChangedTimer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    [v4 invalidate];
  }
  [(PXPlacesSnapshotFactory *)self setCountCacheInvalidated:1];
  id v6 = [(PXPlacesSnapshotFactory *)self delegate];
  [v6 placesSnapshotCountDidChange];
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PXPlacesSnapshotFactory *)self placesAssetsFetchResult];

  if (v5)
  {
    id v6 = [(PXPlacesSnapshotFactory *)self placesAssetsFetchResult];
    v7 = [v4 changeDetailsForFetchResult:v6];

    if (v7)
    {
      v8 = [(PXPlacesSnapshotFactory *)self placesAssetsFetchResult];
      v9 = [v7 fetchResultAfterChanges];
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [(PXPlacesSnapshotFactory *)self placesAssetsFetchResult];
      }
      v16 = v11;

      [(PXPlacesSnapshotFactory *)self setPlacesAssetsFetchResult:v16];
      v17 = [v8 firstObject];
      v18 = [v16 firstObject];
      BOOL v19 = v17 != v18 || objc_msgSend(v17, "pk_isContentEqualTo:", v17) != 2;
      BOOL v27 = v19;
      v20 = [v7 removedObjects];
      v21 = [v7 insertedObjects];
      if ([v20 count]) {
        BOOL v22 = 1;
      }
      else {
        BOOL v22 = [v21 count] != 0;
      }

      if (v27)
      {
        v23 = [(PXPlacesSnapshotFactory *)self delegate];
        [v23 placesSnapshotDidChange];

        if (!v22) {
          goto LABEL_22;
        }
LABEL_19:
        v24 = [(PXPlacesSnapshotFactory *)self assetCountChangedTimer];

        if (v24)
        {
          v25 = [(PXPlacesSnapshotFactory *)self assetCountChangedTimer];
          [v25 invalidate];

          assetCountChangedTimer = self->_assetCountChangedTimer;
          self->_assetCountChangedTimer = 0;
        }
        px_dispatch_on_main_queue();
      }
      if (v22) {
        goto LABEL_19;
      }
    }
  }
  else
  {
    v12 = [(PXPlacesSnapshotFactory *)self snapshottedAsset];

    if (v12)
    {
      v13 = [(PXPlacesSnapshotFactory *)self snapshottedAsset];
      v14 = [v4 changeDetailsForObject:v13];

      if (v14)
      {
        v15 = [(PXPlacesSnapshotFactory *)self delegate];
        [v15 placesSnapshotDidChange];
      }
    }
  }
LABEL_22:
}

void __49__PXPlacesSnapshotFactory_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v1 target:sel_tickAssetCountChangedTimer_ selector:0 userInfo:0 repeats:2.0];
  [v1 setAssetCountChangedTimer:v2];
}

- (BOOL)_imageExistsWithLocalIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F38EB8];
  id v13 = a3;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  v7 = [v5 arrayWithObjects:&v13 count:1];
  v8 = [(PXPlacesSnapshotFactory *)self photoLibrary];
  v9 = [v8 librarySpecificFetchOptions];
  v10 = [v4 fetchAssetsWithLocalIdentifiers:v7 options:v9];

  if (v10) {
    BOOL v11 = [v10 count] != 0;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_saveImage:(id)a3 ofAsset:(id)a4 atPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  UIImageJPEGRepresentation((UIImage *)a3, 1.0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithData:v16];
  v10 = [v9 properties];
  uint64_t v11 = *MEMORY[0x1E4F2F800];
  v12 = [v10 objectForKey:*MEMORY[0x1E4F2F800]];
  id v13 = [v8 localIdentifier];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
  [v14 setObject:v13 forKey:*MEMORY[0x1E4F2F958]];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
  [v15 setObject:v14 forKey:v11];
  CGImageWriteEXIFJPEGToPath();
}

- (void)removePreviousCachedImages
{
  p_cachedIvarLock = &self->_cachedIvarLock;
  os_unfair_lock_lock(&self->_cachedIvarLock);
  id v7 = self->_cachedFilePathLight;
  id v4 = self->_cachedFilePathDark;
  os_unfair_lock_unlock(p_cachedIvarLock);
  if (v7)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 removeItemAtPath:v7 error:0];
  }
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 removeItemAtPath:v4 error:0];
  }
}

- (id)_representativeAsset
{
  id v2 = [(PXPlacesSnapshotFactory *)self placesAssetsFetchResult];
  v3 = [v2 firstObject];

  return v3;
}

- (id)_placeHolderImageForExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  p_cachedIvarLock = &self->_cachedIvarLock;
  os_unfair_lock_lock(&self->_cachedIvarLock);
  cachedPlaceholderImage = self->_cachedPlaceholderImage;
  p_cachedPlaceholderImage = &self->_cachedPlaceholderImage;
  id v8 = cachedPlaceholderImage;
  os_unfair_lock_unlock(p_cachedIvarLock);
  if (!v8)
  {
    v9 = +[PXPlacesPopoverImageFactory sharedInstance];
    id v8 = [v9 createAlbumPlaceHolderImageUsingTraitCollection:v4];

    os_unfair_lock_lock(p_cachedIvarLock);
    objc_storeStrong((id *)p_cachedPlaceholderImage, v8);
    os_unfair_lock_unlock(p_cachedIvarLock);
  }

  return v8;
}

- (PHFetchResult)placesAssetsFetchResult
{
  v15[1] = *MEMORY[0x1E4F143B8];
  placesAssetsFetchResult = self->_placesAssetsFetchResult;
  if (!placesAssetsFetchResult)
  {
    id v4 = [(PXPlacesSnapshotFactory *)self photoLibrary];
    v5 = [v4 librarySpecificFetchOptions];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"creationDate" ascending:0];
    v15[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v5 setSortDescriptors:v7];

    [v5 setFetchLimit:1];
    uint64_t v8 = *MEMORY[0x1E4F39440];
    v14[0] = *MEMORY[0x1E4F394B0];
    v14[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v5 setFetchPropertySets:v9];

    v10 = [(PXPlacesSnapshotFactory *)self libraryFilterState];
    objc_msgSend(v5, "setSharingFilter:", objc_msgSend(v10, "sharingFilter"));

    objc_msgSend(MEMORY[0x1E4F38EB8], "pk_fetchPlacesAssetsInAssetCollection:shouldMergeOptionFetchPropertySets:options:", self->_placesCollection, 1, v5);
    uint64_t v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v12 = self->_placesAssetsFetchResult;
    self->_placesAssetsFetchResult = v11;

    placesAssetsFetchResult = self->_placesAssetsFetchResult;
  }
  return placesAssetsFetchResult;
}

- (void)requestAssetCountWithForcedRefresh:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXPlacesSnapshotFactory_requestAssetCountWithForcedRefresh_completion___block_invoke;
  block[3] = &unk_1E5DD1758;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(concurrentQueue, block);
}

uint64_t __73__PXPlacesSnapshotFactory_requestAssetCountWithForcedRefresh_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) assetCountWithForcedRefresh:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (int64_t)assetCountWithForcedRefresh:(BOOL)a3
{
  if (a3 || [(PXPlacesSnapshotFactory *)self countCacheInvalidated])
  {
    id v4 = [(PXPlacesSnapshotFactory *)self photoLibrary];
    v5 = [v4 librarySpecificFetchOptions];

    id v6 = [MEMORY[0x1E4F8A930] predicateForAssetWithLocation];
    [v5 setInternalPredicate:v6];

    [v5 setInternalSortDescriptors:MEMORY[0x1E4F1CBF0]];
    id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F394A8], 0);
    [v5 setFetchPropertySets:v7];

    [v5 setShouldPrefetchCount:1];
    [v5 setWantsIncrementalChangeDetails:0];
    [v5 setIncludeAssetSourceTypes:5];
    id v8 = [(PXPlacesSnapshotFactory *)self libraryFilterState];
    objc_msgSend(v5, "setSharingFilter:", objc_msgSend(v8, "sharingFilter"));

    v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v5];
    uint64_t cachedCount = [v9 count];
    os_unfair_lock_lock(&self->_cachedIvarLock);
    self->_uint64_t cachedCount = cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    [(PXPlacesSnapshotFactory *)self setAssetCountFetchResult:v9];
    [(PXPlacesSnapshotFactory *)self setCountCacheInvalidated:0];
  }
  else
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    uint64_t cachedCount = self->_cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
  }
  return cachedCount;
}

- (void)requestMapSnapshotOfRegion:(id *)a3 snapshotOptions:(id)a4 completion:(id)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  if (!v16)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"PXPlacesSnapshotFactory.m" lineNumber:927 description:@"-[PXPlacesSnapshotFactory requestPlacesSnapshotWithSnapshotOptions:visibleRegion:completion:] snapshotOptions cannot be nil"];
  }
  +[PXPlacesMapView MKMapRectForCoordinateRegion:](PXPlacesMapView, "MKMapRectForCoordinateRegion:", v13, v12, v11, v10);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = objc_alloc_init(MEMORY[0x1E4F30F40]);
  [($B7681AED98C8A3AAF93603046C9C96EE *)v16 viewSize];
  objc_msgSend(v26, "setSize:");
  objc_msgSend(v26, "setMapRect:", v19, v21, v23, v25);
  objc_msgSend(v26, "_setShowsPointLabels:", -[$B7681AED98C8A3AAF93603046C9C96EE showsPointLabels](v16, "showsPointLabels"));
  BOOL v27 = [($B7681AED98C8A3AAF93603046C9C96EE *)v16 extendedTraitCollection];
  v28 = [v27 traitCollectionForMapKit];

  if (v28)
  {
    [v26 setTraitCollection:v28];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v16;
    __int16 v40 = 2080;
    v41 = "-[PXPlacesSnapshotFactory requestMapSnapshotOfRegion:snapshotOptions:completion:]";
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trait collection is nil for snapshot options: %@\nfunction: %s", buf, 0x16u);
  }
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke;
  block[3] = &unk_1E5DD0E78;
  id v35 = v26;
  v36 = v16;
  id v37 = v17;
  id v30 = v17;
  v31 = v16;
  id v32 = v26;
  dispatch_async(concurrentQueue, block);
}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke_2;
  v4[3] = &unk_1E5DCAB18;
  id v5 = *(id *)(a1 + 48);
  [v2 startWithQueue:v3 completionHandler:v4];
}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 image];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
  }
}

- (void)requestMapSnapshotForQuery:(id)a3 snapshotOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke;
  v13[3] = &unk_1E5DCAAF0;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(PXPlacesSnapshotFactory *)self requestBoundingRegionForQuery:v8 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (id *)(a1 + 48);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [v4 boundingRegion];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke_2;
    v15[3] = &unk_1E5DCAAC8;
    uint64_t v14 = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "requestMapSnapshotOfRegion:snapshotOptions:completion:", v14, v15, v7, v9, v11, v13);
  }
}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Error returned from requestPlacesSnapshotWithSnapshotOptions:visibleRegion:completion: \"%@\"", (uint8_t *)&v8, 0xCu);
    }
    id v5 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }
}

- (void)requestBoundingRegionForQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
  [v8 setNaturalLanguageQuery:v6];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v8];
  [(PXPlacesSnapshotFactory *)self _addLocalSearch:v9];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PXPlacesSnapshotFactory_requestBoundingRegionForQuery_completion___block_invoke;
  v12[3] = &unk_1E5DCAAA0;
  objc_copyWeak(&v15, &location);
  id v10 = v9;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v10 startWithCompletionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__PXPlacesSnapshotFactory_requestBoundingRegionForQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeLocalSearch:*(void *)(a1 + 32)];

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      double v12 = "-[PXPlacesSnapshotFactory requestBoundingRegionForQuery:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Error fetching bounding region in: %s error: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_8:
      v9();
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      id v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_8;
    }
  }
}

- (void)_removeLocalSearch:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PXPlacesSnapshotFactory__removeLocalSearch___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __46__PXPlacesSnapshotFactory__removeLocalSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) removeObject:*(void *)(a1 + 40)];
}

- (void)_addLocalSearch:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PXPlacesSnapshotFactory__addLocalSearch___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __43__PXPlacesSnapshotFactory__addLocalSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) addObject:*(void *)(a1 + 40)];
}

- (void)requestPlacesImageOfAsset:(id)a3 withSnapshotOptions:(id)a4 andCompletion:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v9;
  id v12 = v10;
  id v13 = a5;
  id v14 = v13;
  v58 = v12;
  if (!v12)
  {
    id v54 = v13;
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:self file:@"PXPlacesSnapshotFactory.m" lineNumber:739 description:@"-[PXPlacesSnapshotFactory createMapImageOfGeotaggables:withSnapshotOptions:andCompletion:] snapshotOptions cannot be nil"];

    id v14 = v54;
  }
  [v11 locationCoordinate];
  double latitude = v97.latitude;
  double longitude = v97.longitude;
  if (CLLocationCoordinate2DIsValid(v97))
  {
    v57 = v14;
    id v17 = (void *)MEMORY[0x1E4F8A930];
    double v18 = [v11 coarseLocationProperties];
    [v18 gpsHorizontalAccuracy];
    LODWORD(v17) = objc_msgSend(v17, "horizontalAccuracyIsCoarse:");

    double v19 = [v58 extendedTraitCollection];
    double v20 = +[PXPlacesPopoverImageFactory sharedInstance];
    unint64_t v21 = v17;
    [v20 thumbnailImageSizeForImageType:v17 usingTraitCollection:v19 includeScale:1];
    uint64_t v23 = v22;
    uint64_t v25 = v24;

    id v26 = +[PXPlacesPopoverImageFactory sharedInstance];
    [v26 backgroundImageSizeForType:v21 usingTraitCollection:v19];
    double v28 = v27;
    double v30 = v29;

    MEMORY[0x1AD109A20](latitude, longitude, 10000.0, 10000.0);
    +[PXPlacesMapView MKMapRectForCoordinateRegion:](PXPlacesMapView, "MKMapRectForCoordinateRegion:");
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    id v39 = objc_alloc_init(MEMORY[0x1E4F30F40]);
    objc_msgSend(v39, "setSize:", v28, v30);
    objc_msgSend(v39, "setMapRect:", v32, v34, v36, v38);
    objc_msgSend(v39, "_setShowsPointLabels:", objc_msgSend(v58, "showsPointLabels"));
    __int16 v40 = [v19 traitCollectionForMapKit];
    if (v40)
    {
      [v39 setTraitCollection:v40];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[PXPlacesSnapshotFactory requestPlacesImageOfAsset:withSnapshotOptions:andCompletion:]";
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trait collection is nil for snapshot options: %@\nfunction: %s", buf, 0x16u);
    }
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    char v91 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v93 = __Block_byref_object_copy__247015;
    v94 = __Block_byref_object_dispose__247016;
    id v95 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = __Block_byref_object_copy__247015;
    v88[4] = __Block_byref_object_dispose__247016;
    id v89 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v87[3] = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__247015;
    v85[4] = __Block_byref_object_dispose__247016;
    id v86 = 0;
    objc_initWeak(&location, self);
    id v41 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    uint64_t v42 = dispatch_group_create();
    dispatch_group_enter(v42);
    concurrentQueue = self->_concurrentQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke;
    block[3] = &unk_1E5DCAA00;
    id v56 = v39;
    id v79 = v56;
    id v44 = v58;
    id v80 = v44;
    v82 = buf;
    v83 = v88;
    v45 = v42;
    v81 = v45;
    dispatch_async(concurrentQueue, block);
    dispatch_group_enter(v45);
    v46 = self->_concurrentQueue;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_3;
    v68[3] = &unk_1E5DCAA50;
    id v47 = v44;
    id v69 = v47;
    id v48 = v11;
    id v70 = v48;
    uint64_t v76 = v23;
    uint64_t v77 = v25;
    id v49 = v41;
    id v71 = v49;
    v73 = v90;
    v74 = v85;
    v75 = v87;
    v50 = v45;
    v72 = v50;
    dispatch_async(v46, v68);
    v51 = [v47 queue];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_5;
    v59[3] = &unk_1E5DCAA78;
    v63 = v88;
    id v62 = v57;
    v64 = v85;
    v65 = buf;
    v66 = v87;
    id v52 = v48;
    v67[1] = (id)v21;
    id v60 = v52;
    id v61 = v19;
    id v53 = v19;
    objc_copyWeak(v67, &location);
    dispatch_group_notify(v50, v51, v59);

    objc_destroyWeak(v67);
    objc_destroyWeak(&location);
    _Block_object_dispose(v85, 8);

    _Block_object_dispose(v87, 8);
    _Block_object_dispose(v88, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v90, 8);

    id v14 = v57;
  }
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_2;
  v6[3] = &unk_1E5DCA9D8;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 startWithQueue:v3 completionHandler:v6];
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) geotaggableInformationDelegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_4;
  v6[3] = &unk_1E5DCAA28;
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 72);
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v8 = v5;
  objc_msgSend(v2, "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v3, 1, v6, *(double *)(a1 + 88), *(double *)(a1 + 96));
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (!v2) {
      return;
    }
    uint64_t v3 = *(void (**)(void))(v2 + 16);
LABEL_5:
    v3();
    return;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    || (id v4 = *(CGImage **)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) == 0
    || !CGImageGetWidth(v4)
    || !CGImageGetHeight(*(CGImageRef *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)))
  {
    uint64_t v21 = *(void *)(a1 + 48);
    if (!v21) {
      return;
    }
    uint64_t v3 = *(void (**)(void))(v21 + 16);
    goto LABEL_5;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) size];
  double v6 = v5;
  double v8 = v7;
  long long v9 = +[PXPlacesPopoverImageFactory sharedInstance];
  id v22 = [v9 createPopoverImageForGeotaggable:*(void *)(a1 + 32) withImage:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) imageType:*(void *)(a1 + 96) imageOptions:0 usingTraitCollection:*(void *)(a1 + 40)];

  [v22 size];
  double v11 = v6 * 0.5 - v10 * 0.5;
  [v22 size];
  double v13 = v8 * 0.5 - v12 * 0.5;
  v24.width = v6;
  v24.height = v8;
  UIGraphicsBeginImageContextWithOptions(v24, 0, 0.0);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "drawInRect:", 0.0, 0.0, v6, v8);
  [v22 size];
  double v15 = v14;
  [v22 size];
  objc_msgSend(v22, "drawInRect:", v11, v13, v15, v16);
  id v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
  uint64_t v18 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained setSnapshottedAsset:v18];

  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v17, 0);
  }
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  [*(id *)(a1 + 32) lock];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
    if (a3)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
      CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  [*(id *)(a1 + 32) unlock];
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 image];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_fetchImageOfAsset:(id)a3 withSnapshotOptions:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __80__PXPlacesSnapshotFactory__fetchImageOfAsset_withSnapshotOptions_andCompletion___block_invoke;
  v14[3] = &unk_1E5DCA9B0;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  id v17 = self;
  objc_copyWeak(&v19, &location);
  id v13 = v10;
  id v18 = v13;
  [(PXPlacesSnapshotFactory *)self requestPlacesImageOfAsset:v12 withSnapshotOptions:v11 andCompletion:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __80__PXPlacesSnapshotFactory__fetchImageOfAsset_withSnapshotOptions_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v22)
  {
    id v8 = [v7 extendedTraitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    id v10 = [*(id *)(a1 + 40) localIdentifier];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 64));
    if (v9 == 1)
    {
      uint64_t v11 = 8;
      uint64_t v12 = 24;
    }
    else
    {
      if (v9 != 2)
      {
        id v16 = 0;
        goto LABEL_10;
      }
      uint64_t v11 = 16;
      uint64_t v12 = 32;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 48) + v12), a2);
    id v16 = *(id *)(*(void *)(a1 + 48) + v11);
LABEL_10:
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v10;
    id v17 = v10;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 64));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _saveImage:v22 ofAsset:*(void *)(a1 + 40) atPath:v16];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_11;
  }
  if ([v7 shouldSkipPlaceholder]) {
    goto LABEL_12;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 64));
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(v13 + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 64));
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = objc_loadWeakRetained((id *)(a1 + 64));
  id v17 = [*(id *)(a1 + 32) extendedTraitCollection];
  id v18 = [v16 _placeHolderImageForExtendedTraitCollection:v17];
  (*(void (**)(uint64_t, void *, uint64_t, id))(v15 + 16))(v15, v18, v14, v6);

LABEL_11:
LABEL_12:
}

- (void)_handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:(id)a3 andCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke;
  block[3] = &unk_1E5DCA938;
  void block[4] = self;
  uint64_t v23 = &v24;
  id v9 = v7;
  id v22 = v9;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v25 + 24))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_2;
    aBlock[3] = &unk_1E5DCA960;
    aBlock[4] = self;
    objc_copyWeak(&v20, &location);
    id v10 = _Block_copy(aBlock);
    uint64_t v11 = [(PXPlacesSnapshotFactory *)self currentUserInterfaceStyle];
    uint64_t v12 = [v6 queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_4;
    v15[3] = &unk_1E5DCA988;
    objc_copyWeak(v18, &location);
    void v15[4] = self;
    id v13 = v6;
    v18[1] = v11;
    id v16 = v13;
    id v17 = v10;
    id v14 = v10;
    dispatch_async(v12, v15);

    objc_destroyWeak(v18);
    objc_destroyWeak(&v20);
  }

  _Block_object_dispose(&v24, 8);
  objc_destroyWeak(&location);
}

void __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 72);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;

    uint64_t v2 = *(void **)(a1[4] + 72);
  }
  if (![v2 count]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  id v6 = (void *)a1[5];
  if (v6)
  {
    id v7 = *(void **)(a1[4] + 72);
    id v9 = (id)[v6 copy];
    id v8 = _Block_copy(v9);
    [v7 addObject:v8];
  }
}

void __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__247015;
  char v27 = __Block_byref_object_dispose__247016;
  id v28 = 0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_3;
  block[3] = &unk_1E5DD0588;
  void block[4] = v8;
  void block[5] = &v23;
  dispatch_sync(v9, block);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = (id)v24[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v11);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v15 = objc_msgSend(WeakRetained, "isRegisteredForPhotoLibraryChanges", (void)v18);

  if ((v15 & 1) == 0)
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 40));
    id v17 = [v16 photoLibrary];
    [v17 registerChangeObserver:*(void *)(a1 + 32)];
  }
  _Block_object_dispose(&v23, 8);
}

void __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained _representativeAsset];

  if (v4)
  {
    id v5 = [v4 localIdentifier];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
    id v6 = *(id *)(*(void *)(a1 + 32) + 24);
    id v7 = *(id *)(*(void *)(a1 + 32) + 32);
    id v8 = *(id *)(*(void *)(a1 + 32) + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
    id v9 = [*(id *)(a1 + 40) extendedTraitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    if (*(void *)(a1 + 64) == v10)
    {
      BOOL v11 = 0;
      if (!v8) {
        goto LABEL_20;
      }
    }
    else if (v10 != 1 || v6)
    {
      BOOL v11 = v10 == 2 && v7 == 0;
      if (!v8) {
        goto LABEL_20;
      }
    }
    else
    {
      BOOL v11 = 1;
      if (!v8) {
        goto LABEL_20;
      }
    }
    if (([v8 isEqualToString:v5] ^ 1 | v11) == 1)
    {
LABEL_20:
      id v24 = objc_loadWeakRetained(v2);
      [v24 _fetchImageOfAsset:v4 withSnapshotOptions:*(void *)(a1 + 40) andCompletion:*(void *)(a1 + 48)];
LABEL_31:

      goto LABEL_32;
    }
    [*(id *)(a1 + 32) setSnapshottedAsset:v4];
    uint64_t v25 = [*(id *)(a1 + 40) extendedTraitCollection];
    uint64_t v26 = [v25 userInterfaceStyle];

    if (v26 == 2)
    {
      id v27 = v7;
    }
    else
    {
      if (v26 != 1)
      {
        if (!v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136315138;
          double v29 = "-[PXPlacesSnapshotFactory _handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:andCompletion:]_block_invoke_4";
          _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unspecified user interface style not expected here: %s", (uint8_t *)&v28, 0xCu);
        }
        id v24 = 0;
        goto LABEL_30;
      }
      id v27 = v6;
    }
    id v24 = v27;
LABEL_30:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_31;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v16 + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 64));
  [*(id *)(a1 + 32) removePreviousCachedImages];
  [*(id *)(a1 + 32) setPlacesAssetsFetchResult:0];
  if ([*(id *)(a1 + 40) shouldSkipPlaceholder])
  {
    long long v18 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"There are no assets with location in the library");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = objc_loadWeakRetained(v2);
    long long v21 = [*(id *)(a1 + 40) extendedTraitCollection];
    id v22 = [v20 _placeHolderImageForExtendedTraitCollection:v21];
    (*(void (**)(uint64_t, void *, uint64_t, void))(v19 + 16))(v19, v22, v17, 0);
  }
LABEL_32:
}

uint64_t __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v5 removeAllObjects];
}

- (void)requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:(id)a3 andCompletion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, UIImage *, int64_t, void))a4;
  id v8 = [v6 extendedTraitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  if (v9 == 2)
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    uint64_t v10 = self->_cachedSnapshotImageDark;
    BOOL v11 = self->_cachedFilePathDark;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    if (!v11)
    {
      uint64_t v12 = [v6 cacheDirectoryPath];
      BOOL v11 = [v12 stringByAppendingPathComponent:@"PXPlacesAlbumImageCached_Dark.jpg"];
      os_unfair_lock_lock(&self->_cachedIvarLock);
      objc_storeStrong((id *)&self->_cachedFilePathDark, v11);
      os_unfair_lock_unlock(&self->_cachedIvarLock);
    }
  }
  else
  {
    if (v9 != 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 134218498;
      *(void *)&location[4] = v9;
      __int16 v46 = 2112;
      id v47 = v6;
      __int16 v48 = 2080;
      id v49 = "-[PXPlacesSnapshotFactory requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:andCompletion:]";
      _os_log_fault_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "User interface style not expected here: %li\n with options: %@\n function: %s", location, 0x20u);
    }
    os_unfair_lock_lock(&self->_cachedIvarLock);
    uint64_t v10 = self->_cachedSnapshotImageLight;
    uint64_t v13 = self->_cachedFilePathLight;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    if (!v13)
    {
      uint64_t v14 = [v6 cacheDirectoryPath];
      uint64_t v13 = [v14 stringByAppendingPathComponent:@"PXPlacesAlbumImageCached.jpg"];
      os_unfair_lock_lock(&self->_cachedIvarLock);
      objc_storeStrong((id *)&self->_cachedFilePathLight, v13);
      os_unfair_lock_unlock(&self->_cachedIvarLock);
    }
  }
  if (!v10)
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    uint64_t v16 = 8;
    if (v9 == 2) {
      uint64_t v16 = 16;
    }
    id v17 = *(id *)((char *)&self->super.isa + v16);
    __int16 v40 = self->_cachedSnapshotImageIdentifier;
    int64_t cachedCount = self->_cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    id v39 = v17;
    if ([v17 length])
    {
      CFURLRef url = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
      long long v18 = CGImageSourceCreateWithURL(url, 0);
      uint64_t v19 = v18;
      if (v18)
      {
        CFDictionaryRef v20 = CGImageSourceCopyPropertiesAtIndex(v18, 0, 0);
        CFDictionaryRef v36 = v20;
        if (v20)
        {
          long long v21 = -[__CFDictionary objectForKey:](v20, "objectForKey:", *MEMORY[0x1E4F2F800], v20);
          id v22 = [v21 objectForKey:*MEMORY[0x1E4F2F958]];
        }
        else
        {
          id v22 = 0;
        }
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v19, 0, 0);
        CFRelease(v19);
        if (!ImageAtIndex)
        {
          uint64_t v10 = 0;
          goto LABEL_39;
        }
        double v31 = [MEMORY[0x1E4FB1818] imageWithCGImage:ImageAtIndex];
        if (v9 == 1)
        {
          uint64_t v32 = 24;
        }
        else
        {
          if (v9 != 2)
          {
            uint64_t v10 = 0;
            goto LABEL_38;
          }
          uint64_t v32 = 32;
        }
        os_unfair_lock_lock(&self->_cachedIvarLock);
        objc_storeStrong((id *)((char *)&self->super.isa + v32), v31);
        os_unfair_lock_unlock(&self->_cachedIvarLock);
        uint64_t v10 = v31;
LABEL_38:
        CGImageRelease(ImageAtIndex);

LABEL_39:
        if (v22)
        {
          os_unfair_lock_lock(&self->_cachedIvarLock);
          objc_storeStrong((id *)&self->_cachedSnapshotImageIdentifier, v22);
          os_unfair_lock_unlock(&self->_cachedIvarLock);
          double v33 = v22;

          __int16 v40 = v33;
        }

        if (v10 && v40)
        {
          BOOL v34 = -[PXPlacesSnapshotFactory _imageExistsWithLocalIdentifier:](self, "_imageExistsWithLocalIdentifier:");
          char v35 = !v34;
          if (!v7) {
            char v35 = 1;
          }
          if ((v35 & 1) == 0) {
            v7[2](v7, v10, cachedCount, 0);
          }
          if (v34) {
            goto LABEL_27;
          }
        }
        goto LABEL_22;
      }
    }
    uint64_t v10 = 0;
LABEL_22:
    char v23 = objc_msgSend(v6, "shouldSkipPlaceholder", v36);
    if (v7) {
      char v24 = v23;
    }
    else {
      char v24 = 1;
    }
    if ((v24 & 1) == 0)
    {
      uint64_t v25 = [v6 extendedTraitCollection];
      uint64_t v26 = [(PXPlacesSnapshotFactory *)self _placeHolderImageForExtendedTraitCollection:v25];
      v7[2](v7, v26, cachedCount, 0);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v7)
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    int64_t v15 = self->_cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    [(PXPlacesSnapshotFactory *)self setCurrentUserInterfaceStyle:v9];
    v7[2](v7, v10, v15, 0);
  }
LABEL_28:
  objc_initWeak((id *)location, self);
  id v27 = [v6 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PXPlacesSnapshotFactory_requestPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke;
  block[3] = &unk_1E5DCE4D0;
  objc_copyWeak(&v44, (id *)location);
  id v42 = v6;
  id v43 = v7;
  int v28 = v7;
  id v29 = v6;
  dispatch_async(v27, block);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)location);
}

void __94__PXPlacesSnapshotFactory_requestPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:*(void *)(a1 + 32) andCompletion:*(void *)(a1 + 40)];
}

- (void)requestMapSnapshotWithAssets:(id)a3 snapshotOptions:(id)a4 popoverImageOptions:(unint64_t)a5 completion:(id)a6
{
  id v64 = a3;
  id v9 = a4;
  id v10 = a6;
  [v9 viewSize];
  uint64_t v62 = v12;
  uint64_t v63 = v11;
  [v9 additionalInsets];
  uint64_t v61 = v13;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v20 = [v9 shouldRenderThumbnailForNoLocation];
  uint64_t v21 = [v9 popoverImageType];
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x3032000000;
  v107[3] = __Block_byref_object_copy__247015;
  v107[4] = __Block_byref_object_dispose__247016;
  id v108 = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x3032000000;
  v105[3] = __Block_byref_object_copy__247015;
  v105[4] = __Block_byref_object_dispose__247016;
  id v106 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x3032000000;
  v103[3] = __Block_byref_object_copy__247015;
  v103[4] = __Block_byref_object_dispose__247016;
  id v104 = 0;
  id v22 = [v9 queue];
  LODWORD(a4) = dispatch_queue_get_qos_class(v22, 0);

  char v23 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  char v24 = dispatch_queue_attr_make_with_qos_class(v23, (dispatch_qos_class_t)a4, 0);
  dispatch_queue_t v60 = dispatch_queue_create("placesSnapshotConcurrentQueue", v24);

  uint64_t v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v26 = dispatch_queue_attr_make_with_qos_class(v25, (dispatch_qos_class_t)a4, 0);
  dispatch_queue_t v27 = dispatch_queue_create("placesSnapshotSerialQueue", v26);

  int v28 = [v9 extendedTraitCollection];
  id v29 = +[PXPlacesPopoverImageFactory sharedInstance];
  [v29 backgroundImageSizeForType:v21 usingTraitCollection:v28];
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  [v29 thumbnailImageSizeForImageType:v21 usingTraitCollection:v28 includeScale:1];
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  char v38 = [v9 showsPointLabels];
  id v39 = [v9 mapThumbnailCurationDelegate];
  char v59 = v20;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_queue_t v57 = v27;
  v58 = v10;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__247015;
  v101[4] = __Block_byref_object_dispose__247016;
  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v41 = [PXPlacesPhotoAssetsStore alloc];
  id v42 = [(PXPlacesSnapshotFactory *)self photoLibrary];
  id v43 = [(PXPlacesPhotoAssetsStore *)v41 initWithFetchResults:v64 photoLibrary:v42];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke;
  aBlock[3] = &unk_1E5DCA910;
  id v44 = v9;
  id v71 = v44;
  v45 = v43;
  v72 = v45;
  id v56 = v28;
  id v73 = v56;
  uint64_t v86 = v21;
  unint64_t v87 = a5;
  uint64_t v88 = 0;
  id v46 = v39;
  id v74 = v46;
  uint64_t v89 = v63;
  uint64_t v90 = v62;
  uint64_t v91 = v61;
  uint64_t v92 = v15;
  uint64_t v93 = v17;
  uint64_t v94 = v19;
  id v65 = v64;
  id v75 = v65;
  id v47 = v60;
  v82 = v105;
  v83 = v103;
  char v99 = v38;
  v84 = v107;
  uint64_t v76 = v47;
  uint64_t v77 = self;
  id v48 = v40;
  id v78 = v48;
  id v49 = v57;
  id v79 = v49;
  v85 = v101;
  char v100 = v59;
  id v50 = v29;
  id v80 = v50;
  uint64_t v95 = v35;
  uint64_t v96 = v37;
  id v51 = v58;
  id v81 = v51;
  uint64_t v97 = v31;
  uint64_t v98 = v33;
  id v52 = _Block_copy(aBlock);
  id v53 = [v44 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_13;
  block[3] = &unk_1E5DD3280;
  v68 = v45;
  id v69 = v52;
  id v54 = v52;
  v55 = v45;
  dispatch_async(v53, block);

  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);

  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v107, 8);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geotaggableInformationDelegate];
  uint64_t v3 = [*(id *)(a1 + 40) dataSource];
  uint64_t v4 = +[PXPlacesMapPipelineFactory thumbnailPipelineForDataSource:v3 extendedTraitCollection:*(void *)(a1 + 48) geotaggableInfo:v2 popoverImageType:*(void *)(a1 + 152) popoverImageOptions:*(void *)(a1 + 160) countLabelStyle:*(void *)(a1 + 168) thumbnailCurationDelegate:*(void *)(a1 + 56)];
  id v5 = [v4 renderer];
  id v6 = objc_alloc_init(PXPlacesMapController);
  v113[0] = 0;
  uint64_t v7 = [*(id *)(a1 + 32) region];
  if (v9 >= -180.0
    && v9 <= 180.0
    && v8 >= -90.0
    && v8 <= 90.0
    && v10 >= 0.0
    && v10 <= 180.0
    && v11 >= 0.0
    && v11 <= 360.0)
  {
    double v12 = MEMORY[0x1AD109A70](v7);
LABEL_11:
    objc_msgSend(v5, "minimumEdgeInsets", v12);
    double v62 = v20 + *(double *)(a1 + 208);
    double v63 = v21 + *(double *)(a1 + 216);
    double v60 = v22 + *(double *)(a1 + 192);
    double v61 = v23 + *(double *)(a1 + 200);
    _MKMapRectThatFits();
    double v13 = v24;
    double v15 = v25;
    double v17 = v26;
    double v19 = v27;
    goto LABEL_12;
  }
  -[PXPlacesMapController mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:](v6, "mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:", v3, v5, v113, *(double *)(a1 + 176), *(double *)(a1 + 184));
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (!v113[0]) {
    goto LABEL_11;
  }
LABEL_12:
  if (objc_msgSend(*(id *)(a1 + 64), "count", *(void *)&v60, *(void *)&v61, *(void *)&v62, *(void *)&v63) == 1
    && ([*(id *)(a1 + 64) firstObject],
        int v28 = objc_claimAutoreleasedReturnValue(),
        uint64_t v29 = [v28 count],
        v28,
        v29 == 1))
  {
    uint64_t v30 = [*(id *)(a1 + 64) firstObject];
    uint64_t v31 = [v30 firstObject];

    [v31 fetchPropertySetsIfNeeded];
    uint64_t v32 = [v31 location];
    BOOL v33 = v32 != 0;

    uint64_t v34 = (void *)MEMORY[0x1E4F8A930];
    [v31 coarseLocationProperties];
    uint64_t v35 = v3;
    uint64_t v36 = v5;
    v38 = uint64_t v37 = v6;
    [v38 gpsHorizontalAccuracy];
    LODWORD(v34) = objc_msgSend(v34, "horizontalAccuracyIsCoarse:");

    id v6 = v37;
    id v5 = v36;
    uint64_t v3 = v35;
    if (v34)
    {
      v114.origin.x = v13;
      v114.origin.y = v15;
      v114.size.width = v17;
      v114.size.height = v19;
      MKCoordinateRegion v115 = MKCoordinateRegionForMapRect(v114);
      double v13 = MEMORY[0x1AD109A70]((__n128)v115.center, *(__n128 *)&v115.center.longitude, v115.span.latitudeDelta * 4.0, v115.span.longitudeDelta * 4.0);
      double v15 = v39;
      double v17 = v40;
      double v19 = v41;
    }
  }
  else
  {
    BOOL v33 = 1;
  }
  id v42 = dispatch_group_create();
  dispatch_group_enter(v42);
  id v43 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2;
  block[3] = &unk_1E5DCA780;
  long long v105 = *(_OWORD *)(a1 + 120);
  id v44 = v42;
  v101 = v44;
  id v102 = *(id *)(a1 + 32);
  id v103 = *(id *)(a1 + 64);
  long long v106 = *(_OWORD *)(a1 + 176);
  BOOL v111 = v33;
  double v107 = v13;
  double v108 = v15;
  double v109 = v17;
  double v110 = v19;
  id v104 = *(id *)(a1 + 48);
  char v112 = *(unsigned char *)(a1 + 256);
  dispatch_async(v43, block);
  dispatch_group_enter(v44);
  v45 = *(NSObject **)(a1 + 72);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_210;
  v77[3] = &unk_1E5DCA870;
  uint64_t v46 = *(void *)(a1 + 136);
  double v91 = v13;
  double v92 = v15;
  double v93 = v17;
  double v94 = v19;
  long long v95 = *(_OWORD *)(a1 + 176);
  uint64_t v89 = v46;
  id v78 = v4;
  id v47 = *(id *)(a1 + 48);
  uint64_t v48 = *(void *)(a1 + 80);
  id v79 = v47;
  uint64_t v80 = v48;
  id v81 = *(id *)(a1 + 56);
  id v82 = *(id *)(a1 + 88);
  id v49 = *(id *)(a1 + 96);
  uint64_t v90 = *(void *)(a1 + 144);
  char v98 = *(unsigned char *)(a1 + 257);
  BOOL v99 = v33;
  id v83 = v49;
  id v84 = v2;
  id v85 = *(id *)(a1 + 104);
  long long v96 = *(_OWORD *)(a1 + 152);
  id v86 = *(id *)(a1 + 64);
  long long v97 = *(_OWORD *)(a1 + 224);
  id v87 = *(id *)(a1 + 32);
  uint64_t v88 = v44;
  id v50 = v44;
  id v51 = v2;
  id v52 = v4;
  dispatch_async(v45, v77);
  id v53 = [*(id *)(a1 + 32) queue];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_10;
  v64[3] = &unk_1E5DCA8E8;
  uint64_t v68 = *(void *)(a1 + 128);
  id v54 = *(id *)(a1 + 112);
  uint64_t v55 = *(void *)(a1 + 136);
  id v67 = v54;
  long long v72 = *(_OWORD *)(a1 + 176);
  uint64_t v56 = *(void *)(a1 + 120);
  uint64_t v69 = v55;
  uint64_t v70 = v56;
  id v57 = *(id *)(a1 + 96);
  uint64_t v58 = *(void *)(a1 + 144);
  id v65 = v57;
  uint64_t v71 = v58;
  long long v73 = *(_OWORD *)(a1 + 240);
  char v76 = *(unsigned char *)(a1 + 257);
  long long v59 = *(_OWORD *)(a1 + 208);
  long long v74 = *(_OWORD *)(a1 + 192);
  long long v75 = v59;
  id v66 = *(id *)(a1 + 88);
  dispatch_group_notify(v50, v53, v64);
}

uint64_t __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadWithCompletion:*(void *)(a1 + 40)];
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3;
  aBlock[3] = &unk_1E5DCA758;
  long long v13 = *(_OWORD *)(a1 + 64);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = objc_alloc_init(MEMORY[0x1E4F30F40]);
  [v3 setShowsBuildings:1];
  objc_msgSend(v3, "setSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (*(unsigned char *)(a1 + 128)) {
    objc_msgSend(v3, "setMapRect:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  }
  uint64_t v4 = [*(id *)(a1 + 56) traitCollectionForMapKit];
  if (v4)
  {
    [v3 setTraitCollection:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2080;
    double v17 = "-[PXPlacesSnapshotFactory requestMapSnapshotWithAssets:snapshotOptions:popoverImageOptions:completion:]_block_invoke";
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trait collection is nil for snapshot options: %@\nfunction: %s", buf, 0x16u);
  }
  [v3 _setShowsPointLabels:*(unsigned __int8 *)(a1 + 129)];
  if ([*(id *)(a1 + 40) snapshotMapType])
  {
    if ([*(id *)(a1 + 40) snapshotMapType] == 1) {
      uint64_t v6 = 105;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v3 setMapType:v6];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:v3];
  double v8 = [*(id *)(a1 + 40) queue];
  [v7 startWithQueue:v8 completionHandler:v2];
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_210(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[PXPlacesMapViewPort initWithMapRect:andViewSize:zoomLevel:pitch:]([PXPlacesMapViewPort alloc], "initWithMapRect:andViewSize:zoomLevel:pitch:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), 0.0, 0.0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 120) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  double v21 = [*(id *)(a1 + 32) executeWithUpdatedViewPort:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) andDataSourceChange:0];
  uint64_t v5 = [v21 annotationsToAddImmediately];
  uint64_t v6 = dispatch_group_create();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    id v10 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2_212;
        block[3] = &unk_1E5DCA7F8;
        void block[4] = v12;
        id v13 = *(id *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(void **)(a1 + 56);
        id v36 = v13;
        uint64_t v37 = v14;
        id v38 = v15;
        id v39 = *(id *)(a1 + 64);
        id v16 = *(id *)(a1 + 72);
        uint64_t v17 = *(void *)(a1 + 128);
        id v40 = v16;
        uint64_t v42 = v17;
        double v41 = v6;
        dispatch_sync(v10, block);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v8);
  }

  if (![*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) count]
    && *(unsigned char *)(a1 + 216)
    && !*(unsigned char *)(a1 + 217)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v6);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_6;
    v25[3] = &unk_1E5DCA848;
    id v26 = *(id *)(a1 + 88);
    long long v33 = *(_OWORD *)(a1 + 184);
    id v27 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 72);
    uint64_t v20 = *(void *)(a1 + 128);
    id v28 = v19;
    uint64_t v32 = v20;
    uint64_t v29 = v6;
    id v30 = *(id *)(a1 + 96);
    id v31 = *(id *)(a1 + 80);
    long long v34 = *(_OWORD *)(a1 + 200);
    dispatch_sync(MEMORY[0x1E4F14428], v25);
  }
  uint64_t v18 = [*(id *)(a1 + 104) queue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_9;
  v23[3] = &unk_1E5DD36F8;
  id v24 = *(id *)(a1 + 112);
  dispatch_group_notify(v6, v18, v23);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_10(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 88), 0, 0.0);
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) image];
    [v3 size];
    double v5 = v4;
    [v3 size];
    objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v5, v6);
    uint64_t v7 = *(NSObject **)(a1 + 32);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_11;
    id v13 = &unk_1E5DCA8C0;
    int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    long long v16 = *(_OWORD *)(a1 + 104);
    char v19 = *(unsigned char *)(a1 + 152);
    long long v17 = *(_OWORD *)(a1 + 120);
    long long v18 = *(_OWORD *)(a1 + 136);
    id v14 = v3;
    id v8 = v3;
    dispatch_sync(v7, &v10);
    uint64_t v9 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", v10, v11, v12, v13);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_11(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_12;
  v4[3] = &unk_1E5DCA898;
  uint64_t v6 = *(void *)(a1 + 48);
  long long v2 = *(_OWORD *)(a1 + 56);
  char v10 = *(unsigned char *)(a1 + 104);
  long long v3 = *(_OWORD *)(a1 + 72);
  long long v7 = v2;
  long long v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 88);
  id v5 = *(id *)(a1 + 32);
  [v1 enumerateKeysAndObjectsUsingBlock:v4];
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  [v18 coordinate];
  if (CLLocationCoordinate2DIsValid(v20))
  {
    char v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v18 coordinate];
    objc_msgSend(v10, "pointForCoordinate:");
    double v12 = v11 + *(double *)(a1 + 48) * -0.5;
    double v14 = v13 - v9;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 96)) {
      goto LABEL_6;
    }
    double v15 = *(double *)(a1 + 80);
    [*(id *)(a1 + 32) size];
    double v12 = v16 * 0.5 - *(double *)(a1 + 48) * 0.5;
    [*(id *)(a1 + 32) size];
    double v14 = (v17 - v15) * 0.5 - v9 * 0.5;
  }
  objc_msgSend(v5, "drawInRect:", v12, v14, v7, v9);
LABEL_6:
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2_212(uint64_t a1)
{
  long long v2 = -[PXPlacesMapThumbnailAnnotationView initWithAnnotation:reuseIdentifier:extendedTraitCollection:imageCache:countLabelStyle:]([PXPlacesMapThumbnailAnnotationView alloc], "initWithAnnotation:reuseIdentifier:extendedTraitCollection:imageCache:countLabelStyle:", *(void *)(a1 + 32), &stru_1F00B0030, *(void *)(a1 + 40), 0, [*(id *)(a1 + 48) countLabelStyle]);
  [(PXPlacesMapThumbnailAnnotationView *)v2 setThumbnailCurationDelegate:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) addObject:v2];
  objc_initWeak(&location, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3_217;
  v7[3] = &unk_1E5DCA7D0;
  objc_copyWeak(&v11, &location);
  id v3 = *(id *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  long long v6 = *(_OWORD *)(a1 + 80);
  id v5 = (id)v6;
  long long v10 = v6;
  [(PXPlacesMapThumbnailAnnotationView *)v2 setDisplayCompletion:v7];
  [(PXPlacesMapThumbnailAnnotationView *)v2 setAnnotation:*(void *)(a1 + 32)];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_6(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_7;
  aBlock[3] = &unk_1E5DCA820;
  id v8 = *(id *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 88);
  id v9 = *(id *)(a1 + 40);
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 80);
  id v10 = v2;
  uint64_t v12 = v3;
  id v11 = *(id *)(a1 + 56);
  uint64_t v4 = _Block_copy(aBlock);
  id v5 = [*(id *)(a1 + 64) firstObject];
  long long v6 = [v5 firstObject];

  objc_msgSend(*(id *)(a1 + 72), "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v6, 0, v4, *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_9(uint64_t a1)
{
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) createPopoverImageForGeotaggable:a2 withImage:a3 imageType:*(void *)(a1 + 72) imageOptions:*(void *)(a1 + 80) usingTraitCollection:*(void *)(a1 + 40)];
  id v5 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_8;
  block[3] = &unk_1E5DCCA20;
  id v10 = v4;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_async(v5, block);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_8(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:*MEMORY[0x1E4F1E750] longitude:*(double *)(MEMORY[0x1E4F1E750] + 8)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3_217(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_4;
  block[3] = &unk_1E5DCA7D0;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v3;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained renderToImage];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_5;
  block[3] = &unk_1E5DCA7A8;
  id v4 = *(NSObject **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) coordinate];
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v2 longitude:v3];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:*(void *)(a1 + 40) forKeyedSubscript:v4];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if ((!v6 || v7) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "snapshotMapType"));
    [*(id *)(a1 + 40) viewSize];
    id v9 = NSStringFromCGSize(v22);
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 136316162;
    uint64_t v12 = "-[PXPlacesSnapshotFactory requestMapSnapshotWithAssets:snapshotOptions:popoverImageOptions:completion:]_block_invoke_3";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    double v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error fetching place tile in: %s error: %@ (type: %@, %@, \nassets: %@)", (uint8_t *)&v11, 0x34u);
  }
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_currentUserInterfaceStyle = a3;
  objc_sync_exit(obj);
}

- (int64_t)currentUserInterfaceStyle
{
  double v2 = self;
  objc_sync_enter(v2);
  int64_t currentUserInterfaceStyle = v2->_currentUserInterfaceStyle;
  objc_sync_exit(v2);

  return currentUserInterfaceStyle;
}

- (void)dealloc
{
  if (self->_isRegisteredForPhotoLibraryChanges)
  {
    double v3 = [(PXPlacesSnapshotFactory *)self photoLibrary];
    [v3 unregisterChangeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)PXPlacesSnapshotFactory;
  [(PXPlacesSnapshotFactory *)&v4 dealloc];
}

- (PXPlacesSnapshotFactory)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXPlacesSnapshotFactory.m", 143, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PXPlacesSnapshotFactory;
  id v7 = [(PXPlacesSnapshotFactory *)&v21 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    if (PFProcessIsLaunchedToExecuteTests())
    {
      id v9 = objc_alloc_init(PXLibraryFilterState);
      libraryFilterState = v8->_libraryFilterState;
      v8->_libraryFilterState = v9;
    }
    else
    {
      libraryFilterState = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v8->_photoLibrary];
      int v11 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:libraryFilterState];
      uint64_t v12 = v8->_libraryFilterState;
      v8->_libraryFilterState = v11;
    }
    v8->_countCacheInvalidated = 1;
    v8->_int64_t cachedCount = 0;
    uint64_t v13 = objc_opt_new();
    localSearches = v8->_localSearches;
    v8->_localSearches = (NSMutableArray *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("imagingServicesQueue", MEMORY[0x1E4F14430]);
    concurrentQueue = v8->_concurrentQueue;
    v8->_concurrentQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("snapshotRequestsServicesQueue", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v17;

    v8->_cachedIvarLock._os_unfair_lock_opaque = 0;
    v8->_countLabelStyle = 1;
  }

  return v8;
}

- (PXPlacesSnapshotFactory)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesSnapshotFactory.m", 139, @"%s is not available as initializer", "-[PXPlacesSnapshotFactory init]");

  abort();
}

@end