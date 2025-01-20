@interface CRLCanvasRepFreeTransformTracker
- (BOOL)hasEverResized;
- (BOOL)inRotateResizeMode;
- (BOOL)isDragging;
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)isResizing;
- (BOOL)isRotating;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)shouldShowAndSnapToAlignmentGuides;
- (BOOL)shouldShowRotationGuide;
- (BOOL)supportsAlignmentGuides;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (CGAffineTransform)freeTransformForLayout:(SEL)a3;
- (CGAffineTransform)p_translationTransformForLayout:(SEL)a3;
- (CGAffineTransform)resizeTransformForLayout:(SEL)a3;
- (CGAffineTransform)rotateTransformForLayout:(SEL)a3;
- (CGPoint)p_centerForRotationForRep:(id)a3 inUnscaledBoundingRect:(CGRect)a4;
- (CGPoint)p_scaledCenterForRotation;
- (CGPoint)pivotPointForLayout:(id)a3;
- (CGRect)p_unscaledBoundingRectForReps:(id)a3;
- (CGSize)currentSizeForLayout:(id)a3;
- (CRLCanvasRepFreeTransformTracker)initWithReps:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (double)rotationDetentThreshold;
- (double)rotationInitialDetentThreshold;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)currentGeometryForLayout:(id)a3;
- (id)selectedRepForLayout:(id)a3;
- (void)addRotateDelta:(double)a3;
- (void)addUnscaledDragDelta:(CGPoint)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applyNewBoundsToRep:(id)a3;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)dealloc;
- (void)p_begin;
- (void)p_hideGuideRenderable;
- (void)p_updateCenterForRotationIfNecessary;
- (void)p_updateDragGuidesAndSnap:(CGPoint)a3;
- (void)p_updateGuideRenderableWithAngle:(double)a3 didSnap:(BOOL)a4;
- (void)setInRotateResizeMode:(BOOL)a3;
- (void)setMagnification:(double)a3;
- (void)setRotationDetentThreshold:(double)a3;
- (void)setRotationInitialDetentThreshold:(double)a3;
- (void)setShouldShowAndSnapToAlignmentGuides:(BOOL)a3;
- (void)setShouldShowRotationGuide:(BOOL)a3;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLCanvasRepFreeTransformTracker

- (CRLCanvasRepFreeTransformTracker)initWithReps:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CRLCanvasRepFreeTransformTracker;
  v5 = [(CRLCanvasRepFreeTransformTracker *)&v54 init];
  if (v5)
  {
    if (![v4 count])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DC7B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101081998();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DC7D0);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker initWithReps:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:110 isFatal:0 description:"Tried to free transform with no reps"];
    }
    id v9 = [v4 copy];
    v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    v11 = [v4 anyObject];
    uint64_t v12 = [v11 interactiveCanvasController];
    v13 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v12;

    id v14 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
    v15 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v14;

    id v16 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
    v17 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v16;

    *(_OWORD *)(v5 + 24) = xmmword_101175150;
    if ((unint64_t)[*((id *)v5 + 2) count] >= 2)
    {
      v5[208] = 1;
    }
    else
    {
      v18 = [*((id *)v5 + 2) anyObject];
      v19 = [v18 layout];
      v5[208] = [v19 supportsRotation];
    }
    *((void *)v5 + 27) = 0x408F380000000000;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v20 = *((id *)v5 + 2);
    id v21 = [v20 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) angleForRotation];
          double v26 = *((double *)v5 + 27);
          if (v26 == 999.0)
          {
            *((double *)v5 + 27) = v25;
          }
          else if (v25 != v26)
          {
            *((void *)v5 + 27) = 0;
            goto LABEL_27;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    *(_DWORD *)(v5 + 57) = 0;
    CGPoint v27 = CGPointZero;
    *((CGPoint *)v5 + 4) = CGPointZero;
    *((void *)v5 + 25) = 0;
    *(CGPoint *)(v5 + 152) = v27;
    *(_WORD *)(v5 + 209) = 0;
    v27.x = *((CGFloat *)v5 + 27);
    *((void *)v5 + 29) = *(void *)&v27.x;
    *((void *)v5 + 30) = *(void *)&v27.x;
    v5[248] = 1;
    *((void *)v5 + 32) = 0;
    *((_WORD *)v5 + 148) = 0;
    *((_OWORD *)v5 + 19) = xmmword_1011762C0;
    *((_OWORD *)v5 + 20) = xmmword_1011762D0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v28 = *((id *)v5 + 2);
    id v29 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          v34 = [v33 infoForTransforming:v46];
          if (v34)
          {
            v35 = [v33 interactiveCanvasController];
            v36 = [v35 layoutForInfo:v34];

            [v36 minimumSizeForResizingKnob:0];
            double v38 = v37;
            double v40 = v39;
            [v33 boundsForStandardKnobs];
            if (v41 > 0.0)
            {
              double v43 = *((double *)v5 + 41);
              if (v43 < v38 / v41) {
                double v43 = v38 / v41;
              }
              *((double *)v5 + 41) = v43;
            }
            if (v42 > 0.0)
            {
              double v44 = *((double *)v5 + 41);
              if (v44 < v40 / v42) {
                double v44 = v40 / v42;
              }
              *((double *)v5 + 41) = v44;
            }
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v30);
    }

    *((double *)v5 + 41) = fmin(*((double *)v5 + 41), 1.0);
  }

  return (CRLCanvasRepFreeTransformTracker *)v5;
}

- (void)dealloc
{
  [(CRLCanvasRenderable *)self->mRotationGuideRenderable setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepFreeTransformTracker;
  [(CRLCanvasRepFreeTransformTracker *)&v3 dealloc];
}

- (void)addUnscaledDragDelta:(CGPoint)a3
{
  double x = a3.x;
  if (self->mStartedDragging) {
    goto LABEL_6;
  }
  double v5 = sub_100064698(self->mUnscaledDragDetent.x, self->mUnscaledDragDetent.y, a3.x);
  self->mUnscaledDragDetent.double x = v5;
  self->mUnscaledDragDetent.y = v6;
  double v7 = sub_100065398(v5, v6);
  [(CRLInteractiveCanvasController *)self->mICC viewScale];
  double v9 = v7 * v8;
  double v10 = 20.0;
  if (!self->mStartedRotation && !self->mStartedMagnification) {
    double v10 = 5.0;
  }
  self->mStartedDragging = v9 > v10;
  v11 = +[NSDate date];
  [v11 timeIntervalSinceReferenceDate];
  self->mLastUpdateGuidesTimestamp = v12;

  if (self->mStartedDragging)
  {
LABEL_6:
    self->mUnscaledDragDelta.double x = sub_100064698(self->mUnscaledDragDelta.x, self->mUnscaledDragDelta.y, x);
    self->mUnscaledDragDelta.y = v13;
  }
}

- (void)addRotateDelta:(double)a3
{
  self->mRotateDeltaInRadians = self->mRotateDeltaInRadians - a3;
}

- (void)setMagnification:(double)a3
{
  if (!self->mStartedMagnification)
  {
    double v3 = 0.85;
    if (self->mStartedRotation) {
      double v3 = 0.75;
    }
    if (v3 <= a3 && dbl_1011762E0[!self->mStartedRotation] >= a3)
    {
      double mMagnifyBy = self->mMagnifyBy;
      goto LABEL_13;
    }
    self->mStartedMagnification = 1;
    self->double mMagnificationStartOffset = a3 + -1.0;
  }
  double mMagnificationStartOffset = self->mMagnificationStartOffset;
  if (mMagnificationStartOffset + 1.0 <= a3) {
    double mMagnifyBy = a3 - mMagnificationStartOffset;
  }
  else {
    double mMagnifyBy = a3 / (mMagnificationStartOffset + 1.0);
  }
LABEL_13:
  if (self->mMinimumMagnification >= mMagnifyBy) {
    double mMagnifyBy = self->mMinimumMagnification;
  }
  self->double mMagnifyBy = mMagnifyBy;
}

- (CGSize)currentSizeForLayout:(id)a3
{
  [a3 initialBoundsForStandardKnobs];
  double mMagnifyBy = self->mMagnifyBy;
  double v6 = fabs(mMagnifyBy * v5);
  double v8 = fabs(mMagnifyBy * v7);
  result.height = v8;
  result.width = v6;
  return result;
}

- (id)selectedRepForLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->mLayoutToSelectedRepMap objectForKeyedSubscript:v4];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = v4;
    if (v8)
    {
      long long v9 = 0uLL;
      double v10 = v8;
      id v21 = v8;
      do
      {
        long long v24 = v9;
        long long v25 = v9;
        long long v22 = v9;
        long long v23 = v9;
        v11 = self->mReps;
        id v12 = [(NSSet *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v23;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              v17 = [v16 layout];

              if (v10 == v17)
              {
                [(NSMapTable *)self->mLayoutToSelectedRepMap setObject:v16 forKeyedSubscript:v21];
                id v7 = v16;
                goto LABEL_24;
              }
            }
            id v13 = [(NSSet *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v18 = [v10 parent];

        double v10 = (void *)v18;
        long long v9 = 0uLL;
      }
      while (v18);
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC7F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081A20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC810);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker selectedRepForLayout:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:240 isFatal:0 description:"CRLCanvasRepFreeTransformTracker: could not find a selected rep for the given layout"];
    id v7 = 0;
LABEL_24:
  }

  return v7;
}

- (id)currentGeometryForLayout:(id)a3
{
  id v4 = a3;
  double v5 = [v4 computeInfoGeometryDuringResize];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
    goto LABEL_26;
  }
  id v8 = [(CRLCanvasRepFreeTransformTracker *)self selectedRepForLayout:v4];
  id v9 = [v8 layout];

  if (v9 == v4)
  {
    memset(&v34, 0, sizeof(v34));
    [(CRLCanvasRepFreeTransformTracker *)self freeTransformForLayout:v4];
    if (v4) {
      [v4 layoutTransformInInfoSpace:v33];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }
    CGAffineTransform v32 = v34;
    id v7 = [v8 resizedGeometryForTransform:&v32];
    goto LABEL_25;
  }
  memset(&v34, 0, sizeof(v34));
  double v10 = [v8 layout];
  [(CRLCanvasRepFreeTransformTracker *)self resizeTransformForLayout:v4];
  if (v10) {
    [v10 layoutTransformInInfoSpace:v31];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }

  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.c = v11;
  *(_OWORD *)&v32.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  uint64_t v12 = objc_opt_class();
  id v13 = [v4 parent];
  uint64_t v14 = sub_1002469D0(v12, v13);

  if (v14 && [v14 isBeingManipulated])
  {
    do
    {
      if (![v14 isBeingManipulated]) {
        break;
      }
      v15 = [v14 originalPureGeometry];
      id v16 = v15;
      if (v15) {
        [v15 transform];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      CGAffineTransform t1 = v32;
      CGAffineTransformConcat(&v32, &t1, &t2);

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = [v14 parent];
      uint64_t v19 = sub_1002469D0(v17, v18);

      uint64_t v14 = (void *)v19;
    }
    while (v19);
    memset(&t1, 0, sizeof(t1));
    CGAffineTransform v28 = v34;
    CGAffineTransform v27 = v32;
    sub_10007FC38(&v28, &v27, &t1);
    t1.tdouble x = 0.0;
    t1.ty = 0.0;
    uint64_t v20 = [v4 infoGeometryBeforeDynamicOperation];
    if (v20)
    {
      id v21 = (void *)v20;
    }
    else
    {
      long long v23 = [v4 info];
      id v21 = [v23 geometry];

      if (!v21)
      {
        memset(&v25, 0, sizeof(v25));
        goto LABEL_23;
      }
    }
    [v21 fullTransform];

LABEL_23:
    CGAffineTransform v28 = t1;
    CGAffineTransformConcat(&v26, &v25, &v28);
    id v7 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v26];
    goto LABEL_24;
  }
  long long v22 = [(CRLInteractiveCanvasController *)self->mICC repForLayout:v4];
  CGAffineTransform t1 = v34;
  id v7 = [v22 resizedGeometryForTransform:&t1];

LABEL_24:
LABEL_25:

LABEL_26:

  return v7;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  if ([(CRLInteractiveCanvasController *)self->mICC shouldSupportedDynamicOperationsEnqueueCommandsInRealTime])
  {
    self->mIsEnqueueingCommandsInRealTime = 1;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->mReps;
    id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "allowsSupportedDynamicOperationsToBeRealTime", (void)v9) & 1) == 0)
          {
            self->mIsEnqueueingCommandsInRealTime = 0;
            goto LABEL_12;
          }
        }
        id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 != (id)[(NSSet *)self->mReps count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC830);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081AA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC850);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker changeDynamicLayoutsForReps:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:301 isFatal:0 description:"Mismatched rep count"];
  }
  double x = self->mUnscaledDrag.x;
  double v10 = self->mRotateDeltaInRadians * 180.0;
  self->mRotateDeltaInRadians = 0.0;
  double v11 = sub_100064698(x, self->mUnscaledDrag.y, self->mUnscaledDragDelta.x);
  double v13 = v12;
  [(CRLInteractiveCanvasController *)self->mICC viewScale];
  double v15 = sub_100067528(v11, v13, v14);
  self->mUnscaledDrag.double x = v15;
  self->mUnscaledDrag.y = v16;
  double v17 = sub_100064680(v15, v16, x);
  double v19 = v18;
  self->mUnscaledDragDelta.double x = sub_100064680(self->mUnscaledDragDelta.x, self->mUnscaledDragDelta.y, v17);
  self->mUnscaledDragDelta.y = v20;
  id v21 = +[NSDate date];
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;

  double v24 = v23 - self->mLastUpdateGuidesTimestamp;
  self->mLastUpdateGuidesTimestamp = v23;
  if (v24 > 0.005)
  {
    [(CRLInteractiveCanvasController *)self->mICC viewScale];
    double v26 = sub_1000646A4(v17, v19, v25 / v24);
    self->mSmoothedDragSpeed.double x = sub_1000652DC(self->mSmoothedDragSpeed.x, self->mSmoothedDragSpeed.y, v26, v27, fmin(v24 * 5.0, 1.0));
    self->mSmoothedDragSpeed.y = v28;
  }
  double v29 = v10 / 3.14159265;
  if (self->mRotationSnapped)
  {
    double v30 = v29 + self->mRotationDetent;
    self->mRotationDetent = v30;
    if (self->mSupportsRotation)
    {
      double v31 = fabs(v30);
      uint64_t v32 = 272;
      if (!self->mStartedRotation) {
        uint64_t v32 = 264;
      }
      if (v31 > *(double *)((char *)&self->super.isa + v32))
      {
        self->mRotationSnapped = 0;
        self->mStartedRotation = 1;
        sub_100065C2C(v29 + self->mCurrentAngleInDegrees);
        self->double mCurrentAngleInDegrees = v33;
      }
    }
  }
  else
  {
    double mCurrentAngleInDegrees = self->mCurrentAngleInDegrees;
    sub_100065C2C(v29 + mCurrentAngleInDegrees);
    self->double mCurrentAngleInDegrees = v35;
    int mIgnoreDetents = self->mIgnoreDetents;
    if (!self->mIgnoreDetents)
    {
      BOOL v37 = mCurrentAngleInDegrees < 90.0;
      if (v35 <= 270.0) {
        BOOL v37 = 0;
      }
      BOOL v38 = mCurrentAngleInDegrees > 270.0;
      if (v35 >= 90.0) {
        BOOL v38 = 0;
      }
      if (v29 > 0.0) {
        BOOL v37 = v38;
      }
      while (1)
      {
        BOOL v39 = (mCurrentAngleInDegrees - (double)mIgnoreDetents) * (v35 - (double)mIgnoreDetents) <= 0.0;
        if (!mIgnoreDetents) {
          BOOL v39 = v37;
        }
        if (v39) {
          break;
        }
        BOOL v40 = mIgnoreDetents >= 0x10E;
        mIgnoreDetents += 90;
        if (v40)
        {
          self->mRotationSnapped = 0;
          goto LABEL_33;
        }
      }
      self->mRotationSnapped = v39;
      self->double mCurrentAngleInDegrees = (double)mIgnoreDetents;
      self->mRotationDetent = 0.0;
    }
  }
LABEL_33:
  if (!self->mStartedFreeTransform)
  {
    if (!self->mStartedRotation && !self->mStartedMagnification && !self->mStartedDragging) {
      goto LABEL_75;
    }
    [(CRLCanvasRepFreeTransformTracker *)self p_begin];
    self->mStartedFreeTransform = 1;
  }
  double v41 = [(CRLInteractiveCanvasController *)self->mICC commandController];
  double v42 = v41;
  if (self->mIsEnqueueingCommandsInRealTime) {
    [v41 openGroup];
  }
  if (self->mStartedDragging && self->mShouldShowAndSnapToAlignmentGuides)
  {
    -[CRLCanvasRepFreeTransformTracker p_updateDragGuidesAndSnap:](self, "p_updateDragGuidesAndSnap:", v17, v19);
  }
  else
  {
    self->mPreviousDragSnapDiff = CGPointZero;
    *(_DWORD *)&self->mSnappedInX = 0;
  }
  self->mIsDragging = 0;
  self->mIsResizing = 0;
  self->mIsRotating = 0;
  double v43 = self->mCurrentAngleInDegrees;
  double v44 = self->mLastAngleInDegrees - v43;
  if (v44 < 0.0) {
    double v44 = -v44;
  }
  if (v44 > 0.05)
  {
    self->mLastAngleInDegrees = v43;
    self->mIsRotating = 1;
  }
  double mMagnifyBy = self->mMagnifyBy;
  if (self->mLastMagnifyBy != mMagnifyBy)
  {
    self->mLastMagnifyBy = mMagnifyBy;
    *(_WORD *)&self->mIsResizing = 257;
  }
  double v46 = sub_100064680(self->mLastUnscledDrag.x, self->mLastUnscledDrag.y, self->mUnscaledDrag.x);
  double v48 = sub_100065398(v46, v47);
  [(CRLInteractiveCanvasController *)self->mICC viewScale];
  if (v48 * v49 >= 0.5)
  {
    self->mLastUnscledDrag = self->mUnscaledDrag;
    self->mIsDragging = 1;
LABEL_56:
    long long v50 = +[NSMutableSet set];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v51 = self->mReps;
    id v52 = [(NSSet *)v51 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v64;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v64 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          [v56 dynamicallyFreeTransformingWithTracker:self v63];
          v57 = [v56 layout];
          [v50 addObject:v57];
        }
        id v53 = [(NSSet *)v51 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v53);
    }

    if (self->mShouldShowAndSnapToAlignmentGuides && (unint64_t)[v4 count] <= 0xE)
    {
      v58 = [(NSSet *)self->mReps anyObject];
      v59 = [v58 layout];
      v60 = [v59 layoutController];
      [v60 validateLayoutsWithDependencies:v50];
    }
    goto LABEL_67;
  }
  if (self->mIsDragging || self->mIsRotating || self->mIsResizing) {
    goto LABEL_56;
  }
LABEL_67:
  if (self->mShouldRenderGuideInX || self->mShouldRenderGuideInY)
  {
    v61 = [(CRLInteractiveCanvasController *)self->mICC guideController];
    [v61 showGuidesAlignedWithRect:self->mShouldRenderGuideInX, self->mShouldRenderGuideInY, self->mAlignmentRect.origin.x, self->mAlignmentRect.origin.y, self->mAlignmentRect.size.width, self->mAlignmentRect.size.height];

    v62 = [(CRLInteractiveCanvasController *)self->mICC guideController];
    [v62 setDoNotRemoveExistingGuidesWhenDisplaying:0];
  }
  else
  {
    v62 = [(CRLInteractiveCanvasController *)self->mICC guideController];
    [v62 hideAlignmentGuides];
  }

  if (self->mStartedRotation) {
    [(CRLCanvasRepFreeTransformTracker *)self p_updateGuideRenderableWithAngle:self->mRotationSnapped didSnap:self->mCurrentAngleInDegrees];
  }
  if (self->mIsEnqueueingCommandsInRealTime) {
    [v42 closeGroup];
  }

LABEL_75:
}

- (CGAffineTransform)rotateTransformForLayout:(SEL)a3
{
  id v6 = a4;
  double v7 = self->mOriginalAngleInDegrees - self->mCurrentAngleInDegrees;
  [(CRLCanvasRepFreeTransformTracker *)self pivotPointForLayout:v6];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeTranslation(&t1, -v8, -v10);
  CGAffineTransformMakeRotation(&t2, v7 * 0.0174532925);
  CGAffineTransformConcat(&v43, &t1, &t2);
  CGAffineTransformMakeTranslation(&v40, v9, v11);
  CGAffineTransformConcat(&v44, &v43, &v40);
  if ([v6 supportsRotation])
  {
    long long v12 = *(_OWORD *)&v44.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v44.a;
    *(_OWORD *)&retstr->c = v12;
    long long v13 = *(_OWORD *)&v44.tx;
LABEL_5:
    *(_OWORD *)&retstr->tdouble x = v13;
    goto LABEL_13;
  }
  if ((id)[(NSSet *)self->mReps count] == (id)1)
  {
    long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v14;
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    goto LABEL_5;
  }
  double v15 = [(NSMapTable *)self->mLayoutToCenterForRotationMap objectForKeyedSubscript:v6];
  double v16 = v15;
  if (v15)
  {
    [v15 CGPointValue];
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    id v21 = [v6 originalGeometry];
    [v6 centerForRotation];
    if (v21)
    {
      long long v33 = v23;
      double v35 = v22;
      [v21 transform];
      long long v23 = v33;
      double v22 = v35;
      float64x2_t v25 = v37;
      float64x2_t v24 = v38;
      float64x2_t v26 = v39;
    }
    else
    {
      float64x2_t v26 = 0uLL;
      float64x2_t v38 = 0u;
      float64x2_t v39 = 0u;
      float64x2_t v37 = 0u;
      float64x2_t v25 = 0uLL;
      float64x2_t v24 = 0uLL;
    }
    float64x2_t v27 = vaddq_f64(v26, vmlaq_n_f64(vmulq_n_f64(v24, *(double *)&v23), v25, v22));
    CGFloat v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", *(void *)&v27.f64[1], *((void *)&v23 + 1), *(_OWORD *)&v27, *(_OWORD *)&v37, *(_OWORD *)&v38, *(_OWORD *)&v39);
    [(NSMapTable *)self->mLayoutToCenterForRotationMap setObject:v28 forKeyedSubscript:v6];

    double v20 = v34;
    double v18 = v36;
  }
  float64x2_t v29 = vaddq_f64(*(float64x2_t *)&v44.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v44.c, v20), *(float64x2_t *)&v44.a, v18));
  double v30 = sub_100064680(v29.f64[0], v29.f64[1], v18);
  CGAffineTransformMakeTranslation(retstr, v30, v31);

LABEL_13:
  return result;
}

- (CGAffineTransform)resizeTransformForLayout:(SEL)a3
{
  id v6 = a4;
  [(CRLCanvasRepFreeTransformTracker *)self pivotPointForLayout:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeTranslation(&t1, -v7, -v9);
  CGAffineTransformMakeScale(&t2, self->mMagnifyBy, self->mMagnifyBy);
  CGAffineTransformConcat(&v32, &t1, &t2);
  CGAffineTransformMakeTranslation(&v29, v8, v10);
  CGAffineTransformConcat(&v33, &v32, &v29);
  CGFloat v11 = [(CRLCanvasRepFreeTransformTracker *)self selectedRepForLayout:v6];
  id v12 = [v11 layout];

  if (v12 == v6)
  {
    long long v23 = *(_OWORD *)&v33.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
    *(_OWORD *)&retstr->c = v23;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v33.tx;
  }
  else
  {
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v28.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v28.c = v13;
    *(_OWORD *)&v28.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    uint64_t v14 = objc_opt_class();
    double v15 = [v6 parent];
    double v16 = sub_1002469D0(v14, v15);

    if (v16 && [v16 isBeingManipulated])
    {
      do
      {
        if (![v16 isBeingManipulated]) {
          break;
        }
        double v17 = [v16 originalPureGeometry];
        double v18 = v17;
        if (v17) {
          [v17 transform];
        }
        else {
          memset(&v27, 0, sizeof(v27));
        }
        CGAffineTransform v26 = v28;
        CGAffineTransformConcat(&v28, &v26, &v27);

        uint64_t v19 = objc_opt_class();
        double v20 = [v16 parent];
        uint64_t v21 = sub_1002469D0(v19, v20);

        double v16 = (void *)v21;
      }
      while (v21);
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tdouble x = 0u;
      *(_OWORD *)&retstr->a = 0u;
      CGAffineTransform v26 = v33;
      CGAffineTransform v25 = v28;
      sub_10007FC38(&v26, &v25, retstr);
      retstr->tdouble x = 0.0;
      retstr->ty = 0.0;
    }
    else
    {
      long long v22 = *(_OWORD *)&v33.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
      *(_OWORD *)&retstr->c = v22;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v33.tx;
    }
  }
  return result;
}

- (CGAffineTransform)freeTransformForLayout:(SEL)a3
{
  id v6 = a4;
  double v7 = [(CRLCanvasRepFreeTransformTracker *)self selectedRepForLayout:v6];
  id v8 = [v7 layout];

  if (v8 == v6)
  {
    [(CRLCanvasRepFreeTransformTracker *)self rotateTransformForLayout:v6];
    [(CRLCanvasRepFreeTransformTracker *)self resizeTransformForLayout:v6];
    CGAffineTransformConcat(&v13, &t1, &t2);
    [(CRLCanvasRepFreeTransformTracker *)self p_translationTransformForLayout:v6];
    CGAffineTransformConcat(retstr, &v13, &v10);
  }
  else
  {
    [(CRLCanvasRepFreeTransformTracker *)self resizeTransformForLayout:v6];
  }

  return result;
}

- (void)applyNewBoundsToRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLInteractiveCanvasController *)self->mICC commandController];
  id v6 = [v4 layout];
  double v7 = [v6 finalInfoGeometryForFreeTransform];

  if (!v7)
  {
    id v8 = [v4 layout];
    double v7 = [(CRLCanvasRepFreeTransformTracker *)self currentGeometryForLayout:v8];
  }
  double v9 = [v4 infoForTransforming];
  CGAffineTransform v10 = v9;
  if (v9
    && self->mStartedFreeTransform
    && ([v9 conformsToProtocol:&OBJC_PROTOCOL___CRLResizingAwareInfo] & 1) == 0)
  {
    id v11 = [v4 newCommandToApplyGeometry:v7 toInfo:v10];
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DC870);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101081B30();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DC890);
      }
      id v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      CGAffineTransform v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker applyNewBoundsToRep:]");
      uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 534, 0, "invalid nil value for '%{public}s'", "cmd");
    }
    double v15 = [CRLCanvasCommandSelectionBehavior alloc];
    double v16 = [(CRLInteractiveCanvasController *)self->mICC canvasEditor];
    double v17 = [(CRLInteractiveCanvasController *)self->mICC editorController];
    double v18 = [v17 selectionPath];
    uint64_t v19 = [(CRLCanvasCommandSelectionBehavior *)v15 initWithCanvasEditor:v16 type:2 selectionPath:v18 selectionFlags:4];

    [v5 enqueueCommand:v11 withSelectionBehavior:v19];
  }
  [v4 dynamicFreeTransformDidEndWithTracker:self];
  [v4 invalidateKnobs];
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)commitChangesForReps:(id)a3
{
  if (self->mStartedFreeTransform)
  {
    id v4 = [(CRLInteractiveCanvasController *)self->mICC commandController];
    id v5 = +[NSMutableSet set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->mReps;
    id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v26 + 1) + 8 * i) info];
          [v5 addObject:v11];
        }
        id v8 = [(NSSet *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    id v12 = [(CRLInteractiveCanvasController *)self->mICC canvasEditor];
    CGAffineTransform v13 = [v12 selectionPathWithInfos:v5];

    uint64_t v14 = [[CRLCommandSelectionBehavior alloc] initWithCommitSelectionPath:0 forwardSelectionPath:v13 reverseSelectionPath:v13];
    [v4 openGroupWithSelectionBehavior:v14];
    double v15 = [(NSSet *)self->mReps anyObject];
    double v16 = [v15 actionStringForFreeTransform];
    [v4 setCurrentGroupActionString:v16];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v17 = self->mReps;
    id v18 = [(NSSet *)v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          -[CRLCanvasRepFreeTransformTracker applyNewBoundsToRep:](self, "applyNewBoundsToRep:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j), (void)v22);
        }
        id v19 = [(NSSet *)v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v19);
    }

    [v4 closeGroup];
    if (self->mIsEnqueueingCommandsInRealTime) {
      [v4 closeGroup];
    }
  }
  [(CRLCanvasRepFreeTransformTracker *)self p_hideGuideRenderable];
}

- (BOOL)supportsAlignmentGuides
{
  return 1;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014DC8B0);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Begin free transform operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014DC8D0);
  }
  double v3 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    double v4 = self->mCurrentAngleInDegrees - self->mOriginalAngleInDegrees;
    int v6 = 134217984;
    double v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "End free transform operation. rotated by %f degrees", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->mShouldShowRotationGuide && self->mRotationGuideRenderable)
  {
    mRotationGuideRenderable = self->mRotationGuideRenderable;
    v2 = +[NSArray arrayWithObjects:&mRotationGuideRenderable count:1];
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
  [(CRLInteractiveCanvasController *)self->mICC endEditing];
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    double v3 = [(CRLInteractiveCanvasController *)self->mICC commandController];
    [v3 openGroup];
    [v3 enableRealTimeSyncProgressiveEnqueuingInCurrentGroup];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = self->mReps;
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 dynamicFreeTransformDidBeginWithTracker:self];
        [v9 setShowKnobsDuringManipulation:0];
      }
      id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(CRLCanvasRepFreeTransformTracker *)self p_updateCenterForRotationIfNecessary];
}

- (CGRect)p_unscaledBoundingRectForReps:(id)a3
{
  id v3 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v3);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v12 boundsForStandardKnobs];
        [v12 convertNaturalRectToUnscaledCanvas:];
        v29.origin.CGFloat x = v13;
        v29.origin.CGFloat y = v14;
        v29.size.CGFloat width = v15;
        v29.size.CGFloat height = v16;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
      }
      id v9 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGPoint)p_centerForRotationForRep:(id)a3 inUnscaledBoundingRect:(CGRect)a4
{
  double v5 = sub_100065738(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v7 = v6;
  id v8 = a3;
  [v8 convertNaturalPointFromUnscaledCanvas:v5, v7];
  double v18 = v10;
  double v19 = v9;
  long long v11 = [v8 layout];

  long long v12 = [v11 geometry];

  if (v12)
  {
    [v12 transform];
    float64x2_t v13 = v21;
    float64x2_t v14 = v22;
    float64x2_t v15 = v23;
  }
  else
  {
    float64x2_t v15 = 0uLL;
    float64x2_t v13 = 0uLL;
    float64x2_t v14 = 0uLL;
  }
  float64x2_t v20 = vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v18), v13, v19));

  double v17 = v20.f64[1];
  double v16 = v20.f64[0];
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (void)p_updateCenterForRotationIfNecessary
{
  if (self->mUnscaledPivotPoint.x == INFINITY && self->mUnscaledPivotPoint.y == INFINITY)
  {
    if ((id)[(NSSet *)self->mReps count] == (id)1)
    {
      double v4 = [(NSSet *)self->mReps anyObject];
      double v5 = [v4 layout];

      [v5 centerForRotation];
      if (v5)
      {
        double v16 = v7;
        double v17 = v6;
        [v5 originalTransformInRoot];
        double v7 = v16;
        double v6 = v17;
        float64x2_t v9 = v18;
        float64x2_t v8 = v19;
        float64x2_t v10 = v20;
      }
      else
      {
        float64x2_t v10 = 0uLL;
        float64x2_t v9 = 0uLL;
        float64x2_t v8 = 0uLL;
      }
      self->mUnscaledPivotPoint = (CGPoint)vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v8, v7), v9, v6));
    }
    else
    {
      [(CRLCanvasRepFreeTransformTracker *)self p_unscaledBoundingRectForReps:self->mReps];
      self->mUnscaledPivotPoint.CGFloat x = sub_100065738(v11, v12, v13, v14);
      self->mUnscaledPivotPoint.CGFloat y = v15;
    }
  }
}

- (CGPoint)pivotPointForLayout:(id)a3
{
  id v4 = a3;
  double v5 = [v4 originalGeometry];

  if (!v5)
  {
    memset(&v36, 0, sizeof(v36));
    if (v4) {
      [v4 transformInRoot];
    }
    else {
      memset(&v31, 0, sizeof(v31));
    }
    CGAffineTransformInvert(&v36, &v31);
    double x = self->mUnscaledPivotPoint.x;
    double y = self->mUnscaledPivotPoint.y;
    double v8 = v36.tx + y * v36.c + v36.a * x;
    double v9 = v36.ty + y * v36.d + v36.b * x;
    float64x2_t v20 = [v4 geometry];
    CGFloat v11 = v20;
    if (v20)
    {
      [v20 transform];
      double v12 = v26;
      double v13 = v25;
      double v14 = v28;
      double v15 = v27;
      double v16 = v30;
      double v17 = v29;
      goto LABEL_14;
    }
LABEL_13:
    double v16 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
    goto LABEL_14;
  }
  memset(&v36, 0, sizeof(v36));
  if (v4) {
    [v4 originalTransformInRoot];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }
  CGAffineTransformInvert(&v36, &v35);
  double v6 = self->mUnscaledPivotPoint.x;
  double v7 = self->mUnscaledPivotPoint.y;
  double v8 = v36.tx + v7 * v36.c + v36.a * v6;
  double v9 = v36.ty + v7 * v36.d + v36.b * v6;
  float64x2_t v10 = [v4 originalGeometry];
  CGFloat v11 = v10;
  if (!v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    goto LABEL_13;
  }
  [v10 transform];
  double v12 = *((double *)&v32 + 1);
  double v13 = *(double *)&v32;
  double v14 = *((double *)&v33 + 1);
  double v15 = *(double *)&v33;
  double v16 = *((double *)&v34 + 1);
  double v17 = *(double *)&v34;
LABEL_14:
  double v21 = v17 + v9 * v15 + v13 * v8;
  double v22 = v16 + v9 * v14 + v12 * v8;

  double v23 = v21;
  double v24 = v22;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)p_scaledCenterForRotation
{
  -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:", self->mUnscaledPivotPoint.x, self->mUnscaledPivotPoint.y);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGAffineTransform)p_translationTransformForLayout:(SEL)a3
{
  id v6 = a4;
  double v7 = self->mUnscaledDrag.x + self->mPreviousDragSnapDiff.x;
  double v8 = self->mUnscaledDrag.y + self->mPreviousDragSnapDiff.y;
  double v9 = [v6 parent];

  if (v9)
  {
    float64x2_t v10 = [v6 parent];
    CGFloat v11 = v10;
    if (v10) {
      [v10 transformInRoot];
    }
    else {
      memset(&v14, 0, sizeof(v14));
    }
    CGAffineTransformInvert(&v15, &v14);
    double v7 = sub_1000664E0((float64x2_t *)&v15, v7, v8);
    double v8 = v12;
  }
  CGAffineTransformMakeTranslation(retstr, v7, v8);

  return result;
}

- (void)p_updateGuideRenderableWithAngle:(double)a3 didSnap:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->mRotationGuideRenderable)
  {
    double v7 = [(CRLInteractiveCanvasController *)self->mICC canvas];
    [v7 contentsScale];
    double v9 = v8;

    float64x2_t v10 = +[CRLCanvasShapeRenderable renderable];
    mRotationGuideRenderable = self->mRotationGuideRenderable;
    self->mRotationGuideRenderable = v10;

    double v12 = sub_10000FE5C(0.933000028, 0.791999996, 0.0, 1.0);
    [(CRLCanvasShapeRenderable *)self->mRotationGuideRenderable setStrokeColor:v12];
    CGColorRelease(v12);
    [(CRLCanvasShapeRenderable *)self->mRotationGuideRenderable setFillColor:0];
    [(CRLCanvasShapeRenderable *)self->mRotationGuideRenderable setLineWidth:1.0 / v9];
    [(CRLCanvasRenderable *)self->mRotationGuideRenderable setZPosition:-1.0];
    -[CRLCanvasRenderable setAnchorPoint:](self->mRotationGuideRenderable, "setAnchorPoint:", 0.5, 0.0);
    [(CRLCanvasRenderable *)self->mRotationGuideRenderable setDelegate:self];
    [(CRLCanvasRenderable *)self->mRotationGuideRenderable setEdgeAntialiasingMask:0];
    [(CRLCanvasRepFreeTransformTracker *)self p_scaledCenterForRotation];
    double v14 = floor(v13);
    double v16 = floor(v15);
    if ((id)[(NSSet *)self->mReps count] == (id)1)
    {
      double v17 = [(NSSet *)self->mReps anyObject];
      [v17 unscaledGuidePosition];
      double MidX = v18;
      double MinY = v20;
    }
    else
    {
      [(CRLCanvasRepFreeTransformTracker *)self p_unscaledBoundingRectForReps:self->mReps];
      CGFloat x = v40.origin.x;
      CGFloat y = v40.origin.y;
      CGFloat width = v40.size.width;
      CGFloat height = v40.size.height;
      double MidX = CGRectGetMidX(v40);
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v41);
    }
    -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:", MidX, MinY);
    self->mRotationGuideLength = sub_1000653B4(v26, v27, v14, v16) / self->mMagnifyBy;
    -[CRLCanvasRenderable setPosition:](self->mRotationGuideRenderable, "setPosition:", v14, v16);
    [(CRLInteractiveCanvasController *)self->mICC addDecorator:self];
  }
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, -10.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, self->mRotationGuideLength * self->mMagnifyBy + 10.0);
  v42.origin.CGFloat x = -5.5;
  v42.origin.CGFloat y = -5.5;
  v42.size.CGFloat width = 11.0;
  v42.size.CGFloat height = 11.0;
  CGPathAddEllipseInRect(Mutable, 0, v42);
  CGPathMoveToPoint(Mutable, 0, -10.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 10.0, 0.0);
  [(CRLCanvasShapeRenderable *)self->mRotationGuideRenderable setPath:Mutable];
  CGPathRelease(Mutable);
  double v29 = [(CRLInteractiveCanvasController *)self->mICC canvas];
  [v29 convertUnscaledToBoundsPoint:sub_100064698(self->mUnscaledDrag.x, self->mUnscaledDrag.y, self->mPreviousDragSnapDiff.x)];
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  CGAffineTransformMakeRotation(&t1, (a3 + 180.0) * -0.0174532925);
  CGAffineTransformMakeTranslation(&t2, v31, v33);
  CGAffineTransformConcat(&v39, &t1, &t2);
  long long v34 = self->mRotationGuideRenderable;
  CGAffineTransform v36 = v39;
  [(CRLCanvasRenderable *)v34 setAffineTransform:&v36];
  LODWORD(v35) = 0.5;
  if (v4) {
    *(float *)&double v35 = 1.0;
  }
  [(CRLCanvasRenderable *)self->mRotationGuideRenderable setOpacity:v35];
}

- (void)p_hideGuideRenderable
{
  id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v5 setDuration:0.400000006];
  [(CRLCanvasRenderable *)self->mRotationGuideRenderable opacity];
  double v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v5 setFromValue:v3];

  BOOL v4 = +[NSNumber numberWithFloat:0.0];
  [v5 setToValue:v4];

  [v5 setDelegate:self];
  [v5 setValue:self->mICC forKey:@"icc"];
  [(CRLCanvasRenderable *)self->mRotationGuideRenderable addAnimation:v5 forKey:@"fade out"];
  [(CRLCanvasRenderable *)self->mRotationGuideRenderable setOpacity:0.0];
}

- (void)p_updateDragGuidesAndSnap:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = sub_100065398(self->mSmoothedDragSpeed.x, self->mSmoothedDragSpeed.y);
  if ([(CRLInteractiveCanvasController *)self->mICC currentlyScrolling])
  {
    BOOL v7 = 0;
  }
  else
  {
    double v8 = 200.0;
    if (!self->mSnappedInX) {
      double v8 = 100.0;
    }
    BOOL v7 = v6 < v8;
  }
  self->mShouldRenderGuideInX = v7;
  if ([(CRLInteractiveCanvasController *)self->mICC currentlyScrolling])
  {
    BOOL v9 = 0;
  }
  else
  {
    double v10 = 200.0;
    if (!self->mSnappedInY) {
      double v10 = 100.0;
    }
    BOOL v9 = v6 < v10;
  }
  self->mShouldRenderGuideInY = v9;
  if (self->mShouldRenderGuideInX)
  {
    unsigned __int8 v11 = 1;
    if (v9)
    {
LABEL_13:
      unsigned __int8 v12 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    unsigned __int8 v11 = [(CRLInteractiveCanvasController *)self->mICC isCanvasBackgroundAlignmentSnappingEnabled];
    if (self->mShouldRenderGuideInY) {
      goto LABEL_13;
    }
  }
  unsigned __int8 v12 = [(CRLInteractiveCanvasController *)self->mICC isCanvasBackgroundAlignmentSnappingEnabled];
LABEL_16:
  CGSize size = CGRectZero.size;
  self->mAlignmentRect.origin = CGRectZero.origin;
  self->mAlignmentRect.CGSize size = size;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v14 = self->mReps;
  id v15 = [(NSSet *)v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        float64x2_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v19, "shouldShowSizesInRulers", (void)v32))
        {
          [v19 snapRectForDynamicDragWithOffset:sub_100064680(x, y, self->mPreviousDragSnapDiff.x)];
          self->mAlignmentRect.origin.double x = sub_100064F28(self->mAlignmentRect.origin.x, self->mAlignmentRect.origin.y, self->mAlignmentRect.size.width, self->mAlignmentRect.size.height, v20, v21, v22, v23);
          self->mAlignmentRect.origin.double y = v24;
          self->mAlignmentRect.size.CGFloat width = v25;
          self->mAlignmentRect.size.CGFloat height = v26;
        }
      }
      id v16 = [(NSSet *)v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }

  double v27 = [(CRLInteractiveCanvasController *)self->mICC guideController];
  [v27 snapRectToGuides:self->mAlignmentRect.origin.x, self->mAlignmentRect.origin.y, self->mAlignmentRect.size.width, self->mAlignmentRect.size.height];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  self->mSnappedInX = [v27 didJustSnapInX];
  self->mSnappedInY = [v27 didJustSnapInY];
  if ((v11 & 1) == 0)
  {
    self->mSnappedInX = 0;
    CGFloat v29 = 0.0;
  }
  if ((v12 & 1) == 0)
  {
    self->mSnappedInY = 0;
    CGFloat v31 = 0.0;
  }
  self->mAlignmentRect = CGRectOffset(self->mAlignmentRect, v29, v31);
  self->mPreviousDragSnapDiff.double x = v29;
  self->mPreviousDragSnapDiff.double y = v31;
}

- (double)rotationInitialDetentThreshold
{
  return self->mRotationInitialDetentThreshold;
}

- (void)setRotationInitialDetentThreshold:(double)a3
{
  self->mRotationInitialDetentThreshold = a3;
}

- (double)rotationDetentThreshold
{
  return self->mRotationDetentThreshold;
}

- (void)setRotationDetentThreshold:(double)a3
{
  self->mRotationDetentThreshold = a3;
}

- (BOOL)shouldShowAndSnapToAlignmentGuides
{
  return self->mShouldShowAndSnapToAlignmentGuides;
}

- (void)setShouldShowAndSnapToAlignmentGuides:(BOOL)a3
{
  self->mShouldShowAndSnapToAlignmentGuides = a3;
}

- (BOOL)shouldShowRotationGuide
{
  return self->mShouldShowRotationGuide;
}

- (void)setShouldShowRotationGuide:(BOOL)a3
{
  self->mShouldShowRotationGuide = a3;
}

- (BOOL)isDragging
{
  return self->mIsDragging;
}

- (BOOL)isRotating
{
  return self->mIsRotating;
}

- (BOOL)isResizing
{
  return self->mIsResizing;
}

- (BOOL)hasEverResized
{
  return self->mHasEverResized;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)inRotateResizeMode
{
  return self->_inRotateResizeMode;
}

- (void)setInRotateResizeMode:(BOOL)a3
{
  self->_inRotateResizeMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRotationGuideRenderable, 0);
  objc_storeStrong((id *)&self->mLayoutToCenterForRotationMap, 0);
  objc_storeStrong((id *)&self->mLayoutToSelectedRepMap, 0);
  objc_storeStrong((id *)&self->mReps, 0);

  objc_storeStrong((id *)&self->mICC, 0);
}

@end