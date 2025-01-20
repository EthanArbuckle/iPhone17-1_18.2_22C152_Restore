@interface CRLCanvasSpacingGuide
- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5;
- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3;
- (CRLCanvasSpacing)parentSpacing;
- (id)description;
- (id)initForEdge:(int)a3 ofGeneratingObjectRect:(CGRect)a4 andParentSpacing:(id)a5;
- (id)renderableWithICC:(id)a3;
- (int64_t)compare:(id)a3;
- (void)setParentSpacing:(id)a3;
@end

@implementation CRLCanvasSpacingGuide

- (id)initForEdge:(int)a3 ofGeneratingObjectRect:(CGRect)a4 andParentSpacing:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  double v12 = 0.0;
  if (a3 > 5)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    double v23 = 0.0;
    goto LABEL_31;
  }
  if (((1 << a3) & 5) != 0)
  {
    v16 = +[CRLSwappableAxesGeometry standardAxesGeometry];
  }
  else
  {
    if (((1 << a3) & 0x12) != 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FC480);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B6D10();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FC4A0);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasSpacingGuide.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 45, 0, "if you are creating a center spacing guide, use CRLCanvasCenterAlignmentGuide");

      goto LABEL_16;
    }
    v16 = +[CRLSwappableAxesGeometry swappedAxesGeometry];
  }
  v17 = v16;
  objc_storeWeak((id *)&self->mVerticalGeom, v16);

LABEL_16:
  if (((1 << a3) & 9) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    [WeakRetained rectMinX:x y:y width:width height:height];
    double v26 = v25;
    [v11 exactOffset];
    double v12 = v26 - v27;

    v19 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    [v19 rectMaxX:x, y, width, height];
    double v29 = v28;
    [v11 exactOffset];
    uint64_t v21 = 0;
    double v23 = v29 + v30;
    uint64_t v22 = 1;
  }
  else if (((1 << a3) & 0x12) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC4C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6C7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC4E0);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v18);
    }
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasSpacingGuide.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 69, 0, "if you are creating a center spacing guide, use CRLCanvasCenterAlignmentGuide");

    uint64_t v21 = 0;
    uint64_t v22 = 0;
    double v23 = 0.0;
  }
  else
  {
    id v31 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    [v31 rectMaxX:x, y, width, height];
    double v33 = v32;
    [v11 exactOffset];
    double v12 = v33 + v34;

    v19 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    [v19 rectMinX:x y:y width:width height:height];
    double v36 = v35;
    [v11 exactOffset];
    uint64_t v22 = 0;
    double v23 = v36 - v37;
    uint64_t v21 = 1;
  }

LABEL_31:
  id v38 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  BOOL v39 = sub_1004BB3CC((int)[v38 horizontalOrientation]);
  v44.receiver = self;
  v44.super_class = (Class)CRLCanvasSpacingGuide;
  v40 = [(CRLCanvasAlignmentGuide *)&v44 initWithType:v39 offset:v12];

  if (v40)
  {
    [(CRLCanvasAlignmentGuide *)v40 setSnapsToMax:v22];
    [(CRLCanvasAlignmentGuide *)v40 setSnapsToMid:0];
    [(CRLCanvasAlignmentGuide *)v40 setSnapsToMin:v21];
    [(CRLCanvasAlignmentGuide *)v40 setInfinite:0];
    id v41 = objc_loadWeakRetained((id *)&v40->mVerticalGeom);
    [v41 rectMinY:x y:y width:width height:height];
    -[CRLCanvasAlignmentGuide setStart:](v40, "setStart:");

    id v42 = objc_loadWeakRetained((id *)&v40->mVerticalGeom);
    [v42 rectMaxY:x, y, width, height];
    -[CRLCanvasAlignmentGuide setEnd:](v40, "setEnd:");

    v40->mGeneratingObjectRect.origin.double x = x;
    v40->mGeneratingObjectRect.origin.double y = y;
    v40->mGeneratingObjectRect.size.double width = width;
    v40->mGeneratingObjectRect.size.double height = height;
    v40->mOppositeOffset = v23;
    [(CRLCanvasSpacingGuide *)v40 setParentSpacing:v11];
  }

  return v40;
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = *(void *)&a3;
  p_mVerticalGeom = &self->mVerticalGeom;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  [WeakRetained makeHorizontalSpacingRectBetweenRect:self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height x:x y:y width:width height:height];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v21 = objc_loadWeakRetained((id *)p_mVerticalGeom);
  unsigned int v22 = [v21 rect:self->mGeneratingObjectRect.origin.x horizontallyOverlapsRect:self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, x, y, width, height];

  if (!v22) {
    return 0;
  }
  double v29 = height;
  id v23 = objc_loadWeakRetained((id *)p_mVerticalGeom);
  [v23 rectHeight:v14, v16, v18, v20];
  double v25 = v24;

  if (v25 <= 1.0) {
    return 0;
  }
  if (sub_10006525C(v14, v16, v18, v20, self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height))
  {
    return 0;
  }
  if (sub_10006525C(v14, v16, v18, v20, x, y, width, v29)) {
    return 0;
  }
  id v26 = objc_loadWeakRetained((id *)&self->mParentSpacing);
  unsigned int v27 = [v26 containsNonIntersectingSpacingRectsWithRect:v9 forEdge:v14];

  if (!v27) {
    return 0;
  }
  v31.receiver = self;
  v31.super_class = (Class)CRLCanvasSpacingGuide;
  return -[CRLCanvasAlignmentGuide canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](&v31, "canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", v9, x, y, width, v29, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double mOppositeOffset = self->mOppositeOffset;
  p_mVerticalGeom = &self->mVerticalGeom;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  [WeakRetained rectMinX:x, y, width, height];
  if (mOppositeOffset <= v11)
  {
    BOOL v15 = 0;
  }
  else
  {
    double v12 = self->mOppositeOffset;
    id v13 = objc_loadWeakRetained((id *)p_mVerticalGeom);
    [v13 rectMaxX:x, y, width, height];
    BOOL v15 = v12 < v14;
  }
  return sub_10006525C(self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, x, y, width, height)&& v15;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(CRLCanvasSpacingGuide *)self parentSpacing];
  v6 = [v4 parentSpacing];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (id)renderableWithICC:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  [WeakRetained makeHorizontalSpacingRectBetweenRect:self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, self->super.super.mSnappingObjectFrame.origin.x, self->super.super.mSnappingObjectFrame.origin.y, self->super.super.mSnappingObjectFrame.size.width, self->super.super.mSnappingObjectFrame.size.height];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  mRenderable = self->super.mRenderable;
  if (!mRenderable)
  {
    BOOL v15 = +[CRLCanvasRenderable renderable];
    double v16 = self->super.mRenderable;
    self->super.mRenderable = v15;

    [(CRLCanvasRenderable *)self->super.mRenderable setEdgeAntialiasingMask:0];
    double v17 = +[CRLColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.0];
    -[CRLCanvasRenderable setBackgroundColor:](self->super.mRenderable, "setBackgroundColor:", [v17 CGColor]);

    -[CRLCanvasRenderable setPosition:](self->super.mRenderable, "setPosition:", CGPointZero.x, CGPointZero.y);
    double v18 = [(CRLCanvasSpacingGuide *)self parentSpacing];
    double v19 = [v18 spacingRectsRenderableForGuideRect:v4 withICC:v7, v9, v11, v13];

    if (v19) {
      [(CRLCanvasRenderable *)self->super.mRenderable addSubrenderable:v19];
    }
    double v20 = [CRLCanvasSpacingGuideUILayer alloc];
    id v21 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    unsigned int v22 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:](v20, "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", [v21 horizontalOrientation], v4, 1, v7, v9, v11, v13);
    mSpacingUILayer = self->mSpacingUILayer;
    self->mSpacingUILayer = v22;

    double v24 = self->super.mRenderable;
    double v25 = +[CRLCanvasRenderable renderableFromLayer:self->mSpacingUILayer];
    [(CRLCanvasRenderable *)v24 addSubrenderable:v25];

    self->super.super.mLocationInvalidated = 1;
    mRenderable = self->super.mRenderable;
  }
  id v26 = [(CRLCanvasSpacingGuide *)self parentSpacing];
  unsigned int v27 = [v26 spacingRectsRenderableForGuideRect:v4 withICC:v7, v9, v11, v13];
  [(CRLCanvasRenderable *)mRenderable addSubrenderable:v27];

  if (self->super.super.mLocationInvalidated)
  {
    double v28 = [(CRLCanvasSpacingGuide *)self parentSpacing];
    [v28 updateSpacingUIWithICC:v4];

    -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](self->mSpacingUILayer, "setFrameFromSpacingRect:icc:", v4, v7, v9, v11, v13);
    self->super.super.mLocationInvalidated = 0;
  }
  double v29 = self->super.mRenderable;

  return v29;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(CRLCanvasAlignmentGuide *)self guideType]) {
    CFStringRef v5 = @"vertical";
  }
  else {
    CFStringRef v5 = @"horizontal";
  }
  if ([(CRLCanvasAlignmentGuide *)self snapsToMin]) {
    CFStringRef v6 = @"min";
  }
  else {
    CFStringRef v6 = @"max";
  }
  [(CRLCanvasAbstractGuide *)self offset];
  uint64_t v8 = v7;
  double v9 = [(CRLCanvasSpacingGuide *)self parentSpacing];
  [v9 exactOffset];
  uint64_t v11 = v10;
  double v12 = NSStringFromCGRect(self->mGeneratingObjectRect);
  double v13 = +[NSString stringWithFormat:@"<%@ %p: %@ %@ spacing guide with offset %f parentOffset %f from SpacingRect: %@>", v4, self, v5, v6, v8, v11, v12];

  return v13;
}

- (CRLCanvasSpacing)parentSpacing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParentSpacing);

  return (CRLCanvasSpacing *)WeakRetained;
}

- (void)setParentSpacing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mVerticalGeom);
  objc_storeStrong((id *)&self->mSpacingUILayer, 0);

  objc_destroyWeak((id *)&self->mParentSpacing);
}

@end