@interface PULargeVideoStorageTipViewController
- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3;
- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3;
- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3;
- (id)title;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PULargeVideoStorageTipViewController

- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v5 = +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:2 photoLibrary:v4];

  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.originalFilesize" ascending:0];
  v19[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v5 setInternalSortDescriptors:v7];

  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = [v5 internalPredicate];
  v10 = +[PUStorageManagementUtility predicateForMinimumVideoSize];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v12 = [v8 andPredicateWithSubpredicates:v11];
  [v5 setInternalPredicate:v12];

  v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithMediaType:2 options:v5];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithAssetFetchResult:v13 options:4097];
  v15 = [v3 filterPredicate];

  [v14 setFilterPredicate:v15];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v14];

  return v16;
}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F90508];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)MEMORY[0x1E4F39150];
  v8 = [(PUStorageManagementBaseController *)self photoLibrary];
  v9 = [v7 emptyFetchResultWithPhotoLibrary:v8];
  v10 = (void *)[v6 initWithAssetFetchResult:v9 options:0];

  v11 = [v5 filterPredicate];

  [v10 setFilterPredicate:v11];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v10];

  return v12;
}

- (id)title
{
  return PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_LARGE_VIDEOS_ALBUM_TITLE");
}

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  id v5 = PXPhotosViewConfigurationForDataSourceProvider();
  StorageTipPXPhotosViewConfigurationForConfiguration(v5, a3);
  objc_claimAutoreleasedReturnValue();

  id v6 = [(PULargeVideoStorageTipViewController *)self title];
  [v5 setTitle:v6];

  return v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PULargeVideoStorageTipViewController *)self navigationController];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();

  if (v6 != v7)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"PUStorageManagementICPLEnableTipSizeRefreshRequired" object:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)PULargeVideoStorageTipViewController;
  [(PULargeVideoStorageTipViewController *)&v9 viewDidDisappear:v3];
}

@end