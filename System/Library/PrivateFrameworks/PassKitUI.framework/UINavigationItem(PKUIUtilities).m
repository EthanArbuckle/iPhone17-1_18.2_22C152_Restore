@interface UINavigationItem(PKUIUtilities)
- (uint64_t)pkui_enableManualScrollEdgeAppearanceWithInitialProgress:()PKUIUtilities;
- (void)pkui_setupScrollEdgeChromelessAppearance;
@end

@implementation UINavigationItem(PKUIUtilities)

- (void)pkui_setupScrollEdgeChromelessAppearance
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v4 configureWithDefaultBackground];
  v2 = [MEMORY[0x1E4FB1618] _barHairlineShadowColor];
  [v4 setShadowColor:v2];

  [a1 setStandardAppearance:v4];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v3 configureWithTransparentBackground];
  [a1 setScrollEdgeAppearance:v3];
}

- (uint64_t)pkui_enableManualScrollEdgeAppearanceWithInitialProgress:()PKUIUtilities
{
  objc_msgSend(a1, "_setManualScrollEdgeAppearanceProgress:");

  return [a1 _setManualScrollEdgeAppearanceEnabled:1];
}

@end