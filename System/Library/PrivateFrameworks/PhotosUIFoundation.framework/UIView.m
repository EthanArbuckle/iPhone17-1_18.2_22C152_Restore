@interface UIView
@end

@implementation UIView

uint64_t __83__UIView_PhotosUIFoundation__px_enumerateDescendantSubviewsPassingTest_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __71__UIView_PhotosUIFoundation__px_enumerateDescendantSubviewsUsingBlock___block_invoke()
{
  return 1;
}

@end