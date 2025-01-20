@interface UIKBDivotedEffect
- (BOOL)isValid;
- (BOOL)renderUnder;
- (BOOL)usesRGBColors;
- (CGColor)CGColor;
- (UIKBGradient)gradient;
- (double)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4;
- (void)setWeight:(double)a3;
@end

@implementation UIKBDivotedEffect

- (BOOL)isValid
{
  [(UIKBDivotedEffect *)self weight];
  return v2 > 0.0;
}

- (CGColor)CGColor
{
  double v2 = (CGColor *)UIKBGetNamedColor(@"UIKBColorBlack_Alpha8");
  return CGColorRetain(v2);
}

- (BOOL)usesRGBColors
{
  return 1;
}

- (UIKBGradient)gradient
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

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[UIKBDivotedEffect allocWithZone:a3];
  return [(UIKBDivotedEffect *)v3 init];
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

@end