@interface PXMediaProviderManager
+ (PXMediaProviderManager)defaultManager;
- (PXMediaProviderManager)init;
- (id)imageProviderForAsset:(id)a3;
@end

@implementation PXMediaProviderManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProviderByClass, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (id)imageProviderForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2796;
  v16 = __Block_byref_object_dispose__2797;
  id v17 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PXMediaProviderManager_imageProviderForAsset___block_invoke;
  block[3] = &unk_26545A5D8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(isolationQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__PXMediaProviderManager_imageProviderForAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:objc_opt_class()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v5 = objc_alloc_init((Class)[*(id *)(a1 + 40) defaultImageProviderClass]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = objc_opt_class();
    [v8 setObject:v9 forKey:v10];
  }
}

- (PXMediaProviderManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXMediaProviderManager;
  uint64_t v2 = [(PXMediaProviderManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.PXMediaProviderManager", v3);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    imageProviderByClass = v2->_imageProviderByClass;
    v2->_imageProviderByClass = (NSMapTable *)v6;
  }
  return v2;
}

+ (PXMediaProviderManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_2806);
  }
  uint64_t v2 = (void *)defaultManager_defaultManager;

  return (PXMediaProviderManager *)v2;
}

uint64_t __40__PXMediaProviderManager_defaultManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = defaultManager_defaultManager;
  defaultManager_defaultManager = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end