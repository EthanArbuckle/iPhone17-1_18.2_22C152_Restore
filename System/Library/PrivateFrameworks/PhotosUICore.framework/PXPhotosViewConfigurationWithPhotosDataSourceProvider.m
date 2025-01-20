@interface PXPhotosViewConfigurationWithPhotosDataSourceProvider
@end

@implementation PXPhotosViewConfigurationWithPhotosDataSourceProvider

PXPhotoKitAssetsDataSourceManager *___PXPhotosViewConfigurationWithPhotosDataSourceProvider_block_invoke(uint64_t a1)
{
  v2 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSourceProvider:*(void *)(a1 + 32)];
  [(PXPhotoKitAssetsDataSourceManager *)v2 setLibraryFilter:*(void *)(a1 + 48)];
  [(PXPhotoKitAssetsDataSourceManager *)v2 setIgnoreSharedLibraryFilters:*(unsigned __int8 *)(a1 + 64)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___PXPhotosViewConfigurationWithPhotosDataSourceProvider_block_invoke_2;
  v6[3] = &unk_1E5DD1480;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  [(PXPhotoKitAssetsDataSourceManager *)v2 performChanges:v6];

  return v2;
}

void ___PXPhotosViewConfigurationWithPhotosDataSourceProvider_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v6 = +[PXContentFilterState defaultFilterStateForContainerCollection:0 photoLibrary:v3];
  v5 = [v6 predicateForUseCase:*(void *)(a1 + 40)];
  [v4 setFilterPredicate:v5];
}

@end