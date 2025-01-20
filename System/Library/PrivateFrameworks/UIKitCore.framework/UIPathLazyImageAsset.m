@interface UIPathLazyImageAsset
@end

@implementation UIPathLazyImageAsset

uint64_t __47___UIPathLazyImageAsset__containsImagesInPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasPrefix:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end