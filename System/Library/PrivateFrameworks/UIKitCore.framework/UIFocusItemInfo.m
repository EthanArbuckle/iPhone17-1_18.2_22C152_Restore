@interface UIFocusItemInfo
@end

@implementation UIFocusItemInfo

void __54___UIFocusItemInfo_isFocusMovementFlippedHorizontally__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v5 _isFocusDirectionFlippedHorizontally])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end