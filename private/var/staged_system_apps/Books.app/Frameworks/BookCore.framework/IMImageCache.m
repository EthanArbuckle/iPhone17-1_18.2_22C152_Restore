@interface IMImageCache
+ (id)defaultCache;
- (BOOL)hasFastImageForKey:(id)a3;
- (BOOL)hasImageForKey:(id)a3;
- (BOOL)hasImageForKey:(id)a3 withSize:(CGSize)a4;
- (IMImageCache)initWithIdentifier:(id)a3 basePath:(id)a4 memorySize:(int64_t)a5;
- (IMImageCache)initWithIdentifier:(id)a3 memorySize:(int64_t)a4;
- (IMPersistentCache)persistentCache;
- (NSString)defaultType;
- (OS_dispatch_queue)persistenceQueue;
- (double)compareImage:(id)a3 withImage:(id)a4;
- (id)_fetchImageForKey:(id)a3;
- (id)genericKeyForSize:(CGSize)a3 withBaseKey:(id)a4;
- (id)imageForKey:(id)a3 size:(CGSize)a4;
- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5;
- (id)keyForSize:(CGSize)a3 withBaseKey:(id)a4;
- (id)keyForSize:(CGSize)a3 withBaseKey:(id)a4 suffix:(id)a5;
- (unint64_t)imageDataSizeForKey:(id)a3;
- (void)_histogramForImage:(id)a3 result:(unsigned int *)a4 size:(unsigned int)a5;
- (void)addImageFromURL:(id)a3 completionBlock:(id)a4 queue:(id)a5;
- (void)addImageFromURL:(id)a3 key:(id)a4 size:(CGSize)a5 completionBlock:(id)a6 queue:(id)a7;
- (void)addImageFromURL:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6;
- (void)dealloc;
- (void)flushAllCaches;
- (void)flushMemoryCache;
- (void)flushPersistentCache;
- (void)getImageMetadataForKey:(id)a3 size:(CGSize *)a4 scale:(double *)a5;
- (void)imageForKey:(id)a3 completionBlock:(id)a4 queue:(id)a5;
- (void)imageForKey:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6;
- (void)imageForKey:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6 options:(int)a7;
- (void)removeGenericImagesWithRootKey:(id)a3;
- (void)removeImageForKey:(id)a3;
- (void)removeImageForKey:(id)a3 synchronous:(BOOL)a4;
- (void)removeImageWithRootKey:(id)a3;
- (void)setDefaultType:(id)a3;
- (void)setImage:(id)a3 forKey:(id)a4;
- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5;
- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5 persist:(BOOL)a6;
- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5 persist:(BOOL)a6 properties:(id)a7;
- (void)setPersistenceQueue:(id)a3;
- (void)setPersistentCache:(id)a3;
@end

@implementation IMImageCache

+ (id)defaultCache
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_37C78;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_3455A8 != -1) {
    dispatch_once(&qword_3455A8, block);
  }
  v2 = (void *)qword_3455B0;

  return v2;
}

- (IMImageCache)initWithIdentifier:(id)a3 basePath:(id)a4 memorySize:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IMImageCache;
  v10 = [(IMImageCache *)&v26 init];
  if (v10)
  {
    v11 = objc_alloc_init(IMMemoryCache);
    memoryCache = v10->_memoryCache;
    v10->_memoryCache = v11;

    [(IMMemoryCache *)v10->_memoryCache setTotalCostLimit:a5];
    id v13 = objc_alloc_init((Class)NSFileManager);
    for (uint64_t i = 0; i != 3; ++i)
    {
      v15 = +[NSString stringWithFormat:@"ic-%@-%lu.cache", v8, i];
      v16 = [v9 stringByAppendingPathComponent:v15];

      if ([v13 fileExistsAtPath:v16]) {
        [v13 removeItemAtPath:v16 error:0];
      }
    }
    v17 = +[NSString stringWithFormat:@"ic-%@-%lu.cache", v8, 3];
    uint64_t v18 = [v9 stringByAppendingPathComponent:v17];
    persistentCachePath = v10->_persistentCachePath;
    v10->_persistentCachePath = (NSString *)v18;

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.iBooksX.IMImageCache.persistence", v20);
    persistenceQueue = v10->_persistenceQueue;
    v10->_persistenceQueue = (OS_dispatch_queue *)v21;

    v23 = +[IMPersistentCacheManager sharedInstance];
    v24 = [v23 cacheForPath:v10->_persistentCachePath maxSize:0];
    [(IMImageCache *)v10 setPersistentCache:v24];
  }
  return v10;
}

- (IMImageCache)initWithIdentifier:(id)a3 memorySize:(int64_t)a4
{
  id v6 = a3;
  v7 = +[UIApplication applicationCacheDirectory];
  id v8 = [(IMImageCache *)self initWithIdentifier:v6 basePath:v7 memorySize:a4];

  return v8;
}

- (void)dealloc
{
  v3 = +[IMPersistentCacheManager sharedInstance];
  [v3 purgeFromCache:self->_persistentCachePath];

  persistentCache = self->_persistentCache;
  self->_persistentCache = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMImageCache;
  [(IMImageCache *)&v5 dealloc];
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  if (self->_defaultType) {
    [(IMImageCache *)self setImage:a3 forKey:a4 type:self->_defaultType];
  }
  else {
    [(IMImageCache *)self setImage:a3 forKey:a4 type:@"image/png"];
  }
}

- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5
{
}

- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5 persist:(BOOL)a6 properties:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12)
  {
    v16 = [v12 im_CGImages];
    if ([v16 count])
    {
      BOOL v28 = v8;
      v29 = self;
      v30 = v15;
      v31 = v14;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = 0;
        uint64_t v21 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v40 != v21) {
              objc_enumerationMutation(v17);
            }
            v23 = *(CGImage **)(*((void *)&v39 + 1) + 8 * i);
            size_t BytesPerRow = CGImageGetBytesPerRow(v23);
            v20 += CGImageGetHeight(v23) * BytesPerRow;
          }
          id v19 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v19);
      }
      else
      {
        uint64_t v20 = 0;
      }

      v25 = [IMImageCacheObject alloc];
      [v12 size];
      objc_super v26 = -[IMImageCacheObject initWithImageRefs:imageSize:](v25, "initWithImageRefs:imageSize:", v17);
      [(IMImageCacheObject *)v26 setPersistedToDisk:!v28];
      [(IMMemoryCache *)v29->_memoryCache setObject:v26 forKey:v13 cost:v20];
      id v15 = v30;
      id v14 = v31;
      if (v28)
      {
        v27 = [(IMImageCache *)v29 persistenceQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_382B4;
        block[3] = &unk_2C4FE8;
        block[4] = v29;
        id v33 = v13;
        id v34 = v17;
        id v35 = v31;
        id v36 = v12;
        id v37 = v30;
        v38 = v26;
        dispatch_async(v27, block);
      }
    }
  }
}

- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5 persist:(BOOL)a6
{
}

- (void)flushMemoryCache
{
}

- (void)flushPersistentCache
{
  id v2 = [(IMImageCache *)self persistentCache];
  [v2 clear];
}

- (void)flushAllCaches
{
  [(IMImageCache *)self flushMemoryCache];

  [(IMImageCache *)self flushPersistentCache];
}

- (void)removeGenericImagesWithRootKey:(id)a3
{
  memoryCache = self->_memoryCache;
  id v5 = a3;
  [(IMMemoryCache *)memoryCache removeObjectsForKeyWithPrefix:v5 andSuffix:@"generic"];
  id v6 = [(IMImageCache *)self persistentCache];
  v7 = +[NSString stringWithFormat:@"%@%%", v5];

  BOOL v8 = +[NSString stringWithFormat:@"%%%@", @"generic", v7];
  v10[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v10 count:2];
  [v6 deleteItemsWithAllKeysContaining:v9];
}

- (void)removeImageForKey:(id)a3
{
}

- (void)removeImageForKey:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(IMMemoryCache *)self->_memoryCache removeObjectForKey:v6];
  if (v4)
  {
    v7 = [(IMImageCache *)self persistentCache];
    [v7 deleteItemForKey:v6];
  }
  else
  {
    BOOL v8 = [(IMImageCache *)self persistenceQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_385F8;
    v9[3] = &unk_2C3AF8;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
}

- (void)removeImageWithRootKey:(id)a3
{
  if (a3)
  {
    memoryCache = self->_memoryCache;
    id v5 = a3;
    [(IMMemoryCache *)memoryCache removeObjectsForKeyWithPrefix:v5];
    id v7 = [(IMImageCache *)self persistentCache];
    id v6 = +[NSString stringWithFormat:@"%@%%", v5];

    [v7 deleteItemsWithKeyLike:v6];
  }
}

- (id)imageForKey:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  BOOL v8 = -[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v7, width, height);
  id v9 = [(IMImageCache *)self imageForKey:v8];
  if (!v9)
  {
    id v10 = [(IMImageCache *)self imageForKey:v7];
    id v9 = [v10 im_imageWithSize:1 preserveAspectRatio:width height];

    [(IMImageCache *)self setImage:v9 forKey:v8];
  }

  return v9;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = -[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v9, width, height);
  v11 = [(IMImageCache *)self imageForKey:v10];
  if (!v11)
  {
    id v12 = [(IMImageCache *)self imageForKey:v9];
    v11 = [v12 im_imageWithSize:v5 options:width, height];

    [(IMImageCache *)self setImage:v11 forKey:v10];
  }

  return v11;
}

- (void)imageForKey:(id)a3 completionBlock:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = &_dispatch_main_q;
    id v11 = &_dispatch_main_q;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_38990;
  block[3] = &unk_2C3A40;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, block);
}

- (void)imageForKey:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6
{
}

- (void)imageForKey:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6 options:(int)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (!v15)
  {
    id v15 = &_dispatch_main_q;
    id v16 = &_dispatch_main_q;
  }
  id v17 = -[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v13, width, height);
  uint64_t v18 = [(IMImageCache *)self _fetchImageForKey:v17];
  if (!v18)
  {
    uint64_t v21 = [(IMImageCache *)self _fetchImageForKey:v13];
    uint64_t v20 = dispatch_get_global_queue(-2, 0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_38C58;
    v22[3] = &unk_2C5038;
    id v19 = v21;
    double v29 = width;
    double v30 = height;
    int v31 = a7;
    id v23 = v19;
    v24 = self;
    id v25 = v17;
    id v28 = v14;
    objc_super v26 = v15;
    id v27 = v13;
    dispatch_async(v20, v22);

    goto LABEL_7;
  }
  id v19 = (id)v18;
  if (v14)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_38C3C;
    block[3] = &unk_2C5010;
    id v35 = v14;
    id v19 = v19;
    id v33 = v19;
    id v34 = v13;
    double v36 = width;
    double v37 = height;
    dispatch_async(v15, block);

    uint64_t v20 = v35;
LABEL_7:
  }
}

- (void)addImageFromURL:(id)a3 completionBlock:(id)a4 queue:(id)a5
{
}

- (void)addImageFromURL:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v13 absoluteString];
  -[IMImageCache addImageFromURL:key:size:completionBlock:queue:](self, "addImageFromURL:key:size:completionBlock:queue:", v13, v14, v12, v11, width, height);
}

- (void)addImageFromURL:(id)a3 key:(id)a4 size:(CGSize)a5 completionBlock:(id)a6 queue:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = (void (**)(id, void *))a6;
  id v16 = a7;
  uint64_t v17 = -[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v14, width, height);
  uint64_t v18 = (void *)v17;
  BOOL v19 = CGSizeZero.height != height || CGSizeZero.width != width;
  if (v19) {
    uint64_t v20 = (void *)v17;
  }
  else {
    uint64_t v20 = v14;
  }
  id v21 = v20;
  if ([(IMImageCache *)self hasImageForKey:v21])
  {
    v22 = [(IMImageCache *)self imageForKey:v21];
    v15[2](v15, v22);
  }
  else
  {
    downloadQueue = self->_downloadQueue;
    if (!downloadQueue)
    {
      v24 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesmobile.imimagecache", 0);
      id v25 = self->_downloadQueue;
      self->_downloadQueue = v24;

      downloadQueue = self->_downloadQueue;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3906C;
    block[3] = &unk_2C5088;
    id v27 = v13;
    id v28 = self;
    id v29 = v14;
    BOOL v35 = v19;
    double v33 = width;
    double v34 = height;
    id v30 = v18;
    id v31 = v16;
    v32 = v15;
    dispatch_async(downloadQueue, block);
  }
}

- (unint64_t)imageDataSizeForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMImageCache *)self persistentCache];
  id v6 = [v5 resourceSizeForKey:v4];

  return (unint64_t)v6;
}

- (double)compareImage:(id)a3 withImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7)
  {
    double v13 = 1.0;
  }
  else
  {
    [v6 size];
    double v9 = v8;
    double v11 = v10;
    [v7 size];
    double v13 = 0.0;
    if (v9 == v14 && v11 == v12)
    {
      [(IMImageCache *)self _histogramForImage:v6 result:v23 size:256];
      [(IMImageCache *)self _histogramForImage:v7 result:v22 size:256];
      uint64_t v16 = 0;
      double v17 = 0.0;
      do
      {
        unsigned int v18 = *(_DWORD *)&v23[v16];
        unsigned int v19 = *(_DWORD *)&v22[v16];
        if (v18 == v19)
        {
          double v17 = v17 + 1.0;
        }
        else
        {
          if (v18 <= v19) {
            unsigned int v20 = *(_DWORD *)&v22[v16];
          }
          else {
            unsigned int v20 = *(_DWORD *)&v23[v16];
          }
          if (v20)
          {
            if (v18 >= v19) {
              unsigned int v18 = *(_DWORD *)&v22[v16];
            }
            double v17 = v17 + (double)v18 / (double)v20;
          }
        }
        v16 += 4;
      }
      while (v16 != 1024);
      double v13 = v17 * 0.00390625;
    }
  }

  return v13;
}

- (BOOL)hasImageForKey:(id)a3 withSize:(CGSize)a4
{
  id v4 = self;
  uint64_t v5 = -[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", a3, a4.width, a4.height);
  LOBYTE(v4) = [(IMImageCache *)v4 hasImageForKey:v5];

  return (char)v4;
}

- (BOOL)hasImageForKey:(id)a3
{
  id v4 = a3;
  if ([(IMMemoryCache *)self->_memoryCache hasObjectForKey:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(IMImageCache *)self persistentCache];
    unsigned __int8 v5 = [v6 hasItemForKey:v4];
  }
  return v5;
}

- (BOOL)hasFastImageForKey:(id)a3
{
  return [(IMMemoryCache *)self->_memoryCache hasObjectForKey:a3];
}

- (void)getImageMetadataForKey:(id)a3 size:(CGSize *)a4 scale:(double *)a5
{
  id v8 = a3;
  double v9 = [(IMImageCache *)self persistentCache];
  id v18 = [v9 metadataForKey:v8];

  double v10 = [v18 objectForKey:@"width"];
  [v10 floatValue];
  CGFloat v12 = v11;

  double v13 = [v18 objectForKey:@"height"];
  [v13 floatValue];
  CGFloat v15 = v14;

  uint64_t v16 = [v18 objectForKey:@"scale"];
  [v16 floatValue];
  *a5 = v17;

  a4->double width = v12;
  a4->double height = v15;
}

- (id)_fetchImageForKey:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IMMemoryCache *)self->_memoryCache objectForKey:v4];
  if (v5) {
    goto LABEL_2;
  }
  CGSize v13 = CGSizeZero;
  uint64_t v12 = 0;
  id v8 = [(IMImageCache *)self persistentCache];
  double v9 = [v8 CGImagesForKey:v4 size:&v13 resourceSize:&v12];

  if (v9)
  {
    double v10 = [IMImageCacheObject alloc];
    unsigned __int8 v5 = [(IMImageCacheObject *)v10 initWithImageRefs:v9 imageSize:v13];
    [(IMImageCacheObject *)v5 setPersistedToDisk:1];
    [(IMMemoryCache *)self->_memoryCache setObject:v5 forKey:v4 cost:v12];

    if (v5)
    {
LABEL_2:
      id v6 = [(IMImageCacheObject *)v5 imageRefs];
      [(IMImageCacheObject *)v5 imageSize];
      id v7 = +[UIImage im_imageWithCGImages:size:](UIImage, "im_imageWithCGImages:size:", v6);

      goto LABEL_8;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)genericKeyForSize:(CGSize)a3 withBaseKey:(id)a4
{
  return [(IMImageCache *)self keyForSize:a4, @"generic", a3.width, a3.height withBaseKey suffix];
}

- (id)keyForSize:(CGSize)a3 withBaseKey:(id)a4
{
  return +[NSString stringWithFormat:@"%@-{%f,%f}", a4, *(void *)&a3.width, *(void *)&a3.height];
}

- (id)keyForSize:(CGSize)a3 withBaseKey:(id)a4 suffix:(id)a5
{
  return +[NSString stringWithFormat:@"%@-{%f,%f}-%@", a4, *(void *)&a3.width, *(void *)&a3.height, a5];
}

- (void)_histogramForImage:(id)a3 result:(unsigned int *)a4 size:(unsigned int)a5
{
  id v6 = [a3 im_CGImage];
  id v7 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x9C40uLL, 0x57251F39uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v9 = CGBitmapContextCreate(v7, 0x64uLL, 0x64uLL, 8uLL, 0x190uLL, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  v14.size.double width = 100.0;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.double height = 100.0;
  CGContextDrawImage(v9, v14, v6);
  bzero(a4, 0x400uLL);
  unint64_t v10 = 0;
  do
  {
    unsigned int v11 = (21846 * (v7[v10 + 1] + v7[v10] + v7[v10 + 2])) >> 16;
    ++a4[v11];
    BOOL v12 = v10 >= 0x9C3C;
    v10 += 4;
  }
  while (!v12);
  CGContextRelease(v9);

  free(v7);
}

- (NSString)defaultType
{
  return self->_defaultType;
}

- (void)setDefaultType:(id)a3
{
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (void)setPersistenceQueue:(id)a3
{
}

- (IMPersistentCache)persistentCache
{
  return (IMPersistentCache *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersistentCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentCache, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_defaultType, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_persistentCachePath, 0);

  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end