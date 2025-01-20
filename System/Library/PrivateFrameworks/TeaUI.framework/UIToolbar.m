@interface UIToolbar
@end

@implementation UIToolbar

void __38__UIToolbar_Bridge__ts_barButtonViews__block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "ts_barButtonItemView");
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

@end