@interface CRLColorFill
+ (CRLColorFill)blackColor;
+ (CRLColorFill)blueColor;
+ (CRLColorFill)brownColor;
+ (CRLColorFill)clearColor;
+ (CRLColorFill)cyanColor;
+ (CRLColorFill)grayColor;
+ (CRLColorFill)greenColor;
+ (CRLColorFill)magentaColor;
+ (CRLColorFill)orangeColor;
+ (CRLColorFill)purpleColor;
+ (CRLColorFill)randomColor;
+ (CRLColorFill)redColor;
+ (CRLColorFill)whiteColor;
+ (CRLColorFill)yellowColor;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)colorWithCGColor:(CGColor *)a3;
+ (id)colorWithColor:(id)a3;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithUIColor:(id)a3;
+ (id)colorWithWhite:(double)a3 alpha:(double)a4;
+ (id)keyPathsForValuesAffectingBrightness;
+ (id)keyPathsForValuesAffectingCGColor;
+ (id)keyPathsForValuesAffectingHue;
+ (id)keyPathsForValuesAffectingLuminance;
+ (id)keyPathsForValuesAffectingOpacity;
+ (id)keyPathsForValuesAffectingSaturation;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)canApplyToRenderable;
- (BOOL)drawsInOneStep;
- (BOOL)isClear;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3;
- (CGColor)CGColor;
- (CRLColor)color;
- (CRLColorFill)initWithCGColor:(CGColor *)a3;
- (CRLColorFill)initWithColor:(id)a3;
- (CRLColorFill)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (CRLColorFill)initWithUIColor:(id)a3;
- (CRLColorFill)initWithWhite:(double)a3 alpha:(double)a4;
- (UIColor)UIColor;
- (double)brightness;
- (double)hue;
- (double)luminance;
- (double)opacity;
- (double)p_hsbComponentWithIndex:(unint64_t)a3;
- (double)saturation;
- (id)grayscaleColor;
- (id)invertedColor;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)fillType;
- (unint64_t)hash;
- (void)applyToRenderable:(id)a3 withScale:(double)a4;
- (void)i_setColor:(id)a3;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation CRLColorFill

+ (id)colorWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithColor:v4];

  return v5;
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGColor:a3];

  return v3;
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v6 = [objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];

  return v6;
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  id v4 = [objc_alloc((Class)a1) initWithWhite:a3 alpha:a4];

  return v4;
}

+ (id)colorWithUIColor:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithUIColor:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CRLMutableColorFill alloc];
  id v5 = [(CRLColorFill *)self color];
  id v6 = [(CRLColorFill *)v4 initWithColor:v5];

  return v6;
}

+ (CRLColorFill)randomColor
{
  v2 = sub_10000FEE4();
  id v3 = +[CRLColorFill colorWithCGColor:v2];
  CGColorRelease(v2);

  return (CRLColorFill *)v3;
}

+ (CRLColorFill)clearColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor clearColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)blackColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor blackColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)whiteColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor whiteColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)grayColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor grayColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)redColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor redColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)greenColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor greenColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)blueColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor blueColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)cyanColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor cyanColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)yellowColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor yellowColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)magentaColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor magentaColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)orangeColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor orangeColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)purpleColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor purpleColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (CRLColorFill)brownColor
{
  v2 = [CRLColorFill alloc];
  id v3 = +[CRLColor brownColor];
  id v4 = [(CRLColorFill *)v2 initWithColor:v3];

  return v4;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return +[CRLColor readableTypeIdentifiersForItemProvider];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = +[CRLColor objectWithItemProviderData:a3 typeIdentifier:a4 error:a5];
  if (v6) {
    id v7 = [objc_alloc((Class)a1) initWithColor:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (CRLColorFill)initWithColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBEB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B98C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBED0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColorFill initWithColor:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLColorFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:145 isFatal:0 description:"invalid nil value for color"];
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLColorFill;
  v8 = [(CRLColorFill *)&v12 init];
  if (v8)
  {
    v9 = (CRLColor *)[v4 copy];
    color = v8->_color;
    v8->_color = v9;
  }
  return v8;
}

- (CRLColorFill)initWithCGColor:(CGColor *)a3
{
  id v4 = +[CRLColor colorWithCGColor:a3];
  id v5 = [(CRLColorFill *)self initWithColor:v4];

  return v5;
}

- (CRLColorFill)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v7 = +[CRLColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
  v8 = [(CRLColorFill *)self initWithColor:v7];

  return v8;
}

- (CRLColorFill)initWithWhite:(double)a3 alpha:(double)a4
{
  id v5 = +[CRLColor colorWithWhite:a3 alpha:a4];
  id v6 = [(CRLColorFill *)self initWithColor:v5];

  return v6;
}

- (CRLColorFill)initWithUIColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBEF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BA20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBF10);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColorFill initWithUIColor:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLColorFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 170, 0, "invalid nil value for '%{public}s'", "uiColor");
  }
  v8 = +[CRLColor colorWithUIColor:v4];
  v9 = [(CRLColorFill *)self initWithColor:v8];

  return v9;
}

- (void)i_setColor:(id)a3
{
  id v4 = (CRLColor *)[a3 copy];
  color = self->_color;
  self->_color = v4;
}

- (unint64_t)hash
{
  return [(CRLColor *)self->_color hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLColorFill *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = sub_1002469D0(v5, v4);
    if (v6)
    {
      id v7 = (void *)v6;
      v8 = [(CRLColorFill *)self color];
      v9 = [v7 color];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (UIColor)UIColor
{
  v2 = [(CRLColorFill *)self color];
  id v3 = [v2 UIColor];

  return (UIColor *)v3;
}

- (id)grayscaleColor
{
  v2 = [(CRLColorFill *)self color];
  id v3 = [v2 grayscaleColor];
  id v4 = +[CRLColorFill colorWithColor:v3];

  return v4;
}

- (id)invertedColor
{
  v2 = [(CRLColorFill *)self color];
  id v3 = [v2 invertedColor];
  id v4 = +[CRLColorFill colorWithColor:v3];

  return v4;
}

- (BOOL)isOpaque
{
  [(CRLColorFill *)self opacity];
  return v2 == 1.0;
}

- (BOOL)isClear
{
  [(CRLColorFill *)self opacity];
  return v2 == 0.0;
}

- (BOOL)isNearlyWhite
{
  double v2 = [(CRLColorFill *)self color];
  unsigned __int8 v3 = [v2 isNearlyWhite];

  return v3;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  id v4 = [(CRLColorFill *)self color];
  LOBYTE(a3) = [v4 requiresOutlineOnBackgroundWithAppearance:a3];

  return a3;
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
  id v9 = [(CRLColorFill *)self color];
  [v9 paintRect:a4 inContext:x, y, width, height];
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  id v6 = [(CRLColorFill *)self color];
  [v6 paintPath:a3 inContext:a4];
}

- (BOOL)canApplyToRenderable
{
  return 1;
}

- (void)applyToRenderable:(id)a3 withScale:(double)a4
{
  id v5 = a3;
  if (![(CRLColorFill *)self canApplyToRenderable])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBF30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BAD0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBF50);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColorFill applyToRenderable:withScale:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLColorFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:259 isFatal:0 description:"Applying color fill with unsupported properties to CRLCanvasRenderable"];
  }
  [v5 setContents:0];
  unsigned __int8 v9 = [(CRLColorFill *)self isClear];
  unsigned __int8 v10 = 0;
  if ((v9 & 1) == 0) {
    unsigned __int8 v10 = [(CRLColorFill *)self CGColor];
  }
  [v5 setBackgroundColor:v10];
}

- (int64_t)fillType
{
  return 0;
}

- (double)p_hsbComponentWithIndex:(unint64_t)a3
{
  id v4 = [(CRLColorFill *)self color];
  id v5 = [v4 UIColor];
  [v5 getHue:&v7 saturation:(char *)&v7 + 8 brightness:&v8 alpha:(char *)&v8 + 8];

  return *((double *)&v7 + a3);
}

- (CGColor)CGColor
{
  double v2 = [(CRLColorFill *)self color];
  unsigned __int8 v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (double)opacity
{
  double v2 = [(CRLColorFill *)self color];
  [v2 alphaComponent];
  double v4 = v3;

  return v4;
}

- (double)luminance
{
  Components = CGColorGetComponents([(CRLColorFill *)self CGColor]);
  double result = fmax(Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3], 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (double)hue
{
  [(CRLColorFill *)self p_hsbComponentWithIndex:0];
  return result;
}

- (double)saturation
{
  [(CRLColorFill *)self p_hsbComponentWithIndex:1];
  return result;
}

- (double)brightness
{
  [(CRLColorFill *)self p_hsbComponentWithIndex:2];
  return result;
}

+ (id)keyPathsForValuesAffectingCGColor
{
  return +[NSSet setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingOpacity
{
  return +[NSSet setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingLuminance
{
  return +[NSSet setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingHue
{
  return +[NSSet setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingSaturation
{
  return +[NSSet setWithObject:@"color"];
}

+ (id)keyPathsForValuesAffectingBrightness
{
  return +[NSSet setWithObject:@"color"];
}

- (CRLColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end