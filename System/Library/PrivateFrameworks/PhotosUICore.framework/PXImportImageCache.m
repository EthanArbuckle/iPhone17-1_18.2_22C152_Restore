@interface PXImportImageCache
+ (PXImportImageCache)sharedInstance;
- (PXImportImageCache)init;
- (id)cacheTableForIdentifier:(id)a3;
- (id)imageForIdentifier:(id)a3;
- (id)imageForModel:(id)a3 ofSize:(unint64_t)a4 allowLowerResolutions:(BOOL)a5 foundSize:(unint64_t *)a6;
- (void)accessImageTableForIdentifier:(id)a3 withChangeBlock:(id)a4;
- (void)configureWithFormat:(unsigned __int16)a3;
- (void)imageForIdentifier:(id)a3 completion:(id)a4;
- (void)imageForModel:(id)a3 ofSize:(unint64_t)a4 allowLowerResolutions:(BOOL)a5 completion:(id)a6;
- (void)removeCacheForIdentifiers:(id)a3;
- (void)setImage:(id)a3 forIdentifier:(id)a4;
- (void)setImage:(id)a3 forIdentifier:(id)a4 completion:(id)a5;
- (void)tearDown;
@end

@implementation PXImportImageCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheTableQueue, 0);
  objc_storeStrong((id *)&self->_caches, 0);
}

- (void)accessImageTableForIdentifier:(id)a3 withChangeBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cacheTableQueue = self->_cacheTableQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PXImportImageCache_accessImageTableForIdentifier_withChangeBlock___block_invoke;
  block[3] = &unk_1E5DD0E78;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(cacheTableQueue, block);
}

void __68__PXImportImageCache_accessImageTableForIdentifier_withChangeBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) cacheTableForIdentifier:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)cacheTableForIdentifier:(id)a3
{
  id v4 = a3;
  caches = self->_caches;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
  id v7 = [(NSMutableDictionary *)caches objectForKey:v6];

  if (!v7)
  {
    if (!self->_imageFormat) {
      _PFAssertContinueHandler();
    }
    v8 = NSTemporaryDirectory();
    id v9 = NSString;
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
    v11 = [v9 stringWithFormat:@"%@/import-%@.ithmb", v8, v10];

    if ([v4 sizeType]) {
      id v12 = (PUTemporaryImageTable *)objc_opt_new();
    }
    else {
      id v12 = [(PLTemporaryImageTable *)[PUTemporaryImageTable alloc] initWithWithPath:v11 imageFormat:self->_imageFormat];
    }
    id v7 = v12;
    id v13 = self->_caches;
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
    [(NSMutableDictionary *)v13 setObject:v7 forKey:v14];

    if (!v7) {
      _PFAssertContinueHandler();
    }
  }

  return v7;
}

- (void)removeCacheForIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [(PXImportImageCache *)self cacheTableForIdentifier:v9];
        objc_msgSend(v10, "removeItemAtIndex:", objc_msgSend(v9, "cacheIndex"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)imageForModel:(id)a3 ofSize:(unint64_t)a4 allowLowerResolutions:(BOOL)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (v10)
  {
    long long v11 = [a3 imageRepresentations];
    long long v12 = v11;
    if (a5)
    {
      long long v13 = [v11 allKeys];
      long long v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_56_286769];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
LABEL_5:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
          if ([v20 integerValue] <= a4) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v17) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v22 = v20;

        if (v22)
        {
          v21 = [v12 objectForKeyedSubscript:v22];
          goto LABEL_15;
        }
        v21 = 0;
      }
      else
      {
LABEL_11:
        v21 = 0;
        id v22 = v15;
LABEL_15:
      }
    }
    else
    {
      id v15 = [NSNumber numberWithUnsignedInteger:a4];
      v21 = [v12 objectForKeyedSubscript:v15];
    }

    if (v21)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76__PXImportImageCache_imageForModel_ofSize_allowLowerResolutions_completion___block_invoke_2;
      v23[3] = &unk_1E5DD0E50;
      id v24 = v10;
      [(PXImportImageCache *)self imageForIdentifier:v21 completion:v23];
    }
    else
    {
      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, 4);
    }
  }
}

uint64_t __76__PXImportImageCache_imageForModel_ofSize_allowLowerResolutions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PXImportImageCache_imageForModel_ofSize_allowLowerResolutions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)imageForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PXImportImageCache_imageForIdentifier_completion___block_invoke;
  v10[3] = &unk_1E5DD0E08;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(PXImportImageCache *)self accessImageTableForIdentifier:v8 withChangeBlock:v10];
}

void __52__PXImportImageCache_imageForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_msgSend(v4, "imageForItemAtIndex:", objc_msgSend(v3, "cacheIndex"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, [*(id *)(a1 + 32) sizeType]);
  }
}

- (id)imageForModel:(id)a3 ofSize:(unint64_t)a4 allowLowerResolutions:(BOOL)a5 foundSize:(unint64_t *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [v10 imageRepresentations];
  id v12 = [NSNumber numberWithUnsignedInteger:a4];
  long long v13 = [v11 objectForKeyedSubscript:v12];

  if (a5)
  {
    long long v14 = [v10 imageRepresentations];
    id v15 = [v14 allValues];
    uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      long long v27 = v13;
      long long v28 = a6;
      uint64_t v20 = *(void *)v30;
      unint64_t v21 = 4;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v23, "sizeType", v27, v28, (void)v29) <= a4)
          {
            uint64_t v24 = [(PXImportImageCache *)self imageForIdentifier:v23];
            if (v24)
            {
              long long v25 = (void *)v24;
              unint64_t v21 = [v23 sizeType];
              goto LABEL_15;
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      long long v25 = 0;
LABEL_15:
      long long v13 = v27;
      a6 = v28;
    }
    else
    {
      long long v25 = 0;
      unint64_t v21 = 4;
    }

    if (a6) {
      goto LABEL_18;
    }
  }
  else
  {
    long long v25 = [(PXImportImageCache *)self imageForIdentifier:v13];
    unint64_t v21 = [v13 sizeType];
    if (a6) {
LABEL_18:
    }
      *a6 = v21;
  }

  return v25;
}

- (id)imageForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PXImportImageCache *)self cacheTableForIdentifier:v4];
  uint64_t v6 = [v4 cacheIndex];

  id v7 = [v5 imageForItemAtIndex:v6];

  return v7;
}

- (void)setImage:(id)a3 forIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PXImportImageCache_setImage_forIdentifier_completion___block_invoke;
    v11[3] = &unk_1E5DD0DE0;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(PXImportImageCache *)self accessImageTableForIdentifier:v13 withChangeBlock:v11];
  }
}

uint64_t __56__PXImportImageCache_setImage_forIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (int)[v3 nextCacheIndex];
  [v3 setImage:*(void *)(a1 + 32) forItemAtIndex:v4];

  [*(id *)(a1 + 40) setCacheIndex:v4];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)setImage:(id)a3 forIdentifier:(id)a4
{
}

- (void)tearDown
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_caches;
  uint64_t v3 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "reset", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)configureWithFormat:(unsigned __int16)a3
{
  self->_imageFormat = a3;
}

- (PXImportImageCache)init
{
  id v2 = self;
  if (sharedInstance)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"use singleton access %@", objc_opt_class() format];
    uint64_t v3 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXImportImageCache;
    uint64_t v4 = [(PXImportImageCache *)&v12 init];
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      caches = v4->_caches;
      v4->_caches = (NSMutableDictionary *)v5;

      long long v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      long long v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);

      dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.import.ImageCache", v8);
      cacheTableQueue = v4->_cacheTableQueue;
      v4->_cacheTableQueue = (OS_dispatch_queue *)v9;
    }
    id v2 = v4;
    uint64_t v3 = v2;
  }

  return v3;
}

+ (PXImportImageCache)sharedInstance
{
  if (sharedInstance_onceToken_286786 != -1) {
    dispatch_once(&sharedInstance_onceToken_286786, &__block_literal_global_286787);
  }
  id v2 = (void *)sharedInstance;
  return (PXImportImageCache *)v2;
}

void __36__PXImportImageCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXImportImageCache);
  v1 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v0;
}

@end