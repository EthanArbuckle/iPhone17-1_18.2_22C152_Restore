@interface PLPlaceholderThumbnailManager
+ (id)sharedManager;
- (PLPlaceholderThumbnailManager)init;
- (id)_cacheKeyForFormat:(id)a3 photoImageSize:(CGSize)a4 photoImageColor:(id)a5;
- (id)_placeholderImageWithColor:(id)a3;
- (id)newPlaceholderImageForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4;
- (id)placeholderDataForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10;
@end

@implementation PLPlaceholderThumbnailManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_placeholderImageCache, 0);
  objc_storeStrong((id *)&self->_placeholderDataCache, 0);
}

- (id)_placeholderImageWithColor:(id)a3
{
  return (id)DCIM_imageWithColor();
}

- (id)newPlaceholderImageForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__110615;
  v18 = __Block_byref_object_dispose__110616;
  id v19 = 0;
  v6 = [MEMORY[0x1E4F8B938] formatWithID:a3];
  v7 = v6;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    [v6 size];
  }
  v9 = DCIM_resolvedPlaceholderImageColor();
  id v12 = v7;
  id v13 = v9;
  pl_dispatch_sync();
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __77__PLPlaceholderThumbnailManager_newPlaceholderImageForFormat_photoImageSize___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isThumbnail]) {
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "_cacheKeyForFormat:photoImageSize:photoImageColor:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:v26];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = v26;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v6 = [*(id *)(a1 + 40) _placeholderImageWithColor:*(void *)(a1 + 48)];
    DCIM_sizeFromPLImage();
    double v8 = v7;
    double v10 = v9;
    [*(id *)(a1 + 32) size];
    BOOL v13 = v12 <= 0.0;
    if (v11 <= 0.0) {
      BOOL v13 = 1;
    }
    if (v12 > v10) {
      BOOL v13 = 1;
    }
    if (v11 > v8) {
      BOOL v13 = 1;
    }
    if (v13) {
      double v14 = v10;
    }
    else {
      double v14 = v12;
    }
    if (v13) {
      double v15 = v8;
    }
    else {
      double v15 = v11;
    }
    double v16 = *(double *)(a1 + 64) / *(double *)(a1 + 72);
    CGFloat v18 = *MEMORY[0x1E4F1DB28];
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    int v19 = [*(id *)(a1 + 32) isCropped];
    if (v16 >= 1.0)
    {
      if (!v19)
      {
        if (v15 >= *(double *)(a1 + 64)) {
          double v15 = *(double *)(a1 + 64);
        }
        double v14 = round(v15 / v16);
        goto LABEL_31;
      }
      if (v14 >= *(double *)(a1 + 72)) {
        double v14 = *(double *)(a1 + 72);
      }
    }
    else
    {
      if (!v19)
      {
        if (v14 >= *(double *)(a1 + 72)) {
          double v14 = *(double *)(a1 + 72);
        }
        double v15 = round(v16 * v14);
        goto LABEL_31;
      }
      if (v15 >= *(double *)(a1 + 64)) {
        double v14 = *(double *)(a1 + 64);
      }
      else {
        double v14 = v15;
      }
    }
    CGFloat v17 = 0.0;
    double v15 = v14;
    CGFloat v18 = 0.0;
LABEL_31:
    v20 = (CGImage *)DCIM_CGImageRefFromPLImage();
    v28.origin.x = v18;
    v28.origin.y = v17;
    v28.size.double width = v15;
    v28.size.double height = v14;
    v21 = CGImageCreateWithImageInRect(v20, v28);
    DCIM_scaleFromMainScreen();
    uint64_t v22 = DCIM_newPLImageWithCGImage();
    uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    CGImageRelease(v21);
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v25) {
      [*(id *)(*(void *)(a1 + 40) + 16) setObject:v25 forKey:v26];
    }

    v5 = v26;
  }
}

- (id)placeholderDataForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10
{
  double v10 = [MEMORY[0x1E4F8B938] formatWithID:a3];
  if ([v10 isThumbnail])
  {
    double v11 = DCIM_resolvedPlaceholderImageColor();
    uint64_t v16 = 0;
    CGFloat v17 = &v16;
    uint64_t v18 = 0x3032000000;
    int v19 = __Block_byref_object_copy__110615;
    v20 = __Block_byref_object_dispose__110616;
    id v21 = 0;
    id v14 = v10;
    id v15 = v11;
    pl_dispatch_sync();
    id v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __135__PLPlaceholderThumbnailManager_placeholderDataForFormat_photoImageSize_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForFormat:photoImageSize:photoImageColor:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v2];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 imageDataWithWidth:*(void *)(a1 + 80) height:*(void *)(a1 + 88) bytesPerRow:*(void *)(a1 + 96) dataWidth:*(void *)(a1 + 104) dataHeight:*(void *)(a1 + 104) imageDataOffset:*(void *)(a1 + 112)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    double v8 = [*(id *)(a1 + 32) _placeholderImageWithColor:*(void *)(a1 + 48)];
    double v9 = [*(id *)(a1 + 40) thumbnailSpecification];
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v41.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v41.size = v10;
    unsigned int v40 = 0;
    id v39 = 0;
    +[PLThumbnailUtilities performSWDownscaleTo5551OnImage:DCIM_CGImageRefFromPLImage() withSpecification:v9 destinationData:&v39 imageRect:&v41 bytesPerRow:&v40];
    id v11 = v39;
    id v12 = v39;
    [*(id *)(a1 + 40) size];
    uint64_t v14 = (int)v13;
    [*(id *)(a1 + 40) size];
    int v16 = (int)v15;
    int v17 = 0;
    if (([*(id *)(a1 + 40) isCropped] & 1) == 0)
    {
      int height = (int)v41.size.height;
      int v19 = v14 - (int)v41.size.width;
      if ((int)v14 < (int)v41.size.width) {
        ++v19;
      }
      unsigned int v20 = v19 & 0xFFFFFFFE;
      if ((int)v14 > (int)v41.size.width) {
        int v17 = v20;
      }
      else {
        int v17 = 0;
      }
      if (height < v16)
      {
        int v21 = v16 - height;
        if (v21 + 1 >= 0) {
          int v22 = v21 + 1;
        }
        else {
          int v22 = v21 + 2;
        }
        int v17 = v40 * (v22 >> 1);
      }
    }
    uint64_t v23 = *(_DWORD **)(a1 + 80);
    if (v23) {
      *uint64_t v23 = (int)v41.size.width;
    }
    v24 = *(_DWORD **)(a1 + 88);
    if (v24) {
      _DWORD *v24 = (int)v41.size.height;
    }
    uint64_t v25 = *(unsigned int **)(a1 + 96);
    if (v25) {
      *uint64_t v25 = v40;
    }
    id v26 = *(_DWORD **)(a1 + 120);
    if (v26) {
      *id v26 = v14;
    }
    v27 = *(int **)(a1 + 104);
    if (v27) {
      int *v27 = v16;
    }
    CGRect v28 = *(int **)(a1 + 112);
    if (v28) {
      *CGRect v28 = v17;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v11);
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length])
    {
      v29 = [_PLPlaceholderThumbnailCachedData alloc];
      HIDWORD(v37) = v16;
      v30 = v9;
      v31 = v8;
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v38 = v12;
      uint64_t Width = (int)CGRectGetWidth(v41);
      CGFloat v34 = CGRectGetHeight(v41);
      LODWORD(v37) = v17;
      uint64_t v35 = v32;
      double v8 = v31;
      double v9 = v30;
      v36 = [(_PLPlaceholderThumbnailCachedData *)v29 initWithImageData:v35 width:Width height:(int)v34 bytesPerRow:v40 dataWidth:v14 dataHeight:HIDWORD(v37) imageDataOffset:v37];
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v36 forKey:v2];

      id v12 = v38;
    }
  }
}

- (id)_cacheKeyForFormat:(id)a3 photoImageSize:(CGSize)a4 photoImageColor:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  id v9 = a3;
  int v10 = [v9 isCropped];
  id v11 = NSString;
  if (v10)
  {
    unsigned int v12 = [v9 formatID];

    uint64_t v13 = [v8 hash];
    objc_msgSend(v11, "stringWithFormat:", @"%d~%lu", v12, v13, v18);
  }
  else
  {
    unsigned int v14 = [v9 formatID];

    uint64_t v15 = [v8 hash];
    objc_msgSend(v11, "stringWithFormat:", @"%d~%lu_%.4f", v14, v15, width / height);
  int v16 = };
  return v16;
}

- (PLPlaceholderThumbnailManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLPlaceholderThumbnailManager;
  uint64_t v2 = [(PLPlaceholderThumbnailManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    placeholderDataCache = v2->_placeholderDataCache;
    v2->_placeholderDataCache = v3;

    uint64_t v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    placeholderImageCache = v2->_placeholderImageCache;
    v2->_placeholderImageCache = v5;

    dispatch_queue_t v7 = dispatch_queue_create("PLPlaceholderThumbnailManager", 0);
    isolation = v2->_isolation;
    v2->_isolation = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedManager
{
  pl_dispatch_once();
  uint64_t v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __46__PLPlaceholderThumbnailManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;
}

@end