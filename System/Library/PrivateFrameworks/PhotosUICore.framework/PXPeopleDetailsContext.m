@interface PXPeopleDetailsContext
+ (id)photosDetailsContextForAsset:(id)a3 parentContext:(id)a4;
+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 viewSourceOrigin:(int64_t)a8;
+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 viewSourceOrigin:(int64_t)a5;
- (BOOL)shouldUseKeyFace;
- (PHFetchResult)keyFaceAssetFetchResult;
- (PHSocialGroup)socialGroup;
- (PXPeopleDetailsContext)initWithPeople:(id)a3 orSocialGroup:(id)a4 parentContext:(id)a5 assetCollectionsFetch:(id)a6 ignoreSharedLibraryFilters:(BOOL)a7;
- (PXPeopleDetailsContext)initWithPeople:(id)a3 parentContext:(id)a4;
- (PXPeopleDetailsContext)initWithPeople:(id)a3 parentContext:(id)a4 ignoreSharedLibraryFilters:(BOOL)a5;
- (PXPeopleDetailsContext)initWithPhotosDataSource:(id)a3 displayTitleInfo:(id)a4 parentContext:(id)a5 keyAssetsFetchResult:(id)a6;
- (id)_displayTitleForPeople:(id)a3;
- (id)_fetchKeyFaceAssetFetchResultFromPerson:(id)a3;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_updateKeyFaceAssetFetchResult;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setKeyFaceAssetFetchResult:(id)a3;
@end

@implementation PXPeopleDetailsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_keyFaceAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_fetchingQueue, 0);
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (PHFetchResult)keyFaceAssetFetchResult
{
  return self->_keyFaceAssetFetchResult;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXPhotosDetailsContext *)self people];
  v9 = [v7 objectForKeyedSubscript:@"preparedForCurrentPeopleFetchResult"];

  if (v9 == v8)
  {
    v13 = [v7 objectForKeyedSubscript:@"preparedPeopleFetchResult"];
  }
  else
  {
    v10 = [v6 changeDetailsForFetchResult:v8];
    v11 = v10;
    if (v10)
    {
      id v12 = [v10 fetchResultAfterChanges];
    }
    else
    {
      id v12 = v8;
    }
    v13 = v12;
  }
  if (v13 != v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__PXPeopleDetailsContext_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke;
    v14[3] = &unk_1E5DCBEB0;
    id v15 = v13;
    [(PXPeopleDetailsContext *)self performChanges:v14];
    [(PXPeopleDetailsContext *)self _updateKeyFaceAssetFetchResult];
  }
}

uint64_t __76__PXPeopleDetailsContext_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPeople:*(void *)(a1 + 32)];
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__253231;
  v16 = __Block_byref_object_dispose__253232;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PXPeopleDetailsContext_prepareForPhotoLibraryChange___block_invoke;
  v11[3] = &unk_1E5DD0588;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(MEMORY[0x1E4F14428], v11);
  v5 = [v4 changeDetailsForFetchResult:v13[5]];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 fetchResultAfterChanges];
  }
  else
  {
    id v7 = (id)v13[5];
  }
  v8 = v7;
  v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v9 setObject:v13[5] forKeyedSubscript:@"preparedForCurrentPeopleFetchResult"];
  [v9 setObject:v8 forKeyedSubscript:@"preparedPeopleFetchResult"];
  [v9 setObject:v6 forKeyedSubscript:@"preparedChangeDetails"];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __55__PXPeopleDetailsContext_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) people];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_displayTitleForPeople:(id)a3
{
  uint64_t v3 = [a3 fetchedObjects];
  id v4 = +[PXPeopleUtilities slideshowTitleStringForPeople:v3];

  v5 = [off_1E5DA7230 defaultHelper];
  id v6 = [v5 titleForDisplayableText:v4 titleCategory:2 options:0];

  return v6;
}

- (id)_fetchKeyFaceAssetFetchResultFromPerson:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F390A0];
  id v4 = a3;
  v5 = [v3 fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setFetchLimit:1];
  id v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v6];

  [v5 setIncludeTorsoAndFaceDetectionData:1];
  id v7 = objc_msgSend(MEMORY[0x1E4F39050], "px_fetchKeyFaceForPerson:options:", v4, v5);

  v8 = [v7 firstObject];

  if (v8)
  {
    v9 = [v8 photoLibrary];
    v10 = objc_msgSend(v9, "px_standardLibrarySpecificFetchOptions");

    [v10 setIncludeHiddenAssets:0];
    v11 = (void *)MEMORY[0x1E4F38EB8];
    v15[0] = v8;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v13 = [v11 fetchAssetsForFaces:v12 options:v10];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_updateKeyFaceAssetFetchResult
{
  uint64_t v3 = [(PXPhotosDetailsContext *)self people];
  id v4 = [v3 firstObject];

  objc_initWeak(&location, self);
  fetchingQueue = self->_fetchingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(fetchingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _fetchKeyFaceAssetFetchResultFromPerson:*(void *)(a1 + 32)];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_2;
    v6[3] = &unk_1E5DD32A8;
    v6[4] = v3;
    id v7 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_3;
  v2[3] = &unk_1E5DCBEB0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

uint64_t __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setKeyFaceAssetFetchResult:*(void *)(a1 + 32)];
}

- (void)setKeyFaceAssetFetchResult:(id)a3
{
  id v7 = (PHFetchResult *)a3;
  id v5 = self->_keyFaceAssetFetchResult;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PHFetchResult *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_keyFaceAssetFetchResult, a3);
      [(PXPeopleDetailsContext *)self signalChange:0x100000];
    }
  }
}

- (BOOL)shouldUseKeyFace
{
  uint64_t v2 = [(PXPhotosDetailsContext *)self people];
  BOOL v3 = [v2 count] == 1;

  return v3;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDetailsContext;
  [(PXPhotosDetailsContext *)&v3 performChanges:a3];
}

- (void)didPerformChanges
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleDetailsContext;
  [(PXPeopleDetailsContext *)&v10 didPerformChanges];
  objc_super v3 = [(PXPeopleDetailsContext *)self socialGroup];
  if (v3)
  {
    id v4 = [(PXPeopleDetailsContext *)self socialGroup];
    objc_msgSend(v4, "px_title");
  }
  else
  {
    id v4 = [(PXPhotosDetailsContext *)self people];
    [(PXPeopleDetailsContext *)self _displayTitleForPeople:v4];
  id v5 = };

  char v6 = [(PXPhotosDetailsContext *)self displayTitleInfo];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PXPeopleDetailsContext_didPerformChanges__block_invoke;
  v8[3] = &unk_1E5DCBED8;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8];
}

uint64_t __43__PXPeopleDetailsContext_didPerformChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (PXPeopleDetailsContext)initWithPeople:(id)a3 orSocialGroup:(id)a4 parentContext:(id)a5 assetCollectionsFetch:(id)a6 ignoreSharedLibraryFilters:(BOOL)a7
{
  BOOL v7 = a7;
  v60[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v52 = a5;
  id v14 = a6;
  id v15 = v14;
  id obj = a4;
  if (v14)
  {
    BOOL v16 = v7;
    id v17 = 0;
    v18 = 0;
    v19 = 0;
    v53 = v14;
  }
  else
  {
    if ([v12 count])
    {
      id v59 = 0;
      v53 = +[PXPeopleUtilities assetCollectionListFetchResultForPeople:v12 assetCollectionFetchResults:&v59];
      id v20 = v59;
      v19 = 0;
      v18 = 0;
    }
    else
    {
      if (!v13)
      {
        v45 = 0;
        v18 = 0;
        v19 = 0;
        v44 = 0;
        goto LABEL_19;
      }
      v18 = objc_msgSend(v13, "px_title");
      v21 = (void *)MEMORY[0x1E4F38EE8];
      v22 = [v13 photoLibrary];
      v23 = [v21 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:v18 identifier:0 photoLibrary:v22];

      v24 = (void *)MEMORY[0x1E4F39008];
      v60[0] = v23;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
      v26 = [v24 transientCollectionListWithCollections:v25 title:v18];

      v53 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v26 options:0];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke;
      aBlock[3] = &unk_1E5DCBE68;
      id v58 = v13;
      v19 = _Block_copy(aBlock);

      id v20 = 0;
    }
    if (!v53)
    {
      v44 = 0;
      v45 = v20;
      goto LABEL_19;
    }
    BOOL v16 = v7;
    id v17 = v20;
  }
  v27 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v53 options:0];
  [(PXPhotosDataSourceConfiguration *)v27 setFilterPersons:v12];
  [(PXPhotosDataSourceConfiguration *)v27 setFilterSocialGroup:v13];
  [(PXPhotosDataSourceConfiguration *)v27 setAssetContainerProvider:v19];
  [(PXPhotosDataSourceConfiguration *)v27 setHideHiddenAssets:1];
  v48 = v17;
  [(PXPhotosDataSourceConfiguration *)v27 setExistingAssetCollectionFetchResults:v17];
  if (v16)
  {
    [(PXPhotosDataSourceConfiguration *)v27 setLibraryFilterState:0];
    [(PXPhotosDataSourceConfiguration *)v27 setLibraryFilter:0];
  }
  v28 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v27];
  v50 = v18;
  v51 = v15;
  v49 = v19;
  if (!v13) {
    PXMap();
  }
  if (v18)
  {
    id v29 = v18;
  }
  else
  {
    objc_msgSend(v13, "px_title");
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;
  v31 = [MEMORY[0x1E4F38EE8] titleFontNameForTitleCategory:2];
  v32 = [[PXDisplayTitleInfo alloc] initWithTitle:v30 subtitle:0 fontName:v31];
  v56.receiver = self;
  v56.super_class = (Class)PXPeopleDetailsContext;
  v33 = [(PXPhotosDetailsContext *)&v56 initWithPhotosDataSource:v28 displayTitleInfo:v32 parentContext:v52 keyAssetsFetchResult:0];
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_socialGroup, obj);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke_3;
    v54[3] = &unk_1E5DCBEB0;
    id v55 = 0;
    [(PXPeopleDetailsContext *)v34 performChanges:v54];
    [v53 photoLibrary];
    v35 = v31;
    v37 = id v36 = v12;
    objc_msgSend(v37, "px_registerChangeObserver:", v34);

    v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_attr_make_with_qos_class(v38, QOS_CLASS_USER_INITIATED, 0);
    v39 = v28;
    v41 = id v40 = v13;

    id v12 = v36;
    v31 = v35;
    dispatch_queue_t v42 = dispatch_queue_create("com.apple.photosUICore.PXPeopleDetailsContext.fetching-queue", v41);
    fetchingQueue = v34->_fetchingQueue;
    v34->_fetchingQueue = (OS_dispatch_queue *)v42;

    [(PXPeopleDetailsContext *)v34 _updateKeyFaceAssetFetchResult];
    id v13 = v40;
    v28 = v39;
  }
  self = v34;

  v44 = self;
  v18 = v50;
  id v15 = v51;
  v45 = v48;
  v19 = v49;
LABEL_19:

  return v44;
}

id __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setPeople:v2];
  [v3 setViewSourceOrigin:6];
}

uint64_t __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (PXPeopleDetailsContext)initWithPeople:(id)a3 parentContext:(id)a4 ignoreSharedLibraryFilters:(BOOL)a5
{
  return [(PXPeopleDetailsContext *)self initWithPeople:a3 orSocialGroup:0 parentContext:a4 assetCollectionsFetch:0 ignoreSharedLibraryFilters:a5];
}

- (PXPeopleDetailsContext)initWithPeople:(id)a3 parentContext:(id)a4
{
  return [(PXPeopleDetailsContext *)self initWithPeople:a3 orSocialGroup:0 parentContext:a4 assetCollectionsFetch:0 ignoreSharedLibraryFilters:0];
}

- (PXPeopleDetailsContext)initWithPhotosDataSource:(id)a3 displayTitleInfo:(id)a4 parentContext:(id)a5 keyAssetsFetchResult:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleDetailsContext.m", 47, @"%s is not available as initializer", "-[PXPeopleDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]");

  abort();
}

+ (id)photosDetailsContextForAsset:(id)a3 parentContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeopleDetailsContext.m", 43, @"%s is not available as initializer", "+[PXPeopleDetailsContext photosDetailsContextForAsset:parentContext:]");

  abort();
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 viewSourceOrigin:(int64_t)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeopleDetailsContext.m", 39, @"%s is not available as initializer", "+[PXPeopleDetailsContext photosDetailsContextForAssetCollection:assets:keyAssets:enableCuration:enableKeyAssets:viewSourceOrigin:]");

  abort();
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 viewSourceOrigin:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeopleDetailsContext.m", 35, @"%s is not available as initializer", "+[PXPeopleDetailsContext photosDetailsContextForAssetCollection:assets:viewSourceOrigin:]");

  abort();
}

@end