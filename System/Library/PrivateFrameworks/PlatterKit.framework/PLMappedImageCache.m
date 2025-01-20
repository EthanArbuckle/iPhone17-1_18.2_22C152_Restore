@interface PLMappedImageCache
+ (id)sharedCache;
@end

@implementation PLMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once != -1) {
    dispatch_once(&sharedCache___once, &__block_literal_global_4);
  }
  v2 = (void *)sharedCache___cache;
  return v2;
}

uint64_t __33__PLMappedImageCache_sharedCache__block_invoke()
{
  v0 = [[PLMappedImageCache alloc] initWithUniqueIdentifier:@"PLMappedImageCache"];
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

  v2 = (void *)sharedCache___cache;
  return [v2 removeAllImagesWithCompletion:0];
}

@end