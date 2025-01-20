@interface PXWallpaperAssetVideoContentProvider
+ (id)_loadingQueue;
- (PHAsset)asset;
- (PXWallpaperAssetVideoContentProvider)init;
- (PXWallpaperAssetVideoContentProvider)initWithWallpaperAsset:(id)a3;
- (id)contentIdentifier;
- (void)_handleLoadedPlayerItem:(id)a3 priority:(int64_t)a4 error:(id)a5;
- (void)_loadWallpaperAssetWithPriority:(int64_t)a3;
- (void)beginLoadingWithPriority:(int64_t)a3;
- (void)cancelLoading;
- (void)makeUniqueContentIdentifier;
@end

@implementation PXWallpaperAssetVideoContentProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (id)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)_handleLoadedPlayerItem:(id)a3 priority:(int64_t)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [(id)objc_opt_class() _loadingQueue];
  dispatch_assert_queue_V2(v10);

  v11 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v19 = v8;
    __int16 v20 = 2113;
    id v21 = v9;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Handling loaded player item: %{private}@, error: %{private}@", buf, 0x16u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke;
  v14[3] = &unk_1E5DD1508;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke_2;
  v5[3] = &unk_1E5DB7468;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performChanges:v5];
}

void __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke_2(uint64_t a1)
{
  v2 = [PXVideoContentProviderLoadingResult alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v8[0] = *MEMORY[0x1E4F1FA20];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  id v7 = [(PXVideoContentProviderLoadingResult *)v2 initWithPlayerItem:v3 url:0 timeRange:v8 timeRangeMapper:0 error:v4 priority:v5 description:@"Loaded"];
  [*(id *)(a1 + 32) setLoadingResult:v7];
}

- (void)_loadWallpaperAssetWithPriority:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F39358]);
  long long v6 = [(PXWallpaperAssetVideoContentProvider *)self asset];
  id v7 = (void *)[v5 initWithPhotoAsset:v6];

  uint64_t v8 = [v7 segmentationResourceURL];
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PXWallpaperAssetVideoContentProvider__loadWallpaperAssetWithPriority___block_invoke;
    v10[3] = &unk_1E5DB7440;
    v10[4] = self;
    v10[5] = a3;
    [MEMORY[0x1E4F8A338] loadSettlingEffectVideoDataFromURL:v8 completion:v10];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXVideoContentProviderErrorDomain" code:1 userInfo:0];
    [(PXWallpaperAssetVideoContentProvider *)self _handleLoadedPlayerItem:0 priority:a3 error:v9];
  }
}

void __72__PXWallpaperAssetVideoContentProvider__loadWallpaperAssetWithPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F16330] assetWithData:v5 contentType:*MEMORY[0x1E4F15AB0] options:MEMORY[0x1E4F1CC08]];
    id v9 = [MEMORY[0x1E4F16620] playerItemWithAsset:v8];
    [*(id *)(a1 + 32) _handleLoadedPlayerItem:v9 priority:*(void *)(a1 + 40) error:0];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    if (v6)
    {
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v13[0] = v6;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v8 = [v10 errorWithDomain:@"PXVideoContentProviderErrorDomain" code:1 userInfo:v11];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXVideoContentProviderErrorDomain" code:1 userInfo:0];
    }
    [*(id *)(a1 + 32) _handleLoadedPlayerItem:0 priority:*(void *)(a1 + 40) error:v8];
  }
}

- (void)cancelLoading
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXWallpaperAssetVideoContentProvider.m", 59, @"Method %s is a responsibility of subclass %@", "-[PXWallpaperAssetVideoContentProvider cancelLoading]", v6 object file lineNumber description];

  abort();
}

- (void)beginLoadingWithPriority:(int64_t)a3
{
  id v5 = [(id)objc_opt_class() _loadingQueue];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXWallpaperAssetVideoContentProvider_beginLoadingWithPriority___block_invoke;
  block[3] = &unk_1E5DD0260;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __65__PXWallpaperAssetVideoContentProvider_beginLoadingWithPriority___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadWallpaperAssetWithPriority:*(void *)(a1 + 40)];
}

- (void)makeUniqueContentIdentifier
{
  id v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = [v5 UUIDString];
  contentIdentifier = self->_contentIdentifier;
  self->_contentIdentifier = v3;
}

- (PXWallpaperAssetVideoContentProvider)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXWallpaperAssetVideoContentProvider.m", 39, @"%s is not available as initializer", "-[PXWallpaperAssetVideoContentProvider init]");

  abort();
}

- (PXWallpaperAssetVideoContentProvider)initWithWallpaperAsset:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXWallpaperAssetVideoContentProvider;
  id v6 = [(PXWallpaperAssetVideoContentProvider *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    uint64_t v8 = [v5 uuid];
    uint64_t v9 = [v8 stringByAppendingString:@"-wallpaper"];
    contentIdentifier = v7->_contentIdentifier;
    v7->_contentIdentifier = (NSString *)v9;
  }
  return v7;
}

+ (id)_loadingQueue
{
  if (_loadingQueue_onceToken != -1) {
    dispatch_once(&_loadingQueue_onceToken, &__block_literal_global_80654);
  }
  v2 = (void *)_loadingQueue_loadingQueue;
  return v2;
}

void __53__PXWallpaperAssetVideoContentProvider__loadingQueue__block_invoke()
{
}

@end