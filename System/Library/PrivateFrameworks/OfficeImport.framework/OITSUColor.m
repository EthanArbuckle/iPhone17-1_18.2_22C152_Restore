@interface OITSUColor
+ (id)blackColor;
+ (id)blueColor;
+ (id)brownColor;
+ (id)clearColor;
+ (id)colorWithBGR:(unsigned int)a3;
+ (id)colorWithBGRValue:(int64_t)a3;
+ (id)colorWithBinaryRed:(int)a3 green:(int)a4 blue:(int)a5;
+ (id)colorWithBinaryRed:(int)a3 green:(int)a4 blue:(int)a5 alpha:(int)a6;
+ (id)colorWithCGColor:(CGColor *)a3;
+ (id)colorWithCalibratedHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
+ (id)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithCalibratedWhite:(double)a3 alpha:(double)a4;
+ (id)colorWithCatalogName:(id)a3 colorName:(id)a4;
+ (id)colorWithCsColour:(const CsColour *)a3;
+ (id)colorWithDeviceCyan:(double)a3 magenta:(double)a4 yellow:(double)a5 black:(double)a6 alpha:(double)a7;
+ (id)colorWithDeviceHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
+ (id)colorWithDeviceRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithDeviceWhite:(double)a3 alpha:(double)a4;
+ (id)colorWithEshColor:(const EshColor *)a3;
+ (id)colorWithHexString:(id)a3;
+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7;
+ (id)colorWithPatternImage:(id)a3;
+ (id)colorWithRGBBytes:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5;
+ (id)colorWithRGBValue:(int64_t)a3;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithSystemColorID:(int)a3;
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
+ (id)stringForColor:(id)a3;
+ (id)stringForSystemColorID:(int)a3;
+ (id)whiteColor;
+ (id)yellowColor;
- ($14D77461FF5D83CAEC4252578BA76F85)ttColor;
- (BOOL)isAlmostEqualToColor:(id)a3;
- (BOOL)isBlack;
- (BOOL)isEqualWithTolerance:(id)a3;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (BOOL)p_isEqualToColor:(id)a3 withTolerance:(double)a4;
- (BOOL)wantsHighContrastBackgroundForDarkMode:(id)a3;
- (CGColor)CGColor;
- (CGColorSpace)CGColorSpace;
- (CsColour)csColour;
- (EshColor)eshColor;
- (OITSUColor)colorWithAlphaComponent:(double)a3;
- (OITSUColor)colorWithShadeValue:(double)a3;
- (OITSUColor)colorWithTintValue:(double)a3;
- (OITSUColor)initWithCGColor:(CGColor *)a3;
- (OITSUColor)initWithCGColor:(CGColor *)a3 colorSpace:(unint64_t)a4;
- (OITSUColor)initWithHexString:(id)a3;
- (OITSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
- (OITSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7;
- (OITSUColor)initWithPatternImage:(id)a3;
- (OITSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (OITSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7;
- (OITSUColor)initWithUIColor:(id)a3;
- (OITSUColor)initWithWhite:(double)a3 alpha:(double)a4;
- (UIColor)UIColor;
- (double)alphaComponent;
- (double)blackComponent;
- (double)blueComponent;
- (double)brightnessComponent;
- (double)cyanComponent;
- (double)greenComponent;
- (double)hueComponent;
- (double)luminance;
- (double)magentaComponent;
- (double)p_cmykComponentWithIndex:(unsigned __int8)a3;
- (double)p_rgbComponentWithIndex:(unsigned __int8)a3;
- (double)redComponent;
- (double)saturationComponent;
- (double)whiteComponent;
- (double)yellowComponent;
- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (id)copy;
- (id)grayscaleColor;
- (id)hexString;
- (id)invertedColor;
- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (id)newSolidColoredBitmap:(CGSize)a3;
- (id)solidColoredPngImage;
- (int)CGColorSpaceModel;
- (unint64_t)colorRGBSpace;
- (unint64_t)hash;
- (unsigned)toBGR;
- (void)dealloc;
- (void)getCyan:(double *)a3 magenta:(double *)a4 yellow:(double *)a5 black:(double *)a6 alpha:(double *)a7;
- (void)getRGBAComponents:(double *)a3;
- (void)getRGBBytes:(char *)a3 green:(char *)a4 blue:(char *)a5;
- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (void)getWhite:(double *)a3 alpha:(double *)a4;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)set;
@end

@implementation OITSUColor

- (CGColor)CGColor
{
  CGColorRef v2 = CGColorRetain(self->mCGColor);
  return (CGColor *)CFAutorelease(v2);
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

+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithHue:a3 saturation:a4 brightness:a5 alpha:a6];
  return v6;
}

+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithHue:a7 saturation:a3 brightness:a4 alpha:a5 targetRGBSpace:a6];
  return v7;
}

+ (id)colorWithPatternImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPatternImage:v4];

  return v5;
}

+ (id)colorWithHexString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithHexString:v4];

  return v5;
}

+ (id)colorWithUIColor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithUIColor:v4];

  return v5;
}

+ (id)randomColor
{
  RandomRGB = TSUCGColorCreateRandomRGB();
  v3 = +[OITSUColor colorWithCGColor:RandomRGB];
  CGColorRelease(RandomRGB);
  return v3;
}

+ (id)clearColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:0.0];
  return v2;
}

+ (id)blackColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:1.0];
  return v2;
}

+ (id)whiteColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithWhite:1.0 alpha:1.0];
  return v2;
}

+ (id)grayColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.5 alpha:1.0];
  return v2;
}

+ (id)lightGrayColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.667 alpha:1.0];
  return v2;
}

+ (id)redColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
  return v2;
}

+ (id)greenColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
  return v2;
}

+ (id)blueColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
  return v2;
}

+ (id)cyanColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];
  return v2;
}

+ (id)yellowColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];
  return v2;
}

+ (id)magentaColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
  return v2;
}

+ (id)orangeColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
  return v2;
}

+ (id)purpleColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];
  return v2;
}

+ (id)brownColor
{
  CGColorRef v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.6 green:0.4 blue:0.2 alpha:1.0];
  return v2;
}

- (OITSUColor)initWithCGColor:(CGColor *)a3 colorSpace:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v7 = [NSString stringWithUTF8String:"-[OITSUColor initWithCGColor:colorSpace:]"];
    v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 150, 0, "invalid nil value for '%{public}s'", "CGColor");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v41.receiver = self;
  v41.super_class = (Class)OITSUColor;
  v9 = [(OITSUColor *)&v41 init];
  if (v9)
  {
    if (CGColorGetPattern(a3))
    {
      if (a4 != 2)
      {
        v10 = [NSString stringWithUTF8String:"-[OITSUColor initWithCGColor:colorSpace:]"];
        v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 232, 0, "If the color has a pattern, its color space should be Unspecified");
LABEL_7:

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
LABEL_26:
      Copy = CGColorCreateCopy(a3);
      goto LABEL_27;
    }
    ColorSpace = CGColorGetColorSpace(a3);
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    if (a4)
    {
      if (a4 != 2)
      {
        if (a4 != 1) {
          goto LABEL_26;
        }
        if (Model != kCGColorSpaceModelRGB)
        {
          v14 = [NSString stringWithUTF8String:"-[OITSUColor initWithCGColor:colorSpace:]"];
          v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
          +[OITSUAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:172 isFatal:0 description:"Color specified as P3 isn't even RGB!"];

          +[OITSUAssertionHandler logBacktraceThrottled];
        }
        CGColorSpaceRef v16 = CGColorGetColorSpace(a3);
        v17 = (const void *)TSUSRGBColorSpace();
        if (!CFEqual(v16, v17))
        {
          v18 = (const void *)TSUP3ColorSpace();
          if (!CFEqual(v16, v18))
          {
            v19 = (const void *)TSUDeviceRGBColorSpace();
            if (!CFEqual(v16, v19))
            {
              v10 = [NSString stringWithUTF8String:"-[OITSUColor initWithCGColor:colorSpace:]"];
              v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
              +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 179, 0, "Color specified as P3 isn't P3, sRGB or Device RGB");
              a4 = 1;
              goto LABEL_7;
            }
          }
        }
        goto LABEL_25;
      }
      CGColorSpaceRef v25 = CGColorGetColorSpace(a3);
      v26 = (const void *)TSUSRGBColorSpace();
      if (!CFEqual(v25, v26))
      {
        v27 = (const void *)TSUP3ColorSpace();
        if (!CFEqual(v25, v27))
        {
          v38 = CGColorGetColorSpace(a3);
          if (CGColorSpaceGetModel(v38) == kCGColorSpaceModelRGB && CGColorSpaceIsWideGamutRGB(v38))
          {
            a4 = 1;
            v39 = (CGColorSpace *)TSUP3ColorSpace();
          }
          else
          {
            v39 = (CGColorSpace *)TSUSRGBColorSpace();
            a4 = 0;
          }
          Copy = CGColorCreateCopyByMatchingToColorSpace(v39, kCGRenderingIntentDefault, a3, 0);
          if (Copy)
          {
LABEL_27:
            v9->mCGColor = Copy;
            v9->mColorRGBSpace = a4;
            if (!CGColorGetPattern(Copy))
            {
              Components = CGColorGetComponents(v9->mCGColor);
              size_t NumberOfComponents = CGColorGetNumberOfComponents(v9->mCGColor);
              v31 = (const CGFloat *)((char *)&v40 - ((8 * NumberOfComponents + 15) & 0xFFFFFFFFFFFFFFF0));
              if (NumberOfComponents)
              {
                v32 = (double *)((char *)&v40 - ((8 * NumberOfComponents + 15) & 0xFFFFFFFFFFFFFFF0));
                do
                {
                  double v33 = *Components++;
                  float v34 = v33;
                  *v32++ = v34;
                  --NumberOfComponents;
                }
                while (NumberOfComponents);
              }
              v35 = CGColorGetColorSpace(v9->mCGColor);
              CGColorRef v36 = CGColorCreate(v35, v31);
              CGColorRelease(v9->mCGColor);
              v9->mCGColor = v36;
            }
            return v9;
          }
          goto LABEL_26;
        }
LABEL_25:
        a4 = 1;
        goto LABEL_26;
      }
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB)
      {
        v20 = [NSString stringWithUTF8String:"-[OITSUColor initWithCGColor:colorSpace:]"];
        v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:185 isFatal:0 description:"Color specified as sRGB isn't even RGB!"];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      CGColorSpaceRef v22 = CGColorGetColorSpace(a3);
      v23 = (const void *)TSUSRGBColorSpace();
      if (!CFEqual(v22, v23))
      {
        v24 = (const void *)TSUDeviceRGBColorSpace();
        if (!CFEqual(v22, v24))
        {
          v10 = [NSString stringWithUTF8String:"-[OITSUColor initWithCGColor:colorSpace:]"];
          v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
          +[OITSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:189 isFatal:0 description:"Color specified as sRGB isn't sRGB or Device RGB"];
          a4 = 0;
          goto LABEL_7;
        }
      }
    }
    a4 = 0;
    goto LABEL_26;
  }
  return v9;
}

- (OITSUColor)initWithCGColor:(CGColor *)a3
{
  return [(OITSUColor *)self initWithCGColor:a3 colorSpace:2];
}

- (OITSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return [(OITSUColor *)self initWithRed:2 green:a3 blue:a4 alpha:a5 colorSpace:a6];
}

- (OITSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  if (!a7 || a7 == 2)
  {
    v13 = (CGColorSpace *)TSUSRGBColorSpace();
  }
  else if (a7 == 1)
  {
    v13 = (CGColorSpace *)TSUP3ColorSpace();
  }
  else
  {
    v13 = 0;
  }
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  v14 = CGColorCreate(v13, components);
  v15 = [(OITSUColor *)self initWithCGColor:v14 colorSpace:a7];
  CGColorRelease(v14);
  return v15;
}

- (OITSUColor)initWithWhite:(double)a3 alpha:(double)a4
{
  return [(OITSUColor *)self initWithRed:a3 green:a3 blue:a3 alpha:a4];
}

- (OITSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return [(OITSUColor *)self initWithHue:2 saturation:a3 brightness:a4 alpha:a5 targetRGBSpace:a6];
}

- (OITSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  if (a7)
  {
    if (a7 == 1) {
      v12 = (CGColorSpace *)TSUP3ColorSpace();
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = (CGColorSpace *)TSUSRGBColorSpace();
  }
  v13 = TSUCreateCGColorFromHSBInColorSpace(v12, a3, a4, a5, a6);
  v14 = [(OITSUColor *)self initWithCGColor:v13];
  CGColorRelease(v13);
  return v14;
}

- (OITSUColor)initWithPatternImage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    memset(&v14, 0, sizeof(v14));
    [v4 scale];
    CGFloat v7 = 1.0 / v6;
    [v5 scale];
    CGAffineTransformMakeScale(&v14, v7, 1.0 / v8);
    PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform((CGImage *)[v5 CGImage], (long long *)&v14);
    v10 = [(OITSUColor *)self initWithCGColor:PatternWithImageAndTransform];
    CGColorRelease(PatternWithImageAndTransform);
  }
  else
  {
    v11 = [NSString stringWithUTF8String:"-[OITSUColor initWithPatternImage:]"];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 337, 0, "invalid nil value for '%{public}s'", "patternImage");

    +[OITSUAssertionHandler logBacktraceThrottled];
    v10 = 0;
  }

  return v10;
}

- (OITSUColor)initWithHexString:(id)a3
{
  id v4 = a3;
  if ([v4 rangeOfString:@"#[\\dA-F]{6}" options:1024] || v5 != objc_msgSend(v4, "length"))
  {
    v13 = [NSString stringWithUTF8String:"-[OITSUColor initWithHexString:]"];
    CGAffineTransform v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v13, v14, 354, 0, "Invalid hex string: %@", v4 file lineNumber isFatal description];

    +[OITSUAssertionHandler logBacktraceThrottled];
    v12 = 0;
  }
  else
  {
    double v6 = objc_msgSend(v4, "substringWithRange:", 1, 2);
    uint64_t v7 = __32__OITSUColor_initWithHexString___block_invoke((uint64_t)v6, v6);

    double v8 = objc_msgSend(v4, "substringWithRange:", 3, 2);
    uint64_t v9 = __32__OITSUColor_initWithHexString___block_invoke((uint64_t)v8, v8);

    v10 = objc_msgSend(v4, "substringWithRange:", 5, 2);
    uint64_t v11 = __32__OITSUColor_initWithHexString___block_invoke((uint64_t)v10, v10);

    v12 = [(OITSUColor *)self initWithRed:(float)((float)(unint64_t)v7 / 255.0) green:(float)((float)(unint64_t)v9 / 255.0) blue:(float)((float)(unint64_t)v11 / 255.0) alpha:1.0];
  }

  return v12;
}

uint64_t __32__OITSUColor_initWithHexString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 substringToIndex:1];
  uint64_t v4 = [@"0123456789ABCDEF" rangeOfString:v3];
  uint64_t v5 = [v2 substringFromIndex:1];

  uint64_t v6 = [@"0123456789ABCDEF" rangeOfString:v5] + 16 * v4;
  return v6;
}

- (OITSUColor)initWithUIColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OITSUColor initWithUIColor:]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 373, 0, "invalid nil value for '%{public}s'", "uiColor");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  id v7 = v4;
  double v8 = (CGColor *)[v7 CGColor];
  if (CGColorGetPattern(v8))
  {
    uint64_t v9 = [(OITSUColor *)self initWithCGColor:v8];
  }
  else
  {
    v10 = (CGColorSpace *)TSUP3ColorSpace();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, v8, 0);
    v12 = (CGColorSpace *)TSUSRGBColorSpace();
    v13 = CGColorCreateCopyByMatchingToColorSpace(v12, kCGRenderingIntentDefault, CopyByMatchingToColorSpace, 0);
    CGAffineTransform v14 = (CGColorSpace *)TSUP3ColorSpace();
    v15 = CGColorCreateCopyByMatchingToColorSpace(v14, kCGRenderingIntentDefault, v13, 0);
    CGColorSpaceRef v16 = +[OITSUColor colorWithCGColor:CopyByMatchingToColorSpace];
    v17 = +[OITSUColor colorWithCGColor:v15];
    if ([v16 isEqualWithTolerance:v17]) {
      v18 = v13;
    }
    else {
      v18 = CopyByMatchingToColorSpace;
    }
    v19 = [(OITSUColor *)self initWithCGColor:v18];
    CGColorRelease(CopyByMatchingToColorSpace);
    CGColorRelease(v13);
    CGColorRelease(v15);
    uint64_t v9 = v19;
  }
  return v9;
}

- (void)dealloc
{
  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)OITSUColor;
  [(OITSUColor *)&v3 dealloc];
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)p_isEqualToColor:(id)a3 withTolerance:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6
    && (unint64_t mColorRGBSpace = self->mColorRGBSpace, mColorRGBSpace == [v6 colorRGBSpace])
    && [v7 CGColor])
  {
    uint64_t v9 = [(OITSUColor *)self CGColor];
    uint64_t v10 = [v7 CGColor];
    if (v9 == (CGColor *)v10)
    {
      char v18 = 1;
    }
    else
    {
      uint64_t v11 = (CGColor *)v10;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__OITSUColor_p_isEqualToColor_withTolerance___block_invoke;
      aBlock[3] = &__block_descriptor_40_e31_B24__0__CGColor__8__CGColor__16l;
      *(double *)&aBlock[4] = a4;
      v12 = (uint64_t (**)(void *, CGColor *, CGColor *))_Block_copy(aBlock);
      ColorSpace = CGColorGetColorSpace(v9);
      CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
      v15 = CGColorGetColorSpace(v11);
      if (Model != CGColorSpaceGetModel(v15))
      {
        CGColorSpaceRef v16 = [NSString stringWithUTF8String:"-[OITSUColor p_isEqualToColor:withTolerance:]"];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:488 isFatal:0 description:"TSUColors should always be RGB! Comparing two with different color models."];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      if (CFEqual(ColorSpace, v15)) {
        char v18 = v12[2](v12, v9, v11);
      }
      else {
        char v18 = 0;
      }
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

BOOL __45__OITSUColor_p_isEqualToColor_withTolerance___block_invoke(uint64_t a1, CGColorRef color, CGColorRef color2)
{
  if (*(double *)(a1 + 32) == 0.0)
  {
    return CGColorEqualToColor(color, color2);
  }
  else
  {
    Components = (double *)CGColorGetComponents(color);
    double v8 = (double *)CGColorGetComponents(color2);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(color);
    if (NumberOfComponents != CGColorGetNumberOfComponents(color2))
    {
      uint64_t v10 = [NSString stringWithUTF8String:"-[OITSUColor p_isEqualToColor:withTolerance:]_block_invoke"];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:473 isFatal:0 description:"Color space dimension mismatch"];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    for (BOOL result = 1; NumberOfComponents; --NumberOfComponents)
      BOOL result = result && vabdd_f64(*Components++, *v8++) < *(double *)(a1 + 32);
  }
  return result;
}

- (BOOL)isAlmostEqualToColor:(id)a3
{
  id v4 = a3;
  [(OITSUColor *)self redComponent];
  double v6 = v5;
  [v4 redComponent];
  if (vabdd_f64(v6, v7) >= 0.00999999978
    || ([(OITSUColor *)self greenComponent],
        double v9 = v8,
        [v4 greenComponent],
        vabdd_f64(v9, v10) >= 0.00999999978)
    || ([(OITSUColor *)self blueComponent],
        double v12 = v11,
        [v4 blueComponent],
        vabdd_f64(v12, v13) >= 0.00999999978))
  {
    BOOL v17 = 0;
  }
  else
  {
    [(OITSUColor *)self alphaComponent];
    double v15 = v14;
    [v4 alphaComponent];
    BOOL v17 = vabdd_f64(v15, v16) < 0.00999999978;
  }

  return v17;
}

- (BOOL)isEqualWithTolerance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = TSUDynamicCast(v5, (uint64_t)v4);

  LOBYTE(self) = [(OITSUColor *)self p_isEqualToColor:v6 withTolerance:0.001953125];
  return (char)self;
}

- (double)p_rgbComponentWithIndex:(unsigned __int8)a3
{
  int v3 = a3;
  Components = CGColorGetComponents([(OITSUColor *)self CGColor]);
  ColorSpace = CGColorGetColorSpace([(OITSUColor *)self CGColor]);
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
  [(OITSUColor *)self p_rgbComponentWithIndex:0];
  return result;
}

- (double)greenComponent
{
  [(OITSUColor *)self p_rgbComponentWithIndex:1];
  return result;
}

- (double)blueComponent
{
  [(OITSUColor *)self p_rgbComponentWithIndex:2];
  return result;
}

- (double)alphaComponent
{
  id v2 = [(OITSUColor *)self CGColor];
  return CGColorGetAlpha(v2);
}

- (void)getRGBAComponents:(double *)a3
{
  if (a3)
  {
    [(OITSUColor *)self redComponent];
    *(void *)a3 = v5;
    [(OITSUColor *)self greenComponent];
    *((void *)a3 + 1) = v6;
    [(OITSUColor *)self blueComponent];
    *((void *)a3 + 2) = v7;
    [(OITSUColor *)self alphaComponent];
    *((void *)a3 + 3) = v8;
  }
  else
  {
    double v9 = [NSString stringWithUTF8String:"-[OITSUColor getRGBAComponents:]"];
    double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:552 isFatal:0 description:"rgbaComponents is NULL!"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (double)hueComponent
{
  uint64_t v10 = 0;
  double v11 = 0.0;
  uint64_t v9 = 0;
  [(OITSUColor *)self redComponent];
  double v4 = v3;
  [(OITSUColor *)self greenComponent];
  double v6 = v5;
  [(OITSUColor *)self blueComponent];
  TSURGBToHSB(&v11, (double *)&v10, (double *)&v9, v4, v6, v7);
  return v11;
}

- (double)saturationComponent
{
  double v10 = 0.0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  [(OITSUColor *)self redComponent];
  double v4 = v3;
  [(OITSUColor *)self greenComponent];
  double v6 = v5;
  [(OITSUColor *)self blueComponent];
  TSURGBToHSB((double *)&v11, &v10, (double *)&v9, v4, v6, v7);
  return v10;
}

- (double)brightnessComponent
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  [(OITSUColor *)self redComponent];
  double v4 = v3;
  [(OITSUColor *)self greenComponent];
  double v6 = v5;
  [(OITSUColor *)self blueComponent];
  TSURGBToHSB((double *)&v11, (double *)&v10, &v9, v4, v6, v7);
  return v9;
}

- (UIColor)UIColor
{
  id v2 = (void *)MEMORY[0x263F1C550];
  double v3 = [(OITSUColor *)self CGColor];
  return (UIColor *)[v2 colorWithCGColor:v3];
}

- (id)grayscaleColor
{
  Components = CGColorGetComponents([(OITSUColor *)self CGColor]);
  ColorSpace = CGColorGetColorSpace([(OITSUColor *)self CGColor]);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model)
  {
    if (Model == kCGColorSpaceModelRGB)
    {
      double v6 = +[OITSUColor colorWithWhite:Components[1] * 0.59 + *Components * 0.3 + Components[2] * 0.11 alpha:Components[3]];
    }
    else
    {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = self;
  }
  return v6;
}

- (id)invertedColor
{
  if (CGColorGetNumberOfComponents([(OITSUColor *)self CGColor]) != 4)
  {
    double v3 = [NSString stringWithUTF8String:"-[OITSUColor invertedColor]"];
    double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 629, 0, "Wrong number of components while inverting color. %zi instead of 4", CGColorGetNumberOfComponents([(OITSUColor *)self CGColor]));

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  Components = CGColorGetComponents([(OITSUColor *)self CGColor]);
  double v6 = 1.0 - *Components;
  double v7 = 1.0 - Components[1];
  double v8 = Components[3];
  double v9 = 1.0 - Components[2];
  return +[OITSUColor colorWithRed:v6 green:v7 blue:v9 alpha:v8];
}

- (OITSUColor)colorWithAlphaComponent:(double)a3
{
  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->mCGColor, a3);
  double v4 = +[OITSUColor colorWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);
  return (OITSUColor *)v4;
}

- (double)luminance
{
  if (CGColorGetNumberOfComponents([(OITSUColor *)self CGColor]) != 4)
  {
    double v3 = [NSString stringWithUTF8String:"-[OITSUColor luminance]"];
    double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 644, 0, "Wrong number of components to calculate luminance. %zi instead of 4", CGColorGetNumberOfComponents([(OITSUColor *)self CGColor]));

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  Components = CGColorGetComponents([(OITSUColor *)self CGColor]);
  double result = fmax(Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3], 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)isOpaque
{
  return CGColorGetAlpha([(OITSUColor *)self CGColor]) == 1.0;
}

- (BOOL)isNearlyWhite
{
  double v10 = 0.0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  [(OITSUColor *)self redComponent];
  double v4 = v3;
  [(OITSUColor *)self greenComponent];
  double v6 = v5;
  [(OITSUColor *)self blueComponent];
  TSURGBToHSB((double *)&v11, &v9, &v10, v4, v6, v7);
  return v9 < 0.05 && v10 > 0.9;
}

- (BOOL)wantsHighContrastBackgroundForDarkMode:(id)a3
{
  id v4 = a3;
  [(OITSUColor *)self luminance];
  double v6 = v5;
  [v4 luminance];
  double v8 = v7;

  return (v6 + 0.05) / (v8 + 0.05) < 1.3;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v4 = [(OITSUColor *)self newBlendedColorWithFraction:a4 ofColor:a3];
  return v4;
}

- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v6 = a4;
  double v7 = [OITSUColor alloc];
  [(OITSUColor *)self redComponent];
  double v9 = v8;
  [v6 redComponent];
  double v11 = TSUMix(v9, v10, a3);
  [(OITSUColor *)self greenComponent];
  double v13 = v12;
  [v6 greenComponent];
  double v15 = TSUMix(v13, v14, a3);
  [(OITSUColor *)self blueComponent];
  double v17 = v16;
  [v6 blueComponent];
  double v19 = TSUMix(v17, v18, a3);
  [(OITSUColor *)self alphaComponent];
  double v21 = v20;
  [v6 alphaComponent];
  double v23 = v22;

  double v24 = TSUMix(v21, v23, a3);
  return [(OITSUColor *)v7 initWithRed:v11 green:v15 blue:v19 alpha:v24];
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

- (id)hexString
{
  double v3 = NSString;
  [(OITSUColor *)self redComponent];
  uint64_t v5 = (int)(v4 * 255.0);
  [(OITSUColor *)self greenComponent];
  uint64_t v7 = (int)(v6 * 255.0);
  [(OITSUColor *)self blueComponent];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"#%02X%02X%02X", v5, v7, (int)(v8 * 255.0));
}

- (unint64_t)colorRGBSpace
{
  return self->mColorRGBSpace;
}

- ($14D77461FF5D83CAEC4252578BA76F85)ttColor
{
  [(OITSUColor *)self redComponent];
  int v4 = (int)(v3 * 255.0);
  [(OITSUColor *)self greenComponent];
  int v6 = (int)(v5 * 255.0);
  [(OITSUColor *)self blueComponent];
  int v8 = (int)(v7 * 255.0);
  [(OITSUColor *)self alphaComponent];
  return ($14D77461FF5D83CAEC4252578BA76F85)((v8 << 16) | ((int)(v9 * 255.0) << 24) | (v6 << 8) | v4);
}

- (id)newSolidColoredBitmap:(CGSize)a3
{
  return 0;
}

- (id)solidColoredPngImage
{
  return 0;
}

+ (id)colorWithBinaryRed:(int)a3 green:(int)a4 blue:(int)a5
{
  return (id)[a1 colorWithBinaryRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 alpha:1];
}

+ (id)colorWithBinaryRed:(int)a3 green:(int)a4 blue:(int)a5 alpha:(int)a6
{
  return +[OITSUColor colorWithCalibratedRed:(double)a3 / 255.0 green:(double)a4 / 255.0 blue:(double)a5 / 255.0 alpha:(double)a6 / 255.0];
}

+ (id)colorWithCalibratedWhite:(double)a3 alpha:(double)a4
{
  return +[OITSUColor colorWithWhite:a3 alpha:a4];
}

+ (id)colorWithCalibratedHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  int v6 = TSUCreateCGColorFromHSB(a3, a4, a5, a6);
  double v7 = +[OITSUColor colorWithCGColor:v6];
  CGColorRelease(v6);
  return v7;
}

+ (id)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[OITSUColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
}

+ (id)colorWithDeviceWhite:(double)a3 alpha:(double)a4
{
  return +[OITSUColor colorWithWhite:a3 alpha:a4];
}

+ (id)colorWithDeviceHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  int v6 = TSUCreateCGColorFromHSB(a3, a4, a5, a6);
  double v7 = +[OITSUColor colorWithCGColor:v6];
  CGColorRelease(v6);
  return v7;
}

+ (id)colorWithDeviceRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[OITSUColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
}

+ (id)colorWithDeviceCyan:(double)a3 magenta:(double)a4 yellow:(double)a5 black:(double)a6 alpha:(double)a7
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v11 = a3;
  double v12 = a4;
  double v13 = a5;
  double v14 = a6;
  double v15 = a7;
  double v7 = (CGColorSpace *)TSUDeviceCMYKColorSpace();
  int v8 = CGColorCreate(v7, &v11);
  double v9 = +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", v8, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14, *(void *)&v15, v16);
  CGColorRelease(v8);
  return v9;
}

+ (id)colorWithCatalogName:(id)a3 colorName:(id)a4
{
  return 0;
}

- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  if (a3)
  {
    [(OITSUColor *)self redComponent];
    *(void *)a3 = v11;
  }
  if (a4)
  {
    [(OITSUColor *)self greenComponent];
    *(void *)a4 = v12;
  }
  if (a5)
  {
    [(OITSUColor *)self blueComponent];
    *(void *)a5 = v13;
  }
  if (a6)
  {
    [(OITSUColor *)self alphaComponent];
    *(void *)a6 = v14;
  }
}

- (double)whiteComponent
{
  Components = (double *)CGColorGetComponents([(OITSUColor *)self CGColor]);
  ColorSpace = CGColorGetColorSpace([(OITSUColor *)self CGColor]);
  if (CGColorSpaceGetModel(ColorSpace)) {
    return NAN;
  }
  else {
    return *Components;
  }
}

- (void)getWhite:(double *)a3 alpha:(double *)a4
{
  if (a3)
  {
    [(OITSUColor *)self whiteComponent];
    *(void *)a3 = v7;
  }
  if (a4)
  {
    [(OITSUColor *)self alphaComponent];
    *(void *)a4 = v8;
  }
}

- (double)p_cmykComponentWithIndex:(unsigned __int8)a3
{
  int v3 = a3;
  Components = CGColorGetComponents([(OITSUColor *)self CGColor]);
  ColorSpace = CGColorGetColorSpace([(OITSUColor *)self CGColor]);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelCMYK) {
    return Components[v3];
  }
  else {
    return NAN;
  }
}

- (double)cyanComponent
{
  [(OITSUColor *)self p_cmykComponentWithIndex:0];
  return result;
}

- (double)magentaComponent
{
  [(OITSUColor *)self p_cmykComponentWithIndex:1];
  return result;
}

- (double)yellowComponent
{
  [(OITSUColor *)self p_cmykComponentWithIndex:2];
  return result;
}

- (double)blackComponent
{
  [(OITSUColor *)self p_cmykComponentWithIndex:3];
  return result;
}

- (void)getCyan:(double *)a3 magenta:(double *)a4 yellow:(double *)a5 black:(double *)a6 alpha:(double *)a7
{
  if (a3)
  {
    [(OITSUColor *)self cyanComponent];
    *(void *)a3 = v13;
  }
  if (a4)
  {
    [(OITSUColor *)self magentaComponent];
    *(void *)a4 = v14;
  }
  if (a5)
  {
    [(OITSUColor *)self yellowComponent];
    *(void *)a5 = v15;
  }
  if (a6)
  {
    [(OITSUColor *)self blackComponent];
    *(void *)a6 = v16;
  }
  if (a7)
  {
    [(OITSUColor *)self alphaComponent];
    *(void *)a7 = v17;
  }
}

- (CGColorSpace)CGColorSpace
{
  id v2 = [(OITSUColor *)self CGColor];
  return CGColorGetColorSpace(v2);
}

- (int)CGColorSpaceModel
{
  id v2 = [(OITSUColor *)self CGColorSpace];
  return CGColorSpaceGetModel(v2);
}

- (id)copy
{
  int v3 = [OITSUColor alloc];
  int v4 = [(OITSUColor *)self CGColor];
  return [(OITSUColor *)v3 initWithCGColor:v4];
}

- (unsigned)toBGR
{
  return [(OITSUColor *)self ttColor] & 0xFFFFFF;
}

+ (id)colorWithBGR:(unsigned int)a3
{
  float v3 = (double)a3 / 255.0;
  float v4 = (double)BYTE1(a3) / 255.0;
  float v5 = (double)BYTE2(a3) / 255.0;
  return +[OITSUColor colorWithCalibratedRed:v3 green:v4 blue:v5 alpha:1.0];
}

+ (id)colorWithSystemColorID:(int)a3
{
  if ((a3 - 1) > 0x23) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = dword_238EDB4F8[a3 - 1];
  }
  return (id)[a1 colorWithCalibratedRed:(double)HIWORD(v3) / 255.0 green:(double)BYTE1(v3) / 255.0 blue:(double)v3 / 255.0 alpha:1.0];
}

+ (id)stringForSystemColorID:(int)a3
{
  if (a3 > 0x25) {
    return @"unknown";
  }
  else {
    return off_264D62138[a3];
  }
}

+ (id)stringForColor:(id)a3
{
  float v4 = NSString;
  [a3 redComponent];
  uint64_t v6 = v5;
  [a3 greenComponent];
  uint64_t v8 = v7;
  [a3 blueComponent];
  uint64_t v10 = v9;
  [a3 alphaComponent];
  return (id)objc_msgSend(v4, "stringWithFormat:", @"RGB (%g %g %g %g)", v6, v8, v10, v11);
}

- (OITSUColor)colorWithTintValue:(double)a3
{
  if (!-[OITSUColor(TCColorAdditions) colorWithTintValue:]::whiteRGBColor)
  {
    -[OITSUColor(TCColorAdditions) colorWithTintValue:]::whiteRGBColor = +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    id v5 = (id)-[OITSUColor(TCColorAdditions) colorWithTintValue:]::whiteRGBColor;
  }
  return (OITSUColor *)-[OITSUColor blendedColorWithFraction:ofColor:](self, "blendedColorWithFraction:ofColor:", 1.0 - a3);
}

- (OITSUColor)colorWithShadeValue:(double)a3
{
  if (!-[OITSUColor(TCColorAdditions) colorWithShadeValue:]::blackRGBColor)
  {
    -[OITSUColor(TCColorAdditions) colorWithShadeValue:]::blackRGBColor = +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    id v5 = (id)-[OITSUColor(TCColorAdditions) colorWithShadeValue:]::blackRGBColor;
  }
  return (OITSUColor *)-[OITSUColor blendedColorWithFraction:ofColor:](self, "blendedColorWithFraction:ofColor:", 1.0 - a3);
}

- (void)set
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, [(OITSUColor *)self CGColor]);
  float v4 = [(OITSUColor *)self CGColor];
  CGContextSetStrokeColorWithColor(CurrentContext, v4);
}

+ (id)colorWithCsColour:(const CsColour *)a3
{
  LOWORD(v3) = a3->var1;
  LOWORD(v4) = a3->var2;
  LOWORD(v5) = a3->var3;
  LOWORD(v6) = a3->var0;
  return +[OITSUColor colorWithCalibratedRed:(float)((float)v3 / 255.0) green:(float)((float)v4 / 255.0) blue:(float)((float)v5 / 255.0) alpha:(float)((float)v6 / 255.0)];
}

- (CsColour)csColour
{
  unsigned int v3 = v2;
  CsColour v4 = (CsColour)[(OITSUColor *)self ttColor];
  _WORD *v3 = HIBYTE(*(_DWORD *)&v4.var0);
  v3[1] = LOBYTE(v4.var0);
  v3[2] = HIBYTE(v4.var0);
  v3[3] = LOBYTE(v4.var1);
  return v4;
}

+ (id)colorWithEshColor:(const EshColor *)a3
{
  double v4 = (float)((float)EshColor::getRed((EshColor *)a3) / 255.0);
  double v5 = (float)((float)EshColor::getGreen((EshColor *)a3) / 255.0);
  double v6 = (float)((float)EshColor::getBlue((EshColor *)a3) / 255.0);
  return +[OITSUColor colorWithCalibratedRed:v4 green:v5 blue:v6 alpha:1.0];
}

- (EshColor)eshColor
{
  unsigned int v3 = v2;
  LODWORD(v7) = 0;
  uint64_t v4 = (uint64_t)[(OITSUColor *)self ttColor];
  uint64_t v6 = EshColor::RGB::create(v4, SBYTE1(v4), SBYTE2(v4), (unsigned char *)&v7 + 4, v5);
  void *v3 = v7;
  return (EshColor)v6;
}

+ (id)colorWithRGBBytes:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5
{
  return (id)[a1 colorWithCalibratedRed:(double)a3 / 255.0 green:(double)a4 / 255.0 blue:(double)a5 / 255.0 alpha:1.0];
}

- (void)getRGBBytes:(char *)a3 green:(char *)a4 blue:(char *)a5
{
  [(OITSUColor *)self redComponent];
  *a3 = (int)(v9 * 255.0 + 0.5);
  [(OITSUColor *)self greenComponent];
  *a4 = (int)(v10 * 255.0 + 0.5);
  [(OITSUColor *)self blueComponent];
  *a5 = (int)(v11 * 255.0 + 0.5);
}

+ (id)colorWithBGRValue:(int64_t)a3
{
  float v3 = (double)BYTE2(a3) / 255.0;
  float v4 = (double)BYTE1(a3) / 255.0;
  float v5 = (double)a3 / 255.0;
  return +[OITSUColor colorWithCalibratedRed:v5 green:v4 blue:v3 alpha:1.0];
}

+ (id)colorWithRGBValue:(int64_t)a3
{
  float v3 = (double)BYTE2(a3) / 255.0;
  float v4 = (double)BYTE1(a3) / 255.0;
  float v5 = (double)a3 / 255.0;
  return +[OITSUColor colorWithCalibratedRed:v3 green:v4 blue:v5 alpha:1.0];
}

- (BOOL)isBlack
{
  [(OITSUColor *)self redComponent];
  if (v3 != 0.0) {
    return 0;
  }
  [(OITSUColor *)self greenComponent];
  if (v4 != 0.0) {
    return 0;
  }
  [(OITSUColor *)self blueComponent];
  if (v5 != 0.0) {
    return 0;
  }
  [(OITSUColor *)self alphaComponent];
  return v6 == 1.0;
}

@end