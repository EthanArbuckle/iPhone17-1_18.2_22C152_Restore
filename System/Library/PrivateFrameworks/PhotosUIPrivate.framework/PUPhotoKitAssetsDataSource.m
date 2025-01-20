@interface PUPhotoKitAssetsDataSource
+ (id)badgeInfoPromiseForAsset:(id)a3 assetCollection:(id)a4;
- (BOOL)couldAssetReferenceAppear:(id)a3;
- (BOOL)isEmpty;
- (NSCache)_assetReferenceByIndexPathCache;
- (NSString)changeFromDataSourceIdentifier;
- (PUPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChange:(id)a4 fromDataSourceIdentifier:(id)a5;
- (PXPhotosDataSource)photosDataSource;
- (PXPhotosDataSourceChange)change;
- (id)assetAtIndexPath:(id)a3;
- (id)assetCollectionAtIndexPath:(id)a3;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3;
- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4;
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (id)startingAssetReference;
- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation PUPhotoKitAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetReferenceByIndexPathCache, 0);
  objc_storeStrong((id *)&self->_changeFromDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

- (NSCache)_assetReferenceByIndexPathCache
{
  return self->__assetReferenceByIndexPathCache;
}

- (NSString)changeFromDataSourceIdentifier
{
  return self->_changeFromDataSourceIdentifier;
}

- (PXPhotosDataSourceChange)change
{
  return self->_change;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  v6 = [v5 assetAtIndexPath:v4];

  return v6;
}

- (BOOL)couldAssetReferenceAppear:(id)a3
{
  id v4 = a3;
  v5 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  v6 = [v4 asset];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v8 = 1;
LABEL_5:

    goto LABEL_6;
  }
  char v7 = [v5 isEmpty];

  if ((v7 & 1) == 0)
  {
    v10 = [v4 asset];
    char v11 = [v10 isCloudSharedAsset];

    uint64_t v12 = [v5 numberOfSections];
    if (v12 < 1)
    {
      char v8 = 0;
      goto LABEL_6;
    }
    uint64_t v13 = v12;
    v6 = 0;
    uint64_t v14 = 1;
    do
    {
      v15 = v6;
      v6 = [v5 assetCollectionForSection:v14 - 1];

      char v8 = v11 ^ ([v6 assetCollectionSubtype] != 101);
      if (v8) {
        break;
      }
    }
    while (v14++ < v13);
    goto LABEL_5;
  }
  char v8 = 1;
LABEL_6:

  return v8;
}

- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3)
  {
    if (a3 == 1)
    {
      char v7 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
      int64_t v3 = [v7 isEmpty] ^ 1;
    }
    else if (a3 == 2)
    {
      v5 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
      char v6 = [v5 containsMultipleAssets];

      if (v6)
      {
        return 2;
      }
      else
      {
        char v8 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
        int v9 = [v8 isEmpty];

        return v9 ^ 1u;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)PUPhotoKitAssetsDataSource;
      return [(PUAssetsDataSource *)&v11 numberOfAssetsWithMaximum:a3];
    }
  }
  return v3;
}

- (BOOL)isEmpty
{
  v2 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 isEmpty];

  return v3;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v5 = a3;
  if ([v5 length] != 2)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 208, @"Invalid parameter not satisfying: %@", @"[indexPath length] == 2" object file lineNumber description];
  }
  char v6 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  char v7 = [v6 assetAtIndexPath:v5];

  char v8 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v9 = [v5 section];

  v10 = [v8 assetCollectionForSection:v9];

  objc_super v11 = [(id)objc_opt_class() badgeInfoPromiseForAsset:v7 assetCollection:v10];

  return v11;
}

- (id)startingAssetReference
{
  char v3 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  if ([v3 numberOfSections] < 1)
  {
    id v5 = 0;
    char v6 = 0;
  }
  else
  {
    id v4 = [v3 assetCollectionForSection:0];
    if ([v4 keyAssetsAtEnd]) {
      [v3 indexPathForLastAsset];
    }
    else {
    char v6 = [v3 indexPathForFirstAsset];
    }

    if (v6)
    {
      id v5 = [(PUPhotoKitAssetsDataSource *)self assetReferenceAtIndexPath:v6];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length] == 2)
  {
    id v8 = v7;
    uint64_t v9 = [v8 change];
    if ([v9 hasIncrementalChanges])
    {
      v10 = [v8 changeFromDataSourceIdentifier];
      objc_super v11 = [(PUTilingDataSource *)self identifier];
      char v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        uint64_t v13 = [v8 change];
        uint64_t v14 = [v13 indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath:v6];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PUPhotoKitAssetsDataSource;
  uint64_t v14 = [(PUAssetsDataSource *)&v16 convertIndexPath:v6 fromAssetsDataSource:v7];
LABEL_9:

  return v14;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(PUPhotoKitAssetsDataSource *)self photosDataSource],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 sectionForAssetCollection:v4],
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v7 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  id v5 = a3;
  if ([v5 length] != 1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 148, @"Invalid parameter not satisfying: %@", @"[indexPath length] == 1" object file lineNumber description];
  }
  uint64_t v6 = [v5 indexAtPosition:0];
  id v7 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  id v8 = [v7 assetCollectionForSection:v6];

  return v8;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5
    || ([v5 dataSourceIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(PUTilingDataSource *)self identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    v10 = [v6 indexPath];
    goto LABEL_26;
  }
  objc_super v11 = [(PUPhotoKitAssetsDataSource *)self change];
  if (([v11 hasIncrementalChanges] & 1) == 0)
  {

LABEL_14:
    v29 = [v6 asset];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v15 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
      v19 = [v6 asset];
      v26 = [v6 indexPath];
      id v28 = [v6 assetCollection];
      v10 = [v15 indexPathForAsset:v19 hintIndexPath:v26 hintCollection:v28];
    }
    else
    {
      v31 = [v6 asset];
      v32 = [v31 uuid];

      if (!v32)
      {
        v10 = 0;
        goto LABEL_26;
      }
      v15 = [v6 asset];
      v33 = [v6 asset];
      v19 = [v33 uuid];

      if (objc_opt_respondsToSelector())
      {
        v26 = [v15 burstIdentifier];
      }
      else
      {
        v26 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v26 = 0;
      }
      v34 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
      id v28 = [v34 indexPathForLastAsset];

      v35 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
      v10 = [v35 indexPathForAssetWithUUID:v19 orBurstIdentifier:v26 hintIndexPath:v28 hintCollection:0];
    }
    goto LABEL_24;
  }
  char v12 = [(PUPhotoKitAssetsDataSource *)self changeFromDataSourceIdentifier];
  uint64_t v13 = [v6 dataSourceIdentifier];
  int v14 = [v12 isEqual:v13];

  if (!v14) {
    goto LABEL_14;
  }
  v15 = [v6 indexPath];
  objc_super v16 = [(PUPhotoKitAssetsDataSource *)self change];
  v17 = [v16 indexPathAfterApplyingIncrementalChangesToIndexPath:v15];

  id v18 = v17;
  v19 = v18;
  if (!v18)
  {
    v26 = [v6 asset];
    if ((objc_opt_respondsToSelector() & 1) == 0 || ![v26 isGuestAsset])
    {
      v19 = 0;
      v10 = 0;
      goto LABEL_25;
    }
    id v28 = v26;
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_33:
        id v37 = v15;
        [v28 fetchPropertySetsIfNeeded];
        v38 = [v28 curationProperties];
        v39 = [v38 syndicationIdentifier];

        if (v39)
        {
          v40 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
          v10 = [v40 indexPathForAssetWithUUID:0 orSyndicationIdentifier:v39 hintIndexPath:v37 hintCollection:0];
        }
        else
        {
          v10 = 0;
        }
        v26 = v28;
        goto LABEL_38;
      }
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      v48 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v48);
      v49 = objc_msgSend(v28, "px_descriptionForAssertionMessage");
      [v45 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 105, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAsset", v47, v49 object file lineNumber description];
    }
    else
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      v46 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v46);
      [v45 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 105, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAsset", v47 object file lineNumber description];
    }

    goto LABEL_33;
  }
  uint64_t v20 = [v18 section];
  v21 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v22 = [v21 numberOfSections];

  if (v20 >= v22)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = [(PUPhotoKitAssetsDataSource *)self change];
    [v41 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 122, @"Index path %@ converted using change %@ is invalid, section out of data source bounds: %@", v15, v42, v19 object file lineNumber description];
  }
  uint64_t v23 = [v19 item];
  v24 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v25 = objc_msgSend(v24, "numberOfItemsInSection:", objc_msgSend(v19, "section"));

  if (v23 >= v25)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = [(PUPhotoKitAssetsDataSource *)self change];
    [v43 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 123, @"Index path %@ converted using change %@ is invalid, outside section bounds: %@", v15, v44, v19 object file lineNumber description];
  }
  v26 = [v6 asset];
  v27 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
  id v28 = [v27 assetAtIndexPath:v19];

  if (([v26 isEqual:v28] & 1) == 0)
  {
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = [(PUPhotoKitAssetsDataSource *)self change];
    [v37 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 126, @"Index path %@ converted using change %@ is invalid:%@ asset does not match: %@!=%@", v15, v39, v19, v26, v28 object file lineNumber description];
    v10 = v19;
LABEL_38:

    goto LABEL_24;
  }
  v10 = v19;
LABEL_24:

LABEL_25:
LABEL_26:

  return v10;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v5 = a3;
  if ([v5 length] != 2)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 72, @"Invalid parameter not satisfying: %@", @"[indexPath length] == 2" object file lineNumber description];
  }
  uint64_t v6 = [(NSCache *)self->__assetReferenceByIndexPathCache objectForKey:v5];
  if (!v6)
  {
    id v7 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
    id v8 = [v7 assetAtIndexPath:v5];
    int v9 = objc_msgSend(v7, "assetCollectionForSection:", objc_msgSend(v5, "section"));
    v10 = [PUAssetReference alloc];
    objc_super v11 = [(PUTilingDataSource *)self identifier];
    uint64_t v6 = [(PUAssetReference *)v10 initWithAsset:v8 assetCollection:v9 indexPath:v5 dataSourceIdentifier:v11];

    [(NSCache *)self->__assetReferenceByIndexPathCache setObject:v6 forKey:v5];
  }

  return v6;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (v6 == 1)
  {
    id v7 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
    uint64_t v8 = objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v5, "section"));
  }
  else
  {
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 63, @"invalid indexPath %@", v5 object file lineNumber description];
      int64_t v9 = 0;
      goto LABEL_7;
    }
    id v7 = [(PUPhotoKitAssetsDataSource *)self photosDataSource];
    uint64_t v8 = [v7 numberOfSections];
  }
  int64_t v9 = v8;
LABEL_7:

  return v9;
}

- (PUPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChange:(id)a4 fromDataSourceIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUPhotoKitAssetsDataSource.m", 39, @"Invalid parameter not satisfying: %@", @"immutablePhotosDataSource != nil" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoKitAssetsDataSource;
  uint64_t v13 = [(PUTilingDataSource *)&v19 init];
  if (v13)
  {
    if (([v10 options] & 4) == 0)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v13, @"PUPhotoKitAssetsDataSource.m", 42, @"Invalid parameter not satisfying: %@", @"([immutablePhotosDataSource options] & PXPhotosDataSourceOptionDisableChangeHandling) == PXPhotosDataSourceOptionDisableChangeHandling" object file lineNumber description];
    }
    objc_storeStrong((id *)&v13->_photosDataSource, a3);
    objc_storeStrong((id *)&v13->_change, a4);
    objc_storeStrong((id *)&v13->_changeFromDataSourceIdentifier, a5);
    int v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    assetReferenceByIndexPathCache = v13->__assetReferenceByIndexPathCache;
    v13->__assetReferenceByIndexPathCache = v14;
  }
  return v13;
}

+ (id)badgeInfoPromiseForAsset:(id)a3 assetCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke;
  aBlock[3] = &unk_1E5F29A20;
  id v7 = v5;
  id v23 = v7;
  id v8 = v6;
  id v24 = v8;
  int64_t v9 = _Block_copy(aBlock);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_2;
  objc_super v19 = &unk_1E5F29A48;
  id v10 = v7;
  id v20 = v10;
  id v11 = v8;
  id v21 = v11;
  id v12 = _Block_copy(&v16);
  uint64_t v13 = +[PUOneUpSettings sharedInstance];
  if ([v13 debuggingBadges] || objc_msgSend(v13, "debuggingBadgesWhenFavorite"))
  {

    id v12 = 0;
  }
  int v14 = [[PUBadgeInfoPromise alloc] initWithBadgeInfoProvider:v9 countProvider:v12];

  return v14;
}

void __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = [*(id *)(a1 + 32) mediaType];
  if (v4 == 1)
  {
    int v6 = [*(id *)(a1 + 32) isMediaSubtype:2];
    int v7 = [*(id *)(a1 + 32) isMediaSubtype:16];
    int v5 = 0;
  }
  else
  {
    if (v4 == 2) {
      int v5 = [*(id *)(a1 + 32) isMediaSubtype:0x100000];
    }
    else {
      int v5 = 0;
    }
    int v6 = 0;
    int v7 = 0;
  }
  int v8 = [*(id *)(a1 + 32) hasEditableDepth];
  if ([*(id *)(a1 + 32) representsBurst]) {
    int v9 = [*(id *)(a1 + 40) canShowAvalancheStacks];
  }
  else {
    int v9 = 0;
  }
  uint64_t v10 = [*(id *)(a1 + 32) RAWBadgeAttributes];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F91308] + 16);
  *a2 = *MEMORY[0x1E4F91308];
  a2[1] = v11;
  if (v6)
  {
    *(void *)a2 |= 4uLL;
    if (!v7)
    {
LABEL_12:
      if (!v9) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if (!v7)
  {
    goto LABEL_12;
  }
  *(void *)a2 |= 0x10uLL;
  if (v9) {
LABEL_13:
  }
    *(void *)a2 |= 8uLL;
LABEL_14:
  if ([*(id *)(a1 + 32) isCinematicVideo])
  {
    *(void *)a2 |= 0x800000000uLL;
    char v12 = v5;
  }
  else
  {
    char v12 = 0;
  }
  if ([*(id *)(a1 + 32) isProRes]
    && ([*(id *)(a1 + 32) isCinematicVideo] & 1) == 0)
  {
    *(void *)a2 |= 0x400000000uLL;
    v12 |= v5;
  }
  if ([*(id *)(a1 + 32) isSpatialMedia])
  {
    *(void *)a2 |= 0x20000000000uLL;
    v12 |= v5;
  }
  if (v5 && (v12 & 1) == 0) {
    *(void *)a2 |= 0x400uLL;
  }
  if ([*(id *)(a1 + 32) isPhotoIris])
  {
    uint64_t v13 = [MEMORY[0x1E4F90540] sharedInstance];
    int v14 = [v13 showActionableLivePhotosBadge];

    if (v14) {
      *(void *)a2 |= 0x2000uLL;
    }
    if ([*(id *)(a1 + 32) playbackVariation] == 1
      && [*(id *)(a1 + 32) playbackStyle] == 5)
    {
      uint64_t v15 = 128;
    }
    else if ([*(id *)(a1 + 32) playbackVariation] == 2 {
           && [*(id *)(a1 + 32) playbackStyle] == 5)
    }
    {
      uint64_t v15 = 256;
    }
    else if ([*(id *)(a1 + 32) canPlayLongExposure])
    {
      uint64_t v15 = 512;
    }
    else if (([*(id *)(a1 + 32) canPlayPhotoIris] & 1) != 0 {
           || ([*(id *)(a1 + 32) isPhotoIrisPlaceholder] & 1) != 0)
    }
    {
      uint64_t v15 = 64;
    }
    else
    {
      if ([*(id *)(a1 + 32) isPhotoIrisPlaceholder]) {
        goto LABEL_43;
      }
      uint64_t v15 = 16777280;
    }
    *(void *)a2 |= v15;
  }
LABEL_43:
  if (v8 && ((v7 & 1) != 0 || [*(id *)(a1 + 32) isPhotoIris])) {
    *(void *)a2 |= 0x40000000000uLL;
  }
  if ((unint64_t)(v10 - 1) <= 2) {
    *(void *)a2 |= qword_1AEFF82E8[v10 - 1];
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F90690];
  uint64_t v17 = [*(id *)(a1 + 32) photoLibrary];
  id v26 = [v16 sharedLibraryStatusProviderWithPhotoLibrary:v17];

  if ([v26 hasSharedLibrary])
  {
    id v18 = [MEMORY[0x1E4F90688] sharedInstance];
    int v19 = [v18 enableOneUpBadge];

    if (v19)
    {
      if ([*(id *)(a1 + 32) participatesInLibraryScope]
        && ([*(id *)(a1 + 32) canPerformEditOperation:103] & 1) != 0)
      {
        uint64_t v20 = 0xA000000000;
LABEL_57:
        *(void *)a2 |= v20;
        goto LABEL_58;
      }
      if (([*(id *)(a1 + 32) participatesInLibraryScope] & 1) == 0
        && [*(id *)(a1 + 32) canPerformEditOperation:102])
      {
        uint64_t v20 = 0x6000000000;
        goto LABEL_57;
      }
    }
  }
LABEL_58:
  id v21 = +[PUOneUpSettings sharedInstance];
  uint64_t v22 = [v21 debuggingBadges];
  uint64_t v23 = [v21 debuggingBadgesWhenFavorite];
  if (v22 | v23)
  {
    uint64_t v24 = v23;
    if ([*(id *)(a1 + 32) isFavorite]) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = v22;
    }
    *(void *)a2 = v25;
    *((void *)a2 + 2) = 42;
  }
}

uint64_t __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if ([*(id *)(a1 + 32) representsBurst]
    && [*(id *)(a1 + 40) canShowAvalancheStacks])
  {
    v2 = [*(id *)(a1 + 32) burstIdentifier];
    char v3 = [*(id *)(a1 + 32) photoLibrary];
    uint64_t v4 = [v3 photoLibrary];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_3;
    v9[3] = &unk_1E5F2E0D0;
    char v12 = &v13;
    id v5 = v2;
    id v10 = v5;
    id v6 = v4;
    id v11 = v6;
    [v6 performBlockAndWait:v9];
  }
  uint64_t v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_3(void *a1)
{
  uint64_t result = [MEMORY[0x1E4F8A6B8] countForAssetsWithAvalancheUUID:a1[4] inLibrary:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

@end