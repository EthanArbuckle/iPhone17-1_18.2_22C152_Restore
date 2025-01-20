@interface PXPhotosAssetsFetcher
+ (BOOL)_adjustedReverseSortOrderForCollection:(id)a3 reverseSortOrder:(BOOL)a4 fetcherOptions:(unint64_t)a5;
+ (BOOL)_shouldReverseDefaultSortDescriptorsForCollection:(id)a3 fetcherOptions:(unint64_t)a4;
+ (id)sharedFetcherForPhotoLibrary:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotosAssetsFetcher)initWithPhotoLibrary:(id)a3;
- (id)_cachedFetchResultForContainer:(id)a3 configuration:(id)a4;
- (id)_existingAssetsInContainer:(id)a3 curationKind:(int64_t)a4 curationLength:(int64_t)a5 options:(unint64_t)a6 sortDescriptors:(id)a7 filterPredicate:(id)a8 fetchPropertySets:(id)a9 libraryFilter:(int64_t)a10 includeOthersInSocialGroupAssets:(BOOL)a11;
- (id)_existingCuratedAssetsFetchResultForAssetCollection:(id)a3 referencePersons:(id)a4 curationType:(int64_t)a5 curationKind:(int64_t)a6 curationLength:(int64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 filterPredicate:(id)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13;
- (id)_existingFetchResultForAssetCollection:(id)a3 withFilterPredicate:(id)a4 inclusionPredicate:(id)a5 includeUnsavedSyndicatedAssets:(BOOL)a6 includeAllBurstAssets:(BOOL)a7 fetchLimit:(unint64_t)a8 options:(unint64_t)a9 sortDescriptors:(id)a10 reverseSortOrder:(BOOL)a11 hideHiddenAssets:(BOOL)a12 fetchPropertySets:(id)a13 libraryFilter:(int64_t)a14;
- (id)_existingKeyAssetsFetchResultForAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 curated:(BOOL)a6 options:(unint64_t)a7 libraryFilter:(int64_t)a8;
- (id)_fetchAssetsInAssetCollection:(id)a3 withFilterPredicate:(id)a4 inclusionPredicate:(id)a5 includeUnsavedSyndicatedAssets:(BOOL)a6 includeAllBurstAssets:(BOOL)a7 fetchLimit:(unint64_t)a8 options:(unint64_t)a9 sortDescriptors:(id)a10 reverseSortOrder:(BOOL)a11 hideHiddenAssets:(BOOL)a12 fetchPropertySets:(id)a13 libraryFilter:(int64_t)a14 includeOthersInSocialGroupAssets:(BOOL)a15;
- (id)_fetchAssetsInContainer:(id)a3 curationKind:(int64_t)a4 curationLength:(int64_t)a5 options:(unint64_t)a6 sortDescriptors:(id)a7 filterPredicate:(id)a8 fetchPropertySets:(id)a9 libraryFilter:(int64_t)a10 includeOthersInSocialGroupAssets:(BOOL)a11;
- (id)_fetchConfigurationForCuratedAssetsWithCurationKind:(int64_t)a3 curationLength:(int64_t)a4 options:(unint64_t)a5 sortDescriptors:(id)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9 includeOthersInSocialGroupAssets:(BOOL)a10;
- (id)_fetchConfigurationForCurationWithReferencePersons:(id)a3 curationType:(int64_t)a4 curationKind:(int64_t)a5 curationLength:(int64_t)a6 options:(unint64_t)a7 sortDescriptors:(id)a8 reverseSortOrder:(BOOL)a9 filterPredicate:(id)a10 fetchPropertySets:(id)a11 libraryFilter:(int64_t)a12;
- (id)_fetchConfigurationForKeyAssetWithReferenceAsset:(id)a3 referencePersons:(id)a4 curated:(BOOL)a5 options:(unint64_t)a6 libraryFilter:(int64_t)a7;
- (id)_fetchConfigurationWithFilterPredicate:(id)a3 inclusionPredicate:(id)a4 includeUnsavedSyndicatedAssets:(BOOL)a5 includeAllBurstAssets:(BOOL)a6 fetchLimit:(unint64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 hideHiddenAssets:(BOOL)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13;
- (id)_fetchCuratedAssetsInAssetCollection:(id)a3 referencePersons:(id)a4 curationType:(int64_t)a5 curationKind:(int64_t)a6 curationLength:(int64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 filterPredicate:(id)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13 includeOthersInSocialGroupAssets:(BOOL)a14;
- (id)_fetchCuratedKeyAssetsInAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 options:(unint64_t)a6 libraryFilter:(int64_t)a7;
- (id)_fetchKeyAssetsInAssetCollection:(id)a3 curated:(BOOL)a4 referenceAsset:(id)a5 referencePersons:(id)a6 options:(unint64_t)a7 libraryFilter:(int64_t)a8;
- (id)_fetchKeyAssetsInAssetCollection:(id)a3 options:(unint64_t)a4 libraryFilter:(int64_t)a5;
- (id)_fetchKeyAssetsInContainer:(id)a3 options:(id)a4;
- (id)_fetchKeyCuratedAssetsInPhotosHighlight:(id)a3 options:(id)a4;
- (id)_fetchOptionsForAssetsInAssetCollection:(id)a3 withFetcherOptions:(unint64_t)a4 filterPredicate:(id)a5 inclusionPredicate:(id)a6 fetchLimit:(unint64_t)a7 sortDescriptors:(id)a8 reverseSortOrder:(BOOL)a9 fetchPropertySets:(id)a10 hideHiddenAssets:(BOOL)a11 includeAllBurstAssets:(BOOL)a12;
- (id)_fetchOptionsForContainer:(id)a3 curationKind:(int64_t)a4 options:(unint64_t)a5 sortDescriptors:(id)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9;
- (id)_fetchOptionsForCuratedAssetsInAssetCollection:(id)a3 withFetcherOptions:(unint64_t)a4 curationKind:(int64_t)a5 reverseSortOrder:(BOOL)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9;
- (id)_fetchResultForContainer:(id)a3 configuration:(id)a4 factory:(id)a5;
- (id)_fetchResultForContainer:(id)a3 configuration:(id)a4 factory:(id)a5 fallbackFactory:(id)a6;
- (id)_importantFetchNameForCollectionSubtype:(int64_t)a3;
- (id)existingAssetsFetchResultForContainer:(id)a3 configuration:(id)a4;
- (id)fetchAssetsInContainer:(id)a3 configuration:(id)a4;
- (void)_cacheFetchResult:(id)a3 forContainer:(id)a4 configuration:(id)a5;
- (void)clearFetchResultsForAssetCollection:(id)a3;
- (void)clearFetchResultsForAssetCollections:(id)a3;
- (void)dealloc;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
@end

@implementation PXPhotosAssetsFetcher

void __70__PXPhotosAssetsFetcher__cachedFetchResultForContainer_configuration___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v2 = [v5 objectForKey:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fetchAssetsInContainer:(id)a3 configuration:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void *)[a4 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    switch([v8 curationKind])
    {
      case 0:
        v51 = [v8 filterPredicate];
        v49 = [v8 inclusionPredicate];
        unsigned int v47 = [v8 includeUnsavedSyndicatedAssets];
        unsigned int v45 = [v8 includeAllBurstAssets];
        uint64_t v43 = [v8 fetchLimit];
        v24 = self;
        uint64_t v25 = [v8 options];
        v26 = [v8 sortDescriptors];
        char v27 = [v8 reverseSortOrder];
        char v28 = [v8 hideHiddenAssets];
        v29 = [v8 fetchPropertySets];
        uint64_t v30 = [v8 libraryFilter];
        LOBYTE(v42) = [v8 includeOthersInSocialGroupAssets];
        BYTE1(v41) = v28;
        LOBYTE(v41) = v27;
        v4 = -[PXPhotosAssetsFetcher _fetchAssetsInAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](v24, "_fetchAssetsInAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", v9, v51, v49, v47, v45, v43, v25, v26, v41, v29, v30, v42);

        break;
      case 1:
      case 2:
      case 3:
        v50 = [v8 referencePersons];
        uint64_t v48 = [v8 curationType];
        uint64_t v46 = [v8 curationKind];
        uint64_t v44 = [v8 curationLength];
        uint64_t v10 = [v8 options];
        v11 = [v8 sortDescriptors];
        id v12 = v9;
        char v13 = [v8 reverseSortOrder];
        v14 = [v8 filterPredicate];
        v15 = [v8 fetchPropertySets];
        uint64_t v16 = [v8 libraryFilter];
        LOBYTE(v42) = [v8 includeOthersInSocialGroupAssets];
        LOBYTE(v40) = v13;
        id v9 = v12;
        v4 = [(PXPhotosAssetsFetcher *)self _fetchCuratedAssetsInAssetCollection:v12 referencePersons:v50 curationType:v48 curationKind:v46 curationLength:v44 options:v10 sortDescriptors:v11 reverseSortOrder:v40 filterPredicate:v14 fetchPropertySets:v15 libraryFilter:v16 includeOthersInSocialGroupAssets:v42];

        break;
      case 4:
        goto LABEL_11;
      case 5:
        if ([v9 supportsFastKeyAssetCuration])
        {
          [v8 referenceAsset];
          v32 = id v31 = v9;
          v33 = [v8 referencePersons];
          v4 = -[PXPhotosAssetsFetcher _fetchCuratedKeyAssetsInAssetCollection:referenceAsset:referencePersons:options:libraryFilter:](self, "_fetchCuratedKeyAssetsInAssetCollection:referenceAsset:referencePersons:options:libraryFilter:", v31, v32, v33, [v8 options], objc_msgSend(v8, "libraryFilter"));

          id v9 = v31;
        }
        else
        {
          v34 = PLUIGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v9;
            _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "%@ doesn't support fast key asset curation, falling back to uncurated key asset", buf, 0xCu);
          }

LABEL_11:
          id v35 = v9;
          uint64_t v36 = [v8 options];
          uint64_t v37 = [v8 libraryFilter];
          uint64_t v38 = v36;
          id v9 = v35;
          v4 = [(PXPhotosAssetsFetcher *)self _fetchKeyAssetsInAssetCollection:v35 options:v38 libraryFilter:v37];
        }
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v17 = [v8 curationKind];
    uint64_t v18 = [v8 curationLength];
    uint64_t v19 = [v8 options];
    v20 = [v8 sortDescriptors];
    v21 = [v8 filterPredicate];
    v22 = [v8 fetchPropertySets];
    uint64_t v23 = [v8 libraryFilter];
    LOBYTE(v41) = [v8 includeOthersInSocialGroupAssets];
    v4 = [(PXPhotosAssetsFetcher *)self _fetchAssetsInContainer:v7 curationKind:v17 curationLength:v18 options:v19 sortDescriptors:v20 filterPredicate:v21 fetchPropertySets:v22 libraryFilter:v23 includeOthersInSocialGroupAssets:v41];
  }
  return v4;
}

+ (id)sharedFetcherForPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PXPhotosAssetsFetcher.m", 129, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  if (sharedFetcherForPhotoLibrary__onceToken != -1) {
    dispatch_once(&sharedFetcherForPhotoLibrary__onceToken, &__block_literal_global_145763);
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__145700;
  uint64_t v18 = __Block_byref_object_dispose__145701;
  id v19 = 0;
  v6 = sharedFetcherForPhotoLibrary__fetchersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PXPhotosAssetsFetcher_sharedFetcherForPhotoLibrary___block_invoke_372;
  block[3] = &unk_1E5DD0588;
  id v12 = v5;
  char v13 = &v14;
  id v7 = v5;
  dispatch_sync(v6, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)_fetchCuratedKeyAssetsInAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 options:(unint64_t)a6 libraryFilter:(int64_t)a7
{
  return [(PXPhotosAssetsFetcher *)self _fetchKeyAssetsInAssetCollection:a3 curated:1 referenceAsset:a4 referencePersons:a5 options:a6 libraryFilter:a7];
}

- (id)_fetchKeyAssetsInAssetCollection:(id)a3 options:(unint64_t)a4 libraryFilter:(int64_t)a5
{
  return [(PXPhotosAssetsFetcher *)self _fetchKeyAssetsInAssetCollection:a3 curated:0 referenceAsset:0 referencePersons:0 options:a4 libraryFilter:a5];
}

void __70__PXPhotosAssetsFetcher__cacheFetchResult_forContainer_configuration___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    [*(id *)(a1[4] + 16) setObject:v3 forKey:a1[5]];
    uint64_t v2 = v3;
  }
  id v4 = v2;
  [v2 setObject:a1[6] forKey:a1[7]];
}

- (id)_fetchKeyCuratedAssetsInPhotosHighlight:(id)a3 options:(id)a4
{
  p_photoLibrary = &self->_photoLibrary;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  id v9 = [WeakRetained librarySpecificFetchOptions];

  uint64_t v10 = [v6 sharingFilter];
  [v9 setSharingFilter:v10];
  [v9 setIncludeGuestAssets:1];
  v11 = [MEMORY[0x1E4F38EB8] fetchCollageAssetsForDayHighlight:v7 options:v9];

  return v11;
}

- (id)_fetchAssetsInContainer:(id)a3 curationKind:(int64_t)a4 curationLength:(int64_t)a5 options:(unint64_t)a6 sortDescriptors:(id)a7 filterPredicate:(id)a8 fetchPropertySets:(id)a9 libraryFilter:(int64_t)a10 includeOthersInSocialGroupAssets:(BOOL)a11
{
  id v27 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  LOBYTE(v26) = a11;
  char v28 = [(PXPhotosAssetsFetcher *)self _fetchConfigurationForCuratedAssetsWithCurationKind:a4 curationLength:a5 options:a6 sortDescriptors:v17 filterPredicate:v18 fetchPropertySets:v19 libraryFilter:a10 includeOthersInSocialGroupAssets:v26];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __182__PXPhotosAssetsFetcher__fetchAssetsInContainer_curationKind_curationLength_options_sortDescriptors_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke;
  v30[3] = &unk_1E5DBEEB8;
  v30[4] = self;
  id v31 = v27;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  int64_t v35 = a4;
  unint64_t v36 = a6;
  int64_t v37 = a10;
  BOOL v40 = a11;
  SEL v38 = a2;
  int64_t v39 = a5;
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v27;
  v24 = [(PXPhotosAssetsFetcher *)self _fetchResultForContainer:v23 configuration:v28 factory:v30];

  return v24;
}

- (id)_fetchConfigurationForCuratedAssetsWithCurationKind:(int64_t)a3 curationLength:(int64_t)a4 options:(unint64_t)a5 sortDescriptors:(id)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9 includeOthersInSocialGroupAssets:(BOOL)a10
{
  char v12 = a5;
  v32[8] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = _curationAlgorithmForOptions(v12);
  id v29 = objc_alloc((Class)off_1E5DA9660);
  id v31 = [NSNumber numberWithInteger:a3];
  v32[0] = v31;
  uint64_t v30 = [NSNumber numberWithInteger:a4];
  v32[1] = v30;
  uint64_t v19 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  char v28 = (void *)v19;
  v32[2] = v19;
  id v20 = v16;
  if (!v16)
  {
    id v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[3] = v20;
  id v21 = [NSNumber numberWithInteger:v18];
  v32[4] = v21;
  id v22 = v17;
  if (!v17)
  {
    id v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[5] = v22;
  id v23 = [NSNumber numberWithInteger:a9];
  v32[6] = v23;
  v24 = [NSNumber numberWithBool:a10];
  v32[7] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:8];
  uint64_t v26 = (void *)[v29 initWithObjects:v25];

  if (!v17) {
  if (v16)
  }
  {
    if (v15) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_11;
    }
  }

LABEL_11:
  return v26;
}

- (id)_fetchConfigurationForCurationWithReferencePersons:(id)a3 curationType:(int64_t)a4 curationKind:(int64_t)a5 curationLength:(int64_t)a6 options:(unint64_t)a7 sortDescriptors:(id)a8 reverseSortOrder:(BOOL)a9 filterPredicate:(id)a10 fetchPropertySets:(id)a11 libraryFilter:(int64_t)a12
{
  id v17 = a3;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  id v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count") + 2);
  [v21 addObject:@"PXCuratedFetchConfiguration"];
  if (v17) {
    [v21 addObjectsFromArray:v17];
  }
  id v22 = objc_msgSend(NSNumber, "numberWithInteger:", a4, a12);
  [v21 addObject:v22];

  id v23 = [NSNumber numberWithInteger:a5];
  [v21 addObject:v23];

  v24 = [NSNumber numberWithInteger:a6];
  [v21 addObject:v24];

  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a7];
  [v21 addObject:v25];

  uint64_t v26 = [NSNumber numberWithInteger:v33];
  [v21 addObject:v26];

  if (v18)
  {
    [v21 addObject:v18];
  }
  else
  {
    id v27 = [MEMORY[0x1E4F1CA98] null];
    [v21 addObject:v27];
  }
  char v28 = [NSNumber numberWithBool:a9];
  [v21 addObject:v28];

  if (v19)
  {
    [v21 addObject:v19];
    if (v20)
    {
LABEL_8:
      [v21 addObject:v20];
      goto LABEL_11;
    }
  }
  else
  {
    id v29 = [MEMORY[0x1E4F1CA98] null];
    [v21 addObject:v29];

    if (v20) {
      goto LABEL_8;
    }
  }
  uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  [v21 addObject:v30];

LABEL_11:
  id v31 = (void *)[objc_alloc((Class)off_1E5DA9660) initWithObjects:v21];

  return v31;
}

- (id)_fetchCuratedAssetsInAssetCollection:(id)a3 referencePersons:(id)a4 curationType:(int64_t)a5 curationKind:(int64_t)a6 curationLength:(int64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 filterPredicate:(id)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13 includeOthersInSocialGroupAssets:(BOOL)a14
{
  id v31 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = a11;
  id v21 = a12;
  BOOL v22 = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:v31 reverseSortOrder:0 fetcherOptions:a8];
  LOBYTE(v30) = v22;
  id v34 = [(PXPhotosAssetsFetcher *)self _fetchConfigurationForCurationWithReferencePersons:v18 curationType:a5 curationKind:a6 curationLength:a7 options:a8 sortDescriptors:v19 reverseSortOrder:v30 filterPredicate:v20 fetchPropertySets:v21 libraryFilter:a13];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __242__PXPhotosAssetsFetcher__fetchCuratedAssetsInAssetCollection_referencePersons_curationType_curationKind_curationLength_options_sortDescriptors_reverseSortOrder_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke;
  v36[3] = &unk_1E5DBEF30;
  v36[4] = self;
  id v37 = v31;
  id v38 = v20;
  unint64_t v42 = a8;
  int64_t v43 = a6;
  BOOL v48 = v22;
  id v39 = v21;
  id v40 = v18;
  id v41 = v19;
  int64_t v44 = a13;
  int64_t v45 = a5;
  BOOL v49 = a14;
  int64_t v46 = a7;
  SEL v47 = a2;
  id v23 = v19;
  id v24 = v18;
  id v25 = v21;
  id v26 = v20;
  id v27 = v31;
  char v28 = [(PXPhotosAssetsFetcher *)self _fetchResultForContainer:v27 configuration:v34 factory:v36];

  return v28;
}

- (id)_fetchAssetsInAssetCollection:(id)a3 withFilterPredicate:(id)a4 inclusionPredicate:(id)a5 includeUnsavedSyndicatedAssets:(BOOL)a6 includeAllBurstAssets:(BOOL)a7 fetchLimit:(unint64_t)a8 options:(unint64_t)a9 sortDescriptors:(id)a10 reverseSortOrder:(BOOL)a11 hideHiddenAssets:(BOOL)a12 fetchPropertySets:(id)a13 libraryFilter:(int64_t)a14 includeOthersInSocialGroupAssets:(BOOL)a15
{
  BOOL v33 = a7;
  BOOL v31 = a6;
  id v30 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  id v20 = a13;
  BOOL v21 = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:v30 reverseSortOrder:a11 fetcherOptions:a9];
  BYTE1(v29) = a12;
  LOBYTE(v29) = v21;
  id v32 = -[PXPhotosAssetsFetcher _fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:](self, "_fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:", v17, v18, v31, v33, a8, a9, v19, v29, v20, a14);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __281__PXPhotosAssetsFetcher__fetchAssetsInAssetCollection_withFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke;
  v36[3] = &unk_1E5DBEEE0;
  v36[4] = self;
  id v37 = v30;
  id v38 = v17;
  id v39 = v18;
  id v40 = v19;
  unint64_t v42 = a9;
  unint64_t v43 = a8;
  BOOL v45 = v21;
  id v41 = v20;
  BOOL v46 = a12;
  BOOL v47 = v33;
  BOOL v48 = v31;
  int64_t v44 = a14;
  BOOL v49 = a15;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v30;
  id v27 = [(PXPhotosAssetsFetcher *)self _fetchResultForContainer:v26 configuration:v32 factory:v36];

  return v27;
}

- (id)_fetchKeyAssetsInAssetCollection:(id)a3 curated:(BOOL)a4 referenceAsset:(id)a5 referencePersons:(id)a6 options:(unint64_t)a7 libraryFilter:(int64_t)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = [(PXPhotosAssetsFetcher *)self _fetchConfigurationForKeyAssetWithReferenceAsset:v15 referencePersons:v16 curated:v12 options:a7 libraryFilter:a8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke;
  v24[3] = &unk_1E5DBEF08;
  v24[4] = self;
  id v25 = v14;
  int64_t v28 = a8;
  unint64_t v29 = a7;
  BOOL v30 = v12;
  id v26 = v16;
  id v27 = v15;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke_408;
  v23[3] = &unk_1E5DC9B30;
  v23[4] = self;
  id v18 = v15;
  id v19 = v16;
  id v20 = v14;
  BOOL v21 = [(PXPhotosAssetsFetcher *)self _fetchResultForContainer:v20 configuration:v17 factory:v24 fallbackFactory:v23];

  return v21;
}

- (id)_fetchResultForContainer:(id)a3 configuration:(id)a4 factory:(id)a5 fallbackFactory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = (void (**)(void))a5;
  char v13 = (void (**)(void))a6;
  id v14 = [(PXPhotosAssetsFetcher *)self _cachedFetchResultForContainer:v10 configuration:v11];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
LABEL_3:
    id v17 = v16;
    goto LABEL_6;
  }
  uint64_t v18 = v12[2](v12);
  if (v18)
  {
    id v17 = (void *)v18;
    [(PXPhotosAssetsFetcher *)self _cacheFetchResult:v18 forContainer:v10 configuration:v11];
  }
  else
  {
    if (v13)
    {
      v13[2](v13);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    id v17 = 0;
  }
LABEL_6:

  return v17;
}

- (id)_cachedFetchResultForContainer:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__145700;
  BOOL v21 = __Block_byref_object_dispose__145701;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PXPhotosAssetsFetcher__cachedFetchResultForContainer_configuration___block_invoke;
  v13[3] = &unk_1E5DCA7A8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)_cacheFetchResult:(id)a3 forContainer:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PXPhotosAssetsFetcher__cacheFetchResult_forContainer_configuration___block_invoke;
  v15[3] = &unk_1E5DCAEC8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (id)_fetchConfigurationForKeyAssetWithReferenceAsset:(id)a3 referencePersons:(id)a4 curated:(BOOL)a5 options:(unint64_t)a6 libraryFilter:(int64_t)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count") + 2);
  [v13 addObject:@"PXKeyAssetFetchConfiguration"];
  if (v11 && !v9) {
    [v13 addObject:v11];
  }
  if (v12 && !v9) {
    [v13 addObjectsFromArray:v12];
  }
  id v14 = [NSNumber numberWithBool:v9];
  [v13 addObject:v14];

  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  [v13 addObject:v15];

  id v16 = [NSNumber numberWithInteger:a7];
  [v13 addObject:v16];

  id v17 = (void *)[objc_alloc((Class)off_1E5DA9660) initWithObjects:v13];
  return v17;
}

- (id)_fetchResultForContainer:(id)a3 configuration:(id)a4 factory:(id)a5
{
  return [(PXPhotosAssetsFetcher *)self _fetchResultForContainer:a3 configuration:a4 factory:a5 fallbackFactory:0];
}

+ (BOOL)_adjustedReverseSortOrderForCollection:(id)a3 reverseSortOrder:(BOOL)a4 fetcherOptions:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  BOOL v15 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PXPhotosAssetsFetcher__adjustedReverseSortOrderForCollection_reverseSortOrder_fetcherOptions___block_invoke;
  aBlock[3] = &unk_1E5DD2B08;
  aBlock[4] = &v12;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  if ((v5 & 0x20) != 0
    && [v7 assetCollectionType] == 2
    && ((objc_msgSend(v7, "px_isUserSmartAlbum") & 1) == 0 && !objc_msgSend(v7, "isTransient")
     || objc_msgSend(v7, "px_isUtilityCollection")))
  {
    v8[2](v8);
  }
  char v9 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)_fetchConfigurationWithFilterPredicate:(id)a3 inclusionPredicate:(id)a4 includeUnsavedSyndicatedAssets:(BOOL)a5 includeAllBurstAssets:(BOOL)a6 fetchLimit:(unint64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 hideHiddenAssets:(BOOL)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13
{
  char v13 = a8;
  BOOL v15 = a6;
  BOOL v45 = a5;
  v47[11] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v44 = a12;
  if (_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__onceToken[0] != -1) {
    dispatch_once(_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__onceToken, &__block_literal_global_417_145691);
  }
  uint64_t v20 = _curationAlgorithmForOptions(v13);
  uint64_t v21 = v20;
  if (v17 || v18 || v45)
  {
    uint64_t v27 = (uint64_t)v17;
    BOOL v22 = a11;
    unint64_t v23 = a7;
    BOOL v24 = v15;
    if (v17) {
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v22 = a11;
    unint64_t v23 = a7;
    BOOL v24 = v15;
    if (!v23 && !v15 && !v19 && !a10 && !v44 && !a11 && !a13 && !v20)
    {
      id v25 = (id)_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__nullTuple;
      id v26 = 0;
      goto LABEL_30;
    }
  }
  uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
LABEL_17:
  uint64_t v42 = v21;
  id v40 = (void *)v27;
  v47[0] = v27;
  uint64_t v28 = (uint64_t)v18;
  if (!v18)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  id v43 = v18;
  v47[1] = v28;
  id v41 = objc_msgSend(NSNumber, "numberWithBool:", v45, v28);
  v47[2] = v41;
  unint64_t v29 = [NSNumber numberWithBool:v24];
  v47[3] = v29;
  BOOL v30 = [NSNumber numberWithUnsignedInteger:v23];
  v47[4] = v30;
  BOOL v31 = v19;
  if (!v19)
  {
    BOOL v31 = [MEMORY[0x1E4F1CA98] null];
  }
  id v46 = v17;
  v47[5] = v31;
  id v32 = [NSNumber numberWithBool:a10];
  v47[6] = v32;
  BOOL v33 = [NSNumber numberWithBool:v22];
  v47[7] = v33;
  id v34 = v44;
  if (!v44)
  {
    id v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[8] = v34;
  int64_t v35 = [NSNumber numberWithInteger:a13];
  v47[9] = v35;
  unint64_t v36 = [NSNumber numberWithInteger:v42];
  v47[10] = v36;
  id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:11];

  id v26 = v44;
  if (!v44) {

  }
  id v17 = v46;
  if (!v19) {

  }
  id v18 = v43;
  if (!v43)
  {

    if (v46) {
      goto LABEL_29;
    }
LABEL_34:

    goto LABEL_29;
  }
  if (!v46) {
    goto LABEL_34;
  }
LABEL_29:
  id v25 = (id)[objc_alloc((Class)off_1E5DA9660) initWithObjects:v37];

LABEL_30:
  return v25;
}

id __242__PXPhotosAssetsFetcher__fetchCuratedAssetsInAssetCollection_referencePersons_curationType_curationKind_curationLength_options_sortDescriptors_reverseSortOrder_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PXContentSyndicationSettings sharedInstance];
  int v3 = [v2 enableFilteringCuratedGridsForContentSyndication];

  id v4 = [*(id *)(a1 + 32) _fetchOptionsForCuratedAssetsInAssetCollection:*(void *)(a1 + 40) withFetcherOptions:*(void *)(a1 + 80) curationKind:*(void *)(a1 + 88) reverseSortOrder:*(unsigned __int8 *)(a1 + 128) filterPredicate:*(void *)(a1 + 48) fetchPropertySets:*(void *)(a1 + 56) libraryFilter:*(void *)(a1 + 96)];
  switch(_curationAlgorithmForOptions(*(void *)(a1 + 80)))
  {
    case 0:
      uint64_t v5 = [*(id *)(a1 + 64) count];
      if (!v5)
      {
        if ([*(id *)(a1 + 40) assetCollectionType] != 6)
        {
          if ([*(id *)(a1 + 40) assetCollectionType] != 4 || (*(unsigned char *)(a1 + 80) & 2) == 0)
          {
            [v4 setCurationType:*(void *)(a1 + 104)];
            uint64_t v42 = *MEMORY[0x1E4F394E0];
            uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
            [v4 addFetchPropertySets:v28];

            uint64_t v19 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:*(void *)(a1 + 40) options:v4];
            goto LABEL_61;
          }
          uint64_t v43 = *MEMORY[0x1E4F394E0];
          BOOL v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
          [v4 addFetchPropertySets:v30];

          BOOL v31 = +[PXStorySettings sharedInstance];
          int v32 = [v31 allowCustomUserAssets];

          if (v32)
          {
            id v16 = [MEMORY[0x1E4F38EB8] fetchCustomUserAssetsInMemory:*(void *)(a1 + 40) options:v4];
          }
          else
          {
            id v16 = 0;
          }
          if (![v16 count])
          {
            uint64_t v34 = [MEMORY[0x1E4F38EB8] fetchUserCuratedAssetsInMemory:*(void *)(a1 + 40) options:v4];

            id v16 = (void *)v34;
          }
          goto LABEL_62;
        }
        if (*(void *)(a1 + 80)) {
          goto LABEL_24;
        }
        if ([*(id *)(a1 + 40) isAggregation] && (*(unsigned char *)(a1 + 80) & 8) != 0)
        {
          uint64_t v18 = 0;
        }
        else
        {
          uint64_t v17 = *(void *)(a1 + 104);
          if (v17 == 2)
          {
            uint64_t v18 = 2;
          }
          else if (v17 == 1)
          {
            uint64_t v18 = 1;
          }
          else
          {
            if (v17)
            {
LABEL_54:
              [v4 setIsExclusivePredicate:1];
              if (([v4 includeGuestAssets] & 1) == 0 && ((v3 ^ 1) & 1) == 0)
              {
                int64_t v35 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 0);
                unint64_t v36 = [v4 internalPredicate];
                if (v36)
                {
                  id v37 = (void *)MEMORY[0x1E4F28BA0];
                  id v38 = [v4 internalPredicate];
                  v44[0] = v38;
                  v44[1] = v35;
                  id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
                  id v40 = [v37 andPredicateWithSubpredicates:v39];
                  [v4 setInternalPredicate:v40];
                }
                else
                {
                  [v4 setInternalPredicate:v35];
                }
              }
              goto LABEL_60;
            }
            uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "px_curationType");
          }
        }
        [v4 setHighlightCurationType:v18];
        goto LABEL_54;
      }
      uint64_t v6 = v5;
      v46[0] = *MEMORY[0x1E4F394E8];
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      [v4 addFetchPropertySets:v7];

      if (v6 != 1)
      {
        uint64_t v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
        v45[0] = v20;
        uint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
        v45[1] = v21;
        BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
        [v4 setSortDescriptors:v22];

        uint64_t v19 = [MEMORY[0x1E4F38EB8] requestCuratedAssetsInAssetCollection:*(void *)(a1 + 40) referencePersons:*(void *)(a1 + 64) options:v4];
        goto LABEL_61;
      }
      id v8 = [*(id *)(a1 + 64) firstObject];
      char v9 = v8;
      if (*(void *)(a1 + 72))
      {
        objc_msgSend(v4, "setInternalSortDescriptors:");
      }
      else
      {
        unint64_t v29 = +[PXPeopleUtilities sortDescriptorsWithPersonAssetSortOrder:](PXPeopleUtilities, "sortDescriptorsWithPersonAssetSortOrder:", [v8 assetSortOrder]);
        [v4 setInternalSortDescriptors:v29];
      }
      if ((*(unsigned char *)(a1 + 80) & 0x10) != 0) {
        [MEMORY[0x1E4F38EB8] requestCuratedAssetsInAssetCollection:*(void *)(a1 + 40) referencePersons:*(void *)(a1 + 64) options:v4];
      }
      else {
      uint64_t v15 = [MEMORY[0x1E4F8E810] fetchCuratedAssetsForPerson:v9 options:v4];
      }
LABEL_13:
      id v16 = (void *)v15;
LABEL_14:

LABEL_62:
      return v16;
    case 1:
      if ((*(void *)(a1 + 80) & 1) == 0)
      {
        char v9 = (void *)[objc_alloc(MEMORY[0x1E4F8E7D8]) initWithFetchOptions:v4];
        [v9 setIncludeOthersInSocialGroupAssets:*(unsigned __int8 *)(a1 + 129)];
        switch(*(void *)(a1 + 88))
        {
          case 0:
          case 4:
          case 5:
            unint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
            BOOL v24 = v23;
            uint64_t v25 = *(void *)(a1 + 120);
            uint64_t v26 = *(void *)(a1 + 32);
            uint64_t v27 = 698;
            goto LABEL_67;
          case 1:
            uint64_t v10 = [*(id *)(a1 + 40) assetCollectionType];
            uint64_t v11 = *(void *)(a1 + 112);
            if (v10 != 4)
            {
              switch(v11)
              {
                case 0:
                  BOOL v33 = v9;
                  uint64_t v13 = 2;
                  goto LABEL_46;
                case 1:
                case 4:
                  unint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
                  BOOL v24 = v23;
                  uint64_t v25 = *(void *)(a1 + 120);
                  uint64_t v26 = *(void *)(a1 + 32);
                  uint64_t v27 = 679;
                  goto LABEL_67;
                case 2:
                  goto LABEL_41;
                case 3:
                case 5:
                  uint64_t v13 = qword_1AB35ADE0[v11 - 1];
                  goto LABEL_45;
                default:
                  goto LABEL_40;
              }
            }
            unint64_t v12 = v11 - 1;
            if (v12 > 4) {
              uint64_t v13 = 0;
            }
            else {
              uint64_t v13 = qword_1AB35ADE0[v12];
            }
LABEL_45:
            BOOL v33 = v9;
LABEL_46:
            [v33 setCurationLength:v13];
            uint64_t v15 = [MEMORY[0x1E4F8E7D0] fetchEditorialAssetsForCollection:*(void *)(a1 + 40) options:v9];
            goto LABEL_13;
          case 2:
            uint64_t v15 = [MEMORY[0x1E4F8E7D0] fetchMovieAssetsForCollection:*(void *)(a1 + 40) options:v9];
            goto LABEL_13;
          case 3:
LABEL_41:
            uint64_t v15 = [MEMORY[0x1E4F8E7D0] fetchPreviewAssetsForCollection:*(void *)(a1 + 40) options:v9];
            goto LABEL_13;
          default:
LABEL_40:
            id v16 = 0;
            goto LABEL_14;
        }
      }
LABEL_24:
      uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "_fetchCuratedKeyAssetsInAssetCollection:referenceAsset:referencePersons:options:libraryFilter:", *(void *)(a1 + 40), 0, 0);
      goto LABEL_61;
    case 2:
      unint64_t v14 = *(void *)(a1 + 88);
      if (v14 - 1 < 3)
      {
        char v9 = +[PXFakePhotoKitAssetsFetcher defaultFetcher];
        uint64_t v15 = [v9 fetchAssetsInContainer:*(void *)(a1 + 40) curationKind:*(void *)(a1 + 88)];
        goto LABEL_13;
      }
      id v16 = 0;
      if (v14 <= 5 && ((1 << v14) & 0x31) != 0)
      {
        unint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        BOOL v24 = v23;
        uint64_t v25 = *(void *)(a1 + 120);
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = 714;
LABEL_67:
        [v23 handleFailureInMethod:v25 object:v26 file:@"PXPhotosAssetsFetcher.m" lineNumber:v27 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      goto LABEL_62;
    case 3:
LABEL_60:
      uint64_t v19 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(a1 + 40) options:v4];
LABEL_61:
      id v16 = (void *)v19;
      goto LABEL_62;
    default:
      id v16 = 0;
      goto LABEL_62;
  }
}

- (id)_fetchOptionsForCuratedAssetsInAssetCollection:(id)a3 withFetcherOptions:(unint64_t)a4 curationKind:(int64_t)a5 reverseSortOrder:(BOOL)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9
{
  BOOL v10 = a6;
  p_photoLibrary = &self->_photoLibrary;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  uint64_t v19 = [WeakRetained librarySpecificFetchOptions];

  objc_msgSend(v19, "setSharingFilter:", _sharingFilterForLibraryFilterInContainer(a9, v17));
  [v19 setIncludeGuestAssets:(a4 >> 2) & 1];
  [v19 setIncludeHiddenAssets:0];
  [v19 setInternalPredicate:v16];

  [v19 setReverseSortOrder:v10];
  [v19 setFetchPropertySets:v15];

  objc_msgSend(v19, "setReverseDefaultSortDescriptors:", +[PXPhotosAssetsFetcher _shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:](PXPhotosAssetsFetcher, "_shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:", v17, a4));
  _addFetchPropertySetsForCurationKind(v19, a5);

  return v19;
}

id __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  int v3 = [WeakRetained librarySpecificFetchOptions];

  objc_msgSend(v3, "setSharingFilter:", _sharingFilterForLibraryFilterInContainer(*(void *)(a1 + 64), *(void **)(a1 + 40)));
  [v3 setIncludeGuestAssets:1];
  objc_msgSend(v3, "setReverseDefaultSortDescriptors:", +[PXPhotosAssetsFetcher _shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:](PXPhotosAssetsFetcher, "_shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:", *(void *)(a1 + 40), *(void *)(a1 + 72)));
  if ([*(id *)(a1 + 40) assetCollectionSubtype] == 101 && (*(unsigned char *)(a1 + 72) & 0x20) != 0) {
    [v3 setReverseSortOrder:1];
  }
  if (!*(unsigned char *)(a1 + 80))
  {
    uint64_t v5 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:*(void *)(a1 + 40) options:v3];
    goto LABEL_11;
  }
  unint64_t v4 = _curationAlgorithmForOptions(*(void *)(a1 + 72));
  if (v4 < 2) {
    goto LABEL_28;
  }
  if (v4 == 2)
  {
    uint64_t v11 = +[PXFakePhotoKitAssetsFetcher defaultFetcher];
    uint64_t v6 = [v11 fetchAssetsInContainer:*(void *)(a1 + 40) curationKind:4];

    if (v6) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (v4 == 3)
  {
LABEL_28:
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v5 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:*(void *)(a1 + 40) referencePersons:*(void *)(a1 + 48)];
    }
    else
    {
      if ([*(id *)(a1 + 40) assetCollectionType] == 6) {
        [v3 setIsExclusivePredicate:1];
      }
      uint64_t v10 = *(void *)(a1 + 40);
      if ((*(unsigned char *)(a1 + 72) & 0x40) != 0) {
        [*(id *)(a1 + 32) _fetchKeyCuratedAssetsInPhotosHighlight:v10 options:v3];
      }
      else {
      uint64_t v5 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v10 referenceAsset:*(void *)(a1 + 56) options:v3];
      }
    }
LABEL_11:
    uint64_t v6 = (void *)v5;
    if (v5) {
      goto LABEL_15;
    }
  }
LABEL_12:
  id v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "%@ keyAssetsFetchResult is nil", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v6 = 0;
LABEL_15:

  return v6;
}

+ (BOOL)_shouldReverseDefaultSortDescriptorsForCollection:(id)a3 fetcherOptions:(unint64_t)a4
{
  id v4 = a3;
  BOOL v5 = [v4 assetCollectionType] == 1 && objc_msgSend(v4, "assetCollectionSubtype") == 101;

  return v5;
}

id __281__PXPhotosAssetsFetcher__fetchAssetsInAssetCollection_withFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  LOWORD(v22) = *(_WORD *)(a1 + 105);
  LOBYTE(v21) = *(unsigned char *)(a1 + 104);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_fetchOptionsForAssetsInAssetCollection:withFetcherOptions:filterPredicate:inclusionPredicate:fetchLimit:sortDescriptors:reverseSortOrder:fetchPropertySets:hideHiddenAssets:includeAllBurstAssets:", *(void *)(a1 + 40), *(void *)(a1 + 80), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 88), *(void *)(a1 + 64), v21, *(void *)(a1 + 72), v22);
  if (!*(unsigned char *)(a1 + 107)) {
    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v4 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:WeakRetained];

  unint64_t v5 = [v4 dataSourceType];
  if (v5 >= 6)
  {
    if (v5 == 6)
    {
      uint64_t v6 = [MEMORY[0x1E4F8BA10] maskForMomentSharedAsset];
    }
    else
    {
      if (v5 != 7) {
        goto LABEL_12;
      }
      uint64_t v6 = [MEMORY[0x1E4F8BA10] maskForCloudSharedAsset];
    }
    id v7 = [MEMORY[0x1E4F8BA10] predicateForIncludeMask:v6 useIndex:0];
    uint64_t v8 = [v2 internalInclusionPredicate];
    char v9 = (void *)v8;
    if (v8)
    {
      v23[0] = v8;
      v23[1] = v7;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      uint64_t v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];
      [v2 setInternalInclusionPredicate:v11];
    }
    else
    {
      [v2 setInternalInclusionPredicate:v7];
    }

    goto LABEL_12;
  }
  [v2 setIncludeGuestAssets:1];
LABEL_12:

LABEL_13:
  unint64_t v12 = _sharingFilterForLibraryFilterInContainer(*(void *)(a1 + 96), *(void **)(a1 + 40));
  [v2 setSharingFilter:v12];
  if (v12) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = [*(id *)(a1 + 40) assetCollectionType] == 3;
  }
  [v2 setIsExclusivePredicate:v13];
  switch(_curationAlgorithmForOptions(*(void *)(a1 + 80)))
  {
    case 0:
    case 3:
      unint64_t v14 = [*(id *)(a1 + 40) assetCollectionSubtype];
      if (v14 >> 1 == 500000151 && ([*(id *)(a1 + 40) isSharingSuggestion] & 1) == 0)
      {
        uint64_t v16 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:*(void *)(a1 + 40) referenceAsset:0];
      }
      else
      {
        if (!*(void *)(a1 + 88) && !*(void *)(a1 + 48))
        {
          id v15 = [*(id *)(a1 + 32) _importantFetchNameForCollectionSubtype:v14];
          [v2 setImportantFetchName:v15];
        }
        uint64_t v16 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(a1 + 40) options:v2];
      }
      id v17 = (void *)v16;
      break;
    case 1:
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F8E7D8]) initWithFetchOptions:v2];
      [v18 setIncludeOthersInSocialGroupAssets:*(unsigned __int8 *)(a1 + 108)];
      uint64_t v19 = [MEMORY[0x1E4F8E7D0] fetchAllAssetsForCollection:*(void *)(a1 + 40) options:v18];
      goto LABEL_26;
    case 2:
      uint64_t v18 = +[PXFakePhotoKitAssetsFetcher defaultFetcher];
      uint64_t v19 = [v18 fetchAssetsInContainer:*(void *)(a1 + 40) curationKind:0];
LABEL_26:
      id v17 = (void *)v19;

      break;
    default:
      id v17 = 0;
      break;
  }

  return v17;
}

- (id)_fetchOptionsForAssetsInAssetCollection:(id)a3 withFetcherOptions:(unint64_t)a4 filterPredicate:(id)a5 inclusionPredicate:(id)a6 fetchLimit:(unint64_t)a7 sortDescriptors:(id)a8 reverseSortOrder:(BOOL)a9 fetchPropertySets:(id)a10 hideHiddenAssets:(BOOL)a11 includeAllBurstAssets:(BOOL)a12
{
  p_photoLibrary = &self->_photoLibrary;
  id v18 = a10;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  BOOL v24 = objc_msgSend(WeakRetained, "px_standardLibrarySpecificFetchOptions");

  [v24 setInternalPredicate:v21];
  [v24 setInternalInclusionPredicate:v20];

  [v24 setFetchLimit:a7];
  [v24 setInternalSortDescriptors:v19];

  [v24 setReverseSortOrder:a9];
  [v24 setFetchPropertySets:v18];

  BOOL v25 = +[PXPhotosAssetsFetcher _shouldReverseDefaultSortDescriptorsForCollection:v22 fetcherOptions:a4];
  [v24 setReverseDefaultSortDescriptors:v25];
  if (a11) {
    [v24 setIncludeHiddenAssets:0];
  }
  objc_msgSend(v24, "setExcludeNonVisibleStackedAssets:", a12, a4);
  return v24;
}

id __182__PXPhotosAssetsFetcher__fetchAssetsInContainer_curationKind_curationLength_options_sortDescriptors_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchOptionsForContainer:*(void *)(a1 + 40) curationKind:*(void *)(a1 + 72) options:*(void *)(a1 + 80) sortDescriptors:*(void *)(a1 + 48) filterPredicate:*(void *)(a1 + 56) fetchPropertySets:*(void *)(a1 + 64) libraryFilter:*(void *)(a1 + 88)];
  uint64_t v3 = _curationAlgorithmForOptions(*(void *)(a1 + 80));
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F8E7D8]) initWithFetchOptions:v2];
      [v7 setIncludeOthersInSocialGroupAssets:*(unsigned __int8 *)(a1 + 112)];
      switch(*(void *)(a1 + 72))
      {
        case 0:
          uint64_t v8 = [MEMORY[0x1E4F8E7D0] fetchAllAssetsForCollection:*(void *)(a1 + 40) options:v7];
          goto LABEL_21;
        case 1:
          uint64_t v10 = *(void *)(a1 + 104);
          switch(v10)
          {
            case 0:
              unint64_t v12 = v7;
              uint64_t v11 = 2;
              goto LABEL_20;
            case 1:
            case 4:
              unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
              [v14 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 32) file:@"PXPhotosAssetsFetcher.m" lineNumber:279 description:@"Code which should be unreachable has been reached"];

              abort();
            case 2:
              goto LABEL_17;
            case 3:
            case 5:
              uint64_t v11 = qword_1AB35ADE0[v10 - 1];
              unint64_t v12 = v7;
LABEL_20:
              [v12 setCurationLength:v11];
              uint64_t v8 = [MEMORY[0x1E4F8E7D0] fetchEditorialAssetsForCollection:*(void *)(a1 + 40) options:v7];
              goto LABEL_21;
            default:
              goto LABEL_16;
          }
        case 2:
          uint64_t v8 = [MEMORY[0x1E4F8E7D0] fetchMovieAssetsForCollection:*(void *)(a1 + 40) options:v7];
          goto LABEL_21;
        case 3:
LABEL_17:
          uint64_t v8 = [MEMORY[0x1E4F8E7D0] fetchPreviewAssetsForCollection:*(void *)(a1 + 40) options:v7];
          goto LABEL_21;
        case 4:
        case 5:
          uint64_t v8 = [*(id *)(a1 + 32) _fetchKeyAssetsInContainer:*(void *)(a1 + 40) options:v2];
          goto LABEL_21;
        default:
LABEL_16:
          char v9 = 0;
          goto LABEL_22;
      }
    }
    if (!v3)
    {
      unint64_t v4 = *(void *)(a1 + 72);
      BOOL v5 = v4 >= 4;
      unint64_t v6 = v4 - 4;
      if (!v5) {
        PXAssertGetLog();
      }
      if (v6 < 2)
      {
        char v9 = [*(id *)(a1 + 32) _fetchKeyAssetsInContainer:*(void *)(a1 + 40) options:v2];
        goto LABEL_23;
      }
    }
    goto LABEL_12;
  }
  if (*(void *)(a1 + 72) > 5uLL)
  {
LABEL_12:
    char v9 = 0;
    goto LABEL_23;
  }
  id v7 = +[PXFakePhotoKitAssetsFetcher defaultFetcher];
  uint64_t v8 = [v7 fetchAssetsInContainer:*(void *)(a1 + 40) curationKind:*(void *)(a1 + 72)];
LABEL_21:
  char v9 = (void *)v8;
LABEL_22:

LABEL_23:
  return v9;
}

- (id)_fetchOptionsForContainer:(id)a3 curationKind:(int64_t)a4 options:(unint64_t)a5 sortDescriptors:(id)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9
{
  v26[2] = *MEMORY[0x1E4F143B8];
  p_photoLibrary = &self->_photoLibrary;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  id v20 = [WeakRetained librarySpecificFetchOptions];

  [v20 setIncludeHiddenAssets:0];
  [v20 setInternalPredicate:v16];

  [v20 setFetchPropertySets:v15];
  [v20 setInternalSortDescriptors:v17];

  _addFetchPropertySetsForCurationKind(v20, a4);
  objc_msgSend(v20, "setSharingFilter:", _sharingFilterForLibraryFilterInContainer(a9, v18));
  [v20 setIncludeGuestAssets:(a5 >> 2) & 1];
  objc_opt_class();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  if (a5)
  {
    id v21 = [v20 sortDescriptors];

    if (!v21)
    {
      id v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
      v26[0] = v22;
      unint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
      v26[1] = v23;
      BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      [v20 setInternalSortDescriptors:v24];
    }
  }
  return v20;
}

- (id)_fetchKeyAssetsInContainer:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = +[PXPeopleUtilities keyAssetForPerson:v7 face:0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXPhotosAssetsFetcher.m" lineNumber:376 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchKeyAssetForSocialGroup:v7 createIfNeeded:1 options:v8];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

uint64_t __96__PXPhotosAssetsFetcher__adjustedReverseSortOrderForCollection_reverseSortOrder_fetcherOptions___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) ^= 1u;
  return result;
}

- (id)_importantFetchNameForCollectionSubtype:(int64_t)a3
{
  uint64_t v3 = @"RecentsSmartAlbum";
  if (a3 != 209) {
    uint64_t v3 = 0;
  }
  if (a3 == 1000000205) {
    return @"AllPhotosSmartAlbum";
  }
  else {
    return v3;
  }
}

- (PXPhotosAssetsFetcher)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosAssetsFetcher;
  unint64_t v6 = [(PXPhotosAssetsFetcher *)&v17 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.assetsFetcher-queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[PXPhotosDetailsSettings sharedInstance];
    int v11 = [v10 enableFetchResultCaching];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      queue_cachedFetchResultsByContainerByConfiguration = v6->_queue_cachedFetchResultsByContainerByConfiguration;
      v6->_queue_cachedFetchResultsByContainerByConfiguration = (NSMapTable *)v12;
    }
    if (!v5)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v6, @"PXPhotosAssetsFetcher.m", 156, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
    }
    id v14 = objc_storeWeak((id *)&v6->_photoLibrary, v5);
    objc_msgSend(v5, "px_registerChangeObserver:", v6);
  }
  return v6;
}

void __54__PXPhotosAssetsFetcher_sharedFetcherForPhotoLibrary___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v1 = (void *)sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary;
  sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary = v0;

  unint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.assetsfetcher-isolation-queue", v4);
  uint64_t v3 = (void *)sharedFetcherForPhotoLibrary__fetchersQueue;
  sharedFetcherForPhotoLibrary__fetchersQueue = (uint64_t)v2;
}

void __237__PXPhotosAssetsFetcher__fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter___block_invoke()
{
  v9[11] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc((Class)off_1E5DA9660);
  v1 = [MEMORY[0x1E4F1CA98] null];
  dispatch_queue_t v2 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v1);
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  v9[1] = v2;
  v9[2] = MEMORY[0x1E4F1CC28];
  v9[3] = MEMORY[0x1E4F1CC28];
  v9[4] = &unk_1F02D8758;
  unint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  v9[5] = v4;
  v9[6] = v3;
  v9[7] = v3;
  id v5 = [MEMORY[0x1E4F1CA98] null];
  v9[8] = v5;
  v9[9] = &unk_1F02D8770;
  v9[10] = &unk_1F02D8770;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:11];
  uint64_t v7 = [v0 initWithObjects:v6];
  dispatch_queue_t v8 = (void *)_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__nullTuple;
  _fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__nullTuple = v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_queue_cachedFetchResultsByContainerByConfiguration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke;
  v6[3] = &unk_1E5DD32A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_queue_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_2;
  v3[3] = &unk_1E5DD32A8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 16) objectEnumerator];
  uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v1 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v1;
        dispatch_queue_t v2 = *(void **)(*((void *)&v23 + 1) + 8 * v1);
        uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v4 = [v2 keyEnumerator];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v20 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v10 = [v2 objectForKey:v9];
              int v11 = [*(id *)(a1 + 40) changeDetailsForFetchResult:v10];
              uint64_t v12 = [v11 fetchResultAfterChanges];
              if (v12) {
                [v3 setObject:v12 forKeyedSubscript:v9];
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v6);
        }

        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_3;
        v18[3] = &unk_1E5DBEF58;
        v18[4] = v2;
        [v3 enumerateKeysAndObjectsUsingBlock:v18];

        uint64_t v1 = v16 + 1;
      }
      while (v16 + 1 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v15);
  }
}

uint64_t __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (id)_existingCuratedAssetsFetchResultForAssetCollection:(id)a3 referencePersons:(id)a4 curationType:(int64_t)a5 curationKind:(int64_t)a6 curationLength:(int64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 filterPredicate:(id)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13
{
  id v18 = a12;
  id v19 = a11;
  id v20 = a9;
  id v21 = a4;
  id v22 = a3;
  LOBYTE(v26) = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:v22 reverseSortOrder:0 fetcherOptions:a8];
  long long v23 = [(PXPhotosAssetsFetcher *)self _fetchConfigurationForCurationWithReferencePersons:v21 curationType:a5 curationKind:a6 curationLength:a7 options:a8 sortDescriptors:v20 reverseSortOrder:v26 filterPredicate:v19 fetchPropertySets:v18 libraryFilter:a13];

  long long v24 = [(PXPhotosAssetsFetcher *)self _cachedFetchResultForContainer:v22 configuration:v23];

  return v24;
}

- (id)_existingKeyAssetsFetchResultForAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 curated:(BOOL)a6 options:(unint64_t)a7 libraryFilter:(int64_t)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  uint64_t v15 = [(PXPhotosAssetsFetcher *)self _fetchConfigurationForKeyAssetWithReferenceAsset:a4 referencePersons:a5 curated:v10 options:a7 libraryFilter:a8];
  uint64_t v16 = [(PXPhotosAssetsFetcher *)self _cachedFetchResultForContainer:v14 configuration:v15];

  return v16;
}

id __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke_408(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F39150]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v4 = [MEMORY[0x1E4F38EB8] fetchType];
  uint64_t v5 = (void *)[v2 initWithOids:MEMORY[0x1E4F1CBF0] photoLibrary:WeakRetained fetchType:v4 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v5;
}

- (id)_existingFetchResultForAssetCollection:(id)a3 withFilterPredicate:(id)a4 inclusionPredicate:(id)a5 includeUnsavedSyndicatedAssets:(BOOL)a6 includeAllBurstAssets:(BOOL)a7 fetchLimit:(unint64_t)a8 options:(unint64_t)a9 sortDescriptors:(id)a10 reverseSortOrder:(BOOL)a11 hideHiddenAssets:(BOOL)a12 fetchPropertySets:(id)a13 libraryFilter:(int64_t)a14
{
  BOOL v27 = a6;
  BOOL v28 = a7;
  id v18 = a13;
  id v19 = a10;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  BYTE1(v26) = a12;
  LOBYTE(v26) = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:v22 reverseSortOrder:a11 fetcherOptions:a9];
  long long v23 = -[PXPhotosAssetsFetcher _fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:](self, "_fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:", v21, v20, v27, v28, a8, a9, v19, v26, v18, a14);

  long long v24 = [(PXPhotosAssetsFetcher *)self _cachedFetchResultForContainer:v22 configuration:v23];

  return v24;
}

- (id)_existingAssetsInContainer:(id)a3 curationKind:(int64_t)a4 curationLength:(int64_t)a5 options:(unint64_t)a6 sortDescriptors:(id)a7 filterPredicate:(id)a8 fetchPropertySets:(id)a9 libraryFilter:(int64_t)a10 includeOthersInSocialGroupAssets:(BOOL)a11
{
  id v17 = a3;
  LOBYTE(v21) = a11;
  id v18 = [(PXPhotosAssetsFetcher *)self _fetchConfigurationForCuratedAssetsWithCurationKind:a4 curationLength:a5 options:a6 sortDescriptors:a7 filterPredicate:a8 fetchPropertySets:a9 libraryFilter:a10 includeOthersInSocialGroupAssets:v21];
  id v19 = [(PXPhotosAssetsFetcher *)self _cachedFetchResultForContainer:v17 configuration:v18];

  return v19;
}

- (void)clearFetchResultsForAssetCollections:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PXPhotosAssetsFetcher_clearFetchResultsForAssetCollections___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__PXPhotosAssetsFetcher_clearFetchResultsForAssetCollections___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = *(id *)(a1 + 40);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [v7 removeObjectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)clearFetchResultsForAssetCollection:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXPhotosAssetsFetcher.m", 223, @"Invalid parameter not satisfying: %@", @"assetCollection != nil" object file lineNumber description];
  }
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(PXPhotosAssetsFetcher *)self clearFetchResultsForAssetCollections:v6];
}

- (id)existingAssetsFetchResultForContainer:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [v7 curationKind];
    uint64_t v15 = [v7 curationLength];
    uint64_t v16 = [v7 options];
    id v8 = [v7 sortDescriptors];
    uint64_t v11 = [v7 filterPredicate];
    uint64_t v12 = [v7 fetchPropertySets];
    uint64_t v17 = [v7 libraryFilter];
    LOBYTE(v28) = [v7 includeOthersInSocialGroupAssets];
    long long v13 = [(PXPhotosAssetsFetcher *)self _existingAssetsInContainer:v6 curationKind:v14 curationLength:v15 options:v16 sortDescriptors:v8 filterPredicate:v11 fetchPropertySets:v12 libraryFilter:v17 includeOthersInSocialGroupAssets:v28];
    goto LABEL_6;
  }
  id v8 = v6;
  uint64_t v9 = [v7 curationKind];
  if ((unint64_t)(v9 - 1) < 3)
  {
    uint64_t v11 = [v7 referencePersons];
    uint64_t v34 = [v7 curationType];
    uint64_t v32 = [v7 curationKind];
    uint64_t v30 = [v7 curationLength];
    uint64_t v18 = [v7 options];
    uint64_t v12 = [v7 sortDescriptors];
    char v19 = [v7 reverseSortOrder];
    long long v20 = [v7 filterPredicate];
    uint64_t v21 = [v7 fetchPropertySets];
    LOBYTE(v27) = v19;
    -[PXPhotosAssetsFetcher _existingCuratedAssetsFetchResultForAssetCollection:referencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:](self, "_existingCuratedAssetsFetchResultForAssetCollection:referencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:", v8, v11, v34, v32, v30, v18, v12, v27, v20, v21, [v7 libraryFilter]);
    self = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if ((unint64_t)(v9 - 4) < 2)
  {
    BOOL v10 = [v7 curationKind] == 5;
    uint64_t v11 = [v7 referenceAsset];
    uint64_t v12 = [v7 referencePersons];
    -[PXPhotosAssetsFetcher _existingKeyAssetsFetchResultForAssetCollection:referenceAsset:referencePersons:curated:options:libraryFilter:](self, "_existingKeyAssetsFetchResultForAssetCollection:referenceAsset:referencePersons:curated:options:libraryFilter:", v8, v11, v12, v10, [v7 options], objc_msgSend(v7, "libraryFilter"));
    long long v13 = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    self = v13;
LABEL_10:

    goto LABEL_11;
  }
  if (!v9)
  {
    uint64_t v11 = [v7 filterPredicate];
    uint64_t v12 = [v7 inclusionPredicate];
    unsigned int v35 = [v7 includeUnsavedSyndicatedAssets];
    unsigned int v33 = [v7 includeAllBurstAssets];
    uint64_t v31 = [v7 fetchLimit];
    uint64_t v29 = [v7 options];
    id v22 = [v7 sortDescriptors];
    char v23 = [v7 reverseSortOrder];
    char v24 = [v7 hideHiddenAssets];
    long long v25 = [v7 fetchPropertySets];
    BYTE1(v28) = v24;
    LOBYTE(v28) = v23;
    -[PXPhotosAssetsFetcher _existingFetchResultForAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:](self, "_existingFetchResultForAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:", v8, v11, v12, v35, v33, v31, v29, v22, v28, v25, [v7 libraryFilter]);
    self = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
LABEL_11:

  return self;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "px_unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosAssetsFetcher;
  [(PXPhotosAssetsFetcher *)&v4 dealloc];
}

void __54__PXPhotosAssetsFetcher_sharedFetcherForPhotoLibrary___block_invoke_372(uint64_t a1)
{
  uint64_t v2 = [(id)sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [[PXPhotosAssetsFetcher alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

@end