@interface IMRenderingCache
- (BOOL)hasImageForKey:(id)a3;
- (CGSize)primaryImageSize;
- (CGSize)scaleAdjustedImageSize:(CGSize)result;
- (IMMemoryCache)memoryCache;
- (IMRenderingCache)initWithIdentifier:(id)a3 memorySize:(int64_t)a4;
- (NSString)identifier;
- (NSString)persistentCachePath;
- (SEL)selectorForTarget:(id)a3;
- (double)scale;
- (id)_persistentCacheFileName;
- (id)cacheDirectory;
- (id)cachePrefix;
- (id)fetchImageForAssetID:(id)a3 prefix:(id)a4 size:(CGSize)a5;
- (id)fetchImageForKey:(id)a3;
- (id)fetchImageForKey:(id)a3 canAcceptSurfaceBacked:(BOOL)a4;
- (id)findRenderingCacheOperationInQueue:(id)a3 withStorageKey:(id)a4 target:(id)a5 selector:(SEL)a6 context:(id)a7;
- (id)findRenderingCacheOperationWithStorageKey:(id)a3 target:(id)a4 selector:(SEL)a5 context:(id)a6;
- (id)keyForAssetID:(id)a3 prefix:(id)a4 size:(CGSize)a5;
- (id)keyPrefixForPage:(int64_t)a3;
- (id)persistentCacheFileName;
- (id)renderQueue;
- (id)renderingCacheOperationsForSize:(CGSize)a3;
- (int)serializeFormat;
- (int64_t)cacheVersion;
- (void)cancelRenderingCacheOperations;
- (void)cancelRenderingCacheOperationsForTarget:(id)a3;
- (void)cancelRenderingCacheOperationsForTarget:(id)a3 context:(id)a4;
- (void)cancelRenderingCacheOperationsInQueue:(id)a3;
- (void)cancelRenderingCacheOperationsInQueue:(id)a3 forTarget:(id)a4;
- (void)cancelRenderingCacheOperationsInQueue:(id)a3 forTarget:(id)a4 context:(id)a5;
- (void)clear;
- (void)dealloc;
- (void)enqueueRenderingCacheOperation:(id)a3;
- (void)imRenderingCacheDidReceiveMemoryWarning:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resume;
- (void)setIdentifier:(id)a3;
- (void)setMemoryCache:(id)a3;
- (void)setPersistentCachePath:(id)a3;
- (void)setPrimaryImageSize:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)storeImage:(id)a3 forKey:(id)a4 size:(CGSize)a5 format:(int)a6;
- (void)suspend;
@end

@implementation IMRenderingCache

- (IMRenderingCache)initWithIdentifier:(id)a3 memorySize:(int64_t)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IMRenderingCache;
  v7 = [(IMRenderingCache *)&v31 init];
  if (v7)
  {
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"imRenderingCacheDidReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];

    v7->_primaryImageSize = CGSizeZero;
    v9 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    writeQueue = v7->_writeQueue;
    v7->_writeQueue = v9;

    [(NSOperationQueue *)v7->_writeQueue setMaxConcurrentOperationCount:1];
    v11 = (NSString *)[v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = v11;

    v13 = [(IMRenderingCache *)v7 _persistentCacheFileName];
    v14 = [(IMRenderingCache *)v7 cacheDirectory];
    id v15 = objc_alloc_init((Class)NSFileManager);
    id v30 = 0;
    unsigned __int8 v16 = [v15 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v30];
    id v17 = v30;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      v19 = [v17 localizedDescription];
      +[NSException raise:NSInternalInconsistencyException, @"Could not create cacheDirectory %@ [Error: %@]", v14, v19 format];
    }
    v20 = [v14 stringByAppendingPathComponent:v13];
    [(IMRenderingCache *)v7 setPersistentCachePath:v20];
    v21 = +[IMPersistentCacheManager sharedInstance];
    v22 = [(IMRenderingCache *)v7 persistentCachePath];
    v23 = [v21 cacheForPath:v22 maxSize:0];

    if (a4 >= 1)
    {
      v24 = objc_alloc_init(IMMemoryCache);
      memoryCache = v7->_memoryCache;
      v7->_memoryCache = v24;

      [(IMMemoryCache *)v7->_memoryCache setTotalCostLimit:a4];
    }
    if (+[UIScreen instancesRespondToSelector:"scale"])
    {
      v26 = +[UIScreen mainScreen];
      [v26 scale];
      v7->_scale = v27;

      BOOL v28 = v7->_scale != 1.0;
    }
    else
    {
      BOOL v28 = 0;
      v7->_scale = 1.0;
    }
    v7->_scaleNeeded = v28;
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(IMRenderingCache *)self cancelRenderingCacheOperations];
  [(NSOperationQueue *)self->_renderQueue cancelAllOperations];
  [(NSOperationQueue *)self->_renderQueue removeObserver:self forKeyPath:@"operations" context:&off_341F38];
  renderQueue = self->_renderQueue;
  self->_renderQueue = 0;

  [(NSOperationQueue *)self->_writeQueue cancelAllOperations];
  writeQueue = self->_writeQueue;
  self->_writeQueue = 0;

  id v6 = +[IMPersistentCacheManager sharedInstance];
  v7 = [(IMRenderingCache *)self persistentCachePath];
  [v6 purgeFromCache:v7];

  memoryCache = self->_memoryCache;
  self->_memoryCache = 0;

  identifier = self->_identifier;
  self->_identifier = 0;

  v10.receiver = self;
  v10.super_class = (Class)IMRenderingCache;
  [(IMRenderingCache *)&v10 dealloc];
}

- (void)imRenderingCacheDidReceiveMemoryWarning:(id)a3
{
  [(NSOperationQueue *)self->_writeQueue cancelAllOperations];
  memoryCache = self->_memoryCache;

  [(IMMemoryCache *)memoryCache removeAllObjects];
}

- (CGSize)scaleAdjustedImageSize:(CGSize)result
{
  if (self->_scaleNeeded)
  {
    double scale = self->_scale;
    result.width = result.width * scale;
    result.height = result.height * scale;
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_341F38)
  {
    v7 = [(NSOperationQueue *)self->_renderQueue operations];
    id v8 = [v7 count];

    if (!v8)
    {
      [(IMRenderingCache *)self renderQueuesEmptied];
    }
  }
}

- (id)renderQueue
{
  renderQueue = self->_renderQueue;
  if (!renderQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_renderQueue;
    self->_renderQueue = v4;

    [(NSOperationQueue *)self->_renderQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_renderQueue addObserver:self forKeyPath:@"operations" options:0 context:&off_341F38];
    renderQueue = self->_renderQueue;
  }

  return renderQueue;
}

- (void)suspend
{
  id v2 = [(IMRenderingCache *)self renderQueue];
  [v2 setSuspended:1];
}

- (void)resume
{
  id v2 = [(IMRenderingCache *)self renderQueue];
  [v2 setSuspended:0];
}

- (void)clear
{
  [(IMRenderingCache *)self cancelRenderingCacheOperations];
  [(IMMemoryCache *)self->_memoryCache removeAllObjects];
  v3 = +[IMPersistentCacheManager sharedInstance];
  v4 = [(IMRenderingCache *)self persistentCachePath];
  id v7 = [v3 cacheForPath:v4 maxSize:0];

  [v7 clear];
  v5 = +[IMPersistentCacheManager sharedInstance];
  id v6 = [(IMRenderingCache *)self persistentCachePath];
  [v5 purgeFromCache:v6];
}

- (void)cancelRenderingCacheOperationsInQueue:(id)a3
{
  v3 = [a3 operations];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 setImageCache:0];
          [v8 setTarget:0];
          [v8 setContext:0];
          [v8 cancel];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)cancelRenderingCacheOperationsInQueue:(id)a3 forTarget:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v9 = [a3 operations];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 target];
          if (v15 == v7)
          {
            id v16 = [v14 context];

            if (v16 == v8)
            {
              [v14 setTarget:0];
              [v14 setContext:0];
              [v14 cancel];
            }
          }
          else
          {
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)cancelRenderingCacheOperationsInQueue:(id)a3 forTarget:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 operations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 target];

          if (v12 == v5)
          {
            [v11 setTarget:0];
            [v11 setContext:0];
            [v11 cancel];
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)findRenderingCacheOperationInQueue:(id)a3 withStorageKey:(id)a4 target:(id)a5 selector:(SEL)a6 context:(id)a7
{
  id v24 = a4;
  id v11 = a5;
  id v25 = a7;
  [a3 operations];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v13) {
    goto LABEL_18;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v27;
  do
  {
    long long v16 = 0;
    do
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        id v19 = [v18 target];
        if (v19 == v11 && [v18 selector] == a6)
        {
          id v20 = [v18 context];

          if (v20 == v25)
          {
            id v19 = [v18 storageKey];
            if (![v19 isEqualToString:v24]) {
              goto LABEL_9;
            }
            unsigned __int8 v21 = [v18 isCancelled];

            if ((v21 & 1) == 0) {
              goto LABEL_19;
            }
          }
        }
        else
        {
LABEL_9:
        }
      }
      long long v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    id v22 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    id v14 = v22;
  }
  while (v22);
LABEL_18:
  id v18 = 0;
LABEL_19:

  return v18;
}

- (id)renderingCacheOperationsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self->_renderQueue;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(NSOperationQueue *)v5 operations];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v12 isCancelled] & 1) == 0)
        {
          id v13 = v12;
          [v13 desiredSize];
          if (v15 == width && v14 == height) {
            [v6 addObject:v13];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)cancelRenderingCacheOperations
{
}

- (void)cancelRenderingCacheOperationsForTarget:(id)a3 context:(id)a4
{
}

- (void)cancelRenderingCacheOperationsForTarget:(id)a3
{
}

- (void)enqueueRenderingCacheOperation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 desiredSize];
    double v6 = v5;
    [(IMRenderingCache *)self primaryImageSize];
    [v4 setThreadPriority:dbl_2A27B0[v6 < v7]];
    id v8 = [(IMRenderingCache *)self renderQueue];
    [v8 addOperation:v4];
  }
}

- (id)findRenderingCacheOperationWithStorageKey:(id)a3 target:(id)a4 selector:(SEL)a5 context:(id)a6
{
  return [(IMRenderingCache *)self findRenderingCacheOperationInQueue:self->_renderQueue withStorageKey:a3 target:a4 selector:a5 context:a6];
}

- (SEL)selectorForTarget:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    return "renderingCacheCallbackImage:context:pageNumber:";
  }
  return "renderingCacheCallbackImage:context:";
}

- (id)keyPrefixForPage:(int64_t)a3
{
  return +[NSString stringWithFormat:@"p%08lu", a3];
}

- (id)keyForAssetID:(id)a3 prefix:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  id v9 = (__CFString *)a4;
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &stru_2CE418;
  }
  if (width == CGSizeZero.width && height == CGSizeZero.height) {
    +[NSString stringWithFormat:@"%@;%@", v10, v8, v14, v15];
  }
  else {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@;%06dx%06d",
  }
      v10,
      v8,
      (int)width,
  id v12 = (int)height);

  return v12;
}

- (int)serializeFormat
{
  return 1;
}

- (int64_t)cacheVersion
{
  return 20210721;
}

- (id)cachePrefix
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)cacheDirectory
{
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = [v3 lastObject];

  double v5 = [(IMRenderingCache *)self cachePrefix];
  double v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

- (id)persistentCacheFileName
{
  return +[NSString stringWithFormat:@"ic-%@", self->_identifier];
}

- (id)_persistentCacheFileName
{
  v3 = [(IMRenderingCache *)self persistentCacheFileName];
  id v4 = +[NSNumber numberWithInteger:[(IMRenderingCache *)self cacheVersion]];
  double v5 = +[UIDevice currentDevice];
  double v6 = [v5 systemVersion];
  double v7 = +[NSString stringWithFormat:@"%@-%@-%@.cache", v3, v4, v6];

  return v7;
}

- (void)storeImage:(id)a3 forKey:(id)a4 size:(CGSize)a5 format:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v18 = a3;
  id v9 = a4;
  if (v18)
  {
    if ([v9 length])
    {
      [v18 size];
      double v11 = v10;
      [v18 size];
      [(IMMemoryCache *)self->_memoryCache setObject:v18 forKey:v9 cost:(unint64_t)(v11 * v12 + v11 * v12)];
      if (v6 != -1)
      {
        id v13 = [(IMRenderingCache *)self persistentCachePath];
        id v14 = [v13 length];

        if (v14)
        {
          uint64_t v15 = [IMRenderingCacheWriteOperation alloc];
          long long v16 = [(IMRenderingCache *)self persistentCachePath];
          long long v17 = [(IMRenderingCacheWriteOperation *)v15 initWithImage:v18 key:v9 format:v6 persistentCachePath:v16];

          if (+[NSThread isMainThread])
          {
            [(IMRenderingCacheWriteOperation *)v17 setThreadPriority:0.2];
            [(NSOperationQueue *)self->_writeQueue addOperation:v17];
          }
          else
          {
            [(IMRenderingCacheWriteOperation *)v17 start];
          }
        }
      }
    }
  }
}

- (BOOL)hasImageForKey:(id)a3
{
  id v4 = a3;
  double v5 = +[IMPersistentCacheManager sharedInstance];
  uint64_t v6 = [(IMRenderingCache *)self persistentCachePath];
  double v7 = [v5 cacheForPath:v6 maxSize:0];

  LOBYTE(v5) = [v7 hasItemForKey:v4];
  id v8 = +[IMPersistentCacheManager sharedInstance];
  id v9 = [(IMRenderingCache *)self persistentCachePath];
  [v8 purgeFromCache:v9];

  return (char)v5;
}

- (id)fetchImageForAssetID:(id)a3 prefix:(id)a4 size:(CGSize)a5
{
  uint64_t v6 = -[IMRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", a3, a4, a5.width, a5.height);
  double v7 = [(IMRenderingCache *)self fetchImageForKey:v6];

  return v7;
}

- (id)fetchImageForKey:(id)a3 canAcceptSurfaceBacked:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(IMMemoryCache *)self->_memoryCache objectForKey:v6];
  if (a4 || (NSClassFromString(@"SurfaceBackedUIImage"), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v16 = 0;
  id v8 = +[IMPersistentCacheManager sharedInstance];
  id v9 = [(IMRenderingCache *)self persistentCachePath];
  double v10 = [v8 cacheForPath:v9 maxSize:0];

  double v11 = (CGImage *)[v10 copyCGImageForKey:v6 resourceSize:&v16];
  if (v11)
  {
    double v12 = v11;
    double v7 = +[UIImage imageWithCGImage:v11];
    CGImageRelease(v12);
    if (v7) {
      [(IMMemoryCache *)self->_memoryCache setObject:v7 forKey:v6 cost:v16];
    }
  }
  else
  {
    double v7 = 0;
  }
  id v13 = +[IMPersistentCacheManager sharedInstance];
  id v14 = [(IMRenderingCache *)self persistentCachePath];
  [v13 purgeFromCache:v14];

LABEL_10:

  return v7;
}

- (id)fetchImageForKey:(id)a3
{
  return [(IMRenderingCache *)self fetchImageForKey:a3 canAcceptSurfaceBacked:1];
}

- (CGSize)primaryImageSize
{
  objc_copyStruct(v4, &self->_primaryImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setPrimaryImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_primaryImageSize, &v3, 16, 1, 0);
}

- (NSString)persistentCachePath
{
  return self->_persistentCachePath;
}

- (void)setPersistentCachePath:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (IMMemoryCache)memoryCache
{
  return self->_memoryCache;
}

- (void)setMemoryCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_persistentCachePath, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);

  objc_storeStrong((id *)&self->_renderQueue, 0);
}

@end