@interface PXPlacesImageCache
- (PXPlacesImageCache)init;
- (id)cachedRenderedImageForGeotaggble:(id)a3 andKey:(id)a4;
- (void)cacheRenderedImage:(id)a3 forGeotaggble:(id)a4 andKey:(id)a5;
- (void)removeAllObjects;
- (void)removeCachedRenderedImageForGeotaggble:(id)a3 andKey:(id)a4;
@end

@implementation PXPlacesImageCache

- (void).cxx_destruct
{
}

- (void)cacheRenderedImage:(id)a3 forGeotaggble:(id)a4 andKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_PXPlacesImageCacheKey alloc] initWithGeotaggable:v9 andKey:v8];

  [(NSCache *)self->_cache setObject:v10 forKey:v11];
}

- (id)cachedRenderedImageForGeotaggble:(id)a3 andKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_PXPlacesImageCacheKey alloc] initWithGeotaggable:v7 andKey:v6];

  id v9 = [(NSCache *)self->_cache objectForKey:v8];

  return v9;
}

- (void)removeCachedRenderedImageForGeotaggble:(id)a3 andKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_PXPlacesImageCacheKey alloc] initWithGeotaggable:v7 andKey:v6];

  [(NSCache *)self->_cache removeObjectForKey:v8];
}

- (void)removeAllObjects
{
}

- (PXPlacesImageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesImageCache;
  v2 = [(PXPlacesImageCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v3;

    [(NSCache *)v2->_cache setCountLimit:100];
  }
  return v2;
}

@end