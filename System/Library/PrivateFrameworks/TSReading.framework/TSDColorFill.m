@interface TSDColorFill
+ (id)blackColor;
+ (id)blueColor;
+ (id)brownColor;
+ (id)clearColor;
+ (id)colorWithCGColor:(CGColor *)a3;
+ (id)colorWithColor:(id)a3;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithUIColor:(id)a3;
+ (id)colorWithWhite:(double)a3 alpha:(double)a4;
+ (id)cyanColor;
+ (id)grayColor;
+ (id)greenColor;
+ (id)keyPathsForValuesAffectingBrightness;
+ (id)keyPathsForValuesAffectingCGColor;
+ (id)keyPathsForValuesAffectingHue;
+ (id)keyPathsForValuesAffectingLuminance;
+ (id)keyPathsForValuesAffectingOpacity;
+ (id)keyPathsForValuesAffectingSaturation;
+ (id)magentaColor;
+ (id)orangeColor;
+ (id)purpleColor;
+ (id)randomColor;
+ (id)redColor;
+ (id)whiteColor;
+ (id)yellowColor;
- (BOOL)canApplyToCALayer;
- (BOOL)canApplyToCAShapeLayer;
- (BOOL)drawsInOneStep;
- (BOOL)isClear;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (CGColor)CGColor;
- (SEL)mapThemeAssetSelector;
- (TSDColorFill)initWithCGColor:(CGColor *)a3;
- (TSDColorFill)initWithColor:(id)a3;
- (TSDColorFill)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (TSDColorFill)initWithUIColor:(id)a3;
- (TSDColorFill)initWithWhite:(double)a3 alpha:(double)a4;
- (TSUColor)color;
- (double)brightness;
- (double)hue;
- (double)luminance;
- (double)opacity;
- (double)p_hsbComponentWithIndex:(unint64_t)a3;
- (double)saturation;
- (id)UIColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)grayscaleColor;
- (id)invertedColor;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)fillType;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)applyToCALayer:(id)a3 withScale:(double)a4;
- (void)applyToCAShapeLayer:(id)a3 withScale:(double)a4;
- (void)dealloc;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation TSDColorFill

+ (id)colorWithColor:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithColor:a3];

  return v3;
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCGColor:a3];

  return v3;
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];

  return v6;
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithWhite:a3 alpha:a4];

  return v4;
}

+ (id)colorWithUIColor:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUIColor:a3];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(TSDColorFill *)self color];

  return (id)[v4 initWithColor:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TSDMutableColorFill alloc];
  v5 = [(TSDColorFill *)self color];

  return [(TSDColorFill *)v4 initWithColor:v5];
}

+ (id)randomColor
{
  RandomRGB = (CGColor *)TSUCGColorCreateRandomRGB();
  id v3 = +[TSDColorFill colorWithCGColor:RandomRGB];
  CGColorRelease(RandomRGB);
  return v3;
}

+ (id)clearColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:0.0];

  return v2;
}

+ (id)blackColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:1.0];

  return v2;
}

+ (id)whiteColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:1.0 alpha:1.0];

  return v2;
}

+ (id)grayColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.5 alpha:1.0];

  return v2;
}

+ (id)redColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)greenColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)blueColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];

  return v2;
}

+ (id)cyanColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];

  return v2;
}

+ (id)yellowColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)magentaColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];

  return v2;
}

+ (id)orangeColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)purpleColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];

  return v2;
}

+ (id)brownColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.6 green:0.4 blue:0.2 alpha:1.0];

  return v2;
}

- (TSDColorFill)initWithColor:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDColorFill initWithColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 138, @"invalid nil value for '%s'", "color");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDColorFill;
  v7 = [(TSDColorFill *)&v9 init];
  if (v7) {
    v7->mColor = (TSUColor *)[a3 copy];
  }
  return v7;
}

- (TSDColorFill)initWithCGColor:(CGColor *)a3
{
  uint64_t v4 = [MEMORY[0x263F7C808] colorWithCGColor:a3];

  return [(TSDColorFill *)self initWithColor:v4];
}

- (TSDColorFill)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  uint64_t v7 = [MEMORY[0x263F7C808] colorWithRed:a3 green:a4 blue:a5 alpha:a6];

  return [(TSDColorFill *)self initWithColor:v7];
}

- (TSDColorFill)initWithWhite:(double)a3 alpha:(double)a4
{
  uint64_t v5 = [MEMORY[0x263F7C808] colorWithWhite:a3 alpha:a4];

  return [(TSDColorFill *)self initWithColor:v5];
}

- (TSDColorFill)initWithUIColor:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDColorFill initWithUIColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 167, @"invalid nil value for '%s'", "uiColor");
  }
  uint64_t v7 = [MEMORY[0x263F7C808] colorWithUIColor:a3];

  return [(TSDColorFill *)self initWithColor:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDColorFill;
  [(TSDColorFill *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(TSUColor *)self->mColor hash];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    uint64_t v4 = TSUDynamicCast();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [(TSDColorFill *)self color];
      uint64_t v7 = [v5 color];
      LOBYTE(v4) = [(TSUColor *)v6 isEqual:v7];
    }
  }
  return v4;
}

- (id)UIColor
{
  v2 = [(TSDColorFill *)self color];

  return (id)[(TSUColor *)v2 UIColor];
}

- (id)grayscaleColor
{
  objc_super v3 = objc_opt_class();
  uint64_t v4 = [(TSUColor *)[(TSDColorFill *)self color] grayscaleColor];

  return (id)[v3 colorWithColor:v4];
}

- (id)invertedColor
{
  objc_super v3 = objc_opt_class();
  uint64_t v4 = [(TSUColor *)[(TSDColorFill *)self color] invertedColor];

  return (id)[v3 colorWithColor:v4];
}

- (BOOL)isOpaque
{
  [(TSDColorFill *)self opacity];
  return v2 == 1.0;
}

- (BOOL)isClear
{
  [(TSDColorFill *)self opacity];
  return v2 == 0.0;
}

- (BOOL)isNearlyWhite
{
  double v2 = [(TSDColorFill *)self color];

  return [(TSUColor *)v2 isNearlyWhite];
}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v9 = [(TSDColorFill *)self color];

  -[TSUColor paintRect:inContext:](v9, "paintRect:inContext:", a4, x, y, width, height);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  uint64_t v6 = [(TSDColorFill *)self color];

  [(TSUColor *)v6 paintPath:a3 inContext:a4];
}

- (BOOL)canApplyToCALayer
{
  return 1;
}

- (void)applyToCALayer:(id)a3 withScale:(double)a4
{
  if (![(TSDColorFill *)self canApplyToCALayer])
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDColorFill applyToCALayer:withScale:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 253, @"Applying color fill with unsupported properties to CALayer");
  }
  [a3 setContents:0];
  BOOL v8 = [(TSDColorFill *)self isClear];
  objc_super v9 = 0;
  if (!v8) {
    objc_super v9 = [(TSDColorFill *)self CGColor];
  }

  [a3 setBackgroundColor:v9];
}

- (BOOL)canApplyToCAShapeLayer
{
  return 1;
}

- (void)applyToCAShapeLayer:(id)a3 withScale:(double)a4
{
  uint64_t v5 = [(TSDColorFill *)self CGColor];

  [a3 setFillColor:v5];
}

- (int)fillType
{
  return 0;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapColorFill_;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__TSDColorFill_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1B58;
  v4[4] = a3;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDColorFill_mixingTypeWithObject___block_invoke()
{
  objc_opt_class();
  if (!TSUDynamicCast())
  {
    v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v1 = [NSString stringWithUTF8String:"-[TSDColorFill mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 304, @"nil object after cast");
  }
  return 4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSDColorFill_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __49__TSDColorFill_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "color"), "blendedColorWithFraction:ofColor:", objc_msgSend((id)TSUDynamicCast(), "color"), *(double *)(a1 + 48));

  return +[TSDColorFill colorWithColor:v2];
}

- (double)p_hsbComponentWithIndex:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_msgSend((id)-[TSUColor UIColor](-[TSDColorFill color](self, "color", 0, 0, 0, 0), "UIColor"), "getHue:saturation:brightness:alpha:", &v5, (char *)&v5 + 8, &v6, (char *)&v6 + 8);
  return *((double *)&v5 + a3);
}

- (CGColor)CGColor
{
  uint64_t v2 = [(TSDColorFill *)self color];

  return (CGColor *)[(TSUColor *)v2 CGColor];
}

- (double)opacity
{
  uint64_t v2 = [(TSDColorFill *)self color];

  [(TSUColor *)v2 alphaComponent];
  return result;
}

- (double)luminance
{
  Components = CGColorGetComponents([(TSDColorFill *)self CGColor]);
  double result = Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3];
  double v4 = 1.0;
  BOOL v5 = result < 0.0 || result > 1.0;
  if (result <= 1.0 || result < 0.0) {
    double v4 = 0.0;
  }
  if (v5) {
    return v4;
  }
  return result;
}

- (double)hue
{
  [(TSDColorFill *)self p_hsbComponentWithIndex:0];
  return result;
}

- (double)saturation
{
  [(TSDColorFill *)self p_hsbComponentWithIndex:1];
  return result;
}

- (double)brightness
{
  [(TSDColorFill *)self p_hsbComponentWithIndex:2];
  return result;
}

+ (id)keyPathsForValuesAffectingCGColor
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingOpacity
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingLuminance
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingHue
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingSaturation
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingBrightness
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

- (TSUColor)color
{
  return self->mColor;
}

@end