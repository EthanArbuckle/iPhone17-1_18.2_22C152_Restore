@interface PXPlacesMapFetchResultController
- (BOOL)isPreloaded;
- (OS_dispatch_queue)serialQueue;
- (PHPhotoLibrary)photoLibrary;
- (PXLibraryFilterState)libraryFilterState;
- (PXPlacesMapController)mapController;
- (PXPlacesMapControllerAccess)mapControllerAccessor;
- (PXPlacesMapFetchResultController)init;
- (PXPlacesMapFetchResultController)initWithLibraryFilterState:(id)a3 photoLibrary:(id)a4;
- (PXPlacesMapFetchResultController)initWithMapControllerAccessor:(id)a3 libraryFilterState:(id)a4 photoLibrary:(id)a5;
- (PXPlacesMapFetchResultController)initWithPhotoLibrary:(id)a3;
- (PXPlacesMapGeotaggableInfoDelegate)geotaggableInfoDelegate;
- (PXPlacesMapPipeline)albumPipeline;
- (PXPlacesMapPipeline)currentPipeline;
- (PXPlacesMapPipeline)providedPipeline;
- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate;
- (PXPlacesMapView)mapView;
- (PXPlacesPhotoAssetsStore)albumAssetStore;
- (PXPlacesPhotoAssetsStore)providedAssetStore;
- (id)currentAssetStore;
- (id)visibleGeotaggables;
- (unint64_t)contentMode;
- (void)focusOnGeotaggablesAnimated:(BOOL)a3;
- (void)focusOnMapRect:(id)a3 animated:(BOOL)a4;
- (void)focusOnProvidedAssetsAnimated:(BOOL)a3;
- (void)focusOnProvidedAssetsImmediately;
- (void)loadFetchResult:(id)a3 withCompletion:(id)a4;
- (void)loadFetchResults:(id)a3 withCompletion:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)preloadMap;
- (void)reloadContentModeWithCompletion:(id)a3;
- (void)reloadMapWithCompletion:(id)a3;
- (void)resumeWithCompletion:(id)a3;
- (void)setAlbumAssetStore:(id)a3;
- (void)setAlbumPipeline:(id)a3;
- (void)setContentMode:(unint64_t)a3;
- (void)setCurrentPipeline:(id)a3;
- (void)setGeotaggableInfoDelegate:(id)a3;
- (void)setIsPreloaded:(BOOL)a3;
- (void)setMapControllerAccessor:(id)a3;
- (void)setProvidedAssetStore:(id)a3;
- (void)setProvidedPipeline:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setThumbnailCurationDelegate:(id)a3;
@end

@implementation PXPlacesMapFetchResultController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_currentPipeline, 0);
  objc_storeStrong((id *)&self->_albumPipeline, 0);
  objc_storeStrong((id *)&self->_albumAssetStore, 0);
  objc_storeStrong((id *)&self->_providedPipeline, 0);
  objc_storeStrong((id *)&self->_providedAssetStore, 0);
  objc_storeStrong((id *)&self->_geotaggableInfoDelegate, 0);
  objc_destroyWeak((id *)&self->_thumbnailCurationDelegate);
  objc_storeStrong((id *)&self->_mapControllerAccessor, 0);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setCurrentPipeline:(id)a3
{
}

- (PXPlacesMapPipeline)currentPipeline
{
  return self->_currentPipeline;
}

- (void)setAlbumPipeline:(id)a3
{
}

- (void)setAlbumAssetStore:(id)a3
{
}

- (void)setIsPreloaded:(BOOL)a3
{
  self->_isPreloaded = a3;
}

- (BOOL)isPreloaded
{
  return self->_isPreloaded;
}

- (void)setProvidedPipeline:(id)a3
{
}

- (PXPlacesMapPipeline)providedPipeline
{
  return (PXPlacesMapPipeline *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProvidedAssetStore:(id)a3
{
}

- (PXPlacesPhotoAssetsStore)providedAssetStore
{
  return (PXPlacesPhotoAssetsStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGeotaggableInfoDelegate:(id)a3
{
}

- (PXPlacesMapGeotaggableInfoDelegate)geotaggableInfoDelegate
{
  return self->_geotaggableInfoDelegate;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_contentMode = a3;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (void)setThumbnailCurationDelegate:(id)a3
{
}

- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailCurationDelegate);
  return (PXPlacesMapThumbnailCurationDelegate *)WeakRetained;
}

- (void)setMapControllerAccessor:(id)a3
{
}

- (PXPlacesMapControllerAccess)mapControllerAccessor
{
  return self->_mapControllerAccessor;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXLibraryFilterStateObservationContext_66327 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPlacesMapFetchResultController.m" lineNumber:307 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXPlacesMapFetchResultController *)self reloadMapWithCompletion:0];
    id v9 = v11;
  }
}

- (void)focusOnMapRect:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v7 = a3.var0.var1;
  double v8 = a3.var0.var0;
  id v11 = [(PXPlacesMapFetchResultController *)self mapController];
  v10 = [(PXPlacesMapFetchResultController *)self currentPipeline];
  objc_msgSend(v11, "setVisibleMapRect:forPipeline:animated:", v10, v4, v8, v7, var0, var1);
}

- (void)focusOnGeotaggablesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(PXPlacesMapFetchResultController *)self mapController];
  v5 = [(PXPlacesMapFetchResultController *)self currentPipeline];
  [v6 focusOnGeotaggablesFromPipeline:v5 animated:v3];
}

- (void)focusOnProvidedAssetsImmediately
{
  id v4 = [(PXPlacesMapFetchResultController *)self mapController];
  BOOL v3 = [(PXPlacesMapFetchResultController *)self providedPipeline];
  [v4 focusOnGeotaggablesFromPipelineImmediately:v3];
}

- (void)focusOnProvidedAssetsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(PXPlacesMapFetchResultController *)self mapController];
  v5 = [(PXPlacesMapFetchResultController *)self providedPipeline];
  [v6 focusOnGeotaggablesFromPipeline:v5 animated:v3];
}

- (void)resumeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PXPlacesMapFetchResultController *)self mapControllerAccessor];
  id v6 = [v5 mapController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PXPlacesMapFetchResultController_resumeWithCompletion___block_invoke;
  v8[3] = &unk_1E5DD3128;
  id v9 = v4;
  id v7 = v4;
  [v6 resumePipelines:v8];
}

uint64_t __57__PXPlacesMapFetchResultController_resumeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadFetchResult:(id)a3 withCompletion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PXPlacesMapFetchResultController loadFetchResults:withCompletion:](self, "loadFetchResults:withCompletion:", v9, v7, v10, v11);
}

- (void)loadFetchResults:(id)a3 withCompletion:(id)a4
{
  v17 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = [PXPlacesPhotoAssetsStore alloc];
  id v8 = [(PXPlacesMapFetchResultController *)self photoLibrary];
  id v9 = [(PXPlacesPhotoAssetsStore *)v7 initWithFetchResults:v6 photoLibrary:v8];

  [(PXPlacesMapFetchResultController *)self setProvidedAssetStore:v9];
  id v10 = [(PXPlacesMapFetchResultController *)self providedAssetStore];
  uint64_t v11 = [v10 dataSource];
  v12 = [(PXPlacesMapFetchResultController *)self mapControllerAccessor];
  v13 = objc_msgSend(v12, "pk_extendedTraitCollection");
  v14 = [(PXPlacesMapFetchResultController *)self geotaggableInfoDelegate];
  v15 = [(PXPlacesMapFetchResultController *)self thumbnailCurationDelegate];
  v16 = +[PXPlacesMapPipelineFactory thumbnailPipelineForDataSource:v11 extendedTraitCollection:v13 geotaggableInfo:v14 popoverImageType:3 popoverImageOptions:0 countLabelStyle:1 thumbnailCurationDelegate:v15];

  [(PXPlacesMapFetchResultController *)self setProvidedPipeline:v16];
  if (v17) {
    v17[2]();
  }
}

- (void)reloadContentModeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(PXPlacesMapFetchResultController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke;
  v7[3] = &unk_1E5DCE4D0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained contentMode];
    if (v4 == 1)
    {
      v5 = [v3 providedPipeline];
      uint64_t v6 = [v3 providedAssetStore];
    }
    else
    {
      if (v4)
      {
        v5 = 0;
        id v7 = 0;
        goto LABEL_13;
      }
      v5 = [v3 albumPipeline];
      uint64_t v6 = [v3 albumAssetStore];
    }
    id v7 = (void *)v6;
    if (v5)
    {
      id v8 = [v3 currentPipeline];

      if (v8)
      {
        id v9 = [v3 currentPipeline];

        if (v9 == v5)
        {
          v16 = (void (**)(void))a1[5];
          if (v16) {
            v16[2]();
          }
          goto LABEL_13;
        }
        id v10 = [v3 mapController];
        [v10 suspendPipelines];

        uint64_t v11 = [v3 mapController];
        v12 = [a1[4] currentPipeline];
        [v11 removePipeline:v12];

        v13 = [v3 mapController];
        [v13 addPipeline:v5];

        [v3 setCurrentPipeline:v5];
        v14 = [v3 mapController];
        [v14 resumePipelines:0];
      }
      else
      {
        v15 = [v3 mapController];
        [v15 addPipeline:v5];

        [v3 setCurrentPipeline:v5];
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke_2;
      v17[3] = &unk_1E5DD3128;
      id v18 = a1[5];
      [v7 loadWithCompletion:v17];
    }
LABEL_13:
  }
}

uint64_t __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reloadMapWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4F390A0];
  uint64_t v6 = [(PXPlacesMapFetchResultController *)self photoLibrary];
  id v7 = [v5 fetchOptionsWithPhotoLibrary:v6 orObject:0];

  id v8 = [(PXPlacesMapFetchResultController *)self libraryFilterState];
  objc_msgSend(v7, "setSharingFilter:", objc_msgSend(v8, "sharingFilter"));

  id v9 = [(PXPlacesMapFetchResultController *)self serialQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke;
  v12[3] = &unk_1E5DCE4D0;
  id v13 = v7;
  id v10 = v7;
  objc_copyWeak(&v15, &location);
  id v14 = v4;
  id v11 = v4;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F38EB8], "pk_fetchPlacesAssetsInAssetCollection:shouldMergeOptionFetchPropertySets:options:", 0, 0, *(void *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5DD1848;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  [WeakRetained loadFetchResult:v2 withCompletion:v4];

  objc_destroyWeak(&v6);
}

void __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_3;
  v4[3] = &unk_1E5DD1848;
  objc_copyWeak(&v6, v2);
  id v5 = *(id *)(a1 + 32);
  [WeakRetained reloadContentModeWithCompletion:v4];

  objc_destroyWeak(&v6);
}

void __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained resumeWithCompletion:*(void *)(a1 + 32)];
}

- (void)preloadMap
{
  if (![(PXPlacesMapFetchResultController *)self isPreloaded])
  {
    [(PXPlacesMapFetchResultController *)self setIsPreloaded:1];
    uint64_t v3 = MEMORY[0x1E4F1CBF0];
    [(PXPlacesMapFetchResultController *)self loadFetchResults:v3 withCompletion:0];
  }
}

- (PXPlacesPhotoAssetsStore)albumAssetStore
{
  v16[1] = *MEMORY[0x1E4F143B8];
  albumAssetStore = self->_albumAssetStore;
  if (!albumAssetStore)
  {
    id v4 = (void *)MEMORY[0x1E4F390A0];
    id v5 = [(PXPlacesMapFetchResultController *)self photoLibrary];
    id v6 = [v4 fetchOptionsWithPhotoLibrary:v5 orObject:0];

    id v7 = [(PXPlacesMapFetchResultController *)self libraryFilterState];
    objc_msgSend(v6, "setSharingFilter:", objc_msgSend(v7, "sharingFilter"));

    id v8 = objc_msgSend(MEMORY[0x1E4F390A0], "px_placesFetchOptionsWith:", v6);

    id v9 = objc_msgSend(MEMORY[0x1E4F38EB8], "pk_fetchPlacesAssetsInAssetCollection:shouldMergeOptionFetchPropertySets:options:", 0, 0, v8);
    id v10 = [PXPlacesPhotoAssetsStore alloc];
    if (v9)
    {
      v16[0] = v9;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v12 = [(PXPlacesMapFetchResultController *)self photoLibrary];
    id v13 = [(PXPlacesPhotoAssetsStore *)v10 initWithFetchResults:v11 photoLibrary:v12];
    id v14 = self->_albumAssetStore;
    self->_albumAssetStore = v13;

    if (v9) {
    albumAssetStore = self->_albumAssetStore;
    }
  }
  return albumAssetStore;
}

- (PXPlacesMapPipeline)albumPipeline
{
  albumPipeline = self->_albumPipeline;
  if (!albumPipeline)
  {
    id v4 = [(PXPlacesMapFetchResultController *)self albumAssetStore];
    id v5 = [v4 dataSource];
    id v6 = [(PXPlacesMapFetchResultController *)self mapControllerAccessor];
    id v7 = objc_msgSend(v6, "pk_extendedTraitCollection");
    id v8 = [(PXPlacesMapFetchResultController *)self geotaggableInfoDelegate];
    id v9 = [(PXPlacesMapFetchResultController *)self thumbnailCurationDelegate];
    id v10 = +[PXPlacesMapPipelineFactory thumbnailPipelineForDataSource:v5 extendedTraitCollection:v7 geotaggableInfo:v8 popoverImageType:3 popoverImageOptions:0 countLabelStyle:1 thumbnailCurationDelegate:v9];

    id v11 = self->_albumPipeline;
    self->_albumPipeline = v10;

    albumPipeline = self->_albumPipeline;
  }
  return albumPipeline;
}

- (id)currentAssetStore
{
  unint64_t v3 = [(PXPlacesMapFetchResultController *)self contentMode];
  if (v3 == 1)
  {
    id v4 = [(PXPlacesMapFetchResultController *)self providedAssetStore];
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(PXPlacesMapFetchResultController *)self albumAssetStore];
  }
  return v4;
}

- (id)visibleGeotaggables
{
  unint64_t v3 = [(PXPlacesMapFetchResultController *)self currentAssetStore];
  id v4 = [v3 dataSource];
  id v5 = [(PXPlacesMapFetchResultController *)self mapControllerAccessor];
  id v6 = [v5 mapController];
  id v7 = [v6 visibleGeotaggableFromDataSource:v4];

  return v7;
}

- (PXPlacesMapController)mapController
{
  v2 = [(PXPlacesMapFetchResultController *)self mapControllerAccessor];
  unint64_t v3 = [v2 mapController];

  return (PXPlacesMapController *)v3;
}

- (PXPlacesMapView)mapView
{
  v2 = [(PXPlacesMapFetchResultController *)self mapControllerAccessor];
  unint64_t v3 = [v2 mapController];
  id v4 = [v3 mapView];

  return (PXPlacesMapView *)v4;
}

- (PXPlacesMapFetchResultController)initWithLibraryFilterState:(id)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(PXPlacesMapViewController);
  id v9 = [(PXPlacesMapFetchResultController *)self initWithMapControllerAccessor:v8 libraryFilterState:v7 photoLibrary:v6];

  return v9;
}

- (PXPlacesMapFetchResultController)initWithMapControllerAccessor:(id)a3 libraryFilterState:(id)a4 photoLibrary:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultController.m", 74, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PXPlacesMapFetchResultController;
  id v13 = [(PXPlacesMapFetchResultController *)&v21 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    id v15 = objc_alloc_init(PXPlacesGeotaggableMediaProvider);
    geotaggableInfoDelegate = v14->_geotaggableInfoDelegate;
    v14->_geotaggableInfoDelegate = (PXPlacesMapGeotaggableInfoDelegate *)v15;

    objc_storeStrong((id *)&v14->_mapControllerAccessor, a3);
    v14->_contentMode = 1;
    dispatch_queue_t v17 = dispatch_queue_create("Reload Queue", 0);
    serialQueue = v14->_serialQueue;
    v14->_serialQueue = (OS_dispatch_queue *)v17;

    v14->_isPreloaded = 0;
    objc_storeStrong((id *)&v14->_libraryFilterState, a4);
    [(PXLibraryFilterState *)v14->_libraryFilterState registerChangeObserver:v14 context:PXLibraryFilterStateObservationContext_66327];
  }

  return v14;
}

- (PXPlacesMapFetchResultController)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultController.m", 62, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapFetchResultController;
  id v7 = [(PXPlacesMapFetchResultController *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v8;
}

- (PXPlacesMapFetchResultController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapFetchResultController.m", 57, @"%s is not available as initializer", "-[PXPlacesMapFetchResultController init]");

  abort();
}

@end