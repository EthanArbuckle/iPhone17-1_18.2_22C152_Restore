@interface PXMediaProvider
- (CGSize)masterThumbnailSize;
- (NSArray)availableThumbnailSizes;
- (PXLoadingStatusManager)loadingStatusManager;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int64_t)a3;
- (void)setLoadingStatusManager:(id)a3;
@end

@implementation PXMediaProvider

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

void __42__PXMediaProvider_availableThumbnailSizes__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  LOWORD(a3) = *(_WORD *)(a2 + 16);
  double v4 = (double)*(unint64_t *)&a3;
  LOWORD(a4) = *(_WORD *)(a2 + 18);
  double v5 = (double)*(unint64_t *)&a4;
  double v6 = round(v4 * 0.75);
  double v7 = round(v5 * 0.75);
  if (!*(unsigned char *)(a2 + 20))
  {
    double v5 = v7;
    double v4 = v6;
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v4, v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v9];
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (NSArray)availableThumbnailSizes
{
  v3 = self->_availableThumbnailSizes;
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__PXMediaProvider_availableThumbnailSizes__block_invoke;
    v8[3] = &unk_26545B510;
    id v9 = v4;
    id v5 = v4;
    [(PXMediaProvider *)self enumerateAvailableThumbnailDataFormats:v8];
    v3 = (NSArray *)(id)[v5 copy];
    availableThumbnailSizes = self->_availableThumbnailSizes;
    self->_availableThumbnailSizes = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);

  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 142, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider cancelImageRequest:]", v7 object file lineNumber description];

  abort();
}

- (CGSize)masterThumbnailSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  id v8 = a3;
  id v9 = [MEMORY[0x263F08690] currentHandler];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 108, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider thumbnailDataForAsset:targetSize:onlyFromCache:outDataSpec:]", v11 object file lineNumber description];

  abort();
}

- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x263F08690] currentHandler];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 103, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestStreamForVideo:options:resultHandler:]", v14 object file lineNumber description];

  abort();
}

- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x263F08690] currentHandler];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 98, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestURLForVideo:options:resultHandler:]", v14 object file lineNumber description];

  abort();
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x263F08690] currentHandler];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 93, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestAnimatedImageForAsset:options:resultHandler:]", v14 object file lineNumber description];

  abort();
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = [MEMORY[0x263F08690] currentHandler];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v14 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 88, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:]", v16 object file lineNumber description];

  abort();
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x263F08690] currentHandler];
  id v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 83, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestPlayerItemForVideo:options:resultHandler:]", v14 object file lineNumber description];

  abort();
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x263F08690] currentHandler];
  id v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 78, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestImageURLForAsset:options:resultHandler:]", v14 object file lineNumber description];

  abort();
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x263F08690] currentHandler];
  id v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 73, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestImageDataForAsset:options:resultHandler:]", v14 object file lineNumber description];

  abort();
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = [MEMORY[0x263F08690] currentHandler];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v14 handleFailureInMethod:a2, self, @"PXMediaProvider.m", 68, @"Method %s is a responsibility of subclass %@", "-[PXMediaProvider requestCGImageForAsset:targetSize:contentMode:options:resultHandler:]", v16 object file lineNumber description];

  abort();
}

@end