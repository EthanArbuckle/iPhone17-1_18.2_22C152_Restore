@interface CRLCanvasAlignmentGuide
- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5;
- (BOOL)infinite;
- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3;
- (BOOL)snapsToMax;
- (BOOL)snapsToMid;
- (BOOL)snapsToMin;
- (CRLCanvasAlignmentGuide)init;
- (CRLCanvasAlignmentGuide)initWithGeneratingObjectUnscaledRect:(CGRect)a3 edge:(int)a4;
- (CRLCanvasAlignmentGuide)initWithType:(int64_t)a3 offset:(double)a4;
- (CRLCanvasRenderable)renderable;
- (double)distanceToPoint:(CGPoint)a3;
- (double)end;
- (double)start;
- (id)renderableWithICC:(id)a3;
- (int64_t)guideType;
- (void)setEnd:(double)a3;
- (void)setGuideType:(int64_t)a3;
- (void)setInfinite:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setRenderable:(id)a3;
- (void)setSnapsToMax:(BOOL)a3;
- (void)setSnapsToMid:(BOOL)a3;
- (void)setSnapsToMin:(BOOL)a3;
- (void)setStart:(double)a3;
@end

@implementation CRLCanvasAlignmentGuide

- (CRLCanvasAlignmentGuide)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasAlignmentGuide;
  v2 = [(CRLCanvasAbstractGuide *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CRLCanvasAlignmentGuide *)v2 setSnapsToMid:1];
    [(CRLCanvasAlignmentGuide *)v3 setSnapsToMin:1];
    [(CRLCanvasAlignmentGuide *)v3 setSnapsToMax:1];
  }
  return v3;
}

- (CRLCanvasAlignmentGuide)initWithGeneratingObjectUnscaledRect:(CGRect)a3 edge:(int)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9 = [(CRLCanvasAlignmentGuide *)self init];
  v10 = v9;
  if (v9)
  {
    v9->mGeneratingObjectUnscaledRect.origin.CGFloat x = x;
    v9->mGeneratingObjectUnscaledRect.origin.CGFloat y = y;
    v9->mGeneratingObjectUnscaledRect.size.CGFloat width = width;
    v9->mGeneratingObjectUnscaledRect.size.CGFloat height = height;
    if (a4 > 2)
    {
      [(CRLCanvasAlignmentGuide *)v9 setGuideType:0];
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      [(CRLCanvasAlignmentGuide *)v10 setStart:CGRectGetMinX(v16)];
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v17);
    }
    else
    {
      [(CRLCanvasAlignmentGuide *)v9 setGuideType:1];
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
      [(CRLCanvasAlignmentGuide *)v10 setStart:CGRectGetMinY(v14)];
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      double MaxX = CGRectGetMaxY(v15);
    }
    [(CRLCanvasAlignmentGuide *)v10 setEnd:MaxX];
    switch(a4)
    {
      case 0:
        v18.origin.CGFloat x = x;
        v18.origin.CGFloat y = y;
        v18.size.CGFloat width = width;
        v18.size.CGFloat height = height;
        double MinX = CGRectGetMinX(v18);
        goto LABEL_12;
      case 1:
        v19.origin.CGFloat x = x;
        v19.origin.CGFloat y = y;
        v19.size.CGFloat width = width;
        v19.size.CGFloat height = height;
        double MinX = CGRectGetMidX(v19);
        goto LABEL_12;
      case 2:
        v20.origin.CGFloat x = x;
        v20.origin.CGFloat y = y;
        v20.size.CGFloat width = width;
        v20.size.CGFloat height = height;
        double MinX = CGRectGetMaxX(v20);
        goto LABEL_12;
      case 3:
        v21.origin.CGFloat x = x;
        v21.origin.CGFloat y = y;
        v21.size.CGFloat width = width;
        v21.size.CGFloat height = height;
        double MinX = CGRectGetMinY(v21);
        goto LABEL_12;
      case 4:
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        double MinX = CGRectGetMidY(v22);
        goto LABEL_12;
      case 5:
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        double MinX = CGRectGetMaxY(v23);
LABEL_12:
        [(CRLCanvasAlignmentGuide *)v10 setOffset:MinX];
        break;
      default:
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"+[CRLCanvasAlignmentGuide dynamicGuideForRect: edge:] given invalid edge argument.");
        break;
    }
  }
  return v10;
}

- (CRLCanvasAlignmentGuide)initWithType:(int64_t)a3 offset:(double)a4
{
  v6 = [(CRLCanvasAlignmentGuide *)self init];
  v7 = v6;
  if (v6)
  {
    CGSize size = CGRectNull.size;
    v6->mGeneratingObjectUnscaledRect.origin = CGRectNull.origin;
    v6->mGeneratingObjectUnscaledRect.CGSize size = size;
    [(CRLCanvasAlignmentGuide *)v6 setGuideType:a3];
    [(CRLCanvasAlignmentGuide *)v7 setOffset:a4];
    [(CRLCanvasAlignmentGuide *)v7 setInfinite:1];
  }
  return v7;
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  if (+[CRLCanvasGuideController shouldSnapToOffscreenContent])
  {
    if (a3 > 5) {
      return 0;
    }
    return *((unsigned char *)&self->super.super.isa + *(&off_1014D8530)[a3]) != 0;
  }
  unsigned int v12 = -[CRLCanvasAlignmentGuide isAssociatedContentVisibleInUnscaledRect:](self, "isAssociatedContentVisibleInUnscaledRect:", x, y, width, height);
  BOOL result = 0;
  if (v12 && a3 < 6) {
    return *((unsigned char *)&self->super.super.isa + *(&off_1014D8530)[a3]) != 0;
  }
  return result;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.origin.double x = CGRectNull.origin.x;
  v12.origin.double y = CGRectNull.origin.y;
  v12.size.double width = CGRectNull.size.width;
  v12.size.double height = CGRectNull.size.height;
  if (CGRectEqualToRect(a3, v12))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D84B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107C4AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D84D0);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAlignmentGuide isAssociatedContentVisibleInUnscaledRect:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAlignmentGuide.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:105 isFatal:0 description:"isAssociatedContentVisibleInUnscaledRect isn't expecting a null rect "];
  }
  return sub_10006525C(self->mGeneratingObjectUnscaledRect.origin.x, self->mGeneratingObjectUnscaledRect.origin.y, self->mGeneratingObjectUnscaledRect.size.width, self->mGeneratingObjectUnscaledRect.size.height, x, y, width, height);
}

- (void)setStart:(double)a3
{
  if (self->mStart != a3)
  {
    self->mStart = a3;
    self->super.mLocationInvalidated = 1;
  }
}

- (void)setEnd:(double)a3
{
  if (self->mEnd != a3)
  {
    self->mEnd = a3;
    self->super.mLocationInvalidated = 1;
  }
}

- (void)setOffset:(double)a3
{
  if (self->super.mOffset != a3)
  {
    self->super.mOffset = a3;
    self->super.mLocationInvalidated = 1;
  }
}

- (double)distanceToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(CRLCanvasAlignmentGuide *)self guideType];
  [(CRLCanvasAbstractGuide *)self offset];
  if (v6) {
    double v8 = x;
  }
  else {
    double v8 = y;
  }
  return vabdd_f64(v7, v8);
}

- (id)renderableWithICC:(id)a3
{
  id v4 = a3;
  [v4 viewScale];
  double v6 = v5;
  [(CRLCanvasAlignmentGuide *)self start];
  double v8 = v7;
  [(CRLCanvasAlignmentGuide *)self end];
  if (v8 == v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D84F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107C540();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8510);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAlignmentGuide renderableWithICC:]");
    CGRect v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAlignmentGuide.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:151 isFatal:0 description:"Cannot render a guide where start == end"];
  }
  if (self->mRenderable)
  {
    if (!self->super.mLocationInvalidated) {
      goto LABEL_30;
    }
  }
  else
  {
    v13 = +[CRLCanvasRenderable renderable];
    mRenderable = self->mRenderable;
    self->mRenderable = v13;

    [(CRLCanvasRenderable *)self->mRenderable setEdgeAntialiasingMask:0];
    [(CRLCanvasRenderable *)self->mRenderable setBackgroundColor:[(CRLCanvasAbstractGuide *)self guideColor]];
    self->super.mLocationInvalidated = 1;
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (self->mInfinite)
  {
    [v4 visibleScaledRectForCanvasUI];
    if (self->mType == 1)
    {
      self->double mStart = v16 / v6;
      double v19 = v16 + v18;
    }
    else
    {
      self->double mStart = v15 / v6;
      double v19 = v15 + v17;
    }
    self->double mEnd = v19 / v6;
  }
  int64_t v20 = [(CRLCanvasAlignmentGuide *)self guideType];
  p_mSnappingObjectFrame = &self->super.mSnappingObjectFrame;
  BOOL IsNull = CGRectIsNull(self->super.mSnappingObjectFrame);
  double mStart = self->mStart;
  if (v20 == 1)
  {
    if (IsNull)
    {
      double mEnd = self->mEnd;
    }
    else
    {
      v34.origin.double x = p_mSnappingObjectFrame->origin.x;
      v34.origin.double y = self->super.mSnappingObjectFrame.origin.y;
      v34.size.double width = self->super.mSnappingObjectFrame.size.width;
      v34.size.double height = self->super.mSnappingObjectFrame.size.height;
      double mStart = fmin(mStart, CGRectGetMinY(v34));
      v35.origin.double x = p_mSnappingObjectFrame->origin.x;
      v35.origin.double y = self->super.mSnappingObjectFrame.origin.y;
      v35.size.double width = self->super.mSnappingObjectFrame.size.width;
      v35.size.double height = self->super.mSnappingObjectFrame.size.height;
      double mEnd = fmax(self->mEnd, CGRectGetMaxY(v35));
    }
    [(CRLCanvasAbstractGuide *)self offset];
    double v27 = sub_100407DFC(v6 * v26);
    double v28 = v6 * mStart;
    double v29 = v6 * (mEnd - mStart);
    double v30 = 1.0;
  }
  else
  {
    if (IsNull)
    {
      double v25 = self->mEnd;
    }
    else
    {
      v36.origin.double x = p_mSnappingObjectFrame->origin.x;
      v36.origin.double y = self->super.mSnappingObjectFrame.origin.y;
      v36.size.double width = self->super.mSnappingObjectFrame.size.width;
      v36.size.double height = self->super.mSnappingObjectFrame.size.height;
      double mStart = fmin(mStart, CGRectGetMinX(v36));
      v37.origin.double x = p_mSnappingObjectFrame->origin.x;
      v37.origin.double y = self->super.mSnappingObjectFrame.origin.y;
      v37.size.double width = self->super.mSnappingObjectFrame.size.width;
      v37.size.double height = self->super.mSnappingObjectFrame.size.height;
      double v25 = fmax(self->mEnd, CGRectGetMaxX(v37));
    }
    double v27 = v6 * mStart;
    [(CRLCanvasAbstractGuide *)self offset];
    double v28 = sub_100407DFC(v6 * v31);
    double v30 = v6 * (v25 - mStart);
    double v29 = 1.0;
  }
  -[CRLCanvasRenderable setFrame:](self->mRenderable, "setFrame:", v27, v28, v30, v29);
  self->super.mLocationInvalidated = 0;
  +[CATransaction commit];
LABEL_30:
  v32 = self->mRenderable;

  return v32;
}

- (CRLCanvasRenderable)renderable
{
  return self->mRenderable;
}

- (void)setRenderable:(id)a3
{
}

- (double)start
{
  return self->mStart;
}

- (double)end
{
  return self->mEnd;
}

- (int64_t)guideType
{
  return self->mType;
}

- (void)setGuideType:(int64_t)a3
{
  self->mType = a3;
}

- (BOOL)infinite
{
  return self->mInfinite;
}

- (void)setInfinite:(BOOL)a3
{
  self->mInfinite = a3;
}

- (BOOL)snapsToMin
{
  return self->mSnapsToMin;
}

- (void)setSnapsToMin:(BOOL)a3
{
  self->mSnapsToMin = a3;
}

- (BOOL)snapsToMid
{
  return self->mSnapsToMid;
}

- (void)setSnapsToMid:(BOOL)a3
{
  self->mSnapsToMid = a3;
}

- (BOOL)snapsToMax
{
  return self->mSnapsToMax;
}

- (void)setSnapsToMax:(BOOL)a3
{
  self->mSnapsToMadouble x = a3;
}

- (void).cxx_destruct
{
}

@end