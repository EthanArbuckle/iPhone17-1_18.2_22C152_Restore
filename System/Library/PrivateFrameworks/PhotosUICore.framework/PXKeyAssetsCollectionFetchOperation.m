@interface PXKeyAssetsCollectionFetchOperation
- (NSDictionary)outputOtherFetchResultsByAssetCollection;
- (int64_t)maxKeyAssets;
- (void)main;
- (void)setMaxKeyAssets:(int64_t)a3;
- (void)setOutputOtherFetchResultsByAssetCollection:(id)a3;
@end

@implementation PXKeyAssetsCollectionFetchOperation

- (void).cxx_destruct
{
}

- (void)setOutputOtherFetchResultsByAssetCollection:(id)a3
{
}

- (NSDictionary)outputOtherFetchResultsByAssetCollection
{
  return self->_outputOtherFetchResultsByAssetCollection;
}

- (void)setMaxKeyAssets:(int64_t)a3
{
  self->_maxKeyAssets = a3;
}

- (int64_t)maxKeyAssets
{
  return self->_maxKeyAssets;
}

- (void)main
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [(PXCollectionFetchOperation *)self handleBegin];
  v3 = [(PXCollectionFetchOperation *)self fetchOptions];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(PXCollectionFetchOperation *)self collection];
    v7 = [v6 photoLibrary];
    objc_msgSend(v7, "px_standardLibrarySpecificFetchOptions");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (([(PXKeyAssetsCollectionFetchOperation *)self isCancelled] & 1) != 0
    || ([(PXCollectionFetchOperation *)self collection],
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v9 = objc_opt_isKindOfClass(),
        v8,
        (v9 & 1) == 0))
  {
    if (([(PXKeyAssetsCollectionFetchOperation *)self isCancelled] & 1) != 0
      || ([(PXCollectionFetchOperation *)self collection],
          v11 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) == 0))
    {
      v21 = 0;
      id v22 = 0;
    }
    else
    {
      v13 = [(PXCollectionFetchOperation *)self collection];
      if (([v13 collectionListType] & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v35 = v13;
        v14 = [(PXCollectionFetchOperation *)self collection];
        v15 = [v14 photoLibrary];
        v16 = objc_msgSend(v15, "px_standardLibrarySpecificFetchOptions");

        objc_msgSend(v16, "setReverseSortOrder:", objc_msgSend(v14, "keyCollectionsAtEnd"));
        v33 = v16;
        v34 = v14;
        v17 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v14 options:v16];
        unint64_t v18 = [v17 count];
        int64_t maxKeyAssets = self->_maxKeyAssets;
        if (maxKeyAssets <= 0) {
          int64_t maxKeyAssets = 9;
        }
        if (v18 >= maxKeyAssets) {
          unint64_t v20 = maxKeyAssets;
        }
        else {
          unint64_t v20 = v18;
        }
        unint64_t v36 = v20;
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:");
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v22 = v17;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v38;
LABEL_18:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * v26);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v27 options:v5];
              v29 = id v28 = v5;
              v30 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v29, "count"));
              [v29 prefetchObjectsAtIndexes:v30];

              [v21 setObject:v29 forKey:v27];
              unint64_t v31 = [v21 count];

              id v5 = v28;
              if (v31 >= v36) {
                break;
              }
            }
            if (v24 == ++v26)
            {
              uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
              if (v24) {
                goto LABEL_18;
              }
              break;
            }
          }
        }

        v13 = v35;
      }
      else
      {
        v21 = 0;
        id v22 = 0;
      }
    }
  }
  else
  {
    v10 = [(PXCollectionFetchOperation *)self collection];
    if ([v10 assetCollectionType] == 4) {
      [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v10 referenceAsset:0];
    }
    else {
    id v22 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v10 options:v5];
    }
    v32 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v22, "count"));
    [v22 prefetchObjectsAtIndexes:v32];

    v21 = 0;
  }
  [(PXCollectionFetchOperation *)self setOutputFetchResult:v22];
  [(PXKeyAssetsCollectionFetchOperation *)self setOutputOtherFetchResultsByAssetCollection:v21];
  [(PXCollectionFetchOperation *)self handleFinish];
}

@end