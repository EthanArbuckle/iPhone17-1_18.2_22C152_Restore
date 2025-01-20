@interface PBUIWallpaperCache
+ (id)wallpaperCache;
- (BSUIMappedImageCache)imageCache;
- (PBUIWallpaperCache)initWithOptions:(id)a3;
- (id)colorBoxesForKey:(id)a3 generatingIfNeceesaryFromImage:(id)a4;
- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4;
- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4 completion:(id)a5;
- (id)imageURLForKey:(id)a3;
- (void)removeEverythingWithCompletion:(id)a3;
- (void)warmupForKey:(id)a3;
@end

@implementation PBUIWallpaperCache

+ (id)wallpaperCache
{
  if (wallpaperCache_once != -1) {
    dispatch_once(&wallpaperCache_once, &__block_literal_global_6);
  }
  v2 = (void *)wallpaperCache_cache;
  return v2;
}

void __36__PBUIWallpaperCache_wallpaperCache__block_invoke()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  char v1 = [v0 isEphemeralMultiUser];

  if (v1) {
    [MEMORY[0x1E4F4F7C8] pathProviderForSystemContainerForCurrentProcess];
  }
  else {
  id v5 = [MEMORY[0x1E4F4F7C8] pathProviderForCurrentContainer];
  }
  v2 = [MEMORY[0x1E4F4F8C8] optionsWithContainerPathProvider:v5];
  v3 = [[PBUIWallpaperCache alloc] initWithOptions:v2];
  v4 = (void *)wallpaperCache_cache;
  wallpaperCache_cache = (uint64_t)v3;
}

- (PBUIWallpaperCache)initWithOptions:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PBUIWallpaperCache;
  id v5 = [(PBUIWallpaperCache *)&v28 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F4F8C0]) initWithUniqueIdentifier:@"Wallpaper" options:v4];
  imageCache = v5->_imageCache;
  v5->_imageCache = (BSUIMappedImageCache *)v6;

  v8 = [v4 containerPathProvider];
  v9 = [v8 cachesPath];

  v10 = [v9 URLByAppendingPathComponent:@"MappedImageCache"];
  v11 = [v10 URLByAppendingPathComponent:@"Wallpaper"];

  objc_storeStrong((id *)&v5->_imageCachePath, v11);
  v12 = [v4 containerPathProvider];
  v13 = [v12 cachesPath];
  v14 = [v13 path];
  v15 = [v14 stringByAppendingPathComponent:@"com.apple.springboard"];
  v16 = [v15 stringByAppendingPathComponent:@"WallpaperColorBoxesCache"];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = 0;
    int v18 = [v17 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v27];
    id v19 = v27;

    if (v18)
    {
      path = v5->_path;
      v5->_path = v16;
      v21 = v16;

      uint64_t v22 = BSDispatchQueueCreateWithQualityOfService();
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v22;

LABEL_5:
      v24 = v5;
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = 0;
  }
  v25 = PBUILogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    [(PBUIWallpaperCache *)(uint64_t)v16 initWithOptions:v25];
  }

  v24 = 0;
LABEL_10:

  return v24;
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4
{
  return (id)[(BSUIMappedImageCache *)self->_imageCache imageForKey:a3 generatingIfNecessaryWithBlock:a4];
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4 completion:(id)a5
{
  return (id)[(BSUIMappedImageCache *)self->_imageCache imageForKey:a3 generatingIfNecessaryWithBlock:a4 completion:a5];
}

- (id)imageURLForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSURL *)self->_imageCachePath URLByAppendingPathComponent:v4];
    uint64_t v6 = [v5 URLByAppendingPathExtension:@"cpbitmap"];

    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8];

    if (v9) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = 0;
LABEL_5:

  return v6;
}

- (id)colorBoxesForKey:(id)a3 generatingIfNeceesaryFromImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  if ([v8 deviceClass])
  {
    char v9 = soft_PUIFeatureEnabled(0);

    id v10 = 0;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1C1872330]();
      v12 = [v6 stringByAppendingPathExtension:@".colorboxes"];
      v13 = [(NSString *)self->_path stringByAppendingPathComponent:v12];
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      id v33 = 0;
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke;
      block[3] = &unk_1E62B2FC0;
      id v27 = &v28;
      id v15 = v13;
      id v26 = v15;
      dispatch_sync(queue, block);
      if (!v29[5]
        || ([MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:getPUIColorBoxesClass() fromData:v29[5] error:0], (v16 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v16 = [getPUIColorBoxesClass() colorBoxesForImage:v7];
        v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
        int v18 = self->_queue;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke_2;
        v22[3] = &unk_1E62B2C38;
        id v23 = v17;
        id v24 = v15;
        id v19 = v17;
        dispatch_async(v18, v22);
      }
      v20 = v26;
      id v10 = v16;

      _Block_object_dispose(&v28, 8);
    }
  }
  else
  {

    id v10 = 0;
  }

  return v10;
}

uint64_t __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(a1 + 32) options:1 error:0];
  return MEMORY[0x1F41817F8]();
}

uint64_t __70__PBUIWallpaperCache_colorBoxesForKey_generatingIfNeceesaryFromImage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeToFile:*(void *)(a1 + 40) atomically:1];
}

- (void)warmupForKey:(id)a3
{
}

- (void)removeEverythingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  dispatch_group_enter(v5);
  id v6 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke;
  block[3] = &unk_1E62B2EF0;
  id v20 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, v6, block);

  imageCache = self->_imageCache;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_2;
  v17[3] = &unk_1E62B2798;
  char v9 = v5;
  int v18 = v9;
  [(BSUIMappedImageCache *)imageCache removeAllImagesWithCompletion:v17];
  id v10 = self->_path;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_3;
  v14[3] = &unk_1E62B2C38;
  id v15 = v10;
  v16 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(queue, v14);
}

uint64_t __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_2(uint64_t a1)
{
}

void __53__PBUIWallpaperCache_removeEverythingWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtPath:*(void *)(a1 + 32) error:0];
  [v2 createDirectoryAtPath:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BSUIMappedImageCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageCachePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithOptions:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "-[PBUIWallpaperCache initWithOptions:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1BC4B3000, log, OS_LOG_TYPE_ERROR, "Error in %s: Couldn't create directory at %{public}@ with error %{public}@", (uint8_t *)&v3, 0x20u);
}

@end