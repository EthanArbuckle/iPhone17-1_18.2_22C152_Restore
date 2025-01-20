@interface UINavigationController(Bridge)
- (void)ts_setNavigationBarBackgroundHidden:()Bridge;
- (void)ts_setPaletteBackgroundHidden:()Bridge;
- (void)ts_setPaletteBlurthroughBackground;
- (void)ts_setTopPaletteShadowHidden:()Bridge;
@end

@implementation UINavigationController(Bridge)

- (void)ts_setTopPaletteShadowHidden:()Bridge
{
  id v4 = [a1 existingPaletteForEdge:2];
  [v4 setPaletteShadowIsHidden:a3];
}

- (void)ts_setPaletteBackgroundHidden:()Bridge
{
  id v4 = [a1 existingPaletteForEdge:2];
  id v7 = v4;
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  v6 = [v4 _backgroundView];
  [v6 setAlpha:v5];
}

- (void)ts_setPaletteBlurthroughBackground
{
  id v5 = [a1 existingPaletteForEdge:2];
  id v2 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v3 = objc_msgSend(MEMORY[0x1E4FB1EF8], "ts_sideBarEffect");
  id v4 = (void *)[v2 initWithEffect:v3];
  [v5 _setBackgroundView:v4];

  [a1 _setPreferredNavigationBarPosition:2];
}

- (void)ts_setNavigationBarBackgroundHidden:()Bridge
{
  id v4 = [a1 navigationBar];
  id v6 = v4;
  double v5 = 1.0;
  if (a3) {
    double v5 = 0.0;
  }
  [v4 _setBackgroundOpacity:v5];
}

@end