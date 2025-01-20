@interface UIApplication(SUUIMedusaAdditions)
- (BOOL)SUUI_isFullscreen;
- (uint64_t)SUUI_isMedusaActive;
@end

@implementation UIApplication(SUUIMedusaAdditions)

- (uint64_t)SUUI_isMedusaActive
{
  return objc_msgSend(a1, "SUUI_isFullscreen") ^ 1;
}

- (BOOL)SUUI_isFullscreen
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  v7 = [a1 keyWindow];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  return v4 + v6 == v9 + v11;
}

@end