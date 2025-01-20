@interface WGMappedImageCache
+ (id)sharedCache;
@end

@implementation WGMappedImageCache

+ (id)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__WGMappedImageCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache___once != -1) {
    dispatch_once(&sharedCache___once, block);
  }
  v2 = (void *)sharedCache___cache;
  return v2;
}

uint64_t __33__WGMappedImageCache_sharedCache__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  uint64_t v4 = [v1 initWithName:v3];
  v5 = (void *)sharedCache___cache;
  sharedCache___cache = v4;

  v6 = (void *)sharedCache___cache;
  return [v6 removeAllImagesWithCompletion:0];
}

@end