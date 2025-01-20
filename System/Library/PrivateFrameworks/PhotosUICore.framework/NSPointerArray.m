@interface NSPointerArray
@end

@implementation NSPointerArray

uint64_t __75__NSPointerArray_PhotosUICore__px_enumeratePointersWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) pointerAtIndex:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

@end