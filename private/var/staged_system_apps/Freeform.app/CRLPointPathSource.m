@interface CRLPointPathSource
+ (id)doubleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)leftSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)p_percentageNumberFormatter;
+ (id)pathSourceWithType:(unint64_t)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5;
+ (id)plusWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)rightSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)starWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3;
- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (BOOL)p_isArrowType;
- (BOOL)p_isFlippedDoubleArrow;
- (BOOL)p_isRightFacingArrow;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPath)p_newArrowPath;
- (CGPath)p_newPlusPath;
- (CGPath)p_newStarPath;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)maxPointValue;
- (CGPoint)minPointValue;
- (CGPoint)p_getControlKnobPointForArrow;
- (CGPoint)p_getControlKnobPointForPlus;
- (CGPoint)p_getControlKnobPointForStarInnerRadius;
- (CGPoint)p_getControlKnobPointForStarPoints;
- (CGPoint)point;
- (CGSize)naturalSize;
- (CRLPointPathSource)init;
- (CRLPointPathSource)initWithType:(unint64_t)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5;
- (double)arrowHead;
- (double)arrowIndent;
- (double)maxArrowHead;
- (double)maxArrowIndent;
- (double)maxStarRadius;
- (double)minArrowIndent;
- (double)minStarRadius;
- (double)starRadius;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3;
- (id)crlaxUserInputLabelForKnobTag:(unint64_t)a3;
- (id)crlaxValueForKnobTag:(unint64_t)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (id)inferredAccessibilityDescription;
- (id)inferredAccessibilityDescriptionNoShapeNames;
- (id)inferredLocalizedAccessibilityDescriptionPlaceholder;
- (id)name;
- (id)p_innerRadiusLocalizedPercent;
- (unint64_t)hash;
- (unint64_t)maxStarPoints;
- (unint64_t)minStarPoints;
- (unint64_t)numberOfControlKnobs;
- (unint64_t)starPoints;
- (unint64_t)type;
- (void)p_setControlKnobPointForArrow:(CGPoint)a3;
- (void)p_setControlKnobPointForPlus:(CGPoint)a3;
- (void)p_setControlKnobPointForStarInnerRadius:(CGPoint)a3;
- (void)p_setControlKnobPointForStarPoints:(CGPoint)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setNaturalSize:(CGSize)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation CRLPointPathSource

+ (id)rightSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return _objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 1, a3.x, a3.y, a4.width, a4.height);
}

+ (id)leftSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return [a1 pathSourceWithType:0 point:a3.x, a3.y, naturalSize:a4.width, a4.height];
}

+ (id)doubleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return [a1 pathSourceWithType:10 point:a3.x naturalSize:a3.y width:a4.width height:a4.height];
}

+ (id)starWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return [a1 pathSourceWithType:100 point:a3.x naturalSize:a3.y];
}

+ (id)plusWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return [a1 pathSourceWithType:200 point:a3.x naturalSize:a3.y width:a4.width height:a4.height];
}

+ (id)pathSourceWithType:(unint64_t)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  id v5 = [objc_alloc((Class)a1) initWithType:a3 point:a4.x naturalSize:a5.width, a5.height];

  return v5;
}

+ (id)p_percentageNumberFormatter
{
  if (qword_1016A95E0 != -1) {
    dispatch_once(&qword_1016A95E0, &stru_1014EB3A0);
  }
  v2 = (void *)qword_1016A95E8;

  return v2;
}

- (CRLPointPathSource)initWithType:(unint64_t)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLPointPathSource;
  v10 = [(CRLPointPathSource *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CRLPointPathSource *)v10 setType:a3];
    -[CRLPointPathSource setPoint:](v11, "setPoint:", x, y);
    -[CRLPointPathSource setNaturalSize:](v11, "setNaturalSize:", width, height);
  }
  return v11;
}

- (CRLPointPathSource)init
{
  return -[CRLPointPathSource initWithType:point:naturalSize:](self, "initWithType:point:naturalSize:", 0, 25.0, 25.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLPointPathSource;
  id v4 = [(CRLPathSource *)&v6 copyWithZone:a3];
  [v4 setType:[self type]];
  [(CRLPointPathSource *)self point];
  [v4 setPoint:];
  [(CRLPointPathSource *)self naturalSize];
  [v4 setNaturalSize:];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLPointPathSource *)a3;
  if (v4 == self)
  {
    BOOL v20 = 1;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CRLPointPathSource;
    if ([(CRLPathSource *)&v22 isEqual:v4])
    {
      uint64_t v5 = objc_opt_class();
      objc_super v6 = sub_1002469D0(v5, v4);
      id v7 = [(CRLPointPathSource *)self type];
      if (v7 == [v6 type]
        && ([(CRLPointPathSource *)self point],
            double v9 = v8,
            double v11 = v10,
            [v6 point],
            sub_100064084(v9, v11, v12, v13)))
      {
        [(CRLPointPathSource *)self naturalSize];
        double v15 = v14;
        double v17 = v16;
        [v6 naturalSize];
        BOOL v20 = sub_100064084(v15, v17, v18, v19);
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
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
  v10.receiver = self;
  v10.super_class = (Class)CRLPointPathSource;
  v3 = [(CRLPointPathSource *)&v10 description];
  id v4 = [v3 mutableCopy];

  unint64_t v5 = [(CRLPointPathSource *)self type];
  [(CRLPointPathSource *)self point];
  objc_super v6 = NSStringFromCGPoint(v12);
  [(CRLPointPathSource *)self naturalSize];
  id v7 = NSStringFromCGSize(v13);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; type=%lu; point=%@; natural size=%@",
    v5,
    v6,
  double v8 = v7);
  [v4 appendString:v8];

  return v4;
}

- (CGPoint)minPointValue
{
  double y = CGPointZero.y;
  unint64_t v3 = [(CRLPointPathSource *)self type];
  if (v3 == 100) {
    double v4 = 0.1;
  }
  else {
    double v4 = y;
  }
  double x = 3.0;
  if (v3 != 100) {
    double x = CGPointZero.x;
  }
  result.double y = v4;
  result.double x = x;
  return result;
}

- (CGPoint)maxPointValue
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  uint64_t v5 = [(CRLPointPathSource *)self type];
  if (v5 > 99)
  {
    if (v5 == 100)
    {
      double y = 1.0;
      double x = 100.0;
    }
    else if (v5 == 200)
    {
      [(CRLPointPathSource *)self naturalSize];
      double x = v7 * 0.5;
      double y = v8 * 0.5;
    }
  }
  else if ((unint64_t)v5 >= 2)
  {
    if (v5 == 10)
    {
      [(CRLPointPathSource *)self naturalSize];
      double y = 0.5;
      double x = v9 * 0.5;
    }
  }
  else
  {
    [(CRLPointPathSource *)self naturalSize];
    double x = v6;
    double y = 0.5;
  }
  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (unint64_t)starPoints
{
  if ((id)[(CRLPointPathSource *)self type] != (id)100)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB3C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A7A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB3E0);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource starPoints]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:161 isFatal:0 description:"asking for starPoints on wrong type of pathSource"];
  }
  [(CRLPointPathSource *)self point];
  return (unint64_t)v6;
}

- (unint64_t)maxStarPoints
{
  return 20;
}

- (unint64_t)minStarPoints
{
  [(CRLPointPathSource *)self minPointValue];
  return (unint64_t)v2;
}

- (double)starRadius
{
  if ((id)[(CRLPointPathSource *)self type] != (id)100)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB400);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A828();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB420);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource starRadius]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:177 isFatal:0 description:"asking for starRadius on wrong type of pathSource"];
  }
  [(CRLPointPathSource *)self point];
  return v6;
}

- (double)maxStarRadius
{
  [(CRLPointPathSource *)self maxPointValue];
  return v2;
}

- (double)minStarRadius
{
  [(CRLPointPathSource *)self minPointValue];
  return v2;
}

- (BOOL)p_isArrowType
{
  if ([(CRLPointPathSource *)self type])
  {
    unint64_t v3 = [(CRLPointPathSource *)self type];
    if (v3 != 1) {
      LOBYTE(v3) = (id)[(CRLPointPathSource *)self type] == (id)10;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (double)arrowIndent
{
  if (![(CRLPointPathSource *)self p_isArrowType])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB440);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A8B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB460);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource arrowIndent]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:194 isFatal:0 description:"asking for arrowIndent on wrong type of pathSource"];
  }
  [(CRLPointPathSource *)self point];
  return v6;
}

- (double)maxArrowIndent
{
  if (![(CRLPointPathSource *)self p_isArrowType])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB480);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A938();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB4A0);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource maxArrowIndent]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:199 isFatal:0 description:"asking for arrowIndent on wrong type of pathSource"];
  }
  [(CRLPointPathSource *)self maxPointValue];
  return v6;
}

- (double)minArrowIndent
{
  [(CRLPointPathSource *)self minPointValue];
  return v2;
}

- (double)arrowHead
{
  if (![(CRLPointPathSource *)self p_isArrowType])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB4C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A9C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB4E0);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource arrowHead]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:208 isFatal:0 description:"asking for arrowIndent on wrong type of pathSource"];
  }
  [(CRLPointPathSource *)self point];
  return result;
}

- (double)maxArrowHead
{
  if (![(CRLPointPathSource *)self p_isArrowType])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB500);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109AA48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB520);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPointPathSource maxArrowHead]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPointPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:213 isFatal:0 description:"asking for arrowIndent on wrong type of pathSource"];
  }
  [(CRLPointPathSource *)self maxPointValue];
  return result;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(CRLPointPathSource *)self type];
  if (v6 <= 0xA && ((1 << v6) & 0x403) != 0 || v6 == 200)
  {
    -[CRLPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    self->mPoint.double x = v7 * self->mPoint.x;
  }
  self->mNaturalSize.double width = width;
  self->mNaturalSize.double height = height;
}

- (unint64_t)numberOfControlKnobs
{
  if ((id)[(CRLPointPathSource *)self type] == (id)100) {
    return 2;
  }
  else {
    return 1;
  }
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  unint64_t v5 = [(CRLPointPathSource *)self type];
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    [(CRLPointPathSource *)self p_getControlKnobPointForArrow];
  }
  else if (v5 == 100)
  {
    if (a3 == 12) {
      [(CRLPointPathSource *)self p_getControlKnobPointForStarPoints];
    }
    else {
      [(CRLPointPathSource *)self p_getControlKnobPointForStarInnerRadius];
    }
  }
  else
  {
    double v7 = 0.0;
    double v6 = 0.0;
    if (v5 == 200) {
      [(CRLPointPathSource *)self p_getControlKnobPointForPlus];
    }
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unint64_t v8 = [(CRLPointPathSource *)self type];
  if (v8 <= 0xA && ((1 << v8) & 0x403) != 0)
  {
    -[CRLPointPathSource p_setControlKnobPointForArrow:](self, "p_setControlKnobPointForArrow:", x, y);
  }
  else if (v8 == 100)
  {
    if (a3 == 12)
    {
      -[CRLPointPathSource p_setControlKnobPointForStarPoints:](self, "p_setControlKnobPointForStarPoints:", x, y);
    }
    else
    {
      -[CRLPointPathSource p_setControlKnobPointForStarInnerRadius:](self, "p_setControlKnobPointForStarInnerRadius:", x, y);
    }
  }
  else if (v8 == 200)
  {
    -[CRLPointPathSource p_setControlKnobPointForPlus:](self, "p_setControlKnobPointForPlus:", x, y);
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  unint64_t v5 = [(CRLPointPathSource *)self type];
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0 || v5 == 200)
  {
    double v10 = &stru_101538650;
  }
  else if (v5 == 100)
  {
    double v6 = +[NSBundle mainBundle];
    double v7 = v6;
    if (a3 == 12)
    {
      unint64_t v8 = [v6 localizedStringForKey:@"Points: %d" value:0 table:0];
      [(CRLPointPathSource *)self point];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, (int)v9);
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v8 = [v6 localizedStringForKey:@"Radius: %@" value:0 table:0];
      double v11 = [(CRLPointPathSource *)self p_innerRadiusLocalizedPercent];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v11);
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  unint64_t v5 = [(CRLPointPathSource *)self type];
  Mutable = 0;
  if (a3 == 12 && v5 == 100)
  {
    double v7 = [(CRLPathSource *)self bezierPath];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;

    Mutable = CGPathCreateMutable();
    [(CRLPointPathSource *)self naturalSize];
    CGFloat v13 = -(v9 - v12 * 0.15);
    [(CRLPointPathSource *)self naturalSize];
    CGFloat v15 = -(v11 - v14 * 0.15);
    [(CRLPointPathSource *)self naturalSize];
    CGFloat v17 = v16 * 0.7;
    [(CRLPointPathSource *)self naturalSize];
    v20.size.double height = v18 * 0.7;
    v20.origin.double x = v13;
    v20.origin.double y = v15;
    v20.size.double width = v17;
    CGPathAddEllipseInRect(Mutable, 0, v20);
  }
  return Mutable;
}

- (id)bezierPathWithoutFlips
{
  unint64_t v3 = [(CRLPointPathSource *)self type];
  if (v3 <= 0xA && ((1 << v3) & 0x403) != 0)
  {
    double v4 = [(CRLPointPathSource *)self p_newArrowPath];
LABEL_8:
    unint64_t v5 = v4;
    goto LABEL_9;
  }
  if (v3 == 100)
  {
    double v4 = [(CRLPointPathSource *)self p_newStarPath];
    goto LABEL_8;
  }
  if (v3 == 200)
  {
    double v4 = [(CRLPointPathSource *)self p_newPlusPath];
    goto LABEL_8;
  }
  unint64_t v5 = 0;
LABEL_9:
  double v6 = +[CRLBezierPath bezierPathWithCGPath:v5];
  CGPathRelease(v5);

  return v6;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)name
{
  uint64_t v2 = [(CRLPointPathSource *)self type];
  unint64_t v3 = 0;
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      double v4 = +[NSBundle mainBundle];
      unint64_t v5 = v4;
      CFStringRef v6 = @"Star";
    }
    else
    {
      if (v2 != 200) {
        goto LABEL_11;
      }
      double v4 = +[NSBundle mainBundle];
      unint64_t v5 = v4;
      CFStringRef v6 = @"Plus";
    }
  }
  else if ((unint64_t)v2 >= 2)
  {
    if (v2 != 10) {
      goto LABEL_11;
    }
    double v4 = +[NSBundle mainBundle];
    unint64_t v5 = v4;
    CFStringRef v6 = @"Double Arrow";
  }
  else
  {
    double v4 = +[NSBundle mainBundle];
    unint64_t v5 = v4;
    CFStringRef v6 = @"Arrow";
  }
  unint64_t v3 = [v4 localizedStringForKey:v6 value:0 table:0];

LABEL_11:

  return v3;
}

- (CGPath)p_newArrowPath
{
  Mutable = CGPathCreateMutable();
  [(CRLPointPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = sub_100064070();
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(CRLPointPathSource *)self point];
  double v16 = v15;
  double v18 = v17;
  [(CRLPointPathSource *)self naturalSize];
  double v20 = v18 * v19;
  unint64_t mType = self->mType;
  if (mType == 1)
  {
    double v24 = v5 - sub_100407E48(v16, 0.0, v5);
  }
  else
  {
    if (mType == 10)
    {
      double v22 = v5 * 0.5;
      double v23 = v16;
    }
    else
    {
      double v23 = v16;
      double v22 = v5;
    }
    double v24 = sub_100407E48(v23, 0.0, v22);
  }
  double v25 = sub_100407E48(v20, 0.0, v7 * 0.5);
  CGFloat v26 = v25;
  unint64_t v27 = self->mType;
  if (v27 == 10)
  {
    CGFloat v47 = v7 - v25;
    CGPathMoveToPoint(Mutable, 0, v24, v7 - v25);
    v53.origin.double x = v8;
    v53.origin.double y = v10;
    v53.size.double width = v12;
    v53.size.double height = v14;
    CGFloat MaxY = CGRectGetMaxY(v53);
    CGPathAddLineToPoint(Mutable, 0, v24, MaxY);
    v54.origin.double x = v8;
    v54.origin.double y = v10;
    v54.size.double width = v12;
    v54.size.double height = v14;
    CGFloat MinX = CGRectGetMinX(v54);
    v55.origin.double x = v8;
    v55.origin.double y = v10;
    v55.size.double width = v12;
    v55.size.double height = v14;
    CGFloat MidY = CGRectGetMidY(v55);
    CGPathAddLineToPoint(Mutable, 0, MinX, MidY);
    CGPathAddLineToPoint(Mutable, 0, v24, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v24, v26);
    CGFloat v37 = v5 - v24;
    CGPathAddLineToPoint(Mutable, 0, v37, v26);
    CGPathAddLineToPoint(Mutable, 0, v37, 0.0);
    v56.origin.double x = v8;
    v56.origin.double y = v10;
    v56.size.double width = v12;
    v56.size.double height = v14;
    CGFloat MaxX = CGRectGetMaxX(v56);
    v57.origin.double x = v8;
    v57.origin.double y = v10;
    v57.size.double width = v12;
    v57.size.double height = v14;
    CGFloat v39 = CGRectGetMidY(v57);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v39);
    v58.origin.double x = v8;
    v58.origin.double y = v10;
    v58.size.double width = v12;
    v58.size.double height = v14;
    CGFloat v40 = CGRectGetMaxY(v58);
    CGPathAddLineToPoint(Mutable, 0, v37, v40);
    CGPathAddLineToPoint(Mutable, 0, v37, v47);
    double v41 = vabdd_f64(v26, v47);
  }
  else
  {
    if (v27 == 1)
    {
      double v28 = v7 - v25;
      CGPathMoveToPoint(Mutable, 0, v24, v7 - v25);
      v59.origin.double x = v8;
      v59.origin.double y = v10;
      v59.size.double width = v12;
      v59.size.double height = v14;
      CGFloat v42 = CGRectGetMaxY(v59);
      CGPathAddLineToPoint(Mutable, 0, v24, v42);
      v60.origin.double x = v8;
      v60.origin.double y = v10;
      v60.size.double width = v12;
      v60.size.double height = v14;
      CGFloat v43 = CGRectGetMaxX(v60);
      v61.origin.double x = v8;
      v61.origin.double y = v10;
      v61.size.double width = v12;
      v61.size.double height = v14;
      CGFloat v44 = CGRectGetMidY(v61);
      CGPathAddLineToPoint(Mutable, 0, v43, v44);
      CGPathAddLineToPoint(Mutable, 0, v24, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v24, v26);
      v62.origin.double x = v8;
      v62.origin.double y = v10;
      v62.size.double width = v12;
      v62.size.double height = v14;
      CGFloat v45 = CGRectGetMinX(v62);
      CGPathAddLineToPoint(Mutable, 0, v45, v26);
      v63.origin.double x = v8;
      v63.origin.double y = v10;
      v63.size.double width = v12;
      v63.size.double height = v14;
      double v33 = CGRectGetMinX(v63);
    }
    else
    {
      if (v27) {
        return Mutable;
      }
      double v28 = v7 - v25;
      CGPathMoveToPoint(Mutable, 0, v24, v7 - v25);
      v48.origin.double x = v8;
      v48.origin.double y = v10;
      v48.size.double width = v12;
      v48.size.double height = v14;
      CGFloat v29 = CGRectGetMaxY(v48);
      CGPathAddLineToPoint(Mutable, 0, v24, v29);
      v49.origin.double x = v8;
      v49.origin.double y = v10;
      v49.size.double width = v12;
      v49.size.double height = v14;
      CGFloat v30 = CGRectGetMinX(v49);
      v50.origin.double x = v8;
      v50.origin.double y = v10;
      v50.size.double width = v12;
      v50.size.double height = v14;
      CGFloat v31 = CGRectGetMidY(v50);
      CGPathAddLineToPoint(Mutable, 0, v30, v31);
      CGPathAddLineToPoint(Mutable, 0, v24, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v24, v26);
      v51.origin.double x = v8;
      v51.origin.double y = v10;
      v51.size.double width = v12;
      v51.size.double height = v14;
      CGFloat v32 = CGRectGetMaxX(v51);
      CGPathAddLineToPoint(Mutable, 0, v32, v26);
      v52.origin.double x = v8;
      v52.origin.double y = v10;
      v52.size.double width = v12;
      v52.size.double height = v14;
      double v33 = CGRectGetMaxX(v52);
    }
    CGPathAddLineToPoint(Mutable, 0, v33, v28);
    double v41 = vabdd_f64(v26, v28);
  }
  if (v41 > 0.01) {
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (CGPath)p_newStarPath
{
  Mutable = CGPathCreateMutable();
  [(CRLPointPathSource *)self point];
  unint64_t v5 = (unint64_t)fmax(v4, 3.0);
  [(CRLPointPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = v6 * 0.5;
  uint64_t v11 = 2 * v5;
  [(CRLPointPathSource *)self point];
  double v13 = v12;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v9 / v7);
  CGAffineTransform v18 = m;
  CGAffineTransformTranslate(&v19, &v18, v7 * 0.5, v7 * 0.5);
  CGAffineTransform m = v19;
  if (v11)
  {
    unint64_t v14 = 0;
    double v15 = v13 * v10;
    while (1)
    {
      v19.a = 0.0;
      v19.b = 0.0;
      double v16 = 6.28318531 / (double)(unint64_t)v11 * (double)v14 + -1.57079633;
      if (v14) {
        break;
      }
      sub_100066270(&v19.a, v7 * 0.5, v16);
      if (v14) {
        goto LABEL_7;
      }
      CGPathMoveToPoint(Mutable, &m, v19.a, v19.b);
LABEL_8:
      if (v11 == ++v14) {
        goto LABEL_9;
      }
    }
    sub_100066270(&v19.a, v15, v16);
LABEL_7:
    CGPathAddLineToPoint(Mutable, &m, v19.a, v19.b);
    goto LABEL_8;
  }
LABEL_9:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newPlusPath
{
  Mutable = CGPathCreateMutable();
  [(CRLPointPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  [(CRLPointPathSource *)self point];
  double v9 = v8;
  double v11 = sub_100407E48((v5 - v10) * 0.5, 0.0, v5);
  double v12 = sub_100407E48((v7 - v9) * 0.5, 0.0, v7);
  CGPathMoveToPoint(Mutable, 0, v11, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, v12);
  CGPathAddLineToPoint(Mutable, 0, v5, v12);
  CGPathAddLineToPoint(Mutable, 0, v5, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, v5 - v11, v7);
  CGPathAddLineToPoint(Mutable, 0, v11, v7);
  CGPathAddLineToPoint(Mutable, 0, v11, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v7 - v12);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v12);
  CGPathAddLineToPoint(Mutable, 0, v11, v12);
  CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (id)p_innerRadiusLocalizedPercent
{
  id v3 = objc_alloc((Class)NSNumber);
  [(CRLPointPathSource *)self point];
  id v5 = [v3 initWithDouble:v4];
  double v6 = +[CRLPointPathSource p_percentageNumberFormatter];
  double v7 = [v6 stringFromNumber:v5];

  return v7;
}

- (void)p_setControlKnobPointForArrow:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLPointPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = v6 * 0.5;
  if (self->mType == 10) {
    double v11 = v10;
  }
  else {
    double v11 = v7;
  }
  double v12 = sub_100407E48(x, 0.0, v11);
  if ([(CRLPointPathSource *)self p_isRightFacingArrow]) {
    double v12 = v7 - v12;
  }
  double v13 = sub_100407E48(y / v9, 0.0, 0.5);
  self->mPoint.double x = v12;
  self->mPoint.double y = v13;
}

- (CGPoint)p_getControlKnobPointForArrow
{
  [(CRLPointPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  unsigned int v7 = [(CRLPointPathSource *)self p_isRightFacingArrow];
  double x = self->mPoint.x;
  if (v7) {
    double x = v4 - x;
  }
  double v9 = v6 * self->mPoint.y;
  double v10 = sub_100407E48(x, 0.0, v4);
  double v11 = sub_100407E48(v9, 0.0, v6);
  double v12 = v10;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (void)p_setControlKnobPointForStarPoints:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLPointPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  unsigned int v10 = [(CRLPathSource *)self hasVerticalFlip];
  double v11 = v9 - y;
  if (!v10) {
    double v11 = y;
  }
  double v12 = x - v7 * 0.5;
  double v13 = v7 / v9 * (v11 - v9 * 0.5);
  double v14 = sub_100065398(v12, v13);
  double v15 = acos(-v12 / v14);
  if (v13 > 0.0) {
    double v15 = 6.28318531 - v15;
  }
  double v16 = v15 / 6.28318531 + -0.25;
  if (v16 < 0.0) {
    double v16 = v16 + 1.0;
  }
  unint64_t v17 = (unint64_t)(v16 * 18.0 + 3.5);
  if (v17 > 0x14) {
    unint64_t v17 = 3;
  }
  int v18 = (int)self->mPoint.x;
  if ((v18 != 3 || v17 == 4) && (v18 != 20 || v17 == 19)) {
    self->mPoint.double x = (double)v17;
  }
}

- (CGPoint)p_getControlKnobPointForStarPoints
{
  int v3 = (int)fmax(self->mPoint.x, 3.0);
  [(CRLPointPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v4 * 0.5;
  double v12 = 0.0;
  double v13 = 0.0;
  sub_100066270(&v12, v4 * 0.5 * 0.7, ((float)((float)(v3 - 3) / 18.0) + -0.25) * 6.28318531);
  double v12 = v8 + v12;
  double v13 = v7 * 0.5 + v7 / v5 * v13;
  unsigned int v9 = [(CRLPathSource *)self hasVerticalFlip];
  double v10 = v12;
  double v11 = v13;
  if (v9) {
    double v11 = v7 - v13;
  }
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)p_setControlKnobPointForStarInnerRadius:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLPointPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  if ([(CRLPathSource *)self hasVerticalFlip]) {
    double v10 = v9 - y;
  }
  else {
    double v10 = y;
  }
  double v11 = sub_100065398(x - v7 * 0.5, v7 / v9 * (v10 - v9 * 0.5));
  p_mPoint = &self->mPoint;
  CGFloat v13 = p_mPoint->x;
  double v14 = sub_100407E48(v11 / (v7 * 0.5), 0.1, 1.0);
  p_mPoint->double x = v13;
  p_mPoint->double y = v14;
}

- (CGPoint)p_getControlKnobPointForStarInnerRadius
{
  p_mPoint = &self->mPoint;
  int v4 = (int)fmax(self->mPoint.x, 3.0);
  [(CRLPointPathSource *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = v5 * 0.5;
  double v10 = p_mPoint->y * (v5 * 0.5);
  double v14 = 0.0;
  double v15 = 0.0;
  sub_100066270(&v14, v10, 3.14159265 / (double)v4 + -1.57079633);
  double v14 = v9 + v14;
  double v15 = v8 * 0.5 + v8 / v6 * v15;
  unsigned int v11 = [(CRLPathSource *)self hasVerticalFlip];
  double v12 = v14;
  double v13 = v15;
  if (v11) {
    double v13 = v8 - v15;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)p_setControlKnobPointForPlus:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLPointPathSource *)self naturalSize];
  double v7 = v6;
  double v8 = v6 - y * 2.0;
  double v10 = sub_100407E48(v9 - x * 2.0, 0.0, v9 * 0.5);
  double v11 = sub_100407E48(v8, 0.0, v7 * 0.5);
  self->mPoint.double x = v10;
  self->mPoint.double y = v11;
}

- (CGPoint)p_getControlKnobPointForPlus
{
  [(CRLPointPathSource *)self naturalSize];
  double v4 = (v3 - self->mPoint.x) * 0.5;
  double v6 = (v5 - self->mPoint.y) * 0.5;
  result.double y = v6;
  result.double x = v4;
  return result;
}

- (BOOL)p_isRightFacingArrow
{
  if (self->mType == 1) {
    return ![(CRLPathSource *)self hasHorizontalFlip];
  }
  else {
    return 0;
  }
}

- (BOOL)p_isFlippedDoubleArrow
{
  if (self->mType == 10) {
    return [(CRLPathSource *)self hasHorizontalFlip];
  }
  else {
    return 0;
  }
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  double v3 = [(CRLPathSource *)self userDefinedName];
  if (![v3 length])
  {
    uint64_t v4 = [(CRLPointPathSource *)self inferredAccessibilityDescription];

    double v3 = (void *)v4;
  }

  return v3;
}

- (id)inferredAccessibilityDescription
{
  uint64_t v2 = [(CRLPointPathSource *)self type];
  double v3 = 0;
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      uint64_t v4 = +[NSBundle mainBundle];
      double v5 = v4;
      CFStringRef v6 = @"Star";
    }
    else
    {
      if (v2 != 200) {
        goto LABEL_11;
      }
      uint64_t v4 = +[NSBundle mainBundle];
      double v5 = v4;
      CFStringRef v6 = @"Plus";
    }
  }
  else if ((unint64_t)v2 >= 2)
  {
    if (v2 != 10) {
      goto LABEL_11;
    }
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"Double arrow";
  }
  else
  {
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"Arrow";
  }
  double v3 = [v4 localizedStringForKey:v6 value:0 table:0];

LABEL_11:

  return v3;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  uint64_t v2 = [(CRLPointPathSource *)self type];
  double v3 = 0;
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      uint64_t v4 = +[NSBundle mainBundle];
      double v5 = v4;
      CFStringRef v6 = @"Describe the selected star.";
    }
    else
    {
      if (v2 != 200) {
        goto LABEL_11;
      }
      uint64_t v4 = +[NSBundle mainBundle];
      double v5 = v4;
      CFStringRef v6 = @"Describe the selected plus.";
    }
  }
  else if ((unint64_t)v2 >= 2)
  {
    if (v2 != 10) {
      goto LABEL_11;
    }
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"Describe the selected double arrow.";
  }
  else
  {
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"Describe the selected arrow.";
  }
  double v3 = [v4 localizedStringForKey:v6 value:0 table:0];

LABEL_11:

  return v3;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  unint64_t v4 = [(CRLPointPathSource *)self type];
  if (v4 <= 0xA && ((1 << v4) & 0x403) != 0)
  {
    double v5 = +[NSBundle mainBundle];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Tail length and width";
LABEL_4:
    double v8 = [v5 localizedStringForKey:v7 value:0 table:0];

    goto LABEL_10;
  }
  if (v4 == 100)
  {
    if (a3 == 13)
    {
      double v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"Inner radius";
      goto LABEL_4;
    }
    if (a3 == 12)
    {
      double v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"Points";
      goto LABEL_4;
    }
  }
  double v8 = 0;
LABEL_10:

  return v8;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  if ((id)[(CRLPointPathSource *)self type] != (id)100)
  {
LABEL_5:
    CFStringRef v6 = 0;
    goto LABEL_7;
  }
  if (a3 != 13)
  {
    if (a3 == 12)
    {
      [(CRLPointPathSource *)self point];
      CFStringRef v6 = +[NSString stringWithFormat:@"%d", (int)v5];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  CFStringRef v6 = [(CRLPointPathSource *)self p_innerRadiusLocalizedPercent];
LABEL_7:

  return v6;
}

- (id)crlaxUserInputLabelForKnobTag:(unint64_t)a3
{
  unint64_t v4 = [(CRLPointPathSource *)self crlaxLabelComponentForKnobTag:a3];
  unint64_t v5 = [(CRLPointPathSource *)self type];
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    CFStringRef v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Tail" value:0 table:0];

    unint64_t v4 = (void *)v7;
  }

  return v4;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return (id)[(CRLPointPathSource *)self type] == (id)100;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  unint64_t v3 = [(CRLPointPathSource *)self type];
  return (v3 < 0xB) & (0x403u >> v3);
}

- (unint64_t)type
{
  return self->mType;
}

- (void)setType:(unint64_t)a3
{
  self->unint64_t mType = a3;
}

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
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

@end