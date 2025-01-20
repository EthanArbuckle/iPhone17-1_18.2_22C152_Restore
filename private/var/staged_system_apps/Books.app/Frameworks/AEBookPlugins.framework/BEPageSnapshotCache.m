@interface BEPageSnapshotCache
+ (Class)operationClass;
+ (id)restorationImageAssetID;
+ (id)restorationImageURL;
+ (unint64_t)restorationImageAppearance;
+ (void)setRestorationImageAppearance:(unint64_t)a3;
+ (void)setRestorationImageAssetID:(id)a3;
- (BEPageSnapshotCache)initWithIdentifier:(id)a3 dataSource:(id)a4;
- (BEPageSnapshotCacheDataSource)dataSource;
- (id)_fetchImageForKey:(id)a3 size:(CGSize)a4;
- (id)_scheduleRenderWithKey:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5 priority:(int64_t)a6 completion:(id)a7;
- (id)persistentCacheFileName;
- (id)snapshotForAsset:(id)a3 page:(int64_t)a4 snapshotThemeIdentifier:(id)a5 size:(CGSize)a6 completion:(id)a7;
- (void)setDataSource:(id)a3;
@end

@implementation BEPageSnapshotCache

- (id)persistentCacheFileName
{
  v2 = [(BEPageSnapshotCache *)self identifier];
  v3 = +[NSString stringWithFormat:@"%@-%@", v2, @"v20220201"];

  return v3;
}

+ (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (BEPageSnapshotCache)initWithIdentifier:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BEPageSnapshotCache;
  v7 = [(AEHTMLBookRenderingCache *)&v10 initWithIdentifier:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_dataSource, v6);
  }

  return v8;
}

+ (void)setRestorationImageAppearance:(unint64_t)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:a3 forKey:BERestorationAssetAppearanceKey];
}

+ (void)setRestorationImageAssetID:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:BERestorationAssetIDKey];
}

+ (unint64_t)restorationImageAppearance
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:BERestorationAssetAppearanceKey];

  return (unint64_t)v3;
}

+ (id)restorationImageAssetID
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 stringForKey:BERestorationAssetIDKey];

  return v3;
}

+ (id)restorationImageURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"currentLocationContentSnapshot.png"];
  v5 = +[NSURL fileURLWithPath:v4];

  return v5;
}

- (id)snapshotForAsset:(id)a3 page:(int64_t)a4 snapshotThemeIdentifier:(id)a5 size:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a5;
  v15 = (void (**)(id, void *))a7;
  if ((unint64_t)(a4 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002 || ![v13 length]) {
    goto LABEL_7;
  }
  double v16 = floor(height);
  double v17 = floor(width);
  if (v16 <= 1.0 || v17 <= 1.0) {
    goto LABEL_7;
  }
  -[BEPageSnapshotCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:", v17, v16);
  double v23 = v22;
  double v25 = v24;
  v26 = [(BEPageSnapshotCache *)self keyPrefixForPage:a4];
  v27 = [v26 stringByAppendingString:v14];

  v28 = -[BEPageSnapshotCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v27, v23, v25);
  uint64_t v29 = -[BEPageSnapshotCache _fetchImageForKey:size:](self, "_fetchImageForKey:size:", v28, v17, v16);
  if (v29)
  {
    v19 = (void *)v29;

    goto LABEL_8;
  }
  v20 = -[BEPageSnapshotCache _scheduleRenderWithKey:size:pageNumber:priority:completion:](self, "_scheduleRenderWithKey:size:pageNumber:priority:completion:", v28, a4, 4, v15, v17, v16);

  if (!v20)
  {
LABEL_7:
    v19 = 0;
LABEL_8:
    v15[2](v15, v19);

    v20 = 0;
  }

  return v20;
}

- (id)_fetchImageForKey:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (width < 100.0) {
    goto LABEL_2;
  }
  v9 = [(BEPageSnapshotCache *)self memoryCache];
  v8 = [v9 objectForKey:v7];

  if (!v8)
  {
    id v26 = 0;
    objc_super v10 = +[IMPersistentCacheManager sharedInstance];
    v11 = [(BEPageSnapshotCache *)self persistentCachePath];
    v12 = [v10 cacheForPath:v11 maxSize:0];

    if ([(BEPageSnapshotCache *)self serializeFormat] != 2)
    {
      v21 = [v12 dataForKey:v7];
      id v26 = [v21 length];
      v8 = -[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v21, width, height);

      if (!v8) {
        goto LABEL_7;
      }
LABEL_9:
      double v22 = [(BEPageSnapshotCache *)self memoryCache];
      [v22 setObject:v8 forKey:v7 cost:v26];

      double v23 = +[IMPersistentCacheManager sharedInstance];
      double v24 = [(BEPageSnapshotCache *)self persistentCachePath];
      [v23 purgeFromCache:v24];

      goto LABEL_11;
    }
    NSLog(@"Getting Image for key %@ from persistent cache", v7);
    id v13 = (CGImage *)[v12 copyCGImageForKey:v7 resourceSize:&v26];
    if (v13)
    {
      id v14 = v13;
      double v15 = (double)CGImageGetWidth(v13);
      double v16 = (double)CGImageGetHeight(v14);
      DataProvider = CGImageGetDataProvider(v14);
      CFDataRef v18 = CGDataProviderCopyData(DataProvider);
      v8 = -[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v18, v15, v16);
      CFRelease(v18);
      CGImageRelease(v14);
      if (!v8)
      {
LABEL_7:
        v19 = +[IMPersistentCacheManager sharedInstance];
        v20 = [(BEPageSnapshotCache *)self persistentCachePath];
        [v19 purgeFromCache:v20];

LABEL_2:
        v8 = [(BEPageSnapshotCache *)self fetchImageForKey:v7];
        goto LABEL_11;
      }
      goto LABEL_9;
    }

    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)_scheduleRenderWithKey:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5 priority:(int64_t)a6 completion:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if ([(BEPageSnapshotCache *)self hasImageForKey:v13])
  {
    double v15 = 0;
    goto LABEL_15;
  }
  double v16 = [(BEPageSnapshotCache *)self findRenderingCacheOperationWithStorageKey:v13 target:0 selector:0 context:0];
  objc_opt_class();
  uint64_t v17 = BUDynamicCast();
  CFDataRef v18 = (BEPageSnapshotCacheOperation *)v17;
  if (v14)
  {
    id v19 = objc_alloc((Class)BCRenderingCacheBlockCallback);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_C26F4;
    v24[3] = &unk_1DAE08;
    id v25 = v14;
    id v20 = [v19 initWithCompletion:v24];

    if (!v18) {
      goto LABEL_8;
    }
  }
  else
  {
    id v20 = 0;
    if (!v17) {
      goto LABEL_8;
    }
  }
  if (![(BEPageSnapshotCacheOperation *)v18 isCancelled])
  {
    if (v20) {
      [(BEPageSnapshotCacheOperation *)v18 addExtraCompletion:v20];
    }
    double v15 = v18;
    goto LABEL_14;
  }
LABEL_8:
  v21 = [BEPageSnapshotCacheOperation alloc];
  double v22 = [(BEPageSnapshotCache *)self dataSource];
  double v15 = [(BEPageSnapshotCacheOperation *)v21 initWithDataSource:v22];

  [(BEPageSnapshotCacheOperation *)v15 setSelector:0];
  [(BEPageSnapshotCacheOperation *)v15 setPageNumber:a5];
  -[BEPageSnapshotCacheOperation setSnapshotSize:](v15, "setSnapshotSize:", width, height);
  if (v20) {
    [(BEPageSnapshotCacheOperation *)v15 addExtraCompletion:v20];
  }
  [(BEPageSnapshotCacheOperation *)v15 setImageCache:self];
  -[BEPageSnapshotCacheOperation setDesiredSize:](v15, "setDesiredSize:", width, height);
  [(BEPageSnapshotCacheOperation *)v15 setStorageKey:v13];
  [(BEPageSnapshotCacheOperation *)v15 setMasterImageKey:0];
  [(BEPageSnapshotCacheOperation *)v15 setSerializeFormat:[(BEPageSnapshotCache *)self serializeFormat]];
  [(BEPageSnapshotCacheOperation *)v15 setQueuePriority:a6];
  [(BEPageSnapshotCache *)self enqueueRenderingCacheOperation:v15];
LABEL_14:

LABEL_15:

  return v15;
}

- (BEPageSnapshotCacheDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BEPageSnapshotCacheDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end