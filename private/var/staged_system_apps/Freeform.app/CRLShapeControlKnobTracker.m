@interface CRLShapeControlKnobTracker
- (BOOL)wantsAutoscroll;
- (CRLShapeControlKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (CRLShapeControlLayout)shapeControlLayout;
- (CRLShapeControlRep)shapeControlRep;
- (NSArray)decoratorOverlayRenderables;
- (void)beginMovingKnob;
- (void)endMovingKnob;
- (void)moveKnobToRepPosition:(CGPoint)a3;
- (void)p_hideGuideRenderable;
- (void)p_hideHUD;
- (void)p_updateGuideRenderable;
- (void)p_updateHUDAtPoint:(CGPoint)a3;
@end

@implementation CRLShapeControlKnobTracker

- (CRLShapeControlKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CRLShapeControlKnobTracker;
  v8 = [(CRLCanvasKnobTracker *)&v21 initWithRep:v6 knob:v7];
  if (v8)
  {
    if (([v6 conformsToProtocol:&OBJC_PROTOCOL___CRLShapeControlRep] & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2640);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108C11C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2660);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker initWithRep:knob:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:42 isFatal:0 description:"CRLShapeControlRep only valid for control knob tracker"];
    }
    v12 = [v6 layout];
    unsigned __int8 v13 = [v12 conformsToProtocol:&OBJC_PROTOCOL___CRLShapeControlLayout];

    if ((v13 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2680);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108C094();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E26A0);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker initWithRep:knob:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:43 isFatal:0 description:"CRLShapeControlLayout only valid for control knob tracker"];
    }
    if ((unint64_t)[v7 tag] < 0xC || (unint64_t)objc_msgSend(v7, "tag") >= 0x11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E26C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108C00C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E26E0);
      }
      v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker initWithRep:knob:]");
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:44 isFatal:0 description:"wrong knob for control knob tracker"];
    }
  }

  return v8;
}

- (CRLShapeControlLayout)shapeControlLayout
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  v3 = [v2 layout];
  uint64_t v4 = objc_opt_class();
  v10 = sub_100246DEC(v3, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLShapeControlLayout);

  return (CRLShapeControlLayout *)v10;
}

- (CRLShapeControlRep)shapeControlRep
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v3 = objc_opt_class();
  uint64_t v9 = sub_100246DEC(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLShapeControlRep);

  return (CRLShapeControlRep *)v9;
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->mNeedsDecoratorUpdate)
  {
    [(CRLShapeControlKnobTracker *)self p_updateGuideRenderable];
    self->mNeedsDecoratorUpdate = 0;
  }
  if (self->mGuideRenderable)
  {
    mGuideRenderable = self->mGuideRenderable;
    uint64_t v3 = +[NSArray arrayWithObjects:&mGuideRenderable count:1];
  }
  else
  {
    uint64_t v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (BOOL)wantsAutoscroll
{
  return 1;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(CRLShapeControlKnobTracker *)self shapeControlRep];
  [v8 dynamicallyMovedSmartShapeKnobTo:self x:x y:y];
  -[CRLShapeControlKnobTracker p_updateHUDAtPoint:](self, "p_updateHUDAtPoint:", x, y);
  self->mNeedsDecoratorUpdate = 1;
  uint64_t v6 = [v8 interactiveCanvasController];
  [v6 invalidateLayersForDecorator:self];

  uint64_t v7 = [v8 layout];
  [v7 adjustCustomMagnetPositions];
}

- (void)beginMovingKnob
{
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeControlKnobTracker;
  [(CRLCanvasKnobTracker *)&v9 beginMovingKnob];
  uint64_t v3 = [(CRLShapeControlKnobTracker *)self shapeControlRep];
  uint64_t v4 = [v3 interactiveCanvasController];
  uint64_t v5 = [v4 commandController];
  [v5 openGroup];

  uint64_t v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"Resize" value:0 table:@"UndoStrings"];
  id v8 = [v4 commandController];
  [v8 setCurrentGroupActionString:v7];

  [v4 addDecorator:self];
  [v3 dynamicMoveSmartShapeKnobDidBegin];
}

- (void)endMovingKnob
{
  v24.receiver = self;
  v24.super_class = (Class)CRLShapeControlKnobTracker;
  [(CRLCanvasKnobTracker *)&v24 endMovingKnob];
  uint64_t v3 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v4 = [v3 layout];
  uint64_t v5 = [v4 commandsForAdjustingMagnetsFromClineLayouts];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = [(CRLCanvasKnobTracker *)self icc];
        unsigned __int8 v13 = [v12 commandController];
        [v13 enqueueCommand:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (![(CRLCanvasKnobTracker *)self didBegin])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2700);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C1A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2720);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker endMovingKnob]", (void)v20);
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:111 isFatal:0 description:"Ending knob when we didn't begin!"];
  }
  if ([(CRLCanvasKnobTracker *)self didBegin])
  {
    v17 = [(CRLShapeControlKnobTracker *)self shapeControlRep];
    v18 = [v17 interactiveCanvasController];
    [v17 dynamicMoveSmartShapeKnobDidEndWithTracker:self];
    v19 = [v18 commandController];
    [v19 closeGroup];
  }
  [(CRLShapeControlKnobTracker *)self p_hideHUD];
  [(CRLShapeControlKnobTracker *)self p_hideGuideRenderable];
}

- (void)p_updateGuideRenderable
{
  uint64_t v3 = [(CRLShapeControlKnobTracker *)self shapeControlLayout];
  uint64_t v4 = [v3 smartPathSource];
  uint64_t v5 = [(CRLCanvasKnobTracker *)self knob];
  id v6 = (const CGPath *)[v4 newFeedbackPathForKnob:[v5 tag]];

  if (v6)
  {
    if (!self->mGuideRenderable)
    {
      id v7 = [(CRLCanvasKnobTracker *)self rep];
      id v8 = [v7 interactiveCanvasController];

      uint64_t v9 = [(CRLCanvasKnobTracker *)self rep];
      v10 = [(CRLShapeControlKnobTracker *)self shapeControlRep];
      [v10 centerForGuideRenderablePlacement];
      [v9 convertNaturalPointToUnscaledCanvas:];
      [v8 convertUnscaledToBoundsPoint:];
      CGFloat v12 = v11;
      CGFloat v14 = v13;

      v15 = +[CRLCanvasShapeRenderable renderable];
      mGuideRenderable = self->mGuideRenderable;
      self->mGuideRenderable = v15;

      long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v37.c = v17;
      *(_OWORD *)&v37.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
      *(_OWORD *)&v36.a = *(_OWORD *)&v37.a;
      *(_OWORD *)&v36.c = v17;
      *(_OWORD *)&v36.tdouble x = *(_OWORD *)&v37.tx;
      CGAffineTransformTranslate(&v37, &v36, v12, v14);
      v18 = [(CRLCanvasKnobTracker *)self rep];
      v19 = [v18 canvas];
      [v19 viewScale];
      CGFloat v21 = v20;
      long long v22 = [(CRLCanvasKnobTracker *)self rep];
      long long v23 = [v22 canvas];
      [v23 viewScale];
      CGAffineTransform v35 = v37;
      CGAffineTransformScale(&v36, &v35, v21, v24);
      CGAffineTransform v37 = v36;

      v25 = [(CRLCanvasKnobTracker *)self rep];
      v26 = [v25 info];
      v27 = [v26 geometry];
      [v27 angle];
      CGAffineTransform v35 = v37;
      CGAffineTransformRotate(&v36, &v35, v28 * -0.0174532925);
      CGAffineTransform v37 = v36;

      [v4 naturalSize];
      CGAffineTransform v35 = v37;
      CGAffineTransformTranslate(&v36, &v35, v29 * -0.5, v30 * -0.5);
      CGAffineTransform v37 = v36;
      [v3 pathBoundsWithoutStroke];
      CGAffineTransform v35 = v37;
      CGAffineTransformTranslate(&v36, &v35, v31, v32);
      CGAffineTransform v37 = v36;
      v33 = sub_1000D5540(v6, &v36);
      [(CRLCanvasShapeRenderable *)self->mGuideRenderable setPath:v33];
      CGPathRelease(v33);
      v34 = +[CRLColor colorWithWhite:0.5 alpha:0.5];
      -[CRLCanvasShapeRenderable setStrokeColor:](self->mGuideRenderable, "setStrokeColor:", [v34 CGColor]);

      [(CRLCanvasShapeRenderable *)self->mGuideRenderable setFillColor:0];
    }
    CGPathRelease(v6);
  }
}

- (void)p_hideGuideRenderable
{
  id v4 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v3 = [v4 interactiveCanvasController];
  [v3 removeDecorator:self];
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  id v33 = [(CRLShapeControlKnobTracker *)self shapeControlLayout];
  id v4 = [v33 smartPathSource];
  uint64_t v5 = [(CRLCanvasKnobTracker *)self knob];
  id v6 = [v4 getFeedbackStringForKnob:[v5 tag]];

  if ([v6 length])
  {
    id v7 = [(CRLCanvasKnobTracker *)self rep];
    id v8 = [v7 interactiveCanvasController];

    uint64_t v9 = +[CRLCanvasHUDController sharedHUDController];
    [v9 setLabelText:v6];
    v10 = [v8 canvasView];
    double v11 = [(CRLCanvasKnobTracker *)self rep];
    [v11 boundsForStandardKnobs];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v35.origin.double x = v13;
    v35.origin.double y = v15;
    v35.size.width = v17;
    v35.size.height = v19;
    double MidX = CGRectGetMidX(v35);
    v36.origin.double x = v13;
    v36.origin.double y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    double MinY = CGRectGetMinY(v36);
    long long v22 = [(CRLCanvasKnobTracker *)self rep];
    [v22 convertNaturalPointToUnscaledCanvas:MidX, MinY];
    double v24 = v23;
    double v26 = v25;

    v27 = [(CRLCanvasKnobTracker *)self rep];
    double v28 = [v27 interactiveCanvasController];
    [v28 convertUnscaledToBoundsPoint:v24, v26];
    double v30 = v29;
    double v32 = v31;

    [v9 showHUDForKey:self forTouchPoint:v10 inCanvasView:sub_1000674F0(v30 withUpwardsNudge:v32)];
  }
}

- (void)p_hideHUD
{
  id v3 = +[CRLCanvasHUDController sharedHUDController];
  [v3 hideHUDForKey:self];
}

- (void).cxx_destruct
{
}

@end