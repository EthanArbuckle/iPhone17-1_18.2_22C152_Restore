@interface PXPhotosViewConfigurationForAssetCollection
@end

@implementation PXPhotosViewConfigurationForAssetCollection

id ___PXPhotosViewConfigurationForAssetCollection_block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "px_isRegularAlbum"))
  {

LABEL_4:
    uint64_t v4 = 4144;
    goto LABEL_6;
  }
  int v3 = objc_msgSend(v2, "px_isMemory");

  if (v3) {
    goto LABEL_4;
  }
  uint64_t v4 = 4112;
LABEL_6:
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = v4 | 0x400000;
  if (v5 == 1) {
    v4 |= 0x100000uLL;
  }
  if (v5 == 2) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v4;
  }
  LOWORD(v9) = *(_WORD *)(a1 + 72);
  return +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), 0, v7, v9);
}

@end