@interface PHMemory(PXSelectionAssetContainer)
- (id)px_fetchContainedAssets;
- (uint64_t)px_canPerformFavoriteAction;
- (uint64_t)px_isEmpty;
@end

@implementation PHMemory(PXSelectionAssetContainer)

- (id)px_fetchContainedAssets
{
  v2 = +[PXMemoriesFeedSettings sharedInstance];
  uint64_t v3 = [v2 sharingBehavior];

  if (v3 == 2)
  {
    uint64_t v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1 options:0];
LABEL_7:
    v6 = (void *)v7;
    goto LABEL_9;
  }
  if (v3 == 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:a1];
    goto LABEL_7;
  }
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F39150];
    v5 = [a1 photoLibrary];
    v6 = [v4 emptyFetchResultWithPhotoLibrary:v5];
  }
LABEL_9:
  return v6;
}

- (uint64_t)px_canPerformFavoriteAction
{
  return 1;
}

- (uint64_t)px_isEmpty
{
  return 0;
}

@end