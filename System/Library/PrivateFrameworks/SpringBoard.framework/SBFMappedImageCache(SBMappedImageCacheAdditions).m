@interface SBFMappedImageCache(SBMappedImageCacheAdditions)
+ (id)sessionCache;
@end

@implementation SBFMappedImageCache(SBMappedImageCacheAdditions)

+ (id)sessionCache
{
  if (sessionCache___once != -1) {
    dispatch_once(&sessionCache___once, &__block_literal_global_406);
  }
  v0 = (void *)sessionCache___cache;
  return v0;
}

@end