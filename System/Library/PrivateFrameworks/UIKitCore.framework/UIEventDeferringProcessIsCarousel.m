@interface UIEventDeferringProcessIsCarousel
@end

@implementation UIEventDeferringProcessIsCarousel

void ___UIEventDeferringProcessIsCarousel_block_invoke(uint64_t a1)
{
  _UIMainBundleIdentifier();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB26239A = [v2 isEqualToString:*(void *)(a1 + 32)];
}

@end