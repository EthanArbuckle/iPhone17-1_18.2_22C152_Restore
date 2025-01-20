@interface PKRemoteImagePreparer
- (PKRemoteImagePreparer)init;
- (void)fetchRemoteImage:(id)a3 completion:(id)a4;
- (void)fetchRemoteImage:(id)a3 preheatBitmap:(BOOL)a4 completion:(id)a5;
- (void)fetchRemoteImage:(id)a3 scaleToSize:(CGSize)a4 preheatBitmap:(BOOL)a5 completion:(id)a6;
@end

@implementation PKRemoteImagePreparer

- (PKRemoteImagePreparer)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKRemoteImagePreparer;
  v2 = [(PKRemoteImagePreparer *)&v10 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    preparedImageCache = v2->_preparedImageCache;
    v2->_preparedImageCache = v3;

    [(NSCache *)v2->_preparedImageCache setTotalCostLimit:10485760];
    v2->_completionsLock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PKRemoteImagePreparer", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)fetchRemoteImage:(id)a3 completion:(id)a4
{
}

- (void)fetchRemoteImage:(id)a3 preheatBitmap:(BOOL)a4 completion:(id)a5
{
}

- (void)fetchRemoteImage:(id)a3 scaleToSize:(CGSize)a4 preheatBitmap:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  v12 = (void (**)(id, void *))a6;
  BOOL v13 = width != *MEMORY[0x1E4F1DB30];
  if (height != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    BOOL v13 = 1;
  }
  if (width == 1.79769313e308) {
    BOOL v13 = 0;
  }
  if (width == -1.79769313e308) {
    BOOL v13 = 0;
  }
  if (height == 1.79769313e308) {
    BOOL v13 = 0;
  }
  BOOL v14 = height != -1.79769313e308 && v13;
  v15 = [v11 remoteURL];
  if (v14)
  {
    v16 = [NSString stringWithFormat:@"%.2f-%.2f", *(void *)&width, *(void *)&height];
  }
  else
  {
    v16 = @"NativeSize";
  }
  v17 = @"RawData";
  if (v7) {
    v17 = @"Bitmap";
  }
  v18 = NSString;
  v19 = v17;
  v20 = [v15 absoluteString];
  v21 = [v18 stringWithFormat:@"%@_%@_%@", v20, v16, v19];

  v22 = [(NSCache *)self->_preparedImageCache objectForKey:v21];
  if (v22)
  {
    v12[2](v12, v22);
  }
  else
  {
    BOOL v26 = v7;
    os_unfair_lock_lock(&self->_completionsLock);
    id v23 = [(NSMutableDictionary *)self->_completionHandlers objectForKey:v21];
    if (!v23)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)self->_completionHandlers setObject:v23 forKey:v21];
    }
    v24 = (void *)[v12 copy];
    v25 = _Block_copy(v24);
    [v23 addObject:v25];

    os_unfair_lock_unlock(&self->_completionsLock);
    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke;
    v27[3] = &unk_1E56E1838;
    objc_copyWeak(v29, &location);
    BOOL v30 = v14;
    v29[1] = *(id *)&width;
    v29[2] = *(id *)&height;
    BOOL v31 = v26;
    id v28 = v21;
    [v11 fetchImageWithCompletion:v27];

    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
  }
}

void __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained[4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke_2;
  v8[3] = &unk_1E56E1810;
  __int16 v13 = *(_WORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = v3;
  objc_super v10 = WeakRetained;
  id v11 = *(id *)(a1 + 32);
  v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_6;
  block[3] = &unk_1E56D8360;
  id v15 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (*(unsigned char *)(a1 + 72))
  {
    id v3 = +[PKImageResizingConstraints constraintsWithAspectFitToSize:](PKImageResizingConstraints, "constraintsWithAspectFitToSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v4 = [*(id *)(a1 + 32) resizedImageWithConstraints:v3];

    id v2 = (id)v4;
  }
  if (*(unsigned char *)(a1 + 73)) {
    [v2 preheatBitmapData];
  }
  if (v2)
  {
    id v5 = v2;
    v6 = (CGImage *)[v5 imageRef];
    if (v6)
    {
      id v7 = v6;
      size_t BytesPerRow = CGImageGetBytesPerRow(v6);
      size_t v9 = CGImageGetHeight(v7) * BytesPerRow;
    }
    else
    {
      objc_super v10 = [v5 imageData];
      size_t v9 = [v10 length];
    }
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v5 forKey:*(void *)(a1 + 48) cost:v9];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  id v11 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:*(void *)(a1 + 48)];
  long long v12 = (void *)[v11 copy];
  [v11 removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * i));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_preparedImageCache, 0);
}

@end