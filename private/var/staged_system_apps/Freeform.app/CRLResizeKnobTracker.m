@interface CRLResizeKnobTracker
- (BOOL)allowHUDToDisplay;
- (BOOL)canCenterResize;
- (BOOL)canMoveKnobAcrossOpposite;
- (BOOL)currentlyPreservingAspectRatio;
- (BOOL)hasHorizontalFlip;
- (BOOL)hasVerticalFlip;
- (BOOL)i_shouldForceDrag;
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)isInspectorDrivenTracking;
- (BOOL)isMinimumSizeFixed;
- (BOOL)p_isMatchingSize;
- (BOOL)p_isResizingHeightFromCenter;
- (BOOL)p_isResizingWidthFromCenter;
- (BOOL)preserveAspectRatio;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)shouldHideSelectionHighlight;
- (BOOL)shouldResizeFromCenter;
- (BOOL)snapEnabled;
- (BOOL)snapToGuides;
- (BOOL)suppressSecondaryHUD;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (CGAffineTransform)flippedIfNecessaryTransformForLayout:(SEL)a3;
- (CGAffineTransform)p_repTransformInRootForTransforming;
- (CGAffineTransform)p_resizeTransformHandlingFlipping:(SEL)a3;
- (CGAffineTransform)p_transformForLayout:(SEL)a3 flippedIfNecessary:(id)a4;
- (CGAffineTransform)resizeTransform;
- (CGAffineTransform)resizeTransformWithoutUnflipping;
- (CGAffineTransform)transformForLayout:(SEL)a3;
- (CGAffineTransform)transformInRootForStandardKnobs;
- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)secondaryHUDPoint;
- (CGRect)currentBoundsForStandardKnobs;
- (CGRect)i_baseBounds;
- (CGRect)i_lastNewBounds;
- (CGRect)p_simpleResizedRectByMovingKnobTo:(CGPoint)a3;
- (CGSize)currentSizeForLayout:(id)a3;
- (CGSize)maximumSize;
- (CGSize)minimumSize;
- (CRLCanvasRep)repToMatch;
- (CRLResizeKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (NSArray)decoratorOverlayRenderables;
- (NSString)crlaxHudLabelText;
- (NSString)hudLabelText;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)currentGeometryForLayout:(id)a3;
- (id)p_getHudLabelTextForAccessibility:(BOOL)a3;
- (id)repsToTransform;
- (id)resizingLayoutForRep:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applyNewBoundsToPrimaryRep;
- (void)applyNewBoundsToRep:(id)a3;
- (void)beginMovingKnob;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)constrainAndSnapByMovingKnobTo:(CGPoint)a3 snappingToGuides:(BOOL)a4;
- (void)constrainBetweenMaxAndMinSize;
- (void)dealloc;
- (void)endMovingKnob;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)moveKnobToRepPosition:(CGPoint)a3;
- (void)p_beginDynamicResize;
- (void)p_cancelDelayedHUDAndGuides;
- (void)p_flipMagnetNormalizedPositionsIfNeeded;
- (void)p_hideGuideRenderable;
- (void)p_hideHUD;
- (void)p_revertToOriginalMagnetTypeForMagnet:(BOOL)a3 forClineLayout:(id)a4;
- (void)p_setNormalizedPositionForMagnet:(BOOL)a3 withNewNormalizedPosition:(CGPoint)a4 forClineLayout:(id)a5 onLayout:(id)a6;
- (void)p_showHUDAndGuides;
- (void)p_updateGuideRenderable;
- (void)p_updateHUD;
- (void)p_updateMagnetTypeForMagnet:(BOOL)a3 forClineLayout:(id)a4;
- (void)p_validateLayout;
- (void)resizeRepForInspectors:(id)a3 value:(double)a4 changingWidth:(BOOL)a5;
- (void)setCanMoveKnobAcrossOpposite:(BOOL)a3;
- (void)setIsInspectorDrivenTracking:(BOOL)a3;
- (void)setMaximumSize:(CGSize)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)setPreserveAspectRatio:(BOOL)a3;
- (void)setRepToMatch:(id)a3;
- (void)setSecondaryHUDPoint:(CGPoint)a3;
- (void)setShouldResizeFromCenter:(BOOL)a3;
- (void)setSnapEnabled:(BOOL)a3;
- (void)setSnapToGuides:(BOOL)a3;
- (void)setSuppressSecondaryHUD:(BOOL)a3;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLResizeKnobTracker

- (CRLResizeKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CRLResizeKnobTracker;
  v8 = [(CRLCanvasKnobTracker *)&v32 initWithRep:v6 knob:v7];
  v9 = v8;
  if (v8)
  {
    v8->mSnapEnabled = 1;
    [(CRLResizeKnobTracker *)v8 p_repTransformInRootForTransforming];
    *(_OWORD *)&v9->mOriginalTransformInRoot.c = v30;
    *(_OWORD *)&v9->mOriginalTransformInRoot.tx = v31;
    *(_OWORD *)&v9->mOriginalTransformInRoot.a = v29;
    v10 = [(CRLCanvasKnobTracker *)v9 rep];
    [v10 boundsForStandardKnobs];
    v9->mLastNewBounds.origin.x = v11;
    v9->mLastNewBounds.origin.y = v12;
    v9->mLastNewBounds.size.width = v13;
    v9->mLastNewBounds.size.height = v14;
    CGSize size = v9->mLastNewBounds.size;
    v9->mBaseBounds.origin = v9->mLastNewBounds.origin;
    v9->mBaseBounds.CGSize size = size;

    v16 = [(CRLCanvasKnobTracker *)v9 rep];
    v17 = [v16 infoForTransforming];

    if (v17)
    {
      v18 = [(CRLCanvasKnobTracker *)v9 rep];
      v19 = [v18 interactiveCanvasController];
      v20 = [v19 layoutForInfo:v17];

      [v20 minimumSizeForResizingKnob:v7];
      -[CRLResizeKnobTracker setMinimumSize:](v9, "setMinimumSize:");
    }
    v21 = [(CRLCanvasKnobTracker *)v9 rep];
    v22 = [v21 layout];

    uint64_t v23 = objc_opt_class();
    v24 = [v22 parent];
    v25 = sub_1002469D0(v23, v24);

    if (v25)
    {
      [v25 maximumFrameSizeForChild:v22];
    }
    else
    {
      double v26 = INFINITY;
      double v27 = INFINITY;
    }
    -[CRLResizeKnobTracker setMaximumSize:](v9, "setMaximumSize:", v26, v27);
    -[CRLResizeKnobTracker setCanMoveKnobAcrossOpposite:](v9, "setCanMoveKnobAcrossOpposite:", [v6 canFlipDuringResize]);
    [(CRLResizeKnobTracker *)v9 setSnapToGuides:1];
    v9->mAdjustedMagnetsForHorizontalFlip = 0;
    v9->mAdjustedMagnetsForVerticalFlip = 0;
  }
  return v9;
}

- (void)dealloc
{
  [(CRLResizeKnobTracker *)self p_cancelDelayedHUDAndGuides];
  [(CRLCanvasRenderable *)self->mGuideRenderable setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLResizeKnobTracker;
  [(CRLCanvasKnobTracker *)&v3 dealloc];
}

- (CGRect)currentBoundsForStandardKnobs
{
  p_mLastNewBounds = &self->mLastNewBounds;
  double x = self->mLastNewBounds.origin.x;
  double y = self->mLastNewBounds.origin.y;
  CGFloat width = self->mLastNewBounds.size.width;
  CGFloat height = self->mLastNewBounds.size.height;
  if ([(CRLResizeKnobTracker *)self p_isResizingWidthFromCenter]) {
    double x = self->mBaseBounds.origin.x + self->mBaseBounds.size.width * 0.5 - p_mLastNewBounds->size.width * 0.5;
  }
  if ([(CRLResizeKnobTracker *)self p_isResizingHeightFromCenter]) {
    double y = self->mBaseBounds.origin.y + self->mBaseBounds.size.height * 0.5 - p_mLastNewBounds->size.height * 0.5;
  }
  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGAffineTransform)transformInRootForStandardKnobs
{
  long long v3 = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[5].b;
  return self;
}

- (CGSize)currentSizeForLayout:(id)a3
{
  id v4 = a3;
  v5 = [(CRLCanvasKnobTracker *)self rep];
  id v6 = [v5 infoForTransforming];
  id v7 = [v6 geometry];

  if [v7 widthValid] && (objc_msgSend(v7, "heightValid"))
  {
    double v8 = [(CRLCanvasKnobTracker *)self rep];
    id v9 = [v8 layout];

    if (v9 == v4)
    {
      v26.f64[0] = fabs(self->mLastNewBounds.size.width);
      double v20 = fabs(self->mLastNewBounds.size.height);
    }
    else
    {
      CGSize size = self->mBaseBounds.size;
      int8x16_t v11 = (int8x16_t)vceqzq_f64((float64x2_t)size);
      int8x16_t v12 = (int8x16_t)vdivq_f64(vabsq_f64((float64x2_t)self->mLastNewBounds.size), (float64x2_t)size);
      __asm { FMOV            V1.2D, #1.0 }
      float64x2_t v25 = (float64x2_t)vbslq_s8(v11, _Q1, v12);
      [v4 initialBoundsForStandardKnobs];
      v19.f64[1] = v18;
      float64x2_t v26 = vabsq_f64(vmulq_f64(v25, v19));
      double v20 = v26.f64[1];
    }
  }
  else
  {
    [v4 boundsForStandardKnobs];
    v26.f64[0] = v21;
    double v20 = v22;
  }

  double v23 = v26.f64[0];
  double v24 = v20;
  result.CGFloat height = v24;
  result.CGFloat width = v23;
  return result;
}

- (BOOL)hasHorizontalFlip
{
  return self->mLastNewBounds.size.width < 0.0;
}

- (BOOL)hasVerticalFlip
{
  return self->mLastNewBounds.size.height < 0.0;
}

- (BOOL)allowHUDToDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CRLResizeKnobTracker;
  return [(CRLCanvasKnobTracker *)&v3 allowHUDToDisplay];
}

- (BOOL)shouldHideOtherKnobs
{
  if ([(CRLResizeKnobTracker *)self isInspectorDrivenTracking]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLResizeKnobTracker;
  return [(CRLCanvasKnobTracker *)&v4 shouldHideOtherKnobs];
}

- (id)repsToTransform
{
  objc_super v3 = [(CRLCanvasKnobTracker *)self rep];
  objc_super v4 = +[NSMutableSet setWithObject:v3];

  v5 = [(CRLCanvasKnobTracker *)self rep];
  id v6 = [v5 additionalRepsToResize];

  if ([v6 count]) {
    [v4 unionSet:v6];
  }

  return v4;
}

- (CGAffineTransform)resizeTransform
{
  return [(CRLResizeKnobTracker *)self p_resizeTransformHandlingFlipping:1];
}

- (CGAffineTransform)resizeTransformWithoutUnflipping
{
  return [(CRLResizeKnobTracker *)self p_resizeTransformHandlingFlipping:0];
}

- (CGAffineTransform)p_resizeTransformHandlingFlipping:(SEL)a3
{
  BOOL v4 = a4;
  id v7 = [(CRLCanvasKnobTracker *)self rep];
  double v8 = [(CRLCanvasKnobTracker *)self knob];
  id v9 = [v7 adjustedKnobForComputingResizeGeometry:[v8 tag]];

  if ([(CRLResizeKnobTracker *)self p_isResizingWidthFromCenter]) {
    id v9 = (id)(3 * (((unint64_t)v9 - 1) / 3) + 2);
  }
  if ([(CRLResizeKnobTracker *)self p_isResizingHeightFromCenter]) {
    id v9 = (id)((((unint64_t)v9 - 1) % 3) | 4);
  }
  double v10 = dbl_101178E30[((unint64_t)v9 - 1) % 3];
  double v11 = dbl_101178E30[((unint64_t)v9 - 1) / 3];
  unsigned int v12 = [(CRLResizeKnobTracker *)self hasHorizontalFlip];
  unsigned int v13 = [(CRLResizeKnobTracker *)self hasVerticalFlip];
  double width = self->mBaseBounds.size.width;
  double v15 = 1.0;
  double v16 = 1.0;
  if (width != 0.0) {
    double v16 = self->mLastNewBounds.size.width / width;
  }
  double height = self->mBaseBounds.size.height;
  if (height != 0.0) {
    double v15 = self->mLastNewBounds.size.height / height;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(&t1, -v10, -v11);
  CGAffineTransformMakeScale(&t2, v16, v15);
  CGAffineTransformConcat(&v37, &t1, &t2);
  CGAffineTransformMakeTranslation(&v34, v10, v11);
  CGAffineTransformConcat(retstr, &v37, &v34);
  if (v4)
  {
    if (v12)
    {
      CGAffineTransform v32 = *(CGAffineTransform *)byte_101178DD0;
      long long v18 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v31.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v31.c = v18;
      *(_OWORD *)&v31.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&v33, &v32, &v31);
      long long v19 = *(_OWORD *)&v33.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
      *(_OWORD *)&retstr->c = v19;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v33.tx;
    }
    if (v13)
    {
      CGAffineTransform v32 = *(CGAffineTransform *)byte_101178E00;
      long long v20 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v31.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v31.c = v20;
      *(_OWORD *)&v31.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&v33, &v32, &v31);
      long long v21 = *(_OWORD *)&v33.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
      *(_OWORD *)&retstr->c = v21;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v33.tx;
    }
  }
  memset(&v33, 0, sizeof(v33));
  double v22 = [(CRLCanvasKnobTracker *)self rep];
  double v23 = [v22 layout];
  double v24 = [v23 originalPureGeometry];
  float64x2_t v25 = v24;
  if (v24) {
    [v24 fullTransform];
  }
  else {
    memset(&v33, 0, sizeof(v33));
  }

  CGAffineTransform v32 = v33;
  CGAffineTransformInvert(&v29, &v32);
  long long v26 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v32.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v30, &v29, &v32);
  CGAffineTransform v31 = v33;
  CGSize result = CGAffineTransformConcat(&v32, &v30, &v31);
  long long v28 = *(_OWORD *)&v32.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v32.a;
  *(_OWORD *)&retstr->c = v28;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v32.tx;
  return result;
}

- (CGAffineTransform)flippedIfNecessaryTransformForLayout:(SEL)a3
{
  return [(CRLResizeKnobTracker *)self p_transformForLayout:a4 flippedIfNecessary:1];
}

- (CGAffineTransform)transformForLayout:(SEL)a3
{
  return [(CRLResizeKnobTracker *)self p_transformForLayout:a4 flippedIfNecessary:0];
}

- (CGAffineTransform)p_transformForLayout:(SEL)a3 flippedIfNecessary:(id)a4
{
  BOOL v5 = a5;
  id v8 = a4;
  if ([v8 wantsParentResizeTransform])
  {
    uint64_t v9 = objc_opt_class();
    double v10 = [v8 parent];
    double v11 = sub_1002469D0(v9, v10);

    if (v11)
    {
      [(CRLResizeKnobTracker *)self p_transformForLayout:v11 flippedIfNecessary:v5];

      goto LABEL_28;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500A78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE078();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500A98);
    }
    unsigned int v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    unsigned int v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_transformForLayout:flippedIfNecessary:]");
    CGFloat v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 310, 0, "invalid nil value for '%{public}s'", "possibleParentLayout");
  }
  memset(&v33, 0, sizeof(v33));
  if (v5) {
    [(CRLResizeKnobTracker *)self resizeTransformWithoutUnflipping];
  }
  else {
    [(CRLResizeKnobTracker *)self resizeTransform];
  }
  double v15 = [(CRLCanvasKnobTracker *)self rep];
  id v16 = [v15 layout];

  if (v16 == v8)
  {
    long long v27 = *(_OWORD *)&v33.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v33.tx;
  }
  else
  {
    long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v32.c = v17;
    *(_OWORD *)&v32.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    uint64_t v18 = objc_opt_class();
    long long v19 = [v8 parent];
    long long v20 = sub_1002469D0(v18, v19);

    if (v20 && [v20 isBeingManipulated])
    {
      do
      {
        if (![v20 isBeingManipulated]) {
          break;
        }
        long long v21 = [v20 originalPureGeometry];
        double v22 = v21;
        if (v21) {
          [v21 transform];
        }
        else {
          memset(&t2, 0, sizeof(t2));
        }
        CGAffineTransform t1 = v32;
        CGAffineTransformConcat(&v32, &t1, &t2);

        uint64_t v23 = objc_opt_class();
        double v24 = [v20 parent];
        uint64_t v25 = sub_1002469D0(v23, v24);

        long long v20 = (void *)v25;
      }
      while (v25);
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tdouble x = 0u;
      *(_OWORD *)&retstr->a = 0u;
      CGAffineTransform t1 = v33;
      CGAffineTransform v29 = v32;
      sub_10007FC38(&t1, &v29, retstr);
      retstr->tdouble x = 0.0;
      retstr->tdouble y = 0.0;
    }
    else
    {
      long long v26 = *(_OWORD *)&v33.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
      *(_OWORD *)&retstr->c = v26;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v33.tx;
    }
  }
LABEL_28:

  return result;
}

- (id)currentGeometryForLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 computeInfoGeometryDuringResize];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    goto LABEL_23;
  }
  memset(&v37, 0, sizeof(v37));
  id v8 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v9 = [v8 layout];
  [(CRLResizeKnobTracker *)self resizeTransform];
  if (v9) {
    [v9 layoutTransformInInfoSpace:v36];
  }
  else {
    memset(&v37, 0, sizeof(v37));
  }

  double v10 = [(CRLCanvasKnobTracker *)self rep];
  id v11 = [v10 layout];

  if (v11 == v4)
  {
    double v15 = [(CRLCanvasKnobTracker *)self rep];
    CGAffineTransform v35 = v37;
    uint64_t v26 = [v15 resizedGeometryForTransform:&v35];
LABEL_21:
    id v7 = (id)v26;
    goto LABEL_22;
  }
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v35.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v35.c = v12;
  *(_OWORD *)&v35.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  uint64_t v13 = objc_opt_class();
  CGFloat v14 = [v4 parent];
  double v15 = sub_1002469D0(v13, v14);

  if (v15 && [v15 isBeingManipulated])
  {
    do
    {
      if (![v15 isBeingManipulated]) {
        break;
      }
      id v16 = [v15 originalPureGeometry];
      long long v17 = v16;
      if (v16) {
        [v16 transform];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      CGAffineTransform t1 = v35;
      CGAffineTransformConcat(&v35, &t1, &t2);

      uint64_t v18 = objc_opt_class();
      long long v19 = [v15 parent];
      uint64_t v20 = sub_1002469D0(v18, v19);

      double v15 = (void *)v20;
    }
    while (v20);
    memset(&t1, 0, sizeof(t1));
    CGAffineTransform v32 = v37;
    CGAffineTransform v31 = v35;
    sub_10007FC38(&v32, &v31, &t1);
    t1.tdouble x = 0.0;
    t1.tdouble y = 0.0;
    uint64_t v21 = [v4 infoGeometryBeforeDynamicOperation];
    if (v21)
    {
      double v22 = (void *)v21;
    }
    else
    {
      long long v27 = [v4 info];
      double v22 = [v27 geometry];

      if (!v22)
      {
        memset(&v29, 0, sizeof(v29));
        goto LABEL_20;
      }
    }
    [v22 fullTransform];

LABEL_20:
    CGAffineTransform v32 = t1;
    CGAffineTransformConcat(&v30, &v29, &v32);
    uint64_t v26 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v30];
    goto LABEL_21;
  }
  uint64_t v23 = [(CRLCanvasKnobTracker *)self rep];
  double v24 = [v23 interactiveCanvasController];
  uint64_t v25 = [v24 repForLayout:v4];

  [(CRLResizeKnobTracker *)self transformForLayout:v4];
  CGAffineTransform v37 = t1;
  id v7 = [v25 resizedGeometryForTransform:&t1];

LABEL_22:
LABEL_23:

  return v7;
}

- (id)resizingLayoutForRep:(id)a3
{
  return self->mResizingLayout;
}

- (BOOL)canCenterResize
{
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->mGuideRenderable)
  {
    mGuideRenderable = self->mGuideRenderable;
    v2 = +[NSArray arrayWithObjects:&mGuideRenderable count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (void)applyNewBoundsToRep:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasKnobTracker *)self rep];
  id v6 = [v5 interactiveCanvasController];

  id v7 = [v6 commandController];
  id v8 = [v4 layout];
  uint64_t v9 = [v8 finalInfoGeometryForResize];

  if (!v9)
  {
    double v10 = [v4 layout];
    uint64_t v9 = [(CRLResizeKnobTracker *)self currentGeometryForLayout:v10];
  }
  uint64_t v11 = [v4 infoForTransforming];
  long long v12 = (void *)v11;
  BOOL v13 = self->mIsEnqueueingCommandsInRealTime || v11 == 0;
  if (!v13
    && [(CRLCanvasKnobTracker *)self didDrag]
    && ([v12 conformsToProtocol:&OBJC_PROTOCOL___CRLResizingAwareInfo] & 1) == 0)
  {
    id v14 = [v4 newCommandToApplyGeometry:v9 toInfo:v12];
    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500AB8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BE114();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500AD8);
      }
      double v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker applyNewBoundsToRep:]");
      long long v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 439, 0, "invalid nil value for '%{public}s'", "cmd");

      id v14 = 0;
    }
    double v22 = [CRLCanvasCommandSelectionBehavior alloc];
    uint64_t v21 = [v6 canvasEditor];
    uint64_t v18 = [v6 editorController];
    long long v19 = [v18 selectionPath];
    uint64_t v20 = [(CRLCanvasCommandSelectionBehavior *)v22 initWithCanvasEditor:v21 type:2 selectionPath:v19 selectionFlags:4];

    [v7 enqueueCommand:v14 withSelectionBehavior:v20];
  }
  [v4 dynamicResizeDidEndWithTracker:self];
  [v4 invalidateKnobs];
}

- (void)applyNewBoundsToPrimaryRep
{
  objc_super v3 = [(CRLCanvasKnobTracker *)self rep];
  id v4 = [v3 interactiveCanvasController];

  BOOL v5 = [v4 commandController];
  if ([(CRLCanvasKnobTracker *)self didDrag]
    && ![(CRLResizeKnobTracker *)self isInspectorDrivenTracking])
  {
    [v5 openGroup];
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  unsigned int v7 = [(CRLCanvasKnobTracker *)self didDrag];
  id v8 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v9 = v8;
  if (v7)
  {
    double v10 = [v8 actionStringForResize];
    [v5 setCurrentGroupActionString:v10];

    uint64_t v11 = [(CRLCanvasKnobTracker *)self rep];
    [(CRLResizeKnobTracker *)self applyNewBoundsToRep:v11];
  }
  else
  {
    [v8 dynamicResizeDidEndWithTracker:self];

    uint64_t v11 = [(CRLCanvasKnobTracker *)self rep];
    [v11 invalidateKnobs];
  }

  long long v12 = [(CRLCanvasKnobTracker *)self rep];
  BOOL v13 = [v12 layout];
  id v14 = [v13 commandsForAdjustingMagnetsFromClineLayouts];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        [v5 enqueueCommand:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v20 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v21 = [v20 layout];
  double v22 = [v21 connectedLayouts];

  id v23 = [v22 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        [v27 setHeadHasHorizontalFlip:0];
        [v27 setHeadHasVerticalFlip:0];
        [v27 setTailHasHorizontalFlip:0];
        [v27 setTailHasVerticalFlip:0];
      }
      id v24 = [v22 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v24);
  }

  self->mAdjustedMagnetsForHorizontalFlip = 0;
  self->mAdjustedMagnetsForVerticalFlip = 0;
  if (v6) {
    [v5 closeGroup];
  }
  if (self->mIsEnqueueingCommandsInRealTime) {
    [v5 closeGroup];
  }
}

- (NSString)hudLabelText
{
  return (NSString *)[(CRLResizeKnobTracker *)self p_getHudLabelTextForAccessibility:0];
}

- (NSString)crlaxHudLabelText
{
  return (NSString *)[(CRLResizeKnobTracker *)self p_getHudLabelTextForAccessibility:1];
}

- (id)p_getHudLabelTextForAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CRLCanvasKnobTracker *)self rep];
  int v6 = [v5 layout];
  [(CRLResizeKnobTracker *)self currentSizeForLayout:v6];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [(CRLCanvasKnobTracker *)self rep];
  long long v12 = [v11 interactiveCanvasController];
  BOOL v13 = [v12 unitStringForNumber:v8];
  id v14 = [(CRLCanvasKnobTracker *)self rep];
  id v15 = [v14 interactiveCanvasController];
  id v16 = [v15 unitStringForNumber:v10];
  if (![v13 isEqualToString:v16])
  {

LABEL_6:
    goto LABEL_7;
  }
  id v17 = [(CRLCanvasKnobTracker *)self rep];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    uint64_t v11 = [(CRLCanvasKnobTracker *)self rep];
    double v22 = [v11 interactiveCanvasController];
    id v24 = [v22 unitStringForSize:v3 forAccessibility:v8];
    goto LABEL_8;
  }
  long long v19 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v20 = [v19 shapeInfo];
  uint64_t v11 = [v20 pathSource];

  if (![v11 isRectangular])
  {
    if ([v11 isCircular])
    {
      uint64_t v21 = +[NSBundle mainBundle];
      double v22 = v21;
      CFStringRef v23 = @"Circle: %@";
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  uint64_t v21 = +[NSBundle mainBundle];
  double v22 = v21;
  CFStringRef v23 = @"Square: %@";
LABEL_13:
  uint64_t v26 = [v21 localizedStringForKey:v23 value:0 table:0];
  long long v27 = [(CRLCanvasKnobTracker *)self rep];
  long long v28 = [v27 interactiveCanvasController];
  long long v29 = [v28 unitStringForNumber:v8];
  id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v29);

LABEL_8:

  return v24;
}

- (BOOL)shouldHideSelectionHighlight
{
  return ![(CRLResizeKnobTracker *)self isInspectorDrivenTracking];
}

- (BOOL)isMinimumSizeFixed
{
  return 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  id v6 = [(CRLCanvasKnobTracker *)self icc];
  if ([v6 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime])
  {
    id v4 = [(CRLCanvasKnobTracker *)self rep];
    unsigned int v5 = [v4 allowsSupportedDynamicOperationsToBeRealTime];

    if (v5) {
      self->mIsEnqueueingCommandsInRealTime = 1;
    }
  }
  else
  {
  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4 = a3;
  [(CRLCanvasKnobTracker *)self i_resetCurrentPositionToKnobPositionIfAppropriate];
  unsigned int v5 = [(CRLCanvasKnobTracker *)self rep];
  unsigned __int8 v6 = [v5 isBeingResized];

  if ((v6 & 1) == 0) {
    [(CRLResizeKnobTracker *)self p_beginDynamicResize];
  }
  double v7 = [(CRLCanvasKnobTracker *)self icc];
  double v8 = [v7 commandController];

  if (self->mIsEnqueueingCommandsInRealTime) {
    [v8 openGroup];
  }
  if ([(CRLCanvasKnobTracker *)self didDrag])
  {
    double v9 = [(CRLCanvasKnobTracker *)self rep];
    [v9 dynamicallyResizingWithTracker:self];
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLResizeKnobTracker;
  [(CRLCanvasKnobTracker *)&v10 changeDynamicLayoutsForReps:v4];
  if (self->mIsEnqueueingCommandsInRealTime) {
    [v8 closeGroup];
  }
}

- (BOOL)traceIfDesiredForBeginOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_101500AF8);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin resize knob operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_101500B18);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "end resize knob operation", v4, 2u);
  }
  return 1;
}

- (void)beginMovingKnob
{
  v68.receiver = self;
  v68.super_class = (Class)CRLResizeKnobTracker;
  [(CRLCanvasKnobTracker *)&v68 beginMovingKnob];
  BOOL v3 = [(CRLCanvasKnobTracker *)self icc];
  id v4 = [v3 layerHost];
  uint64_t v5 = [v4 asiOSCVC];
  [(id)v5 hideEditMenu];

  unsigned __int8 v6 = [(CRLCanvasKnobTracker *)self rep];
  LOBYTE(v5) = [v6 isBeingResized];

  if ((v5 & 1) == 0) {
    [(CRLResizeKnobTracker *)self p_beginDynamicResize];
  }
  if (![(CRLResizeKnobTracker *)self isInspectorDrivenTracking])
  {
    double v7 = [v3 selectionModelTranslator];
    double v8 = [v3 editorController];
    double v9 = [v8 selectionPath];
    objc_super v10 = [v7 boardItemsForSelectionPath:v9];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v65;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [v3 repForInfo:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          if (v16)
          {
            id v17 = [(CRLCanvasKnobTracker *)self rep];

            if (v16 != v17) {
              [v16 fadeKnobsOut];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v13);
    }

    [(CRLResizeKnobTracker *)self p_updateGuideRenderable];
    [(CRLResizeKnobTracker *)self p_updateHUD];
    [v3 addDecorator:self];
    self->mNeedsHUD = 1;
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(0.5 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004E67BC;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  long long v19 = objc_alloc_init(CRLCanvasHUDController);
  mSecondHUDController = self->mSecondHUDController;
  self->mSecondHUDController = v19;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v21 = [(CRLCanvasKnobTracker *)self rep];
  double v22 = [v21 layout];
  CFStringRef v23 = [v22 connectedLayouts];

  id v24 = [v23 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v60;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v60 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
        if ([v28 headMagnetType] == (id)6)
        {
          long long v29 = [v28 connectedTo];

          if (v29)
          {
            [v28 headMagnetCanvasPosition];
            double v49 = v31;
            double v51 = v30;
            long long v32 = [v28 connectedTo];
            long long v33 = v32;
            if (v32) {
              [v32 transformInRoot];
            }
            else {
              memset(&v57, 0, sizeof(v57));
            }
            CGAffineTransformInvert(&v58, &v57);
            float64x2_t v52 = vaddq_f64(*(float64x2_t *)&v58.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v58.c, v49), *(float64x2_t *)&v58.a, v51));

            long long v34 = [v28 connectedTo];
            long long v35 = [v34 geometry];
            [v35 size];
            double v36 = sub_100064070();
            [v28 overrideHeadMagnetNormalizedPosition:sub_100066AA4(v52.f64[0], v52.f64[1], v36, v37, v38)];

            [v28 setMagnetsAdjusted:1];
          }
        }
        if ([v28 tailMagnetType] == (id)6)
        {
          v39 = [v28 connectedFrom];

          if (v39)
          {
            [v28 tailMagnetCanvasPosition];
            double v50 = v41;
            double v53 = v40;
            v42 = [v28 connectedFrom];
            v43 = v42;
            if (v42) {
              [v42 transformInRoot];
            }
            else {
              memset(&v55, 0, sizeof(v55));
            }
            CGAffineTransformInvert(&v56, &v55);
            float64x2_t v54 = vaddq_f64(*(float64x2_t *)&v56.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v56.c, v50), *(float64x2_t *)&v56.a, v53));

            v44 = [v28 connectedFrom];
            v45 = [v44 geometry];
            [v45 size];
            double v46 = sub_100064070();
            [v28 overrideTailMagnetNormalizedPosition:sub_100066AA4(v54.f64[0], v54.f64[1], v46, v47, v48)];

            [v28 setMagnetsAdjusted:1];
          }
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v25);
  }
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  -[CRLResizeKnobTracker convertKnobPositionFromUnscaledCanvas:](self, "convertKnobPositionFromUnscaledCanvas:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(CRLCanvasKnobTracker *)self knob];
  [v8 offset];
  double v10 = sub_100064680(v5, v7, v9);
  double v12 = v11;

  -[CRLResizeKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:", v10, v12);
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLResizeKnobTracker *)self transformInRootForStandardKnobs];
  float64x2_t v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLResizeKnobTracker *)self transformInRootForStandardKnobs];
  CGAffineTransformInvert(&v8, &v7);
  float64x2_t v3 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, y), *(float64x2_t *)&v8.a, x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  if (self->mResizingLayout)
  {
    double y = a3.y;
    double x = a3.x;
    double v6 = [(CRLCanvasKnobTracker *)self rep];
    if ([v6 wantsGuidesWhileResizing] && !self->mBeganAlignmentOperation)
    {
      unsigned __int8 v44 = [(CRLResizeKnobTracker *)self isInspectorDrivenTracking];

      if ((v44 & 1) == 0)
      {
        v45 = [(CRLCanvasKnobTracker *)self rep];
        double v46 = [v45 interactiveCanvasController];
        double v47 = [v46 guideController];
        double v48 = [(CRLCanvasKnobTracker *)self rep];
        [v47 beginAlignmentOperationForRep:v48];

        self->mBeganAlignmentOperation = 1;
      }
    }
    else
    {
    }
    CGAffineTransform v7 = [(CRLCanvasKnobTracker *)self rep];
    CGAffineTransform v8 = [v7 layout];
    unsigned int v9 = [v8 shouldFlipMagnetsDuringResize];

    if (v9) {
      [(CRLResizeKnobTracker *)self p_flipMagnetNormalizedPositionsIfNeeded];
    }
    -[CRLResizeKnobTracker p_simpleResizedRectByMovingKnobTo:](self, "p_simpleResizedRectByMovingKnobTo:", x, y);
    self->mLastNewBounds.origin.double x = v10;
    self->mLastNewBounds.origin.double y = v11;
    self->mLastNewBounds.size.double width = v12;
    self->mLastNewBounds.size.double height = v13;
    if ([(CRLResizeKnobTracker *)self p_isMatchingSize])
    {
      unsigned int v14 = [(CRLResizeKnobTracker *)self hasHorizontalFlip];
      BOOL mSnapToGuides = [(CRLResizeKnobTracker *)self hasVerticalFlip];
      id v16 = [(CRLResizeKnobTracker *)self repToMatch];
      [v16 boundsForStandardKnobs];
      double v18 = v17;
      double v20 = v19;

      double width = self->mBaseBounds.size.width;
      double height = self->mBaseBounds.size.height;
      CFStringRef v23 = [(CRLCanvasKnobTracker *)self knob];
      id v24 = [v23 tag];

      if (sub_100289AF0((char)v24))
      {
        if ([(CRLResizeKnobTracker *)self currentlyPreservingAspectRatio])
        {
          double v25 = width / height;
          double v26 = sub_100066F2C(1, self->mLastNewBounds.size.width, self->mLastNewBounds.size.height, width, height);
          double v28 = v18 / (width / height) - v27;
          double v29 = sqrt(v25 * v25 * (v28 * v28) + v28 * v28);
          double v30 = -(v26 - v20 * v25) * -(v26 - v20 * v25);
          double v31 = sqrt(v30 / (v25 * v25) + v30);
          BOOL v32 = v29 >= v31;
          BOOL v33 = v29 < v31;
          double v34 = v27 + v28;
          double v35 = v26 - (v26 - v20 * (width / height));
          if (v29 < v31) {
            double v36 = v18;
          }
          else {
            double v36 = v35;
          }
          if (v29 < v31) {
            double v37 = v34;
          }
          else {
            double v37 = v20;
          }
        }
        else
        {
          BOOL v32 = 1;
          double v36 = v18;
          double v37 = v20;
          BOOL v33 = 1;
        }
        BOOL v49 = sub_100064084(v18, v20, v36, v37);
        BOOL v39 = v49 | v32;
        BOOL v38 = v49 | v33;
      }
      else
      {
        if (v24 == (id)8) {
          double v40 = width;
        }
        else {
          double v40 = v18;
        }
        if (v24 == (id)8) {
          double v41 = v20;
        }
        else {
          double v41 = height;
        }
        BOOL v42 = v24 != (id)8;
        BOOL v43 = v24 == (id)2;
        BOOL v39 = v24 == (id)2 || v24 == (id)8;
        BOOL v38 = !v43 && v42;
      }
      double v50 = [(CRLCanvasKnobTracker *)self knob];
      v51.super.isa = (Class)[v50 tag];
      sub_1004E6DAC(v51, v65, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
      self->mLastNewBounds.origin.double x = v52;
      self->mLastNewBounds.origin.double y = v53;
      self->mLastNewBounds.size.double width = v54;
      self->mLastNewBounds.size.double height = v55;

      if (v14) {
        self->mLastNewBounds.size.double width = -self->mLastNewBounds.size.width;
      }
      if (mSnapToGuides)
      {
        BOOL mSnapToGuides = 0;
        self->mLastNewBounds.size.double height = -self->mLastNewBounds.size.height;
      }
    }
    else
    {
      BOOL v38 = 0;
      BOOL v39 = 0;
      BOOL mSnapToGuides = self->mSnapToGuides;
    }
    CGAffineTransform v56 = [(CRLCanvasKnobTracker *)self rep];
    id v63 = [v56 interactiveCanvasController];

    CGAffineTransform v57 = [v63 guideController];
    [v57 hideSizingGuides];

    [(CRLResizeKnobTracker *)self constrainBetweenMaxAndMinSize];
    if (![(CRLResizeKnobTracker *)self isInspectorDrivenTracking])
    {
      -[CRLResizeKnobTracker constrainAndSnapByMovingKnobTo:snappingToGuides:](self, "constrainAndSnapByMovingKnobTo:snappingToGuides:", mSnapToGuides, x, y);
      [(CRLResizeKnobTracker *)self constrainBetweenMaxAndMinSize];
    }
    CGAffineTransform v58 = [(CRLCanvasKnobTracker *)self rep];
    [v58 invalidateKnobPositions];

    long long v59 = [(CRLCanvasKnobTracker *)self rep];
    [v59 dynamicallyResizingWithTracker:self];

    if (![(CRLResizeKnobTracker *)self isInspectorDrivenTracking])
    {
      [(CRLResizeKnobTracker *)self p_validateLayout];
      if (v38 || v39)
      {
        long long v60 = [v63 guideController];
        long long v61 = [(CRLCanvasKnobTracker *)self rep];
        [v60 showSizingGuideUIForRep:v61 matchingWidth:v38 matchingHeight:v39];

        long long v62 = [v63 guideController];
        [v62 showSizingGuideUIForRep:self->mRepToMatch matchingWidth:v38 matchingHeight:v39];
      }
      [(CRLResizeKnobTracker *)self p_cancelDelayedHUDAndGuides];
      [(CRLResizeKnobTracker *)self p_updateHUD];
      [(CRLResizeKnobTracker *)self p_updateGuideRenderable];
    }
  }
}

- (void)endMovingKnob
{
  if (self->mResizingLayout)
  {
    [(CRLResizeKnobTracker *)self applyNewBoundsToPrimaryRep];
    if (![(CRLResizeKnobTracker *)self isInspectorDrivenTracking])
    {
      float64x2_t v3 = [(CRLCanvasKnobTracker *)self rep];
      double v4 = [v3 interactiveCanvasController];

      double v5 = [v4 selectionModelTranslator];
      double v6 = [v4 editorController];
      CGAffineTransform v7 = [v6 selectionPath];
      CGAffineTransform v8 = [v5 boardItemsForSelectionPath:v7];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          CGFloat v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            unsigned int v14 = [v4 repForInfo:*(void *)(*((void *)&v19 + 1) + 8 * (void)v13)];
            if (v14)
            {
              id v15 = [(CRLCanvasKnobTracker *)self rep];

              if (v14 != v15) {
                [v14 fadeKnobsIn];
              }
            }

            CGFloat v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      id v16 = [v4 guideController];
      [v16 endAlignmentOperation];

      [(CRLResizeKnobTracker *)self p_cancelDelayedHUDAndGuides];
      [(CRLResizeKnobTracker *)self p_hideHUD];
      [(CRLResizeKnobTracker *)self p_hideGuideRenderable];
    }
    mResizingLayout = self->mResizingLayout;
    self->mResizingLayout = 0;

    v18.receiver = self;
    v18.super_class = (Class)CRLResizeKnobTracker;
    [(CRLCanvasKnobTracker *)&v18 endMovingKnob];
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  [a3 valueForKey:@"icc" a4];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeDecorator:self];
}

- (void)p_beginDynamicResize
{
  float64x2_t v3 = [(CRLCanvasKnobTracker *)self rep];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500B38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE2D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500B58);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_beginDynamicResize]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 963, 0, "invalid nil value for '%{public}s'", "rep");
  }
  if ([v3 isBeingResized])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500B78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE1B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500B98);
    }
    CGAffineTransform v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    CGAffineTransform v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_beginDynamicResize]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"];
    id v10 = "Rep should not already be being resized when calling -p_beginDynamicResize";
    id v11 = v8;
    uint64_t v12 = v9;
    uint64_t v13 = 965;
LABEL_33:
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:v13 isFatal:0 description:v10];

    goto LABEL_34;
  }
  unsigned int v14 = [v3 dynamicResizeDidBegin];
  mResizingLayout = self->mResizingLayout;
  self->mResizingLayout = v14;

  if (!self->mResizingLayout)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500BB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE244();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500BD8);
    }
    double v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    CGAffineTransform v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_beginDynamicResize]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"];
    id v10 = "Unable to get resizing layout for beginning dynamic drag.";
    id v11 = v8;
    uint64_t v12 = v9;
    uint64_t v13 = 971;
    goto LABEL_33;
  }
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    id v16 = [(CRLCanvasKnobTracker *)self icc];
    CGAffineTransform v8 = [v16 commandController];

    [v8 openGroup];
    [v8 enableRealTimeSyncProgressiveEnqueuingInCurrentGroup];
LABEL_34:
  }
}

- (CGAffineTransform)p_repTransformInRootForTransforming
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  id v5 = [(CRLCanvasKnobTracker *)self rep];
  double v6 = [v5 layout];
  CGAffineTransform v7 = [v6 geometryForTransforming];
  CGAffineTransform v8 = v7;
  if (v7)
  {
    [v7 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  id v9 = [(CRLCanvasKnobTracker *)self rep];
  id v10 = [v9 layout];
  id v11 = [v10 parent];

  if (v11)
  {
    do
    {
      uint64_t v13 = [v11 geometry];
      unsigned int v14 = v13;
      if (v13)
      {
        long long v15 = *(_OWORD *)&retstr->c;
        v18[0] = *(_OWORD *)&retstr->a;
        v18[1] = v15;
        v18[2] = *(_OWORD *)&retstr->tx;
        [v13 transformByConcatenatingTransformTo:v18];
      }
      else
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v19 = 0u;
      }
      long long v16 = v20;
      *(_OWORD *)&retstr->a = v19;
      *(_OWORD *)&retstr->c = v16;
      *(_OWORD *)&retstr->tdouble x = v21;

      uint64_t v17 = [v11 parent];

      id v11 = (void *)v17;
    }
    while (v17);
  }
  return result;
}

- (CGRect)p_simpleResizedRectByMovingKnobTo:(CGPoint)a3
{
  double y = a3.y;
  p_mBaseBounds = &self->mBaseBounds;
  CGRectGetMinX(self->mBaseBounds);
  CGRectGetMaxX(*p_mBaseBounds);
  double MinY = CGRectGetMinY(*p_mBaseBounds);
  CGRectGetMaxY(*p_mBaseBounds);
  CGAffineTransform v7 = [(CRLCanvasKnobTracker *)self knob];
  CGAffineTransform v8 = (objc_class *)[v7 tag];

  unint64_t v9 = ((unint64_t)v8 - 1) / 3;
  unint64_t v10 = ((unint64_t)v8 - 1) % 3;
  if (v9) {
    double v11 = MinY;
  }
  else {
    double v11 = y;
  }
  if ([(CRLResizeKnobTracker *)self p_isResizingWidthFromCenter]
    && (v10 == 2 || !v10))
  {
    CGRectGetMidX(*p_mBaseBounds);
  }
  if ([(CRLResizeKnobTracker *)self p_isResizingHeightFromCenter] && (v9 == 2 || !v9)) {
    CGRectGetMidY(*p_mBaseBounds);
  }
  CGFloat x = p_mBaseBounds->origin.x;
  CGFloat v14 = p_mBaseBounds->origin.y;
  CGFloat width = p_mBaseBounds->size.width;
  CGFloat height = p_mBaseBounds->size.height;
  v17.super.isa = v8;

  sub_1004E6DAC(v17, v12, x, v14, width, height);
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)constrainAndSnapByMovingKnobTo:(CGPoint)a3 snappingToGuides:(BOOL)a4
{
  self->mSnappedToAspectRatio = 0;
  if (self->mSnapEnabled)
  {
    BOOL v4 = a4;
    p_mLastNewBounds = &self->mLastNewBounds;
    a3.double x = self->mLastNewBounds.size.width;
    double height = self->mLastNewBounds.size.height;
    CGPoint v158 = a3;
    CGAffineTransform v8 = [(CRLCanvasKnobTracker *)self knob];
    unint64_t v9 = (objc_class *)[v8 tag];

    unint64_t v10 = [(CRLCanvasKnobTracker *)self rep];
    double v11 = [v10 interactiveCanvasController];
    Swift::String v12 = [v11 guideController];

    unsigned int v13 = [(CRLResizeKnobTracker *)self currentlyPreservingAspectRatio];
    BOOL v14 = sub_100289AF0((char)v9);
    int v156 = v14;
    if ((v13 & 1) == 0 && !v14)
    {
      if (!v4)
      {
LABEL_31:
        long long v60 = [(CRLCanvasKnobTracker *)self rep];
        unsigned int v61 = [v60 wantsGuidesWhileResizing];

        if (v61) {
          [v12 hideAlignmentGuides];
        }
LABEL_133:
        v136.super.isa = v9;
        sub_1004E6DAC(v136, v62, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
        p_mLastNewBounds->origin.double x = v137;
        p_mLastNewBounds->origin.double y = v138;
        p_mLastNewBounds->size.double width = v139;
        p_mLastNewBounds->size.double height = v140;

        return;
      }
LABEL_28:
      if (![(CRLCanvasAbstractLayout *)self->mResizingLayout shouldSnapWhileResizing]) {
        goto LABEL_31;
      }
      unsigned int v152 = v13;
      v44.super.isa = v9;
      sub_1004E6DAC(v44, v43, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
      p_mLastNewBounds->origin.double x = v45;
      p_mLastNewBounds->origin.double y = v46;
      p_mLastNewBounds->size.double width = v47;
      p_mLastNewBounds->size.double height = v48;
      BOOL v49 = [(CRLCanvasKnobTracker *)self rep];
      [v49 dynamicallyResizingWithTracker:self];

      [(CRLResizeKnobTracker *)self p_validateLayout];
      [(CRLCanvasAbstractLayout *)self->mResizingLayout alignmentFrame];
      CGFloat v51 = v50;
      CGFloat v53 = v52;
      CGFloat v55 = v54;
      CGFloat v57 = v56;
      CGAffineTransform v58 = [(CRLCanvasAbstractLayout *)self->mResizingLayout parent];
      long long v59 = v58;
      if (v58) {
        [v58 transformInRoot];
      }
      else {
        memset(&v165, 0, sizeof(v165));
      }
      v166.origin.double x = v51;
      v166.origin.double y = v53;
      v166.size.double width = v55;
      v166.size.double height = v57;
      CGRect v167 = CGRectApplyAffineTransform(v166, &v165);
      double x = v167.origin.x;
      double y = v167.origin.y;
      double width = v167.size.width;
      double v65 = v167.size.height;

      memset(&v164, 0, sizeof(v164));
      mResizingLayout = self->mResizingLayout;
      if (mResizingLayout) {
        [(CRLCanvasLayout *)mResizingLayout originalTransformForProvidingGuides];
      }
      CGRect v168 = *p_mLastNewBounds;
      CGAffineTransform v163 = v164;
      CGRect v169 = CGRectApplyAffineTransform(v168, &v163);
      CGFloat v67 = v169.origin.x;
      double v68 = v169.origin.y;
      double v69 = v169.size.width;
      double v144 = v169.size.height;
      v70 = [(CRLCanvasKnobTracker *)self knob];
      id v71 = [v70 tag];

      v72 = self->mResizingLayout;
      if (v72) {
        [(CRLCanvasAbstractLayout *)v72 transform];
      }
      else {
        memset(v162, 0, sizeof(v162));
      }
      double v73 = sub_10007F788(v162);
      sub_100065C2C(v73);
      v150 = v9;
      v155 = v12;
      if (v74 == 90.0 || fabs(v74 + -90.0) < 0.00999999978)
      {
        p_mBaseBounds = &self->mBaseBounds;
        uint64_t v76 = sub_1002895EC((uint64_t)v71);
      }
      else if (v74 == 180.0 || fabs(v74 + -180.0) < 0.00999999978)
      {
        p_mBaseBounds = &self->mBaseBounds;
        uint64_t v76 = sub_1002895C8((uint64_t)v71);
      }
      else
      {
        if (v74 != 270.0 && fabs(v74 + -270.0) >= 0.00999999978)
        {
          uint64_t v145 = (uint64_t)v71;
          p_mBaseBounds = &self->mBaseBounds;
          goto LABEL_50;
        }
        p_mBaseBounds = &self->mBaseBounds;
        uint64_t v76 = sub_1002893D8((uint64_t)v71);
      }
      uint64_t v145 = v76;
LABEL_50:
      BOOL v77 = [(CRLResizeKnobTracker *)self hasHorizontalFlip];
      BOOL v78 = [(CRLResizeKnobTracker *)self hasVerticalFlip];
      uint64_t v79 = objc_opt_class();
      v80 = [(CRLCanvasKnobTracker *)self rep];
      v81 = [v80 parentRep];
      uint64_t v82 = sub_1002469D0(v79, v81);

      v83 = [(CRLCanvasKnobTracker *)self rep];
      LODWORD(v80) = [v83 wantsGuidesWhileResizing];

      double v151 = y;
      double rect = v68;
      double v143 = v65;
      double v84 = CGPointZero.y;
      if (v80)
      {
        LOBYTE(v141) = v82 == 0;
        [v155 snapRectToGuides:v145 forKnobTag:1 snapSize:1 snapWithBackgroundAlignmentProvider:0 v77 v78 x y width v65 CGPointZero.x v84 CGPointZero.x v84 v141];
        double v86 = v85;
        double v88 = v87;
      }
      else
      {
        double v86 = CGPointZero.x;
        double v88 = v84;
      }
      BOOL v89 = v88 == v84 && v86 == CGPointZero.x;
      v90 = [(CRLCanvasKnobTracker *)self rep];
      v91 = [v90 interactiveCanvasController];
      v92 = [v91 canvasBackground];

      v93 = v92;
      v94 = [v92 alignmentProvider];
      v142 = (void *)v82;
      if (v94)
      {
        v95 = [(CRLCanvasKnobTracker *)self rep];
        v96 = [v95 interactiveCanvasController];
        unsigned int v97 = [v96 isCanvasBackgroundAlignmentSnappingEnabled];
      }
      else
      {
        unsigned int v97 = 0;
      }
      unsigned int v98 = v152;
      if (v89)
      {
        Swift::String v12 = v155;
        uint64_t v99 = v145;
        goto LABEL_100;
      }
      v100 = self->mResizingLayout;
      if (v100) {
        [(CRLCanvasLayout *)v100 originalTransformForProvidingGuides];
      }
      else {
        memset(&v161, 0, sizeof(v161));
      }
      Swift::String v12 = v155;
      uint64_t v99 = v145;
      CGRect v170 = CGRectApplyAffineTransform(*p_mBaseBounds, &v161);
      double v101 = v170.size.width / v170.size.height;
      if (!v156)
      {
        if ((v152 & 1) != 0 || self->mSnappedToAspectRatio)
        {
          if (v86 == 0.0 || (v145 | 2) != 6)
          {
            double v105 = -v88;
            if (v145 != 2) {
              double v105 = v88;
            }
            float v106 = v105;
            double v86 = v101 * v106 - (v69 + v101 * v106 - (v144 + v106) * v101);
          }
          else
          {
            double v103 = -v86;
            if (v145 != 4) {
              double v103 = v86;
            }
            float v104 = v103;
            double v88 = v104 / v101 + (v69 + v104) / v101 - (v144 + v104 / v101);
          }
        }
LABEL_100:
        if (fabs(v86) <= (double)7)
        {
          if (fabs(v88) <= (double)7) {
            char v113 = 1;
          }
          else {
            char v113 = v97;
          }
          if (v113) {
            goto LABEL_108;
          }
        }
        else if (v97)
        {
          goto LABEL_108;
        }
        double v86 = CGPointZero.x;
        double v88 = v84;
LABEL_108:
        CGAffineTransform v163 = v164;
        CGAffineTransformInvert(&v160, &v163);
        v171.origin.double x = v67;
        v171.origin.double y = v68;
        v171.size.double width = v69;
        v171.size.double height = v144;
        CGRect v172 = CGRectApplyAffineTransform(v171, &v160);
        double v114 = v172.size.height;
        double v157 = v172.size.width;
        double v115 = v67;
        if (0xAAAAAAAAAAAAAAABLL * (v99 - 1) <= 0x5555555555555555)
        {
          double v116 = x + v86;
          double v148 = width - v86;
          double v115 = v115 + v86;
          double v117 = v69 - v86;
        }
        else
        {
          double v116 = x;
          double v148 = width + v86;
          double v117 = v69 + v86;
        }
        unint64_t v9 = v150;
        if ((unint64_t)(v99 - 1) > 2)
        {
          double v146 = v143 + v88;
          double v118 = v144 + v88;
        }
        else
        {
          double v151 = v151 + v88;
          double v146 = v143 - v88;
          double rect = v68 + v88;
          double v118 = v144 - v88;
        }
        if ((v99 & 0xFFFFFFFFFFFFFFFDLL) == 4)
        {
          double v119 = v88 * 0.5;
          double v120 = v151 - v88 * 0.5;
          double v121 = rect - v119;
          double v122 = v115;
        }
        else
        {
          if (v99 == 8 || v99 == 2)
          {
            double v116 = v116 - v86 * 0.5;
            double v122 = v115 - v86 * 0.5;
            double v120 = v151;
          }
          else
          {
            double v120 = v151;
            double v122 = v115;
          }
          double v121 = rect;
        }
        CGAffineTransform v163 = v164;
        CGAffineTransformInvert(&v159, &v163);
        v173.origin.double x = v122;
        v173.origin.double y = v121;
        v173.size.double width = v117;
        v173.size.double height = v118;
        CGRect v174 = CGRectApplyAffineTransform(v173, &v159);
        *(float *)&v174.origin.double x = v174.size.width;
        *(float *)&v174.size.double width = v158.x;
        v124.i64[0] = 0x8000000080000000;
        v124.i64[1] = 0x8000000080000000;
        *(double *)v125.i64 = fabs(*(float *)vbslq_s8(v124, (int8x16_t)v174.origin, (int8x16_t)v174.size).i32);
        if (*(double *)v125.i64 >= 1.0)
        {
          *(float *)&v174.size.double height = v174.size.height;
          *(float *)v125.i32 = height;
          double v126 = *(float *)vbslq_s8(v124, *(int8x16_t *)&v174.size.height, v125).i32;
          if (fabs(v126) >= 1.0)
          {
            v127.super.isa = v150;
            sub_1004E6DAC(v127, v123, p_mBaseBounds->origin.x, p_mBaseBounds->origin.y, p_mBaseBounds->size.width, p_mBaseBounds->size.height);
            p_mLastNewBounds->origin.double x = v128;
            p_mLastNewBounds->origin.double y = v129;
            p_mLastNewBounds->size.double width = v130;
            p_mLastNewBounds->size.double height = v131;
            v132 = [(CRLCanvasKnobTracker *)self rep];
            [v132 dynamicallyResizingWithTracker:self];

            [(CRLResizeKnobTracker *)self p_validateLayout];
            v133 = [(CRLCanvasKnobTracker *)self rep];
            unsigned int v134 = [v133 wantsGuidesWhileResizing];

            if (v134) {
              [v12 showGuidesAlignedWithRect:v99 forKnobTag:v116];
            }
            double height = v126;
            unsigned int v98 = v152;
          }
        }
        if (v114 == 0.0 || height == 0.0 || v157 == 0.0 || ((v98 ^ 1) & 1) != 0) {
          v135 = v142;
        }
        else {
          v135 = v142;
        }

        goto LABEL_133;
      }
      if ((v152 & 1) == 0 && !self->mSnappedToAspectRatio) {
        goto LABEL_100;
      }
      if (v86 == 0.0)
      {
        BOOL v102 = 0;
      }
      else
      {
        if (v88 == 0.0)
        {
          BOOL v102 = 1;
          goto LABEL_83;
        }
        BOOL v102 = fabs(v86) < fabs(v88);
      }
      if ((v102 | v97) != 1)
      {
        BOOL v102 = 0;
        double v110 = v88;
LABEL_90:
        if (v145 == 7)
        {
          double v111 = -(v88 * v101) - (v69 - -(v88 * v101) - (v144 + v88) * v101);
        }
        else
        {
          double v111 = v88 * v101 - (v69 + v88 * v101 - (v144 + v88) * v101);
          double v112 = -(v88 * v101) - -(v69 - v88 * v101 - (v144 - v88) * v101);
          if (v145 == 3) {
            double v111 = v112;
          }
        }
LABEL_95:
        if (v97) {
          BOOL v102 = fabs(v86) + fabs(v110) <= fabs(v88) + fabs(v111);
        }
        if (v102) {
          double v88 = v110;
        }
        else {
          double v86 = v111;
        }
        goto LABEL_100;
      }
LABEL_83:
      double v107 = -v86 / v101;
      double v108 = v107 + (v69 - v86) / v101 - (v144 + v107);
      double v109 = (v69 + v86) / v101;
      double v110 = v107 + v109 - (v144 - v107);
      if (v145 != 3) {
        double v110 = v86 / v101 + v109 - (v144 + v86 / v101);
      }
      if (v145 == 7) {
        double v110 = v108;
      }
      double v111 = v86;
      if ((!v102 | v97) != 1) {
        goto LABEL_95;
      }
      goto LABEL_90;
    }
    v154 = v12;
    double v15 = fabs(v158.x);
    double v16 = fabs(height);
    CKRecordID v17 = [(CRLCanvasKnobTracker *)self rep];
    double v18 = [v17 interactiveCanvasController];
    double v19 = [v18 canvasBackground];

    uint64_t v20 = [v19 alignmentProvider];
    long long v22 = (void *)v20;
    if (v13)
    {
      *(double *)v21.i64 = sub_100066F2C(v156, v15, v16, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
      double v15 = *(double *)v21.i64;
      double v16 = v23;
LABEL_25:
      self->mSnappedToAspectRatio = 1;
      goto LABEL_26;
    }
    if ((v156 & v4) != 1)
    {
LABEL_26:
      int8x16_t v39 = (int8x16_t)v158;
LABEL_27:
      *(float *)v21.i32 = v15;
      *(float *)v39.i32 = *(double *)v39.i64;
      v41.i64[0] = 0x8000000080000000;
      v41.i64[1] = 0x8000000080000000;
      int8x16_t v42 = vbslq_s8(v41, v21, v39);
      *(double *)v42.i64 = *(float *)v42.i32;
      *(void *)&v158.double x = v42.i64[0];
      *(float *)v42.i32 = v16;
      *(float *)v39.i32 = height;
      double height = *(float *)vbslq_s8(v41, v42, v39).i32;

      Swift::String v12 = v154;
      if (!v4) {
        goto LABEL_31;
      }
      goto LABEL_28;
    }
    if (!v20) {
      goto LABEL_11;
    }
    id v24 = [(CRLCanvasKnobTracker *)self rep];
    [v24 interactiveCanvasController];
    double v25 = v149 = v9;
    unsigned __int8 v26 = [v25 isCanvasBackgroundAlignmentSnappingEnabled];

    unint64_t v9 = v149;
    if ((v26 & 1) == 0)
    {
LABEL_11:
      double v27 = self->mBaseBounds.size.height;
      double v28 = 1.0;
      if (v27 > 0.001) {
        double v28 = self->mBaseBounds.size.width / v27;
      }
      if (v16 <= 0.001) {
        double v29 = 1.0;
      }
      else {
        double v29 = v15 / v16;
      }
      float v30 = v28;
      float v31 = logf(v30);
      float v32 = v29;
      *(float *)v21.i32 = logf(v32);
      float v33 = vabds_f32(v31, *(float *)v21.i32);
      *(float *)v21.i32 = fabsf(*(float *)v21.i32);
      if (v33 < 0.1 && v33 < *(float *)v21.i32)
      {
        double v35 = self->mBaseBounds.size.width;
        double v37 = v15;
        double v38 = v16;
        double v36 = v27;
        goto LABEL_24;
      }
      if (*(float *)v21.i32 < 0.1)
      {
        double v35 = 1.0;
        double v36 = 1.0;
        double v37 = v15;
        double v38 = v16;
LABEL_24:
        *(double *)v21.i64 = sub_100066F2C(1, v37, v38, v35, v36);
        double v15 = *(double *)v21.i64;
        double v16 = v40;
        unsigned int v13 = 0;
        goto LABEL_25;
      }
    }
    int8x16_t v39 = (int8x16_t)v158;
    unsigned int v13 = 0;
    goto LABEL_27;
  }
}

- (void)constrainBetweenMaxAndMinSize
{
  p_mLastNewBounds = &self->mLastNewBounds;
  double width = self->mMinimumSize.width;
  double height = self->mMinimumSize.height;
  if ([(CRLResizeKnobTracker *)self currentlyPreservingAspectRatio]) {
    sub_100066FC4(width, height, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
  }
  double v6 = [(CRLCanvasKnobTracker *)self knob];
  v7.super.isa = (Class)[v6 tag];
  sub_1004E6DAC(v7, v19, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
  p_mLastNewBounds->origin.double x = v8;
  p_mLastNewBounds->origin.double y = v9;
  p_mLastNewBounds->size.double width = v10;
  p_mLastNewBounds->size.double height = v11;

  id v17 = [(CRLCanvasKnobTracker *)self knob];
  v12.super.isa = (Class)[v17 tag];
  sub_1004E6DAC(v12, v20, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
  p_mLastNewBounds->origin.double x = v13;
  p_mLastNewBounds->origin.double y = v14;
  p_mLastNewBounds->size.double width = v15;
  p_mLastNewBounds->size.double height = v16;
}

- (void)p_validateLayout
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  id v4 = [v2 layout];

  float64x2_t v3 = [v4 layoutController];
  [v3 validateLayoutWithDependencies:v4];
}

- (void)p_updateGuideRenderable
{
  float64x2_t v3 = [(CRLCanvasKnobTracker *)self knob];
  BOOL v4 = sub_100289AF0((char)[v3 tag]);

  if (v4)
  {
    id v5 = [(CRLCanvasKnobTracker *)self rep];
    double v6 = [v5 interactiveCanvasController];

    CKRecordID v7 = [v6 canvas];
    [v7 contentsScale];
    double v9 = v8;

    if (!self->mBeganAlignmentOperation)
    {
      CGFloat v10 = [v6 guideController];
      CGFloat v11 = [(CRLCanvasKnobTracker *)self rep];
      [v10 beginAlignmentOperationForRep:v11];

      self->mBeganAlignmentOperation = 1;
    }
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    if (self->mSnappedToAspectRatio)
    {
      double v12 = v9 * 10.0;
      double v13 = v9 * 3.0;
      mGuideRenderable = self->mGuideRenderable;
      if (!mGuideRenderable)
      {
        CGFloat v15 = +[CRLCanvasRenderable renderable];
        CGFloat v16 = self->mGuideRenderable;
        self->mGuideRenderable = v15;

        [(CRLCanvasRenderable *)self->mGuideRenderable setZPosition:-1.0];
        [(CRLCanvasRenderable *)self->mGuideRenderable setDelegate:self];
        [(CRLCanvasRenderable *)self->mGuideRenderable setContentsScale:v9];
        [v6 invalidateLayersForDecorator:self];
        if (qword_101719D48) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = v9 == 1.0;
        }
        double v18 = (double)(unint64_t)(v12 * 20.0);
        Swift::String v19 = &qword_101719D38;
        Swift::String v20 = &unk_101719D40;
        if (!v17 || !qword_101719D38)
        {
          int8x16_t v21 = sub_100455AA8(3, (double)(unint64_t)v13, v18);
          *(_OWORD *)&components.a = xmmword_101178DC0;
          components.c = 0.125490196;
          long long v22 = (CGColorSpace *)sub_10000FC28();
          CGContextSetFillColorSpace(v21, v22);
          double v23 = 0.0;
          int v24 = 20;
          do
          {
            components.d = v23 / -20.0 + 1.0;
            CGContextSetFillColor(v21, &components.a);
            v122.origin.double x = 0.0;
            v122.origin.double y = 0.0;
            v122.size.double width = v9 * 3.0;
            v122.size.double height = v9 * 3.0;
            CGContextAddEllipseInRect(v21, v122);
            CGContextFillPath(v21);
            CGContextTranslateCTM(v21, 0.0, v9 * 10.0);
            double v23 = v23 + 1.0;
            --v24;
          }
          while (v24);
          double v25 = sub_100455AA8(3, (double)(unint64_t)v13, 2560.0);
          components.d = 1.0;
          unsigned __int8 v26 = (CGColorSpace *)sub_10000FC28();
          CGContextSetFillColorSpace(v25, v26);
          CGContextSetFillColor(v25, &components.a);
          double v27 = 2560.0 / v12 + 2560.0 / v12;
          if (v27 > 0.0)
          {
            int v28 = 1;
            do
            {
              v123.origin.double x = 0.0;
              v123.origin.double y = 0.0;
              v123.size.double width = v9 * 3.0;
              v123.size.double height = v9 * 3.0;
              CGContextAddEllipseInRect(v25, v123);
              CGContextFillPath(v25);
              CGContextTranslateCTM(v25, 0.0, v9 * 10.0);
              double v29 = (double)v28++;
            }
            while (v27 > v29);
          }
          CGImageRef Image = CGBitmapContextCreateImage(v21);
          if (v9 == 1.0) {
            float v31 = &qword_101719D38;
          }
          else {
            float v31 = &qword_101719D48;
          }
          if (v9 == 1.0) {
            float v32 = (CGImageRef *)&unk_101719D40;
          }
          else {
            float v32 = (CGImageRef *)&unk_101719D50;
          }
          *float v31 = (uint64_t)Image;
          *float v32 = CGBitmapContextCreateImage(v25);
          Swift::String v19 = &qword_101719D38;
          CGContextRelease(v21);
          Swift::String v20 = &unk_101719D40;
          CGContextRelease(v25);
        }
        float v33 = +[CRLCanvasRenderable renderable];
        double v34 = v33;
        if (v9 != 1.0)
        {
          Swift::String v19 = &qword_101719D48;
          Swift::String v20 = &unk_101719D50;
        }
        [v33 setContents:*v19];
        double v35 = (double)(unint64_t)v13 / v9;
        double v36 = v18 / v9;
        [v34 setBounds:0.0, 0.0, v35, v18 / v9];
        double v37 = v13 * -0.5 / v18 + 1.0;
        [v34 setAnchorPoint:0.5 v37];
        double v38 = +[CRLCanvasRenderable renderable];
        [v38 setContents:*v20];
        [v38 setAnchorPoint:0.5, 0.0];
        [v38 setBounds:0.0, v13 * -0.5 / 2560.0, v35, 2560.0 / v9];
        int8x16_t v39 = +[CRLCanvasScrollRenderable renderable];
        [v39 setAnchorPoint:0.5, 0.0];
        [v39 addSubrenderable:v38];
        double v40 = +[CRLCanvasRenderable renderable];
        [v40 setContents:*v19];
        [v40 setBounds:0.0, 0.0, v35, v36];
        CGAffineTransformMakeRotation(&v120, 3.14159265);
        CGAffineTransform v119 = v120;
        [v40 setAffineTransform:&v119];
        [v40 setAnchorPoint:0.5 v37];
        [v34 setContentsScale:v9];
        [v39 setContentsScale:v9];
        [v40 setContentsScale:v9];
        [(CRLCanvasRenderable *)self->mGuideRenderable addSubrenderable:v34];
        [(CRLCanvasRenderable *)self->mGuideRenderable addSubrenderable:v39];
        [(CRLCanvasRenderable *)self->mGuideRenderable addSubrenderable:v40];

        mGuideRenderable = self->mGuideRenderable;
      }
      double v111 = v9 * 10.0;
      -[CRLCanvasRenderable setHidden:](mGuideRenderable, "setHidden:", 0, v9 * 3.0);
      int8x16_t v41 = [(CRLCanvasKnobTracker *)self knob];
      double v42 = sub_100289A18((uint64_t)[v41 tag], self->mLastNewBounds.origin.x, self->mLastNewBounds.origin.y, self->mLastNewBounds.size.width, self->mLastNewBounds.size.height);
      double v44 = v43;

      CGFloat v45 = [(CRLCanvasKnobTracker *)self knob];
      uint64_t v46 = sub_1002895C8((uint64_t)[v45 tag]);
      double v47 = sub_100289A18(v46, self->mLastNewBounds.origin.x, self->mLastNewBounds.origin.y, self->mLastNewBounds.size.width, self->mLastNewBounds.size.height);
      double v49 = v48;

      double v50 = [(CRLCanvasKnobTracker *)self rep];
      [v50 boundsForResizeGuideUI];
      double v52 = v51;

      double x = self->mLastNewBounds.origin.x;
      double v54 = sub_100064680(v42, v44, x);
      double v56 = v55;
      double v57 = sub_100064680(v47, v49, x);
      double v59 = v58;
      double v60 = sub_100064698(v54, v56, v52);
      double v62 = v61;
      double v63 = sub_100064698(v57, v59, v52);
      double v65 = v64;
      if ([(CRLResizeKnobTracker *)self hasHorizontalFlip])
      {
        double width = self->mLastNewBounds.size.width;
        double v60 = sub_100064680(v60, v62, width);
        double v62 = v67;
        double v63 = sub_100064680(v63, v65, width);
        double v65 = v68;
      }
      if ([(CRLResizeKnobTracker *)self hasVerticalFlip])
      {
        double v60 = sub_100064680(v60, v62, 0.0);
        double v62 = v69;
        double v63 = sub_100064680(v63, v65, 0.0);
        double v65 = v70;
      }
      id v71 = [(CRLCanvasKnobTracker *)self rep];
      v72 = [v71 layout];
      double v73 = [v72 geometryForTransforming];

      memset(&components, 0, sizeof(components));
      if (v73) {
        [v73 transform];
      }
      else {
        memset(&t1, 0, sizeof(t1));
      }
      double v74 = [(CRLCanvasKnobTracker *)self rep];
      v75 = [v74 layout];
      uint64_t v76 = [v75 geometry];
      BOOL v77 = v76;
      if (v76) {
        [v76 transform];
      }
      else {
        memset(&v116, 0, sizeof(v116));
      }
      CGAffineTransformInvert(&t2, &v116);
      CGAffineTransformConcat(&components, &t1, &t2);

      CGFloat v78 = components.tx + v62 * components.c + components.a * v60;
      CGFloat v79 = components.ty + v62 * components.d + components.b * v60;
      CGFloat v80 = components.tx + v65 * components.c + components.a * v63;
      CGFloat v81 = components.ty + v65 * components.d + components.b * v63;
      uint64_t v82 = [(CRLCanvasKnobTracker *)self rep];
      [v82 convertNaturalPointToUnscaledCanvas:v78, v79];
      [v6 convertUnscaledToBoundsPoint:];
      double v84 = v83;
      double v86 = v85;

      double v87 = [(CRLCanvasKnobTracker *)self rep];
      [v87 convertNaturalPointToUnscaledCanvas:v80, v81];
      [v6 convertUnscaledToBoundsPoint:];
      double v89 = v88;
      double v91 = v90;

      double v92 = sub_1000653B4(v89, v91, v84, v86);
      float v93 = v92 / v111;
      unint64_t v94 = vcvtps_u32_f32(v93);
      v95 = [(CRLCanvasRenderable *)self->mGuideRenderable subrenderables];
      v96 = [v95 objectAtIndexedSubscript:0];

      unsigned int v97 = [(CRLCanvasRenderable *)self->mGuideRenderable subrenderables];
      unsigned int v98 = [v97 objectAtIndexedSubscript:1];

      uint64_t v99 = [(CRLCanvasRenderable *)self->mGuideRenderable subrenderables];
      v100 = [v99 lastObject];

      double v101 = v111 * (double)v94;
      [v98 setBounds:v110 * -0.5, 0.0, v110, v101];
      if ([(CRLResizeKnobTracker *)self p_isResizingWidthFromCenter]
        && [(CRLResizeKnobTracker *)self p_isResizingHeightFromCenter])
      {
        double v102 = v92 * 0.5;
        double v103 = (float)(v94 >> 1);
        [v96 setPosition:0.0, v102 - v103 * v111];
        [v98 setPosition:0.0, v102 - v103 * v111];
        double v101 = v102 + v103 * v111;
      }
      else
      {
        [v96 setPosition:0.0, 0.0];
        [v98 setPosition:0.0, 0.0];
      }
      [v100 setPosition:0.0 v101];
      [(CRLCanvasRenderable *)self->mGuideRenderable position];
      if (v105 != v89 || v104 != v91) {
        -[CRLCanvasRenderable setPosition:](self->mGuideRenderable, "setPosition:", v89, v91);
      }
      double v106 = sub_100064680(v84, v86, v89);
      double v108 = sub_100065C1C(v106, v107);
      memset(&v115, 0, sizeof(v115));
      CGAffineTransformMakeRotation(&v115, v108 + -1.57079633);
      double v109 = self->mGuideRenderable;
      if (v109) {
        [(CRLCanvasRenderable *)v109 affineTransform];
      }
      else {
        memset(&v114, 0, sizeof(v114));
      }
      CGAffineTransform v113 = v115;
      if (!CGAffineTransformEqualToTransform(&v113, &v114))
      {
        CGAffineTransform v112 = v115;
        [(CRLCanvasRenderable *)self->mGuideRenderable setAffineTransform:&v112];
      }
      +[CATransaction commit];
    }
    else
    {
      [(CRLCanvasRenderable *)self->mGuideRenderable setHidden:1];
      +[CATransaction commit];
    }
  }
}

- (void)p_hideGuideRenderable
{
  if ([(CRLCanvasRenderable *)self->mGuideRenderable isHidden])
  {
    id v9 = [(CRLCanvasKnobTracker *)self rep];
    float64x2_t v3 = [v9 interactiveCanvasController];
    [v3 removeDecorator:self];
  }
  else
  {
    id v9 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v9 setDuration:0.400000006];
    LODWORD(v4) = 1.0;
    id v5 = +[NSNumber numberWithFloat:v4];
    [v9 setFromValue:v5];

    double v6 = +[NSNumber numberWithFloat:0.0];
    [v9 setToValue:v6];

    [v9 setDelegate:self];
    CKRecordID v7 = [(CRLCanvasKnobTracker *)self rep];
    double v8 = [v7 interactiveCanvasController];
    [v9 setValue:v8 forKey:@"icc"];

    [(CRLCanvasRenderable *)self->mGuideRenderable addAnimation:v9 forKey:@"fade out"];
    [(CRLCanvasRenderable *)self->mGuideRenderable setOpacity:0.0];
  }
}

- (void)p_updateHUD
{
  uint64_t v3 = objc_opt_class();
  double v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:@"CRLShowSizeAndPositionWhileMovingUserDefault"];
  double v38 = sub_1002469D0(v3, v5);

  if (!v38 || (unsigned int v6 = [v38 BOOLValue], v7 = v38, v6))
  {
    double v8 = [(CRLCanvasKnobTracker *)self rep];
    id v9 = [v8 interactiveCanvasController];

    CGFloat v10 = +[CRLCanvasHUDController sharedHUDController];
    CGFloat v11 = [(CRLResizeKnobTracker *)self hudLabelText];
    [v10 setLabelText:v11];

    double v12 = [v9 layerHost];
    double v13 = [v12 canvasView];

    [(CRLCanvasKnobTracker *)self currentPosition];
    [v9 convertUnscaledToBoundsPoint:];
    double v15 = v14;
    double v17 = v16;
    double v18 = [v10 view];
    [v18 frame];
    double v20 = (v19 + v19) / 5.0;

    [v10 showHUDForKey:self forTouchPoint:v13 inCanvasView:0 withNudge:v15 size:v17];
    if (![(CRLResizeKnobTracker *)self suppressSecondaryHUD])
    {
      if ([(CRLResizeKnobTracker *)self p_isResizingWidthFromCenter]
        && [(CRLResizeKnobTracker *)self p_isResizingHeightFromCenter])
      {
        mSecondHUDController = self->mSecondHUDController;
        long long v22 = +[NSBundle mainBundle];
        double v23 = v22;
        CFStringRef v24 = @"Center Resize";
LABEL_9:
        double v25 = [v22 localizedStringForKey:v24 value:0 table:0];
        [(CRLCanvasHUDController *)mSecondHUDController setLabelText:v25];

        unsigned __int8 v26 = [(CRLCanvasHUDController *)self->mSecondHUDController view];
        [v26 frame];
        double v28 = (v27 + v27) / 5.0;

        double v29 = self->mSecondHUDController;
        [(CRLResizeKnobTracker *)self secondaryHUDPoint];
        double v32 = sub_1000674F0(v30, v31);
        double v34 = v33;
        double v35 = [(CRLCanvasKnobTracker *)self icc];
        double v36 = [v35 layerHost];
        double v37 = [v36 canvasView];
        -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:](v29, "showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:", self, v37, 0, v32, v34, v28, -75.0);

LABEL_11:
        CKRecordID v7 = v38;
        goto LABEL_12;
      }
      if ([(CRLResizeKnobTracker *)self p_isMatchingSize])
      {
        mSecondHUDController = self->mSecondHUDController;
        long long v22 = +[NSBundle mainBundle];
        double v23 = v22;
        CFStringRef v24 = @"Match Size";
        goto LABEL_9;
      }
    }
    [(CRLCanvasHUDController *)self->mSecondHUDController hideHUDForKey:self];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)p_hideHUD
{
  uint64_t v3 = +[CRLCanvasHUDController sharedHUDController];
  [v3 hideHUDForKey:self];

  mSecondHUDController = self->mSecondHUDController;

  [(CRLCanvasHUDController *)mSecondHUDController hideHUDForKey:self];
}

- (void)p_cancelDelayedHUDAndGuides
{
  self->mNeedsHUD = 0;
}

- (void)p_showHUDAndGuides
{
  [(CRLResizeKnobTracker *)self p_updateHUD];

  [(CRLResizeKnobTracker *)self p_updateGuideRenderable];
}

- (BOOL)p_isMatchingSize
{
  uint64_t v3 = [(CRLResizeKnobTracker *)self repToMatch];
  if (!v3) {
    goto LABEL_4;
  }
  double v4 = (void *)v3;
  id v5 = [(CRLResizeKnobTracker *)self repToMatch];
  unsigned int v6 = [v5 layout];
  CKRecordID v7 = [v6 reliedOnLayouts];
  double v8 = [(CRLCanvasKnobTracker *)self rep];
  id v9 = [v8 layout];
  unsigned __int8 v10 = [v7 containsObject:v9];

  if (v10)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
LABEL_4:
    double v12 = [(CRLResizeKnobTracker *)self repToMatch];
    if (v12)
    {
      double v13 = [(CRLResizeKnobTracker *)self repToMatch];
      double v14 = [(CRLCanvasKnobTracker *)self rep];
      if (v13 == v14 || [(CRLResizeKnobTracker *)self p_isResizingWidthFromCenter]) {
        LOBYTE(v11) = 0;
      }
      else {
        unsigned int v11 = ![(CRLResizeKnobTracker *)self p_isResizingHeightFromCenter];
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (BOOL)p_isResizingWidthFromCenter
{
  BOOL v3 = [(CRLResizeKnobTracker *)self canCenterResize];
  if (v3)
  {
    LOBYTE(v3) = [(CRLResizeKnobTracker *)self shouldResizeFromCenter];
  }
  return v3;
}

- (BOOL)p_isResizingHeightFromCenter
{
  BOOL v3 = [(CRLResizeKnobTracker *)self canCenterResize];
  if (v3)
  {
    LOBYTE(v3) = [(CRLResizeKnobTracker *)self shouldResizeFromCenter];
  }
  return v3;
}

- (BOOL)currentlyPreservingAspectRatio
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasKnobTracker *)self rep];
  id v5 = [v4 layout];
  unsigned int v6 = sub_1002469D0(v3, v5);

  if (v6 && [v6 autosizes])
  {
    CKRecordID v7 = [(CRLCanvasKnobTracker *)self knob];
    BOOL mPreserveAspectRatio = sub_100289AF0((char)[v7 tag]);
  }
  else
  {
    CKRecordID v7 = [(CRLCanvasKnobTracker *)self rep];
    id v9 = [v7 layout];
    if ([v9 resizeMayChangeAspectRatio]) {
      BOOL mPreserveAspectRatio = self->mPreserveAspectRatio;
    }
    else {
      BOOL mPreserveAspectRatio = 1;
    }
  }
  return mPreserveAspectRatio;
}

- (void)resizeRepForInspectors:(id)a3 value:(double)a4 changingWidth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = self;
  [(CRLResizeKnobTracker *)v9 i_lastNewBounds];
  double v12 = v10;
  double v13 = v11;
  if (vabdd_f64(0.0, v11) < 0.00999999978 || v11 == 0.0) {
    double v15 = 0.0;
  }
  else {
    double v15 = v10 / v11;
  }
  double v16 = [v8 layout:v10 / v11];
  unsigned int v17 = [v16 resizeMayChangeAspectRatio];
  if (v15 == 0.0) {
    int v18 = 1;
  }
  else {
    int v18 = v17;
  }
  if (v5)
  {
    if (!v18) {
      double v13 = a4 / v15;
    }
  }
  else
  {
    double v13 = a4;
    if (v18) {
      a4 = v12;
    }
    else {
      a4 = v15 * a4;
    }
  }
  double v19 = [(CRLCanvasKnobTracker *)v9 knob];
  uint64_t v20 = sub_1002893CC((char)[v19 tag]) & 0x92;

  int8x16_t v21 = [(CRLCanvasKnobTracker *)v9 knob];
  uint64_t v22 = sub_1002893CC((char)[v21 tag]) & 0xE;

  double v23 = 0.0;
  double v24 = 0.0;
  if (v20)
  {
    [(CRLResizeKnobTracker *)v9 i_baseBounds];
    double v24 = v25 - a4;
  }
  if (v22)
  {
    [(CRLResizeKnobTracker *)v9 i_baseBounds];
    double v23 = v26 - v13;
  }
  double v27 = [(CRLCanvasKnobTracker *)v9 knob];
  double v28 = sub_100289A18((uint64_t)[v27 tag], v24, v23, a4, v13);
  double v53 = v29;
  double v54 = v28;

  double v52 = v13;
  if (v8)
  {
    [v8 knobPositionTransformForInspectorResize];
    double v30 = v55;
    double v31 = v57;
    double v32 = v59;
    unsigned int v33 = [(CRLResizeKnobTracker *)v9 shouldResizeFromCenter];
  }
  else
  {
    double v32 = 0.0;
    double v31 = 0.0;
    double v30 = 0.0;
    unsigned int v33 = [(CRLResizeKnobTracker *)v9 shouldResizeFromCenter];
  }
  unsigned int v34 = v33;
  unsigned int v35 = [(CRLResizeKnobTracker *)v9 shouldResizeFromCenter];
  [(CRLResizeKnobTracker *)v9 i_baseBounds];
  CGFloat v40 = v36;
  CGFloat v41 = v37;
  CGFloat v42 = v38;
  CGFloat v43 = v39;
  if (v34)
  {
    double v44 = CGRectGetMidX(*(CGRect *)&v36) + a4 * 0.5;
    if (!v35)
    {
LABEL_26:
      double v45 = v51 + v53 * v49 + v50 * v54;
      goto LABEL_29;
    }
  }
  else
  {
    double v44 = v32 + v53 * v31 + v30 * v54;
    if (!v35) {
      goto LABEL_26;
    }
  }
  v61.origin.double x = v40;
  v61.origin.double y = v41;
  v61.size.double width = v42;
  v61.size.double height = v43;
  double v45 = CGRectGetMidY(v61) + v52 * 0.5;
LABEL_29:
  uint64_t v46 = [(CRLCanvasKnobTracker *)v9 knob];
  if ([v46 offsetValid])
  {
    [v46 offset];
    double x = v47;
  }
  else
  {
    double x = CGPointZero.x;
  }
  [(CRLResizeKnobTracker *)v9 convertKnobPositionToUnscaledCanvas:sub_100064698(v44, v45, x)];
  -[CRLCanvasKnobTracker setCurrentPosition:](v9, "setCurrentPosition:");
}

- (void)p_flipMagnetNormalizedPositionsIfNeeded
{
  unsigned int v3 = [(CRLResizeKnobTracker *)self hasHorizontalFlip];
  unsigned int v4 = [(CRLResizeKnobTracker *)self hasVerticalFlip];
  BOOL v5 = [(CRLCanvasKnobTracker *)self rep];
  unsigned int v6 = [v5 layout];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v6 connectedLayouts];
  id v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    unsigned int v36 = v3;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v9 = [v8 connectedTo];

        if (v6 == v9)
        {
          [v8 headMagnetNormalizedPosition];
          double v11 = v14;
          double v13 = v15;
          if ((v3 & 1) == 0)
          {
            if ((v4 & 1) == 0) {
              goto LABEL_22;
            }
LABEL_20:
            if ([v8 headHasVerticalFlip]) {
              goto LABEL_22;
            }
LABEL_21:
            double v13 = 1.0 - v13;
            -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v13);
            [(CRLResizeKnobTracker *)self p_updateMagnetTypeForMagnet:v6 == v9 forClineLayout:v8];
            self->mAdjustedMagnetsForVerticalFlip = 1;
            [v8 setMagnetsAdjusted:1];
            goto LABEL_22;
          }
          if ([v8 headHasHorizontalFlip])
          {
            if ((v4 & 1) == 0) {
              goto LABEL_30;
            }
            goto LABEL_20;
          }
        }
        else
        {
          [v8 tailMagnetNormalizedPosition];
          double v11 = v10;
          double v13 = v12;
          if (v3 & 1) == 0 || ([v8 tailHasHorizontalFlip])
          {
            if ((v4 & 1) == 0) {
              goto LABEL_22;
            }
            goto LABEL_16;
          }
        }
        double v11 = 1.0 - v11;
        -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v13);
        [(CRLResizeKnobTracker *)self p_updateMagnetTypeForMagnet:v6 == v9 forClineLayout:v8];
        self->mAdjustedMagnetsForHorizontalFlip = 1;
        [v8 setMagnetsAdjusted:1];
        if ((v4 & 1) == 0) {
          goto LABEL_22;
        }
LABEL_16:
        if (v6 == v9) {
          goto LABEL_20;
        }
        if (([v8 tailHasVerticalFlip] & 1) == 0) {
          goto LABEL_21;
        }
LABEL_22:
        if (self->mAdjustedMagnetsForHorizontalFlip) {
          char v16 = v3;
        }
        else {
          char v16 = 1;
        }
        if ((v16 & 1) == 0)
        {
          unsigned int v17 = [v8 connectionLineInfo];
          int v18 = [v17 connectionLinePathSource];

          if (v6 == v9) {
            [v18 headMagnet];
          }
          else {
          double v19 = [v18 tailMagnet];
          }
          [v19 magnetNormalizedPosition];
          double v11 = v20;

          -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v13);
          [(CRLResizeKnobTracker *)self p_revertToOriginalMagnetTypeForMagnet:v6 == v9 forClineLayout:v8];
          self->mAdjustedMagnetsForHorizontalFlip = 0;

          unsigned int v3 = v36;
        }
LABEL_30:
        if (self->mAdjustedMagnetsForVerticalFlip) {
          char v21 = v4;
        }
        else {
          char v21 = 1;
        }
        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [v8 connectionLineInfo];
          double v23 = [v22 connectionLinePathSource];

          if (v6 == v9) {
            [v23 headMagnet];
          }
          else {
          double v24 = [v23 tailMagnet];
          }
          [v24 magnetNormalizedPosition];
          double v26 = v25;

          -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v26);
          [(CRLResizeKnobTracker *)self p_revertToOriginalMagnetTypeForMagnet:v6 == v9 forClineLayout:v8];
          self->mAdjustedMagnetsForVerticalFlip = 0;

          unsigned int v3 = v36;
        }
        double v27 = [v8 connectedTo];
        if (v27 == v6) {
          uint64_t v28 = v3;
        }
        else {
          uint64_t v28 = 0;
        }
        [v8 setHeadHasHorizontalFlip:v28];

        double v29 = [v8 connectedTo];
        if (v29 == v6) {
          uint64_t v30 = v4;
        }
        else {
          uint64_t v30 = 0;
        }
        [v8 setHeadHasVerticalFlip:v30];

        double v31 = [v8 connectedFrom];
        if (v31 == v6) {
          uint64_t v32 = v3;
        }
        else {
          uint64_t v32 = 0;
        }
        [v8 setTailHasHorizontalFlip:v32];

        unsigned int v33 = [v8 connectedFrom];
        if (v33 == v6) {
          uint64_t v34 = v4;
        }
        else {
          uint64_t v34 = 0;
        }
        [v8 setTailHasVerticalFlip:v34];
      }
      id v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v38);
  }
}

- (void)p_setNormalizedPositionForMagnet:(BOOL)a3 withNewNormalizedPosition:(CGPoint)a4 forClineLayout:(id)a5 onLayout:(id)a6
{
  long long v18 = *(long long *)&a4.y;
  double x = a4.x;
  BOOL v7 = a3;
  id v8 = a5;
  id v9 = a6;
  memset(&v23, 0, sizeof(v23));
  double v10 = [v9 pureGeometry];
  double v11 = v10;
  if (v10) {
    [v10 fullTransform:v18];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  double v12 = [v9 parent];
  if (v12)
  {
    double v13 = [v9 parent];
    double v14 = [v13 geometryInRoot];
    double v15 = v14;
    if (v14) {
      [v14 transform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(&v23, &t1, &t2);
  }
  else
  {
    long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformConcat(&v23, &t1, &t2);
  }

  float64x2_t v17 = vaddq_f64(*(float64x2_t *)&v23.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v23.c, v19), *(float64x2_t *)&v23.a, x));
  if (v7) {
    [v8 setHeadMagnetPosition:*(_OWORD *)&v17];
  }
  else {
    [v8 setTailMagnetPosition:*(_OWORD *)&v17];
  }
}

- (void)p_updateMagnetTypeForMagnet:(BOOL)a3 forClineLayout:(id)a4
{
  BOOL v4 = a3;
  id v16 = a4;
  unsigned int v6 = [(CRLResizeKnobTracker *)self hasHorizontalFlip];
  unsigned int v7 = [(CRLResizeKnobTracker *)self hasVerticalFlip];
  id v8 = [v16 connectionLineInfo];
  id v9 = [v8 connectionLinePathSource];

  if (v4) {
    [v9 headMagnet];
  }
  else {
  double v10 = [v9 tailMagnet];
  }
  id v11 = [v10 magnetType];

  double v12 = v16;
  switch((unint64_t)v11)
  {
    case 2uLL:
      BOOL v13 = v7 == 0;
      uint64_t v14 = 2;
      uint64_t v15 = 4;
      goto LABEL_10;
    case 3uLL:
      BOOL v13 = v6 == 0;
      uint64_t v14 = 3;
      uint64_t v15 = 5;
      goto LABEL_10;
    case 4uLL:
      BOOL v13 = v7 == 0;
      uint64_t v14 = 4;
      uint64_t v15 = 2;
      goto LABEL_10;
    case 5uLL:
      BOOL v13 = v6 == 0;
      uint64_t v14 = 5;
      uint64_t v15 = 3;
LABEL_10:
      if (v13) {
        id v11 = (id)v14;
      }
      else {
        id v11 = (id)v15;
      }
      break;
    default:
      double v12 = v16;
      break;
  }
  if (v4) {
    [v12 setHeadMagnetType:v11];
  }
  else {
    [v12 setTailMagnetType:v11];
  }
}

- (void)p_revertToOriginalMagnetTypeForMagnet:(BOOL)a3 forClineLayout:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  unsigned int v6 = [v5 connectionLineInfo];
  id v8 = [v6 connectionLinePathSource];

  if (v4)
  {
    unsigned int v7 = [v8 headMagnet];
    [v5 setHeadMagnetType:[v7 magnetType]];
  }
  else
  {
    unsigned int v7 = [v8 tailMagnet];
    [v5 setTailMagnetType:[v7 magnetType]];
  }
}

- (BOOL)i_shouldForceDrag
{
  v2 = [(CRLResizeKnobTracker *)self repToMatch];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGRect)i_baseBounds
{
  double x = self->mBaseBounds.origin.x;
  double y = self->mBaseBounds.origin.y;
  double width = self->mBaseBounds.size.width;
  double height = self->mBaseBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)i_lastNewBounds
{
  double x = self->mLastNewBounds.origin.x;
  double y = self->mLastNewBounds.origin.y;
  double width = self->mLastNewBounds.size.width;
  double height = self->mLastNewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mInspectorDrivenTracking = a3;
}

- (BOOL)shouldResizeFromCenter
{
  return self->mShouldResizeFromCenter;
}

- (void)setShouldResizeFromCenter:(BOOL)a3
{
  self->mShouldResizeFromCenter = a3;
}

- (BOOL)snapEnabled
{
  return self->mSnapEnabled;
}

- (void)setSnapEnabled:(BOOL)a3
{
  self->mSnapEnabled = a3;
}

- (CGSize)minimumSize
{
  double width = self->mMinimumSize.width;
  double height = self->mMinimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->mMinimumSize = a3;
}

- (CGSize)maximumSize
{
  double width = self->mMaximumSize.width;
  double height = self->mMaximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->mMaximumSize = a3;
}

- (BOOL)canMoveKnobAcrossOpposite
{
  return self->mCanMoveKnobAcrossOpposite;
}

- (void)setCanMoveKnobAcrossOpposite:(BOOL)a3
{
  self->mCanMoveKnobAcrossOpposite = a3;
}

- (CRLCanvasRep)repToMatch
{
  return self->mRepToMatch;
}

- (void)setRepToMatch:(id)a3
{
}

- (CGPoint)secondaryHUDPoint
{
  double x = self->mSecondaryHUDPoint.x;
  double y = self->mSecondaryHUDPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSecondaryHUDPoint:(CGPoint)a3
{
  self->mSecondaryHUDPoint = a3;
}

- (BOOL)preserveAspectRatio
{
  return self->mPreserveAspectRatio;
}

- (void)setPreserveAspectRatio:(BOOL)a3
{
  self->BOOL mPreserveAspectRatio = a3;
}

- (BOOL)snapToGuides
{
  return self->mSnapToGuides;
}

- (void)setSnapToGuides:(BOOL)a3
{
  self->BOOL mSnapToGuides = a3;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)suppressSecondaryHUD
{
  return self->mSuppressSecondaryHUD;
}

- (void)setSuppressSecondaryHUD:(BOOL)a3
{
  self->mSuppressSecondaryHUD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSecondHUDController, 0);
  objc_storeStrong((id *)&self->mGuideRenderable, 0);
  objc_storeStrong((id *)&self->mResizingLayout, 0);

  objc_storeStrong((id *)&self->mRepToMatch, 0);
}

@end