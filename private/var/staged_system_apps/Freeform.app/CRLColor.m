@interface CRLColor
+ (BOOL)supportsSecureCoding;
+ (CRLColor)blackColor;
+ (CRLColor)blueColor;
+ (CRLColor)brownColor;
+ (CRLColor)canvas_darkInsertSwatchBackgroundColor;
+ (CRLColor)canvas_darkTranslucentSwatchBackground;
+ (CRLColor)clearColor;
+ (CRLColor)colorWithCGColor:(CGColor *)a3;
+ (CRLColor)colorWithHexString:(id)a3;
+ (CRLColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
+ (CRLColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7;
+ (CRLColor)colorWithPatternImage:(id)a3;
+ (CRLColor)colorWithR:(int)a3 G:(int)a4 B:(int)a5;
+ (CRLColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (CRLColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7;
+ (CRLColor)colorWithUIColor:(id)a3;
+ (CRLColor)colorWithWhite:(double)a3 alpha:(double)a4;
+ (CRLColor)cyanColor;
+ (CRLColor)grayColor;
+ (CRLColor)greenColor;
+ (CRLColor)lightGrayColor;
+ (CRLColor)magentaColor;
+ (CRLColor)orangeColor;
+ (CRLColor)pencilTrayBlueColor;
+ (CRLColor)pencilTrayGreenColor;
+ (CRLColor)pencilTrayRedColor;
+ (CRLColor)pencilTrayYellowColor;
+ (CRLColor)purpleColor;
+ (CRLColor)randomColor;
+ (CRLColor)redColor;
+ (CRLColor)whiteColor;
+ (CRLColor)yellowColor;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)colorNamed:(id)a3 fallbackColor:(id)a4;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)improvesContrastWhenDisplayedOverAlternateBackgroundColor:(id)a3 ratherThanStandardBackgroundColor:(id)a4 inScenario:(unint64_t)a5;
- (BOOL)isAlmostEqualToColor:(id)a3;
- (BOOL)isClear;
- (BOOL)isEqualWithTolerance:(id)a3;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (BOOL)p_colorIsEqualToColor:(id)a3 inColorRGBSpace:(unint64_t)a4 withTolerance:(double)a5;
- (BOOL)p_isEqualToColor:(id)a3 withTolerance:(double)a4;
- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3;
- (CGColor)CGColor;
- (CIColor)CIColor;
- (CRLColor)colorWithAlphaComponent:(double)a3;
- (CRLColor)grayscaleColor;
- (CRLColor)initWithCGColor:(CGColor *)a3;
- (CRLColor)initWithCGColor:(CGColor *)a3 colorSpace:(unint64_t)a4;
- (CRLColor)initWithCoder:(id)a3;
- (CRLColor)initWithCyan:(double)a3 magenta:(double)a4 yellow:(double)a5 black:(double)a6 alpha:(double)a7;
- (CRLColor)initWithHexString:(id)a3;
- (CRLColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
- (CRLColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7;
- (CRLColor)initWithPatternImage:(id)a3;
- (CRLColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (CRLColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7;
- (CRLColor)initWithUIColor:(id)a3;
- (CRLColor)initWithWhite:(double)a3 alpha:(double)a4;
- (CRLColor)invertedColor;
- (NSString)hexString;
- (UIColor)UIColor;
- (double)alphaComponent;
- (double)blueComponent;
- (double)brightnessComponent;
- (double)contrastRatioWithColor:(id)a3;
- (double)greenComponent;
- (double)hueComponent;
- (double)luminance;
- (double)p_rgbComponentWithIndex:(unsigned __int8)a3;
- (double)redComponent;
- (double)relativeLuminance;
- (double)saturationComponent;
- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (id)colorByCompositingSourceOverDestinationColor:(id)a3;
- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (id)p_colorForComparingWithColor:(id)a3;
- (unint64_t)colorRGBSpace;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getRGBAComponents:(double *)a3;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation CRLColor

+ (CRLColor)canvas_darkInsertSwatchBackgroundColor
{
  return +[CRLColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
}

+ (CRLColor)canvas_darkTranslucentSwatchBackground
{
  return +[CRLColor colorWithRed:0.301960784 green:0.301960784 blue:0.301960784 alpha:1.0];
}

- (CGColor)CGColor
{
  CGColorRef v2 = CGColorRetain(self->mCGColor);

  return (CGColor *)CFAutorelease(v2);
}

+ (CRLColor)colorWithCGColor:(CGColor *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGColor:a3];

  return (CRLColor *)v3;
}

+ (CRLColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v6 = [objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];

  return (CRLColor *)v6;
}

+ (CRLColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  id v7 = [objc_alloc((Class)a1) initWithRed:a7 green:a3 blue:a4 alpha:a5 colorSpace:a6];

  return (CRLColor *)v7;
}

+ (CRLColor)colorWithR:(int)a3 G:(int)a4 B:(int)a5
{
  return (CRLColor *)[a1 colorWithRed:(double)a3 / 255.0 green:(double)a4 / 255.0 blue:(double)a5 / 255.0 alpha:1.0];
}

+ (CRLColor)colorWithWhite:(double)a3 alpha:(double)a4
{
  id v4 = [objc_alloc((Class)a1) initWithWhite:a3 alpha:a4];

  return (CRLColor *)v4;
}

+ (CRLColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  id v6 = [objc_alloc((Class)a1) initWithHue:a3 saturation:a4 brightness:a5 alpha:a6];

  return (CRLColor *)v6;
}

+ (CRLColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  id v7 = [objc_alloc((Class)a1) initWithHue:a7 saturation:a3 brightness:a4 alpha:a5 targetRGBSpace:a6];

  return (CRLColor *)v7;
}

+ (CRLColor)colorWithPatternImage:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPatternImage:v4];

  return (CRLColor *)v5;
}

+ (CRLColor)colorWithHexString:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithHexString:v4];

  return (CRLColor *)v5;
}

+ (CRLColor)colorWithUIColor:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithUIColor:v4];

  return (CRLColor *)v5;
}

+ (id)colorNamed:(id)a3 fallbackColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UIColor colorNamed:v5];
  if (v7)
  {
    id v8 = +[CRLColor colorWithUIColor:v7];
  }
  else
  {
    id v8 = v6;
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F24A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5E58((uint64_t)v5, v9);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F24C0);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLColor colorNamed:fallbackColor:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11, v12, 113, 0, "Catalog color (named %@) is missing.", v5 file lineNumber isFatal description];
  }

  return v8;
}

+ (CRLColor)randomColor
{
  CGColorRef v2 = sub_10000FEE4();
  id v3 = +[CRLColor colorWithCGColor:v2];
  CGColorRelease(v2);

  return (CRLColor *)v3;
}

+ (CRLColor)clearColor
{
  id v2 = [objc_alloc((Class)a1) initWithWhite:0.0 alpha:0.0];

  return (CRLColor *)v2;
}

+ (CRLColor)blackColor
{
  id v2 = [objc_alloc((Class)a1) initWithWhite:0.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)whiteColor
{
  id v2 = [objc_alloc((Class)a1) initWithWhite:1.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)grayColor
{
  id v2 = [objc_alloc((Class)a1) initWithWhite:0.5 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)lightGrayColor
{
  id v2 = [objc_alloc((Class)a1) initWithWhite:0.667 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)redColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)greenColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)blueColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)cyanColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)yellowColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)magentaColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)orangeColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)purpleColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];

  return (CRLColor *)v2;
}

+ (CRLColor)brownColor
{
  id v2 = [objc_alloc((Class)a1) initWithRed:0.6 green:0.4 blue:0.2 alpha:1.0];

  return (CRLColor *)v2;
}

- (CRLColor)initWithCGColor:(CGColor *)a3 colorSpace:(unint64_t)a4
{
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F24E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A619C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2500);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]");
    int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 190, 0, "invalid nil value for '%{public}s'", "CGColor");
  }
  v51.receiver = self;
  v51.super_class = (Class)CRLColor;
  v10 = [(CRLColor *)&v51 init];
  if (v10)
  {
    if (CGColorGetPattern(a3))
    {
      if (a4 != 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F2620);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A6114();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F2640);
        }
        v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v11);
        }
        v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]");
        v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 261, 0, "If the color has a pattern, its color space should be Unspecified");
LABEL_23:
      }
LABEL_74:
      Copy = CGColorCreateCopy(a3);
      goto LABEL_75;
    }
    ColorSpace = CGColorGetColorSpace(a3);
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    if (a4)
    {
      if (a4 != 2)
      {
        if (a4 != 1) {
          goto LABEL_74;
        }
        if (Model != kCGColorSpaceModelRGB)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F2520);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A5F7C();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F2540);
          }
          v16 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v16);
          }
          v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]");
          v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
          +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:212 isFatal:0 description:"Color specified as P3 isn't even RGB!"];
        }
        CGColorSpaceRef v19 = CGColorGetColorSpace(a3);
        v20 = (const void *)sub_10000FD54();
        if (!CFEqual(v19, v20))
        {
          v21 = (const void *)sub_10000FDD8();
          if (!CFEqual(v19, v21))
          {
            v22 = (const void *)sub_10000FC28();
            if (!CFEqual(v19, v22))
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F2560);
              }
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_1010A5EF4();
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F2580);
              }
              v23 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10106590C(v23);
              }
              v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]");
              v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 217, 0, "Color specified as P3 isn't P3, sRGB or Device RGB");
              a4 = 1;
              goto LABEL_23;
            }
          }
        }
        goto LABEL_73;
      }
      CGColorSpaceRef v31 = CGColorGetColorSpace(a3);
      v32 = (const void *)sub_10000FD54();
      if (!CFEqual(v31, v32))
      {
        v33 = (const void *)sub_10000FDD8();
        if (!CFEqual(v31, v33))
        {
          v48 = CGColorGetColorSpace(a3);
          if (CGColorSpaceGetModel(v48) == kCGColorSpaceModelRGB && CGColorSpaceIsWideGamutRGB(v48))
          {
            a4 = 1;
            v49 = (CGColorSpace *)sub_10000FDD8();
          }
          else
          {
            v49 = (CGColorSpace *)sub_10000FD54();
            a4 = 0;
          }
          Copy = CGColorCreateCopyByMatchingToColorSpace(v49, kCGRenderingIntentDefault, a3, 0);
          if (Copy)
          {
LABEL_75:
            v10->mCGColor = Copy;
            v10->mColorRGBSpace = a4;
            if (!CGColorGetPattern(Copy))
            {
              Components = CGColorGetComponents(v10->mCGColor);
              size_t NumberOfComponents = CGColorGetNumberOfComponents(v10->mCGColor);
              uint64_t v38 = __chkstk_darwin(NumberOfComponents, v37);
              unint64_t v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
              v41 = (const CGFloat *)((char *)&v50 - v40);
              if (v38)
              {
                v42 = (double *)((char *)&v50 - v40);
                do
                {
                  double v43 = *Components++;
                  float v44 = v43;
                  *v42++ = v44;
                  --v38;
                }
                while (v38);
              }
              v45 = CGColorGetColorSpace(v10->mCGColor);
              CGColorRef v46 = CGColorCreate(v45, v41);
              CGColorRelease(v10->mCGColor);
              v10->mCGColor = v46;
            }
            return v10;
          }
          goto LABEL_74;
        }
LABEL_73:
        a4 = 1;
        goto LABEL_74;
      }
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F25A0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A608C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F25C0);
        }
        v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v24);
        }
        v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]");
        v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
        +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:223 isFatal:0 description:"Color specified as sRGB isn't even RGB!"];
      }
      CGColorSpaceRef v27 = CGColorGetColorSpace(a3);
      v28 = (const void *)sub_10000FD54();
      if (!CFEqual(v27, v28))
      {
        v29 = (const void *)sub_10000FC28();
        if (!CFEqual(v27, v29))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F25E0);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A6004();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F2600);
          }
          v30 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v30);
          }
          v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]");
          v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
          +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:227 isFatal:0 description:"Color specified as sRGB isn't sRGB or Device RGB"];
          a4 = 0;
          goto LABEL_23;
        }
      }
    }
    a4 = 0;
    goto LABEL_74;
  }
  return v10;
}

- (CRLColor)initWithCGColor:(CGColor *)a3
{
  return [(CRLColor *)self initWithCGColor:a3 colorSpace:2];
}

- (CRLColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return [(CRLColor *)self initWithRed:2 green:a3 blue:a4 alpha:a5 colorSpace:a6];
}

- (CRLColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  if (!a7 || a7 == 2)
  {
    v13 = (CGColorSpace *)sub_10000FD54();
  }
  else if (a7 == 1)
  {
    v13 = (CGColorSpace *)sub_10000FDD8();
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
  v15 = [(CRLColor *)self initWithCGColor:v14 colorSpace:a7];
  CGColorRelease(v14);
  return v15;
}

- (CRLColor)initWithWhite:(double)a3 alpha:(double)a4
{
  return [(CRLColor *)self initWithRed:a3 green:a3 blue:a3 alpha:a4];
}

- (CRLColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return [(CRLColor *)self initWithHue:2 saturation:a3 brightness:a4 alpha:a5 targetRGBSpace:a6];
}

- (CRLColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  if (a7)
  {
    if (a7 == 1) {
      v12 = (CGColorSpace *)sub_10000FDD8();
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = (CGColorSpace *)sub_10000FD54();
  }
  v13 = sub_1000102C4(v12, a3, a4, a5, a6);
  v14 = [(CRLColor *)self initWithCGColor:v13];
  CGColorRelease(v13);
  return v14;
}

- (CRLColor)initWithCyan:(double)a3 magenta:(double)a4 yellow:(double)a5 black:(double)a6 alpha:(double)a7
{
  double v12 = a3;
  double v13 = a4;
  double v14 = a5;
  double v15 = a6;
  double v16 = a7;
  id v8 = (CGColorSpace *)sub_10000FC8C();
  int v9 = CGColorCreate(v8, &v12);
  v10 = -[CRLColor initWithCGColor:](self, "initWithCGColor:", v9, *(void *)&v12, *(void *)&v13, *(void *)&v14, *(void *)&v15, *(void *)&v16);
  CGColorRelease(v9);
  return v10;
}

- (CRLColor)initWithPatternImage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    memset(&v15, 0, sizeof(v15));
    [v4 scale];
    CGFloat v7 = 1.0 / v6;
    [v5 scale];
    CGAffineTransformMakeScale(&v15, v7, 1.0 / v8);
    int v9 = sub_10001022C((CGImage *)[v5 CGImage], (long long *)&v15);
    v10 = [(CRLColor *)self initWithCGColor:v9];
    CGColorRelease(v9);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2660);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6234();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2680);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithPatternImage:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 366, 0, "invalid nil value for '%{public}s'", "patternImage");

    v10 = 0;
  }

  return v10;
}

- (CRLColor)initWithHexString:(id)a3
{
  id v4 = [a3 uppercaseString];
  if ([v4 rangeOfString:@"#[\\dA-F]{6}" options:1024] || v5 != objc_msgSend(v4, "length"))
  {
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F26A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A62CC((uint64_t)v4, v13);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F26C0);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    CGAffineTransform v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithHexString:]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15, v16, 384, 0, "Invalid hex string: %@", v4 file lineNumber isFatal description];

    double v12 = 0;
  }
  else
  {
    double v6 = [v4 substringWithRange:1, 2];
    CGFloat v7 = sub_10037A8A8((uint64_t)v6, v6);

    double v8 = [v4 substringWithRange:3, 2];
    int v9 = sub_10037A8A8((uint64_t)v8, v8);

    v10 = [v4 substringWithRange:5, 2];
    v11 = sub_10037A8A8((uint64_t)v10, v10);

    double v12 = [(CRLColor *)self initWithRed:(float)((float)(unint64_t)v7 / 255.0) green:(float)((float)(unint64_t)v9 / 255.0) blue:(float)((float)(unint64_t)v11 / 255.0) alpha:1.0];
  }

  return v12;
}

- (CRLColor)initWithUIColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F26E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6368();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2700);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithUIColor:]");
    CGFloat v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 403, 0, "invalid nil value for '%{public}s'", "uiColor");
  }
  id v8 = v4;
  int v9 = (CGColor *)[v8 CGColor];
  if (CGColorGetPattern(v9))
  {
    v10 = [(CRLColor *)self initWithCGColor:v9];
  }
  else
  {
    v11 = (CGColorSpace *)sub_10000FDD8();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v11, kCGRenderingIntentDefault, v9, 0);
    int v13 = (CGColorSpace *)sub_10000FD54();
    double v14 = CGColorCreateCopyByMatchingToColorSpace(v13, kCGRenderingIntentDefault, CopyByMatchingToColorSpace, 0);
    CGAffineTransform v15 = (CGColorSpace *)sub_10000FDD8();
    double v16 = CGColorCreateCopyByMatchingToColorSpace(v15, kCGRenderingIntentDefault, v14, 0);
    v17 = +[CRLColor colorWithCGColor:CopyByMatchingToColorSpace];
    v18 = +[CRLColor colorWithCGColor:v16];
    if ([v17 isEqualWithTolerance:v18]) {
      CGColorSpaceRef v19 = v14;
    }
    else {
      CGColorSpaceRef v19 = CopyByMatchingToColorSpace;
    }
    v20 = [(CRLColor *)self initWithCGColor:v19];
    CGColorRelease(CopyByMatchingToColorSpace);
    CGColorRelease(v14);
    CGColorRelease(v16);
    v10 = v20;
  }
  return v10;
}

- (void)dealloc
{
  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)CRLColor;
  [(CRLColor *)&v3 dealloc];
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)isAlmostEqualToColor:(id)a3
{
  return [(CRLColor *)self p_isEqualToColor:a3 withTolerance:0.00999999978];
}

- (BOOL)isEqualWithTolerance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, v4);

  LOBYTE(self) = [(CRLColor *)self p_isEqualToColor:v6 withTolerance:0.001953125];
  return (char)self;
}

- (double)redComponent
{
  [(CRLColor *)self p_rgbComponentWithIndex:0];
  return result;
}

- (double)greenComponent
{
  [(CRLColor *)self p_rgbComponentWithIndex:1];
  return result;
}

- (double)blueComponent
{
  [(CRLColor *)self p_rgbComponentWithIndex:2];
  return result;
}

- (double)alphaComponent
{
  id v2 = [(CRLColor *)self CGColor];

  return CGColorGetAlpha(v2);
}

- (void)getRGBAComponents:(double *)a3
{
  if (a3)
  {
    [(CRLColor *)self redComponent];
    *(void *)a3 = v5;
    [(CRLColor *)self greenComponent];
    *((void *)a3 + 1) = v6;
    [(CRLColor *)self blueComponent];
    *((void *)a3 + 2) = v7;
    [(CRLColor *)self alphaComponent];
    *((void *)a3 + 3) = v8;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2720);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6400();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2740);
    }
    int v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor getRGBAComponents:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:507 isFatal:0 description:"rgbaComponents is NULL!"];
  }
}

- (double)hueComponent
{
  uint64_t v10 = 0;
  double v11 = 0.0;
  uint64_t v9 = 0;
  [(CRLColor *)self redComponent];
  double v4 = v3;
  [(CRLColor *)self greenComponent];
  double v6 = v5;
  [(CRLColor *)self blueComponent];
  sub_100010450(&v11, (double *)&v10, (double *)&v9, v4, v6, v7);
  return v11;
}

- (double)saturationComponent
{
  double v10 = 0.0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  [(CRLColor *)self redComponent];
  double v4 = v3;
  [(CRLColor *)self greenComponent];
  double v6 = v5;
  [(CRLColor *)self blueComponent];
  sub_100010450((double *)&v11, &v10, (double *)&v9, v4, v6, v7);
  return v10;
}

- (double)brightnessComponent
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  [(CRLColor *)self redComponent];
  double v4 = v3;
  [(CRLColor *)self greenComponent];
  double v6 = v5;
  [(CRLColor *)self blueComponent];
  sub_100010450((double *)&v11, (double *)&v10, &v9, v4, v6, v7);
  return v9;
}

- (UIColor)UIColor
{
  id v2 = [(CRLColor *)self CGColor];

  return +[UIColor colorWithCGColor:v2];
}

- (CIColor)CIColor
{
  id v3 = objc_alloc((Class)CIColor);
  double v4 = [(CRLColor *)self UIColor];
  id v5 = [v3 initWithColor:v4];

  return (CIColor *)v5;
}

- (CRLColor)grayscaleColor
{
  Components = CGColorGetComponents([(CRLColor *)self CGColor]);
  ColorSpace = CGColorGetColorSpace([(CRLColor *)self CGColor]);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model)
  {
    if (Model == kCGColorSpaceModelRGB)
    {
      double v6 = +[CRLColor colorWithWhite:Components[1] * 0.59 + *Components * 0.3 + Components[2] * 0.11 alpha:Components[3]];
      if (v6) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    double v6 = self;
    if (v6) {
      goto LABEL_15;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2760);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A6488();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2780);
  }
  double v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v7);
  }
  uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor grayscaleColor]");
  double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 578, 0, "invalid nil value for '%{public}s'", "grayscale");

  double v6 = 0;
LABEL_15:

  return v6;
}

- (CRLColor)invertedColor
{
  if (CGColorGetNumberOfComponents([(CRLColor *)self CGColor]) != 4)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F27A0);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6520(v4, self, v3);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F27C0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor invertedColor]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 583, 0, "Wrong number of components while inverting color. %zi instead of 4", CGColorGetNumberOfComponents([(CRLColor *)self CGColor]));
  }
  Components = CGColorGetComponents([(CRLColor *)self CGColor]);
  double v9 = +[CRLColor colorWithRed:1.0 - *Components green:1.0 - Components[1] blue:1.0 - Components[2] alpha:Components[3]];

  return (CRLColor *)v9;
}

- (CRLColor)colorWithAlphaComponent:(double)a3
{
  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->mCGColor, a3);
  double v4 = +[CRLColor colorWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);

  return (CRLColor *)v4;
}

- (double)luminance
{
  if (CGColorGetNumberOfComponents([(CRLColor *)self CGColor]) != 4)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F27E0);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A65EC(v4, self, v3);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2800);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor luminance]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 598, 0, "Wrong number of components to calculate luminance. Got %zi instead of 4.", CGColorGetNumberOfComponents([(CRLColor *)self CGColor]));
  }
  Components = CGColorGetComponents([(CRLColor *)self CGColor]);
  double result = fmax(Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3], 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (double)relativeLuminance
{
  if (CGColorGetNumberOfComponents([(CRLColor *)self CGColor]) != 4)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2820);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A66B8(v4, self, v3);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2840);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor relativeLuminance]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 608, 0, "Wrong number of components to calculate relative luminance. Got %zi instead of 4.", CGColorGetNumberOfComponents([(CRLColor *)self CGColor]));
  }
  Components = CGColorGetComponents([(CRLColor *)self CGColor]);
  double v9 = *Components;
  double v10 = Components[1];
  double v11 = Components[2];
  if (*Components <= 0.03928) {
    double v12 = v9 / 12.92;
  }
  else {
    double v12 = pow((v9 + 0.055) / 1.055, 2.4);
  }
  if (v10 <= 0.03928) {
    double v13 = v10 / 12.92;
  }
  else {
    double v13 = pow((v10 + 0.055) / 1.055, 2.4);
  }
  if (v11 <= 0.03928) {
    double v14 = v11 / 12.92;
  }
  else {
    double v14 = pow((v11 + 0.055) / 1.055, 2.4);
  }
  return v13 * 0.7152 + v12 * 0.2126 + v14 * 0.0722;
}

- (BOOL)isOpaque
{
  return CGColorGetAlpha([(CRLColor *)self CGColor]) == 1.0;
}

- (BOOL)isClear
{
  return CGColorGetAlpha([(CRLColor *)self CGColor]) == 0.0;
}

- (BOOL)isNearlyWhite
{
  double v10 = 0.0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  [(CRLColor *)self redComponent];
  double v4 = v3;
  [(CRLColor *)self greenComponent];
  double v6 = v5;
  [(CRLColor *)self blueComponent];
  sub_100010450((double *)&v11, &v9, &v10, v4, v6, v7);
  return v9 < 0.1 && v10 > 0.9;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  double v14 = 0.0;
  uint64_t v15 = 0;
  double v13 = 0.0;
  [(CRLColor *)self redComponent];
  double v6 = v5;
  [(CRLColor *)self greenComponent];
  double v8 = v7;
  [(CRLColor *)self blueComponent];
  double v10 = sub_100010450((double *)&v15, &v13, &v14, v6, v8, v9);
  switch(a3)
  {
    case 1uLL:
      return v13 < 0.200000003 && v14 > 0.899999976;
    case 3uLL:
      return sub_1000107FC([(CRLColor *)self CGColor]) <= 0.300000012;
    case 2uLL:
      double v11 = sub_1000107FC([(CRLColor *)self CGColor]);
      return v11 <= 0.349999994 && v11 >= 0.0500000007;
    default:
      return 0;
  }
}

- (double)contrastRatioWithColor:(id)a3
{
  id v4 = a3;
  [(CRLColor *)self relativeLuminance];
  double v6 = v5;
  [v4 relativeLuminance];
  double v8 = v7;

  if (v8 >= v6) {
    double v9 = v8;
  }
  else {
    double v9 = v6;
  }
  if (v8 >= v6) {
    double v10 = v6;
  }
  else {
    double v10 = v8;
  }
  return (v9 + 0.05) / (v10 + 0.05);
}

- (BOOL)improvesContrastWhenDisplayedOverAlternateBackgroundColor:(id)a3 ratherThanStandardBackgroundColor:(id)a4 inScenario:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 >= 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2860);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6784();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2880);
    }
    double v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor improvesContrastWhenDisplayedOverAlternateBackgroundColor:ratherThanStandardBackgroundColor:inScenario:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 708, 0, "Unhandled contrast scenario (%zu).", a5);

    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    double v10 = dbl_1011780D8[a5];
    double v11 = dbl_1011780F8[a5];
  }
  uint64_t v15 = [(CRLColor *)self colorByCompositingSourceOverDestinationColor:v9];
  [v15 contrastRatioWithColor:v9];
  if (v16 >= v10)
  {
    unsigned __int8 v22 = 0;
  }
  else
  {
    double v17 = v16;
    v18 = [(CRLColor *)self colorByCompositingSourceOverDestinationColor:v8];
    [v18 contrastRatioWithColor:v8];
    if (v19 <= v17)
    {
      unsigned __int8 v22 = 0;
    }
    else if (v19 >= v11)
    {
      unsigned __int8 v22 = 1;
    }
    else
    {
      v20 = [(CRLColor *)self colorWithAlphaComponent:1.0];
      v21 = [v9 colorWithAlphaComponent:1.0];
      unsigned __int8 v22 = [v20 isAlmostEqualToColor:v21];
    }
  }

  return v22;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v4 = [(CRLColor *)self newBlendedColorWithFraction:a4 ofColor:a3];

  return v4;
}

- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (self->mColorRGBSpace == 2) {
    goto LABEL_2;
  }
  if ([v6 colorRGBSpace] == (id)2)
  {
    id v8 = v7;
    goto LABEL_18;
  }
  id mColorRGBSpace = self->mColorRGBSpace;
  if (mColorRGBSpace == [v7 colorRGBSpace])
  {
    unint64_t v10 = self->mColorRGBSpace;
    if (v10 == 1)
    {
      v56 = [CRLColor alloc];
      [(CRLColor *)self redComponent];
      double v58 = v57;
      [v7 redComponent];
      double v60 = sub_100407E68(v58, v59, a3);
      [(CRLColor *)self greenComponent];
      double v62 = v61;
      [v7 greenComponent];
      double v64 = sub_100407E68(v62, v63, a3);
      [(CRLColor *)self blueComponent];
      double v66 = v65;
      [v7 blueComponent];
      double v68 = sub_100407E68(v66, v67, a3);
      [(CRLColor *)self alphaComponent];
      double v70 = v69;
      [v7 alphaComponent];
      double v27 = sub_100407E68(v70, v71, a3);
      v28 = v56;
      double v29 = v60;
      double v30 = v64;
      double v31 = v68;
      uint64_t v32 = 1;
    }
    else
    {
      if (v10)
      {
LABEL_2:
        id v8 = self;
LABEL_18:
        v55 = v8;
        goto LABEL_19;
      }
      double v11 = [CRLColor alloc];
      [(CRLColor *)self redComponent];
      double v13 = v12;
      [v7 redComponent];
      double v15 = sub_100407E68(v13, v14, a3);
      [(CRLColor *)self greenComponent];
      double v17 = v16;
      [v7 greenComponent];
      double v19 = sub_100407E68(v17, v18, a3);
      [(CRLColor *)self blueComponent];
      double v21 = v20;
      [v7 blueComponent];
      double v23 = sub_100407E68(v21, v22, a3);
      [(CRLColor *)self alphaComponent];
      double v25 = v24;
      [v7 alphaComponent];
      double v27 = sub_100407E68(v25, v26, a3);
      v28 = v11;
      double v29 = v15;
      double v30 = v19;
      double v31 = v23;
      uint64_t v32 = 0;
    }
    id v8 = [(CRLColor *)v28 initWithRed:v32 green:v29 blue:v30 alpha:v31 colorSpace:v27];
    goto LABEL_18;
  }
  if ((id)[(CRLColor *)self colorRGBSpace] == (id)1)
  {
    v33 = self;
  }
  else
  {
    v34 = (CGColorSpace *)sub_10000FDD8();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v34, kCGRenderingIntentDefault, [(CRLColor *)self CGColor], 0);
    v33 = [[CRLColor alloc] initWithCGColor:CopyByMatchingToColorSpace colorSpace:1];
    CGColorRelease(CopyByMatchingToColorSpace);
  }
  if ([v7 colorRGBSpace] == (id)1)
  {
    v36 = v7;
  }
  else
  {
    uint64_t v37 = (CGColorSpace *)sub_10000FDD8();
    uint64_t v38 = CGColorCreateCopyByMatchingToColorSpace(v37, kCGRenderingIntentDefault, (CGColorRef)[v7 CGColor], 0);
    v36 = [[CRLColor alloc] initWithCGColor:v38 colorSpace:1];
    CGColorRelease(v38);
  }
  uint64_t v39 = [CRLColor alloc];
  [(CRLColor *)v33 redComponent];
  double v41 = v40;
  [(CRLColor *)v36 redComponent];
  double v43 = sub_100407E68(v41, v42, a3);
  [(CRLColor *)v33 greenComponent];
  double v45 = v44;
  [(CRLColor *)v36 greenComponent];
  double v47 = sub_100407E68(v45, v46, a3);
  [(CRLColor *)v33 blueComponent];
  double v49 = v48;
  [(CRLColor *)v36 blueComponent];
  double v51 = sub_100407E68(v49, v50, a3);
  [(CRLColor *)v33 alphaComponent];
  double v53 = v52;
  [(CRLColor *)v36 alphaComponent];
  v55 = [(CRLColor *)v39 initWithRed:1 green:v43 blue:v47 alpha:v51 colorSpace:sub_100407E68(v53, v54, a3)];

LABEL_19:
  return v55;
}

- (id)colorByCompositingSourceOverDestinationColor:(id)a3
{
  id v4 = a3;
  [(CRLColor *)self alphaComponent];
  if (v5 == 1.0)
  {
    id v6 = self;
  }
  else
  {
    double v7 = [(CRLColor *)self p_colorForComparingWithColor:v4];
    id v8 = [v4 p_colorForComparingWithColor:self];

    [v7 getRGBAComponents:v17];
    [v8 getRGBAComponents:v15];
    double v9 = v18;
    double v10 = v16;
    double v11 = 1.0 - v18;
    double v12 = v18 + v16 * (1.0 - v18);
    double v13 = [CRLColor alloc];
    id v6 = -[CRLColor initWithRed:green:blue:alpha:colorSpace:](v13, "initWithRed:green:blue:alpha:colorSpace:", [v7 colorRGBSpace], (v11 * (v10 * v15[0]) + v17[0] * v9) / v12, (v11 * (v10 * v15[1]) + v17[1] * v9) / v12, (v11 * (v10 * v15[2]) + v17[2] * v9) / v12, v12);

    id v4 = v8;
  }

  return v6;
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

- (NSString)hexString
{
  [(CRLColor *)self redComponent];
  uint64_t v4 = (int)(v3 * 255.0);
  [(CRLColor *)self greenComponent];
  uint64_t v6 = (int)(v5 * 255.0);
  [(CRLColor *)self blueComponent];
  return +[NSString stringWithFormat:@"#%02X%02X%02X", v4, v6, (int)(v7 * 255.0)];
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)+[UIColor readableTypeIdentifiersForItemProvider];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  double v5 = +[UIColor objectWithItemProviderData:a3 typeIdentifier:a4 error:a5];
  if (v5)
  {
    id v6 = v5;
    if (CGColorGetPattern((CGColorRef)[v6 CGColor]))
    {
      uint64_t v7 = +[UIColor blackColor];

      id v6 = (id)v7;
    }
    id v8 = +[CRLColor colorWithUIColor:v6];
  }
  else
  {
    id v6 = 0;
    id v8 = 0;
  }

  return v8;
}

- (BOOL)p_isEqualToColor:(id)a3 withTolerance:(double)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6
    && (id mColorRGBSpace = self->mColorRGBSpace, mColorRGBSpace == [v6 colorRGBSpace])
    && [v7 CGColor])
  {
    double v9 = [(CRLColor *)self CGColor];
    double v10 = (CGColor *)[v7 CGColor];
    if (v9 == v10)
    {
      char v19 = 1;
    }
    else
    {
      CGRect v11 = v10;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10037CAEC;
      v21[3] = &unk_1014F28E0;
      *(double *)&v21[4] = a4;
      double v12 = objc_retainBlock(v21);
      ColorSpace = CGColorGetColorSpace(v9);
      CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
      double v15 = CGColorGetColorSpace(v11);
      if (Model != CGColorSpaceGetModel(v15))
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F2900);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A6824();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F2920);
        }
        double v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v16);
        }
        double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor p_isEqualToColor:withTolerance:]");
        double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"];
        +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:956 isFatal:0 description:"CRLColors should always be RGB! Comparing two with different color models."];
      }
      if (CFEqual(ColorSpace, v15)) {
        char v19 = ((uint64_t (*)(void *, CGColor *, CGColor *))v12[2])(v12, v9, v11);
      }
      else {
        char v19 = 0;
      }
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (double)p_rgbComponentWithIndex:(unsigned __int8)a3
{
  int v3 = a3;
  Components = CGColorGetComponents([(CRLColor *)self CGColor]);
  ColorSpace = CGColorGetColorSpace([(CRLColor *)self CGColor]);
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

- (id)p_colorForComparingWithColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRLColor *)self colorRGBSpace];
  id v6 = [v4 colorRGBSpace];

  uint64_t v7 = self;
  if (!v5 && v6 == (id)1)
  {
    id v8 = (CGColorSpace *)sub_10000FDD8();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v8, kCGRenderingIntentDefault, v7->mCGColor, 0);
    double v10 = [[CRLColor alloc] initWithCGColor:CopyByMatchingToColorSpace colorSpace:1];

    CGColorRelease(CopyByMatchingToColorSpace);
    uint64_t v7 = v10;
  }

  return v7;
}

- (BOOL)p_colorIsEqualToColor:(id)a3 inColorRGBSpace:(unint64_t)a4 withTolerance:(double)a5
{
  id v8 = a3;
  double v9 = self;
  double v10 = (CGColorSpace *)sub_10037D088(a4);
  if ([(CRLColor *)v9 colorRGBSpace] != a4)
  {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, v9->mCGColor, 0);
    double v12 = [[CRLColor alloc] initWithCGColor:CopyByMatchingToColorSpace colorSpace:a4];

    CGColorRelease(CopyByMatchingToColorSpace);
    double v9 = v12;
  }
  double v13 = (CRLColor *)v8;
  double v14 = v13;
  if ([(CRLColor *)v13 colorRGBSpace] != a4)
  {
    double v15 = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, [(CRLColor *)v13 CGColor], 0);
    double v14 = [[CRLColor alloc] initWithCGColor:v15 colorSpace:a4];

    CGColorRelease(v15);
  }
  unsigned __int8 v16 = [(CRLColor *)v9 p_isEqualToColor:v14 withTolerance:a5];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (CGColorGetPattern([(CRLColor *)self CGColor])) {
    +[UIColor blackColor];
  }
  else {
  id v5 = [(CRLColor *)self UIColor];
  }
  [v4 encodeObject:v5 forKey:@"UIColor"];
}

- (CRLColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIColor"];

  id v6 = [(CRLColor *)self initWithUIColor:v5];
  return v6;
}

- (unint64_t)colorRGBSpace
{
  return self->mColorRGBSpace;
}

+ (CRLColor)pencilTrayBlueColor
{
  return (CRLColor *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_101670178, (void **)&static CRLColor.pencilTrayBlue);
}

+ (CRLColor)pencilTrayGreenColor
{
  return (CRLColor *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_101670180, (void **)&static CRLColor.pencilTrayGreen);
}

+ (CRLColor)pencilTrayYellowColor
{
  return (CRLColor *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_101670188, (void **)&static CRLColor.pencilTrayYellow);
}

+ (CRLColor)pencilTrayRedColor
{
  return (CRLColor *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_101670190, (void **)&static CRLColor.pencilTrayRed);
}

@end