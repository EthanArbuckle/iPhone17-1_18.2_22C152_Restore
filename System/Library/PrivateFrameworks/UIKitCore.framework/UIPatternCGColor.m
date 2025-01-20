@interface UIPatternCGColor
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isPatternColor;
- (UIPatternCGColor)initWithCGColor:(CGColor *)a3;
- (id)colorSpaceName;
- (id)description;
- (void)dealloc;
@end

@implementation UIPatternCGColor

- (UIPatternCGColor)initWithCGColor:(CGColor *)a3
{
  ColorSpace = CGColorGetColorSpace(a3);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIColor.m" lineNumber:1029 description:@"Parameter to -[UIPatternCGColor initWithCGColor:] must be a pattern color."];
  }
  v9.receiver = self;
  v9.super_class = (Class)UIPatternCGColor;
  return [(UICGColor *)&v9 initWithCGColor:a3];
}

- (void)dealloc
{
  CGColorRelease(self->_cachedUnflippedColor);
  self->_cachedUnflippedColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPatternCGColor;
  [(UICGColor *)&v3 dealloc];
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  return 0;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (id)description
{
  v2 = self;
  CGPatternRef Pattern = CGColorGetPattern([(UICGColor *)v2 CGColor]);
  v4 = NSString;
  v5 = [(UIPatternCGColor *)v2 colorSpaceName];
  v6 = [v4 stringWithFormat:@"%@ %@", v5, Pattern];

  return v6;
}

- (id)colorSpaceName
{
  return @"kCGColorSpaceModelPattern";
}

- (BOOL)isPatternColor
{
  return 1;
}

@end