@interface BSUIMappedImageCache(PBUCacheManagerAdditions)
- (id)pui_cacheIdentifier;
- (void)pbui_setCacheManager:()PBUCacheManagerAdditions cacheIdentifier:;
@end

@implementation BSUIMappedImageCache(PBUCacheManagerAdditions)

- (id)pui_cacheIdentifier
{
  return objc_getAssociatedObject(a1, @"pbuiMappedImageCacheKey");
}

- (void)pbui_setCacheManager:()PBUCacheManagerAdditions cacheIdentifier:
{
  id v6 = a4;
  id v7 = a3;
  value = [[_BSUIMappedImageCacheCanary alloc] initWithCacheManager:v7 key:v6];

  objc_setAssociatedObject(a1, @"pbuiMappedImageCacheCanary", value, (void *)1);
  objc_setAssociatedObject(a1, @"pbuiMappedImageCacheKey", v6, (void *)3);
}

@end