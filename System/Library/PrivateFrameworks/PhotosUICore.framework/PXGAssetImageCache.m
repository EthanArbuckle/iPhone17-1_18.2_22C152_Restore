@interface PXGAssetImageCache
- (BOOL)getCachedImage:(CGImage *)a3 withOrientation:(unsigned int *)a4 outIsDegraded:(BOOL *)a5 forAsset:(id)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 forRequestID:(int)a9;
- (CGImage)cacheCGImage:(CGImage *)a3 orientation:(unsigned int)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6;
- (PXGAssetImageCache)init;
- (id)debugDescription;
- (id)description;
- (void)_cacheImage:(CGImage *)a3 orientation:(unsigned int)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6 outCGImage:(CGImage *)a7;
- (void)clearAllCachedImages;
- (void)clearCachedImagesForRequestIDs:(id)a3;
@end

@implementation PXGAssetImageCache

void __112__PXGAssetImageCache_getCachedImage_withOrientation_outIsDegraded_forAsset_targetSize_contentMode_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v8 = objc_msgSend(v7, "asset", (void)v15);
          uint64_t v9 = [v8 isContentEqualTo:*(void *)(a1 + 40)];

          if (v9 == 2)
          {
            [v7 targetSize];
            PXSizeGetArea();
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }
  }
  v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "px_popLast", (void)v15);
  v11 = v10;
  if (v10) {
    v12 = v10;
  }
  else {
    v12 = objc_alloc_init(_PXGAssetImageCacheEntry);
  }
  v13 = v12;

  [(_PXGAssetImageCacheEntry *)v13 setAsset:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v13];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  v14 = [(_PXGAssetImageCacheEntry *)v13 requestIDs];
  [v14 addIndex:*(int *)(a1 + 88)];

  [*(id *)(*(void *)(a1 + 32) + 16) addIndex:*(int *)(a1 + 88)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(_PXGAssetImageCacheEntry *)v13 cgImage];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(_PXGAssetImageCacheEntry *)v13 imageOrientation];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(_PXGAssetImageCacheEntry *)v13 isDegraded];
}

void __81__PXGAssetImageCache__cacheImage_orientation_isDegraded_forRequestID_outCGImage___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsIndex:*(int *)(a1 + 56)])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "requestIDs", (void)v9);
          int v8 = [v7 containsIndex:*(int *)(a1 + 56)];

          if (v8) {
            PXCGImageGetSizeWithOrientation();
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

- (BOOL)getCachedImage:(CGImage *)a3 withOrientation:(unsigned int *)a4 outIsDegraded:(BOOL *)a5 forAsset:(id)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 forRequestID:(int)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v16 = a6;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __112__PXGAssetImageCache_getCachedImage_withOrientation_outIsDegraded_forAsset_targetSize_contentMode_forRequestID___block_invoke;
  v21[3] = &unk_1E5DC6B30;
  v21[4] = self;
  id v18 = v16;
  CGFloat v26 = width;
  CGFloat v27 = height;
  int v28 = a9;
  id v22 = v18;
  v23 = &v37;
  v24 = &v33;
  v25 = &v29;
  dispatch_sync(queue, v21);
  *a4 = *((_DWORD *)v34 + 6);
  *a5 = *((unsigned char *)v30 + 24);
  if (a3)
  {
    v19 = v38;
    *a3 = (CGImage *)v38[3];
    LOBYTE(a3) = v19[3] != 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return (char)a3;
}

- (CGImage)cacheCGImage:(CGImage *)a3 orientation:(unsigned int)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6
{
  v7 = 0;
  [(PXGAssetImageCache *)self _cacheImage:a3 orientation:*(void *)&a4 isDegraded:a5 forRequestID:*(void *)&a6 outCGImage:&v7];
  return v7;
}

- (void)_cacheImage:(CGImage *)a3 orientation:(unsigned int)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6 outCGImage:(CGImage *)a7
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v16 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PXGAssetImageCache__cacheImage_orientation_isDegraded_forRequestID_outCGImage___block_invoke;
  block[3] = &unk_1E5DC6B58;
  block[5] = &v13;
  block[6] = a3;
  int v10 = a6;
  unsigned int v11 = a4;
  BOOL v12 = a5;
  block[4] = self;
  dispatch_sync(queue, block);
  if (a7) {
    *a7 = (CGImage *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
}

- (PXGAssetImageCache)init
{
  v15.receiver = self;
  v15.super_class = (Class)PXGAssetImageCache;
  id v2 = [(PXGAssetImageCache *)&v15 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.PXGAssetImageCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    activeRequestIDs = v2->_activeRequestIDs;
    v2->_activeRequestIDs = v6;

    int v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeAssets = v2->_activeAssets;
    v2->_activeAssets = v8;

    int v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entries = v2->_entries;
    v2->_entries = v10;

    BOOL v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    reusableEntries = v2->_reusableEntries;
    v2->_reusableEntries = v12;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_activeAssets, 0);
  objc_storeStrong((id *)&self->_activeRequestIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)clearAllCachedImages
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXGAssetImageCache_clearAllCachedImages__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__PXGAssetImageCache_clearAllCachedImages__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "copy", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          int v8 = [v7 requestIDs];
          [v8 removeIndexes:*(void *)(*(void *)(a1 + 32) + 16)];
          if (![v8 count])
          {
            long long v9 = [v7 asset];
            if (v9) {
              [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v9];
            }
            [v7 prepareForReuse];
            [*(id *)(*(void *)(a1 + 32) + 40) addObject:v7];
            [*(id *)(*(void *)(a1 + 32) + 32) removeObject:v7];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllIndexes];
}

- (void)clearCachedImagesForRequestIDs:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PXGAssetImageCache_clearCachedImagesForRequestIDs___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__PXGAssetImageCache_clearCachedImagesForRequestIDs___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "px_intersectionWithIndexSet:", *(void *)(*(void *)(a1 + 40) + 16));
  if ([v2 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "copy", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          long long v9 = [v8 requestIDs];
          [v9 removeIndexes:v2];
          if (![v9 count])
          {
            int v10 = [v8 asset];
            if (v10) {
              [*(id *)(*(void *)(a1 + 40) + 24) removeObject:v10];
            }
            [v8 prepareForReuse];
            [*(id *)(*(void *)(a1 + 40) + 40) addObject:v8];
            [*(id *)(*(void *)(a1 + 40) + 32) removeObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 16) removeIndexes:*(void *)(a1 + 32)];
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; ImageCount = %lu; Entries = %@>",
    v5,
    self,
    [(NSMutableArray *)self->_entries count],
  uint64_t v6 = self->_entries);

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; ImageCount = %lu>",
    v5,
    self,
  uint64_t v6 = [(NSMutableArray *)self->_entries count]);

  return v6;
}

@end