@interface PHAsset(PXPlacesAdditions)
+ (id)pk_fetchPlacesAssetsInAssetCollection:()PXPlacesAdditions shouldMergeOptionFetchPropertySets:options:;
- (uint64_t)compareTo:()PXPlacesAdditions;
- (uint64_t)pk_isContentEqualTo:()PXPlacesAdditions;
@end

@implementation PHAsset(PXPlacesAdditions)

- (uint64_t)compareTo:()PXPlacesAdditions
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [a1 creationDate];
    v6 = [v4 creationDate];
    uint64_t v7 = [v5 compare:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (uint64_t)pk_isContentEqualTo:()PXPlacesAdditions
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a1 hasContentEqualTo:v4]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = v4 == 0;
  }

  return v5;
}

+ (id)pk_fetchPlacesAssetsInAssetCollection:()PXPlacesAdditions shouldMergeOptionFetchPropertySets:options:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
LABEL_3:
      v10 = (void *)[v9 copy];
      goto LABEL_6;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F390A0];
    v12 = [v8 photoLibrary];
    v13 = [v11 fetchOptionsWithPhotoLibrary:v12 orObject:0];

    [v13 setIncludePlacesSmartAlbum:1];
    v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000203 options:v13];
    id v7 = [v14 firstObject];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [v7 photoLibrary];
  v10 = [v15 librarySpecificFetchOptions];

  objc_msgSend(v10, "setSharingFilter:", objc_msgSend(0, "sharingFilter"));
LABEL_6:
  v16 = objc_msgSend(MEMORY[0x1E4F390A0], "px_placesFetchOptionsWith:", v10);

  [v16 setChunkSizeForFetch:5000];
  v17 = [v16 sortDescriptors];

  if (!v17)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"creationDate" ascending:0];
    v25[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v16 setSortDescriptors:v19];
  }
  uint64_t v20 = *MEMORY[0x1E4F39528];
  v24[0] = *MEMORY[0x1E4F39448];
  v24[1] = v20;
  v24[2] = *MEMORY[0x1E4F39440];
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  if (a4) {
    [v16 addFetchPropertySets:v21];
  }
  else {
    [v16 setFetchPropertySets:v21];
  }
  v22 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v16];

  return v22;
}

@end