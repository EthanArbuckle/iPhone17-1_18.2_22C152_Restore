@interface TPSImageAssetController
+ (id)dataCacheForIdentifier:(id)a3;
+ (id)defaultInMemoryImageCache;
+ (id)formattedDataForPath:(id)a3 identifier:(id)a4 priority:(float)a5 completionHandler:(id)a6;
+ (id)getImageForIdentifier:(id)a3;
+ (id)imageFromMemoryCacheForIdentifier:(id)a3;
+ (void)addInMemoryCacheForImage:(id)a3 identifier:(id)a4 cost:(unint64_t)a5;
+ (void)removeInMemoryCache;
@end

@implementation TPSImageAssetController

uint64_t __52__TPSImageAssetController_defaultInMemoryImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;
  defaultInMemoryImageCache_gInMemoryImageCache = (uint64_t)v0;

  v2 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;

  return [v2 setTotalCostLimit:31457280];
}

uint64_t __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_3(void *a1)
{
  v2 = [MEMORY[0x263F7F630] sharedInstance];
  char v3 = [v2 shouldIgnoreInMemoryCaching];

  if ((v3 & 1) == 0) {
    +[TPSImageAssetController addInMemoryCacheForImage:a1[4] identifier:a1[5] cost:200];
  }
  uint64_t result = a1[10];
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F827E8]);
  char v3 = [*(id *)(a1 + 32) path];
  v4 = (void *)[v2 initWithContentsOfFile:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_3;
  v6[3] = &unk_2642B2030;
  id v7 = v4;
  id v8 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 80);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  char v14 = *(unsigned char *)(a1 + 88);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v14;
    v19 = dispatch_get_global_queue(0, 0);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_2;
    v21[3] = &unk_2642B2030;
    id v22 = v18;
    id v23 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 40);
    id v24 = v13;
    id v25 = v15;
    char v29 = a5;
    id v26 = v16;
    id v27 = v17;
    dispatch_async(v19, v21);
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      (*(void (**)(uint64_t, id, void, id, uint64_t, id, id))(v20 + 16))(v20, v13, 0, v15, a5, v16, v17);
    }
  }
}

+ (id)imageFromMemoryCacheForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[TPSImageAssetController defaultInMemoryImageCache];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

+ (id)formattedDataForPath:(id)a3 identifier:(id)a4 priority:(float)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x263F7F5A0];
  id v12 = a3;
  id v13 = [v11 sharedInstance];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke;
  v19[3] = &unk_2642B2058;
  id v20 = v9;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  *(float *)&double v16 = a5;
  id v17 = [v13 formattedDataForPath:v12 identifier:v15 attributionIdentifier:0 priority:v19 completionHandler:v16];

  return v17;
}

+ (id)dataCacheForIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x263F7F5A0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  v6 = [v5 dataCacheForIdentifier:v4];

  return v6;
}

+ (void)addInMemoryCacheForImage:(id)a3 identifier:(id)a4 cost:(unint64_t)a5
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    id v8 = +[TPSImageAssetController defaultInMemoryImageCache];
    id v9 = v8;
    if (a5) {
      [v8 setObject:v10 forKey:v7 cost:a5];
    }
    else {
      [v8 setObject:v10 forKey:v7];
    }
  }
}

+ (id)defaultInMemoryImageCache
{
  if (defaultInMemoryImageCache_predicate[0] != -1) {
    dispatch_once(defaultInMemoryImageCache_predicate, &__block_literal_global_0);
  }
  id v2 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;

  return v2;
}

+ (void)removeInMemoryCache
{
  id v2 = +[TPSImageAssetController defaultInMemoryImageCache];
  [v2 removeAllObjects];
}

+ (id)getImageForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[TPSImageAssetController imageFromMemoryCacheForIdentifier:v3];
  if (!v4)
  {
    id v5 = [MEMORY[0x263F7F5A0] sharedInstance];
    v6 = [v5 dataCacheForIdentifier:v3];

    id v7 = [MEMORY[0x263F7F5A0] sharedInstance];
    id v8 = [v7 cacheFileURLForDataCache:v6];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x263F827E8]);
      id v10 = [v8 path];
      id v4 = (void *)[v9 initWithContentsOfFile:v10];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

@end