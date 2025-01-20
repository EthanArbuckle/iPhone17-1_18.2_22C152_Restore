@interface TSUColor
+ (id)blackColor;
+ (id)blueColor;
+ (id)brownColor;
+ (id)clearColor;
+ (id)colorWithCGColor:(CGColor *)a3;
+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
+ (id)colorWithPatternImage:(id)a3;
+ (id)colorWithPlatformColor:(id)a3;
+ (id)colorWithRGBAComponents:(const double *)a3;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithUIColor:(id)a3;
+ (id)colorWithWhite:(double)a3 alpha:(double)a4;
+ (id)cyanColor;
+ (id)grayColor;
+ (id)greenColor;
+ (id)lightGrayColor;
+ (id)magentaColor;
+ (id)orangeColor;
+ (id)purpleColor;
+ (id)randomColor;
+ (id)redColor;
+ (id)whiteColor;
+ (id)yellowColor;
- (BOOL)isAlmostEqualToColor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGrayscaleColor;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (CGColor)CGColor;
- (TSUColor)colorWithAlphaComponent:(double)a3;
- (TSUColor)initWithCGColor:(CGColor *)a3;
- (TSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
- (TSUColor)initWithPatternImage:(id)a3;
- (TSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (TSUColor)initWithUIColor:(id)a3;
- (TSUColor)initWithWhite:(double)a3 alpha:(double)a4;
- (double)alphaComponent;
- (double)blueComponent;
- (double)brightnessComponent;
- (double)greenComponent;
- (double)hueComponent;
- (double)luminance;
- (double)p_rgbComponentWithIndex:(unsigned __int8)a3;
- (double)redComponent;
- (double)saturationComponent;
- (id)UIColor;
- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)darkenedColorByFactor:(double)a3;
- (id)grayscaleColor;
- (id)invertedColor;
- (id)lightenedColorByFactor:(double)a3;
- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)getRGBAComponents:(double *)a3;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation TSUColor

+ (id)blackColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:1.0];
  return v2;
}

- (TSUColor)initWithWhite:(double)a3 alpha:(double)a4
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  components[0] = a3;
  components[1] = a4;
  v8 = CGColorCreate(DeviceGray, components);
  v9 = [(TSUColor *)self initWithCGColor:v8];
  CGColorRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v9;
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];
  return v6;
}

- (TSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  CGFloat components[3] = a6;
  v12 = CGColorCreate(DeviceRGB, components);
  v13 = [(TSUColor *)self initWithCGColor:v12];
  CGColorRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  return v13;
}

+ (id)colorWithPlatformColor:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPlatformColor:a3];
  return v3;
}

- (TSUColor)initWithCGColor:(CGColor *)a3
{
  if (!a3)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUColor initWithCGColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 153, @"invalid nil value for '%s'", "CGColor");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSUColor;
  v7 = [(TSUColor *)&v9 init];
  if (v7) {
    v7->mCGColor = CGColorCreateCopy(a3);
  }
  return v7;
}

- (TSUColor)initWithUIColor:(id)a3
{
  if (!a3)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUColor initWithUIColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 224, @"invalid nil value for '%s'", "uiColor");
  }
  uint64_t v7 = [a3 CGColor];
  return [(TSUColor *)self initWithCGColor:v7];
}

- (BOOL)isEqual:(id)a3
{
  CGFloat components[5] = *(CGFloat *)MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (![v6 CGColor]) {
    return 0;
  }
  v8 = [(TSUColor *)self CGColor];
  uint64_t v9 = [v7 CGColor];
  if (v8 != (CGColor *)v9)
  {
    v10 = (CGColor *)v9;
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace([(TSUColor *)self CGColor]);
    v12 = v10;
    v13 = v8;
    CGColorSpaceRef v14 = ColorSpace;
    CGColorSpaceRef v15 = CGColorGetColorSpace((CGColorRef)[v7 CGColor]);
    v16 = (const void *)TSUDeviceGrayColorSpace();
    int v17 = CFEqual(v14, v16);
    v18 = (const void *)TSUDeviceRGBColorSpace();
    int v19 = CFEqual(v14, v18);
    v20 = (const void *)TSUDeviceCMYKColorSpace();
    int v21 = CFEqual(v14, v20);
    v22 = (const void *)TSUDeviceGrayColorSpace();
    int v23 = CFEqual(v15, v22);
    v24 = (const void *)TSUDeviceRGBColorSpace();
    int v25 = CFEqual(v15, v24);
    v26 = (const void *)TSUDeviceCMYKColorSpace();
    int v27 = CFEqual(v15, v26);
    int v28 = v27;
    int v48 = v21;
    int v49 = v19;
    if (v19) {
      BOOL v29 = v25 == 0;
    }
    else {
      BOOL v29 = 1;
    }
    int v30 = v29;
    if (v21) {
      BOOL v31 = v27 == 0;
    }
    else {
      BOOL v31 = 1;
    }
    int v32 = v31;
    if (v17) {
      v33 = v13;
    }
    else {
      v33 = v12;
    }
    v34 = CGColorGetComponents(v33);
    if (v23) {
      BOOL v35 = v17 == 0;
    }
    else {
      BOOL v35 = 1;
    }
    if (v35 && v30 && v32 && v14 != v15)
    {
      if (v49) {
        BOOL v36 = v23 == 0;
      }
      else {
        BOOL v36 = 1;
      }
      char v37 = v36;
      if (v25) {
        BOOL v38 = v17 == 0;
      }
      else {
        BOOL v38 = 1;
      }
      if (v38 && (v37 & 1) != 0)
      {
        if (v48) {
          BOOL v39 = v23 == 0;
        }
        else {
          BOOL v39 = 1;
        }
        char v40 = v39;
        if (v28) {
          BOOL v41 = v17 == 0;
        }
        else {
          BOOL v41 = 1;
        }
        if (v41 && (v40 & 1) != 0)
        {
          BOOL v42 = 0;
LABEL_55:
          v43 = 0;
LABEL_62:
          CGColorRelease(v43);
          return v42;
        }
        memset(components, 0, 24);
        CGFloat components[3] = 1.0 - *v34;
        components[4] = v34[1];
        v45 = (CGColorSpace *)TSUDeviceCMYKColorSpace();
        DeviceRGB = CGColorCreate(v45, components);
      }
      else
      {
        DeviceRGB = TSUCGColorCreateDeviceRGB(*v34, *v34, *v34, v34[1]);
      }
      v43 = DeviceRGB;
      if (v17) {
        v46 = v12;
      }
      else {
        v46 = v13;
      }
      BOOL v42 = __20__TSUColor_isEqual___block_invoke((int)DeviceRGB, DeviceRGB, v46);
      goto LABEL_62;
    }
    BOOL v42 = __20__TSUColor_isEqual___block_invoke((int)v34, v13, v12);
    goto LABEL_55;
  }
  return 1;
}

- (CGColor)CGColor
{
  return self->mCGColor;
}

BOOL __20__TSUColor_isEqual___block_invoke(int a1, CGColorRef color, CGColor *a3)
{
  Components = (double *)CGColorGetComponents(color);
  uint64_t v6 = (double *)CGColorGetComponents(a3);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(color);
  if (NumberOfComponents != CGColorGetNumberOfComponents(a3))
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSUColor isEqual:]_block_invoke"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 320, @"Color space dimension mismatch");
  }
  for (BOOL result = 1; NumberOfComponents; --NumberOfComponents)
    BOOL result = result && vabdd_f64(*Components++, *v6++) < 0.001953125;
  return result;
}

- (void)dealloc
{
  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)TSUColor;
  [(TSUColor *)&v3 dealloc];
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithCGColor:a3];
  return v3;
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithWhite:a3 alpha:a4];
  return v4;
}

+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithHue:a3 saturation:a4 brightness:a5 alpha:a6];
  return v6;
}

+ (id)colorWithPatternImage:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithPatternImage:a3];
  return v3;
}

+ (id)colorWithRGBAComponents:(const double *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithRed:*a3 green:a3[1] blue:a3[2] alpha:a3[3]];
  return v3;
}

+ (id)colorWithUIColor:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithUIColor:a3];
  return v3;
}

+ (id)randomColor
{
  RandomRGB = TSUCGColorCreateRandomRGB();
  objc_super v3 = +[TSUColor colorWithCGColor:RandomRGB];
  CGColorRelease(RandomRGB);
  return v3;
}

+ (id)clearColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:0.0];
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

+ (id)lightGrayColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.667 alpha:1.0];
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

- (TSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  uint64_t v7 = TSUCreateCGColorFromHSB(a3, a4, a5, a6);
  id v8 = [(TSUColor *)self initWithCGColor:v7];
  CGColorRelease(v7);
  return v8;
}

- (TSUColor)initWithPatternImage:(id)a3
{
  if (a3)
  {
    memset(&v12, 0, sizeof(v12));
    [a3 scale];
    CGFloat v6 = 1.0 / v5;
    [a3 scale];
    CGAffineTransformMakeScale(&v12, v6, 1.0 / v7);
    [a3 scale];
    PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform((CGImage *)objc_msgSend(a3, "CGImageForContentsScale:"), (long long *)&v12);
    self = [(TSUColor *)self initWithCGColor:PatternWithImageAndTransform];
    CGColorRelease(PatternWithImageAndTransform);
  }
  else
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSUColor initWithPatternImage:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 207, @"invalid nil value for '%s'", "patternImage");
    NSDeallocateObject(self);
  }
  return self;
}

- (unint64_t)hash
{
  v2 = [(TSUColor *)self CGColor];
  return CFHash(v2);
}

- (BOOL)isAlmostEqualToColor:(id)a3
{
  [(TSUColor *)self redComponent];
  double v6 = v5;
  [a3 redComponent];
  if (vabdd_f64(v6, v7) >= 0.00999999978) {
    return 0;
  }
  [(TSUColor *)self greenComponent];
  double v9 = v8;
  [a3 greenComponent];
  if (vabdd_f64(v9, v10) >= 0.00999999978) {
    return 0;
  }
  [(TSUColor *)self blueComponent];
  double v12 = v11;
  [a3 blueComponent];
  if (vabdd_f64(v12, v13) >= 0.00999999978) {
    return 0;
  }
  [(TSUColor *)self alphaComponent];
  double v15 = v14;
  [a3 alphaComponent];
  return vabdd_f64(v15, v16) < 0.00999999978;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TSUColor allocWithZone:a3];
  mCGColor = self->mCGColor;
  return [(TSUColor *)v4 initWithCGColor:mCGColor];
}

- (double)p_rgbComponentWithIndex:(unsigned __int8)a3
{
  int v3 = a3;
  Components = CGColorGetComponents([(TSUColor *)self CGColor]);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace([(TSUColor *)self CGColor]);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelMonochrome) {
    return *Components;
  }
  if (Model == kCGColorSpaceModelCMYK) {
    return 1.0 - fmin(Components[3] + Components[v3] * (1.0 - Components[3]), 1.0);
  }
  double result = 0.0;
  if (Model == kCGColorSpaceModelRGB) {
    return Components[v3];
  }
  return result;
}

- (double)redComponent
{
  [(TSUColor *)self p_rgbComponentWithIndex:0];
  return result;
}

- (double)greenComponent
{
  [(TSUColor *)self p_rgbComponentWithIndex:1];
  return result;
}

- (double)blueComponent
{
  [(TSUColor *)self p_rgbComponentWithIndex:2];
  return result;
}

- (double)alphaComponent
{
  v2 = [(TSUColor *)self CGColor];
  return CGColorGetAlpha(v2);
}

- (void)getRGBAComponents:(double *)a3
{
  if (!a3)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUColor getRGBAComponents:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 423, @"rgbaComponents is NULL!");
  }
  [(TSUColor *)self redComponent];
  *(void *)a3 = v7;
  [(TSUColor *)self greenComponent];
  *((void *)a3 + 1) = v8;
  [(TSUColor *)self blueComponent];
  *((void *)a3 + 2) = v9;
  [(TSUColor *)self alphaComponent];
  *((void *)a3 + 3) = v10;
}

- (double)hueComponent
{
  uint64_t v10 = 0;
  double v11 = 0.0;
  uint64_t v9 = 0;
  [(TSUColor *)self redComponent];
  double v4 = v3;
  [(TSUColor *)self greenComponent];
  double v6 = v5;
  [(TSUColor *)self blueComponent];
  TSURGBToHSB(&v11, (double *)&v10, (double *)&v9, v4, v6, v7);
  return v11;
}

- (double)saturationComponent
{
  double v10 = 0.0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  [(TSUColor *)self redComponent];
  double v4 = v3;
  [(TSUColor *)self greenComponent];
  double v6 = v5;
  [(TSUColor *)self blueComponent];
  TSURGBToHSB((double *)&v11, &v10, (double *)&v9, v4, v6, v7);
  return v10;
}

- (double)brightnessComponent
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  [(TSUColor *)self redComponent];
  double v4 = v3;
  [(TSUColor *)self greenComponent];
  double v6 = v5;
  [(TSUColor *)self blueComponent];
  TSURGBToHSB((double *)&v11, (double *)&v10, &v9, v4, v6, v7);
  return v9;
}

- (id)UIColor
{
  v2 = (void *)MEMORY[0x263F1C550];
  double v3 = [(TSUColor *)self CGColor];
  return (id)[v2 colorWithCGColor:v3];
}

- (id)grayscaleColor
{
  v2 = self;
  Components = CGColorGetComponents([(TSUColor *)self CGColor]);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace([(TSUColor *)v2 CGColor]);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelMonochrome) {
    return v2;
  }
  if (Model != kCGColorSpaceModelRGB) {
    return 0;
  }
  double v6 = Components[3];
  double v7 = Components[1] * 0.59 + *Components * 0.3 + Components[2] * 0.11;
  return +[TSUColor colorWithWhite:v7 alpha:v6];
}

- (id)invertedColor
{
  if (CGColorGetNumberOfComponents([(TSUColor *)self CGColor]) != 4)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUColor invertedColor]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 503, @"Wrong number of components while inverting color. %zi instead of 4", CGColorGetNumberOfComponents(-[TSUColor CGColor](self, "CGColor")));
  }
  Components = CGColorGetComponents([(TSUColor *)self CGColor]);
  double v6 = 1.0 - *Components;
  double v7 = 1.0 - Components[1];
  double v8 = Components[3];
  double v9 = 1.0 - Components[2];
  return +[TSUColor colorWithRed:v6 green:v7 blue:v9 alpha:v8];
}

- (BOOL)isGrayscaleColor
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace([(TSUColor *)self CGColor]);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelMonochrome) {
    return 1;
  }
  [(TSUColor *)self getRGBAComponents:&v5];
  if (v5 != v6 && vabdd_f64(v5, v6) >= fabs(v6 * 0.000000999999997)
    || v5 != v7 && vabdd_f64(v5, v7) >= fabs(v7 * 0.000000999999997))
  {
    return 0;
  }
  if (v6 == v7) {
    return 1;
  }
  return vabdd_f64(v6, v7) < fabs(v7 * 0.000000999999997);
}

- (id)lightenedColorByFactor:(double)a3
{
  v15[4] = *(double *)MEMORY[0x263EF8340];
  if (a3 < 0.0 || a3 > 1.0)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSUColor lightenedColorByFactor:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 535, @"Invalid factor: %f", *(void *)&a3);
  }
  if ([(TSUColor *)self isGrayscaleColor])
  {
    [(TSUColor *)self p_rgbComponentWithIndex:0];
    double v9 = v8;
    [(TSUColor *)self alphaComponent];
    return +[TSUColor colorWithWhite:v9 + (1.0 - v9) * a3 alpha:v10];
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    [(TSUColor *)self getRGBAComponents:v15];
    TSURGBToHSB(&v14, &v13, &v12, v15[0], v15[1], v15[2]);
    double v12 = v12 + (1.0 - v12) * a3;
    double v13 = (1.0 - a3) * v13;
    return +[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:", v14);
  }
}

- (id)darkenedColorByFactor:(double)a3
{
  v12[4] = *(double *)MEMORY[0x263EF8340];
  if ([(TSUColor *)self isGrayscaleColor])
  {
    [(TSUColor *)self p_rgbComponentWithIndex:0];
    double v6 = v5;
    [(TSUColor *)self alphaComponent];
    return +[TSUColor colorWithWhite:(1.0 - a3) * v6 alpha:v7];
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    [(TSUColor *)self getRGBAComponents:v12];
    TSURGBToHSB(&v11, &v10, &v9, v12[0], v12[1], v12[2]);
    return +[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:", v11, (1.0 - a3) * v9, v10 + (1.0 - v10) * a3);
  }
}

- (TSUColor)colorWithAlphaComponent:(double)a3
{
  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->mCGColor, a3);
  uint64_t v4 = +[TSUColor colorWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);
  return v4;
}

- (double)luminance
{
  Components = CGColorGetComponents([(TSUColor *)self CGColor]);
  size_t NumberOfComponents = CGColorGetNumberOfComponents([(TSUColor *)self CGColor]);
  double v5 = *Components;
  double v6 = Components[1];
  if (NumberOfComponents == 2) {
    return v5 * v6;
  }
  double result = v6 * 0.715200007 + v5 * 0.212599993 + Components[2] * 0.0722000003 * Components[3];
  double v8 = 1.0;
  BOOL v9 = result < 0.0 || result > 1.0;
  if (result <= 1.0 || result < 0.0) {
    double v8 = 0.0;
  }
  if (v9) {
    return v8;
  }
  return result;
}

- (BOOL)isOpaque
{
  return CGColorGetAlpha([(TSUColor *)self CGColor]) == 1.0;
}

- (BOOL)isNearlyWhite
{
  double v10 = 0.0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  [(TSUColor *)self redComponent];
  double v4 = v3;
  [(TSUColor *)self greenComponent];
  double v6 = v5;
  [(TSUColor *)self blueComponent];
  TSURGBToHSB((double *)&v11, &v9, &v10, v4, v6, v7);
  return v9 < 0.05 && v10 > 0.9;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v4 = [(TSUColor *)self newBlendedColorWithFraction:a4 ofColor:a3];
  return v4;
}

- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  double v7 = [TSUColor alloc];
  [(TSUColor *)self redComponent];
  double v9 = v8;
  [a4 redComponent];
  double v11 = TSUMix(v9, v10, a3);
  [(TSUColor *)self greenComponent];
  double v13 = v12;
  [a4 greenComponent];
  double v15 = TSUMix(v13, v14, a3);
  [(TSUColor *)self blueComponent];
  double v17 = v16;
  [a4 blueComponent];
  double v19 = TSUMix(v17, v18, a3);
  [(TSUColor *)self alphaComponent];
  double v21 = v20;
  [a4 alphaComponent];
  double v23 = TSUMix(v21, v22, a3);
  return [(TSUColor *)v7 initWithRed:v11 green:v15 blue:v19 alpha:v23];
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, self->mCGColor);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGContextFillRect(a4, v11);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, self->mCGColor);
  CGContextAddPath(a4, a3);
  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

@end