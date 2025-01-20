@interface PXFeaturedPhotosAssetsDataSourceManager
- (BOOL)supportsFiltering;
- (NSCache)keyAssetBySuggestionIdentifierCache;
- (OS_dispatch_queue)queue;
- (PHAssetCollection)assetCollection;
- (PXFeaturedPhotosAssetsDataSourceManager)initWithSuggestionsDataSourceManager:(id)a3 assetCollection:(id)a4;
- (PXSuggestionsDataSource)suggestionsDataSource;
- (PXSuggestionsDataSourceManager)suggestionsDataSourceManager;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssetCollection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSuggestionsDataSource:(id)a3;
- (void)updateDataSourceWithNewSuggestions:(id)a3 changeDetails:(id)a4 assetCollection:(id)a5 cache:(id)a6;
@end

@implementation PXFeaturedPhotosAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyAssetBySuggestionIdentifierCache, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSourceManager, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSCache)keyAssetBySuggestionIdentifierCache
{
  return self->_keyAssetBySuggestionIdentifierCache;
}

- (void)setAssetCollection:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setSuggestionsDataSource:(id)a3
{
}

- (PXSuggestionsDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (PXSuggestionsDataSourceManager)suggestionsDataSourceManager
{
  return self->_suggestionsDataSourceManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)dataSourceManagerObservationContext == a5)
  {
    if (a4)
    {
      v9 = [(PXFeaturedPhotosAssetsDataSourceManager *)self suggestionsDataSource];
      v10 = [(PXFeaturedPhotosAssetsDataSourceManager *)self suggestionsDataSourceManager];
      v11 = [v10 dataSource];

      [(PXFeaturedPhotosAssetsDataSourceManager *)self setSuggestionsDataSource:v11];
      v12 = [(PXFeaturedPhotosAssetsDataSourceManager *)self suggestionsDataSourceManager];
      v13 = [v12 changeHistory];
      v14 = objc_msgSend(v13, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v9, "identifier"), objc_msgSend(v11, "identifier"));

      v15 = [(PXFeaturedPhotosAssetsDataSourceManager *)self assetCollection];
      v16 = [(PXFeaturedPhotosAssetsDataSourceManager *)self keyAssetBySuggestionIdentifierCache];
      [(PXFeaturedPhotosAssetsDataSourceManager *)self updateDataSourceWithNewSuggestions:v11 changeDetails:v14 assetCollection:v15 cache:v16];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXFeaturedPhotosAssetsDataSourceManager;
    [(PXPhotoKitAssetsDataSourceManager *)&v17 observable:v8 didChange:a4 context:a5];
  }
}

- (void)updateDataSourceWithNewSuggestions:(id)a3 changeDetails:(id)a4 assetCollection:(id)a5 cache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(PXSectionedDataSourceManager *)self dataSource];
  v15 = (void *)[v14 identifier];

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__PXFeaturedPhotosAssetsDataSourceManager_updateDataSourceWithNewSuggestions_changeDetails_assetCollection_cache___block_invoke;
  block[3] = &unk_1E5DB88A0;
  id v22 = v10;
  id v23 = v12;
  id v24 = v13;
  id v25 = v11;
  v26[1] = v15;
  id v17 = v11;
  id v18 = v13;
  id v19 = v12;
  id v20 = v10;
  objc_copyWeak(v26, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(v26);

  objc_destroyWeak(&location);
}

void __114__PXFeaturedPhotosAssetsDataSourceManager_updateDataSourceWithNewSuggestions_changeDetails_assetCollection_cache___block_invoke(uint64_t a1)
{
  v2 = newDataSourceWithSuggestionsDataSource(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  if ([*(id *)(a1 + 56) count] == 1)
  {
    id v3 = objc_alloc((Class)off_1E5DA8488);
    v4 = [*(id *)(a1 + 56) firstObject];
    v5 = objc_msgSend(v3, "initWithSectionedDataSourceChangeDetails:withFromDataSourceIdentifier:toDataSourceIdentifier:", v4, *(void *)(a1 + 72), objc_msgSend(v2, "versionIdentifier"));
  }
  else
  {
    v5 = 0;
  }
  objc_copyWeak(&v6, (id *)(a1 + 64));
  v2;
  v5;
  px_dispatch_on_main_queue();
}

void __114__PXFeaturedPhotosAssetsDataSourceManager_updateDataSourceWithNewSuggestions_changeDetails_assetCollection_cache___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPhotosDataSource:*(void *)(a1 + 32) changeDetails:*(void *)(a1 + 40)];
}

- (BOOL)supportsFiltering
{
  return 0;
}

- (PXFeaturedPhotosAssetsDataSourceManager)initWithSuggestionsDataSourceManager:(id)a3 assetCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = initialPhotosDataSourceWithAssetCollection(v8);
  v13.receiver = self;
  v13.super_class = (Class)PXFeaturedPhotosAssetsDataSourceManager;
  id v10 = [(PXPhotoKitAssetsDataSourceManager *)&v13 initWithPhotosDataSource:v9];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a4);
    objc_storeStrong((id *)&v11->_suggestionsDataSourceManager, a3);
    px_dispatch_queue_create_serial();
  }

  return 0;
}

@end