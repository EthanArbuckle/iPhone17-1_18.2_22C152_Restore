@interface PXMemoryInfo
+ (id)fastMemoryInfoWithMemory:(id)a3;
+ (id)memoryInfoWithAssetCollection:(id)a3 keyAssetFetchResult:(id)a4;
+ (id)memoryInfoWithAssetCollection:(id)a3 prefetchedPrimaryAsset:(id)a4;
+ (id)memoryInfoWithMemory:(id)a3;
+ (void)_updateTitleForMemoryInfo:(id)a3 withAssetCollection:(id)a4;
- (BOOL)isFavorite;
- (BOOL)px_canPerformFavoriteAction;
- (BOOL)px_isEmpty;
- (BOOL)px_isFavorite;
- (NSString)description;
- (NSString)localizedDateText;
- (NSString)localizedTitle;
- (PHAsset)prefetchedPrimaryAsset;
- (PHAsset)primaryAsset;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)keyAssetFetchResult;
- (PHMemory)memory;
- (PXMemoryInfo)memoryInfoWithUpdatedKeyAssetFetchResult:(id)a3;
- (double)score;
- (id)px_fetchContainedAssets;
- (unint64_t)category;
@end

@implementation PXMemoryInfo

- (id)px_fetchContainedAssets
{
  v4 = [(PXMemoryInfo *)self assetCollection];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v10);
    v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"Containers+PXSelectionAssetContainer.m", 40, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v9, v11 object file lineNumber description];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"Containers+PXSelectionAssetContainer.m", 40, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v9 object file lineNumber description];
  }

LABEL_3:
  v5 = objc_msgSend(v4, "px_fetchContainedAssets");

  return v5;
}

- (BOOL)px_canPerformFavoriteAction
{
  v4 = [(PXMemoryInfo *)self assetCollection];
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"Containers+PXSelectionAssetContainer.m", 36, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v9 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v10);
    v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"Containers+PXSelectionAssetContainer.m", 36, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v9, v11 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  char v5 = objc_msgSend(v4, "px_canPerformFavoriteAction");

  return v5;
}

- (BOOL)px_isFavorite
{
  v4 = [(PXMemoryInfo *)self assetCollection];
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"Containers+PXSelectionAssetContainer.m", 32, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v9 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v10);
    v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"Containers+PXSelectionAssetContainer.m", 32, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v9, v11 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  char v5 = objc_msgSend(v4, "px_isFavorite");

  return v5;
}

- (BOOL)px_isEmpty
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedPrimaryAsset, 0);
  objc_storeStrong((id *)&self->_keyAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDateText, 0);
}

- (PHAsset)prefetchedPrimaryAsset
{
  return self->_prefetchedPrimaryAsset;
}

- (PHFetchResult)keyAssetFetchResult
{
  return self->_keyAssetFetchResult;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDateText
{
  return self->_localizedDateText;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  v6 = [(PXMemoryInfo *)self localizedTitle];
  v7 = [(PXMemoryInfo *)self localizedDateText];
  v8 = [(PXMemoryInfo *)self primaryAsset];
  v9 = [v3 stringWithFormat:@"<%@: %p, title: %@, date: %@, primary asset: %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (PHAsset)primaryAsset
{
  v3 = [(PXMemoryInfo *)self prefetchedPrimaryAsset];

  if (v3)
  {
    v4 = [(PXMemoryInfo *)self prefetchedPrimaryAsset];
  }
  else
  {
    char v5 = [(PXMemoryInfo *)self keyAssetFetchResult];
    v4 = [v5 firstObject];
  }
  return (PHAsset *)v4;
}

- (double)score
{
  v2 = [(PXMemoryInfo *)self memory];
  v3 = v2;
  if (v2)
  {
    [v2 score];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (unint64_t)category
{
  v2 = [(PXMemoryInfo *)self memory];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 category];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isFavorite
{
  v2 = [(PXMemoryInfo *)self memory];
  char v3 = [v2 isFavorite];

  return v3;
}

- (PHMemory)memory
{
  v2 = [(PXMemoryInfo *)self assetCollection];
  if ([v2 assetCollectionType] == 4) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (PHMemory *)v3;
}

- (PXMemoryInfo)memoryInfoWithUpdatedKeyAssetFetchResult:(id)a3
{
  id v4 = a3;
  double v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 2, self->_localizedTitle);
  objc_storeStrong(v5 + 3, self->_assetCollection);
  objc_storeStrong(v5 + 1, self->_localizedDateText);
  id v6 = v5[4];
  v5[4] = v4;

  return (PXMemoryInfo *)v5;
}

+ (void)_updateTitleForMemoryInfo:(id)a3 withAssetCollection:(id)a4
{
  v13 = a3;
  id v5 = a4;
  id v6 = [v5 localizedTitle];
  v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v8 = [v6 stringByTrimmingCharactersInSet:v7];

  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v8 uppercaseStringWithLocale:v9];
  v11 = (void *)v13[2];
  v13[2] = v10;

  uint64_t v12 = [v5 assetCollectionType];
  if (v12 == 3 && !v13[2]) {
    v13[2] = @"Placeholder";
  }
}

+ (id)memoryInfoWithAssetCollection:(id)a3 prefetchedPrimaryAsset:(id)a4
{
  id v6 = (PHAssetCollection *)a3;
  v7 = (PHAsset *)a4;
  v8 = objc_alloc_init(PXMemoryInfo);
  assetCollection = v8->_assetCollection;
  v8->_assetCollection = v6;
  uint64_t v10 = v6;

  prefetchedPrimaryAsset = v8->_prefetchedPrimaryAsset;
  v8->_prefetchedPrimaryAsset = v7;

  [a1 _updateTitleForMemoryInfo:v8 withAssetCollection:v10];
  return v8;
}

+ (id)memoryInfoWithAssetCollection:(id)a3 keyAssetFetchResult:(id)a4
{
  id v6 = (PHAssetCollection *)a3;
  id v7 = a4;
  v8 = objc_alloc_init(PXMemoryInfo);
  assetCollection = v8->_assetCollection;
  v8->_assetCollection = v6;
  uint64_t v10 = v6;

  objc_storeStrong((id *)&v8->_keyAssetFetchResult, a4);
  id v11 = (id)[v7 firstObject];
  [a1 _updateTitleForMemoryInfo:v8 withAssetCollection:v10];

  return v8;
}

+ (id)memoryInfoWithMemory:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() fastMemoryInfoWithMemory:v3];
  id v5 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v3 referenceAsset:0];
  objc_storeStrong(v4 + 4, v5);
  uint64_t v6 = [v5 count];
  if (v3 && !v6)
  {
    id v7 = (void *)MEMORY[0x1E4F39228];
    v11[0] = v3;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 setNeedsToRepairKeyCuratedAssetForMemories:v8];
  }
  v9 = [v4 primaryAsset];
  [v9 fetchColorNormalizationData];

  if ([v9 isEligibleForAutoPlayback])
  {
    [v9 fetchPropertySetsIfNeeded];
    [v9 photoIrisProperties];
  }
  return v4;
}

+ (id)fastMemoryInfoWithMemory:(id)a3
{
  id v3 = (PHAssetCollection *)a3;
  id v4 = objc_alloc_init(PXMemoryInfo);
  assetCollection = v4->_assetCollection;
  v4->_assetCollection = v3;
  uint64_t v6 = v3;

  uint64_t v7 = [(PHAssetCollection *)v6 localizedTitle];
  localizedTitle = v4->_localizedTitle;
  v4->_localizedTitle = (NSString *)v7;

  uint64_t v9 = [(PHAssetCollection *)v6 localizedSubtitle];
  localizedDateText = v4->_localizedDateText;
  v4->_localizedDateText = (NSString *)v9;

  return v4;
}

@end