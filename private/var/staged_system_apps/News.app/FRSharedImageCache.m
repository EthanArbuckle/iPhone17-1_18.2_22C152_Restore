@interface FRSharedImageCache
- (BOOL)persistenceEnabled;
- (FRSharedImageCache)init;
- (FRSharedImageCache)initWithPersistenceEnabled:(BOOL)a3;
- (NSString)rootPath;
- (OS_dispatch_queue)persistenceQueue;
- (id)_imageAtPath:(id)a3;
- (id)fetchImageForKey:(id)a3;
- (void)cache:(id)a3 forKey:(id)a4;
- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5;
- (void)pruneImagesOlderThan:(double)a3;
- (void)setPersistenceEnabled:(BOOL)a3;
- (void)setPersistenceQueue:(id)a3;
@end

@implementation FRSharedImageCache

- (FRSharedImageCache)init
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = -[FRSharedImageCache initWithPersistenceEnabled:](self, "initWithPersistenceEnabled:", [v3 BOOLForKey:@"enableImageCacheKey"]);

  return v4;
}

- (FRSharedImageCache)initWithPersistenceEnabled:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FRSharedImageCache;
  v4 = [(FRSharedImageCache *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_persistenceEnabled = a3;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.FRSharedImageCache.persistence", v7);
    persistenceQueue = v5->_persistenceQueue;
    v5->_persistenceQueue = (OS_dispatch_queue *)v8;

    v10 = FRURLForNewsAppCachesDirectory();
    v11 = [v10 path];

    uint64_t v12 = [v11 stringByAppendingPathComponent:@"CachedImages"];
    rootPath = v5->_rootPath;
    v5->_rootPath = (NSString *)v12;

    v14 = +[NSFileManager defaultManager];
    unsigned __int8 v15 = [v14 fileExistsAtPath:v5->_rootPath];

    if ((v15 & 1) == 0)
    {
      v16 = +[NSFileManager defaultManager];
      [v16 createDirectoryAtPath:v5->_rootPath withIntermediateDirectories:0 attributes:0 error:0];
    }
  }
  return v5;
}

- (id)fetchImageForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FRSharedImageCache *)self rootPath];
  v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = [(FRSharedImageCache *)self _imageAtPath:v6];

  return v7;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (id)_imageAtPath:(id)a3
{
  id v4 = a3;
  if ([(FRSharedImageCache *)self persistenceEnabled])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = sub_100018B60;
    unsigned __int8 v15 = sub_100018A38;
    id v16 = 0;
    v5 = [(FRSharedImageCache *)self persistenceQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000066BC;
    v8[3] = &unk_1000C9408;
    id v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, v8);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (BOOL)persistenceEnabled
{
  return self->_persistenceEnabled;
}

- (void)pruneImagesOlderThan:(double)a3
{
  v5 = [(FRSharedImageCache *)self persistenceQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000628CC;
  v6[3] = &unk_1000C98B8;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(FRSharedImageCache *)self persistenceEnabled])
  {
    v10 = [(FRSharedImageCache *)self rootPath];
    uint64_t v11 = [v10 stringByAppendingPathComponent:v9];

    id v12 = v8;
    uint64_t v13 = (CGImage *)[v12 CGImage];
    if (v12)
    {
      v14 = v13;
      if (v13)
      {
        CGImageRetain(v13);
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100062D18;
        v21[3] = &unk_1000C9F90;
        v25 = v14;
        id v22 = v11;
        id v23 = v12;
        CFAbsoluteTime v26 = Current;
        id v24 = v9;
        id v16 = objc_retainBlock(v21);
        v17 = [(FRSharedImageCache *)self persistenceQueue];
        objc_super v18 = v17;
        if (v5)
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100062ED4;
          v19[3] = &unk_1000C6E28;
          v20 = v16;
          dispatch_sync(v18, v19);

          objc_super v18 = v20;
        }
        else
        {
          dispatch_async(v17, v16);
        }
      }
    }
  }
}

- (void)cache:(id)a3 forKey:(id)a4
{
}

- (void)setPersistenceEnabled:(BOOL)a3
{
  self->_persistenceEnabled = a3;
}

- (void)setPersistenceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceQueue, 0);

  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end