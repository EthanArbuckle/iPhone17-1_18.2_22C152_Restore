@interface BSUIMappedImageCacheCanary
@end

@implementation BSUIMappedImageCacheCanary

void __38___BSUIMappedImageCacheCanary_dealloc__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained returnImageCacheForKey:*(void *)(a1 + 32)];
}

@end