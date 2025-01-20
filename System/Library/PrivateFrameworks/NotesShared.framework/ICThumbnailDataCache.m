@interface ICThumbnailDataCache
- (ICCache)imageCache;
- (ICThumbnailDataCache)init;
- (id)thumbnailDataForKey:(id)a3;
- (void)removeAllThumbnailData;
- (void)removeThumbnailDataForKey:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setThumbnailData:(id)a3 forKey:(id)a4;
@end

@implementation ICThumbnailDataCache

- (ICThumbnailDataCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICThumbnailDataCache;
  v2 = [(ICThumbnailDataCache *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F83718]);
    [(ICThumbnailDataCache *)v2 setImageCache:v3];
  }
  return v2;
}

- (void)setThumbnailData:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(ICThumbnailDataCache *)v7 imageCache];
  [v8 setObject:v9 forKey:v6];

  objc_sync_exit(v7);
}

- (void)removeThumbnailDataForKey:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = [(ICThumbnailDataCache *)v4 imageCache];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (id)thumbnailDataForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  id v6 = [(ICThumbnailDataCache *)v5 imageCache];
  v7 = [v6 objectForKey:v4];

  objc_opt_class();
  v8 = ICDynamicCast();

  objc_sync_exit(v5);
  return v8;
}

- (void)removeAllThumbnailData
{
  id v2 = [(ICThumbnailDataCache *)self imageCache];
  [v2 removeAllObjects];
}

- (ICCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end