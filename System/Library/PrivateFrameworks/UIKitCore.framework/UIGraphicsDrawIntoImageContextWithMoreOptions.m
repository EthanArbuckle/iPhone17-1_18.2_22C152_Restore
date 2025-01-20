@interface UIGraphicsDrawIntoImageContextWithMoreOptions
@end

@implementation UIGraphicsDrawIntoImageContextWithMoreOptions

uint64_t ___UIGraphicsDrawIntoImageContextWithMoreOptions_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end