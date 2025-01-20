@interface PXImportMediaProvider
- (BOOL)hasBeenIdle;
- (BOOL)thumbnailExistsForModel:(id)a3;
- (BOOL)thumbnailExistsForModel:(id)a3 atSize:(unint64_t)a4;
- (CGSize)gridItemSize;
- (NSMutableDictionary)extensionPlaceholderCachesByRequestSize;
- (NSMutableDictionary)thumbnailRequestsByID;
- (PXImportImageCache)imageCache;
- (PXImportMediaProvider)initWithImageFormat:(unsigned __int16)a3;
- (PXLoadingStatusManager)loadingStatusManager;
- (double)idleTimeOut;
- (id)_newPlaceholderImageForItemWithExtension:(id)a3 size:(CGSize)a4;
- (id)_placeholderExtensionForItem:(id)a3;
- (id)_placeholderForItem:(id)a3 size:(unint64_t)a4;
- (id)cachedImageForModel:(id)a3 atSize:(unint64_t)a4;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)imageOfSize:(unint64_t)a3 forModel:(id)a4 localCacheOnly:(BOOL)a5 priority:(unsigned __int8)a6 completion:(id)a7;
- (int64_t)imageRequestsInflight;
- (int64_t)lastRequestsInflight;
- (int64_t)nextRequestID;
- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageForImportItem:(id)a3 ofSize:(unint64_t)a4 completion:(id)a5;
- (int64_t)requestImageForImportItem:(id)a3 ofSize:(unint64_t)a4 priority:(unsigned __int8)a5 completion:(id)a6;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (unsigned)thumbnailImageFormat;
- (void)cancelImageRequest:(int64_t)a3;
- (void)performIdleProcessingIfNecessary;
- (void)ppt_sendMediaProviderDidProcessAsset:(id)a3;
- (void)sendMediaProviderThumbnailingBecameIdle;
- (void)setExtensionPlaceholderCachesByRequestSize:(id)a3;
- (void)setHasBeenIdle:(BOOL)a3;
- (void)setImageCache:(id)a3;
- (void)setImageRequestsInflight:(int64_t)a3;
- (void)setLastRequestsInflight:(int64_t)a3;
- (void)setLoadingStatusManager:(id)a3;
- (void)setThumbnailRequestsByID:(id)a3;
@end

@implementation PXImportMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPlaceholderCachesByRequestSize, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_thumbnailRequestsByID, 0);
  objc_storeStrong((id *)&self->loadingStatusManager, 0);
}

- (void)setHasBeenIdle:(BOOL)a3
{
  self->_hasBeenIdle = a3;
}

- (BOOL)hasBeenIdle
{
  return self->_hasBeenIdle;
}

- (void)setExtensionPlaceholderCachesByRequestSize:(id)a3
{
}

- (NSMutableDictionary)extensionPlaceholderCachesByRequestSize
{
  return self->_extensionPlaceholderCachesByRequestSize;
}

- (void)setLastRequestsInflight:(int64_t)a3
{
  self->_lastRequestsInflight = a3;
}

- (int64_t)lastRequestsInflight
{
  return self->_lastRequestsInflight;
}

- (void)setImageRequestsInflight:(int64_t)a3
{
  self->_imageRequestsInflight = a3;
}

- (int64_t)imageRequestsInflight
{
  return self->_imageRequestsInflight;
}

- (void)setImageCache:(id)a3
{
}

- (void)setThumbnailRequestsByID:(id)a3
{
}

- (NSMutableDictionary)thumbnailRequestsByID
{
  return self->_thumbnailRequestsByID;
}

- (unsigned)thumbnailImageFormat
{
  return self->_thumbnailImageFormat;
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->loadingStatusManager;
}

- (int64_t)nextRequestID
{
  return (int)atomic_fetch_add(&self->_nextRequestID, 1u);
}

- (void)sendMediaProviderThumbnailingBecameIdle
{
  v3 = +[PXImportSettings sharedInstance];
  int v4 = [v3 lazyLoadAllAssets];

  if (v4)
  {
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PXImportMediaProvider_sendMediaProviderThumbnailingBecameIdle__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __64__PXImportMediaProvider_sendMediaProviderThumbnailingBecameIdle__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PXImportMediaProviderThumbnailingBecameIdleNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)ppt_sendMediaProviderDidProcessAsset:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PXImportMediaProvider_ppt_sendMediaProviderDidProcessAsset___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__PXImportMediaProvider_ppt_sendMediaProviderDidProcessAsset___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PXImportMediaProviderDidProcessAssetNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (id)_placeholderForItem:(id)a3 size:(unint64_t)a4
{
  id v6 = [(PXImportMediaProvider *)self _placeholderExtensionForItem:a3];
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v8 = [(PXImportMediaProvider *)self extensionPlaceholderCachesByRequestSize];
  v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 objectForKey:v6];
  v11 = (void *)v10;
  if (a4 == 3)
  {
    double v12 = 320.0;
    double v13 = 320.0;
    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    [(PXImportMediaProvider *)self gridItemSize];
    double v12 = v14;
    double v13 = v15;
    if (!v11) {
      goto LABEL_9;
    }
  }
  [v11 size];
  if (v17 == v12 && v16 == v13)
  {
    id v19 = v11;
    goto LABEL_16;
  }
LABEL_9:
  id v19 = -[PXImportMediaProvider _newPlaceholderImageForItemWithExtension:size:](self, "_newPlaceholderImageForItemWithExtension:size:", v6, v12, v13);

  if (v19)
  {
    if (!self->_extensionPlaceholderCachesByRequestSize)
    {
      v20 = [MEMORY[0x1E4F1CA60] dictionary];
      extensionPlaceholderCachesByRequestSize = self->_extensionPlaceholderCachesByRequestSize;
      self->_extensionPlaceholderCachesByRequestSize = v20;
    }
    v22 = [(PXImportMediaProvider *)self extensionPlaceholderCachesByRequestSize];
    v23 = [v22 objectForKeyedSubscript:v7];

    if (!v23)
    {
      v23 = objc_opt_new();
      v24 = [(PXImportMediaProvider *)self extensionPlaceholderCachesByRequestSize];
      [v24 setObject:v23 forKeyedSubscript:v7];
    }
    [v23 setObject:v19 forKey:v6];
    v9 = v23;
  }
LABEL_16:

  return v19;
}

- (CGSize)gridItemSize
{
  double v2 = 160.0;
  double v3 = 160.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_placeholderExtensionForItem:(id)a3
{
  id v3 = a3;
  if ([v3 isJpegPlusRAW])
  {
    id v4 = @"RAW+JPG";
  }
  else if ([v3 isRAW])
  {
    id v4 = @"RAW";
  }
  else
  {
    id v4 = [v3 fileExtension];
  }

  return v4;
}

- (id)_newPlaceholderImageForItemWithExtension:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v41[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v17 = 0;
  }
  else
  {
    v9 = (__CFString *)v6;
    int v10 = [(__CFString *)v9 isEqualToString:@"RAW+JPG"];
    if (v10)
    {

      v9 = @"RAW";
    }
    PLGenericImageNameForExtension();
    id v11 = 0;
    double v12 = (__CFString *)0;
    double v13 = v12;
    if (v10)
    {

      double v13 = @"RAW+JPG";
    }
    double v14 = PLPhotoLibraryServicesFrameworkBundle();
    v39 = v11;
    if (height <= 160.0)
    {
      double v15 = [MEMORY[0x1E4FB1818] imageNamed:v11 inBundle:v14];
      double v16 = 10.0;
    }
    else
    {
      double v15 = 0;
      double v16 = 28.0;
    }
    v18 = (CGFloat *)MEMORY[0x1E4F1DB28];
    if (v13)
    {
      id v19 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:v16];
      uint64_t v20 = *MEMORY[0x1E4FB06F8];
      v41[0] = v19;
      uint64_t v21 = *MEMORY[0x1E4FB0700];
      v40[0] = v20;
      v40[1] = v21;
      v22 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
      v41[1] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

      [(__CFString *)v13 sizeWithAttributes:v23];
      double v38 = v24;
      double v26 = v25;
    }
    else
    {
      id v19 = 0;
      v23 = 0;
      double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    }
    [v15 size];
    double v28 = v27;
    double v30 = v29;
    double v31 = (height - (v26 + v29)) * 0.5;
    v42.double width = width;
    v42.double height = height;
    UIGraphicsBeginImageContextWithOptions(v42, 0, 0.0);
    CGFloat v33 = *v18;
    CGFloat v32 = v18[1];
    v34 = [MEMORY[0x1E4FB1618] clearColor];
    [v34 set];

    v43.origin.x = v33;
    v43.origin.y = v32;
    v43.size.double width = width;
    v43.size.double height = height;
    UIRectFill(v43);
    if (v15)
    {
      v35 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
      [v35 setFill];

      v36 = [v15 imageWithRenderingMode:2];

      objc_msgSend(v36, "drawInRect:", round((width - v28) * 0.5), v31, v28, v30);
    }
    if (v13) {
      -[__CFString drawInRect:withAttributes:](v13, "drawInRect:withAttributes:", v23, round((width - v38) * 0.5), v30 + v31, v38, v26);
    }
    double v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v17;
}

- (double)idleTimeOut
{
  BOOL v2 = [(PXImportMediaProvider *)self hasBeenIdle];
  double result = 0.05;
  if (!v2) {
    return 5.0;
  }
  return result;
}

- (void)performIdleProcessingIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXImportMediaProvider_performIdleProcessingIfNecessary__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__PXImportMediaProvider_performIdleProcessingIfNecessary__block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[7];
  if (!v3 || v3 == v2[8])
  {
    [v2 setHasBeenIdle:1];
    BOOL v2 = *(void **)(a1 + 32);
  }
  uint64_t result = [v2 sendMediaProviderThumbnailingBecameIdle];
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(*(void *)(a1 + 32) + 56);
  return result;
}

- (id)cachedImageForModel:(id)a3 atSize:(unint64_t)a4
{
  uint64_t v10 = 0;
  id v6 = a3;
  v7 = [(PXImportMediaProvider *)self imageCache];
  id v8 = [v7 imageForModel:v6 ofSize:a4 allowLowerResolutions:0 foundSize:&v10];

  return v8;
}

- (BOOL)thumbnailExistsForModel:(id)a3
{
  uint64_t v8 = 0;
  id v4 = a3;
  v5 = [(PXImportMediaProvider *)self imageCache];
  id v6 = [v5 imageForModel:v4 ofSize:3 allowLowerResolutions:1 foundSize:&v8];

  return v6 != 0;
}

- (BOOL)thumbnailExistsForModel:(id)a3 atSize:(unint64_t)a4
{
  uint64_t v10 = 0;
  id v6 = a3;
  v7 = [(PXImportMediaProvider *)self imageCache];
  uint64_t v8 = [v7 imageForModel:v6 ofSize:a4 allowLowerResolutions:0 foundSize:&v10];

  LOBYTE(a4) = v10 == a4;
  return a4;
}

- (int64_t)requestImageForImportItem:(id)a3 ofSize:(unint64_t)a4 priority:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if ([v10 isDeleted])
  {
    BOOL v12 = 1;
  }
  else
  {
    double v13 = [v10 deleteSession];
    BOOL v12 = v13 != 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke;
  v17[3] = &unk_1E5DB2220;
  id v18 = v11;
  id v14 = v11;
  int64_t v15 = [(PXImportMediaProvider *)self imageOfSize:a4 forModel:v10 localCacheOnly:v12 priority:v7 completion:v17];

  return v15;
}

void __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke_2;
  v10[3] = &unk_1E5DB2130;
  id v8 = *(id *)(a1 + 32);
  id v11 = v7;
  id v12 = v8;
  uint64_t v13 = a3;
  char v14 = a4;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (int64_t)requestImageForImportItem:(id)a3 ofSize:(unint64_t)a4 completion:(id)a5
{
  return [(PXImportMediaProvider *)self requestImageForImportItem:a3 ofSize:a4 priority:0 completion:a5];
}

- (int64_t)imageOfSize:(unint64_t)a3 forModel:(id)a4 localCacheOnly:(BOOL)a5 priority:(unsigned __int8)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a7;
  int64_t v13 = [(PXImportMediaProvider *)self nextRequestID];
  char v14 = _importMediaProviderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v19 = PXImportImageRequestSizeDebugDescription(a3);
    uint64_t v20 = [v11 importAsset];
    uint64_t v21 = [v20 fileName];
    *(_DWORD *)buf = 136316418;
    double v29 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]";
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2114;
    CGFloat v33 = v19;
    __int16 v34 = 1024;
    BOOL v35 = v8;
    __int16 v36 = 2048;
    int64_t v37 = v13;
    __int16 v38 = 2112;
    v39 = v21;
    _os_log_debug_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "%s: %@ size = %{public}@ fastpath = %d (entry). Request ID = %lu for %@", buf, 0x3Au);
  }
  int64_t v15 = [(PXImportMediaProvider *)self imageCache];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke;
  v22[3] = &unk_1E5DB21F8;
  BOOL v27 = v8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v12;
  unint64_t v25 = a3;
  int64_t v26 = v13;
  id v16 = v12;
  id v17 = v11;
  [v15 imageForModel:v17 ofSize:a3 allowLowerResolutions:1 completion:v22];

  return v13;
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2;
  v10[3] = &unk_1E5DB21D0;
  id v6 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = a3;
  char v17 = *(unsigned char *)(a1 + 72);
  id v12 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  id v13 = v7;
  uint64_t v16 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_performIdleProcessingIfNecessary object:0];
  BOOL v2 = *(void **)(a1 + 32);
  [v2 idleTimeOut];
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_performIdleProcessingIfNecessary, 0);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3 && *(void *)(a1 + 64) == *(void *)(a1 + 72) || *(unsigned char *)(a1 + 88))
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [*(id *)(a1 + 48) isDeleted] ^ 1;
    uint64_t v3 = *(void **)(a1 + 40);
  }
  id v5 = v3;
  id v6 = [*(id *)(a1 + 48) importAsset];
  id v7 = v5;
  if (!v5)
  {
    id v7 = [*(id *)(a1 + 32) _placeholderForItem:v6 size:*(void *)(a1 + 64)];
    uint64_t v8 = _importMediaProviderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v55 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke_2";
      __int16 v56 = 2112;
      uint64_t v57 = v34;
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v7;
      _os_log_debug_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: using placeholder thumbnail....%@ (uiimge=%@)", buf, 0x20u);
    }
  }
  id v9 = +[PXImportSettings sharedInstance];
  char v10 = [v9 loadActualThumbnails];

  if ((v10 & 1) == 0)
  {
    [v6 loadMetadataAsync:0];
    int v4 = 0;
  }
  BOOL v11 = v5 == 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_61;
  aBlock[3] = &unk_1E5DB2130;
  id v51 = *(id *)(a1 + 56);
  id v12 = v7;
  uint64_t v13 = *(void *)(a1 + 72);
  id v50 = v12;
  uint64_t v52 = v13;
  BOOL v53 = v11;
  uint64_t v14 = (void (**)(void))_Block_copy(aBlock);
  if (v4)
  {
    uint64_t v15 = [[PXImportThumbnailLoadingRequest alloc] initWithImportItem:*(void *)(a1 + 48) requestID:*(void *)(a1 + 80) requestSize:*(void *)(a1 + 64) completionBlock:*(void *)(a1 + 56)];
    uint64_t v16 = [*(id *)(a1 + 48) assetDataRequestForRequestSize:*(void *)(a1 + 64)];
    if (v16)
    {
      [(PXImportThumbnailLoadingRequest *)v15 setAssetDataRequest:v16];
      [*(id *)(a1 + 48) addThumbnailRequest:v15];
      char v17 = [*(id *)(a1 + 48) thumbnailRequestsForRequestSize:*(void *)(a1 + 64)];
      id v18 = _importMediaProviderLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = *(void *)(a1 + 80);
        uint64_t v41 = *(void *)(a1 + 48);
        uint64_t v36 = [v17 count];
        uint64_t v37 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        v55 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke_2";
        __int16 v56 = 2048;
        uint64_t v57 = v35;
        __int16 v58 = 2112;
        uint64_t v59 = v41;
        __int16 v60 = 2048;
        uint64_t v61 = v36;
        __int16 v62 = 2048;
        uint64_t v63 = v37;
        _os_log_debug_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "%s: Reusing existing asset data request for request %lu for %@. Now at %lu thumbnail requests for size %lu.", buf, 0x34u);
      }

      v14[2](v14);
      goto LABEL_27;
    }
    [*(id *)(a1 + 48) addThumbnailRequest:v15];
    unint64_t v19 = *(void *)(a1 + 64) - 1;
    if (v19 > 2) {
      uint64_t v20 = 160;
    }
    else {
      uint64_t v20 = qword_1AB35B1B0[v19];
    }
    uint64_t v21 = +[PXImportSettings sharedInstance];
    int v22 = [v21 loadRetinaThumbnails];

    if (v22)
    {
      id v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v23 scale];
      double v25 = v24;

      uint64_t v20 = (uint64_t)(v25 * (double)v20);
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, *(id *)(a1 + 48));
    ++*(void *)(*(void *)(a1 + 32) + 56);
    int64_t v26 = _importMediaProviderLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = *(void *)(a1 + 80);
      uint64_t v39 = *(void *)(a1 + 48);
      uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 136316162;
      v55 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke";
      __int16 v56 = 2048;
      uint64_t v57 = v38;
      __int16 v58 = 2048;
      uint64_t v59 = v20;
      __int16 v60 = 2112;
      uint64_t v61 = v39;
      __int16 v62 = 2048;
      uint64_t v63 = v40;
      _os_log_debug_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: Sending request (%lu) of size %lu for %@(inflight %lu)", buf, 0x34u);
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(a1 + 48), "setImageProcessingStartTime:");
    BOOL v27 = *(void *)(a1 + 64) == 3;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_66;
    v42[3] = &unk_1E5DB21A8;
    objc_copyWeak(&v45, &from);
    objc_copyWeak(v46, &location);
    double v28 = *(void **)(a1 + 80);
    v46[1] = *(id *)(a1 + 64);
    v46[2] = v28;
    id v29 = v6;
    uint64_t v30 = *(void *)(a1 + 32);
    id v43 = v29;
    uint64_t v44 = v30;
    id v31 = [v29 thumbnailForSize:v20 priority:v27 atEnd:v42];
    [(PXImportThumbnailLoadingRequest *)v15 setAssetDataRequest:v31];
    __int16 v32 = [*(id *)(a1 + 32) thumbnailRequestsByID];
    CGFloat v33 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
    [v32 setObject:v15 forKeyedSubscript:v33];

    [*(id *)(a1 + 48) setAssetDataRequest:v31 forRequestSize:*(void *)(a1 + 64)];
    objc_destroyWeak(v46);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  if (v14) {
    v14[2](v14);
  }
LABEL_27:
}

uint64_t __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_61(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(result + 16))(result, v3, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    }
  }
  return result;
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_67;
  block[3] = &unk_1E5DB2180;
  block[4] = v11;
  id v17 = WeakRetained;
  long long v23 = *(_OWORD *)(a1 + 64);
  id v18 = v7;
  id v19 = v8;
  id v20 = *(id *)(a1 + 32);
  id v21 = v9;
  uint64_t v22 = *(void *)(a1 + 40);
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  id v15 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_67(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    BOOL v2 = *(void **)(a1 + 40);
    if (v2)
    {
      uint64_t v3 = [v2 thumbnailRequestsForRequestSize:*(void *)(a1 + 88)];
      int v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v75 objects:v93 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v76 != v8) {
              objc_enumerationMutation(v5);
            }
            char v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            id v11 = [v10 assetDataRequest];
            id v12 = *(void **)(a1 + 48);

            if (v11 == v12) {
              [v4 addObject:v10];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v75 objects:v93 count:16];
        }
        while (v7);
      }

      id v57 = v5;
      uint64_t v59 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      obuint64_t j = v4;
      uint64_t v13 = [obj countByEnumeratingWithState:&v71 objects:v92 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        char v15 = 0;
        uint64_t v16 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v72 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v71 + 1) + 8 * j);
            id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "requestID"));
            [v59 addObject:v19];

            id v20 = [*(id *)(a1 + 32) thumbnailRequestsByID];
            id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "requestID"));
            uint64_t v22 = [v20 objectForKeyedSubscript:v21];
            BOOL v23 = v22 != 0;

            v15 |= v23;
            double v24 = [*(id *)(a1 + 32) thumbnailRequestsByID];
            double v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "requestID"));
            [v24 setObject:0 forKeyedSubscript:v25];

            [*(id *)(a1 + 40) removeThumbnailRequest:v18];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v71 objects:v92 count:16];
        }
        while (v14);
      }
      else
      {
        char v15 = 0;
      }

      [*(id *)(a1 + 40) removeAssetDataRequestForRequestSize:*(void *)(a1 + 88)];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      objc_msgSend(*(id *)(a1 + 40), "setImageProcessingEndTime:");
      --*(void *)(*(void *)(a1 + 32) + 56);
      int64_t v26 = _importMediaProviderLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v47 = *(void **)(a1 + 96);
        uint64_t v48 = *(void *)(a1 + 40);
        uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)buf = 136316162;
        v83 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke_2";
        __int16 v84 = 2048;
        v85 = v47;
        __int16 v86 = 2112;
        uint64_t v87 = v48;
        __int16 v88 = 2048;
        uint64_t v89 = v49;
        __int16 v90 = 2112;
        v91 = v59;
        _os_log_debug_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: Completed request %lu for %@(inflight %lu). Finished thumbnail request IDs: %@", buf, 0x34u);
      }

      if (*(void *)(a1 + 56))
      {
        BOOL v27 = _importMediaProviderLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v50 = [*(id *)(a1 + 64) fileName];
          id v51 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          v83 = v50;
          __int16 v84 = 2112;
          v85 = v51;
          _os_log_error_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "ImageRequest error for import asset (%@): %@", buf, 0x16u);
        }
        [*(id *)(a1 + 40) setThumbnailError:*(void *)(a1 + 56)];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v28 = obj;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v81 count:16];
        uint64_t v30 = v57;
        if (v29)
        {
          uint64_t v31 = v29;
          uint64_t v32 = *(void *)v68;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v68 != v32) {
                objc_enumerationMutation(v28);
              }
              uint64_t v34 = [*(id *)(*((void *)&v67 + 1) + 8 * k) completionBlock];
              v34[2](v34, 0, *(void *)(a1 + 88), 0);
            }
            uint64_t v31 = [v28 countByEnumeratingWithState:&v67 objects:v81 count:16];
          }
          while (v31);
        }
      }
      else
      {
        if (*(void *)(a1 + 72))
        {
          if ((v15 & 1) == 0)
          {
            uint64_t v35 = _importMediaProviderLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              v54 = *(void **)(a1 + 96);
              uint64_t v55 = *(void *)(a1 + 40);
              uint64_t v56 = *(void *)(*(void *)(a1 + 32) + 56);
              *(_DWORD *)buf = 136315906;
              v83 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke";
              __int16 v84 = 2048;
              v85 = v54;
              __int16 v86 = 2112;
              uint64_t v87 = v55;
              __int16 v88 = 2048;
              uint64_t v89 = v56;
              _os_log_debug_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: Received image for CANCELLED request %lu for %@(inflight %lu)", buf, 0x2Au);
            }
          }
          uint64_t v36 = *(void *)(a1 + 88);
          if (v36)
          {
            uint64_t v30 = v57;
            if (v36 == 3)
            {
              [*(id *)(a1 + 72) size];
              objc_msgSend(*(id *)(a1 + 40), "setLargeThumbnailSize:");
            }
          }
          else
          {
            [*(id *)(a1 + 72) size];
            objc_msgSend(*(id *)(a1 + 40), "setThumbnailSize:");
            uint64_t v30 = v57;
          }
          uint64_t v40 = PXImportIdentifierGenerator(*(void **)(a1 + 40), *(void *)(a1 + 88));
          uint64_t v41 = [*(id *)(a1 + 32) imageCache];
          uint64_t v42 = *(void *)(a1 + 72);
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_70;
          v60[3] = &unk_1E5DB29B8;
          id v61 = *(id *)(a1 + 40);
          id v62 = v40;
          id v63 = obj;
          id v43 = *(id *)(a1 + 72);
          uint64_t v44 = *(void *)(a1 + 88);
          uint64_t v45 = *(void *)(a1 + 32);
          id v64 = v43;
          uint64_t v65 = v45;
          uint64_t v66 = v44;
          id v28 = v40;
          [v41 setImage:v42 forIdentifier:v28 completion:v60];

          uint64_t v39 = v61;
        }
        else
        {
          uint64_t v37 = _importMediaProviderLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            PXImportImageRequestSizeDebugDescription(*(void *)(a1 + 88));
            uint64_t v52 = (char *)objc_claimAutoreleasedReturnValue();
            BOOL v53 = [*(id *)(a1 + 64) fileName];
            *(_DWORD *)buf = 138543618;
            v83 = v52;
            __int16 v84 = 2112;
            v85 = v53;
            _os_log_error_impl(&dword_1A9AE7000, v37, OS_LOG_TYPE_ERROR, "Both image and error were nil while fetching %{public}@-sized image for asset: %@", buf, 0x16u);
          }
          uint64_t v30 = v57;
          if (*(void *)(a1 + 88)) {
            goto LABEL_50;
          }
          uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v79 = *MEMORY[0x1E4F28568];
          v80 = @"Null image response";
          id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          uint64_t v39 = [v38 errorWithDomain:@"com.apple.mobileslideshow.import" code:0 userInfo:v28];
          [*(id *)(a1 + 40) setThumbnailError:v39];
        }
      }
LABEL_50:
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_performIdleProcessingIfNecessary object:0];
      v46 = *(void **)(a1 + 32);
      [*(id *)(a1 + 80) idleTimeOut];
      objc_msgSend(v46, "performSelector:withObject:afterDelay:", sel_performIdleProcessingIfNecessary, 0);
    }
  }
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_70(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_71;
  v4[3] = &unk_1E5DB29B8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v2 = *(id *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = v3;
  id v8 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_71(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = _importMediaProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v19;
    _os_log_debug_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEBUG, "ImageRequest messaging model with changes: %@", buf, 0xCu);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_72;
  v24[3] = &unk_1E5DB2158;
  id v25 = v3;
  id v26 = *(id *)(a1 + 40);
  [v25 performChanges:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v8), "completionBlock", (void)v20);
        uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        v9[2](v9, *(void *)(a1 + 56), *(void *)(a1 + 72), 0);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v6);
  }

  uint64_t v10 = *(void **)(a1 + 64);
  v27[0] = @"duration";
  id v11 = NSNumber;
  [*(id *)(a1 + 32) imageProcessingEndTime];
  double v13 = v12;
  [*(id *)(a1 + 32) imageProcessingStartTime];
  char v15 = [v11 numberWithDouble:v13 - v14];
  v28[0] = v15;
  v27[1] = @"filename";
  uint64_t v16 = [*(id *)(a1 + 32) fileName];
  v28[1] = v16;
  v27[2] = @"isLastDisplayItem";
  if (*(void *)(*(void *)(a1 + 64) + 56)) {
    uint64_t v17 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v17 = MEMORY[0x1E4F1CC38];
  }
  v28[2] = v17;
  id v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 3, (void)v20);
  objc_msgSend(v10, "ppt_sendMediaProviderDidProcessAsset:", v18);
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 importAsset];
  objc_msgSend(v5, "setDuplicate:", objc_msgSend(v4, "isDuplicate"));

  [v5 addImageRepresentation:*(void *)(a1 + 40)];
}

- (PXImportImageCache)imageCache
{
  imageCache = self->_imageCache;
  if (!imageCache)
  {
    id v4 = +[PXImportImageCache sharedInstance];
    id v5 = self->_imageCache;
    self->_imageCache = v4;

    [(PXImportImageCache *)self->_imageCache configureWithFormat:[(PXImportMediaProvider *)self thumbnailImageFormat]];
    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (void)cancelImageRequest:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = [(PXImportMediaProvider *)self thumbnailRequestsByID];
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = _importMediaProviderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [v7 importItem];
      *(_DWORD *)buf = 136315650;
      BOOL v27 = "-[PXImportMediaProvider cancelImageRequest:]";
      __int16 v28 = 2048;
      int64_t v29 = a3;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_debug_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "%s: Cancel request %lu for %@", buf, 0x20u);
    }
    uint64_t v9 = [v7 importItem];
    uint64_t v10 = [v7 requestSize];
    [v9 removeThumbnailRequest:v7];
    id v11 = [v7 assetDataRequest];
    double v12 = _importMediaProviderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [v7 importItem];
      uint64_t v19 = [v25 importAsset];
      long long v20 = [v19 fileName];
      *(_DWORD *)buf = 138412546;
      BOOL v27 = v20;
      __int16 v28 = 2048;
      int64_t v29 = (int64_t)v11;
      _os_log_debug_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "*THUMBNAIL* CANCELING: %@ <%p>", buf, 0x16u);
    }
    double v13 = objc_msgSend(v9, "thumbnailRequestsForRequestSize:", objc_msgSend(v7, "requestSize"));
    if (![v13 count] && (objc_msgSend(v11, "isCanceled") & 1) == 0)
    {
      double v14 = _importMediaProviderLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        double v24 = [v7 importItem];
        *(_DWORD *)buf = 136315650;
        BOOL v27 = "-[PXImportMediaProvider cancelImageRequest:]";
        __int16 v28 = 2048;
        int64_t v29 = a3;
        __int16 v30 = 2112;
        uint64_t v31 = v24;
        _os_log_debug_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "%s: 0 thumbnail requests remaining after %lu was cancelled. Actually cancelling asset data request for %@", buf, 0x20u);
      }
      [v9 removeAssetDataRequestForRequestSize:v10];
      [v11 cancel];
    }
    char v15 = [(PXImportMediaProvider *)self thumbnailRequestsByID];
    uint64_t v16 = [NSNumber numberWithInteger:a3];
    [v15 setObject:0 forKeyedSubscript:v16];

    uint64_t v17 = _importMediaProviderLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v21 = [(PXImportMediaProvider *)self thumbnailRequestsByID];
      uint64_t v22 = [v21 count];
      int64_t imageRequestsInflight = self->_imageRequestsInflight;
      *(_DWORD *)buf = 134218240;
      BOOL v27 = (const char *)v22;
      __int16 v28 = 2048;
      int64_t v29 = imageRequestsInflight;
      _os_log_debug_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEBUG, "Number of thumbnail requests remaining: %lu. Num in-flight with backend: %ld", buf, 0x16u);
    }
  }
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v5 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXImportMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DD3128;
  id v9 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return 0;
}

uint64_t __76__PXImportMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v7 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PXImportMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DD3128;
  id v11 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return 0;
}

uint64_t __95__PXImportMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(PXImportMediaProvider *)self nextRequestID];
  uint64_t v29 = *MEMORY[0x1E4F39718];
  id v11 = [NSNumber numberWithInteger:v10];
  v30[0] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

  id v13 = v8;
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    id v26 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v26);
    BOOL v27 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v23 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 143, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v25, v27 object file lineNumber description];
  }
  else
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    double v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    [v23 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 143, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v25 object file lineNumber description];
  }

LABEL_3:
  double v14 = [v13 importAsset];
  char v15 = [v13 importAsset];
  uint64_t v16 = [v15 securityScopedURL];

  if ([v14 isMovie])
  {
    if (v16)
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithURL:v16];
      id v18 = v12;
      id v19 = v9;
      id v20 = v17;
      px_dispatch_on_main_queue();
    }
  }
  id v21 = v12;
  id v22 = v9;
  px_dispatch_on_main_queue();
}

uint64_t __73__PXImportMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __73__PXImportMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(PXImportMediaProvider *)self nextRequestID];
  id v11 = v8;
  if (!v11)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    id v22 = (objc_class *)objc_opt_class();
    long long v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 130, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v23 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    double v24 = (objc_class *)objc_opt_class();
    long long v23 = NSStringFromClass(v24);
    id v25 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v21 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 130, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v23, v25 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v30[0] = *MEMORY[0x1E4F39718];
  double v12 = [NSNumber numberWithInteger:v10];
  v31[0] = v12;
  v30[1] = *MEMORY[0x1E4F396D0];
  id v13 = [v11 uniformTypeIdentifier];
  v31[1] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  char v15 = [v11 importAsset];
  uint64_t v16 = [v15 securityScopedURL];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PXImportMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DD0E78;
  id v28 = v14;
  id v29 = v9;
  id v27 = v16;
  id v17 = v14;
  id v18 = v16;
  id v19 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return v10;
}

uint64_t __71__PXImportMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(PXImportMediaProvider *)self nextRequestID];
  id v11 = v8;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v30 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v30);
    uint64_t v31 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v27 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 113, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v29, v31 object file lineNumber description];
  }
  else
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    id v28 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v28);
    [v27 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 113, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v29 object file lineNumber description];
  }

LABEL_3:
  double v12 = [v11 importAsset];
  id v13 = [v12 metadata];
  uint64_t v14 = [v13 orientation];

  uint64_t v38 = *MEMORY[0x1E4F39718];
  char v15 = [NSNumber numberWithInteger:v10];
  v39[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];

  id v17 = [v11 importAsset];
  id v18 = [v17 securityScopedURL];

  if (v18)
  {
    id v19 = [v11 uniformTypeIdentifier];
    uint64_t v20 = objc_msgSend(v16, "px_dictionaryBySettingObject:forKey:", v19, *MEMORY[0x1E4F396D0]);

    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v18];
    uint64_t v16 = (void *)v20;
  }
  else
  {
    id v21 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PXImportMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DC8980;
  id v33 = v21;
  id v34 = v11;
  id v36 = v9;
  uint64_t v37 = v14;
  id v35 = v16;
  id v22 = v16;
  id v23 = v11;
  id v24 = v21;
  id v25 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return v10;
}

void __72__PXImportMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uniformTypeIdentifier];
  (*(void (**)(uint64_t, uint64_t, id, void, void))(v2 + 16))(v2, v3, v4, *(void *)(a1 + 64), *(void *)(a1 + 48));
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v12;
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    id v23 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v23);
    id v24 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 95, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v22, v24 object file lineNumber description];
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    id v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXImportMediaProvider.m", 95, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v22 object file lineNumber description];
  }

LABEL_3:
  if (height <= 192.0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 3;
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__PXImportMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v25[3] = &unk_1E5DB2108;
  id v26 = v14;
  id v27 = &v28;
  id v17 = v14;
  int64_t v18 = [(PXImportMediaProvider *)self requestImageForImportItem:v15 ofSize:v16 completion:v25];
  v29[3] = v18;
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __93__PXImportMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  px_dispatch_on_main_queue();
}

void __93__PXImportMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F39718];
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = objc_msgSend(v3, "px_dictionaryBySettingObject:forKey:", MEMORY[0x1E4F1CC38], *(void *)off_1E5DAAFF8);

    id v3 = (void *)v4;
  }
  (*(void (**)(void, uint64_t, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) CGImage], 0, v3);
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__PXImportMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v17[3] = &unk_1E5DC9818;
  id v18 = v13;
  id v14 = v13;
  int64_t v15 = -[PXImportMediaProvider requestCGImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", a3, a5, a6, v17, width, height);

  return v15;
}

void __91__PXImportMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if (a2) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:a2 imageOrientation:a3];
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXImportMediaProvider)initWithImageFormat:(unsigned __int16)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXImportMediaProvider;
  uint64_t v4 = [(PXImportMediaProvider *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_thumbnailImageFormat = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    thumbnailRequestsByID = v5->_thumbnailRequestsByID;
    v5->_thumbnailRequestsByID = (NSMutableDictionary *)v6;

    atomic_store(1u, (unsigned int *)&v5->_nextRequestID);
    v5->_lastRequestsInflight = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

@end