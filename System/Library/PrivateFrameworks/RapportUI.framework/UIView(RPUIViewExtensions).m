@interface UIView(RPUIViewExtensions)
- (double)borderWidth;
- (uint64_t)borderColor;
- (uint64_t)shadowUIColor;
- (void)setBorderColor:()RPUIViewExtensions;
- (void)setBorderWidth:()RPUIViewExtensions;
- (void)setShadowUIColor:()RPUIViewExtensions;
@end

@implementation UIView(RPUIViewExtensions)

- (uint64_t)borderColor
{
  v1 = [a1 layer];
  uint64_t v2 = [v1 borderColor];

  v3 = (void *)MEMORY[0x263F1C550];
  return [v3 colorWithCGColor:v2];
}

- (void)setBorderColor:()RPUIViewExtensions
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [a1 layer];
  [v5 setBorderColor:v4];
}

- (double)borderWidth
{
  v1 = objc_getAssociatedObject(a1, sel_borderWidth);
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (void)setBorderWidth:()RPUIViewExtensions
{
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  objc_setAssociatedObject(a1, sel_borderWidth, v4, (void *)1);

  id v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 scale];
  double v6 = a2 / v5;
  v7 = [a1 layer];
  [v7 setBorderWidth:v6];
}

- (uint64_t)shadowUIColor
{
  v1 = [a1 layer];
  uint64_t v2 = [v1 shadowColor];

  double v3 = (void *)MEMORY[0x263F1C550];
  return [v3 colorWithCGColor:v2];
}

- (void)setShadowUIColor:()RPUIViewExtensions
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [a1 layer];
  [v5 setShadowColor:v4];
}

@end