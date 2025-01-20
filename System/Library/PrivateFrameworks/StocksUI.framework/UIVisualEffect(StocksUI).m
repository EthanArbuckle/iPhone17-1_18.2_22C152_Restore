@interface UIVisualEffect(StocksUI)
+ (id)su_visualEffectsForBarWithBackgroundColor:()StocksUI;
@end

@implementation UIVisualEffect(StocksUI)

+ (id)su_visualEffectsForBarWithBackgroundColor:()StocksUI
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(MEMORY[0x263F82E48], "effectCompositingColor:");
  v4[0] = v0;
  v1 = [MEMORY[0x263F824D8] effectWithBlurRadius:20.0];
  v4[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

@end