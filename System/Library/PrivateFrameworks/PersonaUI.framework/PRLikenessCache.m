@interface PRLikenessCache
+ (BOOL)_ensureExistenceOfDirectory:(id)a3;
+ (BOOL)_purgeOldCacheFilesInDirectory:(id)a3;
+ (BOOL)_removeImageAtURL:(id)a3;
+ (BOOL)_writeImage:(id)a3 toURL:(id)a4;
+ (id)_applicationCacheDirectory;
+ (id)_imageAtURL:(id)a3;
+ (id)_propertyValueForURL:(id)a3 forKey:(id)a4;
+ (id)_staticRepresentationCacheURL;
+ (id)sharedInstance;
- (BOOL)renderIfNeeded;
- (BOOL)useFilesystem;
- (BOOL)useMemory;
- (NSURL)cacheDirectory;
- (PRLikenessCache)init;
- (id)_cacheKeyForLikeness:(id)a3 context:(id)a4;
- (id)_cacheURLForLikeness:(id)a3 context:(id)a4;
- (void)_fetchFromFilesystem:(id)a3 context:(id)a4 renderBlock:(id)a5 completion:(id)a6;
- (void)_fetchFromMemory:(id)a3 context:(id)a4 renderBlock:(id)a5 completion:(id)a6;
- (void)_fetchWithReadBlock:(id)a3 writeBlock:(id)a4 renderBlock:(id)a5 completion:(id)a6;
- (void)_renderImageForLikeness:(id)a3 context:(id)a4 completion:(id)a5;
- (void)imageForLikeness:(id)a3 context:(id)a4 completion:(id)a5;
- (void)setCacheDirectory:(id)a3;
- (void)setRenderIfNeeded:(BOOL)a3;
- (void)setUseFilesystem:(BOOL)a3;
- (void)setUseMemory:(BOOL)a3;
@end

@implementation PRLikenessCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__PRLikenessCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __33__PRLikenessCache_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (id)_applicationCacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [v3 stringByAppendingPathComponent:v5];

  return v6;
}

+ (id)_staticRepresentationCacheURL
{
  v2 = NSURL;
  v3 = [a1 _applicationCacheDirectory];
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  v5 = [NSURL fileURLWithPath:@".persona" isDirectory:1 relativeToURL:v4];

  return v5;
}

+ (BOOL)_ensureExistenceOfDirectory:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v11 = 0;
  char v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v11];

  id v7 = v11;
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  if (!v8)
  {
    v9 = _PRGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "+[PRLikenessCache _ensureExistenceOfDirectory:]";
      __int16 v14 = 1024;
      int v15 = 101;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21566D000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to create cache directory: %@\"", buf, 0x1Cu);
    }
  }
  return v8;
}

- (PRLikenessCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)PRLikenessCache;
  v2 = [(PRLikenessCache *)&v14 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    inMemoryCache = v2->_inMemoryCache;
    v2->_inMemoryCache = v3;

    [(NSCache *)v2->_inMemoryCache setName:@"com.apple.persona.cache"];
    [(NSCache *)v2->_inMemoryCache setTotalCostLimit:2621440];
    uint64_t v5 = [(id)objc_opt_class() _staticRepresentationCacheURL];
    cacheDirectory = v2->_cacheDirectory;
    v2->_cacheDirectory = (NSURL *)v5;

    +[PRLikenessCache _ensureExistenceOfDirectory:v2->_cacheDirectory];
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.persona.cache", v7);
    cacheLookupQueue = v2->_cacheLookupQueue;
    v2->_cacheLookupQueue = (OS_dispatch_queue *)v8;

    *(_WORD *)&v2->_useMemory = 1;
    v2->_renderIfNeeded = 1;
    v10 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__PRLikenessCache_init__block_invoke;
    block[3] = &unk_264253E58;
    v13 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

BOOL __23__PRLikenessCache_init__block_invoke(uint64_t a1)
{
  return +[PRLikenessCache _purgeOldCacheFilesInDirectory:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (id)_cacheKeyForLikeness:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 uniqueIdentifier];
  dispatch_queue_t v8 = [v6 recipe];

  v9 = objc_msgSend(v8, "_cn_SHA1String");

  v10 = NSStringFromPRLikenessCacheSize([v5 cacheSize]);
  int v11 = [v5 circular];

  v12 = @"sqr";
  if (v11) {
    v12 = @"cir";
  }
  v13 = [NSString stringWithFormat:@"%@_%@_%@_%@", v7, v9, v10, v12];

  return v13;
}

- (id)_cacheURLForLikeness:(id)a3 context:(id)a4
{
  id v5 = [(PRLikenessCache *)self _cacheKeyForLikeness:a3 context:a4];
  id v6 = [NSString stringWithFormat:@"%@.%@", v5, @"png"];
  id v7 = [(NSURL *)self->_cacheDirectory URLByAppendingPathComponent:v6];

  return v7;
}

- (void)imageForLikeness:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke;
  v18[3] = &unk_264253E80;
  id v11 = v10;
  id v19 = v11;
  v12 = (void (**)(void, void, void))MEMORY[0x2166C0400](v18);
  v13 = [v8 uniqueIdentifier];

  if (v13)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_2;
    v15[3] = &unk_264253EA8;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [(PRLikenessCache *)self _fetchFromMemory:v16 context:v17 renderBlock:v15 completion:v12];
  }
  else
  {
    objc_super v14 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9021);
    ((void (**)(void, void, void *))v12)[2](v12, 0, v14);
  }
}

uint64_t __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_3;
  v7[3] = &unk_264253EF8;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_3(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_4;
  v7[3] = &unk_264253EA8;
  v7[4] = v3;
  id v8 = v2;
  id v9 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_5;
  v5[3] = &unk_264253E80;
  id v6 = *(id *)(a1 + 56);
  [v3 _fetchFromFilesystem:v8 context:v4 renderBlock:v7 completion:v5];
}

uint64_t __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _renderImageForLikeness:*(void *)(a1 + 40) context:*(void *)(a1 + 48) completion:a2];
}

void __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_6;
  block[3] = &unk_264253ED0;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_fetchFromMemory:(id)a3 context:(id)a4 renderBlock:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a5;
  id v13 = a6;
  if ([(PRLikenessCache *)self useMemory])
  {
    id v14 = [(PRLikenessCache *)self _cacheKeyForLikeness:v10 context:v11];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke;
    v20[3] = &unk_264253F20;
    v20[4] = self;
    id v21 = v14;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke_2;
    v16[3] = &unk_264253F48;
    id v17 = v11;
    uint64_t v18 = self;
    id v19 = v21;
    id v15 = v21;
    [(PRLikenessCache *)self _fetchWithReadBlock:v20 writeBlock:v16 renderBlock:v12 completion:v13];
  }
  else
  {
    v12[2](v12, v13);
  }
}

uint64_t __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
}

void __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  objc_msgSend(*(id *)(a1[5] + 8), "setObject:forKey:cost:", v4, a1[6], PRLikenessCacheSizeGetCost(objc_msgSend(v3, "cacheSize")));
}

- (void)_fetchFromFilesystem:(id)a3 context:(id)a4 renderBlock:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a5;
  id v13 = a6;
  if ([(PRLikenessCache *)self useFilesystem])
  {
    id v14 = [(PRLikenessCache *)self _cacheURLForLikeness:v10 context:v11];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke;
    v18[3] = &unk_264253F70;
    id v19 = v14;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke_2;
    v16[3] = &unk_264253F98;
    id v17 = v19;
    id v15 = v19;
    [(PRLikenessCache *)self _fetchWithReadBlock:v18 writeBlock:v16 renderBlock:v12 completion:v13];
  }
  else
  {
    v12[2](v12, v13);
  }
}

id __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke(uint64_t a1)
{
  return +[PRLikenessCache _imageAtURL:*(void *)(a1 + 32)];
}

BOOL __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PRLikenessCache _writeImage:a2 toURL:*(void *)(a1 + 32)];
}

- (void)_renderImageForLikeness:(id)a3 context:(id)a4 completion:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([(PRLikenessCache *)self renderIfNeeded])
  {
    double v11 = CGSizeFromPRLikenessCacheSize([v9 cacheSize]);
    double v13 = v12;
    [v9 scale];
    double v15 = v14;
    v21[0] = @"PRLikenessSnapshotOptionCircular";
    id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "circular"));
    v22[0] = v16;
    v21[1] = @"PRLikenessSnapshotOptionForceDecode";
    id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "forceDecode"));
    v22[1] = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v19 = objc_msgSend(v8, "snapshotWithSize:scale:options:", v18, v11, v13, v15);

    if (v19)
    {
      v10[2](v10, v19, 0);
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9010);
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v20);
    }
  }
  else
  {
    id v19 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9018);
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v19);
  }
}

- (void)_fetchWithReadBlock:(id)a3 writeBlock:(id)a4 renderBlock:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  double v11 = (void (**)(id, void *, void))a6;
  double v12 = (*((void (**)(id))a3 + 2))(a3);
  if (v12)
  {
    v11[2](v11, v12, 0);
  }
  else if (v10)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__PRLikenessCache__fetchWithReadBlock_writeBlock_renderBlock_completion___block_invoke;
    v14[3] = &unk_264253FC0;
    id v15 = v9;
    id v16 = v11;
    v10[2](v10, v14);
  }
  else
  {
    double v13 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9018);
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v13);
  }
}

void __73__PRLikenessCache__fetchWithReadBlock_writeBlock_renderBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_imageAtURL:(id)a3
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  CFURLRef v3 = (const __CFURL *)a3;
  id v4 = (void *)*MEMORY[0x263F0F640];
  keys[0] = *(void **)MEMORY[0x263F0F600];
  keys[1] = v4;
  id v5 = (void *)*MEMORY[0x263F01AE0];
  values[0] = *(void **)MEMORY[0x263EFFB38];
  values[1] = v5;
  CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    id v8 = CGImageSourceCreateWithURL(v3, v6);
    if (v8)
    {
      id v9 = v8;
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
      if (ImageAtIndex)
      {
        double v11 = ImageAtIndex;
        double v12 = objc_msgSend(MEMORY[0x263F1C6B0], "pr_imageWithCGImage:", ImageAtIndex);
        CGImageRelease(v11);
      }
      else
      {
        double v12 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      double v12 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

+ (BOOL)_writeImage:(id)a3 toURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFURLRef v5 = (const __CFURL *)a4;
  uint64_t v6 = objc_msgSend(a3, "pr_imageRef");
  if (!v6)
  {
    double v12 = _PRGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "+[PRLikenessCache _writeImage:toURL:]";
      __int16 v17 = 1024;
      int v18 = 321;
      double v13 = "%s (%d) @\"Failed to get imageRef from PRImage!\"";
LABEL_12:
      _os_log_impl(&dword_21566D000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x12u);
    }
LABEL_13:

    BOOL v10 = 0;
    goto LABEL_14;
  }
  CFDictionaryRef v7 = (CGImage *)v6;
  id v8 = CGImageDestinationCreateWithURL(v5, (CFStringRef)*MEMORY[0x263F01AE0], 0, 0);
  if (!v8)
  {
    double v12 = _PRGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "+[PRLikenessCache _writeImage:toURL:]";
      __int16 v17 = 1024;
      int v18 = 329;
      double v13 = "%s (%d) @\"Failed to create imageDestinationRef!\"";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v9 = v8;
  CGImageDestinationAddImage(v8, v7, 0);
  BOOL v10 = CGImageDestinationFinalize(v9);
  if (!v10)
  {
    double v11 = _PRGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "+[PRLikenessCache _writeImage:toURL:]";
      __int16 v17 = 1024;
      int v18 = 337;
      _os_log_impl(&dword_21566D000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to finalize the image destination!\"", (uint8_t *)&v15, 0x12u);
    }
  }
  CFRelease(v9);
LABEL_14:

  return v10;
}

+ (BOOL)_removeImageAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFURLRef v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  CFURLRef v5 = [v3 defaultManager];
  id v11 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v11];

  id v7 = v11;
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  if (!v8)
  {
    id v9 = _PRGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      double v13 = "+[PRLikenessCache _removeImageAtURL:]";
      __int16 v14 = 1024;
      int v15 = 355;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21566D000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to remove image file: %@\"", buf, 0x1Cu);
    }
  }
  return v8;
}

+ (BOOL)_purgeOldCacheFilesInDirectory:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFURLRef v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = *MEMORY[0x263EFF5E8];
  v38[0] = *MEMORY[0x263EFF5E8];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  id v30 = 0;
  BOOL v8 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v7 options:1 error:&v30];
  id v9 = v30;

  if (!v9)
  {
    id v25 = v4;
    BOOL v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-259200.0];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v24 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (!v13)
    {
      char v11 = 1;
      goto LABEL_23;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    char v11 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v18 = [a1 _propertyValueForURL:v17 forKey:v6];
        uint64_t v19 = v18;
        if (!v18)
        {
          v20 = _PRGetLogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "+[PRLikenessCache _purgeOldCacheFilesInDirectory:]";
            __int16 v34 = 1024;
            int v35 = 379;
            __int16 v36 = 2112;
            id v37 = v17;
            id v21 = v20;
            v22 = "%s (%d) @\"File did not contain a last access date: %@\"";
LABEL_17:
            _os_log_impl(&dword_21566D000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x1Cu);
          }
LABEL_18:

          char v11 = 0;
          goto LABEL_19;
        }
        if ([v18 compare:v10] == -1 && (objc_msgSend(a1, "_removeImageAtURL:", v17) & 1) == 0)
        {
          v20 = _PRGetLogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "+[PRLikenessCache _purgeOldCacheFilesInDirectory:]";
            __int16 v34 = 1024;
            int v35 = 386;
            __int16 v36 = 2112;
            id v37 = v17;
            id v21 = v20;
            v22 = "%s (%d) @\"Failed to remove image file: %@\"";
            goto LABEL_17;
          }
          goto LABEL_18;
        }
LABEL_19:
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (!v14)
      {
LABEL_23:

        BOOL v8 = v24;
        id v4 = v25;
        id v9 = 0;
        goto LABEL_24;
      }
    }
  }
  BOOL v10 = _PRGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "+[PRLikenessCache _purgeOldCacheFilesInDirectory:]";
    __int16 v34 = 1024;
    int v35 = 368;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl(&dword_21566D000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to enumerate contents of directory: %@\"", buf, 0x1Cu);
  }
  char v11 = 0;
LABEL_24:

  return v11 & 1;
}

+ (id)_propertyValueForURL:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = 0;
  id v9 = 0;
  [a3 getResourceValue:&v9 forKey:a4 error:&v8];
  id v4 = v9;
  id v5 = v8;
  if (v5)
  {
    uint64_t v6 = _PRGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      char v11 = "+[PRLikenessCache _propertyValueForURL:forKey:]";
      __int16 v12 = 1024;
      int v13 = 403;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_21566D000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to get property for file: %@\"", buf, 0x1Cu);
    }
  }
  return v4;
}

- (NSURL)cacheDirectory
{
  return self->_cacheDirectory;
}

- (void)setCacheDirectory:(id)a3
{
}

- (BOOL)useMemory
{
  return self->_useMemory;
}

- (void)setUseMemory:(BOOL)a3
{
  self->_useMemory = a3;
}

- (BOOL)useFilesystem
{
  return self->_useFilesystem;
}

- (void)setUseFilesystem:(BOOL)a3
{
  self->_useFilesystem = a3;
}

- (BOOL)renderIfNeeded
{
  return self->_renderIfNeeded;
}

- (void)setRenderIfNeeded:(BOOL)a3
{
  self->_renderIfNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_cacheLookupQueue, 0);
  objc_storeStrong((id *)&self->_inMemoryCache, 0);
}

@end