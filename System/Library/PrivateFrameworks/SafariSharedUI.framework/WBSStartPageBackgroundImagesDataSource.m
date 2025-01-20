@interface WBSStartPageBackgroundImagesDataSource
- (WBSStartPageBackgroundImagesDataSource)initWithBuiltInImageURLs:(id)a3 localCachesDirectory:(id)a4;
- (WBSStartPageBackgroundImagesDataSource)initWithBundle:(id)a3 localCachesDirectory:(id)a4;
- (id)_createThumbnail:(id)a3 imageSource:(CGImageSource *)a4;
- (id)_thumbnailURLWithItemIndex:(int64_t)a3;
- (id)imageURLAndLuminanceWithItemIndex:(int64_t)a3;
- (int64_t)indexOfBackgroundImageWithName:(id)a3;
- (int64_t)itemCount;
- (void)imageThumbnailWithItemIndex:(int64_t)a3 completion:(id)a4;
@end

@implementation WBSStartPageBackgroundImagesDataSource

- (WBSStartPageBackgroundImagesDataSource)initWithBuiltInImageURLs:(id)a3 localCachesDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)WBSStartPageBackgroundImagesDataSource;
  v8 = [(WBSStartPageBackgroundImagesDataSource *)&v32 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Safari.WBSStartPageBackgroundImagesDataSource.Loading", v9);
    imageLoadingQueue = v8->_imageLoadingQueue;
    v8->_imageLoadingQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.Safari.WBSStartPageBackgroundImagesDataSource.Saving", v12);
    imageSavingQueue = v8->_imageSavingQueue;
    v8->_imageSavingQueue = (OS_dispatch_queue *)v13;

    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingImageThumbnailRequests = v8->_pendingImageThumbnailRequests;
    v8->_pendingImageThumbnailRequests = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    imageCache = v8->_imageCache;
    v8->_imageCache = (NSMutableDictionary *)v18;

    uint64_t v20 = [v7 URLByAppendingPathComponent:@"StartPage/BackgroundThumbnails" isDirectory:1];
    thumbnailsPath = v8->_thumbnailsPath;
    v8->_thumbnailsPath = (NSURL *)v20;

    if ([v6 count])
    {
      uint64_t v22 = [v6 sortedArrayUsingComparator:&__block_literal_global_37];
      defaultImageURLs = v8->_defaultImageURLs;
      v8->_defaultImageURLs = (NSArray *)v22;
    }
    v24 = v8->_imageLoadingQueue;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2;
    v29[3] = &unk_1E5E407D0;
    v25 = v8;
    v30 = v25;
    id v31 = v15;
    id v26 = v15;
    dispatch_async(v24, v29);
    v27 = v25;
  }
  return v8;
}

uint64_t __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 absoluteString];
  id v6 = [v4 absoluteString];
  uint64_t v7 = [v5 compare:v6 options:0];

  return v7;
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(*(void *)(a1 + 32) + 24);
  if (![v1 count])
  {
    uint64_t v16 = v1;
    v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/Desktop Pictures/" isDirectory:1];
    v3 = *(void **)(a1 + 40);
    id v4 = [v2 path];
    id v28 = 0;
    v17 = [v3 contentsOfDirectoryAtPath:v4 error:&v28];
    id v18 = v28;

    if (v18)
    {
      v5 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = objc_msgSend(v18, "safari_privacyPreservingDescription");
        __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2_cold_1(v6, buf, v5);
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v17;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = [v2 URLByAppendingPathComponent:*(void *)(*((void *)&v24 + 1) + 8 * v10)];
          v12 = +[WBSImageUtilities safari_CGImageTypes];
          dispatch_queue_t v13 = objc_msgSend(v11, "safari_fileType");
          int v14 = [v12 containsObject:v13];

          if (v14) {
            [v20 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    id v1 = v20;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_31;
  block[3] = &unk_1E5E407D0;
  id v22 = *(id *)(a1 + 32);
  id v23 = v1;
  id v15 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_31(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_mapObjectsUsingBlock:", &__block_literal_global_35);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_3;
  v10[3] = &unk_1E5E44B28;
  v11 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"WBSStartPageBackgroundImagesDataSourceUpdatedImages" object:*(void *)(a1 + 32)];
}

WBSStartPageBackgroundImageDescription *__88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 URLByDeletingPathExtension];
  id v4 = [v3 pathExtension];

  v5 = [WBSStartPageBackgroundImageDescription alloc];
  id v6 = v4;
  uint64_t v7 = -[WBSStartPageBackgroundImageDescription initWithURL:luminance:](v5, "initWithURL:luminance:", v2, strtod_l((const char *)[v6 UTF8String], 0, 0) / 1000.0);

  return v7;
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "imageThumbnailWithItemIndex:completion:", objc_msgSend(v6, "integerValue"), v5);
}

- (WBSStartPageBackgroundImagesDataSource)initWithBundle:(id)a3 localCachesDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URLsForResourcesWithExtension:@"heic" subdirectory:@"Background Images"];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1E4F1CBF0];
  if (v8) {
    v11 = (void *)v8;
  }
  else {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  uint64_t v13 = [v6 URLsForResourcesWithExtension:@"png" subdirectory:@"Background Images"];
  int v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v10;
  }
  uint64_t v16 = [v12 arrayByAddingObjectsFromArray:v15];

  v17 = [(WBSStartPageBackgroundImagesDataSource *)self initWithBuiltInImageURLs:v16 localCachesDirectory:v7];
  return v17;
}

- (int64_t)itemCount
{
  int64_t result = [(NSArray *)self->_imageURLsWithLuminance count];
  if (!result)
  {
    defaultImageURLs = self->_defaultImageURLs;
    return [(NSArray *)defaultImageURLs count];
  }
  return result;
}

- (void)imageThumbnailWithItemIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  if (self->_imageURLsWithLuminance)
  {
    imageCache = self->_imageCache;
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    uint64_t v10 = [(NSMutableDictionary *)imageCache objectForKeyedSubscript:v9];

    if (v10)
    {
      ((void (**)(void, void *, uint64_t))v7)[2](v7, v10, 1);
    }
    else
    {
      int v14 = [(WBSStartPageBackgroundImagesDataSource *)self _thumbnailURLWithItemIndex:a3];
      uint64_t v10 = [(WBSStartPageBackgroundImagesDataSource *)self imageURLAndLuminanceWithItemIndex:a3];
      uint64_t v15 = [v10 url];
      imageLoadingQueue = self->_imageLoadingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke;
      block[3] = &unk_1E5E44B78;
      id v20 = v15;
      v21 = self;
      id v22 = v14;
      int64_t v24 = a3;
      id v23 = v7;
      id v17 = v14;
      id v18 = v15;
      dispatch_async(imageLoadingQueue, block);
    }
  }
  else
  {
    uint64_t v10 = (void *)[v6 copy];
    v11 = (void *)MEMORY[0x1AD115160]();
    pendingImageThumbnailRequests = self->_pendingImageThumbnailRequests;
    uint64_t v13 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)pendingImageThumbnailRequests setObject:v11 forKeyedSubscript:v13];
  }
}

void __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"thumbnails"];
  id v4 = [*(id *)(a1 + 32) lastPathComponent];
  id v5 = [v3 URLByAppendingPathComponent:v4];

  id v6 = [v5 URLByDeletingPathExtension];
  CFURLRef v7 = [v6 URLByAppendingPathExtension:@"heic"];

  uint64_t v8 = CGImageSourceCreateWithURL(v7, 0);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v8, 0, 0));
  if (!v9)
  {
    if (v8) {
      CFRelease(v8);
    }
    uint64_t v8 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 32), 0);
    uint64_t v9 = [*(id *)(a1 + 40) _createThumbnail:*(void *)(a1 + 48) imageSource:v8];
  }
  CFRelease(v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke_2;
  v13[3] = &unk_1E5E44B50;
  uint64_t v10 = *(void *)(a1 + 40);
  v11 = *(void **)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  v13[4] = v10;
  id v14 = v9;
  id v15 = v11;
  id v12 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __81__WBSStartPageBackgroundImagesDataSource_imageThumbnailWithItemIndex_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 48);
  id v4 = [NSNumber numberWithInteger:a1[7]];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(uint64_t (**)(void))(a1[6] + 16);
  return v5();
}

- (id)imageURLAndLuminanceWithItemIndex:(int64_t)a3
{
  return [(NSArray *)self->_imageURLsWithLuminance objectAtIndexedSubscript:a3];
}

- (id)_thumbnailURLWithItemIndex:(int64_t)a3
{
  id v4 = [(NSArray *)self->_imageURLsWithLuminance objectAtIndexedSubscript:a3];
  id v5 = [v4 url];
  id v6 = [v5 lastPathComponent];

  CFURLRef v7 = [(NSURL *)self->_thumbnailsPath URLByAppendingPathComponent:v6 isDirectory:0];
  uint64_t v8 = [v7 URLByDeletingPathExtension];

  uint64_t v9 = [v8 URLByDeletingPathExtension];
  uint64_t v10 = [v9 URLByAppendingPathExtension:@"heic"];

  return v10;
}

- (id)_createThumbnail:(id)a3 imageSource:(CGImageSource *)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  CFURLRef v6 = (const __CFURL *)a3;
  CFURLRef v7 = CGImageSourceCreateWithURL(v6, 0);
  uint64_t v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v7, 0, 0));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v11 = [v10 integerForKey:@"ShowBackgroundImageThumbnailSize"];

    uint64_t v12 = 1024;
    if (v11 < 1024) {
      uint64_t v12 = v11;
    }
    if (v12 <= 128) {
      uint64_t v12 = 128;
    }
    if (v11) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 512;
    }
    uint64_t v14 = *MEMORY[0x1E4F2FE38];
    uint64_t v15 = MEMORY[0x1E4F1CC38];
    v26[0] = MEMORY[0x1E4F1CC38];
    uint64_t v16 = *MEMORY[0x1E4F2FF68];
    v25[0] = v14;
    v25[1] = v16;
    id v17 = [NSNumber numberWithInteger:v13];
    v25[2] = *MEMORY[0x1E4F2FE48];
    v26[1] = v17;
    v26[2] = v15;
    CFDictionaryRef v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

    v19 = objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateThumbnailAtIndex(a4, 0, v18));
    imageSavingQueue = self->_imageSavingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__WBSStartPageBackgroundImagesDataSource__createThumbnail_imageSource___block_invoke;
    block[3] = &unk_1E5E407D0;
    CFURLRef v23 = v6;
    id v9 = v19;
    id v24 = v9;
    dispatch_async(imageSavingQueue, block);
  }
  return v9;
}

BOOL __71__WBSStartPageBackgroundImagesDataSource__createThumbnail_imageSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  id v4 = (id)objc_msgSend(v2, "safari_ensureDirectoryExists:", v3);

  uint64_t v5 = [*(id *)(a1 + 40) CGImage];
  uint64_t v6 = *(void *)(a1 + 32);
  return +[WBSImageUtilities saveCGImage:v5 toFile:v6 options:0];
}

- (int64_t)indexOfBackgroundImageWithName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    imageURLsWithLuminance = self->_imageURLsWithLuminance;
    if (imageURLsWithLuminance)
    {
      uint64_t v6 = v12;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke;
      v12[3] = &unk_1E5E44BA0;
      v12[4] = v4;
      uint64_t v7 = [(NSArray *)imageURLsWithLuminance indexOfObjectPassingTest:v12];
    }
    else
    {
      defaultImageURLs = self->_defaultImageURLs;
      uint64_t v6 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke_2;
      v11[3] = &unk_1E5E44BC8;
      v11[4] = v4;
      uint64_t v7 = [(NSArray *)defaultImageURLs indexOfObjectPassingTest:v11];
    }
    int64_t v8 = v7;
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

uint64_t __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 url];
  uint64_t v5 = [v4 URLByDeletingPathExtension];
  uint64_t v6 = [v5 lastPathComponent];
  if ([v6 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v7 = 1;
  }
  else
  {
    int64_t v8 = [v3 url];
    id v9 = [v8 lastPathComponent];
    uint64_t v7 = [v9 isEqualToString:*(void *)(a1 + 32)];
  }
  return v7;
}

uint64_t __73__WBSStartPageBackgroundImagesDataSource_indexOfBackgroundImageWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailsPath, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_pendingImageThumbnailRequests, 0);
  objc_storeStrong((id *)&self->_imageURLsWithLuminance, 0);
  objc_storeStrong((id *)&self->_defaultImageURLs, 0);
  objc_storeStrong((id *)&self->_imageSavingQueue, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
}

void __88__WBSStartPageBackgroundImagesDataSource_initWithBuiltInImageURLs_localCachesDirectory___block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Unable to read background images from primary or fallback path: %{public}@", buf, 0xCu);
}

@end