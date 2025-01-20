@interface ReadingListLeadImageCache
- (ReadingListLeadImageCache)initWithDirectoryURL:(id)a3;
- (id)loadImageSynchronouslyForIconUUID:(id)a3;
- (void)clearCache;
@end

@implementation ReadingListLeadImageCache

- (ReadingListLeadImageCache)initWithDirectoryURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ReadingListLeadImageCache;
  v6 = [(ReadingListLeadImageCache *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryURL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)loadImageSynchronouslyForIconUUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = self;
    objc_sync_enter(v5);
    v6 = [(WBSCache *)v5->_cache objectForKey:v4];
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      v8 = [(NSURL *)v5->_directoryURL URLByAppendingPathComponent:v4 isDirectory:0];
      v9 = (void *)MEMORY[0x1E4FB1818];
      objc_super v10 = [v8 path];
      v11 = [v9 imageWithContentsOfFile:v10];

      if (v11)
      {
        cache = v5->_cache;
        if (!cache)
        {
          v13 = (WBSCache *)objc_alloc_init(MEMORY[0x1E4F989F8]);
          v14 = v5->_cache;
          v5->_cache = v13;

          cache = v5->_cache;
        }
        [(WBSCache *)cache setObject:v11 forKey:v4];
      }
      id v7 = v11;
    }
    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)clearCache
{
  obj = self;
  objc_sync_enter(obj);
  [(WBSCache *)obj->_cache removeAllObjects];
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end