@interface UIScrollViewSharedInit
@end

@implementation UIScrollViewSharedInit

void *___UIScrollViewSharedInit_block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[167]) {
    return objc_msgSend(result, "addInteraction:");
  }
  return result;
}

@end