@interface UIColor
@end

@implementation UIColor

id __56__UIColor_MobileSafariExtras__sf_barHairlineShadowColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] _barHairlineShadowColor];
  }

  return v2;
}

@end