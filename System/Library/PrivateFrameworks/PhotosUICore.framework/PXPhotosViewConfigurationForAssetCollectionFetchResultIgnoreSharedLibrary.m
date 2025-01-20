@interface PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary
@end

@implementation PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary

void ___PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "setPhotoLibrary:");
    id v3 = v10;
  }
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = [v3 photoLibrary];
  v7 = +[PXContentFilterState defaultFilterStateForContainerCollection:v5 photoLibrary:v6];

  v8 = [v7 predicateForUseCase:v4];
  [v10 setFilterPredicate:v8];

  [v10 setIgnoreSharedLibraryFilters:*(unsigned __int8 *)(a1 + 65)];
  if (*(unsigned char *)(a1 + 65))
  {
    [v10 setLibraryFilterState:0];
    [v10 setLibraryFilter:0];
  }
  if (*(void *)(a1 + 48))
  {
    v9 = +[PXPeopleUtilities peopleArrayFromFastEnumeration:](PXPeopleUtilities, "peopleArrayFromFastEnumeration:");
    [v10 setFilterPersons:v9];
  }
  else
  {
    objc_msgSend(v10, "setFilterPersons:");
  }
  [v10 setFilterSocialGroup:*(void *)(a1 + 56)];
}

PXPhotoKitAssetsDataSourceManager *___PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary_block_invoke_2(uint64_t a1)
{
  v2 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:*(void *)(a1 + 32) containerCollection:*(void *)(a1 + 40) options:*(void *)(a1 + 80)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [(PXPhotosDataSourceConfiguration *)v2 setFetchPropertySets:*(void *)(a1 + 48)];
  [(PXPhotosDataSourceConfiguration *)v2 setExistingKeyAssetsFetchResults:*(void *)(a1 + 56)];
  [(PXPhotosDataSourceConfiguration *)v2 setWantsCurationByDefault:*(unsigned __int8 *)(a1 + 88)];
  [(PXPhotosDataSourceConfiguration *)v2 setAssetContainerProvider:*(void *)(a1 + 72)];
  [(PXPhotosDataSourceConfiguration *)v2 setReverseSortOrder:*(unsigned __int8 *)(a1 + 89)];
  id v3 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v2];
  uint64_t v4 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v3];

  return v4;
}

@end