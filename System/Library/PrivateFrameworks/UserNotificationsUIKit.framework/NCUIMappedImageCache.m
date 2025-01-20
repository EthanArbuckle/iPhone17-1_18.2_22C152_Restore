@interface NCUIMappedImageCache
+ (id)sharedCache;
@end

@implementation NCUIMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once != -1) {
    dispatch_once(&sharedCache___once, &__block_literal_global_30);
  }
  v2 = (void *)sharedCache___cache;

  return v2;
}

uint64_t __35__NCUIMappedImageCache_sharedCache__block_invoke()
{
  v0 = [[NCUIMappedImageCache alloc] initWithUniqueIdentifier:@"NCUIMappedImageCache"];
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

  v2 = (void *)sharedCache___cache;

  return [v2 removeAllImagesWithCompletion:0];
}

@end