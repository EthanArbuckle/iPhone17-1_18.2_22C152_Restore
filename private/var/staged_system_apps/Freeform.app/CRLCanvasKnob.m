@interface CRLCanvasKnob
+ (CRLImage)defaultSelectionKnobImage;
+ (CRLImage)greenKnobImage;
- (BOOL)i_userInteractionAllowed;
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5;
- (BOOL)obscuresKnob:(id)a3;
- (BOOL)offsetValid;
- (BOOL)overlapsWithKnob:(id)a3;
- (BOOL)shouldDisplayDirectlyOverRep;
- (BOOL)transferCursorInsideStateIfDesiredFromKnob:(id)a3;
- (BOOL)wantsToFadeDuringZoom;
- (BOOL)worksWhenDocumentIsSharedReadOnly;
- (BOOL)worksWhenEditingDisabled;
- (BOOL)worksWhenInMediaBrowsingMode;
- (BOOL)worksWhenRepLocked;
- (BOOL)worksWithMultipleTaps;
- (BOOL)worksWithStylus;
- (CGPoint)offset;
- (CGPoint)pixelAlignedScaledCanvasCenterPositionFromKnobPosition:(CGPoint)a3;
- (CGPoint)position;
- (CGRect)cursorActiveScaledRect;
- (CGRect)frameForIntersection;
- (CGRect)unscaledBoundingBoxOfHitRegionWithAdditionalScale:(double)a3;
- (CRLBezierPath)hitRegionPath;
- (CRLCanvasKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (CRLCanvasRenderable)renderable;
- (CRLCanvasRep)rep;
- (CRLCursor)resizeCursor;
- (CRLCursor)rotateCursor;
- (CRLImage)defaultKnobImage;
- (CRLImage)knobImage;
- (double)p_rotationInDegrees;
- (double)radius;
- (double)radiusForPreciseHitRegionWithInputType:(int64_t)a3;
- (id)createKnobRenderable;
- (id)description;
- (id)p_scaledPreciseHitRegionForInputType:(int64_t)a3;
- (unint64_t)dragType;
- (unint64_t)tag;
- (unint64_t)type;
- (void)dealloc;
- (void)setHitRegionPath:(id)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setOffsetValid:(BOOL)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRadius:(double)a3;
- (void)setShouldDisplayDirectlyOverRep:(BOOL)a3;
- (void)setTag:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setWantsToFadeDuringZoom:(BOOL)a3;
- (void)setWorksWhenDocumentIsSharedReadOnly:(BOOL)a3;
- (void)setWorksWhenEditingDisabled:(BOOL)a3;
- (void)setWorksWhenInMediaBrowsingMode:(BOOL)a3;
- (void)setWorksWhenRepLocked:(BOOL)a3;
- (void)setWorksWithMultipleTaps:(BOOL)a3;
- (void)setWorksWithStylus:(BOOL)a3;
- (void)updateHitRegionPath;
@end

@implementation CRLCanvasKnob

- (CRLCanvasKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CRLCanvasKnob;
  v14 = [(CRLCanvasKnob *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_position.CGFloat x = x;
    v14->_position.CGFloat y = y;
    v14->_offset = CGPointZero;
    v14->_offsetValid = 0;
    v14->_radius = a5;
    v14->_tag = a6;
    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E78B8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101094874();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E78D8);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasKnob initWithType:position:radius:tag:onRep:]");
      v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasKnob.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 313, 0, "invalid nil value for '%{public}s'", "rep");
    }
    objc_storeWeak((id *)&v15->_rep, v13);
    v15->_worksWithStylus = (a6 < 0x11) & (0x1FFDEu >> a6);
  }

  return v15;
}

- (void)dealloc
{
  v3 = [(CRLCanvasRenderable *)self->_renderable delegate];

  if (v3 == self) {
    [(CRLCanvasRenderable *)self->_renderable setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasKnob;
  [(CRLCanvasKnob *)&v4 dealloc];
}

- (BOOL)worksWhenDocumentIsSharedReadOnly
{
  return self->_worksWhenDocumentIsSharedReadOnly || self->_worksWhenEditingDisabled;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return -[CRLCanvasKnob isHitByUnscaledPoint:inputType:returningDistance:](self, "isHitByUnscaledPoint:inputType:returningDistance:", a4, 0, a3.x, a3.y);
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  v10 = [(CRLCanvasKnob *)self rep];
  if ([(CRLCanvasKnob *)self i_userInteractionAllowed])
  {
    [(CRLCanvasKnob *)self position];
    [v10 convertNaturalPointToUnscaledCanvas:];
    double v12 = v11;
    double v14 = v13;
    hitRegionPath = self->_hitRegionPath;
    if (!hitRegionPath)
    {
      [(CRLCanvasKnob *)self updateHitRegionPath];
      hitRegionPath = self->_hitRegionPath;
    }
    double v16 = sub_100064680(x, y, v12);
    double v18 = v17;
    v19 = [v10 interactiveCanvasController];
    [v19 viewScale];
    unsigned int v21 = [(CRLBezierPath *)hitRegionPath containsPoint:sub_1000646A4(v16, v18, v20)];

    if (a5) {
      *a5 = sub_1000643CC(v12, v14, x, y);
    }
    if (v21)
    {
      if ([(CRLCanvasKnob *)self shouldDisplayDirectlyOverRep])
      {
        v22 = [v10 interactiveCanvasController];
        v23 = [v22 hitRep:x, y];

        unsigned int v24 = 1;
        if (v23 && v23 != v10)
        {
          v25 = [v10 canvas];
          v26 = [v25 allRepsOrdered];

          id v27 = [v26 indexOfObject:v23];
          unsigned int v24 = v27 < [v26 indexOfObject:v10];
        }
      }
      else
      {
        unsigned int v24 = 1;
      }
      if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 && v24)
      {
        if ([v10 canUseSpecializedHitRegionForKnob:self])
        {
          v29 = [(CRLCanvasKnob *)self p_scaledPreciseHitRegionForInputType:a4];
          v30 = [v10 interactiveCanvasController];
          [v30 viewScale];
          unsigned int v24 = [v29 containsPoint:sub_1000646A4(v16, v18, v31)];
        }
        else
        {
          unsigned int v24 = 1;
        }
      }
    }
    else
    {
      unsigned int v24 = 0;
    }
    BOOL v28 = v24 != 0;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (unint64_t)dragType
{
  return 2;
}

- (double)radiusForPreciseHitRegionWithInputType:(int64_t)a3
{
  return 15.0;
}

- (id)p_scaledPreciseHitRegionForInputType:(int64_t)a3
{
  [(CRLCanvasKnob *)self radiusForPreciseHitRegionWithInputType:a3];
  double v4 = -v3;

  return +[CRLBezierPath bezierPathWithOvalInRect:v4];
}

- (CRLImage)knobImage
{
  return [(CRLCanvasKnob *)self defaultKnobImage];
}

- (CRLImage)defaultKnobImage
{
  switch(self->_type)
  {
    case 2uLL:
      CFStringRef v2 = @"sf-ios-canvas-knob-text";
      goto LABEL_6;
    case 3uLL:
      CFStringRef v2 = @"sf-ios-canvas-knob-green";
      goto LABEL_6;
    case 4uLL:
      CFStringRef v2 = @"sf-ios-canvas-knob-locked";
      goto LABEL_6;
    case 5uLL:
      CFStringRef v2 = @"sf-ios-canvas-knob-yellow";
LABEL_6:
      double v3 = +[CRLImage imageNamed:v2];
      break;
    default:
      unint64_t v5 = self->_tag - 12;
      v6 = objc_opt_class();
      if (v5 > 4) {
        [v6 defaultSelectionKnobImage];
      }
      else {
      double v3 = [v6 greenKnobImage];
      }
      break;
  }

  return (CRLImage *)v3;
}

+ (CRLImage)defaultSelectionKnobImage
{
  return (CRLImage *)+[CRLImage imageNamed:@"sf-ios-canvas-knob-blue"];
}

+ (CRLImage)greenKnobImage
{
  return (CRLImage *)+[CRLImage imageNamed:@"sf-ios-canvas-knob-green"];
}

- (CRLCanvasRenderable)renderable
{
  renderable = self->_renderable;
  if (!renderable)
  {
    double v4 = [(CRLCanvasKnob *)self createKnobRenderable];
    unint64_t v5 = self->_renderable;
    self->_renderable = v4;

    [(CRLCanvasKnob *)self didCreateKnobRenderable];
    renderable = self->_renderable;
  }

  return renderable;
}

- (id)createKnobRenderable
{
  double v3 = [(CRLCanvasKnob *)self knobImage];
  if (v3)
  {
    double v4 = +[CRLCanvasRenderable renderable];
    [v3 size];
    [v4 setBounds:sub_100064070()];
    unint64_t v5 = [(CRLCanvasKnob *)self rep];
    id v6 = [v5 canvas];
    [v6 contentsScale];
    [v4 setContents:[v3 CGImageForContentsScale:]];
  }
  else
  {
    id v6 = +[CRLCanvasShapeRenderable renderable];
    Mutable = CGPathCreateMutable();
    [(CRLCanvasKnob *)self radius];
    CGFloat v9 = v8 + v8;
    double y = CGPointZero.y;
    [v6 setBounds:CGPointZero.x, y, v9, v9];
    v15.origin.double x = CGPointZero.x;
    v15.origin.double y = y;
    v15.size.width = v9;
    v15.size.height = v9;
    CGPathAddEllipseInRect(Mutable, 0, v15);
    [v6 setPath:Mutable];
    CGPathRelease(Mutable);
    double v11 = +[CRLColor whiteColor];
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v11, "CGColor"));

    unint64_t v5 = +[CRLColor blackColor];
    [v6 setStrokeColor:[v5 CGColor]];
    double v4 = v6;
  }

  if (self->_tag - 12 <= 4)
  {
    [(CRLCanvasRenderable *)self->_renderable zPosition];
    [v4 setZPosition:v12 + 1.0];
  }

  return v4;
}

- (CGRect)unscaledBoundingBoxOfHitRegionWithAdditionalScale:(double)a3
{
  unint64_t v5 = [(CRLCanvasKnob *)self rep];
  if (!self->_hitRegionPath) {
    [(CRLCanvasKnob *)self updateHitRegionPath];
  }
  [(CRLCanvasKnob *)self position];
  [v5 convertNaturalPointToUnscaledCanvas];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v10 = [v5 canvas];
  [v10 viewScale];
  CGFloat v12 = 1.0 / v11 * a3;

  [(CRLBezierPath *)self->_hitRegionPath bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGAffineTransformMakeScale(&v29, v12, v12);
  v30.origin.CGFloat x = v14;
  v30.origin.CGFloat y = v16;
  v30.size.CGFloat width = v18;
  v30.size.CGFloat height = v20;
  CGRect v31 = CGRectApplyAffineTransform(v30, &v29);
  CGRect v32 = CGRectOffset(v31, v7, v9);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (BOOL)i_userInteractionAllowed
{
  double v3 = [(CRLCanvasKnob *)self rep];
  double v4 = [v3 interactiveCanvasController];
  if ([(CRLCanvasKnob *)self worksWhenRepLocked]
    || ([v3 isLocked] & 1) == 0)
  {
    if ([(CRLCanvasKnob *)self worksWhenDocumentIsSharedReadOnly]) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = [v4 documentIsSharedReadOnly] ^ 1;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  double v6 = [v4 layerHost];
  CGFloat v7 = [v6 asiOSCVC];

  if (v5)
  {
    if ([(CRLCanvasKnob *)self worksWhenInMediaBrowsingMode]) {
      LOBYTE(v8) = 1;
    }
    else {
      unsigned int v8 = [v7 inMediaBrowsingMode] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (double)p_rotationInDegrees
{
  double v3 = [(CRLCanvasKnob *)self rep];
  unint64_t v4 = [(CRLCanvasKnob *)self tag];
  unsigned int v5 = [v3 layout];
  double v6 = v5;
  if (v5)
  {
    [v5 transformInRoot];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  BOOL v7 = sub_10007F7EC((double *)&v13);

  if (v7) {
    unint64_t v4 = sub_100289B08(v4);
  }
  double v8 = 0.0;
  if (v4 - 1 <= 0xB) {
    double v8 = dbl_1011773E0[v4 - 1];
  }
  [v3 additionalRotationForKnobOrientation:v13, v14, v15];
  sub_100065C2C(v8 + v9);
  double v11 = v10;

  return v11;
}

- (void)updateHitRegionPath
{
  hitRegionPath = self->_hitRegionPath;
  self->_hitRegionPath = 0;

  unint64_t v4 = [(CRLCanvasKnob *)self rep];
  [(CRLCanvasKnob *)self radius];
  double v6 = v5;
  if (([v4 canUseSpecializedHitRegionForKnob:self] & 1) == 0) {
    goto LABEL_26;
  }
  [v4 boundsForStandardKnobs];
  double v8 = v7;
  double v10 = v9;
  double v11 = [v4 interactiveCanvasController];
  [v11 viewScale];
  double v13 = v12;

  long long v14 = [v4 interactiveCanvasController];
  [v14 viewScale];
  double v16 = v6 / v15 * 10.0;

  if ([(CRLCanvasKnob *)self tag] >= 0xC && [(CRLCanvasKnob *)self tag] <= 0x10)
  {
    if (v8 < v16 || v10 < v16)
    {
      double v18 = -15.0;
      double v19 = -15.0;
      double v20 = 30.0;
      double v21 = 30.0;
LABEL_27:
      +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v18, v19, v20, v21);
      unsigned int v24 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_26:
    double v18 = -(v6 + v6);
    double v20 = v6 + v6 + v6 + v6;
    double v19 = v18;
    double v21 = v20;
    goto LABEL_27;
  }
  double v22 = v6 / v13 + v6 / v13;
  if (v8 < v22 || v10 < v22)
  {
    +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -15.0, -15.0, 30.0, 45.0);
    unsigned int v24 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
    float v25 = v8;
    float v26 = v10;
    memset(&v37.c, 0, 32);
    if (fminf(v25, v26) >= 30.0) {
      double v27 = 3.75;
    }
    else {
      double v27 = 7.5;
    }
    *(_OWORD *)&v37.a = 0uLL;
    [(CRLCanvasKnob *)self p_rotationInDegrees];
    CGAffineTransformMakeRotation(&v37, v28 * 0.0174532925);
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeTranslation(&v36, v37.tx + v27 * v37.c + v37.a * 0.0, v37.ty + v27 * v37.d + v37.b * 0.0);
    CGAffineTransform t1 = v37;
    CGAffineTransform v33 = v36;
    CGAffineTransformConcat(&v35, &t1, &v33);
    CGAffineTransform v29 = &v35;
  }
  else
  {
    if (v8 >= v16 && v10 >= v16) {
      goto LABEL_26;
    }
    +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -v6, -v6, v6 + v6, v6 * 3.0);
    unsigned int v24 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
    memset(&v37, 0, sizeof(v37));
    [(CRLCanvasKnob *)self p_rotationInDegrees];
    CGAffineTransformMakeRotation(&v37, v31 * 0.0174532925);
    CGAffineTransform v36 = v37;
    CGAffineTransform v29 = &v36;
  }
  [(CRLBezierPath *)v24 transformUsingAffineTransform:v29];
LABEL_28:
  CGRect v32 = self->_hitRegionPath;
  self->_hitRegionPath = v24;
}

- (void)setHitRegionPath:(id)a3
{
  if (self->_hitRegionPath != a3)
  {
    unint64_t v4 = (CRLBezierPath *)[a3 copy];
    hitRegionPath = self->_hitRegionPath;
    self->_hitRegionPath = v4;
  }
}

- (CRLCursor)resizeCursor
{
  [(CRLCanvasKnob *)self p_rotationInDegrees];
  unint64_t v4 = sub_1002897DC(v3) - 1;
  if (v4 <= 8 && ((0x1EFu >> v4) & 1) != 0)
  {
    uint64_t v6 = qword_101177440[v4];
    [(CRLCanvasKnob *)self cursorActiveScaledRect];
    double v5 = +[CRLCursor cursorForResizeType:activeScaledRect:](CRLCursor, "cursorForResizeType:activeScaledRect:", v6);
  }
  else
  {
    double v5 = 0;
  }

  return (CRLCursor *)v5;
}

- (CGRect)cursorActiveScaledRect
{
  double v3 = [(CRLCanvasKnob *)self rep];
  unint64_t v4 = [(CRLCanvasKnob *)self hitRegionPath];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if ([v3 canUseSpecializedHitRegionForKnob:self])
  {
    double v13 = [(CRLCanvasKnob *)self p_scaledPreciseHitRegionForInputType:0];
    [v13 bounds];
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
  }
  double v18 = [v3 interactiveCanvasController];
  [(CRLCanvasKnob *)self position];
  [v3 convertNaturalPointToUnscaledCanvas:];
  [v18 convertUnscaledToBoundsPoint:];
  double v20 = sub_100064698(v6, v8, v19);
  double v22 = v21;

  double v23 = v20;
  double v24 = v22;
  double v25 = v10;
  double v26 = v12;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CRLCursor)rotateCursor
{
  [(CRLCanvasKnob *)self p_rotationInDegrees];
  unint64_t v4 = sub_1002897DC(v3) - 1;
  if (v4 <= 8 && ((0x1EFu >> v4) & 1) != 0)
  {
    uint64_t v6 = qword_101177488[v4];
    [(CRLCanvasKnob *)self cursorActiveScaledRect];
    double v5 = +[CRLCursor cursorForRotateType:activeScaledRect:](CRLCursor, "cursorForRotateType:activeScaledRect:", v6);
  }
  else
  {
    double v5 = 0;
  }

  return (CRLCursor *)v5;
}

- (BOOL)transferCursorInsideStateIfDesiredFromKnob:(id)a3
{
  return 0;
}

- (CGRect)frameForIntersection
{
  CFStringRef v2 = [(CRLCanvasKnob *)self renderable];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)overlapsWithKnob:(id)a3
{
  id v4 = a3;
  [(CRLCanvasKnob *)self frameForIntersection];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [v4 frameForIntersection];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  uint64_t v25 = v14;
  uint64_t v26 = v16;
  uint64_t v27 = v18;
  uint64_t v28 = v20;

  return CGRectIntersectsRect(*(CGRect *)&v21, *(CGRect *)&v25);
}

- (BOOL)obscuresKnob:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 renderable];

  if (v5)
  {
    uint64_t v6 = [(CRLCanvasKnob *)self renderable];
    [v6 zPosition];
    double v8 = v7;
    uint64_t v9 = [v4 renderable];
    [v9 zPosition];
    BOOL v11 = v8 > v10;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(CRLCanvasKnob *)self tag];
  [(CRLCanvasKnob *)self position];
  uint64_t v5 = NSStringFromCGPoint(v9);
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p tag=%tu position=%@>", v3, self, v4, v5];

  return v6;
}

- (CGPoint)pixelAlignedScaledCanvasCenterPositionFromKnobPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(CRLCanvasKnob *)self rep];
  double v7 = [v6 interactiveCanvasController];
  [v6 convertKnobPositionToUnscaledCanvas:x, y];
  [v7 convertUnscaledToBoundsPoint:];
  double v9 = v8;
  double v11 = v10;
  if ([(CRLCanvasKnob *)self shouldDisplayDirectlyOverRep])
  {
    uint64_t v12 = [(CRLCanvasKnob *)self rep];
    uint64_t v13 = [v12 parentRep];
    [v13 layerFrameInScaledCanvas];
    double v9 = sub_100064680(v9, v11, v14);
    double v11 = v15;
  }
  uint64_t v16 = [(CRLCanvasKnob *)self renderable];
  [v16 bounds];
  double v21 = sub_100065738(v17, v18, v19, v20);
  double v22 = sub_100064680(v9, v11, v21);
  double v24 = v23;
  uint64_t v25 = [v7 canvas];
  [v25 contentsScale];
  double v27 = sub_100067528(v22, v24, v26);
  double v29 = sub_100064698(v27, v28, v21);
  double v31 = v30;

  double v32 = v29;
  double v33 = v31;
  result.double y = v33;
  result.double x = v32;
  return result;
}

- (CRLCanvasRep)rep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);

  return (CRLCanvasRep *)WeakRetained;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (BOOL)offsetValid
{
  return self->_offsetValid;
}

- (void)setOffsetValid:(BOOL)a3
{
  self->_offsetValid = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (BOOL)worksWhenRepLocked
{
  return self->_worksWhenRepLocked;
}

- (void)setWorksWhenRepLocked:(BOOL)a3
{
  self->_worksWhenRepLocked = a3;
}

- (BOOL)worksWhenEditingDisabled
{
  return self->_worksWhenEditingDisabled;
}

- (void)setWorksWhenEditingDisabled:(BOOL)a3
{
  self->_worksWhenEditingDisabled = a3;
}

- (BOOL)worksWithStylus
{
  return self->_worksWithStylus;
}

- (void)setWorksWithStylus:(BOOL)a3
{
  self->_worksWithStylus = a3;
}

- (BOOL)worksWhenInMediaBrowsingMode
{
  return self->_worksWhenInMediaBrowsingMode;
}

- (void)setWorksWhenInMediaBrowsingMode:(BOOL)a3
{
  self->_worksWhenInMediaBrowsingMode = a3;
}

- (BOOL)worksWithMultipleTaps
{
  return self->_worksWithMultipleTaps;
}

- (void)setWorksWithMultipleTaps:(BOOL)a3
{
  self->_worksWithMultipleTaps = a3;
}

- (BOOL)shouldDisplayDirectlyOverRep
{
  return self->_shouldDisplayDirectlyOverRep;
}

- (void)setShouldDisplayDirectlyOverRep:(BOOL)a3
{
  self->_shouldDisplayDirectlyOverRep = a3;
}

- (BOOL)wantsToFadeDuringZoom
{
  return self->_wantsToFadeDuringZoom;
}

- (void)setWantsToFadeDuringZoom:(BOOL)a3
{
  self->_wantsToFadeDuringZoom = a3;
}

- (CRLBezierPath)hitRegionPath
{
  return self->_hitRegionPath;
}

- (void)setWorksWhenDocumentIsSharedReadOnly:(BOOL)a3
{
  self->_worksWhenDocumentIsSharedReadOnldouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitRegionPath, 0);
  objc_destroyWeak((id *)&self->_rep);

  objc_storeStrong((id *)&self->_renderable, 0);
}

@end