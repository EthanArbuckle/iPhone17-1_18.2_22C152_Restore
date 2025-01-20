@interface PXAssetsRecoveryCountsManager
- (BOOL)shouldShowBanner;
- (NSDate)bannerDismissalDate;
- (NSString)bannerActionTitle;
- (NSString)bannerSubtitle;
- (NSString)bannerTitle;
- (OS_dispatch_queue)queue;
- (PHAsset)lastRecoveredAsset;
- (PHAssetCollection)recoveredAssetsSmartAlbum;
- (PHFetchResult)recoveredAssetsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXAssetsRecoveryCountsManager)init;
- (PXAssetsRecoveryCountsManager)initWithPhotoLibrary:(id)a3;
- (int64_t)assetCollectionSubtype;
- (void)_startFetchingRecoveredAssets;
- (void)_updateShouldShowBanner;
- (void)markAsRead;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4;
- (void)setBannerDismissalDate:(id)a3;
- (void)setRecoveredAssetsFetchResult:(id)a3;
- (void)setShouldShowBanner:(BOOL)a3;
@end

@implementation PXAssetsRecoveryCountsManager

- (BOOL)shouldShowBanner
{
  return self->_shouldShowBanner;
}

uint64_t __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRecoveredAssetsFetchResult:*(void *)(a1 + 40)];
}

uint64_t __56__PXAssetsRecoveryCountsManager__updateShouldShowBanner__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldShowBanner:*(unsigned __int8 *)(a1 + 40)];
}

- (PXAssetsRecoveryCountsManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXAssetsRecoveryCountsManager;
  v6 = [(PXAssetsRecoveryCountsManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend(v5, "px_registerChangeObserver:", v7);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.assetsRecoveryCounts-fetch", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    [(PXAssetsRecoveryCountsManager *)v7 _startFetchingRecoveredAssets];
  }

  return v7;
}

- (void)_startFetchingRecoveredAssets
{
  v3 = [(PXAssetsRecoveryCountsManager *)self photoLibrary];
  v4 = objc_msgSend(v3, "px_localDefaults");

  id v5 = [v4 dateForKey:@"AssetsRecoveryBannerDismissalDate"];
  [(PXAssetsRecoveryCountsManager *)self setBannerDismissalDate:v5];

  [v4 registerChangeObserver:self context:PXPhotoLibraryLocalDefaultsObservationContext];
  v6 = [(PXAssetsRecoveryCountsManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)setBannerDismissalDate:(id)a3
{
  id v5 = (NSDate *)a3;
  v6 = self->_bannerDismissalDate;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSDate *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bannerDismissalDate, a3);
      dispatch_queue_t v9 = [(PXAssetsRecoveryCountsManager *)self queue];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      objc_super v12 = __56__PXAssetsRecoveryCountsManager_setBannerDismissalDate___block_invoke;
      v13 = &unk_1E5DD32A8;
      v14 = self;
      v15 = v5;
      dispatch_async(v9, &v10);

      [(PXAssetsRecoveryCountsManager *)self _updateShouldShowBanner];
    }
  }
}

- (PHAssetCollection)recoveredAssetsSmartAlbum
{
  recoveredAssetsSmartAlbum = self->_recoveredAssetsSmartAlbum;
  if (!recoveredAssetsSmartAlbum)
  {
    v4 = [(PXAssetsRecoveryCountsManager *)self photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];

    v6 = objc_msgSend(MEMORY[0x1E4F38EE8], "fetchAssetCollectionsWithType:subtype:options:", 2, -[PXAssetsRecoveryCountsManager assetCollectionSubtype](self, "assetCollectionSubtype"), v5);
    v7 = [v6 firstObject];
    char v8 = self->_recoveredAssetsSmartAlbum;
    self->_recoveredAssetsSmartAlbum = v7;

    recoveredAssetsSmartAlbum = self->_recoveredAssetsSmartAlbum;
  }
  return recoveredAssetsSmartAlbum;
}

void __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v14[0] = *MEMORY[0x1E4F39458];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 setFetchPropertySets:v4];

  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
  v13 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v3 setInternalSortDescriptors:v6];

  v7 = (void *)MEMORY[0x1E4F38EB8];
  char v8 = [*(id *)(a1 + 32) recoveredAssetsSmartAlbum];
  dispatch_queue_t v9 = [v7 fetchAssetsInAssetCollection:v8 options:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke_2;
  block[3] = &unk_1E5DD32A8;
  block[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)assetCollectionSubtype
{
  return 1000000219;
}

- (void)setRecoveredAssetsFetchResult:(id)a3
{
  id v5 = (PHFetchResult *)a3;
  p_recoveredAssetsFetchResult = &self->_recoveredAssetsFetchResult;
  v7 = self->_recoveredAssetsFetchResult;
  if (v7 == v5)
  {
  }
  else
  {
    char v8 = v7;
    char v9 = [(PHFetchResult *)v5 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(PHFetchResult *)*p_recoveredAssetsFetchResult count];
      objc_storeStrong((id *)&self->_recoveredAssetsFetchResult, a3);
      if (v10 != [(PHFetchResult *)*p_recoveredAssetsFetchResult count])
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __63__PXAssetsRecoveryCountsManager_setRecoveredAssetsFetchResult___block_invoke;
        v11[3] = &unk_1E5DD0FA8;
        v11[4] = self;
        [(PXAssetsRecoveryCountsManager *)self performChanges:v11];
      }
      [(PXAssetsRecoveryCountsManager *)self _updateShouldShowBanner];
    }
  }
}

- (void)_updateShouldShowBanner
{
  v3 = [(PXAssetsRecoveryCountsManager *)self recoveredAssetsFetchResult];
  v4 = [v3 firstObject];

  id v5 = [v4 curationProperties];
  v6 = [v5 addedDate];

  v7 = [(PXAssetsRecoveryCountsManager *)self bannerDismissalDate];
  char v8 = v7;
  if (v6)
  {
    if (v7) {
      BOOL v9 = [v7 compare:v6] == -1;
    }
    else {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PXAssetsRecoveryCountsManager__updateShouldShowBanner__block_invoke;
  v10[3] = &unk_1E5DCEB78;
  v10[4] = self;
  BOOL v11 = v9;
  [(PXAssetsRecoveryCountsManager *)self performChanges:v10];
}

- (PHFetchResult)recoveredAssetsFetchResult
{
  return self->_recoveredAssetsFetchResult;
}

- (NSDate)bannerDismissalDate
{
  return self->_bannerDismissalDate;
}

- (void)setShouldShowBanner:(BOOL)a3
{
  if (self->_shouldShowBanner != a3)
  {
    self->_shouldShowBanner = a3;
    [(PXAssetsRecoveryCountsManager *)self signalChange:1];
  }
}

- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"AssetsRecoveryBannerDismissalDate"])
  {
    v5;
    px_dispatch_on_main_queue();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveredAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bannerDismissalDate, 0);
  objc_storeStrong((id *)&self->_recoveredAssetsSmartAlbum, 0);
}

uint64_t __80__PXAssetsRecoveryCountsManager_photoLibraryLocalDefaults_didChangeValueForKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) dateForKey:@"AssetsRecoveryBannerDismissalDate"];
  [*(id *)(a1 + 32) setBannerDismissalDate:v2];

  v3 = *(void **)(a1 + 32);
  return [v3 _updateShouldShowBanner];
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_recoveredAssetsFetchResult)
  {
    v7 = objc_msgSend(v10, "changeDetailsForFetchResult:");
    if (v7)
    {
      char v8 = v7;
      BOOL v9 = [v7 fetchResultAfterChanges];
      [(PXAssetsRecoveryCountsManager *)self setRecoveredAssetsFetchResult:v9];
    }
  }
}

- (void)markAsRead
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(PXAssetsRecoveryCountsManager *)self setBannerDismissalDate:v3];
}

void __56__PXAssetsRecoveryCountsManager_setBannerDismissalDate___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) photoLibrary];
  v2 = objc_msgSend(v3, "px_localDefaults");
  [v2 setDate:*(void *)(a1 + 40) forKey:@"AssetsRecoveryBannerDismissalDate"];
}

uint64_t __63__PXAssetsRecoveryCountsManager_setRecoveredAssetsFetchResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:2];
}

- (PHAsset)lastRecoveredAsset
{
  v2 = [(PXAssetsRecoveryCountsManager *)self recoveredAssetsFetchResult];
  id v3 = [v2 firstObject];

  return (PHAsset *)v3;
}

- (NSString)bannerActionTitle
{
  return (NSString *)PXLocalizedStringFromTable(@"PXAssetsRecoveryBannerActionTitle", @"PhotosUICore");
}

- (NSString)bannerSubtitle
{
  v2 = NSString;
  id v3 = +[PXLocalization currentDeviceCanonicalModel];
  v4 = [v2 stringWithFormat:@"PXAssetsRecoveryBannerSubtitle_%@", v3];

  id v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");

  return (NSString *)v5;
}

- (NSString)bannerTitle
{
  v2 = [(PXAssetsRecoveryCountsManager *)self recoveredAssetsFetchResult];
  [v2 count];
  id v3 = PXLocalizedCountsDescription(@"PXAssetsRecoveryBannerTitle");

  return (NSString *)v3;
}

- (PXAssetsRecoveryCountsManager)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsRecoveryCountsManager.m", 46, @"%s is not available as initializer", "-[PXAssetsRecoveryCountsManager init]");

  abort();
}

@end