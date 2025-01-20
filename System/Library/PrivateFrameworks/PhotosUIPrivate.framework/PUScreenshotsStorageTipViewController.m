@interface PUScreenshotsStorageTipViewController
- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3;
- (id)title;
@end

@implementation PUScreenshotsStorageTipViewController

- (id)title
{
  return PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_SCREENSHOTS_ALBUM_TITLE");
}

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  v5 = [(PUStorageManagementBaseController *)self photoLibrary];
  v6 = objc_msgSend(v5, "px_assetCollectionForSmartAlbumWithSubtype:", 211);

  v7 = [(PUStorageManagementBaseController *)self photoLibrary];
  v8 = +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:1 photoLibrary:v7];

  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v8];
  v10 = (void *)MEMORY[0x1E4F38EE8];
  v11 = [v6 localizedTitle];
  v12 = [v10 transientAssetCollectionWithAssetFetchResult:v9 title:v11];

  v13 = PXPhotosViewConfigurationForAssetCollection();
  StorageTipPXPhotosViewConfigurationForConfiguration(v13, a3);
  objc_claimAutoreleasedReturnValue();

  v14 = [(PUScreenshotsStorageTipViewController *)self title];
  [v13 setTitle:v14];

  return v13;
}

@end