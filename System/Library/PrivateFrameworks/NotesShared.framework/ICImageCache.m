@interface ICImageCache
+ (double)bigImageSize;
+ (unint64_t)maxBigImageCount;
- (ICCache)imageCache;
- (ICImageCache)init;
- (ICLRUCache)bigImageCache;
- (OS_dispatch_source)memoryWarningEventSource;
- (id)imageForKey:(id)a3;
- (void)receivedMemoryWarning;
- (void)registerForMemoryWarnings;
- (void)removeAllImages;
- (void)removeImageForKey:(id)a3;
- (void)setBigImageCache:(id)a3;
- (void)setImage:(id)a3 forKey:(id)a4;
- (void)setImageCache:(id)a3;
- (void)setMemoryWarningEventSource:(id)a3;
- (void)unregisterForMemoryWarnings;
@end

@implementation ICImageCache

- (ICImageCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICImageCache;
  v2 = [(ICImageCache *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F83718]);
    [(ICImageCache *)v2 setImageCache:v3];
  }
  return v2;
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [v16 size];
  double v9 = v8;
  [v16 size];
  double v11 = v10;
  [v16 scale];
  if ((unint64_t)(v12 * (double)(unint64_t)(v9 * v11)) <= 0x100000)
  {
    v15 = [(ICImageCache *)v7 imageCache];
    [v15 setObject:v16 forKey:v6];
  }
  else
  {
    v13 = [(ICImageCache *)v7 bigImageCache];

    if (!v13)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F83760]) initWithMaxSize:3];
      [(ICImageCache *)v7 setBigImageCache:v14];
    }
    v15 = [(ICImageCache *)v7 bigImageCache];
    [v15 setObject:v16 forKey:v6];
  }

  objc_sync_exit(v7);
}

- (void)removeImageForKey:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = [(ICImageCache *)v4 bigImageCache];
  [v5 removeObjectForKey:v7];

  id v6 = [(ICImageCache *)v4 imageCache];
  [v6 removeObjectForKey:v7];

  objc_sync_exit(v4);
}

- (id)imageForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  id v6 = [(ICImageCache *)v5 imageCache];
  id v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    double v8 = [(ICImageCache *)v5 bigImageCache];
    id v7 = [v8 objectForKey:v4];
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)removeAllImages
{
  id v3 = [(ICImageCache *)self imageCache];
  [v3 removeAllObjects];

  id v4 = [(ICImageCache *)self bigImageCache];
  [v4 removeAllObjects];
}

- (void)registerForMemoryWarnings
{
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, MEMORY[0x1E4F14428]);
  [(ICImageCache *)self setMemoryWarningEventSource:v3];

  objc_initWeak(&location, self);
  id v4 = [(ICImageCache *)self memoryWarningEventSource];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __41__ICImageCache_registerForMemoryWarnings__block_invoke;
  double v9 = &unk_1E64A4758;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  objc_super v5 = [(ICImageCache *)self memoryWarningEventSource];
  dispatch_resume(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__ICImageCache_registerForMemoryWarnings__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained receivedMemoryWarning];
}

- (void)unregisterForMemoryWarnings
{
  dispatch_source_t v3 = [(ICImageCache *)self memoryWarningEventSource];

  if (v3)
  {
    id v4 = [(ICImageCache *)self memoryWarningEventSource];
    dispatch_source_cancel(v4);
  }
}

- (void)receivedMemoryWarning
{
  id v2 = [(ICImageCache *)self bigImageCache];
  [v2 removeAllObjects];
}

+ (double)bigImageSize
{
  return 1048576.0;
}

+ (unint64_t)maxBigImageCount
{
  return 3;
}

- (ICCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (ICLRUCache)bigImageCache
{
  return self->_bigImageCache;
}

- (void)setBigImageCache:(id)a3
{
}

- (OS_dispatch_source)memoryWarningEventSource
{
  return self->_memoryWarningEventSource;
}

- (void)setMemoryWarningEventSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryWarningEventSource, 0);
  objc_storeStrong((id *)&self->_bigImageCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end