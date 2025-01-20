@interface CRLShapeLineSegmentKnobTracker
- (BOOL)didChangeGeometry;
- (BOOL)resizeFromCenter;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)snapAngles;
- (BOOL)snapEnabled;
- (CRLShapeLineSegmentKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (id)currentGeometry;
- (id)p_HUDLabelText;
- (void)beginMovingKnob;
- (void)dealloc;
- (void)endMovingKnob;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)moveKnobToRepPosition:(CGPoint)a3;
- (void)p_cancelDelayedHUDAndGuides;
- (void)p_enforceMinimumLength;
- (void)p_hideHUD;
- (void)p_updateHUD;
- (void)p_validateLayout;
- (void)setResizeFromCenter:(BOOL)a3;
- (void)setSnapAngles:(BOOL)a3;
- (void)setSnapEnabled:(BOOL)a3;
@end

@implementation CRLShapeLineSegmentKnobTracker

- (CRLShapeLineSegmentKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  v8 = [(CRLCanvasKnobTracker *)&v39 initWithRep:v6 knob:v7];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9860);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101097A60();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9880);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker initWithRep:knob:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:54 isFatal:0 description:"wrong rep class for line segment knob tracker"];
    }
    if ([v7 tag] != (id)11 && objc_msgSend(v7, "tag") != (id)10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E98A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010979D8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E98C0);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker initWithRep:knob:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:55 isFatal:0 description:"wrong knob for line segment knob tracker"];
    }
    v15 = [v6 layout];
    unsigned __int8 v16 = [v15 pathIsLineSegment];

    if ((v16 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E98E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101097950();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9900);
      }
      v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker initWithRep:knob:]");
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 56, 0, "shape is not a line segment, but using line segment knob tracker");
    }
    v8[80] = 1;
    v20 = [v8 shapeRep];
    v21 = [v20 shapeLayout];

    v22 = v8 + 128;
    if ([v7 tag] == (id)11)
    {
      [v21 unclippedHeadPoint];
      void *v22 = v23;
      *((void *)v8 + 17) = v24;
      *((_OWORD *)v8 + 6) = *(_OWORD *)v22;
      [v21 unclippedTailPoint];
    }
    else
    {
      [v21 unclippedTailPoint];
      void *v22 = v27;
      *((void *)v8 + 17) = v28;
      *((_OWORD *)v8 + 6) = *(_OWORD *)v22;
      [v21 unclippedHeadPoint];
    }
    *((void *)v8 + 14) = v25;
    *((void *)v8 + 15) = v26;
    [v21 unclippedTailPoint];
    double v30 = v29;
    double v32 = v31;
    [v21 unclippedHeadPoint];
    *((double *)v8 + 18) = sub_100065E00(v30, v32, v33, v34, 0.5);
    *((void *)v8 + 19) = v35;
    [v21 pathBounds];
    *((void *)v8 + 20) = v36;
    *((void *)v8 + 21) = v37;
  }
  return (CRLShapeLineSegmentKnobTracker *)v8;
}

- (void)dealloc
{
  [(CRLShapeLineSegmentKnobTracker *)self p_cancelDelayedHUDAndGuides];
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  [(CRLCanvasKnobTracker *)&v3 dealloc];
}

- (id)currentGeometry
{
  objc_super v3 = [(CRLShapeLineSegmentKnobTracker *)self shapeRep];
  v4 = [v3 shapeLayout];

  unsigned int v5 = [(CRLShapeLineSegmentKnobTracker *)self resizeFromCenter];
  id v6 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalFixedPoint;
  if (v5) {
    id v6 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalMiddlePoint;
  }
  id v7 = (double *)((char *)self + *v6);
  double v8 = *v7;
  double v9 = v7[1];
  memset(&v19, 0, sizeof(v19));
  sub_10007FD8C(0, (uint64_t)&v19, v8, v9, self->mOriginalKnobCenter.x, self->mOriginalKnobCenter.y, v8, v9, self->mNewKnobCenter.x, self->mNewKnobCenter.y);
  v10 = [v4 originalPureGeometry];
  v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  CGAffineTransform v16 = v19;
  sub_10007FBA4(&v16, v17, &v18);
  CGAffineTransform v19 = v18;

  v12 = [v4 originalPureGeometry];
  CGAffineTransform v18 = v19;
  v13 = [v12 geometryByTransformingBy:&v18];
  v14 = [[CRLCanvasInfoGeometry alloc] initWithLayoutGeometry:v13];

  return v14;
}

- (void)beginMovingKnob
{
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  [(CRLCanvasKnobTracker *)&v6 beginMovingKnob];
  objc_super v3 = [(CRLShapeLineSegmentKnobTracker *)self shapeRep];
  v4 = [v3 dynamicMoveLineSegmentDidBegin];
  mResizingLayout = self->mResizingLayout;
  self->mResizingLayout = v4;

  [(CRLShapeLineSegmentKnobTracker *)self performSelector:"p_showHUDAndGuidesAfterDelay:" withObject:0 afterDelay:0.5];
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v4 = [(CRLCanvasKnobTracker *)self rep];
  unsigned int v5 = [v4 layout];
  objc_super v6 = v5;
  if (v5) {
    [v5 originalTransformInRoot];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CGAffineTransformInvert(&v11, &v10);
  float64x2_t v9 = vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x));

  [(CRLShapeLineSegmentKnobTracker *)self moveKnobToRepPosition:*(_OWORD *)&v9];
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(CRLShapeLineSegmentKnobTracker *)self shapeRep];
  id v7 = [v6 interactiveCanvasController];
  double v8 = [v7 guideController];

  if ([(CRLShapeLineSegmentKnobTracker *)self snapEnabled]) {
    unsigned int v9 = ![(CRLCanvasKnobTracker *)self isInspectorDrivenTracking];
  }
  else {
    unsigned int v9 = 0;
  }
  if ([(CRLShapeLineSegmentKnobTracker *)self snapAngles]) {
    unsigned int v10 = ![(CRLCanvasKnobTracker *)self isInspectorDrivenTracking];
  }
  else {
    unsigned int v10 = 0;
  }
  int v11 = v10;
  if (v9)
  {
    if (self->mBeganAlignmentOperation)
    {
      int v11 = 1;
    }
    else
    {
      int v11 = 1;
      if ([v6 wantsGuidesWhileResizing])
      {
        [v8 beginAlignmentOperationForRep:v6];
        self->mBeganAlignmentOperation = 1;
      }
    }
  }
  p_mNewKnobCenter = &self->mNewKnobCenter;
  self->mNewKnobCenter.double x = sub_100064698(x, y, self->mOriginalPathBoundsOrigin.x);
  self->mNewKnobCenter.double y = v13;
  [(CRLShapeLineSegmentKnobTracker *)self p_enforceMinimumLength];
  if (!v11)
  {
    uint64_t v21 = -1;
    goto LABEL_30;
  }
  v14 = v8;
  double v87 = p_mNewKnobCenter->x;
  CGFloat v90 = self->mNewKnobCenter.y;
  unsigned int v15 = [(CRLShapeLineSegmentKnobTracker *)self resizeFromCenter];
  CGAffineTransform v16 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalFixedPoint;
  if (v15) {
    CGAffineTransform v16 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalMiddlePoint;
  }
  v17 = (double *)((char *)self + *v16);
  double v93 = *v17;
  double v18 = sub_1000653B4(p_mNewKnobCenter->x, self->mNewKnobCenter.y, *v17, v17[1]);
  uint64_t v19 = 0;
  double v85 = (double)7 * 1.5;
  double v20 = 3.40282347e38;
  uint64_t v21 = -1;
  do
  {
    v22 = [v6 layout:v85];
    uint64_t v23 = [v22 originalPureGeometry];
    uint64_t v24 = v23;
    if (v23) {
      [v23 transform];
    }
    else {
      memset(v103, 0, 48);
    }
    double v25 = sub_10007F788(v103);
    double v26 = sub_1000662E0((double)v19 * 0.785398163 + v25 / -180.0 * 3.14159265);
    double v28 = sub_1000646A4(v26, v27, v18);
    double v30 = v29;

    double v31 = sub_100064698(v28, v30, v93);
    double v33 = v32;
    double v34 = sub_1000653B4(v31, v32, p_mNewKnobCenter->x, self->mNewKnobCenter.y);
    if (v10)
    {
      if (v34 >= v20) {
        goto LABEL_22;
      }
LABEL_21:
      CGFloat v90 = v33;
      double v87 = v31;
      double v20 = v34;
      uint64_t v21 = v19;
      goto LABEL_22;
    }
    if (v34 < v85 && v34 < v20) {
      goto LABEL_21;
    }
LABEL_22:
    ++v19;
  }
  while (v19 != 8);
  p_mNewKnobCenter->double x = v87;
  self->mNewKnobCenter.double y = v90;
  double v8 = v14;
LABEL_30:
  [v6 dynamicallyMovingLineSegmentWithTracker:self];
  [(CRLShapeLineSegmentKnobTracker *)self p_validateLayout];
  if (v9 && self->mBeganAlignmentOperation)
  {
    [(CRLShapeLayout *)self->mResizingLayout alignmentFrame];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    v44 = [v6 layout];
    v45 = [v44 originalPureGeometry];
    v46 = v45;
    if (v45)
    {
      [v45 transform];
      float64x2_t v47 = v100;
      float64x2_t v48 = v101;
      float64x2_t v49 = v102;
    }
    else
    {
      float64x2_t v49 = 0uLL;
      float64x2_t v101 = 0u;
      float64x2_t v102 = 0u;
      float64x2_t v100 = 0u;
      float64x2_t v47 = 0uLL;
      float64x2_t v48 = 0uLL;
    }
    float64x2_t v94 = vaddq_f64(v49, vmlaq_n_f64(vmulq_n_f64(v48, self->mNewKnobCenter.y), v47, p_mNewKnobCenter->x));

    v104.origin.double x = v37;
    v104.origin.double y = v39;
    v104.size.width = v41;
    v104.size.height = v43;
    double v50 = vabdd_f64(v94.f64[0], CGRectGetMinX(v104));
    v105.origin.double x = v37;
    v105.origin.double y = v39;
    v105.size.width = v41;
    v105.size.height = v43;
    double v51 = vabdd_f64(v94.f64[0], CGRectGetMaxX(v105));
    v106.origin.double x = v37;
    v106.origin.double y = v39;
    v106.size.width = v41;
    v106.size.height = v43;
    double v52 = vabdd_f64(v94.f64[1], CGRectGetMinY(v106));
    v107.origin.double x = v37;
    v107.origin.double y = v39;
    v107.size.width = v41;
    v107.size.height = v43;
    double v53 = vabdd_f64(v94.f64[1], CGRectGetMaxY(v107));
    uint64_t v54 = 7;
    if (v52 < v53) {
      uint64_t v54 = 1;
    }
    uint64_t v55 = 9;
    if (v52 < v53) {
      uint64_t v55 = 3;
    }
    if (v50 >= v51) {
      uint64_t v56 = v55;
    }
    else {
      uint64_t v56 = v54;
    }
    v57 = [(CRLCanvasKnobTracker *)self rep];
    unsigned int v58 = [v57 wantsGuidesWhileResizing];

    if (v58)
    {
      uint64_t v91 = v56;
      unsigned int v88 = [(CRLShapeLineSegmentKnobTracker *)self resizeFromCenter];
      v59 = [(CRLCanvasKnobTracker *)self rep];
      v60 = [v59 interactiveCanvasController];
      v61 = [v60 canvasBackground];

      v62 = [v61 alignmentProvider];
      v63 = [(CRLCanvasKnobTracker *)self rep];
      v64 = [v63 interactiveCanvasController];
      unsigned int v65 = [v64 isCanvasBackgroundAlignmentSnappingEnabled];

      if (v65 && v62)
      {
        [v62 alignmentPointForPoint:*(_OWORD *)&v94];
        double v86 = v67;
        double v89 = v66;
        v68 = [v6 layout];
        v69 = [v68 originalPureGeometry];
        v70 = v69;
        uint64_t v56 = v91;
        if (v69) {
          [v69 transform];
        }
        else {
          memset(&v98, 0, sizeof(v98));
        }
        CGAffineTransformInvert(&v99, &v98);
        *(float64x2_t *)p_mNewKnobCenter = vaddq_f64(*(float64x2_t *)&v99.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v99.c, v86), *(float64x2_t *)&v99.a, v89));

        [(CRLShapeLineSegmentKnobTracker *)self p_enforceMinimumLength];
        [v6 dynamicallyMovingLineSegmentWithTracker:self];
        double v71 = CGPointZero.x;
        double v72 = CGPointZero.y;
      }
      else
      {
        uint64_t v56 = v91;
        [v8 snapRectToGuides:v91 forKnobTag:v88 ^ 1 snapSize:v37, v39, v41, v43];
        double v71 = v73;
        double v72 = v74;
      }
    }
    else
    {
      double v71 = CGPointZero.x;
      double v72 = CGPointZero.y;
    }
    switch(v21)
    {
      case 0:
      case 4:
        double v72 = 0.0;
        break;
      case 1:
      case 5:
        if (fabs(v71) <= fabs(v72)) {
          double v71 = v72;
        }
        double v72 = v71;
        break;
      case 2:
      case 6:
        double v71 = 0.0;
        break;
      case 3:
      case 7:
        if (fabs(v71) <= fabs(v72)) {
          double v71 = -v72;
        }
        else {
          double v72 = -v71;
        }
        break;
      default:
        break;
    }
    if (v71 != CGPointZero.x || v72 != CGPointZero.y)
    {
      v75 = v8;
      double v76 = sub_100064698(v94.f64[0], v94.f64[1], v71);
      double v92 = v77;
      double v95 = v76;
      v78 = [v6 layout];
      v79 = [v78 originalPureGeometry];
      v80 = v79;
      if (v79) {
        [v79 transform];
      }
      else {
        memset(&v96, 0, sizeof(v96));
      }
      CGAffineTransformInvert(&v97, &v96);
      *(float64x2_t *)p_mNewKnobCenter = vaddq_f64(*(float64x2_t *)&v97.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v97.c, v92), *(float64x2_t *)&v97.a, v95));

      [(CRLShapeLineSegmentKnobTracker *)self p_enforceMinimumLength];
      switch(v56)
      {
        case 1:
          double v37 = sub_100064698(v37, v39, v71);
          double v39 = v81;
          double v41 = v41 - v71;
          double v43 = v43 - v72;
          break;
        case 3:
          double v39 = v39 + v72;
          double v43 = v43 - v72;
          double v41 = v41 + v71;
          break;
        case 7:
          double v37 = v37 + v71;
          double v41 = v41 - v71;
          goto LABEL_82;
        case 9:
          double v41 = v41 + v71;
LABEL_82:
          double v43 = v43 + v72;
          break;
        default:
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9920);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101097AE8();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9940);
          }
          v82 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v82);
          }
          v83 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker moveKnobToRepPosition:]");
          v84 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"];
          +[CRLAssertionHandler handleFailureInFunction:v83 file:v84 lineNumber:263 isFatal:0 description:"wrong knob type for line segment resize"];

          break;
      }
      [v6 dynamicallyMovingLineSegmentWithTracker:self];
      [(CRLShapeLineSegmentKnobTracker *)self p_validateLayout];
      double v8 = v75;
    }
    [(CRLShapeLineSegmentKnobTracker *)self p_enforceMinimumLength];
    if ([(CRLShapeLineSegmentKnobTracker *)self shouldDisplayGuides]) {
      [v8 showGuidesAlignedWithRect:v56 forKnobTag:1 shouldRenderX:1 shouldRenderY:-[CRLShapeLineSegmentKnobTracker resizeFromCenter](self, "resizeFromCenter") ^ 1 shouldRenderSizeGuides:v37, v39, v41, v43];
    }
    else {
      [v8 hideAlignmentGuides];
    }
  }
  else
  {
    [v8 hideAlignmentGuides];
    [v8 hideSizingGuides];
  }
  [v6 invalidateKnobPositions];
  [(CRLShapeLineSegmentKnobTracker *)self p_cancelDelayedHUDAndGuides];
  [(CRLShapeLineSegmentKnobTracker *)self p_updateHUD];
}

- (BOOL)shouldDisplayGuides
{
  return 1;
}

- (BOOL)didChangeGeometry
{
  return 1;
}

- (BOOL)shouldHideOtherKnobs
{
  if ([(CRLCanvasKnobTracker *)self isInspectorDrivenTracking]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  return [(CRLCanvasKnobTracker *)&v4 shouldHideOtherKnobs];
}

- (void)endMovingKnob
{
  objc_super v3 = [(CRLShapeLineSegmentKnobTracker *)self shapeRep];
  unsigned int v4 = [(CRLShapeLineSegmentKnobTracker *)self didChangeGeometry];
  unsigned int v5 = [(CRLCanvasKnobTracker *)self rep];
  objc_super v6 = [v5 interactiveCanvasController];

  id v7 = [v6 commandController];
  id v8 = [v7 groupingLevel];
  if (v8)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v18 = [CRLCanvasCommandSelectionBehavior alloc];
  uint64_t v19 = [v6 canvasEditor];
  double v20 = [(CRLCanvasCommandSelectionBehavior *)v18 initWithCanvasEditor:v19];

  [v7 openGroupWithSelectionBehavior:v20];
  uint64_t v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"Resize" value:0 table:@"UndoStrings"];
  [v7 setCurrentGroupActionString:v22];

  if (v4)
  {
LABEL_3:
    unsigned int v9 = [(CRLShapeLineSegmentKnobTracker *)self currentGeometry];
    unsigned int v10 = [(CRLCanvasKnobTracker *)self rep];
    int v11 = [v10 infoForTransforming];

    v12 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
    CGFloat v13 = (objc_class *)objc_opt_class();
    v14 = sub_10024715C(v13, v11);
    unsigned int v15 = [(CRLCommandSetInfoGeometry *)v12 initWithBoardItem:v14 geometry:v9];

    [v7 enqueueCommand:v15];
  }
LABEL_4:
  [v3 dynamicMoveLineSegmentDidEndWithTracker:self];
  if (!v8) {
    [v7 closeGroup];
  }
  if (self->mBeganAlignmentOperation)
  {
    CGAffineTransform v16 = [v3 interactiveCanvasController];
    v17 = [v16 guideController];
    [v17 endAlignmentOperation];
  }
  [(CRLShapeLineSegmentKnobTracker *)self p_cancelDelayedHUDAndGuides];
  [(CRLShapeLineSegmentKnobTracker *)self p_hideHUD];
  v23.receiver = self;
  v23.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  [(CRLCanvasKnobTracker *)&v23 endMovingKnob];
}

- (void)p_validateLayout
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  id v4 = [v2 layout];

  objc_super v3 = [v4 layoutController];
  [v3 validateLayoutWithDependencies:v4];
}

- (void)p_enforceMinimumLength
{
  double x = self->mOriginalFixedPoint.x;
  double y = self->mOriginalFixedPoint.y;
  p_mNewKnobCenter = &self->mNewKnobCenter;
  double v5 = self->mNewKnobCenter.x;
  double v6 = self->mNewKnobCenter.y;
  double v7 = sub_1000653B4(x, y, v5, v6);
  double v8 = 1.0;
  if (v7 < 1.0)
  {
    double v9 = 0.0;
    if (v7 >= 0.00999999978)
    {
      double v10 = sub_100064680(v5, v6, x);
      double v8 = sub_100064660(v10, v11);
    }
    double v12 = sub_1000646A4(v8, v9, 1.0);
    p_mNewKnobCenter->double x = sub_100064698(x, y, v12);
    p_mNewKnobCenter->double y = v13;
  }
}

- (id)p_HUDLabelText
{
  objc_super v3 = [(CRLShapeLineSegmentKnobTracker *)self currentGeometry];
  double v4 = sub_1000653B4(self->mOriginalFixedPoint.x, self->mOriginalFixedPoint.y, self->mNewKnobCenter.x, self->mNewKnobCenter.y);
  double v5 = [(CRLCanvasKnobTracker *)self rep];
  double v6 = [v5 interactiveCanvasController];
  [v3 angle];
  double v8 = [v6 unitStringForAngle:sub_100407DFC(v7) andLength:v4];

  return v8;
}

- (void)p_updateHUD
{
  if (![(CRLCanvasKnobTracker *)self isInspectorDrivenTracking])
  {
    objc_super v3 = [(CRLCanvasKnobTracker *)self rep];
    id v7 = [v3 interactiveCanvasController];

    double v4 = +[CRLCanvasHUDController sharedHUDController];
    double v5 = [(CRLShapeLineSegmentKnobTracker *)self p_HUDLabelText];
    [v4 setLabelText:v5];

    double v6 = [v7 canvasView];
    [(CRLCanvasKnobTracker *)self currentPosition];
    [v7 convertUnscaledToBoundsPoint:];
    [v4 showHUDForKey:self forTouchPoint:v6 inCanvasView:v4 withUpwardsNudge:v4];
  }
}

- (void)p_hideHUD
{
  id v3 = +[CRLCanvasHUDController sharedHUDController];
  [v3 hideHUDForKey:self];
}

- (void)p_cancelDelayedHUDAndGuides
{
}

- (BOOL)snapEnabled
{
  return self->mSnapEnabled;
}

- (void)setSnapEnabled:(BOOL)a3
{
  self->mSnapEnabled = a3;
}

- (BOOL)snapAngles
{
  return self->mSnapAngles;
}

- (void)setSnapAngles:(BOOL)a3
{
  self->mSnapAngles = a3;
}

- (BOOL)resizeFromCenter
{
  return self->mResizeFromCenter;
}

- (void)setResizeFromCenter:(BOOL)a3
{
  self->mResizeFromCenter = a3;
}

- (void).cxx_destruct
{
}

@end