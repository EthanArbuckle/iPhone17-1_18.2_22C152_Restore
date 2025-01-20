@interface CRLConnectionLineKnobTracker
+ (double)crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:(double)a3;
- (BOOL)didChangeGeometry;
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)p_connectedToCenter;
- (BOOL)p_isValidConnectionDestination:(id)a3;
- (BOOL)p_shouldIncludeCardinalMagnet:(unint64_t)a3 forLayout:(id)a4;
- (BOOL)resizeFromCenter;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)shouldSnapToMagnets;
- (BOOL)snapAngles;
- (BOOL)snapEnabled;
- (CGPoint)p_getMagnetPositionAdjustedToParentForLayout:(id)a3 withOriginalMagnetPosition:(CGPoint)a4;
- (CGPoint)p_getSnappedMagnetNormalizedPosition;
- (CRLConnectionLineKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (double)p_getMagnetSnappingDistance;
- (id)connectedRepForHighlighting;
- (id)connectionLineLayout;
- (id)p_findLayoutWithNearestMagnetInRect:(CGRect)a3 nearestMagnet:(unint64_t *)a4;
- (unint64_t)p_getSnappedMagnetType;
- (void)beginMovingKnob;
- (void)endMovingKnob;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)moveKnobToRepPosition:(CGPoint)a3;
- (void)p_createFloatingOrEdgeMagnetAtKnob;
- (void)p_keepSnappedMagnetOnCenter;
- (void)p_retrieveMagnetPositionsForLayout:(id)a3;
- (void)p_retrieveMagnetsForLayoutsNearKnob;
- (void)p_setUserAdjustedShapeControlKnob:(BOOL)a3;
- (void)p_snapToCenterIfLayoutHasConnectionWithoutMagnet;
- (void)p_snapToNearestMagnetFromKnob;
- (void)p_updateConnection;
- (void)p_updateLayout;
- (void)p_updateMagnetPositionsForConnectionLineLayout:(id)a3 withinLayout:(id)a4;
- (void)p_updateMagnetRenderables;
- (void)p_updateRoutingProperties;
- (void)p_validateLayout;
- (void)setResizeFromCenter:(BOOL)a3;
- (void)setShouldSnapToMagnets:(BOOL)a3;
- (void)setSnapAngles:(BOOL)a3;
- (void)setSnapEnabled:(BOOL)a3;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLConnectionLineKnobTracker

- (CRLConnectionLineKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CRLConnectionLineKnobTracker;
  v8 = [(CRLCanvasKnobTracker *)&v31 initWithRep:v6 knob:v7];
  v9 = v8;
  if (v8)
  {
    v8->mSnapEnabled = 1;
    mSnappedMagnet = v8->mSnappedMagnet;
    v8->mSnappedMagnet = 0;

    v9->mKnobTag = 0;
    v9->mKnobMoved = 1;
    v9->mShouldSnapToMagnets = 1;
    v11 = (objc_class *)objc_opt_class();
    v12 = [v6 layout];
    v13 = sub_10024715C(v11, v12);

    p_x = (void *)&v9->mOriginalKnobCenterNaturalSpace.x;
    if ([v7 tag] == (id)11)
    {
      [v13 unclippedHeadPoint];
      void *p_x = v15;
      v9->mOriginalKnobCenterNaturalSpace.y = v16;
      v9->mNewKnobCenterNaturalSpace = *(CGPoint *)p_x;
      [v13 unclippedTailPoint];
    }
    else
    {
      [v13 unclippedTailPoint];
      void *p_x = v19;
      v9->mOriginalKnobCenterNaturalSpace.y = v20;
      v9->mNewKnobCenterNaturalSpace = *(CGPoint *)p_x;
      [v13 unclippedHeadPoint];
    }
    v9->mOriginalFixedPointNaturalSpace.x = v17;
    v9->mOriginalFixedPointNaturalSpace.y = v18;
    [v13 unclippedTailPoint];
    double v22 = v21;
    double v24 = v23;
    [v13 unclippedHeadPoint];
    v9->mOriginalMiddlePointNaturalSpace.x = sub_100065E00(v22, v24, v25, v26, 0.5);
    v9->mOriginalMiddlePointNaturalSpace.y = v27;
    [v13 pathBounds];
    v9->mOriginalPathToBoundsOrigin.x = v28;
    v9->mOriginalPathToBoundsOrigin.y = v29;
  }
  return v9;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  id v6 = [(CRLCanvasKnobTracker *)self icc];
  if ([v6 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime])
  {
    v4 = [(CRLCanvasKnobTracker *)self rep];
    unsigned int v5 = [v4 allowsSupportedDynamicOperationsToBeRealTime];

    if (v5) {
      self->mIsEnqueueingCommandsInRealTime = 1;
    }
  }
  else
  {
  }
}

- (void)beginMovingKnob
{
  v35.receiver = self;
  v35.super_class = (Class)CRLConnectionLineKnobTracker;
  [(CRLCanvasKnobTracker *)&v35 beginMovingKnob];
  v3 = (objc_class *)objc_opt_class();
  v4 = [(CRLCanvasKnobTracker *)self rep];
  unsigned int v5 = [v4 layout];
  id v6 = sub_10024715C(v3, v5);

  id v7 = [v6 connectedFrom];
  mOriginalConnectedFrom = self->mOriginalConnectedFrom;
  self->mOriginalConnectedFrom = v7;

  v9 = [v6 connectedTo];
  mOriginalConnectedTo = self->mOriginalConnectedTo;
  self->mOriginalConnectedTo = v9;

  v11 = [(CRLCanvasKnobTracker *)self rep];
  v12 = (objc_class *)objc_opt_class();
  v13 = [v11 dynamicMoveSmartShapeKnobDidBegin];
  sub_10024715C(v12, v13);
  v14 = (CRLConnectionLineAbstractLayout *)objc_claimAutoreleasedReturnValue();
  mResizingLayout = self->mResizingLayout;
  self->mResizingLayout = v14;

  CGFloat v16 = [(CRLCanvasKnobTracker *)self rep];
  self->mKnobsVisible = [v16 shouldCreateKnobs];

  CGFloat v17 = [(CRLCanvasKnobTracker *)self knob];
  if ([v17 tag] == (id)11 && self->mOriginalConnectedTo)
  {
    self->mInitialSnap = 1;
  }
  else
  {
    CGFloat v18 = [(CRLCanvasKnobTracker *)self knob];
    BOOL v19 = [v18 tag] == (id)10 && self->mOriginalConnectedFrom != 0;
    self->mInitialSnap = v19;
  }
  [(CRLCanvasKnobTracker *)self currentPosition];
  self->mInitialPosition.x = v20;
  self->mInitialPosition.y = v21;
  if (v6)
  {
    [v6 transformInRoot];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
  }
  *(_OWORD *)&self->mOriginalTransformInRoot.a = v32;
  *(_OWORD *)&self->mOriginalTransformInRoot.c = v33;
  *(_OWORD *)&self->mOriginalTransformInRoot.tx = v34;
  self->mKnobTag = 0;
  self->mKnobMoved = 0;
  self->mKnobPosition = (CGPoint)xmmword_101175160;
  self->mKnobPositionAtStart = (CGPoint)xmmword_101175160;
  [v6 setDrawClippedHeadPortion:0 v32, v33, v34];
  [v6 setDrawClippedTailPortion:0];
  [v6 setControlKnobPositionChangedFromRouting:0];
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    double v22 = [(CRLCanvasKnobTracker *)self rep];
    double v23 = [v22 interactiveCanvasController];
    double v24 = [v23 commandController];

    double v25 = [(CRLCanvasKnobTracker *)self rep];
    double v26 = [v25 interactiveCanvasController];
    CGFloat v27 = [v26 editorController];
    CGFloat v28 = [v27 selectionPath];

    CGFloat v29 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v28 reverseSelectionPath:v28];
    [v24 openGroupWithSelectionBehavior:v29];
    v30 = +[NSBundle mainBundle];
    objc_super v31 = [v30 localizedStringForKey:@"Move" value:0 table:@"UndoStrings"];
    [v24 setCurrentGroupActionString:v31];

    [v24 enableRealTimeSyncProgressiveEnqueuingInCurrentGroup];
  }
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  long long v20 = *(long long *)&a3.y;
  double x = a3.x;
  v4 = [(CRLCanvasKnobTracker *)self knob];
  self->unint64_t mKnobTag = (unint64_t)[v4 tag];

  unint64_t mKnobTag = self->mKnobTag;
  if (mKnobTag - 10 >= 2)
  {
    if (mKnobTag == 12) {
      [(CRLConnectionLineKnobTracker *)self p_setUserAdjustedShapeControlKnob:1];
    }
  }
  else
  {
    p_mKnobPosition = &self->mKnobPosition;
    self->mKnobPosition.double x = x;
    *(void *)&self->mKnobPosition.double y = v20;
    p_mKnobPositionAtStart = &self->mKnobPositionAtStart;
    double v8 = self->mKnobPositionAtStart.x;
    double y = self->mKnobPositionAtStart.y;
    BOOL v10 = sub_100065BF8(v8, y);
    double v12 = *(double *)&v20;
    double v11 = x;
    if (v10)
    {
      CGPoint *p_mKnobPositionAtStart = *p_mKnobPosition;
      double v8 = p_mKnobPositionAtStart->x;
      double y = self->mKnobPositionAtStart.y;
      double v11 = p_mKnobPosition->x;
      double v12 = self->mKnobPosition.y;
    }
    if (sub_1000653B4(v8, y, v11, v12) > 10.0)
    {
      self->mKnobMoved = 1;
      [(CRLConnectionLineKnobTracker *)self p_setUserAdjustedShapeControlKnob:0];
    }
    [(CRLConnectionLineKnobTracker *)self p_retrieveMagnetsForLayoutsNearKnob];
    [(CRLConnectionLineKnobTracker *)self p_snapToNearestMagnetFromKnob];
    if (!self->mSnappedMagnet) {
      [(CRLConnectionLineKnobTracker *)self p_createFloatingOrEdgeMagnetAtKnob];
    }
    [(CRLConnectionLineKnobTracker *)self p_updateConnection];
    [(CRLConnectionLineKnobTracker *)self p_updateLayout];
    [(CRLConnectionLineKnobTracker *)self p_updateMagnetRenderables];
    double x = p_mKnobPosition->x;
    *(CGFloat *)&long long v13 = self->mKnobPosition.y;
    long long v20 = v13;
  }
  int mKnobsVisible = self->mKnobsVisible;
  uint64_t v15 = [(CRLCanvasKnobTracker *)self rep];
  unsigned int v16 = [v15 shouldCreateKnobs];

  if (mKnobsVisible != v16)
  {
    CGFloat v17 = [(CRLCanvasKnobTracker *)self rep];
    self->int mKnobsVisible = [v17 shouldCreateKnobs];

    CGFloat v18 = [(CRLCanvasKnobTracker *)self rep];
    [v18 invalidateKnobs];
  }
  long long v19 = *(_OWORD *)&self->mOriginalTransformInRoot.c;
  *(_OWORD *)&v23.a = *(_OWORD *)&self->mOriginalTransformInRoot.a;
  *(_OWORD *)&v23.c = v19;
  *(_OWORD *)&v23.tdouble x = *(_OWORD *)&self->mOriginalTransformInRoot.tx;
  CGAffineTransformInvert(&v24, &v23);
  [(CRLConnectionLineKnobTracker *)self moveKnobToRepPosition:vaddq_f64(*(float64x2_t *)&v24.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, v21), *(float64x2_t *)&v24.a, x))];
}

- (void)p_retrieveMagnetsForLayoutsNearKnob
{
  v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mMagnets = self->mMagnets;
  self->mMagnets = v4;

  p_mLayoutUnderKnob = &self->mLayoutUnderKnob;
  mLayoutUnderKnob = self->mLayoutUnderKnob;
  self->mLayoutUnderKnob = 0;

  uint64_t v37 = 0;
  p_mKnobPosition = &self->mKnobPosition;
  v9 = -[CRLConnectionLineKnobTracker p_findLayoutWithNearestMagnetInRect:nearestMagnet:](self, "p_findLayoutWithNearestMagnetInRect:nearestMagnet:", &v37, self->mKnobPosition.x + -50.0, self->mKnobPosition.y + -50.0, 100.0, 100.0);
  if (v9)
  {
    [(CRLConnectionLineKnobTracker *)self p_retrieveMagnetPositionsForLayout:v9];
    [v9 boundsForStandardKnobs];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v18 = [v9 geometry];
    v2 = v18;
    if (v18) {
      [v18 transform];
    }
    else {
      memset(&v36, 0, sizeof(v36));
    }
    v39.origin.CGFloat x = v11;
    v39.origin.CGFloat y = v13;
    v39.size.CGFloat width = v15;
    v39.size.CGFloat height = v17;
    CGRect v40 = CGRectApplyAffineTransform(v39, &v36);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;

    v38.CGFloat x = p_mKnobPosition->x;
    v38.CGFloat y = self->mKnobPosition.y;
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    if (CGRectContainsPoint(v41, v38))
    {
      v2 = [v9 convexHullPath];
      if (!v2) {
        goto LABEL_11;
      }
      CGAffineTransform v23 = [v9 geometry];
      CGAffineTransform v24 = v23;
      if (v23) {
        [v23 transform];
      }
      else {
        memset(&v34, 0, sizeof(v34));
      }
      CGAffineTransformInvert(&v35, &v34);
      unsigned int v25 = [v2 containsPoint:vaddq_f64(*(float64x2_t *)&v35.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v35.c, self->mKnobPosition.y), *(float64x2_t *)&v35.a, p_mKnobPosition->x))];

      if (v25) {
LABEL_11:
      }
        objc_storeStrong((id *)&self->mLayoutUnderKnob, v9);
    }
  }
  if (!*p_mLayoutUnderKnob && !self->mKnobMoved)
  {
    unint64_t mKnobTag = self->mKnobTag;
    if (mKnobTag == 10)
    {
      v2 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
      CGFloat v27 = [v2 connectedFrom];
      if (v27)
      {

LABEL_24:
        unint64_t v30 = self->mKnobTag;
        objc_super v31 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
        v2 = v31;
        if (v30 == 10) {
          [v31 connectedFrom];
        }
        else {
        uint64_t v32 = [v31 connectedTo];
        }
        long long v33 = *p_mLayoutUnderKnob;
        *p_mLayoutUnderKnob = (CRLCanvasLayout *)v32;

        goto LABEL_28;
      }
      if (self->mKnobTag != 11)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else if (mKnobTag != 11)
    {
      goto LABEL_29;
    }
    CGFloat v28 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
    CGFloat v29 = [v28 connectedTo];

    if (mKnobTag == 10) {
    if (v29)
    }
      goto LABEL_24;
  }
LABEL_29:
  [(CRLConnectionLineKnobTracker *)self p_updateRoutingProperties];
}

- (void)p_updateRoutingProperties
{
  v3 = (objc_class *)objc_opt_class();
  v4 = [(CRLCanvasKnobTracker *)self rep];
  unsigned int v5 = [v4 layout];
  id v6 = sub_10024715C(v3, v5);

  uint64_t v35 = 0;
  [v6 headPoint];
  double v8 = v7;
  double v10 = v9;
  if (v6)
  {
    [v6 transform];
    double v11 = *((double *)&v32 + 1);
    double v12 = *(double *)&v32;
    double v13 = *((double *)&v33 + 1);
    double v14 = *(double *)&v33;
    double v15 = v34[1];
    double v16 = v34[0];
  }
  else
  {
    long long v33 = 0u;
    *(_OWORD *)CGAffineTransform v34 = 0u;
    long long v32 = 0u;
    double v15 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
    double v16 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
  }
  CGFloat v17 = -[CRLConnectionLineKnobTracker p_findLayoutWithNearestMagnetInRect:nearestMagnet:](self, "p_findLayoutWithNearestMagnetInRect:nearestMagnet:", &v35, v16 + v10 * v14 + v12 * v8 + -50.0, v15 + v10 * v13 + v11 * v8 + -50.0, 100.0, 100.0);
  [v6 setHeadNearestLayoutForRouting:v17];

  [v6 setHeadNearestMagnetTypeForRouting:v35];
  [v6 tailPoint];
  double v19 = v18;
  double v21 = v20;
  if (v6)
  {
    [v6 transform];
    double v22 = *((double *)&v29 + 1);
    double v23 = *(double *)&v29;
    double v24 = *((double *)&v30 + 1);
    double v25 = *(double *)&v30;
    double v26 = *((double *)&v31 + 1);
    double v27 = *(double *)&v31;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    double v26 = 0.0;
    double v24 = 0.0;
    double v22 = 0.0;
    double v27 = 0.0;
    double v25 = 0.0;
    double v23 = 0.0;
  }
  CGFloat v28 = -[CRLConnectionLineKnobTracker p_findLayoutWithNearestMagnetInRect:nearestMagnet:](self, "p_findLayoutWithNearestMagnetInRect:nearestMagnet:", &v35, v27 + v21 * v25 + v23 * v19 + -50.0, v26 + v21 * v24 + v22 * v19 + -50.0, 100.0, 100.0, v29, v30, v31, v32, v33, *(_OWORD *)v34);
  [v6 setTailNearestLayoutForRouting:v28];

  [v6 setTailNearestMagnetTypeForRouting:v35];
}

- (id)p_findLayoutWithNearestMagnetInRect:(CGRect)a3 nearestMagnet:(unint64_t *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(CRLCanvasKnobTracker *)self icc];
  double v11 = [v10 canvas];
  double v12 = [v11 layoutController];
  double v13 = [v12 layoutsInRect:x, y, width, height];

  double v14 = [(CRLCanvasKnobTracker *)self icc];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1003D7654;
  v39[3] = &unk_1014D0498;
  v39[4] = self;
  double v15 = [v14 hitRep:v39 passingTest:self->mKnobPosition.x, self->mKnobPosition.y];

  if (v15)
  {
    double v16 = [v15 repForSelecting];
    CGFloat v17 = [v16 layout];
    mLayoutUnderKnob = self->mLayoutUnderKnob;
    self->mLayoutUnderKnob = v17;

    double v19 = self->mLayoutUnderKnob;
  }
  else if (self->mLayoutUnderKnob)
  {
    double v19 = 0;
  }
  else
  {
    long long v33 = v13;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obunint64_t j = v13;
    id v20 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      double v19 = 0;
      uint64_t v22 = *(void *)v36;
      double v23 = 1.79769313e308;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obj);
          }
          double v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([(CRLConnectionLineKnobTracker *)self p_isValidConnectionDestination:v25])
          {
            for (unint64_t j = 2; j != 6; ++j)
            {
              [v25 getCardinalPositionWithParentTransformFromType:j];
              double v29 = sub_1000653B4(self->mKnobPosition.x, self->mKnobPosition.y, v27, v28);
              if (v29 < v23)
              {
                double v30 = v29;
                long long v31 = v25;

                *a4 = j;
                double v19 = v31;
                double v23 = v30;
              }
            }
          }
        }
        id v21 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v21);
    }
    else
    {
      double v19 = 0;
    }

    double v15 = 0;
    double v13 = v33;
  }

  return v19;
}

- (void)p_retrieveMagnetPositionsForLayout:(id)a3
{
  id v4 = a3;
  mMagnets = self->mMagnets;
  id v6 = [CRLConnectionLineMagnetInfo alloc];
  [v4 getCardinalPositionWithParentTransformFromType:1];
  double v7 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v6, "initWithType:position:layout:connected:", 1, v4, 0);
  [(NSMutableSet *)mMagnets addObject:v7];

  for (uint64_t i = 2; i != 6; ++i)
  {
    [v4 getCardinalPositionWithParentTransformFromType:i];
    double v10 = v9;
    double v12 = v11;
    if ([(CRLConnectionLineKnobTracker *)self p_shouldIncludeCardinalMagnet:i forLayout:v4])
    {
      double v13 = self->mMagnets;
      double v14 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:]([CRLConnectionLineMagnetInfo alloc], "initWithType:position:layout:connected:", i, v4, 0, v10, v12);
      [(NSMutableSet *)v13 addObject:v14];
    }
  }
  double v15 = [v4 connectedLayouts];

  if (v15)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v16 = [v4 connectedLayouts];
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        id v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v20);
          uint64_t v22 = [(CRLCanvasKnobTracker *)self rep];
          double v23 = [v22 layout];

          if (v21 != v23) {
            [(CRLConnectionLineKnobTracker *)self p_updateMagnetPositionsForConnectionLineLayout:v21 withinLayout:v4];
          }
          id v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }
  }
}

- (BOOL)p_shouldIncludeCardinalMagnet:(unint64_t)a3 forLayout:(id)a4
{
  id v5 = a4;
  [v5 getCardinalPositionWithParentTransformFromType:a3];
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = 0;
  for (unint64_t i = 1; i != 6; ++i)
  {
    if (a3 != i)
    {
      [v5 getCardinalPositionWithParentTransformFromType:i];
      if (sub_1000653B4(v7, v9, v12, v13) < 10.0) {
        break;
      }
    }
    BOOL v10 = i > 4;
  }

  return v10;
}

- (void)p_updateMagnetPositionsForConnectionLineLayout:(id)a3 withinLayout:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  if ([v29 headMagnetType])
  {
    double v7 = [v29 connectedTo];

    if (v7)
    {
      id v8 = [v29 connectedTo];

      if (v8 == v6)
      {
        double v9 = [v29 connectedTo];
        [v29 headMagnetCanvasPosition];
        -[CRLConnectionLineKnobTracker p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:](self, "p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:", v9);
        double v11 = v10;
        double v13 = v12;

        double v14 = [CRLConnectionLineMagnetInfo alloc];
        id v15 = [v29 headMagnetType];
        double v16 = [v29 connectedTo];
        id v17 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v14, "initWithType:position:layout:connected:", v15, v16, 1, v11, v13);

        [(NSMutableSet *)self->mMagnets addObject:v17];
      }
    }
  }
  if ([v29 tailMagnetType])
  {
    id v18 = [v29 connectedFrom];

    if (v18)
    {
      id v19 = [v29 connectedFrom];

      if (v19 == v6)
      {
        id v20 = [v29 connectedFrom];
        [v29 tailMagnetCanvasPosition];
        -[CRLConnectionLineKnobTracker p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:](self, "p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:", v20);
        double v22 = v21;
        double v24 = v23;

        long long v25 = [CRLConnectionLineMagnetInfo alloc];
        id v26 = [v29 tailMagnetType];
        long long v27 = [v29 connectedFrom];
        double v28 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v25, "initWithType:position:layout:connected:", v26, v27, 1, v22, v24);

        [(NSMutableSet *)self->mMagnets addObject:v28];
      }
    }
  }
}

- (CGPoint)p_getMagnetPositionAdjustedToParentForLayout:(id)a3 withOriginalMagnetPosition:(CGPoint)a4
{
  long long v12 = *(long long *)&a4.y;
  CGPoint v13 = a4;
  id v4 = a3;
  float64x2_t v15 = 0u;
  float64x2_t v16 = 0u;
  float64x2_t v14 = 0u;
  id v5 = [v4 parent];
  if (v5)
  {
    id v6 = [v4 parent:v12, v13];
    double v7 = [v6 geometryInRoot];
    id v8 = v7;
    if (v7)
    {
      [v7 transform];
    }
    else
    {
      float64x2_t v15 = 0u;
      float64x2_t v16 = 0u;
      float64x2_t v14 = 0u;
    }
  }
  else
  {
    float64x2_t v14 = *(float64x2_t *)&CGAffineTransformIdentity.a;
    float64x2_t v15 = *(float64x2_t *)&CGAffineTransformIdentity.c;
    float64x2_t v16 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
  }

  float64x2_t v11 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, *(double *)&v12), v14, v13.x));
  double v10 = v11.f64[1];
  double v9 = v11.f64[0];
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)p_snapToNearestMagnetFromKnob
{
  [(CRLConnectionLineKnobTracker *)self p_getMagnetSnappingDistance];
  double v4 = v3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->mMagnets;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v27;
    double v10 = 1.79769313e308;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        CGPoint v13 = [v12 layout:v26];
        float64x2_t v14 = [(CRLCanvasKnobTracker *)self rep];
        float64x2_t v15 = [v14 layout];

        if (v13 != v15)
        {
          [v12 position];
          double v18 = sub_1000653B4(self->mKnobPosition.x, self->mKnobPosition.y, v16, v17);
          if (v18 < v4 && v18 < v10)
          {
            double v20 = v18;
            id v21 = v12;

            double v10 = v20;
            id v8 = v21;
          }
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  objc_storeStrong((id *)&self->mSnappedMagnet, v8);
  [(CRLConnectionLineKnobTracker *)self p_snapToCenterIfLayoutHasConnectionWithoutMagnet];
  mSnappedMagnet = self->mSnappedMagnet;
  if (mSnappedMagnet)
  {
    p_mKnobPosition = &self->mKnobPosition;
    [(CRLConnectionLineMagnetInfo *)mSnappedMagnet position];
    p_mKnobPosition->double x = v24;
    p_mKnobPosition->double y = v25;
  }
}

- (void)p_snapToCenterIfLayoutHasConnectionWithoutMagnet
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasKnobTracker *)self rep];
  id v5 = [v4 layout];
  sub_1002469D0(v3, v5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t mKnobTag = self->mKnobTag;
  if (mKnobTag == 11)
  {
    if (![v13 headMagnetType])
    {
      id v8 = [v13 connectedTo];
      if (v8)
      {

        goto LABEL_10;
      }
    }
    unint64_t mKnobTag = self->mKnobTag;
  }
  if (mKnobTag == 10 && ![v13 tailMagnetType])
  {
    id v7 = [v13 connectedFrom];

    if (v7)
    {
LABEL_10:
      if (self->mKnobTag == 11) {
        [v13 connectedTo];
      }
      else {
      uint64_t v9 = [v13 connectedFrom];
      }
      double v10 = [CRLConnectionLineMagnetInfo alloc];
      [v9 getCardinalPositionWithParentTransformFromType:1];
      float64x2_t v11 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v10, "initWithType:position:layout:connected:", 1, v9, 1);
      mSnappedMagnet = self->mSnappedMagnet;
      self->mSnappedMagnet = v11;
    }
  }
}

- (double)p_getMagnetSnappingDistance
{
  if (!self->mShouldSnapToMagnets) {
    return 0.0;
  }
  v2 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v3 = [v2 interactiveCanvasController];
  [v3 viewScale];
  double v5 = 10.0 / v4 * 2.5;

  return v5;
}

+ (double)crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:(double)a3
{
  return 10.0 / a3 * 2.5;
}

- (void)p_createFloatingOrEdgeMagnetAtKnob
{
  [(CRLConnectionLineKnobTracker *)self p_getMagnetSnappingDistance];
  mLayoutUnderKnob = self->mLayoutUnderKnob;
  if (mLayoutUnderKnob)
  {
    double v5 = v3;
    p_mKnobPosition = &self->mKnobPosition;
    -[CRLCanvasLayout nearestEdgePointOnWrapPathFromPoint:](mLayoutUnderKnob, "nearestEdgePointOnWrapPathFromPoint:", self->mKnobPosition.x, self->mKnobPosition.y);
    double v8 = v7;
    double v10 = v9;
    double v11 = sub_1000653B4(self->mKnobPosition.x, self->mKnobPosition.y, v7, v9);
    long long v12 = [CRLConnectionLineMagnetInfo alloc];
    id v13 = self->mLayoutUnderKnob;
    if (v11 >= v5)
    {
      double v16 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v12, "initWithType:position:layout:connected:", 7, v13, 1, p_mKnobPosition->x, self->mKnobPosition.y);
      mSnappedMagnet = self->mSnappedMagnet;
      self->mSnappedMagnet = v16;
    }
    else
    {
      float64x2_t v14 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v12, "initWithType:position:layout:connected:", 6, v13, 1, v8, v10);
      float64x2_t v15 = self->mSnappedMagnet;
      self->mSnappedMagnet = v14;

      p_mKnobPosition->double x = v8;
      self->mKnobPosition.double y = v10;
    }
  }
}

- (void)p_updateConnection
{
  double v3 = [(CRLCanvasKnobTracker *)self rep];
  double v4 = [v3 layout];

  if (!self->mSnappedMagnet)
  {
    if (!self->mKnobMoved) {
      goto LABEL_27;
    }
    id v6 = [(CRLCanvasKnobTracker *)self knob];
    if ([v6 tag] == (id)11)
    {
      double v7 = [v4 connectedTo];

      if (v7)
      {
        [v4 setConnectedTo:0];
        [v4 setHeadMagnetType:0];
LABEL_25:
        mConnectedRepForHighlighting = self->mConnectedRepForHighlighting;
        self->mConnectedRepForHighlighting = 0;
        goto LABEL_26;
      }
    }
    else
    {
    }
    double v18 = [(CRLCanvasKnobTracker *)self knob];
    if ([v18 tag] == (id)10)
    {
      id v19 = [v4 connectedFrom];

      if (v19)
      {
        [v4 setConnectedFrom:0];
        [v4 setTailMagnetType:0];
      }
    }
    else
    {
    }
    goto LABEL_25;
  }
  double v5 = [(CRLCanvasKnobTracker *)self knob];
  if ([v5 tag] == (id)11) {
    [v4 connectedTo];
  }
  else {
  mConnectedRepForHighlighting = [v4 connectedFrom];
  }

  if (mConnectedRepForHighlighting)
  {
    double v5 = [(CRLCanvasKnobTracker *)self icc];
    double v9 = [v5 repForLayout:mConnectedRepForHighlighting];
  }
  else
  {
    double v9 = 0;
  }
  objc_storeStrong((id *)&self->mConnectedRepForHighlighting, v9);
  if (mConnectedRepForHighlighting)
  {
  }
  double v10 = [(CRLCanvasKnobTracker *)self knob];
  id v11 = [v10 tag];

  long long v12 = [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet layout];
  if (v11 == (id)11)
  {
    id v13 = [v4 connectedTo];

    if (v12 != v13)
    {
      float64x2_t v14 = [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet layout];
      [v4 setConnectedTo:v14];
LABEL_19:

      mConnectedRepForHighlighting = [(CRLCanvasKnobTracker *)self rep];
      double v16 = [mConnectedRepForHighlighting interactiveCanvasController];
      double v17 = [v16 dynamicOperationController];
      [v17 invalidateGuides];
    }
  }
  else
  {
    float64x2_t v15 = [v4 connectedFrom];

    if (v12 != v15)
    {
      float64x2_t v14 = [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet layout];
      [v4 setConnectedFrom:v14];
      goto LABEL_19;
    }
  }
LABEL_26:

LABEL_27:
  double v20 = [(CRLCanvasKnobTracker *)self knob];
  id v21 = [v20 tag];

  if (v21 == (id)11) {
    [v4 connectedFrom];
  }
  else {
  double v22 = [v4 connectedTo];
  }
  double v23 = [(CRLCanvasKnobTracker *)self icc];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1003D8890;
  v65[3] = &unk_1014E7308;
  id v24 = v22;
  id v66 = v24;
  v67 = self;
  CGFloat v25 = [v23 hitRep:passingTest:self->mKnobPosition.x, self->mKnobPosition.y];
  long long v26 = [v25 repForSelecting];

  long long v27 = [(CRLCanvasKnobTracker *)self rep];
  long long v28 = [v27 interactiveCanvasController];

  long long v29 = [v28 freehandDrawingToolkit];
  uint64_t v30 = objc_opt_class();
  long long v31 = [(CRLCanvasRep *)v26 info];
  long long v32 = sub_1002469D0(v30, v31);

  if (v32 && [v29 isLassoSelectionForMixedTypeEnabledInDrawingMode])
  {
    long long v33 = [(CRLCanvasRep *)v26 info];
    CGAffineTransform v34 = sub_10006B444(v33);

    uint64_t v35 = [v28 repForInfo:v34];

    long long v26 = (CRLCanvasRep *)v35;
  }
  if ((!v26 || self->mConnectedRepForHighlighting != v26) && self->mIsEnqueueingCommandsInRealTime)
  {
    uint64_t v36 = [v4 connectionLineInfo];
    uint64_t v62 = [v28 commandController];
    long long v37 = [(CRLCanvasKnobTracker *)self knob];
    id v38 = [v37 tag];

    id v63 = v24;
    v64 = (void *)v36;
    if (v38 == (id)10)
    {
      CGRect v39 = [v4 pathSource];
      id v40 = [v39 copy];

      CGRect v41 = [CRLConnectionLineMagnet alloc];
      unint64_t v42 = [(CRLConnectionLineKnobTracker *)self p_getSnappedMagnetType];
      [(CRLConnectionLineKnobTracker *)self p_getSnappedMagnetNormalizedPosition];
      v43 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v41, "initWithType:normalizedPosition:", v42);
      [v40 setTailMagnet:v43];

      uint64_t v44 = objc_opt_class();
      v45 = [v4 connectedFrom];
      v46 = [v45 info];
      v47 = sub_1002469D0(v44, v46);

      v48 = v64;
      id v49 = v40;
      v50 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v64 connectedItem:v47 chirality:0 pathSource:v40];
      v51 = (void *)v62;
    }
    else
    {
      v52 = [(CRLCanvasKnobTracker *)self knob];
      id v53 = [v52 tag];

      BOOL v54 = v53 == (id)11;
      v48 = v64;
      v51 = (void *)v62;
      if (!v54) {
        goto LABEL_42;
      }
      v55 = [v4 pathSource];
      id v49 = [v55 copy];

      v56 = [CRLConnectionLineMagnet alloc];
      unint64_t v57 = [(CRLConnectionLineKnobTracker *)self p_getSnappedMagnetType];
      [(CRLConnectionLineKnobTracker *)self p_getSnappedMagnetNormalizedPosition];
      v58 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v56, "initWithType:normalizedPosition:", v57);
      [v49 setHeadMagnet:v58];

      uint64_t v59 = objc_opt_class();
      v60 = [v4 connectedTo];
      v61 = [v60 info];
      v47 = sub_1002469D0(v59, v61);

      v48 = v64;
      v50 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v64 connectedItem:v47 chirality:1 pathSource:v49];
    }
    [v51 enqueueCommand:v50];

LABEL_42:
    id v24 = v63;
  }
}

- (unint64_t)p_getSnappedMagnetType
{
  unint64_t result = (unint64_t)self->mSnappedMagnet;
  if (result) {
    return (unint64_t)[(id)result magnetType];
  }
  return result;
}

- (CGPoint)p_getSnappedMagnetNormalizedPosition
{
  mSnappedMagnet = self->mSnappedMagnet;
  if (mSnappedMagnet)
  {
    [(CRLConnectionLineMagnetInfo *)mSnappedMagnet position];
    double v18 = v5;
    double v19 = v4;
    id v6 = [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet layout];
    double v7 = v6;
    if (v6) {
      [v6 pureTransformInRoot];
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }
    CGAffineTransformInvert(&v22, &v21);
    float64x2_t v20 = vaddq_f64(*(float64x2_t *)&v22.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v22.c, v18), *(float64x2_t *)&v22.a, v19));

    double v10 = [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet layout];
    id v11 = [v10 pureGeometry];
    [v11 size];
    double v12 = sub_100064070();
    double v9 = sub_100066AA4(v20.f64[0], v20.f64[1], v12, v13, v14);
    double v8 = v15;
  }
  else
  {
    double v8 = 0.5;
    double v9 = 0.5;
  }
  double v16 = v9;
  double v17 = v8;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)p_updateMagnetRenderables
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v24 = self;
  id v25 = objc_alloc_init((Class)NSMutableArray);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v4 = self->mMagnets;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unsigned int v10 = [v9 connected:v24];
        [v9 position];
        if (v10)
        {
          v29[0] = v11;
          v29[1] = v12;
          double v13 = +[NSValue valueWithBytes:v29 objCType:"{CGPoint=dd}"];
          double v14 = v3;
        }
        else
        {
          v28[0] = v11;
          v28[1] = v12;
          double v13 = +[NSValue valueWithBytes:v28 objCType:"{CGPoint=dd}"];
          double v14 = v25;
        }
        [v14 addObject:v13];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  id v15 = objc_alloc_init((Class)NSMutableArray);
  mSnappedMagnet = v24->mSnappedMagnet;
  if (mSnappedMagnet)
  {
    [(CRLConnectionLineMagnetInfo *)mSnappedMagnet position];
    v27[0] = v17;
    v27[1] = v18;
    double v19 = +[NSValue valueWithBytes:v27 objCType:"{CGPoint=dd}"];
    [v15 addObject:v19];

    [(CRLConnectionLineMagnetInfo *)v24->mSnappedMagnet position];
    v26[0] = v20;
    v26[1] = v21;
    CGAffineTransform v22 = +[NSValue valueWithBytes:v26 objCType:"{CGPoint=dd}"];
    [v3 addObject:v22];
  }
  double v23 = [(CRLCanvasKnobTracker *)v24 rep];
  [v23 updateMagnetRenderables:v3 withEmptyMagnets:v25 withHighlightedMagnets:v15 includeClippedPortions:1];
}

- (void)p_updateLayout
{
  id v3 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
  id v34 = v3;
  if (!self->mSnappedMagnet)
  {
    [v3 setDrawClippedHeadPortion:0];
    [v34 setDrawClippedTailPortion:0];
    id v5 = [(CRLCanvasKnobTracker *)self knob];
    id v6 = [v5 renderable];
    LODWORD(v7) = 1.0;
    [v6 setOpacity:v7];

    goto LABEL_54;
  }
  unsigned __int8 v4 = [(CRLConnectionLineKnobTracker *)self p_connectedToCenter];
  if (self->mKnobMoved || (v4 & 1) == 0)
  {
    [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet position];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [v34 connectedTo];
    if (v12)
    {
      unint64_t mKnobTag = self->mKnobTag;

      if (mKnobTag == 11)
      {
        [v34 setHeadMagnetPosition:v9, v11];
        [v34 setHeadMagnetType:[self->mSnappedMagnet magnetType]];
      }
    }
    double v14 = [v34 connectedFrom];
    if (v14)
    {
      unint64_t v15 = self->mKnobTag;

      if (v15 == 10)
      {
        [v34 setTailMagnetPosition:v9, v11];
        [v34 setTailMagnetType:[self->mSnappedMagnet magnetType]];
      }
    }
  }
  else
  {
    [(CRLConnectionLineKnobTracker *)self p_keepSnappedMagnetOnCenter];
  }
  if (self->mKnobTag != 11) {
    goto LABEL_18;
  }
  if ((id)[(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet magnetType] != (id)1)
  {
    if (self->mKnobTag == 11)
    {
      uint64_t v16 = 0;
      goto LABEL_17;
    }
LABEL_18:
    BOOL v18 = [v34 headMagnetType] == (id)1;
    uint64_t v17 = v34;
    uint64_t v16 = v18;
    goto LABEL_21;
  }
  uint64_t v16 = 1;
LABEL_17:
  uint64_t v17 = v34;
LABEL_21:
  [v17 setClipHead:v16];
  if (self->mKnobTag != 10) {
    goto LABEL_26;
  }
  if ((id)[(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet magnetType] == (id)1)
  {
    BOOL v19 = 1;
    goto LABEL_27;
  }
  if (self->mKnobTag == 10) {
    BOOL v19 = 0;
  }
  else {
LABEL_26:
  }
    BOOL v19 = [v34 tailMagnetType] == (id)1;
LABEL_27:
  [v34 setClipTail:v19];
  if ([v34 clipHead] && self->mKnobTag == 11)
  {
    uint64_t v20 = [v34 pureGeometry];
    [v20 size];
    if (v21 == 0.0 || fabs(v21) < 0.00999999978)
    {
      CGAffineTransform v22 = [v34 pureGeometry];
      [v22 size];
      BOOL v24 = fabs(v23) >= 0.00999999978 && v23 != 0.0;
      [v34 setDrawClippedHeadPortion:v24];
    }
    else
    {
      [v34 setDrawClippedHeadPortion:1];
    }
  }
  else
  {
    [v34 setDrawClippedHeadPortion:0];
  }
  if ([v34 clipTail] && self->mKnobTag == 10)
  {
    id v25 = [v34 pureGeometry];
    [v25 size];
    if (v26 == 0.0 || fabs(v26) < 0.00999999978)
    {
      long long v27 = [v34 pureGeometry];
      [v27 size];
      BOOL v29 = fabs(v28) >= 0.00999999978 && v28 != 0.0;
      [v34 setDrawClippedTailPortion:v29];
    }
    else
    {
      [v34 setDrawClippedTailPortion:1];
    }
  }
  else
  {
    [v34 setDrawClippedTailPortion:0];
  }
  float v30 = 0.0;
  if (([v34 drawClippedHeadPortion] & 1) == 0)
  {
    if ([v34 drawClippedTailPortion]) {
      float v30 = 0.0;
    }
    else {
      float v30 = 1.0;
    }
  }
  long long v31 = [(CRLCanvasKnobTracker *)self knob];
  long long v32 = [v31 renderable];
  *(float *)&double v33 = v30;
  [v32 setOpacity:v33];

  [v34 setMagnetsAdjusted:1];
LABEL_54:
}

- (void)p_keepSnappedMagnetOnCenter
{
  id v31 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = [v31 info];
  id v5 = sub_1002469D0(v3, v4);

  id v6 = [v5 connectionLinePathSource];
  if (!self->mKnobMoved)
  {
    double v7 = [v31 connectedTo];
    if (v7 && self->mKnobTag == 11 && ([v6 headMagnet], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v9 = (void *)v8;
      double v10 = [v6 headMagnet];
      id v11 = [v10 magnetType];

      if (v11 == (id)1)
      {
        uint64_t v12 = [CRLConnectionLineMagnetInfo alloc];
        double v13 = [v31 connectedTo];
        [v13 getCardinalPositionWithParentTransformFromType:1];
        double v15 = v14;
        double v17 = v16;
        uint64_t v18 = [v31 connectedTo];
LABEL_14:
        double v26 = (void *)v18;
        long long v27 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v12, "initWithType:position:layout:connected:", 1, v18, 1, v15, v17);
        mSnappedMagnet = self->mSnappedMagnet;
        self->mSnappedMagnet = v27;

        [(CRLConnectionLineMagnetInfo *)self->mSnappedMagnet position];
        self->mKnobPosition.double x = v29;
        self->mKnobPosition.double y = v30;
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (self->mKnobMoved) {
      goto LABEL_16;
    }
    BOOL v19 = [v31 connectedFrom];
    if (v19)
    {
      if (self->mKnobTag == 10)
      {
        uint64_t v20 = [v6 tailMagnet];
        if (v20)
        {
          double v21 = (void *)v20;
          CGAffineTransform v22 = [v6 tailMagnet];
          id v23 = [v22 magnetType];

          if (v23 != (id)1) {
            goto LABEL_16;
          }
          uint64_t v12 = [CRLConnectionLineMagnetInfo alloc];
          double v13 = [v31 connectedFrom];
          [v13 getCardinalPositionWithParentTransformFromType:1];
          double v15 = v24;
          double v17 = v25;
          uint64_t v18 = [v31 connectedFrom];
          goto LABEL_14;
        }
      }
    }
  }
LABEL_16:
}

- (BOOL)p_connectedToCenter
{
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
  id v6 = [v5 info];
  double v7 = sub_1002469D0(v4, v6);

  uint64_t v8 = [v7 connectionLinePathSource];
  double v9 = v8;
  unint64_t mKnobTag = self->mKnobTag;
  if (mKnobTag != 11)
  {
    BOOL v11 = 0;
    BOOL v12 = 0;
    if (mKnobTag != 10) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  id v6 = [v8 headMagnet];
  BOOL v11 = v6 != 0;
  if (v6)
  {
    v2 = [v9 headMagnet];
    if ([v2 magnetType] == (id)1)
    {
      BOOL v12 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  if (self->mKnobTag == 10)
  {
LABEL_8:
    uint64_t v13 = [v9 tailMagnet];
    if (v13)
    {
      double v14 = (void *)v13;
      double v15 = [v9 tailMagnet];
      BOOL v12 = [v15 magnetType] == (id)1;

      if (!v11) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v12 = 0;
      if (!v11)
      {
LABEL_11:
        if (mKnobTag != 11) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }

    goto LABEL_11;
  }
  BOOL v12 = 0;
  if (v6) {
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  return v12;
}

- (void)p_setUserAdjustedShapeControlKnob:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CRLCanvasKnobTracker *)self rep];
  double v7 = [v6 layout];
  sub_1002469D0(v5, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 connectionType] == (id)2) {
    [v8 setUserDidSetControlPoint:v3];
  }
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLCanvasKnobTracker *)self rep];
  if ([(CRLConnectionLineKnobTracker *)self snapEnabled]) {
    unsigned int v7 = ![(CRLCanvasKnobTracker *)self isInspectorDrivenTracking];
  }
  else {
    unsigned int v7 = 0;
  }
  if ([(CRLConnectionLineKnobTracker *)self snapAngles]) {
    unsigned int v8 = ![(CRLCanvasKnobTracker *)self isInspectorDrivenTracking];
  }
  else {
    unsigned int v8 = 0;
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:4]) {
    BOOL v9 = (v7 | v8) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || [(NSMutableSet *)self->mMagnets count])
  {
    [v6 dynamicallyMovedSmartShapeKnobTo:self x:x y:y];
    goto LABEL_13;
  }
  double v10 = [v6 interactiveCanvasController];
  BOOL v11 = [v10 guideController];

  if (v7 && !self->mBeganAlignmentOperation && [v6 wantsGuidesWhileResizing])
  {
    [v11 beginAlignmentOperationForRep:v6];
    self->mBeganAlignmentOperation = 1;
  }
  p_mNewKnobCenterNaturalSpace = &self->mNewKnobCenterNaturalSpace;
  p_mOriginalPathToBoundsOrigin = &self->mOriginalPathToBoundsOrigin;
  double v105 = sub_100064698(x, y, self->mOriginalPathToBoundsOrigin.x);
  self->mNewKnobCenterNaturalSpace.double x = v105;
  self->mNewKnobCenterNaturalSpace.double y = v13;
  double v107 = v13;
  unsigned int v14 = [(CRLConnectionLineKnobTracker *)self resizeFromCenter];
  double v15 = &OBJC_IVAR___CRLConnectionLineKnobTracker_mOriginalFixedPointNaturalSpace;
  if (v14) {
    double v15 = &OBJC_IVAR___CRLConnectionLineKnobTracker_mOriginalMiddlePointNaturalSpace;
  }
  double v16 = (double *)((char *)self + *v15);
  double v110 = *v16;
  double v17 = sub_1000653B4(p_mNewKnobCenterNaturalSpace->x, self->mNewKnobCenterNaturalSpace.y, *v16, v16[1]);
  uint64_t v18 = 0;
  double v19 = 3.40282347e38;
  uint64_t v20 = -1;
  do
  {
    double v21 = [v6 layout:p_mOriginalPathToBoundsOrigin];
    CGAffineTransform v22 = [v21 originalGeometry];
    id v23 = v22;
    if (v22) {
      [v22 transform];
    }
    else {
      memset(v117, 0, 48);
    }
    double v24 = sub_10007F788(v117);
    double v25 = sub_1000662E0((double)v18 * 0.785398163 + v24 / -180.0 * 3.14159265);
    double v27 = sub_1000646A4(v25, v26, v17);
    double v29 = v28;

    double v30 = sub_100064698(v27, v29, v110);
    double v32 = v31;
    double v33 = sub_1000653B4(v30, v31, p_mNewKnobCenterNaturalSpace->x, self->mNewKnobCenterNaturalSpace.y);
    if (v8)
    {
      if (v33 >= v19) {
        goto LABEL_27;
      }
LABEL_26:
      double v107 = v32;
      double v105 = v30;
      double v19 = v33;
      uint64_t v20 = v18;
      goto LABEL_27;
    }
    if (v33 < (double)7 * 1.5 && v33 < v19) {
      goto LABEL_26;
    }
LABEL_27:
    ++v18;
  }
  while (v18 != 8);
  p_mNewKnobCenterNaturalSpace->double x = sub_100064680(v105, v107, p_mOriginalPathToBoundsOrigin->x);
  self->mNewKnobCenterNaturalSpace.double y = v35;
  uint64_t v36 = [(CRLCanvasKnobTracker *)self rep];
  long long v37 = [v36 interactiveCanvasController];
  unsigned int v38 = [v37 isCanvasBackgroundAlignmentSnappingEnabled];

  if (v38)
  {
    v111 = v11;
    CGRect v39 = [(CRLCanvasKnobTracker *)self rep];
    id v40 = [v39 interactiveCanvasController];
    CGRect v41 = [v40 canvasBackground];

    v108 = v41;
    unint64_t v42 = [v41 alignmentProvider];
    v43 = (objc_class *)objc_opt_class();
    uint64_t v44 = [v6 layout];
    v45 = sub_10024715C(v43, v44);

    v46 = [v45 connectedPathSource];
    id v47 = [v46 type];

    if (!v42 || (self->mKnobTag & 0xFFFFFFFFFFFFFFFELL) != 0xA && v47 != (id)1)
    {
      char v48 = 0;
      BOOL v11 = v111;
      id v49 = v108;
      goto LABEL_49;
    }
    float64x2_t v106 = vaddq_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.c, self->mNewKnobCenterNaturalSpace.y), *(float64x2_t *)&self->mOriginalTransformInRoot.a, p_mNewKnobCenterNaturalSpace->x));
    [v42 alignmentPointForPoint:];
    double v51 = v50;
    double v53 = v52;
    long long v54 = *(_OWORD *)&self->mOriginalTransformInRoot.c;
    *(_OWORD *)&v115.double a = *(_OWORD *)&self->mOriginalTransformInRoot.a;
    *(_OWORD *)&v115.double c = v54;
    *(_OWORD *)&v115.tdouble x = *(_OWORD *)&self->mOriginalTransformInRoot.tx;
    CGAffineTransformInvert(&v116, &v115);
    double a = v116.a;
    double c = v116.c;
    tdouble x = v116.tx;
    double v57 = v116.ty + v53 * v116.d + v116.b * v51;
    double v58 = sub_100064680(v106.f64[0], v106.f64[1], vaddq_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.c, self->mOriginalFixedPointNaturalSpace.y), *(float64x2_t *)&self->mOriginalTransformInRoot.a, self->mOriginalFixedPointNaturalSpace.x)).f64[0]);
    double v60 = v59;
    v61 = [(CRLCanvasKnobTracker *)self rep];
    uint64_t v62 = [v61 interactiveCanvasController];
    [v62 viewScale];
    [v42 snapDistanceForViewScale:];
    double v64 = v63;

    double v65 = fabs(v58);
    double v66 = fabs(v60);
    if (v65 < v66 && v65 <= v64)
    {
      double v68 = self->mOriginalFixedPointNaturalSpace.x;
      double v69 = p_mOriginalPathToBoundsOrigin->x;
      double v70 = v57;
      goto LABEL_47;
    }
    double v68 = tx + v53 * c + a * v51;
    if (v66 <= v64)
    {
      double v70 = self->mOriginalFixedPointNaturalSpace.y;
      double v69 = p_mOriginalPathToBoundsOrigin->x;
LABEL_47:
      double v68 = sub_100064680(v68, v70, v69);
      double v57 = v71;
    }
    BOOL v11 = v111;
    id v49 = v41;
    p_mNewKnobCenterNaturalSpace->double x = v68;
    self->mNewKnobCenterNaturalSpace.double y = v57;
    char v48 = 1;
LABEL_49:
  }
  else
  {
    char v48 = 0;
  }
  [v6 dynamicallyMovedSmartShapeKnobTo:self withTracker:self->mNewKnobCenterNaturalSpace.x, self->mNewKnobCenterNaturalSpace.y];
  [(CRLConnectionLineKnobTracker *)self p_validateLayout];
  if (v7)
  {
    char v72 = self->mBeganAlignmentOperation ? v48 : 1;
    if ((v72 & 1) == 0)
    {
      [(CRLShapeLayout *)self->mResizingLayout alignmentFrame];
      double v73 = v118.origin.x;
      double v74 = v118.origin.y;
      double width = v118.size.width;
      double height = v118.size.height;
      float64x2_t v112 = vaddq_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.c, self->mNewKnobCenterNaturalSpace.y), *(float64x2_t *)&self->mOriginalTransformInRoot.a, p_mNewKnobCenterNaturalSpace->x));
      double v77 = vabdd_f64(v112.f64[0], CGRectGetMinX(v118));
      v119.origin.double x = v73;
      v119.origin.double y = v74;
      v119.size.double width = width;
      v119.size.double height = height;
      double v78 = vabdd_f64(v112.f64[0], CGRectGetMaxX(v119));
      v120.origin.double x = v73;
      v120.origin.double y = v74;
      v120.size.double width = width;
      v120.size.double height = height;
      double v79 = vabdd_f64(v112.f64[1], CGRectGetMinY(v120));
      v121.origin.double x = v73;
      v121.origin.double y = v74;
      v121.size.double width = width;
      v121.size.double height = height;
      double v80 = vabdd_f64(v112.f64[1], CGRectGetMaxY(v121));
      uint64_t v81 = 7;
      if (v79 < v80) {
        uint64_t v81 = 1;
      }
      uint64_t v82 = 9;
      if (v79 < v80) {
        uint64_t v82 = 3;
      }
      if (v77 >= v78) {
        uint64_t v83 = v82;
      }
      else {
        uint64_t v83 = v81;
      }
      v84 = [(CRLCanvasKnobTracker *)self rep];
      unsigned int v85 = [v84 wantsGuidesWhileResizing];

      if (v85)
      {
        unsigned int v86 = [(CRLConnectionLineKnobTracker *)self resizeFromCenter];
        double v88 = CGPointZero.x;
        double v87 = CGPointZero.y;
        [v11 snapRectToGuides:v83 ^ 1 forKnobTag:v86 snapSize:0 snapWithBackgroundAlignmentProvider:v73 isLine:v74 startPoint:width endPoint:height];
        double v90 = v89;
        double v92 = v91;
      }
      else
      {
        double v88 = CGPointZero.x;
        double v87 = CGPointZero.y;
        double v90 = CGPointZero.x;
        double v92 = v87;
      }
      switch(v20)
      {
        case 0:
        case 4:
          double v92 = 0.0;
          break;
        case 1:
        case 5:
          if (fabs(v90) <= fabs(v92)) {
            double v90 = v92;
          }
          double v92 = v90;
          break;
        case 2:
        case 6:
          double v90 = 0.0;
          break;
        case 3:
        case 7:
          if (fabs(v90) <= fabs(v92)) {
            double v90 = -v92;
          }
          else {
            double v92 = -v90;
          }
          break;
        default:
          break;
      }
      if (v90 != v88 || v92 != v87)
      {
        double v93 = sub_100064698(v112.f64[0], v112.f64[1], v90);
        double v109 = v94;
        double v113 = v93;
        long long v95 = *(_OWORD *)&self->mOriginalTransformInRoot.c;
        *(_OWORD *)&v115.double a = *(_OWORD *)&self->mOriginalTransformInRoot.a;
        *(_OWORD *)&v115.double c = v95;
        *(_OWORD *)&v115.tdouble x = *(_OWORD *)&self->mOriginalTransformInRoot.tx;
        CGAffineTransformInvert(&v114, &v115);
        float64x2_t v96 = vaddq_f64(*(float64x2_t *)&v114.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v114.c, v109), *(float64x2_t *)&v114.a, v113));
        CGPoint *p_mNewKnobCenterNaturalSpace = (CGPoint)v96;
        if (((1 << v83) & 0x28A) != 0)
        {
          double v97 = v96.f64[1];
        }
        else
        {
          int v98 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F6598);
          }
          v99 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010AD000(v98, v99);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F65B8);
          }
          v100 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101066770(v100, v98);
          }
          v101 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineKnobTracker moveKnobToRepPosition:]");
          v102 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineKnobTracker.m"];
          +[CRLAssertionHandler handleFailureInFunction:v101 file:v102 lineNumber:783 isFatal:0 description:"wrong knob type for line segment resize"];

          v96.f64[0] = p_mNewKnobCenterNaturalSpace->x;
          double v97 = self->mNewKnobCenterNaturalSpace.y;
        }
        [v6 dynamicallyMovedSmartShapeKnobTo:self withTracker:v96.f64[0] v97];
        [(CRLConnectionLineKnobTracker *)self p_validateLayout];
      }
    }
  }
  [v6 invalidateKnobPositions];

LABEL_13:
}

- (BOOL)didChangeGeometry
{
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v5 = [v4 layout];
  id v6 = sub_10024715C(v3, v5);

  uint64_t v7 = objc_opt_class();
  unsigned int v8 = [v6 connectedFrom];
  BOOL v9 = [v8 info];
  double v10 = sub_1002469D0(v7, v9);

  uint64_t v11 = objc_opt_class();
  BOOL v12 = [v6 connectedTo];
  CGFloat v13 = [v12 info];
  unsigned int v14 = sub_1002469D0(v11, v13);

  if (v10) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = v15;

  return v16;
}

- (void)endMovingKnob
{
  v59.receiver = self;
  v59.super_class = (Class)CRLConnectionLineKnobTracker;
  [(CRLCanvasKnobTracker *)&v59 endMovingKnob];
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v5 = sub_10024715C(v3, v4);

  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [v5 layout];
  unsigned int v8 = sub_10024715C(v6, v7);

  BOOL v9 = [(CRLCanvasKnobTracker *)self rep];
  double v10 = [v9 interactiveCanvasController];

  uint64_t v11 = [v10 commandController];
  mConnectedRepForHighlighting = self->mConnectedRepForHighlighting;
  self->mConnectedRepForHighlighting = 0;

  if (!self->mIsEnqueueingCommandsInRealTime)
  {
    CGFloat v13 = [CRLCanvasCommandSelectionBehavior alloc];
    unsigned int v14 = [v10 canvasEditor];
    BOOL v15 = [(CRLCanvasCommandSelectionBehavior *)v13 initWithCanvasEditor:v14];

    [v11 openGroupWithSelectionBehavior:v15];
  }
  v56 = v11;
  [v5 updateMagnetRenderables:&__NSArray0__struct withEmptyMagnets:&__NSArray0__struct withHighlightedMagnets:&__NSArray0__struct includeClippedPortions:0];
  [v5 dynamicMoveSmartShapeKnobDidEndWithTracker:self];
  [v8 setControlKnobPositionChangedFromRouting:0];
  BOOL v16 = [(CRLCanvasKnobTracker *)self knob];
  double v17 = [v16 renderable];
  LODWORD(v18) = 1.0;
  [v17 setOpacity:v18];

  mOriginalConnectedFrom = self->mOriginalConnectedFrom;
  uint64_t v20 = [v8 connectedFrom];
  double v58 = v5;
  v55 = v10;
  if (mOriginalConnectedFrom != v20)
  {

LABEL_6:
    int v23 = 1;
    goto LABEL_7;
  }
  mOriginalConnectedTo = self->mOriginalConnectedTo;
  CGAffineTransform v22 = [v8 connectedTo];

  if (mOriginalConnectedTo != v22) {
    goto LABEL_6;
  }
  int v50 = 0;
  if (!self->mKnobMoved)
  {
    CGRect v39 = v11;
    goto LABEL_11;
  }
  int v23 = 0;
LABEL_7:
  double v24 = [v8 connectionLineInfo];
  uint64_t v25 = objc_opt_class();
  double v26 = [v8 connectedFrom];
  double v27 = [v26 info];
  double v57 = sub_1002469D0(v25, v27);

  uint64_t v28 = objc_opt_class();
  double v29 = [v8 connectedTo];
  double v30 = [v29 info];
  double v31 = sub_1002469D0(v28, v30);

  uint64_t v32 = objc_opt_class();
  double v33 = [(CRLCanvasLayout *)self->mOriginalConnectedFrom info];
  id v34 = sub_1002469D0(v32, v33);

  uint64_t v35 = objc_opt_class();
  uint64_t v36 = [(CRLCanvasLayout *)self->mOriginalConnectedTo info];
  uint64_t v37 = sub_1002469D0(v35, v36);

  int v54 = v23;
  double v53 = (void *)v37;
  if (v23) {
    +[CRLConnectionLineItem commandActionStringForConnectingFrom:v57 oldConnectedFrom:v34 newConnectedTo:v31 oldConnectedTo:v37];
  }
  else {
  unsigned int v38 = [v58 actionStringForDrag];
  }
  CGRect v39 = v56;
  [v56 setCurrentGroupActionString:v38];
  id v40 = [v8 pathSource];
  id v41 = [v40 copy];

  unint64_t v42 = [CRLConnectionLineMagnet alloc];
  id v43 = [v8 headMagnetType];
  [v8 headMagnetNormalizedPosition];
  uint64_t v44 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v42, "initWithType:normalizedPosition:", v43);
  [v41 setHeadMagnet:v44];

  v45 = [CRLConnectionLineMagnet alloc];
  id v46 = [v8 tailMagnetType];
  [v8 tailMagnetNormalizedPosition];
  id v47 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v45, "initWithType:normalizedPosition:", v46);
  [v41 setTailMagnet:v47];

  char v48 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v24 connectedItem:v57 chirality:0 pathSource:v41];
  id v49 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v24 connectedItem:v31 chirality:1 pathSource:v41];
  [v56 enqueueCommand:v48];
  [v56 enqueueCommand:v49];
  [v8 setMagnetsAdjusted:0];

  uint64_t v5 = v58;
  double v10 = v55;
  int v50 = v54;
LABEL_11:
  [v39 closeGroup];
  if (self->mBeganAlignmentOperation)
  {
    double v51 = [v5 interactiveCanvasController];
    double v52 = [v51 guideController];
    [v52 endAlignmentOperation];
  }
  if (v50)
  {
    [v8 setConnectedFrom:self->mOriginalConnectedFrom];
    [v8 setConnectedTo:self->mOriginalConnectedTo];
    [v8 invalidateConnections];
  }
}

- (BOOL)shouldDisplayGuides
{
  return self->mConnectedRepForHighlighting == 0;
}

- (BOOL)shouldHideOtherKnobs
{
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = [(CRLCanvasKnobTracker *)self rep];
  uint64_t v5 = sub_10024715C(v3, v4);

  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [v5 layout];
  unsigned int v8 = sub_10024715C(v6, v7);

  BOOL v9 = [v8 connectedPathSource];
  BOOL v10 = [v9 type] != (id)1;

  return v10;
}

- (id)connectedRepForHighlighting
{
  return self->mConnectedRepForHighlighting;
}

- (void)p_validateLayout
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  id v4 = [v2 layout];

  BOOL v3 = [v4 layoutController];
  [v3 validateLayoutWithDependencies:v4];
}

- (id)connectionLineLayout
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  BOOL v3 = [v2 layout];

  return v3;
}

- (BOOL)p_isValidConnectionDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLConnectionLineKnobTracker *)self connectionLineLayout];
  LOBYTE(self) = [v5 isValidConnectionDestination:v4 forLineEnd:self->mKnobTag];

  return (char)self;
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

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)shouldSnapToMagnets
{
  return self->mShouldSnapToMagnets;
}

- (void)setShouldSnapToMagnets:(BOOL)a3
{
  self->mShouldSnapToMagnets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLayoutUnderKnob, 0);
  objc_storeStrong((id *)&self->mSnappedMagnet, 0);
  objc_storeStrong((id *)&self->mMagnets, 0);
  objc_storeStrong((id *)&self->mResizingLayout, 0);
  objc_storeStrong((id *)&self->mConnectedRepForHighlighting, 0);
  objc_storeStrong((id *)&self->mOriginalConnectedTo, 0);

  objc_storeStrong((id *)&self->mOriginalConnectedFrom, 0);
}

@end