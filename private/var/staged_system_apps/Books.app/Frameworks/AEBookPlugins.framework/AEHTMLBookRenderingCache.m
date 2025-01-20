@interface AEHTMLBookRenderingCache
+ (void)purgeCacheForIdentifier:(id)a3;
- (AEHTMLBookRenderingCache)initWithIdentifier:(id)a3;
- (Class)operationClass;
- (id)_fetchImageForKey:(id)a3 size:(CGSize)a4;
- (id)_keyForAsset:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5;
- (id)findRenderingCacheOperationInQueue:(id)a3 withStorageKey:(id)a4 target:(id)a5 selector:(SEL)a6 context:(id)a7;
- (id)imageForSize:(CGSize)a3 data:(id)a4;
- (void)resetPrioritiesForPageNumber:(int64_t)a3;
@end

@implementation AEHTMLBookRenderingCache

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (AEHTMLBookRenderingCache)initWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AEHTMLBookRenderingCache;
  v3 = [(AEHTMLBookRenderingCache *)&v7 initWithIdentifier:a3 memorySize:0x80000];
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = v4;

    [(NSOperationQueue *)v3->_accessQueue setName:@"com.apple.itunesmobile.immemorycache"];
    [(NSOperationQueue *)v3->_accessQueue setMaxConcurrentOperationCount:1];
  }
  return v3;
}

+ (void)purgeCacheForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:v3 memorySize:0];

  [v4 clear];
}

- (id)imageForSize:(CGSize)a3 data:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_D8340;
  v28 = sub_D8350;
  id v29 = 0;
  if (v7)
  {
    if (width >= 16.0 && height >= 16.0)
    {
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_D8358;
      v19 = &unk_1DD428;
      double v22 = width;
      double v23 = height;
      id v20 = v7;
      v21 = &v24;
      v11 = +[NSBlockOperation blockOperationWithBlock:&v16];
      accessQueue = self->_accessQueue;
      v13 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11, v16, v17, v18, v19);
      [(NSOperationQueue *)accessQueue addOperations:v13 waitUntilFinished:1];

      v9 = (void *)v25[5];
    }
  }
  id v14 = v9;
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (id)findRenderingCacheOperationInQueue:(id)a3 withStorageKey:(id)a4 target:(id)a5 selector:(SEL)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a4;
  [(AEHTMLBookRenderingCache *)self operationClass];
  [v9 operations];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v16 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          id v17 = v16;
          v18 = [v17 storageKey:v21];
          if ([v18 isEqualToString:v10])
          {
            unsigned __int8 v19 = [v17 isCancelled];

            if ((v19 & 1) == 0) {
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  id v17 = 0;
LABEL_16:

  return v17;
}

- (id)_fetchImageForKey:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (width < 100.0) {
    goto LABEL_2;
  }
  id v9 = [(AEHTMLBookRenderingCache *)self memoryCache];
  v8 = [v9 objectForKey:v7];

  if (!v8)
  {
    id v24 = 0;
    id v10 = +[IMPersistentCacheManager sharedInstance];
    id v11 = [(AEHTMLBookRenderingCache *)self persistentCachePath];
    id v12 = [v10 cacheForPath:v11 maxSize:0];

    if ([(AEHTMLBookRenderingCache *)self serializeFormat] == 2)
    {
      NSLog(@"Getting Image for key %@ from persistent cache", v7);
      id v13 = (CGImage *)[v12 copyCGImageForKey:v7 resourceSize:&v24];
      if (!v13)
      {

        v8 = 0;
        goto LABEL_12;
      }
      uint64_t v14 = v13;
      double v15 = (double)CGImageGetWidth(v13);
      double v16 = (double)CGImageGetHeight(v14);
      DataProvider = CGImageGetDataProvider(v14);
      CFDataRef v18 = CGDataProviderCopyData(DataProvider);
      +[BKPictureBookViewGeometry imageSizeForSize:](BKPictureBookViewGeometry, "imageSizeForSize:", v15, v16);
      v8 = -[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v18);
      CFRelease(v18);
      CGImageRelease(v14);
    }
    else
    {
      unsigned __int8 v19 = [v12 dataForKey:v7];
      id v24 = [v19 length];
      +[BKPictureBookViewGeometry imageSizeForSize:](BKPictureBookViewGeometry, "imageSizeForSize:", width, height);
      v8 = -[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v19);
    }
    id v20 = +[IMPersistentCacheManager sharedInstance];
    long long v21 = [(AEHTMLBookRenderingCache *)self persistentCachePath];
    [v20 purgeFromCache:v21];

    if (!v8)
    {

LABEL_2:
      v8 = [(AEHTMLBookRenderingCache *)self fetchImageForKey:v7];
      goto LABEL_12;
    }
    long long v22 = [(AEHTMLBookRenderingCache *)self memoryCache];
    [v22 setObject:v8 forKey:v7 cost:v24];
  }
LABEL_12:

  return v8;
}

- (id)_keyForAsset:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = [(AEHTMLBookRenderingCache *)self keyPrefixForPage:a5];
  id v11 = [v9 assetID];

  id v12 = -[AEHTMLBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v11, v10, width, height);

  return v12;
}

- (void)resetPrioritiesForPageNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    [(AEHTMLBookRenderingCache *)self primaryImageSize];
    v6 = -[AEHTMLBookRenderingCache renderingCacheOperationsForSize:](self, "renderingCacheOperationsForSize:");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = [v11 pageNumber];
          if (a3 - (uint64_t)v12 >= 0) {
            unint64_t v13 = a3 - (void)v12;
          }
          else {
            unint64_t v13 = (unint64_t)v12 - a3;
          }
          if ((unint64_t)(a3 - (void)v12) >= 2) {
            uint64_t v14 = 4;
          }
          else {
            uint64_t v14 = 8;
          }
          if (v13 >= 4) {
            uint64_t v15 = -4;
          }
          else {
            uint64_t v15 = v14;
          }
          [v11 setQueuePriority:v15];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
}

@end