@interface UIEventDeferringProcessIsPineBoard
@end

@implementation UIEventDeferringProcessIsPineBoard

void ___UIEventDeferringProcessIsPineBoard_block_invoke(uint64_t a1)
{
  _UIMainBundleIdentifier();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 isEqualToString:*(void *)(a1 + 32)]) {
    char v2 = 1;
  }
  else {
    char v2 = [v3 isEqualToString:*(void *)(a1 + 40)];
  }
  byte_1EB262399 = v2;
}

@end