@interface CRLConnectionLinePathSource
+ (id)pathSourceAtAngleOfSize:(CGSize)a3 forType:(int64_t)a4;
+ (id)pathSourceOfLength:(double)a3;
- (BOOL)canUseToChangeShape;
- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3;
- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3;
- (BOOL)isCircular;
- (BOOL)isLineSegment;
- (BOOL)isRectangular;
- (BOOL)userDidSetControlPoint;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPoint)fixedPointForControlKnobChange;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)getNewNormalizedPositionForMagnet:(BOOL)a3 withPreviousLayout:(id)a4 onNewLayout:(id)a5;
- (CRLConnectionLineMagnet)headMagnet;
- (CRLConnectionLineMagnet)tailMagnet;
- (CRLConnectionLinePathSource)initWithBezierPath:(id)a3;
- (double)outsetFrom;
- (double)outsetTo;
- (id)bezierPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3;
- (id)crlaxUserInputLabelForKnobTag:(unint64_t)a3;
- (id)crlaxValueForKnobTag:(unint64_t)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (int64_t)pathElementIndexForKnobTag:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)numberOfControlKnobs;
- (void)bend;
- (void)p_setBezierPath:(id)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setHeadMagnet:(id)a3;
- (void)setOutsetFrom:(double)a3;
- (void)setOutsetTo:(double)a3;
- (void)setTailMagnet:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserDidSetControlPoint:(BOOL)a3;
@end

@implementation CRLConnectionLinePathSource

- (CRLConnectionLinePathSource)initWithBezierPath:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 elementCount] < 1)
  {
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  else
  {
    [v4 controlPointBounds];
  }
  BOOL v7 = width == CGSizeZero.width && height == CGSizeZero.height;
  if (v7 || (sub_100067C6C() & 1) != 0 || [v4 elementCount] != (id)3)
  {
    if ([v4 elementCount] == (id)2 && objc_msgSend(v4, "elementAtIndex:", 1) == (id)2)
    {
      [v4 elementAtIndex:1 allPoints:v19];
      v8 = +[CRLBezierPath bezierPath];

      [v8 moveToPoint:*(_OWORD *)v19];
      [v8 lineToPoint:sub_100064570(v19, 0.5)];
      double v9 = v20;
      double v10 = v21;
      v11 = v8;
    }
    else
    {
      int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7028);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101093BB0((uint64_t)v4, v12);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7048);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource initWithBezierPath:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14, v15, 46, 0, "Ignoring invalid bezier path %@", v4 file lineNumber isFatal description];

      v8 = +[CRLBezierPath bezierPath];

      [v8 moveToPoint:CGPointZero.x, CGPointZero.y];
      [v8 lineToPoint:50.0, 50.0];
      double v9 = 100.0;
      v11 = v8;
      double v10 = 100.0;
    }
    [v11 lineToPoint:v9, v10];
    id v4 = v8;
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLConnectionLinePathSource;
  v16 = [(CRLBezierPathSource *)&v18 initWithBezierPath:v4];

  return v16;
}

- (CGPoint)getNewNormalizedPositionForMagnet:(BOOL)a3 withPreviousLayout:(id)a4 onNewLayout:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6)
  {
    double v10 = [(CRLConnectionLinePathSource *)self headMagnet];

    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7068);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101093C68();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7088);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      int v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource getNewNormalizedPositionForMagnet:withPreviousLayout:onNewLayout:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 60, 0, "invalid nil value for '%{public}s'", "self.headMagnet");
    }
    v14 = [(CRLConnectionLinePathSource *)self headMagnet];
  }
  else
  {
    v15 = [(CRLConnectionLinePathSource *)self tailMagnet];

    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E70A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101093D00();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E70C8);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource getNewNormalizedPositionForMagnet:withPreviousLayout:onNewLayout:]");
      objc_super v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 63, 0, "invalid nil value for '%{public}s'", "self.tailMagnet");
    }
    v14 = [(CRLConnectionLinePathSource *)self tailMagnet];
  }
  v19 = v14;
  [v14 magnetNormalizedPosition];
  double v21 = v20;
  double v23 = v22;

  v24 = [v8 pureGeometry];
  v25 = v24;
  if (v24)
  {
    [v24 fullTransform];
    double v27 = *((double *)&v44 + 1);
    double v26 = *(double *)&v44;
    double v29 = *((double *)&v45 + 1);
    double v28 = *(double *)&v45;
    double v30 = *((double *)&v46 + 1);
    double v31 = *(double *)&v46;
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    double v30 = 0.0;
    double v29 = 0.0;
    double v27 = 0.0;
    double v31 = 0.0;
    double v28 = 0.0;
    double v26 = 0.0;
  }

  if (v9) {
    [v9 pureTransformInRoot];
  }
  else {
    memset(&v42, 0, sizeof(v42));
  }
  CGAffineTransformInvert(&v43, &v42);
  float64x2_t v41 = vaddq_f64(*(float64x2_t *)&v43.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v43.c, v30 + v23 * v29 + v27 * v21), *(float64x2_t *)&v43.a, v31 + v23 * v28 + v26 * v21));
  v32 = [v9 pureGeometry];
  [v32 size];
  double v33 = sub_100064070();
  double v36 = sub_100066AA4(v41.f64[0], v41.f64[1], v33, v34, v35);
  double v38 = v37;

  double v39 = v36;
  double v40 = v38;
  result.y = v40;
  result.x = v39;
  return result;
}

+ (id)pathSourceOfLength:(double)a3
{
  id v4 = +[CRLBezierPath bezierPath];
  [v4 moveToPoint:0.0, 0.0];
  [v4 lineToPoint:a3 * 0.5, 0.0];
  [v4 lineToPoint:a3];
  v5 = [[CRLConnectionLinePathSource alloc] initWithBezierPath:v4];

  return v5;
}

+ (id)pathSourceAtAngleOfSize:(CGSize)a3 forType:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v7 = +[CRLBezierPath bezierPath];
  id v8 = v7;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    [v7 moveToPoint:0.0, 0.0];
    [v8 lineToPoint:0.0 height];
  }
  else
  {
    [v7 moveToPoint:0.0, height];
    [v8 lineToPoint:width * 0.5, height * 0.5];
    double height = 0.0;
  }
  [v8 lineToPoint:width, height];
LABEL_6:
  id v9 = [[CRLConnectionLinePathSource alloc] initWithBezierPath:v8];
  [(CRLConnectionLinePathSource *)v9 setType:a4];

  return v9;
}

- (void)bend
{
  [(CRLConnectionLinePathSource *)self getControlKnobPosition:12];
  double v4 = v3;
  double v6 = v5;
  [(CRLConnectionLinePathSource *)self getControlKnobPosition:10];
  double v8 = v7;
  [(CRLConnectionLinePathSource *)self getControlKnobPosition:11];
  double v11 = sub_100064680(v9, v10, v8);
  double v13 = sub_100064660(v11, v12);
  double v15 = sub_100066394(1, v13, v14);
  double v17 = v15;
  double v18 = v16;
  if (v16 > 0.0)
  {
    double v17 = sub_1000646A4(v15, v16, -1.0);
    double v18 = v19;
  }
  [(CRLBezierPathSource *)self naturalSize];
  double v21 = v20;
  [(CRLBezierPathSource *)self naturalSize];
  double v23 = v22;
  [(CRLBezierPathSource *)self naturalSize];
  double v25 = v24;
  [(CRLBezierPathSource *)self naturalSize];
  double v27 = sub_1000646A4(v17, v18, sqrt(v25 * v26 + v21 * v23) * 0.3);
  double v28 = sub_100064698(v4, v6, v27);

  [(CRLConnectionLinePathSource *)self setControlKnobPosition:12 toPoint:v28];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLConnectionLinePathSource;
  id v4 = [(CRLBezierPathSource *)&v8 copyWithZone:a3];
  [v4 setType:[self type]];
  [(CRLConnectionLinePathSource *)self outsetFrom];
  [v4 setOutsetFrom:];
  [(CRLConnectionLinePathSource *)self outsetTo];
  [v4 setOutsetTo:];
  double v5 = [(CRLConnectionLinePathSource *)self headMagnet];
  [v4 setHeadMagnet:v5];

  double v6 = [(CRLConnectionLinePathSource *)self tailMagnet];
  [v4 setTailMagnet:v6];

  [v4 setUserDidSetControlPoint:[self userDidSetControlPoint]];
  return v4;
}

- (unint64_t)numberOfControlKnobs
{
  return 1;
}

- (int64_t)pathElementIndexForKnobTag:(unint64_t)a3
{
  if (a3 - 10 > 2) {
    return -1;
  }
  else {
    return qword_101177208[a3 - 10];
  }
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  CGPoint v7 = CGPointZero;
  int64_t v4 = [(CRLConnectionLinePathSource *)self pathElementIndexForKnobTag:a3];
  if ((v4 & 0x8000000000000000) == 0) {
    [(CRLBezierPath *)self->super.mPath elementAtIndex:v4 associatedPoints:&v7];
  }
  double y = v7.y;
  double x = v7.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  int64_t v5 = -[CRLConnectionLinePathSource pathElementIndexForKnobTag:](self, "pathElementIndexForKnobTag:", a3, *(void *)&a4.x, *(void *)&a4.y);
  if ((v5 & 0x8000000000000000) == 0) {
    [(CRLBezierPath *)self->super.mPath setAssociatedPoints:&v6 atIndex:v5];
  }
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLBezierPath *)self->super.mPath bounds];
  double v8 = width / v7;
  double v9 = 0.0;
  if (v7 == 0.0) {
    double v8 = 0.0;
  }
  memset(&v12.c, 0, 32);
  if (v6 != 0.0) {
    double v9 = height / v6;
  }
  *(_OWORD *)&v12.a = 0uLL;
  CGAffineTransformMakeScale(&v12, v8, v9);
  mPath = self->super.mPath;
  CGAffineTransform v11 = v12;
  [(CRLBezierPath *)mPath transformUsingAffineTransform:&v11];
  -[CRLBezierPathSource setNaturalSize:](self, "setNaturalSize:", width, height);
}

- (id)bezierPath
{
  return self->super.mPath;
}

- (CGPoint)fixedPointForControlKnobChange
{
  double v4 = 0.0;
  double v5 = 0.0;
  [(CRLBezierPath *)self->super.mPath elementAtIndex:0 associatedPoints:&v4];
  double v2 = v4;
  double v3 = v5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  return &stru_101538650;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (BOOL)isLineSegment
{
  return 0;
}

- (void)p_setBezierPath:(id)a3
{
  double v4 = (CRLBezierPath *)a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E70E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093D98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7108);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLinePathSource p_setBezierPath:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLinePathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 222, 0, "invalid nil value for '%{public}s'", "path");
  }
  if ((id)[(CRLBezierPath *)v4 elementCount] == (id)2
    && (id)[(CRLBezierPath *)v4 elementAtIndex:1] == (id)2)
  {
    [(CRLBezierPath *)v4 elementAtIndex:1 allPoints:v15];
    double v8 = +[CRLBezierPath bezierPath];
    [(CRLBezierPath *)v8 moveToPoint:*(_OWORD *)v15];
    [(CRLBezierPath *)v8 lineToPoint:sub_100064570(v15, 0.5)];
    -[CRLBezierPath lineToPoint:](v8, "lineToPoint:", v16, v17);

    double v4 = v8;
  }
  mPath = self->super.mPath;
  self->super.mPath = v4;
  double v10 = v4;

  [(CRLBezierPath *)self->super.mPath bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  self->super.mNaturalSize.double width = v12;
  self->super.mNaturalSize.double height = v14;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CRLConnectionLinePathSource;
  double v3 = [(CRLBezierPathSource *)&v9 description];
  id v4 = [v3 mutableCopy];

  int64_t v5 = [(CRLConnectionLinePathSource *)self type];
  CFStringRef v6 = @"curved";
  if (v5 == 1) {
    CFStringRef v6 = @"orthogonal";
  }
  double v7 = +[NSString stringWithFormat:@"; connection type: %@", v6];
  [v4 appendString:v7];

  return v4;
}

- (BOOL)canUseToChangeShape
{
  return 0;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  int64_t v3 = [(CRLConnectionLinePathSource *)self type];
  id v4 = +[NSBundle mainBundle];
  int64_t v5 = v4;
  if (v3 == 1) {
    CFStringRef v6 = @"Path control";
  }
  else {
    CFStringRef v6 = @"Curvature control";
  }
  double v7 = [v4 localizedStringForKey:v6 value:0 table:0];

  return v7;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  return 0;
}

- (id)crlaxUserInputLabelForKnobTag:(unint64_t)a3
{
  int64_t v3 = [(CRLConnectionLinePathSource *)self type];
  id v4 = +[NSBundle mainBundle];
  int64_t v5 = v4;
  if (v3 == 1) {
    CFStringRef v6 = @"Path";
  }
  else {
    CFStringRef v6 = @"Curvature";
  }
  double v7 = [v4 localizedStringForKey:v6 value:0 table:0];

  return v7;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return 0;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  return 1;
}

- (int64_t)type
{
  return self->mType;
}

- (void)setType:(int64_t)a3
{
  self->mType = a3;
}

- (double)outsetFrom
{
  return self->mOutsetFrom;
}

- (void)setOutsetFrom:(double)a3
{
  self->mOutsetFrom = a3;
}

- (double)outsetTo
{
  return self->mOutsetTo;
}

- (void)setOutsetTo:(double)a3
{
  self->mOutsetTo = a3;
}

- (CRLConnectionLineMagnet)headMagnet
{
  return self->mHeadMagnet;
}

- (void)setHeadMagnet:(id)a3
{
}

- (CRLConnectionLineMagnet)tailMagnet
{
  return self->mTailMagnet;
}

- (void)setTailMagnet:(id)a3
{
}

- (BOOL)userDidSetControlPoint
{
  return self->mUserDidSetControlPoint;
}

- (void)setUserDidSetControlPoint:(BOOL)a3
{
  self->mUserDidSetControlPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTailMagnet, 0);

  objc_storeStrong((id *)&self->mHeadMagnet, 0);
}

@end