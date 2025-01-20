@interface CRLCanvasRepRotateTracker
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)isInspectorDrivenTracking;
- (BOOL)isWaitingToBeginRotation;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)shouldRespectScaledHUDPosition;
- (BOOL)shouldShowGuides;
- (BOOL)shouldShowHUD;
- (BOOL)supportsAlignmentGuides;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (CGAffineTransform)rotateTransform;
- (CGPoint)centerForRotation;
- (CGPoint)p_scaledCenterForRotation;
- (CGPoint)scaledHUDPosition;
- (CGPoint)unscaledCenterForRotation;
- (CRLCanvasRep)rep;
- (CRLCanvasRepRotateTracker)initWithRep:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (NSSet)repsBeingRotated;
- (double)currentLogicalAngleInDegrees;
- (double)currentTotalAngleOfRotationInRadians;
- (double)originalAngleInDegrees;
- (double)snapThreshold;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)repsToHide;
- (void)addRotateDelta:(double)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)dealloc;
- (void)p_begin;
- (void)p_hideGuideRenderable;
- (void)p_hideHUD;
- (void)p_sproingHUD;
- (void)p_updateCenterForRotationIfNecessary;
- (void)p_updateGuideRenderableWithAngle:(double)a3 didSnap:(BOOL)a4;
- (void)p_updateHUDWithAngle:(double)a3;
- (void)setCenterForRotation:(CGPoint)a3;
- (void)setIsInspectorDrivenTracking:(BOOL)a3;
- (void)setRep:(id)a3;
- (void)setScaledHUDPosition:(CGPoint)a3;
- (void)setShouldRespectScaledHUDPosition:(BOOL)a3;
- (void)setShouldShowGuides:(BOOL)a3;
- (void)setShouldShowHUD:(BOOL)a3;
- (void)setSnapThreshold:(double)a3;
- (void)setUnscaledCenterForRotation:(CGPoint)a3;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLCanvasRepRotateTracker

- (CRLCanvasRepRotateTracker)initWithRep:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CRLCanvasRepRotateTracker;
  v5 = [(CRLCanvasRepRotateTracker *)&v27 init];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF830);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BC308();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF850);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepRotateTracker initWithRep:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepRotateTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 87, 0, "invalid nil value for '%{public}s'", "rep");
    }
    [v5 setRep:v4];
    v5[105] = 1;
    *(_OWORD *)(v5 + 24) = xmmword_101175150;
    [*((id *)v5 + 1) angleForRotation];
    *((void *)v5 + 10) = v9;
    *((void *)v5 + 11) = v9;
    v10 = [v5 rep];
    v11 = [v10 layout];
    v12 = [v11 parent];

    double v13 = *((double *)v5 + 10);
    if (v12)
    {
      double v14 = sub_1000662E0(v13 * 0.0174532925);
      double v16 = v15;
      v17 = [v5 rep];
      v18 = [v17 layout];
      v19 = [v18 parent];
      v20 = v19;
      if (v19) {
        [v19 transformInRoot];
      }
      else {
        memset(&v25, 0, sizeof(v25));
      }
      CGAffineTransformInvert(&v26, &v25);
      double v21 = sub_1000664E0((float64x2_t *)&v26, v14, v16);
      long double v23 = v22;

      double v13 = sub_100065C1C(v21, v23) * 57.2957795;
      *((double *)v5 + 10) = v13;
    }
    *((double *)v5 + 7) = v13;
    *((double *)v5 + 8) = v13;
    *((void *)v5 + 9) = 0;
    v5[107] = 1;
  }

  return (CRLCanvasRepRotateTracker *)v5;
}

- (void)dealloc
{
  [(CRLCanvasRepRotateTracker *)self p_hideHUD];
  [(CRLCanvasRenderable *)self->mGuideRenderable setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepRotateTracker;
  [(CRLCanvasRepRotateTracker *)&v3 dealloc];
}

- (void)addRotateDelta:(double)a3
{
  self->mRotateDeltaInRadians = self->mRotateDeltaInRadians - a3;
}

- (double)currentTotalAngleOfRotationInRadians
{
  return (self->mOriginalAngleInDegrees - self->mCurrentLogicalAngleInDegrees) * 0.0174532925;
}

- (BOOL)isWaitingToBeginRotation
{
  return !self->mDidBeginRotation && self->mRotateDeltaInRadians == 0.0;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  id v5 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  if ([v5 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime])
  {
    unsigned int v4 = [(CRLCanvasRep *)self->mRep allowsSupportedDynamicOperationsToBeRealTime];

    if (v4) {
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
  if ([v4 count] != (id)1
    || ([v4 anyObject],
        id v5 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(),
        mRep = self->mRep,
        v5,
        v5 != mRep))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF870);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC3B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF890);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepRotateTracker changeDynamicLayoutsForReps:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepRotateTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 186, 0, "attempting to rotate more than one rep, or the wrong rep");
  }
  if ([(CRLCanvasRepRotateTracker *)self isWaitingToBeginRotation])
  {
    [(CRLCanvasRepRotateTracker *)self p_updateCenterForRotationIfNecessary];
    [(CRLCanvasRepRotateTracker *)self p_updateHUDWithAngle:self->mOriginalAngleInDegrees];
    [(CRLCanvasRepRotateTracker *)self p_sproingHUD];
    if ([(CRLCanvasRepRotateTracker *)self shouldShowGuides]) {
      [(CRLCanvasRepRotateTracker *)self p_updateGuideRenderableWithAngle:0 didSnap:self->mOriginalAngleInDegrees];
    }
  }
  else
  {
    if (!self->mDidBeginRotation)
    {
      [(CRLCanvasRepRotateTracker *)self p_begin];
      [(CRLCanvasRepRotateTracker *)self p_sproingHUD];
      self->mDidBeginRotation = 1;
    }
    sub_100065C2C(self->mCurrentPhysicalAngleInDegrees + self->mRotateDeltaInRadians * 180.0 / 3.14159265);
    self->mCurrentLogicalAngleInDegrees = v10;
    self->mCurrentPhysicalAngleInDegrees = v10;
    self->mRotateDeltaInRadians = 0.0;
    double v11 = vabdd_f64(v10, self->mOriginalAngleInDegrees);
    if (self->mMovedMinimumDistance)
    {
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = v11 < 350.0 && v11 > 10.0;
      self->mMovedMinimumDistance = v12;
    }
    double mSnapThreshold = self->mSnapThreshold;
    if (mSnapThreshold <= 20.0 && (v11 < 355.0 ? (BOOL v14 = v11 <= 5.0) : (BOOL v14 = 1), v14 ? (v15 = !v12) : (v15 = 0), v15))
    {
      BOOL v20 = 0;
      double v18 = 0.0;
    }
    else
    {
      float v16 = v10 / 45.0;
      double v17 = floorf(v16);
      if (fabs(-(v10 - v17 * 45.0)) >= fabs(-(v10 - (v17 + 1.0) * 45.0))) {
        double v18 = -(v10 - (v17 + 1.0) * 45.0);
      }
      else {
        double v18 = -(v10 - v17 * 45.0);
      }
      double v19 = fabs(v18);
      BOOL v20 = v19 <= mSnapThreshold;
      if (v19 > mSnapThreshold) {
        double v18 = 0.0;
      }
      else {
        sub_100065C2C(v10 + v18);
      }
      self->mCurrentLogicalAngleInDegrees = v10;
    }
    self->mPreviousSnap = v18;
    [(CRLCanvasRep *)self->mRep dynamicallyRotatingWithTracker:self];
    [(CRLCanvasRepRotateTracker *)self p_updateHUDWithAngle:self->mCurrentLogicalAngleInDegrees];
    if ([(CRLCanvasRepRotateTracker *)self shouldShowGuides]) {
      [(CRLCanvasRepRotateTracker *)self p_updateGuideRenderableWithAngle:v20 didSnap:self->mCurrentLogicalAngleInDegrees];
    }
    double v21 = [(CRLCanvasRep *)self->mRep layout];
    double v22 = [v21 layoutController];
    long double v23 = [(CRLCanvasRep *)self->mRep layout];
    [v22 validateLayoutWithDependencies:v23];
  }
}

- (CGAffineTransform)rotateTransform
{
  double mCurrentLogicalAngleInDegrees = self->mCurrentLogicalAngleInDegrees;
  v6 = [(CRLCanvasRepRotateTracker *)self rep];
  v7 = [v6 layout];
  v8 = [v7 parent];

  if (v8)
  {
    double v9 = sub_1000662E0(self->mCurrentLogicalAngleInDegrees * 0.0174532925);
    double v11 = v10;
    BOOL v12 = [(CRLCanvasRepRotateTracker *)self rep];
    double v13 = [v12 layout];
    BOOL v14 = [v13 parent];
    BOOL v15 = v14;
    if (v14) {
      [v14 transformInRoot];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    double v16 = sub_1000664E0(v27, v9, v11);
    long double v18 = v17;

    double mCurrentLogicalAngleInDegrees = sub_100065C1C(v16, v18) * 57.2957795;
  }
  double v19 = self->mOriginalAngleForRotationInDegrees - mCurrentLogicalAngleInDegrees;
  double x = self->mCenterForRotation.x;
  double y = self->mCenterForRotation.y;
  CGAffineTransformMakeTranslation(&t1, -x, -y);
  CGAffineTransformMakeRotation(&t2, v19 * 0.0174532925);
  CGAffineTransformConcat(&v26, &t1, &t2);
  CGAffineTransformMakeTranslation(&v23, x, y);
  return CGAffineTransformConcat(retstr, &v26, &v23);
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)commitChangesForReps:(id)a3
{
  if (self->mDidBeginRotation)
  {
    id v4 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
    id v5 = [v4 commandController];
    if ([(CRLCanvasRepRotateTracker *)self isInspectorDrivenTracking])
    {
      v6 = [v4 infosForCurrentSelectionPath];
      v7 = +[NSMutableSet set];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v25;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            BOOL v14 = [v4 layoutForInfo:v13];
            if ([v14 supportsRotation]) {
              [v7 addObject:v13];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }

      BOOL v15 = [v4 canvasEditor];
      double v16 = [v15 selectionPathWithInfos:v7];
    }
    else
    {
      double v17 = [v4 canvasEditor];
      long double v18 = [(CRLCanvasRep *)self->mRep info];
      double v19 = +[NSSet setWithObject:v18];
      double v16 = [v17 selectionPathWithInfos:v19];
    }
    BOOL v20 = [[CRLCommandSelectionBehavior alloc] initWithCommitSelectionPath:0 forwardSelectionPath:v16 reverseSelectionPath:v16];
    [v5 openGroupWithSelectionBehavior:v20];
    double v21 = [(CRLCanvasRep *)self->mRep actionStringForRotate];
    [v5 setCurrentGroupActionString:v21];

    [(CRLCanvasRep *)self->mRep dynamicRotateDidEndWithTracker:self];
    if ([(CRLCanvasRep *)self->mRep shouldRasterizeRenderableDuringRotation])
    {
      double v22 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
      CGAffineTransform v23 = [v22 renderableForRep:self->mRep];
      [v23 setShouldRasterize:0];
    }
    if ([(CRLCanvasRepRotateTracker *)self isInspectorDrivenTracking]) {
      [(CRLCanvasRep *)self->mRep setShowKnobsDuringManipulation:0];
    }
    [v5 closeGroup];
    if (self->mIsEnqueueingCommandsInRealTime) {
      [v5 closeGroup];
    }
  }
  [(CRLCanvasRepRotateTracker *)self p_hideHUD];
  [(CRLCanvasRepRotateTracker *)self p_hideGuideRenderable];
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014FF8B0);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin rotate operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014FF8D0);
  }
  objc_super v3 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    double v4 = self->mCurrentLogicalAngleInDegrees - self->mOriginalAngleInDegrees;
    int v6 = 134217984;
    double v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "end rotate operation. rotated by %f degrees", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (id)repsToHide
{
  objc_super v3 = objc_opt_new();
  double v4 = [(CRLCanvasRepRotateTracker *)self rep];
  id v5 = [v4 parentRep];

  int v6 = [v5 layout];
  double v7 = [(CRLCanvasRepRotateTracker *)self rep];
  id v8 = [v7 layout];
  unsigned int v9 = [v6 childLayoutIsCurrentlyHiddenWhileManipulating:v8];

  if (v9)
  {
    id v10 = [(CRLCanvasRepRotateTracker *)self rep];
    uint64_t v11 = +[NSSet setWithObject:v10];

    objc_super v3 = (void *)v11;
  }

  return v3;
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

- (void)p_begin
{
  id v6 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  [v6 endEditing];
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    objc_super v3 = [v6 commandController];
    [v3 openGroup];
    [v3 enableRealTimeSyncProgressiveEnqueuingInCurrentGroup];
  }
  double v4 = [(CRLCanvasRepRotateTracker *)self rep];
  if ([v4 shouldRasterizeRenderableDuringRotation])
  {
    id v5 = [v6 renderableForRep:v4];
    [v5 setShouldRasterize:1];
    [v5 contentsScale];
    [v5 setRasterizationScale:];
  }
  [v4 dynamicRotateDidBegin];
  [v4 setShowKnobsDuringManipulation:[self isInspectorDrivenTracking]];
  [(CRLCanvasRepRotateTracker *)self p_updateCenterForRotationIfNecessary];
}

- (void)p_updateCenterForRotationIfNecessary
{
  if (self->mCenterForRotation.x == INFINITY && self->mCenterForRotation.y == INFINITY)
  {
    double v4 = [(CRLCanvasRepRotateTracker *)self rep];
    id v5 = [v4 layout];

    id v6 = [v5 originalGeometry];
    [v5 centerForRotation];
    if (v6)
    {
      double v12 = v8;
      double v13 = v7;
      [v6 transform];
      double v8 = v12;
      double v7 = v13;
      float64x2_t v10 = v14;
      float64x2_t v9 = v15;
      float64x2_t v11 = v16;
    }
    else
    {
      float64x2_t v11 = 0uLL;
      float64x2_t v10 = 0uLL;
      float64x2_t v9 = 0uLL;
    }
    self->mCenterForRotation = (CGPoint)vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v9, v8), v10, v7));
  }
}

- (CGPoint)p_scaledCenterForRotation
{
  objc_super v3 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  [(CRLCanvasRepRotateTracker *)self unscaledCenterForRotation];
  [v3 convertUnscaledToBoundsPoint:];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)unscaledCenterForRotation
{
  objc_super v3 = [(CRLCanvasRep *)self->mRep layout];
  double v4 = [v3 originalGeometry];

  if (!v4)
  {
    memset(&v41, 0, sizeof(v41));
    double v8 = [(CRLCanvasRep *)self->mRep layout];
    double v9 = [v8 geometry];
    float64x2_t v10 = v9;
    if (v9) {
      [v9 transform];
    }
    else {
      memset(&v36, 0, sizeof(v36));
    }
    CGAffineTransformInvert(&v41, &v36);

    double x = self->mCenterForRotation.x;
    double y = self->mCenterForRotation.y;
    double v13 = v41.tx + y * v41.c + v41.a * x;
    double v14 = v41.ty + y * v41.d + v41.b * x;
    long long v25 = [(CRLCanvasRep *)self->mRep layout];
    float64x2_t v16 = v25;
    if (v25)
    {
      [v25 transformInRoot];
      double v17 = v31;
      double v18 = v30;
      double v19 = v33;
      double v20 = v32;
      double v21 = v35;
      double v22 = v34;
      goto LABEL_14;
    }
LABEL_13:
    double v21 = 0.0;
    double v19 = 0.0;
    double v17 = 0.0;
    double v22 = 0.0;
    double v20 = 0.0;
    double v18 = 0.0;
    goto LABEL_14;
  }
  memset(&v41, 0, sizeof(v41));
  double v5 = [(CRLCanvasRep *)self->mRep layout];
  double v6 = [v5 originalGeometry];
  double v7 = v6;
  if (v6) {
    [v6 transform];
  }
  else {
    memset(&v40, 0, sizeof(v40));
  }
  CGAffineTransformInvert(&v41, &v40);

  double v11 = self->mCenterForRotation.x;
  double v12 = self->mCenterForRotation.y;
  double v13 = v41.tx + v12 * v41.c + v41.a * v11;
  double v14 = v41.ty + v12 * v41.d + v41.b * v11;
  float64x2_t v15 = [(CRLCanvasRep *)self->mRep layout];
  float64x2_t v16 = v15;
  if (!v15)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    goto LABEL_13;
  }
  [v15 originalTransformInRoot];
  double v17 = *((double *)&v37 + 1);
  double v18 = *(double *)&v37;
  double v19 = *((double *)&v38 + 1);
  double v20 = *(double *)&v38;
  double v21 = *((double *)&v39 + 1);
  double v22 = *(double *)&v39;
LABEL_14:
  double v26 = v22 + v14 * v20 + v18 * v13;
  double v27 = v21 + v14 * v19 + v17 * v13;

  double v28 = v26;
  double v29 = v27;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (void)setUnscaledCenterForRotation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLCanvasRep *)self->mRep layout];
  double v7 = [v6 originalGeometry];

  if (!v7)
  {
    memset(&v29, 0, sizeof(v29));
    float64x2_t v10 = [(CRLCanvasRep *)self->mRep layout];
    double v11 = v10;
    if (v10) {
      [v10 transformInRoot];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    CGAffineTransformInvert(&v29, &v24);

    double v20 = v29.tx + y * v29.c + v29.a * x;
    double v19 = v29.ty + y * v29.d + v29.b * x;
    double v12 = [(CRLCanvasRep *)self->mRep layout];
    double v18 = [v12 geometry];
    double v14 = v18;
    if (v18)
    {
      [v18 transform];
      float64x2_t v15 = v21;
      float64x2_t v16 = v22;
      float64x2_t v17 = v23;
      goto LABEL_15;
    }
    float64x2_t v17 = 0uLL;
LABEL_14:
    float64x2_t v15 = 0uLL;
    float64x2_t v16 = 0uLL;
    goto LABEL_15;
  }
  memset(&v29, 0, sizeof(v29));
  double v8 = [(CRLCanvasRep *)self->mRep layout];
  double v9 = v8;
  if (v8) {
    [v8 originalTransformInRoot];
  }
  else {
    memset(&v28, 0, sizeof(v28));
  }
  CGAffineTransformInvert(&v29, &v28);

  double v20 = v29.tx + y * v29.c + v29.a * x;
  double v19 = v29.ty + y * v29.d + v29.b * x;
  double v12 = [(CRLCanvasRep *)self->mRep layout];
  double v13 = [v12 originalGeometry];
  double v14 = v13;
  if (!v13)
  {
    float64x2_t v17 = 0uLL;
    float64x2_t v26 = 0u;
    float64x2_t v27 = 0u;
    float64x2_t v25 = 0u;
    goto LABEL_14;
  }
  [v13 transform];
  float64x2_t v15 = v25;
  float64x2_t v16 = v26;
  float64x2_t v17 = v27;
LABEL_15:
  self->mCenterForRotation = (CGPoint)vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, v19), v15, v20));
}

- (NSSet)repsBeingRotated
{
  v2 = [(CRLCanvasRepRotateTracker *)self rep];
  objc_super v3 = +[NSSet setWithObject:v2];

  return (NSSet *)v3;
}

- (void)p_updateHUDWithAngle:(double)a3
{
  if ([(CRLCanvasRepRotateTracker *)self shouldShowHUD])
  {
    double v5 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
    double v6 = +[CRLCanvasHUDController sharedHUDController];
    double v7 = [v5 unitStringForAngle:a3];
    [v6 setLabelText:v7];
    if ([(CRLCanvasRepRotateTracker *)self shouldRespectScaledHUDPosition])
    {
      [(CRLCanvasRepRotateTracker *)self scaledHUDPosition];
      double v10 = sub_100064698(v8, v9, 20.0);
      double v12 = v11;
      double v13 = [v5 canvasView];
      [v6 showHUDForKey:self forTouchPoint:v13 inCanvasView:0 v10 v12 CGSizeZero.width CGSizeZero.height 0.0 1.0];
    }
    else
    {
      [(CRLCanvasRepRotateTracker *)self p_scaledCenterForRotation];
      double v15 = v14;
      double v17 = v16;
      [(CRLCanvasRep *)self->mRep unscaledGuidePosition];
      [v5 convertUnscaledToBoundsPoint:];
      double v26 = 0.0;
      double v27 = 0.0;
      double v20 = sub_1000653B4(v18, v19, v15, v17);
      sub_100066270(&v26, v20 + 25.0, (a3 + 90.0) * -0.0174532925);
      double v21 = sub_100064698(v26, v27, v15);
      double v23 = sub_1000674F0(v21, v22);
      double v25 = v24;
      double v13 = [v5 canvasView];
      [v6 showHUDForKey:self forTouchPoint:v13 inCanvasView:v23 withUpwardsNudge:0.0];
    }
  }
}

- (void)p_sproingHUD
{
  if (!self->mHaveSproingedHUD)
  {
    if ([(CRLCanvasRepRotateTracker *)self shouldShowHUD])
    {
      objc_super v3 = +[CRLCanvasHUDController sharedHUDController];
      double v4 = [v3 view];
      [v4 center];
      double v6 = v5;
      double v8 = v7;

      [(CRLCanvasRepRotateTracker *)self p_scaledCenterForRotation];
      double v10 = v9;
      double v12 = v11;
      double v13 = [v3 view];
      double v14 = [v13 superview];
      double v15 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
      double v16 = [v15 layerHost];
      double v17 = [v16 canvasView];
      [v14 convertPoint:v17 fromView:v10];
      double v19 = v18;
      double v21 = v20;

      double v22 = sub_100064680(v19, v21, v6);
      double v24 = v23;
      double v25 = sub_1000653B4(v19, v21, v6, v8);
      double v26 = sub_1000646A4(v22, v24, 70.0 / v25);
      double v27 = sub_100064698(v6, v8, v26);
      double v29 = v28;
      double v30 = sub_1000653B4(v27, v28, v6, v8);
      if (v25 >= v30) {
        double v31 = v27;
      }
      else {
        double v31 = v19;
      }
      if (v25 >= v30) {
        double v32 = v29;
      }
      else {
        double v32 = v21;
      }
      double v33 = [v3 view];
      double v34 = [v33 layer];
      [v34 crl_addZoomAnimationFromPoint:v31, v32];
    }
    self->mHaveSproingedHUD = 1;
  }
}

- (void)p_hideHUD
{
  if ([(CRLCanvasRepRotateTracker *)self shouldShowHUD])
  {
    id v3 = +[CRLCanvasHUDController sharedHUDController];
    [v3 hideHUDForKey:self];
  }
}

- (void)p_updateGuideRenderableWithAngle:(double)a3 didSnap:(BOOL)a4
{
  BOOL v4 = a4;
  mGuideRenderable = self->mGuideRenderable;
  if (!mGuideRenderable)
  {
    double v8 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
    double v9 = [v8 canvas];
    [v9 contentsScale];
    double v11 = v10;

    double v12 = +[CRLCanvasShapeRenderable renderable];
    double v13 = self->mGuideRenderable;
    self->mGuideRenderable = v12;

    double v14 = sub_10000FE5C(0.933000028, 0.791999996, 0.0, 1.0);
    [(CRLCanvasShapeRenderable *)self->mGuideRenderable setStrokeColor:v14];
    CGColorRelease(v14);
    [(CRLCanvasShapeRenderable *)self->mGuideRenderable setFillColor:0];
    [(CRLCanvasShapeRenderable *)self->mGuideRenderable setLineWidth:1.0 / v11];
    [(CRLCanvasRenderable *)self->mGuideRenderable setZPosition:-1.0];
    -[CRLCanvasRenderable setAnchorPoint:](self->mGuideRenderable, "setAnchorPoint:", 0.5, 0.0);
    [(CRLCanvasRenderable *)self->mGuideRenderable setDelegate:self];
    [(CRLCanvasRenderable *)self->mGuideRenderable setEdgeAntialiasingMask:0];
    Mutable = CGPathCreateMutable();
    [(CRLCanvasRepRotateTracker *)self p_scaledCenterForRotation];
    double v17 = floor(v16);
    double v19 = floor(v18);
    [(CRLCanvasRep *)self->mRep unscaledGuidePosition];
    [v8 convertUnscaledToBoundsPoint:];
    double v21 = v20;
    double v23 = v22;
    CGPathMoveToPoint(Mutable, 0, 0.0, -10.0);
    double v24 = sub_1000653B4(v21, v23, v17, v19);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v24 + 10.0);
    v28.origin.double x = -5.5;
    v28.origin.double y = -5.5;
    v28.size.width = 11.0;
    v28.size.height = 11.0;
    CGPathAddEllipseInRect(Mutable, 0, v28);
    CGPathMoveToPoint(Mutable, 0, -10.0, 0.0);
    CGPathAddLineToPoint(Mutable, 0, 10.0, 0.0);
    [(CRLCanvasShapeRenderable *)self->mGuideRenderable setPath:Mutable];
    CGPathRelease(Mutable);
    -[CRLCanvasRenderable setPosition:](self->mGuideRenderable, "setPosition:", v17, v19);
    [v8 addDecorator:self];

    mGuideRenderable = self->mGuideRenderable;
  }
  CGAffineTransformMakeRotation(&v27, (a3 + 180.0) * -0.0174532925);
  CGAffineTransform v26 = v27;
  [(CRLCanvasRenderable *)mGuideRenderable setAffineTransform:&v26];
  LODWORD(v25) = 1050253722;
  if (v4) {
    *(float *)&double v25 = 1.0;
  }
  [(CRLCanvasRenderable *)self->mGuideRenderable setOpacity:v25];
}

- (void)p_hideGuideRenderable
{
  id v6 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v6 setDuration:0.400000006];
  [(CRLCanvasRenderable *)self->mGuideRenderable opacity];
  id v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v6 setFromValue:v3];

  BOOL v4 = +[NSNumber numberWithFloat:0.0];
  [v6 setToValue:v4];

  [v6 setDelegate:self];
  double v5 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  [v6 setValue:v5 forKey:@"icc"];

  [(CRLCanvasRenderable *)self->mGuideRenderable addAnimation:v6 forKey:@"fade out"];
  [(CRLCanvasRenderable *)self->mGuideRenderable setOpacity:0.0];
}

- (BOOL)shouldShowGuides
{
  return self->mShouldShowGuides;
}

- (void)setShouldShowGuides:(BOOL)a3
{
  self->mShouldShowGuides = a3;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (CRLCanvasRep)rep
{
  return self->mRep;
}

- (void)setRep:(id)a3
{
}

- (BOOL)shouldShowHUD
{
  return self->mShouldShowHUD;
}

- (void)setShouldShowHUD:(BOOL)a3
{
  self->mShouldShowHUD = a3;
}

- (CGPoint)centerForRotation
{
  double x = self->mCenterForRotation.x;
  double y = self->mCenterForRotation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenterForRotation:(CGPoint)a3
{
  self->mCenterForRotation = a3;
}

- (double)currentLogicalAngleInDegrees
{
  return self->mCurrentLogicalAngleInDegrees;
}

- (double)originalAngleInDegrees
{
  return self->mOriginalAngleInDegrees;
}

- (CGPoint)scaledHUDPosition
{
  double x = self->mScaledHUDPosition.x;
  double y = self->mScaledHUDPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScaledHUDPosition:(CGPoint)a3
{
  self->mScaledHUDPosition = a3;
}

- (BOOL)shouldRespectScaledHUDPosition
{
  return self->_mShouldRespectScaledHUDPosition;
}

- (void)setShouldRespectScaledHUDPosition:(BOOL)a3
{
  self->_mShouldRespectScaledHUDPosition = a3;
}

- (double)snapThreshold
{
  return self->mSnapThreshold;
}

- (void)setSnapThreshold:(double)a3
{
  self->double mSnapThreshold = a3;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mIsInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mIsInspectorDrivenTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGuideRenderable, 0);

  objc_storeStrong((id *)&self->mRep, 0);
}

@end