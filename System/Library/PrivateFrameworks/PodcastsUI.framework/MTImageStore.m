@interface MTImageStore
+ (double)defaultMaxImageDimensionInPixels;
+ (id)defaultBasePath;
+ (id)defaultPodcastArtworkWithWidth:(double)a3;
+ (id)defaultStore;
+ (unint64_t)defaultMaxConcurrentOperations;
- (BOOL)requireSquareImages:(id)a3;
- (MTImageStore)initWithName:(id)a3 basePath:(id)a4 maxImageDimensionInPixels:(double)a5 maxConcurrentOperations:(unint64_t)a6 alternativeSizeBlock:(id)a7;
- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6;
- (void)addImage:(id)a3 forKey:(id)a4;
- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6 completionHandler:(id)a7;
@end

@implementation MTImageStore

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MTImageStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, block);
  }
  v2 = (void *)defaultStore_defaultStore;

  return v2;
}

uint64_t __28__MTImageStore_defaultStore__block_invoke(uint64_t a1)
{
  defaultStore_defaultStore = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

+ (unint64_t)defaultMaxConcurrentOperations
{
  if (![MEMORY[0x1E4F91FC8] isPodcastsApp]) {
    return 3;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTImageStore;
  return (unint64_t)objc_msgSendSuper2(&v4, sel_defaultMaxConcurrentOperations);
}

- (MTImageStore)initWithName:(id)a3 basePath:(id)a4 maxImageDimensionInPixels:(double)a5 maxConcurrentOperations:(unint64_t)a6 alternativeSizeBlock:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)MTImageStore;
  v7 = [(IMImageStore *)&v9 initWithName:a3 basePath:a4 maxImageDimensionInPixels:a6 maxConcurrentOperations:a7 alternativeSizeBlock:a5];
  if (v7 && ([MEMORY[0x1E4F91FC8] isPodcastsApp] & 1) == 0) {
    [(IMImageStore *)v7 setDisableMemoryCache:1];
  }
  return v7;
}

+ (double)defaultMaxImageDimensionInPixels
{
  return 3000.0;
}

+ (id)defaultBasePath
{
  v2 = [MEMORY[0x1E4F91F80] defaultImageStoreURL];
  v3 = [v2 URLByDeletingLastPathComponent];
  objc_super v4 = [v3 path];

  return v4;
}

- (BOOL)requireSquareImages:(id)a3
{
  return [a3 containsString:@"mzstatic.com"] ^ 1;
}

+ (id)defaultPodcastArtworkWithWidth:(double)a3
{
  return (id)[MEMORY[0x1E4FB1818] defaultPodcastArtworkWithWidth:a3];
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a6;
  if ([MEMORY[0x1E4F91FC8] supportsImageStore])
  {
    if ([v11 isEqualToString:*MEMORY[0x1E4F92060]])
    {
      uint64_t v13 = [(id)objc_opt_class() defaultPodcastArtworkWithWidth:width];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)MTImageStore;
      uint64_t v13 = -[IMImageStore imageForKey:size:resizeOptions:modifier:](&v17, sel_imageForKey_size_resizeOptions_modifier_, v11, v7, v12, width, height);
    }
    v15 = (void *)v13;
  }
  else
  {
    v14 = [MEMORY[0x1E4F91F10] sharedLogger];
    [v14 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Asset Caching/Legacy/MTImageStore.m" lineNumber:107 format:@"Image store is not supported on audio accessories. Returning early."];

    v15 = 0;
  }

  return v15;
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  v15 = (void (**)(id, void *, id))a7;
  if ([v13 isEqualToString:*MEMORY[0x1E4F92060]])
  {
    v16 = [(id)objc_opt_class() defaultPodcastArtworkWithWidth:width];
    if (v15) {
      v15[2](v15, v16, v13);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MTImageStore;
    -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](&v17, sel_asyncImageForKey_size_resizeOptions_modifier_completionHandler_, v13, v9, v14, v15, width, height);
  }
}

- (void)addImage:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F91FC8] supportsImageStore])
  {
    if ([(MTImageStore *)self requireSquareImages:v7])
    {
      uint64_t v8 = [v6 squareImage];

      id v6 = (id)v8;
    }
    v10.receiver = self;
    v10.super_class = (Class)MTImageStore;
    [(IMImageStore *)&v10 addImage:v6 forKey:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F91F10] sharedLogger];
    [v9 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Asset Caching/Legacy/MTImageStore.m" lineNumber:138 format:@"Image store is not supported on audio accessories. Returning early."];
  }
}

@end