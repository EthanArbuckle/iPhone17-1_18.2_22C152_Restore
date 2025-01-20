@interface PUDuplicatesStorageTipViewController
- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3;
- (id)title;
@end

@implementation PUDuplicatesStorageTipViewController

- (id)title
{
  return PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_DUPLICATES_ALBUM_TITLE");
}

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  v5 = [(PUStorageManagementBaseController *)self photoLibrary];
  v6 = objc_msgSend(v5, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000212);

  v7 = PXDeduplicationPhotosViewConfiguration();
  StorageTipPXPhotosViewConfigurationForConfiguration(v7, a3);
  objc_claimAutoreleasedReturnValue();

  v8 = [(PUDuplicatesStorageTipViewController *)self title];
  [v7 setTitle:v8];

  [v7 setIgnoreFilterPredicateAssert:1];
  v9 = [v7 dataSourceManager];
  [v9 performChanges:&__block_literal_global_66111];

  return v7;
}

void __81__PUDuplicatesStorageTipViewController_photosViewConfigurationWithShouldExpunge___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PUStorageManagementUtility predicateForUploadedAssetFetch];
  [v2 setFilterPredicate:v3];
}

@end