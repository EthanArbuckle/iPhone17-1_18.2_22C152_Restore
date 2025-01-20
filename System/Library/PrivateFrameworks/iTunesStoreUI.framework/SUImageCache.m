@interface SUImageCache
- (SUImageCache)init;
- (SUImageCache)initWithMaximumCapacity:(int64_t)a3;
- (id)imageForURL:(id)a3 dataProvider:(id)a4;
- (void)addImage:(id)a3 forURL:(id)a4 dataProvider:(id)a5;
- (void)dealloc;
- (void)removeAllCachedImages;
@end

@implementation SUImageCache

- (SUImageCache)init
{
  return [(SUImageCache *)self initWithMaximumCapacity:40];
}

- (SUImageCache)initWithMaximumCapacity:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUImageCache;
  v4 = [(SUImageCache *)&v6 init];
  if (v4) {
    v4->_dictionary = (CPLRUDictionary *)[objc_alloc(MEMORY[0x263F255B8]) initWithMaximumCapacity:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUImageCache;
  [(SUImageCache *)&v3 dealloc];
}

- (void)addImage:(id)a3 forURL:(id)a4 dataProvider:(id)a5
{
  v9 = objc_alloc_init(SUImageCacheKey);
  v9->_dataProvider = (SUImageDataProvider *)a5;
  v9->_url = (NSURL *)a4;
  -[CPLRUDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3);
}

- (id)imageForURL:(id)a3 dataProvider:(id)a4
{
  v7 = objc_alloc_init(SUImageCacheKey);
  v7->_dataProvider = (SUImageDataProvider *)a4;
  v7->_url = (NSURL *)a3;
  v8 = (void *)[(CPLRUDictionary *)self->_dictionary objectForKey:v7];

  return v8;
}

- (void)removeAllCachedImages
{
}

@end