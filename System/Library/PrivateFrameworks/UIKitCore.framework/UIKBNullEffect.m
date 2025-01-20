@interface UIKBNullEffect
+ (id)nullEffect;
- (BOOL)isValid;
- (BOOL)renderUnder;
- (BOOL)usesRGBColors;
- (CGColor)CGColor;
- (UIKBGradient)gradient;
- (double)weight;
- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4;
@end

@implementation UIKBNullEffect

- (BOOL)isValid
{
  return 0;
}

- (BOOL)renderUnder
{
  return 0;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
}

- (double)weight
{
  return 0.0;
}

- (BOOL)usesRGBColors
{
  return 0;
}

- (UIKBGradient)gradient
{
  return 0;
}

- (CGColor)CGColor
{
  return 0;
}

+ (id)nullEffect
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end