@interface CRLScalarPathSource
+ (id)chevronWithScalar:(double)a3 naturalSize:(CGSize)a4;
+ (id)pathSourceWithType:(unint64_t)a3 scalar:(double)a4 naturalSize:(CGSize)a5;
+ (id)rectangleWithNaturalSize:(CGSize)a3;
+ (id)regularPolygonWithScalar:(double)a3 naturalSize:(CGSize)a4;
+ (id)roundedRectangleWithScalar:(double)a3 naturalSize:(CGSize)a4 continuousCurve:(BOOL)a5;
+ (unint64_t)crlaxMaximumAllowedPolygonPointsDuringAdjustment;
- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3;
- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3;
- (BOOL)isCircular;
- (BOOL)isCurveContinuous;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (BOOL)shouldShowKnob;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPath)p_newChevronPath;
- (CGPath)p_newRegularPolygonPath;
- (CGPath)p_newRoundedRectPath;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)p_getControlKnobPointForChevron;
- (CGPoint)p_getControlKnobPointForRegularPolygon;
- (CGPoint)p_getControlKnobPointForRoundedRect;
- (CGSize)naturalSize;
- (CRLScalarPathSource)init;
- (CRLScalarPathSource)initWithType:(unint64_t)a3 scalar:(double)a4 naturalSize:(CGSize)a5 continuousCurve:(BOOL)a6;
- (double)cornerRadius;
- (double)maxCornerRadius;
- (double)maxScalar;
- (double)scalar;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3;
- (id)crlaxValueForKnobTag:(unint64_t)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (id)inferredAccessibilityDescription;
- (id)inferredAccessibilityDescriptionNoShapeNames;
- (id)inferredLocalizedAccessibilityDescriptionPlaceholder;
- (id)name;
- (unint64_t)hash;
- (unint64_t)numberOfControlKnobs;
- (unint64_t)numberOfSides;
- (unint64_t)type;
- (void)p_setControlKnobPointForChevron:(CGPoint)a3;
- (void)p_setControlKnobPointForRegularPolygon:(CGPoint)a3;
- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setIsCurveContinuous:(BOOL)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setScalar:(double)a3;
- (void)setScalarValue:(id)a3;
- (void)setShouldShowKnob:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation CRLScalarPathSource

+ (id)rectangleWithNaturalSize:(CGSize)a3
{
  return +[CRLScalarPathSource roundedRectangleWithScalar:naturalSize:continuousCurve:](CRLScalarPathSource, "roundedRectangleWithScalar:naturalSize:continuousCurve:", 0, 0.0, a3.width, a3.height);
}

+ (id)roundedRectangleWithScalar:(double)a3 naturalSize:(CGSize)a4 continuousCurve:(BOOL)a5
{
  v5 = -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", 0, a5, a3, a4.width, a4.height);

  return v5;
}

+ (id)regularPolygonWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  v4 = -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", 1, 0, a3, a4.width, a4.height);

  return v4;
}

+ (id)chevronWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  v4 = -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", 2, 0, a3, a4.width, a4.height);

  return v4;
}

+ (id)pathSourceWithType:(unint64_t)a3 scalar:(double)a4 naturalSize:(CGSize)a5
{
  v5 = -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:]([CRLScalarPathSource alloc], "initWithType:scalar:naturalSize:continuousCurve:", a3, 0, a4, a5.width, a5.height);

  return v5;
}

- (CRLScalarPathSource)initWithType:(unint64_t)a3 scalar:(double)a4 naturalSize:(CGSize)a5 continuousCurve:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)CRLScalarPathSource;
  v11 = [(CRLScalarPathSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CRLScalarPathSource *)v11 setType:a3];
    [(CRLScalarPathSource *)v12 setScalar:a4];
    -[CRLScalarPathSource setNaturalSize:](v12, "setNaturalSize:", width, height);
    [(CRLScalarPathSource *)v12 setIsCurveContinuous:v6];
    [(CRLScalarPathSource *)v12 setShouldShowKnob:1];
  }
  return v12;
}

- (CRLScalarPathSource)init
{
  return -[CRLScalarPathSource initWithType:scalar:naturalSize:continuousCurve:](self, "initWithType:scalar:naturalSize:continuousCurve:", 0, 0, 5.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLScalarPathSource;
  id v4 = [(CRLPathSource *)&v6 copyWithZone:a3];
  [v4 setType:[self type]];
  [(CRLScalarPathSource *)self scalar];
  [v4 setScalar:];
  [(CRLScalarPathSource *)self naturalSize];
  [v4 setNaturalSize:];
  [v4 setIsCurveContinuous:[self isCurveContinuous]];
  [v4 setShouldShowKnob:[self shouldShowKnob]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLScalarPathSource *)a3;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)CRLScalarPathSource;
    if ([(CRLPathSource *)&v21 isEqual:v4])
    {
      v5 = (objc_class *)objc_opt_class();
      objc_super v6 = sub_10024715C(v5, v4);
      id v7 = [(CRLScalarPathSource *)self type];
      if (v7 != [v6 type]) {
        goto LABEL_8;
      }
      [(CRLScalarPathSource *)self scalar];
      double v9 = v8;
      [v6 scalar];
      if (v9 != v10 && vabdd_f64(v9, v10) >= 0.00999999978) {
        goto LABEL_8;
      }
      [(CRLScalarPathSource *)self naturalSize];
      double v12 = v11;
      double v14 = v13;
      [v6 naturalSize];
      if (sub_100064084(v12, v14, v15, v16)
        && (unsigned int v17 = [(CRLScalarPathSource *)self isCurveContinuous],
            v17 == [v6 isCurveContinuous]))
      {
        unsigned int v20 = [(CRLScalarPathSource *)self shouldShowKnob];
        unsigned int v18 = v20 ^ [v6 shouldShowKnob] ^ 1;
      }
      else
      {
LABEL_8:
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)CRLScalarPathSource;
  v3 = [(CRLScalarPathSource *)&v12 description];
  id v4 = [v3 mutableCopy];

  unint64_t v5 = [(CRLScalarPathSource *)self type];
  [(CRLScalarPathSource *)self scalar];
  uint64_t v7 = v6;
  [(CRLScalarPathSource *)self naturalSize];
  double v8 = NSStringFromCGSize(v14);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; type=%lu; scalar=%f; natural size=%@; continuous curve=%d",
    v5,
    v7,
    v8,
  double v9 = [(CRLScalarPathSource *)self isCurveContinuous]);
  [v4 appendString:v9];

  if (![(CRLScalarPathSource *)self shouldShowKnob])
  {
    double v10 = +[NSString stringWithFormat:@" shouldShowKnob=%d", [(CRLScalarPathSource *)self shouldShowKnob]];
    [v4 appendString:v10];
  }

  return v4;
}

- (void)setIsCurveContinuous:(BOOL)a3
{
  if (a3)
  {
    if (![(CRLScalarPathSource *)self type])
    {
      BOOL v7 = 1;
      goto LABEL_13;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2980);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A69E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F29A0);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource setIsCurveContinuous:]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:137 isFatal:0 description:"Trying to make a non-rounded-rectangle path continuously curve"];
  }
  BOOL v7 = 0;
LABEL_13:
  self->mIsCurveContinuous = v7;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(CRLScalarPathSource *)self type])
  {
    -[CRLPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    self->mScalar = v6 * self->mScalar;
  }
  self->mNaturalSize.double width = width;
  self->mNaturalSize.double height = height;
}

- (void)setScalarValue:(id)a3
{
  [a3 floatValue];
  double v5 = v4;

  [(CRLScalarPathSource *)self setScalar:v5];
}

- (double)maxScalar
{
  unint64_t v3 = [(CRLScalarPathSource *)self type];
  if (v3 == 2)
  {
    [(CRLScalarPathSource *)self naturalSize];
    return v10 / v11;
  }
  else if (v3 == 1)
  {
    return 100.0;
  }
  else
  {
    double result = 0.0;
    if (!v3)
    {
      [(CRLScalarPathSource *)self naturalSize];
      double v6 = v5;
      double y = CGPointZero.y;
      double v9 = sub_1000653B4(CGPointZero.x, y, 0.0, v8) * 0.5;
      double result = sub_1000653B4(CGPointZero.x, y, v6, 0.0) * 0.5;
      if (v9 < result) {
        return v9;
      }
    }
  }
  return result;
}

- (double)cornerRadius
{
  if ([(CRLScalarPathSource *)self type])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F29C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6A68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F29E0);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource cornerRadius]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:191 isFatal:0 description:"called cornerRadius on wrong type pathSource"];
  }
  [(CRLScalarPathSource *)self scalar];
  double v7 = v6;
  [(CRLScalarPathSource *)self maxCornerRadius];
  return sub_100407E48(v7, 0.0, v8);
}

- (double)maxCornerRadius
{
  if ([(CRLScalarPathSource *)self type])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2A00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6AF0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2A20);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource maxCornerRadius]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:197 isFatal:0 description:"called cornerRadius on wrong type pathSource"];
  }
  [(CRLScalarPathSource *)self maxScalar];
  return result;
}

- (unint64_t)numberOfSides
{
  if ((id)[(CRLScalarPathSource *)self type] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2A40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6B78();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2A60);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource numberOfSides]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:202 isFatal:0 description:"called numberOfSides on wrong type pathSource"];
  }
  [(CRLScalarPathSource *)self scalar];
  return (unint64_t)v6;
}

- (unint64_t)numberOfControlKnobs
{
  return [(CRLScalarPathSource *)self shouldShowKnob];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  unint64_t v4 = [(CRLScalarPathSource *)self type];
  if (v4 == 2)
  {
    [(CRLScalarPathSource *)self p_getControlKnobPointForChevron];
  }
  else if (v4 == 1)
  {
    [(CRLScalarPathSource *)self p_getControlKnobPointForRegularPolygon];
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    if (!v4) {
      [(CRLScalarPathSource *)self p_getControlKnobPointForRoundedRect];
    }
  }
  result.double y = v5;
  result.x = v6;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unint64_t v7 = [(CRLScalarPathSource *)self type];
  switch(v7)
  {
    case 2uLL:
      -[CRLScalarPathSource p_setControlKnobPointForChevron:](self, "p_setControlKnobPointForChevron:", x, y);
      break;
    case 1uLL:
      -[CRLScalarPathSource p_setControlKnobPointForRegularPolygon:](self, "p_setControlKnobPointForRegularPolygon:", x, y);
      break;
    case 0uLL:
      -[CRLScalarPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", x, y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  unint64_t v4 = [(CRLScalarPathSource *)self type];
  switch(v4)
  {
    case 2uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2A80);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A6C00();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2AA0);
      }
      double v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource getFeedbackStringForKnob:]");
      double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:262 isFatal:0 description:"Need to provide feedback string for chevron!"];

      double v11 = &stru_101538650;
      break;
    case 1uLL:
      double v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"Sides: %d";
      goto LABEL_15;
    case 0uLL:
      double v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"Radius: %d pt";
LABEL_15:
      objc_super v12 = [v5 localizedStringForKey:v7 value:0 table:0];
      [(CRLScalarPathSource *)self scalar];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, (int)v13);
      double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      double v11 = 0;
      break;
  }

  return v11;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  if ((id)[(CRLScalarPathSource *)self type] != (id)1) {
    return 0;
  }
  unint64_t v4 = [(CRLPathSource *)self bezierPath];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  Mutable = CGPathCreateMutable();
  [(CRLScalarPathSource *)self naturalSize];
  CGFloat v11 = -(v6 - v10 * 0.15);
  [(CRLScalarPathSource *)self naturalSize];
  CGFloat v13 = -(v8 - v12 * 0.15);
  [(CRLScalarPathSource *)self naturalSize];
  CGFloat v15 = v14 * 0.7;
  [(CRLScalarPathSource *)self naturalSize];
  v18.size.double height = v16 * 0.7;
  v18.origin.double x = v11;
  v18.origin.double y = v13;
  v18.size.double width = v15;
  CGPathAddEllipseInRect(Mutable, 0, v18);
  return Mutable;
}

- (id)bezierPathWithoutFlips
{
  unint64_t v3 = [(CRLScalarPathSource *)self type];
  switch(v3)
  {
    case 2uLL:
      unint64_t v4 = [(CRLScalarPathSource *)self p_newChevronPath];
      goto LABEL_7;
    case 1uLL:
      unint64_t v4 = [(CRLScalarPathSource *)self p_newRegularPolygonPath];
      goto LABEL_7;
    case 0uLL:
      unint64_t v4 = [(CRLScalarPathSource *)self p_newRoundedRectPath];
LABEL_7:
      double v5 = v4;
      goto LABEL_9;
  }
  double v5 = 0;
LABEL_9:
  double v6 = +[CRLBezierPath bezierPathWithCGPath:v5];
  CGPathRelease(v5);

  return v6;
}

- (BOOL)isRectangular
{
  if ([(CRLScalarPathSource *)self type]) {
    return 0;
  }
  [(CRLScalarPathSource *)self scalar];
  return v4 == 0.0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)name
{
  unint64_t v2 = [(CRLScalarPathSource *)self type];
  switch(v2)
  {
    case 2uLL:
      unint64_t v3 = +[NSBundle mainBundle];
      double v4 = v3;
      CFStringRef v5 = @"Chevron";
      goto LABEL_7;
    case 1uLL:
      unint64_t v3 = +[NSBundle mainBundle];
      double v4 = v3;
      CFStringRef v5 = @"Polygon";
      goto LABEL_7;
    case 0uLL:
      unint64_t v3 = +[NSBundle mainBundle];
      double v4 = v3;
      CFStringRef v5 = @"Rounded Rectangle";
LABEL_7:
      double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

      goto LABEL_9;
  }
  double v6 = 0;
LABEL_9:

  return v6;
}

+ (unint64_t)crlaxMaximumAllowedPolygonPointsDuringAdjustment
{
  return 11;
}

- (CGPath)p_newRoundedRectPath
{
  [(CRLScalarPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  double y = CGPointZero.y;
  [(CRLScalarPathSource *)self scalar];
  double v9 = v8;
  double v10 = sub_1000653B4(CGPointZero.x, y, 0.0, v6) * 0.5;
  double v11 = sub_1000653B4(CGPointZero.x, y, v4, 0.0) * 0.5;
  if (v10 < v11) {
    double v11 = v10;
  }
  if (v9 >= v11) {
    double v12 = v11;
  }
  else {
    double v12 = v9;
  }
  double v13 = sub_100064070();
  +[CRLBezierPath bezierPathWithRoundedRect:upperRightRadius:lowerRightRadius:lowerLeftRadius:upperLeftRadius:useLegacyCorners:keepNoOpElements:](CRLBezierPath, "bezierPathWithRoundedRect:upperRightRadius:lowerRightRadius:lowerLeftRadius:upperLeftRadius:useLegacyCorners:keepNoOpElements:", [(CRLScalarPathSource *)self isCurveContinuous] ^ 1, 0, v13, v14, v15, v16, v12, v12, v12, v12);
  id v17 = objc_claimAutoreleasedReturnValue();
  CGRect v18 = CGPathRetain((CGPathRef)[v17 CGPath]);

  return v18;
}

- (CGPath)p_newRegularPolygonPath
{
  Mutable = CGPathCreateMutable();
  [(CRLScalarPathSource *)self scalar];
  double v5 = fmax(v4, 3.0);
  [(CRLScalarPathSource *)self naturalSize];
  double v7 = v6 * 0.5;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v8 / v6);
  CGAffineTransform v11 = m;
  CGAffineTransformTranslate(&v12, &v11, v7, v7);
  CGAffineTransform m = v12;
  v12.a = 0.0;
  v12.b = 0.0;
  if ((unint64_t)v5)
  {
    unint64_t v9 = 0;
    do
    {
      sub_100066270(&v12.a, v7, 6.28318531 / (double)(unint64_t)v5 * (double)v9 + -1.57079633);
      if (v9) {
        CGPathAddLineToPoint(Mutable, &m, v12.a, v12.b);
      }
      else {
        CGPathMoveToPoint(Mutable, &m, v12.a, v12.b);
      }
      ++v9;
    }
    while ((unint64_t)v5 != v9);
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newChevronPath
{
  Mutable = CGPathCreateMutable();
  [(CRLScalarPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  [(CRLScalarPathSource *)self scalar];
  double v9 = sub_100407E48(v7 * v8, 0.0, v5);
  if (v9 == 0.0)
  {
    v14.origin.double x = sub_100064070();
    CGPathAddRect(Mutable, 0, v14);
  }
  else
  {
    CGFloat v10 = v9;
    CGFloat y = CGPointZero.y;
    CGFloat v12 = v5 - v9;
    CGPathMoveToPoint(Mutable, 0, CGPointZero.x, y);
    CGPathAddLineToPoint(Mutable, 0, v12, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v5, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, v12, v7);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v7);
    CGPathAddLineToPoint(Mutable, 0, v10, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, CGPointZero.x, y);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  double x = a3.x;
  [(CRLScalarPathSource *)self naturalSize];
  double v6 = v5;
  double y = CGPointZero.y;
  double v9 = sub_1000653B4(CGPointZero.x, y, 0.0, v8) * 0.5;
  double v10 = sub_1000653B4(CGPointZero.x, y, v6, 0.0) * 0.5;
  if (v9 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  double v12 = sub_100407E48(x, 0.0, v11);

  [(CRLScalarPathSource *)self setScalar:v12];
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  [(CRLScalarPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  double y = CGPointZero.y;
  [(CRLScalarPathSource *)self scalar];
  double v9 = v8;
  double v10 = sub_1000653B4(CGPointZero.x, y, 0.0, v6) * 0.5;
  double v11 = sub_1000653B4(CGPointZero.x, y, v4, 0.0) * 0.5;
  if (v10 >= v11) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  double v13 = sub_100407E48(v9, 0.0, v12);
  double v14 = 0.0;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)p_setControlKnobPointForRegularPolygon:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLScalarPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  if ([(CRLPathSource *)self hasVerticalFlip]) {
    double v10 = v9 - y;
  }
  else {
    double v10 = y;
  }
  double v11 = x - v7 * 0.5;
  double v12 = v7 / v9 * (v10 - v9 * 0.5);
  double v13 = -v11;
  double v14 = sub_100065398(v11, v12);
  double v15 = acos(v13 / v14);
  if (v12 > 0.0) {
    double v15 = 6.28318531 - v15;
  }
  double v16 = v15 / 6.28318531 + -0.25;
  if (v16 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = v16 + 1.0;
  }
  unint64_t v18 = +[CRLScalarPathSource crlaxMaximumAllowedPolygonPointsDuringAdjustment];
  double v19 = v17 * 9.0 + 3.5;
  if (v18 >= (unint64_t)v19) {
    unint64_t v20 = (unint64_t)v19;
  }
  else {
    unint64_t v20 = 3;
  }
  [(CRLScalarPathSource *)self scalar];
  if ((int)v21 != 3 || v20 == 4)
  {
    [(CRLScalarPathSource *)self scalar];
    if ((int)v22 != v18 || v20 == v18 - 1)
    {
      [(CRLScalarPathSource *)self setScalar:(double)v20];
    }
  }
}

- (CGPoint)p_getControlKnobPointForRegularPolygon
{
  [(CRLScalarPathSource *)self scalar];
  unint64_t v4 = (unint64_t)fmax(v3, 3.0);
  [(CRLScalarPathSource *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = v5 * 0.5;
  double v13 = 0.0;
  double v14 = 0.0;
  sub_100066270(&v13, v5 * 0.5 * 0.7, ((float)((float)(v4 - 3) / 9.0) + -0.25) * 6.28318531);
  double v13 = v9 + v13;
  double v14 = v8 * 0.5 + v8 / v6 * v14;
  unsigned int v10 = [(CRLPathSource *)self hasVerticalFlip];
  double v11 = v13;
  double v12 = v14;
  if (v10) {
    double v12 = v8 - v14;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)p_setControlKnobPointForChevron:(CGPoint)a3
{
  double x = a3.x;
  [(CRLScalarPathSource *)self naturalSize];
  double v7 = sub_100407E48(x, 0.0, v5) / v6;

  [(CRLScalarPathSource *)self setScalar:v7];
}

- (CGPoint)p_getControlKnobPointForChevron
{
  [(CRLScalarPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  [(CRLScalarPathSource *)self scalar];
  double v8 = sub_100407E48(v7 * v6, 0.0, v4);
  double v9 = v6 * 0.5;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  double v3 = [(CRLPathSource *)self userDefinedName];
  if (![v3 length])
  {
    uint64_t v4 = [(CRLScalarPathSource *)self inferredAccessibilityDescription];

    double v3 = (void *)v4;
  }

  return v3;
}

- (id)inferredAccessibilityDescription
{
  unint64_t v3 = [(CRLScalarPathSource *)self type];
  [(CRLScalarPathSource *)self scalar];
  unint64_t v5 = llround(v4);
  if (v3 == 1)
  {
    switch(v5)
    {
      case 3uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Triangle";
        goto LABEL_9;
      case 4uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Diamond";
        goto LABEL_9;
      case 5uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Pentagon";
        goto LABEL_9;
      case 6uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Hexagon";
        goto LABEL_9;
      case 7uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Heptagon";
        goto LABEL_9;
      case 8uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Octagon";
        goto LABEL_9;
      case 9uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Nonagon";
        goto LABEL_9;
      case 0xAuLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Decagon";
        goto LABEL_9;
      case 0xBuLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Hendecagon";
        goto LABEL_9;
      case 0xCuLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Dodecagon";
        goto LABEL_9;
      default:
        double v7 = +[NSBundle mainBundle];
        double v11 = [v7 localizedStringForKey:@"%@ sided polygon" value:0 table:0];
        double v12 = +[NSNumber numberWithUnsignedInteger:v5];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
        double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }
  else
  {
    if (v3)
    {
      double v9 = &stru_101538650;
      goto LABEL_11;
    }
    double v6 = +[NSBundle mainBundle];
    double v7 = v6;
    if (v5) {
      CFStringRef v8 = @"Rounded rectangle";
    }
    else {
      CFStringRef v8 = @"Square";
    }
LABEL_9:
    double v9 = [v6 localizedStringForKey:v8 value:0 table:0];
  }

LABEL_11:

  return v9;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  unint64_t v3 = [(CRLScalarPathSource *)self type];
  [(CRLScalarPathSource *)self scalar];
  unint64_t v5 = llround(v4);
  if (v3 == 1)
  {
    switch(v5)
    {
      case 3uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected triangle.";
        goto LABEL_9;
      case 4uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected diamond.";
        goto LABEL_9;
      case 5uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected pentagon.";
        goto LABEL_9;
      case 6uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected hexagon.";
        goto LABEL_9;
      case 7uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected heptagon.";
        goto LABEL_9;
      case 8uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected octagon.";
        goto LABEL_9;
      case 9uLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected nonagon.";
        goto LABEL_9;
      case 0xAuLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected decagon.";
        goto LABEL_9;
      case 0xBuLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected hendecagon.";
        goto LABEL_9;
      case 0xCuLL:
        double v6 = +[NSBundle mainBundle];
        double v7 = v6;
        CFStringRef v8 = @"Describe the selected dodecagon.";
        goto LABEL_9;
      default:
        double v7 = +[NSBundle mainBundle];
        double v11 = [v7 localizedStringForKey:@"Describe the selected %@ sided polygon." value:0 table:0];
        double v12 = +[NSNumber numberWithUnsignedInteger:v5];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
        double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }
  else
  {
    if (v3)
    {
      double v9 = &stru_101538650;
      goto LABEL_11;
    }
    double v6 = +[NSBundle mainBundle];
    double v7 = v6;
    if (v5) {
      CFStringRef v8 = @"Describe the selected rounded rectangle.";
    }
    else {
      CFStringRef v8 = @"Describe the selected square.";
    }
LABEL_9:
    double v9 = [v6 localizedStringForKey:v8 value:0 table:0];
  }

LABEL_11:

  return v9;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  unint64_t v3 = [(CRLScalarPathSource *)self type];
  switch(v3)
  {
    case 2uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2AC0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A6C88();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2AE0);
      }
      double v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      CFStringRef v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource crlaxLabelComponentForKnobTag:]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:641 isFatal:0 description:"Need to provide axLabel component string for chevron!"];

      unsigned int v10 = &stru_101538650;
      break;
    case 1uLL:
      double v4 = +[NSBundle mainBundle];
      unint64_t v5 = v4;
      CFStringRef v6 = @"Sides";
      goto LABEL_15;
    case 0uLL:
      double v4 = +[NSBundle mainBundle];
      unint64_t v5 = v4;
      CFStringRef v6 = @"Radius";
LABEL_15:
      double v11 = [v4 localizedStringForKey:v6 value:0 table:0];
      unsigned int v10 = +[NSString localizedStringWithFormat:v11];

      break;
    default:
      unsigned int v10 = 0;
      break;
  }

  return v10;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  unint64_t v4 = [(CRLScalarPathSource *)self type];
  if (v4 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2B00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6D10();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2B20);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    unsigned int v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScalarPathSource crlaxValueForKnobTag:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLScalarPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:660 isFatal:0 description:"Need to provide axValue string for chevron!"];

    CFStringRef v8 = &stru_101538650;
  }
  else if (v4 == 1)
  {
    [(CRLScalarPathSource *)self scalar];
    CFStringRef v8 = +[NSString stringWithFormat:@"%d", (int)v12];
  }
  else if (v4)
  {
    CFStringRef v8 = 0;
  }
  else
  {
    unint64_t v5 = +[NSBundle mainBundle];
    CFStringRef v6 = [v5 localizedStringForKey:@"%d points" value:0 table:0];
    [(CRLScalarPathSource *)self scalar];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, (int)v7);
    CFStringRef v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return [(CRLScalarPathSource *)self type] < 2;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  return 0;
}

- (unint64_t)type
{
  return self->mType;
}

- (void)setType:(unint64_t)a3
{
  self->mType = a3;
}

- (double)scalar
{
  return self->mScalar;
}

- (void)setScalar:(double)a3
{
  self->mScalar = a3;
}

- (CGSize)naturalSize
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

- (BOOL)isCurveContinuous
{
  return self->mIsCurveContinuous;
}

- (BOOL)shouldShowKnob
{
  return self->mShouldShowKnob;
}

- (void)setShouldShowKnob:(BOOL)a3
{
  self->mShouldShowKnob = a3;
}

@end