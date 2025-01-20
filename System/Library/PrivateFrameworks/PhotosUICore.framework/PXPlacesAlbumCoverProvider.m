@interface PXPlacesAlbumCoverProvider
+ (id)_cachedSnapshotPathDark;
+ (id)_cachedSnapshotPathForFilename:(id)a3;
+ (id)_cachedSnapshotPathLight;
- (BOOL)_fetchCachedSnapshotImage:(id *)a3 andIdentifier:(id *)a4 forUserInterfaceStyle:(int64_t)a5;
- (BOOL)_imageExistsWithLocalIdentifier:(id)a3;
- (NSMutableDictionary)cachedPlaceholders;
- (PHAssetCollection)placesCollection;
- (PXPlacesAlbumCoverProvider)initWithDelegate:(id)a3 andPlacesCollection:(id)a4;
- (PXPlacesSnapshotFactory)factory;
- (PXPlacesSnapshotFactoryDelegate)factoryDelegate;
- (id)_placeHolderImageForExtendedTraitCollection:(id)a3;
- (id)backgroundImageNameForType:(int64_t)a3 usingTraitCollection:(id)a4;
- (id)createAlbumPlaceHolderImageUsingTraitCollection:(id)a3;
- (id)placesAlbumCoverProviderLog;
- (int64_t)cachedCount;
- (void)requestAssetCountWithForcedRefresh:(BOOL)a3 completion:(id)a4;
- (void)requestPlacesAlbumCover:(id)a3 snapshotTraitCollection:(id)a4 completion:(id)a5;
- (void)setCachedCount:(int64_t)a3;
- (void)setCachedPlaceholders:(id)a3;
- (void)setFactory:(id)a3;
- (void)setFactoryDelegate:(id)a3;
- (void)setPlacesCollection:(id)a3;
@end

@implementation PXPlacesAlbumCoverProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPlaceholders, 0);
  objc_storeStrong((id *)&self->_placesCollection, 0);
  objc_storeStrong((id *)&self->_factoryDelegate, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_requestsQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImage, 0);
}

- (void)setCachedPlaceholders:(id)a3
{
}

- (NSMutableDictionary)cachedPlaceholders
{
  return self->_cachedPlaceholders;
}

- (void)setPlacesCollection:(id)a3
{
}

- (PHAssetCollection)placesCollection
{
  return self->_placesCollection;
}

- (void)setFactoryDelegate:(id)a3
{
}

- (PXPlacesSnapshotFactoryDelegate)factoryDelegate
{
  return self->_factoryDelegate;
}

- (void)setFactory:(id)a3
{
}

- (id)placesAlbumCoverProviderLog
{
  if (placesAlbumCoverProviderLog_onceToken != -1) {
    dispatch_once(&placesAlbumCoverProviderLog_onceToken, &__block_literal_global_245);
  }
  v2 = (void *)placesAlbumCoverProviderLog_placesAlbumCoverProviderLog;
  return v2;
}

void __57__PXPlacesAlbumCoverProvider_placesAlbumCoverProviderLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "PlacesAlbumCoverProvider");
  v1 = (void *)placesAlbumCoverProviderLog_placesAlbumCoverProviderLog;
  placesAlbumCoverProviderLog_placesAlbumCoverProviderLog = (uint64_t)v0;
}

- (id)backgroundImageNameForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if ((unint64_t)a3 > 1)
  {
    v10 = @"PXPlacesThumbnailPopover";
    if (a3 != 2) {
      v10 = 0;
    }
    if (a3 == 5) {
      v9 = @"PXPlacesThumbnailPopoverInfoPanel";
    }
    else {
      v9 = v10;
    }
  }
  else
  {
    uint64_t v7 = [v5 userInterfaceIdiom];
    uint64_t v8 = [v6 layoutSizeSubclass];
    v9 = 0;
    switch(v7)
    {
      case 0:
      case 2:
        v9 = @"PXPlacesAlbumCover-iPad";
        break;
      case 1:
        if ((unint64_t)(v8 - 1) >= 3) {
          v9 = 0;
        }
        else {
          v9 = off_1E5DB2F30[v8 - 1];
        }
        break;
      case 4:
        v9 = @"PXPlacesAlbumCover-OSX";
        break;
      default:
        break;
    }
  }

  return v9;
}

- (id)createAlbumPlaceHolderImageUsingTraitCollection:(id)a3
{
  v3 = [(PXPlacesAlbumCoverProvider *)self backgroundImageNameForType:0 usingTraitCollection:a3];
  v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v3);

  return v4;
}

- (BOOL)_imageExistsWithLocalIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F38EB8];
  id v13 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  uint64_t v7 = [v5 arrayWithObjects:&v13 count:1];
  uint64_t v8 = [(PHAssetCollection *)self->_placesCollection photoLibrary];
  v9 = [v8 librarySpecificFetchOptions];
  v10 = [v4 fetchAssetsWithLocalIdentifiers:v7 options:v9];

  if (v10) {
    BOOL v11 = [v10 count] != 0;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_fetchCachedSnapshotImage:(id *)a3 andIdentifier:(id *)a4 forUserInterfaceStyle:(int64_t)a5
{
  switch(a5)
  {
    case 2:
      uint64_t v7 = +[PXPlacesAlbumCoverProvider _cachedSnapshotPathDark];
LABEL_7:
      uint64_t v8 = (void *)v7;
      goto LABEL_9;
    case 1:
      uint64_t v7 = +[PXPlacesAlbumCoverProvider _cachedSnapshotPathLight];
      goto LABEL_7;
    case 0:
      PXAssertGetLog();
  }
  uint64_t v8 = 0;
LABEL_9:
  CFURLRef v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  v10 = CGImageSourceCreateWithURL(v9, 0);
  if (v10)
  {
    BOOL v11 = v10;
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
    CFDictionaryRef v13 = v12;
    if (v12)
    {
      uint64_t v14 = [(__CFDictionary *)v12 objectForKey:*MEMORY[0x1E4F2F800]];
      v15 = [v14 objectForKey:*MEMORY[0x1E4F2F958]];
    }
    else
    {
      v15 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A818]), "initWithImagePath:format:imageType:optimalSourcePixelSize:options:", v8, 10000, 1, 0, 0.0, 0.0);
  v17 = [v16 cachedImage:0];
  v18 = v17;
  if (a3) {
    *a3 = v17;
  }
  if (a4) {
    *a4 = v15;
  }
  if (v18) {
    BOOL v19 = v15 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  BOOL v20 = !v19;

  return v20;
}

- (id)_placeHolderImageForExtendedTraitCollection:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  v4 = (void *)MEMORY[0x1E4FB1830];
  id v5 = [MEMORY[0x1E4FB1618] systemGray4Color];
  v13[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v7 = [v4 configurationWithPaletteColors:v6];
  uint64_t v8 = [v3 configurationByApplyingConfiguration:v7];

  CFURLRef v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2988] scale:3];
  v10 = [v8 configurationByApplyingConfiguration:v9];

  BOOL v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"map" withConfiguration:v10];

  return v11;
}

- (PXPlacesSnapshotFactory)factory
{
  v2 = self;
  objc_sync_enter(v2);
  factory = v2->_factory;
  if (!factory)
  {
    v4 = [(PHAssetCollection *)v2->_placesCollection photoLibrary];
    id v5 = [[PXPlacesSnapshotFactory alloc] initWithPhotoLibrary:v4];
    id v6 = v2->_factory;
    v2->_factory = v5;

    uint64_t v7 = v2->_factory;
    uint64_t v8 = [(PXPlacesAlbumCoverProvider *)v2 factoryDelegate];
    [(PXPlacesSnapshotFactory *)v7 setDelegate:v8];

    CFURLRef v9 = v2->_factory;
    v10 = [(PXPlacesAlbumCoverProvider *)v2 placesCollection];
    [(PXPlacesSnapshotFactory *)v9 setPlacesCollection:v10];

    factory = v2->_factory;
  }
  BOOL v11 = factory;
  objc_sync_exit(v2);

  return v11;
}

- (void)requestAssetCountWithForcedRefresh:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  backgroundQueue = self->_backgroundQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PXPlacesAlbumCoverProvider_requestAssetCountWithForcedRefresh_completion___block_invoke;
  v9[3] = &unk_1E5DB2F10;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(backgroundQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __76__PXPlacesAlbumCoverProvider_requestAssetCountWithForcedRefresh_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained factory];
  [v2 requestAssetCountWithForcedRefresh:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 32)];
}

- (void)requestPlacesAlbumCover:(id)a3 snapshotTraitCollection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, uint64_t, int64_t, void))a5;
  id v11 = [(PXPlacesAlbumCoverProvider *)self placesAlbumCoverProviderLog];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  CFDictionaryRef v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchCachedPlacesCover", "", (uint8_t *)buf, 2u);
  }

  int64_t v15 = [(PXPlacesAlbumCoverProvider *)self cachedCount];
  if (!self->_cachedSnapshotImage)
  {
    if (self->_cachedSnapshotImageIdentifier)
    {
      if (-[PXPlacesAlbumCoverProvider _imageExistsWithLocalIdentifier:](self, "_imageExistsWithLocalIdentifier:"))
      {
        if (!v10) {
          goto LABEL_15;
        }
        goto LABEL_6;
      }
      cachedSnapshotImage = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = 0;

      cachedSnapshotImageIdentifier = self->_cachedSnapshotImageIdentifier;
      self->_cachedSnapshotImageIdentifier = 0;
    }
    else if (!v10)
    {
      goto LABEL_15;
    }
    v18 = [(PXPlacesAlbumCoverProvider *)self _placeHolderImageForExtendedTraitCollection:v8];
    v10[2](v10, v18, 1, v15, 0);

    goto LABEL_15;
  }
  if (v10) {
LABEL_6:
  }
    ((void (*)(void (**)(id, void *, uint64_t, int64_t, void)))v10[2])(v10);
LABEL_15:
  BOOL v19 = v14;
  BOOL v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v20, OS_SIGNPOST_INTERVAL_END, v12, "FetchCachedPlacesCover", "", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  backgroundQueue = self->_backgroundQueue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke;
  v25[3] = &unk_1E5DD2078;
  objc_copyWeak(&v29, buf);
  id v26 = v8;
  id v27 = v9;
  id v28 = v10;
  v22 = v10;
  id v23 = v9;
  id v24 = v8;
  dispatch_async(backgroundQueue, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(buf);
}

void __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(PXPlacesUtils);
    v4 = [(PXPlacesUtils *)v3 pkExtendedTraitCollectionFromPXExtendedTraitCollection:*(void *)(a1 + 32)];
    [v4 setTraitCollectionForMapKit:*(void *)(a1 + 40)];
    id v5 = objc_alloc_init(PXPlacesSnapshotOptions);
    [(PXPlacesSnapshotOptions *)v5 setExtendedTraitCollection:v4];
    id v6 = objc_alloc_init(PXPlacesGeotaggableMediaProvider);
    [(PXPlacesSnapshotOptions *)v5 setGeotaggableInformationDelegate:v6];

    uint64_t v7 = +[PXPlacesAlbumCoverProvider _cachedSnapshotPathLight];
    id v8 = [v7 stringByDeletingLastPathComponent];
    [(PXPlacesSnapshotOptions *)v5 setCacheDirectoryPath:v8];

    [(PXPlacesSnapshotOptions *)v5 setQueue:WeakRetained[4]];
    [(PXPlacesSnapshotOptions *)v5 setShouldSkipPlaceholder:1];
    id v9 = [WeakRetained factory];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_2;
    v10[3] = &unk_1E5DB2EE8;
    v10[4] = WeakRetained;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    [v9 requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:v5 andCompletion:v10];
  }
}

void __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  [*(id *)(a1 + 32) setCachedCount:a3];
  id v16 = 0;
  id v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_fetchCachedSnapshotImage:andIdentifier:forUserInterfaceStyle:", &v16, &v15, objc_msgSend(*(id *)(a1 + 40), "userInterfaceStyle"));
  id v7 = v16;
  id v8 = v15;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, void, uint64_t, id))(v9 + 16))(v9, v7, 0, a3, v6);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_3;
  block[3] = &unk_1E5DD0F30;
  block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

void __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    objc_storeStrong((id *)(v1 + 8), *(id *)(a1 + 40));
    v3 = *(void **)(a1 + 48);
    v4 = (id *)(*(void *)(a1 + 32) + 16);
    objc_storeStrong(v4, v3);
  }
}

- (void)setCachedCount:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_cachedCount = a3;
  objc_sync_exit(obj);
}

- (int64_t)cachedCount
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t cachedCount = v2->_cachedCount;
  objc_sync_exit(v2);

  return cachedCount;
}

- (PXPlacesAlbumCoverProvider)initWithDelegate:(id)a3 andPlacesCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXPlacesAlbumCoverProvider;
  uint64_t v9 = [(PXPlacesAlbumCoverProvider *)&v22 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factoryDelegate, a3);
    objc_storeStrong((id *)&v10->_placesCollection, a4);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.places.AlbumCoverProvider-Background", v12);
    backgroundQueue = v10->_backgroundQueue;
    v10->_backgroundQueue = (OS_dispatch_queue *)v13;

    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.photos.places.AlbumCoverProvider-Requests", v16);
    requestsQueue = v10->_requestsQueue;
    v10->_requestsQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedPlaceholders = v10->_cachedPlaceholders;
    v10->_cachedPlaceholders = (NSMutableDictionary *)v19;
  }
  return v10;
}

+ (id)_cachedSnapshotPathForFilename:(id)a3
{
  uint64_t v3 = _cachedSnapshotPathForFilename__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_cachedSnapshotPathForFilename__onceToken, &__block_literal_global_203);
  }
  id v5 = [(id)_cachedSnapshotPathForFilename__systemLibraryPathManager photoDirectoryWithType:28 additionalPathComponents:v4];

  return v5;
}

void __61__PXPlacesAlbumCoverProvider__cachedSnapshotPathForFilename___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  uint64_t v1 = (void *)_cachedSnapshotPathForFilename__systemLibraryPathManager;
  _cachedSnapshotPathForFilename__systemLibraryPathManager = v0;
}

+ (id)_cachedSnapshotPathDark
{
  if (_cachedSnapshotPathDark_onceToken != -1) {
    dispatch_once(&_cachedSnapshotPathDark_onceToken, &__block_literal_global_201);
  }
  v2 = (void *)_cachedSnapshotPathDark_cachedSnapshotPathDark;
  return v2;
}

void __53__PXPlacesAlbumCoverProvider__cachedSnapshotPathDark__block_invoke()
{
  uint64_t v0 = +[PXPlacesAlbumCoverProvider _cachedSnapshotPathForFilename:@"PXPlacesAlbumImageCached_Dark.jpg"];
  uint64_t v1 = (void *)_cachedSnapshotPathDark_cachedSnapshotPathDark;
  _cachedSnapshotPathDark_cachedSnapshotPathDark = v0;
}

+ (id)_cachedSnapshotPathLight
{
  if (_cachedSnapshotPathLight_onceToken != -1) {
    dispatch_once(&_cachedSnapshotPathLight_onceToken, &__block_literal_global_41380);
  }
  v2 = (void *)_cachedSnapshotPathLight_cachedSnapshotPathLight;
  return v2;
}

void __54__PXPlacesAlbumCoverProvider__cachedSnapshotPathLight__block_invoke()
{
  uint64_t v0 = +[PXPlacesAlbumCoverProvider _cachedSnapshotPathForFilename:@"PXPlacesAlbumImageCached.jpg"];
  uint64_t v1 = (void *)_cachedSnapshotPathLight_cachedSnapshotPathLight;
  _cachedSnapshotPathLight_cachedSnapshotPathLight = v0;
}

@end