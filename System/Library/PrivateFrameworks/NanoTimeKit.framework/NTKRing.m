@interface NTKRing
+ (id)_fillFractionStringForFillFraction:(float)a3 withFormatter:(id)a4;
+ (id)fillFractionStringForFillFraction:(float)a3;
+ (id)fillFractionStringWithSymbolForFillFraction:(float)a3;
- (NTKRing)init;
- (NTKRing)initWithFillFraction:(double)a3 style:(int64_t)a4;
- (NTKRing)initWithFillFraction:(double)a3 style:(int64_t)a4 radius:(double)a5 strokeWidth:(double)a6;
- (double)_validFillFraction:(double)a3;
- (double)backgroundRingAlpha;
- (double)fillFraction;
- (double)radius;
- (double)strokeWidth;
- (id)fillFractionString;
- (id)fillFractionStringWithSymbol;
- (id)ringImage;
- (int64_t)ringStyle;
- (void)fillFraction:(double)a3;
- (void)setBackgroundRingAlpha:(double)a3;
- (void)setFillFraction:(double)a3;
- (void)setRadius:(double)a3;
- (void)setRingStyle:(int64_t)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation NTKRing

- (NTKRing)init
{
  return [(NTKRing *)self initWithFillFraction:0 style:0.0 radius:0.0 strokeWidth:0.0];
}

- (NTKRing)initWithFillFraction:(double)a3 style:(int64_t)a4
{
  return [(NTKRing *)self initWithFillFraction:a4 style:a3 radius:0.0 strokeWidth:0.0];
}

- (NTKRing)initWithFillFraction:(double)a3 style:(int64_t)a4 radius:(double)a5 strokeWidth:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRing;
  v10 = [(NTKRing *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(NTKRing *)v10 _validFillFraction:a3];
    v11->_ringStyle = a4;
    v11->_radius = a5;
    v11->_fillFraction = v12;
    v11->_strokeWidth = a6;
    v11->_backgroundRingAlpha = 0.18;
  }
  return v11;
}

- (id)ringImage
{
  double fillFraction = self->_fillFraction;
  double radius = self->_radius;
  double v5 = radius + self->_strokeWidth * -0.5;
  double v6 = (fillFraction + fillFraction) * 3.14159265 + -1.57079633;
  int64_t ringStyle = self->_ringStyle;
  double v8 = fillFraction * 5.65486678 + 1.88495559;
  if (ringStyle == 1) {
    CGFloat v9 = v8;
  }
  else {
    CGFloat v9 = v6;
  }
  if (ringStyle == 1) {
    double v10 = 1.88495559;
  }
  else {
    double v10 = -1.57079633;
  }
  v11 = +[CLKRenderingContext sharedRenderingContext];
  double v12 = [v11 device];

  [v12 screenScale];
  CGFloat v14 = v13;
  v22.width = radius + radius;
  v22.height = radius + radius;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, self->_strokeWidth);
  v16 = [MEMORY[0x1E4FB1618] blackColor];
  [v16 setStroke];

  CGContextAddArc(CurrentContext, radius, radius, v5, v10, v9, 0);
  CGContextStrokePath(CurrentContext);
  if (self->_fillFraction != 1.0)
  {
    CGFloat v17 = dbl_1BC8A1530[ringStyle == 1];
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:self->_backgroundRingAlpha];
    [v18 setStroke];

    CGContextAddArc(CurrentContext, radius, radius, v5, v9, v17, 0);
    CGContextStrokePath(CurrentContext);
  }
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (void)fillFraction:(double)a3
{
  [(NTKRing *)self _validFillFraction:a3];
  self->_double fillFraction = v4;
}

- (id)fillFractionString
{
  double fillFraction = self->_fillFraction;
  *(float *)&double fillFraction = fillFraction;
  return +[NTKRing fillFractionStringForFillFraction:fillFraction];
}

- (id)fillFractionStringWithSymbol
{
  double fillFraction = self->_fillFraction;
  *(float *)&double fillFraction = fillFraction;
  return +[NTKRing fillFractionStringWithSymbolForFillFraction:fillFraction];
}

- (double)_validFillFraction:(double)a3
{
  double v3 = 1.0;
  if (a3 <= 1.0) {
    double v3 = a3;
  }
  BOOL v4 = a3 < 0.0;
  double result = 0.0;
  if (!v4) {
    return v3;
  }
  return result;
}

+ (id)fillFractionStringForFillFraction:(float)a3
{
  float v3 = a3;
  if (fillFractionStringForFillFraction__onceToken != -1) {
    dispatch_once(&fillFractionStringForFillFraction__onceToken, &__block_literal_global_109);
  }
  uint64_t v5 = fillFractionStringForFillFraction__percentageFormatter;
  a3 = v3;

  return (id)[a1 _fillFractionStringForFillFraction:v5 withFormatter:*(double *)&a3];
}

uint64_t __45__NTKRing_fillFractionStringForFillFraction___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fillFractionStringForFillFraction__percentageFormatter;
  fillFractionStringForFillFraction__percentageFormatter = v0;

  [(id)fillFractionStringForFillFraction__percentageFormatter setNumberStyle:3];
  v2 = (void *)fillFractionStringForFillFraction__percentageFormatter;

  return [v2 setPercentSymbol:&stru_1F1635E90];
}

+ (id)fillFractionStringWithSymbolForFillFraction:(float)a3
{
  float v3 = a3;
  if (fillFractionStringWithSymbolForFillFraction__onceToken != -1) {
    dispatch_once(&fillFractionStringWithSymbolForFillFraction__onceToken, &__block_literal_global_6_3);
  }
  uint64_t v5 = fillFractionStringWithSymbolForFillFraction__percentageFormatter;
  a3 = v3;

  return (id)[a1 _fillFractionStringForFillFraction:v5 withFormatter:*(double *)&a3];
}

uint64_t __55__NTKRing_fillFractionStringWithSymbolForFillFraction___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fillFractionStringWithSymbolForFillFraction__percentageFormatter;
  fillFractionStringWithSymbolForFillFraction__percentageFormatter = v0;

  v2 = (void *)fillFractionStringWithSymbolForFillFraction__percentageFormatter;

  return [v2 setNumberStyle:3];
}

+ (id)_fillFractionStringForFillFraction:(float)a3 withFormatter:(id)a4
{
  if (a3 == -1.0)
  {
    uint64_t v5 = @"--";
  }
  else
  {
    double v6 = NSNumber;
    id v7 = a4;
    *(float *)&double v8 = a3;
    CGFloat v9 = [v6 numberWithFloat:v8];
    double v10 = [v7 stringFromNumber:v9];

    v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v5 = [v10 stringByTrimmingCharactersInSet:v11];
  }

  return v5;
}

- (double)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(double)a3
{
  self->_double fillFraction = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (double)backgroundRingAlpha
{
  return self->_backgroundRingAlpha;
}

- (void)setBackgroundRingAlpha:(double)a3
{
  self->_backgroundRingAlpha = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_double radius = a3;
}

- (int64_t)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(int64_t)a3
{
  self->_int64_t ringStyle = a3;
}

@end