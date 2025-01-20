@interface PLFigPreheatItem
- (BOOL)_hasCachedImage;
- (BOOL)addImageHandler:(id)a3;
- (BOOL)isCancelled;
- (NSString)imagePath;
- (PLFigPreheatItem)initWithImagePath:(id)a3 format:(unsigned __int16)a4 imageType:(int64_t)a5 optimalSourcePixelSize:(CGSize)a6 options:(unsigned int)a7;
- (id)cachedImage:(BOOL *)a3;
- (id)cachedImageIfAvailable:(BOOL *)a3;
- (id)decodeSessionOptions;
- (id)initialDecodeSessionOptions;
- (id)preheatData;
- (unsigned)options;
- (void)_cacheImage;
- (void)_cancel;
- (void)_leaveWaitGroupIfNeeded;
- (void)_loadPreheatDataWithHandler:(id)a3;
- (void)_setHasCachedImage:(BOOL)a3;
- (void)_uncancel;
- (void)cancelPreheatRequestWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)startPreheatRequestWithCompletionHandler:(id)a3;
@end

@implementation PLFigPreheatItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_waitGroup, 0);
  objc_storeStrong((id *)&self->_requestGroup, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (unsigned)options
{
  return self->_loadingOptions;
}

- (void)cancelPreheatRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PLFigPreheatItem *)self _cancel];
  [(PLFigPreheatItem *)self _setHasCachedImage:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PLFigPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v7);
  pl_dispatch_async();
}

uint64_t __62__PLFigPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[18])
  {
    if (v2[19])
    {
      CMPhotoDecompressionContainerCancelAsyncRequest();
      v2 = *(void **)(a1 + 32);
    }
    v2[18] = 0;
    v2 = *(void **)(a1 + 32);
  }
  v3 = (void *)v2[16];
  v2[16] = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
  [*(id *)(a1 + 32) _leaveWaitGroupIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)startPreheatRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PLFigPreheatItem *)self _uncancel];
  dispatch_group_enter((dispatch_group_t)self->_requestGroup);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v7);
  pl_dispatch_async();
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 128) || *(unsigned char *)(v2 + 176) || *(void *)(v2 + 144))
  {
    dispatch_group_leave(*(dispatch_group_t *)(v2 + 160));
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    *(unsigned char *)(v2 + 136) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E5871E58;
    id v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    dispatch_block_t v6 = (void *)MEMORY[0x19F38D650](v11);
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E5871EA8;
    v9[4] = v7;
    id v10 = v6;
    id v8 = v6;
    [v7 _loadPreheatDataWithHandler:v9];
  }
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 120));
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = 0;
  [*(id *)(a1 + 32) _leaveWaitGroupIfNeeded];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 160));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v6, a3);
  }
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    PFSharedFigDecodeSession();
    int Container = CMPhotoDecompressionSessionCreateContainer();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4;
    v14 = &unk_1E5871E80;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v5;
    id v6 = (void *)MEMORY[0x19F38D650](&v11);
    if (Container)
    {
      v7 = PLImageManagerGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 192);
        *(_DWORD *)buf = 134218242;
        uint64_t v18 = Container;
        __int16 v19 = 2112;
        uint64_t v20 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unable to open Fig container, %ld, %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "decodeSessionOptions", v11, v12, v13, v14, v15);
      if (!CMPhotoDecompressionContainerDecodeImageForIndexAsync())
      {
LABEL_12:

        goto LABEL_13;
      }
      CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 152));
      *(void *)(*(void *)(a1 + 32) + 152) = 0;
    }
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "isCancelled", v11, v12, v13, v14, v15));
    goto LABEL_12;
  }
  v9 = PLImageManagerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 192);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to load image data, %@", buf, 0xCu);
  }

  (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, [*(id *)(a1 + 32) isCancelled]);
LABEL_13:
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 != -17105 && a4 != 0)
  {
    v7 = PLImageManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 192);
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "-[PLFigPreheatItem startPreheatRequestWithCompletionHandler:]_block_invoke_4";
      __int16 v12 = 2048;
      uint64_t v13 = a4;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "CMPhoto decompression session create in %s returned %ld from %@", buf, 0x20u);
    }
  }
  id v9 = *(id *)(a1 + 40);
  pl_dispatch_sync();
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_47(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 144))
  {
    *(void *)(v2 + 144) = 0;
    if (*(void *)(a1 + 48) && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
    {
      uint64_t v4 = DCIM_newPLImageWithCGImage();
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 128);
      *(void *)(v5 + 128) = v4;

      id v7 = *(id *)(*(void *)(a1 + 32) + 128);
      [*(id *)(a1 + 32) _setHasCachedImage:1];
      id v3 = v7;
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v8 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 152));
  *(void *)(*(void *)(a1 + 32) + 152) = 0;
}

- (void)_leaveWaitGroupIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  waitGroup = obj->_waitGroup;
  if (waitGroup)
  {
    dispatch_group_leave(waitGroup);
    id v3 = obj->_waitGroup;
    obj->_waitGroup = 0;
  }
  objc_sync_exit(obj);
}

- (id)preheatData
{
  if (self->_imagePath)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    imagePath = self->_imagePath;
    id v8 = 0;
    uint64_t v5 = (void *)[v3 initWithContentsOfFile:imagePath options:2 error:&v8];
    id v6 = v8;
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = 0;
  }

  return v5;
}

- (void)_loadPreheatDataWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if ([(PLFigPreheatItem *)self isCancelled])
  {
    v4[2](v4, 0);
  }
  else
  {
    pl_dispatch_once();
    uint64_t v5 = (void *)_loadPreheatDataWithHandler__concurrentQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke_2;
    v6[3] = &unk_1E58742F0;
    v6[4] = self;
    id v7 = v4;
    [v5 dispatchAsync:v6];
  }
}

void __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) preheatData];
  }
  id v4 = *(id *)(a1 + 40);
  id v3 = v2;
  pl_dispatch_async();
}

uint64_t __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke()
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.PLFigPreheatItem.loadPreheatData", MEMORY[0x1E4F14430]);
  v0 = [[PLConcurrentQueue alloc] initWithTargetQueue:v2 width:2];
  v1 = (void *)_loadPreheatDataWithHandler__concurrentQueue;
  _loadPreheatDataWithHandler__concurrentQueue = (uint64_t)v0;
}

- (void)_cacheImage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_cachedImage)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    imagePath = self->_imagePath;
    id v11 = 0;
    uint64_t v5 = (void *)[v3 initWithContentsOfFile:imagePath options:2 error:&v11];
    id v6 = v11;
    if ([v5 length])
    {
      id v7 = [(PLFigPreheatItem *)self decodeSessionOptions];
      int CGImageFromImageData = PFFigCreateCGImageFromImageData();

      if (CGImageFromImageData)
      {
        id v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = self->_imagePath;
          *(_DWORD *)buf = 136315650;
          uint64_t v13 = "-[PLFigPreheatItem _cacheImage]";
          __int16 v14 = 2048;
          uint64_t v15 = CGImageFromImageData;
          __int16 v16 = 2048;
          v17 = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "PFFigCreateCGImageFromImageData %s returned %ld from %lu", buf, 0x20u);
        }

        self->_cachedImageCancelled = 0;
      }
      else
      {
        self->_cachedImageCancelled = 0;
      }
      [(PLFigPreheatItem *)self _setHasCachedImage:1];
    }
  }
}

- (id)decodeSessionOptions
{
  [(PLPreheatItem *)self optimalSourcePixelSize];
  if (v4 == 0.0 && v3 == 0.0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = NSNumber;
    [(PLPreheatItem *)self optimalSourcePixelSize];
    double v8 = v7;
    [(PLPreheatItem *)self optimalSourcePixelSize];
    double v10 = v9;
    [(PLPreheatItem *)self optimalSourcePixelSize];
    if (v8 <= v10) {
      double v11 = v12;
    }
    uint64_t v13 = [v6 numberWithInt:(int)v11];
    [v5 setObject:v13 forKey:*MEMORY[0x1E4F562A8]];
  }
  return v5;
}

- (id)initialDecodeSessionOptions
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = v3;
  if ((self->_loadingOptions & 2) != 0) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F562A0]];
  }
  return v4;
}

- (BOOL)addImageHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLFigPreheatItem.m", 150, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v6 = v5;
  pl_dispatch_async();

  return 1;
}

void __36__PLFigPreheatItem_addImageHandler___block_invoke(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__PLFigPreheatItem_addImageHandler___block_invoke_2;
  v10[3] = &unk_1E58742F0;
  dispatch_queue_t v2 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v2;
  uint64_t v3 = MEMORY[0x19F38D650](v10);
  double v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 128))
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v6 = *(NSObject **)(v5 + 168);
    if (!v6)
    {
      dispatch_group_t v7 = dispatch_group_create();
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = *(void **)(v8 + 168);
      *(void *)(v8 + 168) = v7;

      dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 168));
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(NSObject **)(v5 + 168);
    }
    dispatch_group_notify(v6, *(dispatch_queue_t *)(v5 + 120), v4);
  }
}

void __36__PLFigPreheatItem_addImageHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  id v4 = *(id *)(a1 + 40);
  id v3 = v2;
  pl_dispatch_async();
}

uint64_t __36__PLFigPreheatItem_addImageHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)cachedImageIfAvailable:(BOOL *)a3
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__94700;
  uint64_t v15 = __Block_byref_object_dispose__94701;
  id v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ([(PLFigPreheatItem *)self _hasCachedImage]
    || !dispatch_group_wait((dispatch_group_t)self->_requestGroup, 0))
  {
    pl_dispatch_sync();
  }
  if (a3) {
    *a3 = *((unsigned char *)v8 + 24);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __43__PLFigPreheatItem_cachedImageIfAvailable___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 136);
}

- (id)cachedImage:(BOOL *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__94700;
  __int16 v19 = __Block_byref_object_dispose__94701;
  id v20 = 0;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  pl_dispatch_sync();
  if (*((unsigned char *)v8 + 24))
  {
    dispatch_group_wait((dispatch_group_t)self->_requestGroup, 0xFFFFFFFFFFFFFFFFLL);
    pl_dispatch_sync();
  }
  if (a3) {
    *a3 = *((unsigned char *)v12 + 24);
  }
  id v5 = (id)v16[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __32__PLFigPreheatItem_cachedImage___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 128) && !*(unsigned char *)(v2 + 136))
  {
    if (*(unsigned char *)(v2 + 176) || *(void *)(v2 + 144)) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
    else {
      [(id)v2 _cacheImage];
    }
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 128));
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 136);
  }
}

void __32__PLFigPreheatItem_cachedImage___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 136);
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (void)_setHasCachedImage:(BOOL)a3
{
}

- (BOOL)_hasCachedImage
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_hasCachedImage);
  return v2 & 1;
}

- (void)_uncancel
{
}

- (void)_cancel
{
}

- (void)dealloc
{
  waitGroup = self->_waitGroup;
  if (waitGroup) {
    dispatch_group_leave(waitGroup);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLFigPreheatItem;
  [(PLFigPreheatItem *)&v4 dealloc];
}

- (PLFigPreheatItem)initWithImagePath:(id)a3 format:(unsigned __int16)a4 imageType:(int64_t)a5 optimalSourcePixelSize:(CGSize)a6 options:(unsigned int)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v13 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLFigPreheatItem;
  char v14 = [(PLFigPreheatItem *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    imagePath = v14->_imagePath;
    v14->_imagePath = (NSString *)v15;

    v14->super._format = a4;
    v14->super._optimalSourcePixelSize.CGFloat width = width;
    v14->super._optimalSourcePixelSize.CGFloat height = height;
    v14->_loadingOptions = a7;
    v14->super._imageType = a5;
    dispatch_queue_t v17 = dispatch_queue_create("PLFigPreheatItem", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    dispatch_group_t v19 = dispatch_group_create();
    requestGroup = v14->_requestGroup;
    v14->_requestGroup = (OS_dispatch_group *)v19;

    v14->_requestID = 0;
  }

  return v14;
}

@end