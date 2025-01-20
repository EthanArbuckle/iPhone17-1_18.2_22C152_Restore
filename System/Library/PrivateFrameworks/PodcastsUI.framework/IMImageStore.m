@interface IMImageStore
+ (double)defaultMaxImageDimensionInPixels;
+ (id)defaultAlternativeSizeBlock;
+ (id)defaultBasePath;
+ (id)defaultName;
+ (id)defaultStore;
+ (int)defaultImageResizeOptions;
+ (unint64_t)_memorySize;
+ (unint64_t)defaultMaxConcurrentOperations;
- (BOOL)disableMemoryCache;
- (BOOL)hasItemForKey:(id)a3;
- (BOOL)hasItemForKey:(id)a3 size:(CGSize)a4;
- (BOOL)hasItemForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5;
- (BOOL)isEmpty;
- (BOOL)requireSquareImages:(id)a3;
- (IMImageDiskCache)diskCache;
- (IMImageStore)init;
- (IMImageStore)initWithName:(id)a3;
- (IMImageStore)initWithName:(id)a3 basePath:(id)a4 maxImageDimensionInPixels:(double)a5 maxConcurrentOperations:(unint64_t)a6 alternativeSizeBlock:(id)a7;
- (IMMemoryCache)memoryCache;
- (NSOperationQueue)fetchOperationQueue;
- (NSString)name;
- (double)maxImageDimensionInPixels;
- (id)_createModifiedImageFromSourceKey:(id)a3 newImageKey:(id)a4 modifier:(id)a5 size:(CGSize)a6 resizeOptions:(int)a7;
- (id)_createScaledImageFromSourceKey:(id)a3 newImageKey:(id)a4 size:(CGSize)a5 resizeOptions:(int)a6;
- (id)_keyForSize:(CGSize)a3 baseKey:(id)a4;
- (id)_keyForSize:(CGSize)a3 baseKey:(id)a4 modifier:(id)a5;
- (id)_loadDiskCacheImageForKey:(id)a3 expectImageExists:(BOOL)a4;
- (id)_performImagingTransactionNamed:(id)a3 block:(id)a4;
- (id)alternativeSize;
- (id)fullName;
- (id)imageForKey:(id)a3;
- (id)imageForKey:(id)a3 size:(CGSize)a4;
- (id)imageForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5;
- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5;
- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6;
- (id)imageInMemoryForKey:(id)a3 size:(CGSize)a4;
- (id)imageInMemoryForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5;
- (id)imageUrlForKey:(id)a3;
- (void)_addImage:(id)a3 toMemoryCacheWithKey:(id)a4;
- (void)addImage:(id)a3 forKey:(id)a4;
- (void)addImage:(id)a3 forKey:(id)a4 persist:(BOOL)a5;
- (void)addImage:(id)a3 forKey:(id)a4 persist:(BOOL)a5 discardTransparency:(BOOL)a6;
- (void)addImagesWithSourceUrl:(id)a3 forKeys:(id)a4 removeOldItems:(BOOL)a5 discardTransparency:(BOOL)a6 completion:(id)a7;
- (void)asyncImageForKey:(id)a3 completionHandler:(id)a4;
- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 completionHandler:(id)a5;
- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5 completionHandler:(id)a6;
- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 completionHandler:(id)a6;
- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6 completionHandler:(id)a7;
- (void)asyncImageForKey:(id)a3 squareDimension:(double)a4 cacheKeyModifier:(id)a5 completionHandler:(id)a6;
- (void)asyncImageURLForKey:(id)a3 completionHandler:(id)a4;
- (void)asyncImageURLForKey:(id)a3 squareDimension:(double)a4 cacheKeyModifier:(id)a5 completionHandler:(id)a6;
- (void)clearCache;
- (void)configureMemoryCache;
- (void)invalidateImageAtURL:(id)a3;
- (void)invalidateImageForKey:(id)a3;
- (void)memoryWarning;
- (void)onQueueInvalidateImageForKey:(id)a3;
- (void)performWhenURLAvailableForImageForKey:(id)a3 block:(id)a4;
- (void)removeItemForKey:(id)a3;
- (void)removeItemsWithPrefx:(id)a3;
- (void)setAlternativeSize:(id)a3;
- (void)setDisableMemoryCache:(BOOL)a3;
- (void)setFetchOperationQueue:(id)a3;
- (void)setMaxImageDimensionInPixels:(double)a3;
- (void)setName:(id)a3;
@end

@implementation IMImageStore

- (id)fullName
{
  v2 = NSString;
  v3 = [(IMImageStore *)self name];
  v4 = [v2 stringWithFormat:@"IMImageStore-%@", v3];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (IMImageStore)init
{
  v3 = [(id)objc_opt_class() defaultName];
  v4 = [(IMImageStore *)self initWithName:v3];

  return v4;
}

- (IMImageStore)initWithName:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() defaultBasePath];
  [(id)objc_opt_class() defaultMaxImageDimensionInPixels];
  double v7 = v6;
  uint64_t v8 = [(id)objc_opt_class() defaultMaxConcurrentOperations];
  v9 = [(id)objc_opt_class() defaultAlternativeSizeBlock];
  v10 = [(IMImageStore *)self initWithName:v4 basePath:v5 maxImageDimensionInPixels:v8 maxConcurrentOperations:v9 alternativeSizeBlock:v7];

  return v10;
}

- (void)configureMemoryCache
{
  v3 = objc_alloc_init(IMMemoryCache);
  memoryCache = self->_memoryCache;
  self->_memoryCache = v3;

  v5 = [(IMImageStore *)self fullName];
  double v6 = [(IMImageStore *)self memoryCache];
  [v6 setName:v5];

  unint64_t v7 = +[IMImageStore _memorySize];
  id v8 = [(IMImageStore *)self memoryCache];
  [v8 setTotalCostLimit:v7];
}

- (IMMemoryCache)memoryCache
{
  return self->_memoryCache;
}

- (IMImageStore)initWithName:(id)a3 basePath:(id)a4 maxImageDimensionInPixels:(double)a5 maxConcurrentOperations:(unint64_t)a6 alternativeSizeBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v33.receiver = self;
  v33.super_class = (Class)IMImageStore;
  v15 = [(IMImageStore *)&v33 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    [(IMImageStore *)v15 configureMemoryCache];
    v18 = [IMImageDiskCache alloc];
    v19 = [(IMImageStore *)v15 fullName];
    v20 = [v13 stringByAppendingPathComponent:v19];
    uint64_t v21 = [(IMImageDiskCache *)v18 initWithBasePath:v20 maxImageDimensionInPixels:a5];
    diskCache = v15->_diskCache;
    v15->_diskCache = (IMImageDiskCache *)v21;

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v15 selector:sel_memoryWarning name:*MEMORY[0x1E4F91EE0] object:0];

    v24 = objc_opt_new();
    [(IMImageStore *)v15 setFetchOperationQueue:v24];

    v25 = [(IMImageStore *)v15 fetchOperationQueue];
    [v25 setMaxConcurrentOperationCount:a6];

    v26 = dispatch_get_global_queue(0, 0);
    v27 = [(IMImageStore *)v15 fetchOperationQueue];
    [v27 setUnderlyingQueue:v26];

    v28 = [(IMImageStore *)v15 fetchOperationQueue];
    [v28 setName:@"com.apple.podcasts.IMImageStore"];

    v29 = [(IMImageStore *)v15 fetchOperationQueue];
    [v29 setSuspended:0];

    v30 = _Block_copy(v14);
    id alternativeSize = v15->_alternativeSize;
    v15->_id alternativeSize = v30;

    [(IMImageStore *)v15 setMaxImageDimensionInPixels:a5];
  }

  return v15;
}

- (NSOperationQueue)fetchOperationQueue
{
  return self->_fetchOperationQueue;
}

- (void)setMaxImageDimensionInPixels:(double)a3
{
  self->_maxImageDimensionInPixels = a3;
}

- (void)setFetchOperationQueue:(id)a3
{
}

+ (id)defaultName
{
  return @"Default";
}

+ (unint64_t)defaultMaxConcurrentOperations
{
  return -1;
}

+ (id)defaultAlternativeSizeBlock
{
  return &__block_literal_global_15;
}

+ (unint64_t)_memorySize
{
  if (physicalMemory() >= 0x3B9ACA00) {
    return 0x4000000;
  }
  else {
    return 0x2000000;
  }
}

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__IMImageStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken_0 != -1) {
    dispatch_once(&defaultStore_onceToken_0, block);
  }
  v2 = (void *)defaultStore_defaultStore_0;

  return v2;
}

uint64_t __28__IMImageStore_defaultStore__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = defaultStore_defaultStore_0;
  defaultStore_defaultStore_0 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)defaultBasePath
{
  return (id)[MEMORY[0x1E4FB1438] applicationDocumentsDirectory];
}

+ (double)defaultMaxImageDimensionInPixels
{
  return 1.79769313e308;
}

+ (int)defaultImageResizeOptions
{
  return 1;
}

- (BOOL)requireSquareImages:(id)a3
{
  return 0;
}

- (void)setDisableMemoryCache:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(IMImageStore *)self memoryCache];

  if (v3)
  {
    if (v5)
    {
      double v6 = [(IMImageStore *)self memoryCache];
      [v6 removeAllObjects];

      memoryCache = self->_memoryCache;
      self->_memoryCache = 0;
    }
  }
  else if (!v5)
  {
    [(IMImageStore *)self configureMemoryCache];
  }
}

- (BOOL)disableMemoryCache
{
  uint64_t v2 = [(IMImageStore *)self memoryCache];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)addImage:(id)a3 forKey:(id)a4
{
}

- (void)addImage:(id)a3 forKey:(id)a4 persist:(BOOL)a5
{
}

- (void)addImage:(id)a3 forKey:(id)a4 persist:(BOOL)a5 discardTransparency:(BOOL)a6
{
  BOOL v6 = a6;
  id v19 = a3;
  id v10 = a4;
  id v11 = v19;
  id v12 = v10;
  if (v19 && v10)
  {
    if (!a5)
    {
      if (v6)
      {
        v17 = [MEMORY[0x1E4FB1618] whiteColor];
        uint64_t v18 = objc_msgSend(v19, "im_imageWithBackgroundColor:", v17);

        id v11 = (id)v18;
      }
      v15 = self;
      id v16 = v11;
      id v19 = v11;
      goto LABEL_10;
    }
    id v13 = [(IMImageStore *)self diskCache];
    char v14 = [v13 addImage:v19 forKey:v12];

    if ((v14 & 1) == 0 && !v6)
    {
      v15 = self;
      id v16 = v19;
LABEL_10:
      [(IMImageStore *)v15 _addImage:v16 toMemoryCacheWithKey:v12];
    }
  }
}

- (void)addImagesWithSourceUrl:(id)a3 forKeys:(id)a4 removeOldItems:(BOOL)a5 discardTransparency:(BOOL)a6 completion:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke;
  aBlock[3] = &unk_1E6E20058;
  id v14 = v13;
  id v39 = v14;
  id v15 = a4;
  id v16 = _Block_copy(aBlock);
  v17 = [v15 objectsPassingTest:&__block_literal_global_30_0];

  uint64_t v18 = [MEMORY[0x1E4F91F08] imageCache];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v42 = v12;
    __int16 v43 = 2112;
    v44 = v17;
    __int16 v45 = 1024;
    BOOL v46 = v9;
    __int16 v47 = 1024;
    int v48 = v8;
    _os_log_impl(&dword_1E3BC5000, v18, OS_LOG_TYPE_DEFAULT, "[Store] addImagesWithSourceUrl: got store-image request (fileUrl=%@, keys=%@, removeOldItem=%d, discardTransparency=%d", buf, 0x22u);
  }

  if (v12 && [v17 count])
  {
    if (v9)
    {
      unsigned int v29 = v8;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            [(IMImageStore *)self removeItemsWithPrefx:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v21);
      }

      uint64_t v8 = v29;
    }
    v24 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v12;
      __int16 v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_1E3BC5000, v24, OS_LOG_TYPE_DEFAULT, "[Store] addImagesWithSourceUrl: adding to disk-cache (fileUrl = %@, keys=%@)", buf, 0x16u);
    }

    v25 = [(IMImageStore *)self diskCache];
    v26 = [v17 anyObject];
    BOOL v27 = [(IMImageStore *)self requireSquareImages:v26];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke_32;
    v30[3] = &unk_1E6E20810;
    id v31 = v12;
    id v32 = v17;
    id v33 = v16;
    [v25 addImagesWithSourceUrl:v31 forKeys:v32 discardTransparency:v8 enforceSquare:v27 completion:v30];
  }
  else
  {
    v28 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v12;
      __int16 v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_1E3BC5000, v28, OS_LOG_TYPE_ERROR, "[Store] addImagesWithSourceUrl: invalid requests (fileUrl = %@, validKeys=%@), bailing.", buf, 0x16u);
    }

    (*((void (**)(void *, void))v16 + 2))(v16, 0);
  }
}

uint64_t __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

uint64_t __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke_32(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F91F08] imageCache];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "[Store] addImagesWithSourceUrl: finished adding to disk-cache (fileUrl = %@, keys=%@)", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)imageForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(IMImageStore *)self memoryCache];
    int v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      int v6 = [(IMImageStore *)self _loadDiskCacheImageForKey:v4 expectImageExists:0];
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  __int16 v8 = -[IMImageStore imageForKey:size:resizeOptions:](self, "imageForKey:size:resizeOptions:", v7, [(id)objc_opt_class() defaultImageResizeOptions], width, height);

  return v8;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5
{
  return -[IMImageStore imageForKey:size:resizeOptions:modifier:](self, "imageForKey:size:resizeOptions:modifier:", a3, *(void *)&a5, 0, a4.width, a4.height);
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  uint64_t v9 = -[IMImageStore imageForKey:size:resizeOptions:modifier:](self, "imageForKey:size:resizeOptions:modifier:", v8, [(id)objc_opt_class() defaultImageResizeOptions], 0, width, height);

  return v9;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (![v11 length])
  {
LABEL_10:
    id v15 = 0;
    goto LABEL_14;
  }
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    id v14 = [MEMORY[0x1E4F91F08] defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v26 = 134218240;
      double v27 = width;
      __int16 v28 = 2048;
      double v29 = height;
      _os_log_impl(&dword_1E3BC5000, v14, OS_LOG_TYPE_ERROR, "Invalid arguments. Size must be non-zero in both dimensions. (width: %f, height: %f)", (uint8_t *)&v26, 0x16u);
    }

    goto LABEL_10;
  }
  id v16 = -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v11, v12, width, height);
  uint64_t v17 = [(IMImageStore *)self imageForKey:v16];
  if (!v17)
  {
    id v19 = [(IMImageStore *)self alternativeSize];
    [(IMImageStore *)self maxImageDimensionInPixels];
    double v21 = v19[2](v19, width, height, v20);
    double v23 = v22;

    if (width == v21 && height == v23)
    {
      double v23 = height;
    }
    else
    {
      uint64_t v25 = -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v11, v12, v21, v23);

      id v15 = [(IMImageStore *)self imageForKey:v25];
      id v16 = (void *)v25;
      double width = v21;
      if (v15) {
        goto LABEL_13;
      }
    }
    if ([v12 hasModifications]) {
      -[IMImageStore _createModifiedImageFromSourceKey:newImageKey:modifier:size:resizeOptions:](self, "_createModifiedImageFromSourceKey:newImageKey:modifier:size:resizeOptions:", v11, v16, v12, v7, width, v23);
    }
    else {
    uint64_t v17 = -[IMImageStore _createScaledImageFromSourceKey:newImageKey:size:resizeOptions:](self, "_createScaledImageFromSourceKey:newImageKey:size:resizeOptions:", v11, v16, v7, width, v23);
    }
  }
  id v15 = (void *)v17;
LABEL_13:

LABEL_14:

  return v15;
}

- (id)_createModifiedImageFromSourceKey:(id)a3 newImageKey:(id)a4 modifier:(id)a5 size:(CGSize)a6 resizeOptions:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double height = a6.height;
  double width = a6.width;
  id v13 = a4;
  id v14 = a5;
  id v15 = -[IMImageStore imageForKey:size:resizeOptions:](self, "imageForKey:size:resizeOptions:", a3, v7, width, height);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__IMImageStore__createModifiedImageFromSourceKey_newImageKey_modifier_size_resizeOptions___block_invoke;
  v21[3] = &unk_1E6E20838;
  id v22 = v15;
  id v23 = v14;
  v24 = self;
  id v25 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v15;
  id v19 = [(IMImageStore *)self _performImagingTransactionNamed:@"image blur" block:v21];

  return v19;
}

id __90__IMImageStore__createModifiedImageFromSourceKey_newImageKey_modifier_size_resizeOptions___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "imageFromSourceImage:");
    if (v2) {
      [*(id *)(a1 + 48) addImage:v2 forKey:*(void *)(a1 + 56)];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_createScaledImageFromSourceKey:(id)a3 newImageKey:(id)a4 size:(CGSize)a5 resizeOptions:(int)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__IMImageStore__createScaledImageFromSourceKey_newImageKey_size_resizeOptions___block_invoke;
  v17[3] = &unk_1E6E20860;
  v17[4] = self;
  id v18 = v11;
  CGFloat v20 = width;
  CGFloat v21 = height;
  id v19 = v12;
  int v22 = a6;
  id v13 = v12;
  id v14 = v11;
  id v15 = [(IMImageStore *)self _performImagingTransactionNamed:@"image resize" block:v17];

  return v15;
}

id __79__IMImageStore__createScaledImageFromSourceKey_newImageKey_size_resizeOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) imageForKey:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = *(double *)(a1 + 64);
    [v2 size];
    if (v4 <= v5 && (double v6 = *(double *)(a1 + 56), [v3 size], v6 <= v7))
    {
      uint64_t v9 = [MEMORY[0x1E4F91F08] imageCache];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        id v12 = NSStringFromCGSize(*(CGSize *)(a1 + 56));
        int v14 = 138412802;
        uint64_t v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        id v19 = v12;
        _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "[ImageResize] in-memory image resizing in _createScaledImageFromSourceKey: (sourceImageKey = %@, newImageKey = %@, size = %@)", (uint8_t *)&v14, 0x20u);
      }
      objc_msgSend(v3, "imageWithSize:resizeOptions:", *(unsigned int *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) addImage:v8 forKey:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = v3;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_performImagingTransactionNamed:(id)a3 block:(id)a4
{
  double v5 = (__CFString *)a3;
  double v6 = v5;
  if (a4)
  {
    double v7 = @"unknown transaction";
    if (v5) {
      double v7 = v5;
    }
    id v8 = v7;
    uint64_t v9 = (void (**)(void))a4;

    double v6 = v8;
    [(__CFString *)v6 UTF8String];
    uint64_t v10 = (void *)os_transaction_create();
    v9[2](v9);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return a4;
}

- (id)imageInMemoryForKey:(id)a3 size:(CGSize)a4
{
  return -[IMImageStore imageInMemoryForKey:size:modifier:](self, "imageInMemoryForKey:size:modifier:", a3, 0, a4.width, a4.height);
}

- (id)imageInMemoryForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    id v12 = [MEMORY[0x1E4F91F08] defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v22 = 134218240;
      double v23 = width;
      __int16 v24 = 2048;
      double v25 = height;
      _os_log_impl(&dword_1E3BC5000, v12, OS_LOG_TYPE_ERROR, "Invalid arguments. Size must be non-zero in both dimensions. (width: %f, height: %f)", (uint8_t *)&v22, 0x16u);
    }

    uint64_t v20 = 0;
  }
  else
  {
    id v13 = [(IMImageStore *)self alternativeSize];
    [(IMImageStore *)self maxImageDimensionInPixels];
    double v15 = v13[2](v13, width, height, v14);
    double v17 = v16;

    __int16 v18 = -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v9, v10, v15, v17);
    id v19 = [(IMImageStore *)self memoryCache];
    uint64_t v20 = [v19 objectForKey:v18];
  }

  return v20;
}

- (id)imageUrlForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(IMImageStore *)self diskCache];
  double v6 = [v5 imageUrlForKey:v4];

  return v6;
}

- (void)asyncImageForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(IMImageStore *)self fetchOperationQueue];
  id v9 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke;
  double v16 = &unk_1E6E208B0;
  objc_copyWeak(&v19, &location);
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  id v12 = [v9 blockOperationWithBlock:&v13];
  objc_msgSend(v8, "addOperation:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained imageForKey:a1[4]];
  if (a1[5])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke_2;
    block[3] = &unk_1E6E20888;
    id v7 = a1[5];
    id v5 = v3;
    id v6 = a1[4];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](self, "asyncImageForKey:size:resizeOptions:modifier:completionHandler:", v10, [(id)objc_opt_class() defaultImageResizeOptions], 0, v9, width, height);
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 completionHandler:(id)a6
{
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](self, "asyncImageForKey:size:resizeOptions:modifier:completionHandler:", v13, [(id)objc_opt_class() defaultImageResizeOptions], v12, v11, width, height);
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6 completionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  double v16 = [(IMImageStore *)self fetchOperationQueue];
  id v17 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke;
  double v25 = &unk_1E6E208D8;
  objc_copyWeak(v29, &location);
  id v18 = v13;
  id v26 = v18;
  v29[1] = *(id *)&width;
  v29[2] = *(id *)&height;
  int v30 = a5;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  CGFloat v21 = [v17 blockOperationWithBlock:&v22];
  objc_msgSend(v16, "addOperation:", v21, v22, v23, v24, v25);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

void __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = objc_msgSend(WeakRetained, "imageForKey:size:resizeOptions:modifier:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke_2;
    block[3] = &unk_1E6E20888;
    id v7 = *(id *)(a1 + 48);
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)asyncImageForKey:(id)a3 squareDimension:(double)a4 cacheKeyModifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__IMImageStore_asyncImageForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke;
  v12[3] = &unk_1E6E20900;
  id v13 = v10;
  id v11 = v10;
  [(IMImageStore *)self asyncImageURLForKey:a3 squareDimension:a5 cacheKeyModifier:v12 completionHandler:a4];
}

void __84__IMImageStore_asyncImageForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = [a2 path];
  id v7 = [v5 imageWithContentsOfFile:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v9);
  }
}

- (void)asyncImageURLForKey:(id)a3 squareDimension:(double)a4 cacheKeyModifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6E20928;
  id v13 = v12;
  id v33 = v13;
  id v14 = v10;
  id v32 = v14;
  id v15 = _Block_copy(aBlock);
  -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v14, 0, a4, a4);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v16;
  if ([v11 length])
  {
    id v17 = [NSString stringWithFormat:@"%@-%@", v16, v11];
  }
  id v18 = [(IMImageStore *)self fetchOperationQueue];
  id v19 = (void *)MEMORY[0x1E4F28B48];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_2;
  v25[3] = &unk_1E6E20978;
  v25[4] = self;
  id v26 = v16;
  id v28 = v14;
  id v29 = v15;
  id v27 = v17;
  double v30 = a4;
  id v20 = v14;
  id v21 = v17;
  id v22 = v15;
  id v23 = v16;
  __int16 v24 = [v19 blockOperationWithBlock:v25];
  [v18 addOperation:v24];
}

uint64_t __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    id v7 = v3;
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    }
    else
    {
      id v5 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v4 = v7;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

void __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) diskCache];
  if ([v2 hasItemForKey:*(void *)(a1 + 40)]
    && ([v2 pathForKey:*(void *)(a1 + 40)], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || [v2 hasItemForKey:*(void *)(a1 + 48)]
    && ([v2 pathForKey:*(void *)(a1 + 48)], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    id v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_9:
    v5();
    goto LABEL_10;
  }
  id v6 = [*(id *)(a1 + 32) diskCache];
  id v4 = [v6 imageUrlForKey:*(void *)(a1 + 56)];

  if (!v4)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6;
  v18[4] = __Block_byref_object_dispose__6;
  id v7 = v2;
  id v19 = v7;
  double v8 = *(double *)(a1 + 72);
  id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = v10;

  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = [*(id *)(a1 + 32) requireSquareImages:*(void *)(a1 + 56)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_51;
  v14[3] = &unk_1E6E20950;
  id v17 = v18;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 64);
  [v7 addImageWithSourceUrl:v4 forKey:v12 enforceSquare:v13 maxDimensionInPixels:v14 completion:v8 * v11];

  _Block_object_dispose(v18, 8);
LABEL_10:
}

void __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_51(void *a1)
{
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) hasItemForKey:a1[4]])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) pathForKey:a1[4]];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)asyncImageURLForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3042000000;
  v17[3] = __Block_byref_object_copy__52;
  v17[4] = __Block_byref_object_dispose__53;
  objc_initWeak(&v18, self);
  double v8 = [(IMImageStore *)self fetchOperationQueue];
  id v9 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__IMImageStore_asyncImageURLForKey_completionHandler___block_invoke;
  v13[3] = &unk_1E6E209A0;
  id v16 = v17;
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  uint64_t v12 = [v9 blockOperationWithBlock:v13];
  [v8 addOperation:v12];

  _Block_object_dispose(v17, 8);
  objc_destroyWeak(&v18);
}

void __54__IMImageStore_asyncImageURLForKey_completionHandler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[6] + 8) + 40));
  id v3 = [WeakRetained diskCache];
  id v5 = [v3 imageUrlForKey:a1[4]];

  uint64_t v4 = a1[5];
  if (v4) {
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v5, a1[4]);
  }
}

- (void)clearCache
{
  id v3 = [(IMImageStore *)self memoryCache];
  [v3 removeAllObjects];

  id v4 = [(IMImageStore *)self diskCache];
  [v4 clearCache];
}

- (BOOL)hasItemForKey:(id)a3 size:(CGSize)a4
{
  return -[IMImageStore hasItemForKey:size:modifier:](self, "hasItemForKey:size:modifier:", a3, 0, a4.width, a4.height);
}

- (BOOL)hasItemForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4.width < 0.00000011920929 || a4.height < 0.00000011920929)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F91F08], "defaultCategory", a3, a5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218240;
      CGFloat v13 = width;
      __int16 v14 = 2048;
      CGFloat v15 = height;
      _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_ERROR, "Invalid arguments. Size must be non-zero in both dimensions. (width: %f, height: %f)", (uint8_t *)&v12, 0x16u);
    }

    return 0;
  }
  else
  {
    id v9 = self;
    id v10 = -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", a3, a5, a4.width, a4.height);
    LOBYTE(v9) = [(IMImageStore *)v9 hasItemForKey:v10];

    return (char)v9;
  }
}

- (BOOL)hasItemForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMImageStore *)self memoryCache];
    id v6 = [v5 objectForKey:v4];
    if (v6)
    {
      char v7 = 1;
    }
    else
    {
      double v8 = [(IMImageStore *)self diskCache];
      char v7 = [v8 hasItemForKey:v4];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)removeItemsWithPrefx:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(IMImageStore *)self memoryCache];
    [v4 removeObjectsForKeyWithPrefix:v6];

    id v5 = [(IMImageStore *)self diskCache];
    [v5 removeItemsWithPrefx:v6];
  }
}

- (void)removeItemForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMImageStore *)self memoryCache];
  [v5 removeObjectForKey:v4];

  id v6 = [(IMImageStore *)self diskCache];
  [v6 removeItemForKey:v4];
}

- (BOOL)isEmpty
{
  uint64_t v2 = [(IMImageStore *)self diskCache];
  char v3 = [v2 isEmpty];

  return v3;
}

- (id)_keyForSize:(CGSize)a3 baseKey:(id)a4
{
  return -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", a4, 0, a3.width, a3.height);
}

- (id)_keyForSize:(CGSize)a3 baseKey:(id)a4 modifier:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    id v11 = [NSString stringWithFormat:@"%@-{%f,%f}", v9, *(void *)&width, *(void *)&height];
    if (![v10 hasModifications])
    {
LABEL_5:
      id v11 = v11;
      __int16 v14 = v11;
      goto LABEL_13;
    }
    int v12 = [v10 modificationCacheKey];
    if ([v12 length])
    {
      uint64_t v13 = [v11 stringByAppendingFormat:@"-%@", v12];

      id v11 = v13;
      goto LABEL_5;
    }
    CGFloat v15 = [MEMORY[0x1E4F91F08] defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v29.CGFloat width = width;
      v29.CGFloat height = height;
      uint64_t v16 = NSStringFromCGSize(v29);
      *(_DWORD *)buf = 138413058;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1E3BC5000, v15, OS_LOG_TYPE_ERROR, "Invalid modifier cache key in call to -[%@ _keyForSize:%@ baseKey:%@ modifier:%@]", buf, 0x2Au);
    }
    goto LABEL_11;
  }
  id v11 = [MEMORY[0x1E4F91F08] defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v28.CGFloat width = width;
    v28.CGFloat height = height;
    int v12 = NSStringFromCGSize(v28);
    *(_DWORD *)buf = 138413058;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_ERROR, "Invalid baseKey encountered in call to -[%@ _keyForSize:%@ baseKey:%@ modifier:%@]", buf, 0x2Au);
LABEL_11:
  }
  __int16 v14 = 0;
LABEL_13:

  return v14;
}

- (void)memoryWarning
{
  id v2 = [(IMImageStore *)self memoryCache];
  [v2 removeAllObjects];
}

- (void)_addImage:(id)a3 toMemoryCacheWithKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (![(IMImageStore *)self disableMemoryCache])
  {
    id v7 = v12;
    double v8 = (CGImage *)[v7 CGImage];
    size_t BytesPerRow = CGImageGetBytesPerRow(v8);
    size_t v10 = CGImageGetHeight(v8) * BytesPerRow;
    id v11 = [(IMImageStore *)self memoryCache];
    [v11 setObject:v7 forKey:v6 cost:v10];
  }
}

- (id)_loadDiskCacheImageForKey:(id)a3 expectImageExists:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMImageStore *)self diskCache];
  double v8 = [v7 imageForKey:v6];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "_loadDiskCacheImageForKey: successfully loaded image forKey: %@", (uint8_t *)&v12, 0xCu);
    }

    [(IMImageStore *)self _addImage:v8 toMemoryCacheWithKey:v6];
  }
  else if (v4)
  {
    size_t v10 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_ERROR, "_loadDiskCacheImageForKey: failed to load image forKey: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v8;
}

- (void)performWhenURLAvailableForImageForKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke;
  aBlock[3] = &unk_1E6E20900;
  id v8 = v7;
  id v19 = v8;
  id v9 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  size_t v10 = [(IMImageStore *)self diskCache];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke_2;
  v13[3] = &unk_1E6E209C8;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v15 = v11;
  id v12 = v6;
  id v14 = v12;
  [v10 performWhenURLAvailableForImageForKey:v12 block:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (a2 & 1) != 0)
  {
    BOOL v4 = [WeakRetained diskCache];
    id v5 = [v4 imageUrlForKey:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)invalidateImageForKey:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(IMImageStore *)self fetchOperationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__IMImageStore_invalidateImageForKey___block_invoke;
  v7[3] = &unk_1E6E209F0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addOperationWithBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__IMImageStore_invalidateImageForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained onQueueInvalidateImageForKey:*(void *)(a1 + 32)];
}

- (void)onQueueInvalidateImageForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMImageStore *)self diskCache];
  id v7 = [v5 imageUrlForKey:v4];

  id v6 = v7;
  if (v7)
  {
    [(IMImageStore *)self invalidateImageAtURL:v7];
    id v6 = v7;
  }
}

- (void)invalidateImageAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URLByAppendingPathExtension:@"invalidated"];
  id v5 = [MEMORY[0x1E4F1C9B8] data];
  [v5 writeToURL:v4 atomically:0];
}

- (id)alternativeSize
{
  return self->_alternativeSize;
}

- (void)setAlternativeSize:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (double)maxImageDimensionInPixels
{
  return self->_maxImageDimensionInPixels;
}

- (IMImageDiskCache)diskCache
{
  return self->_diskCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_fetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong(&self->_alternativeSize, 0);
}

@end