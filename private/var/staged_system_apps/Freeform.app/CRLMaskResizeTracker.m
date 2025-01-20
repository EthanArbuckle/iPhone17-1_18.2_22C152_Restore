@interface CRLMaskResizeTracker
- (BOOL)isInspectorDrivenTracking;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)supportsAlignmentGuides;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (CGAffineTransform)p_currentResizeTransform;
- (CGAffineTransform)transformForImageKnobPosition;
- (CRLMaskResizeTracker)initWithImageRep:(id)a3;
- (double)sliderValue;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)setSliderValue:(double)a3;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLMaskResizeTracker

- (CRLMaskResizeTracker)initWithImageRep:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6980);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A0D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D69A0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker initWithImageRep:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 30, 0, "Invalid parameter not satisfying: %{public}s", "imageRep != nil");
  }
  v21.receiver = self;
  v21.super_class = (Class)CRLMaskResizeTracker;
  v9 = [(CRLMaskResizeTracker *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mImageRep, a3);
    v11 = [v5 imageLayout];
    v12 = [v11 imageGeometry];
    [v12 frame];
    double v17 = sub_100065738(v13, v14, v15, v16);
    CGFloat v19 = v18;

    v10->mCenterInParentSpace.x = v17;
    v10->mCenterInParentSpace.y = v19;
  }
  return v10;
}

- (CGAffineTransform)p_currentResizeTransform
{
  double mSliderValue = self->mSliderValue;
  [(CRLImageRep *)self->mImageRep maskScale];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGAffineTransformMakeScale(&v10, mSliderValue / v6, mSliderValue / v6);
  double v7 = sub_1000646A4(self->mCenterInParentSpace.x, self->mCenterInParentSpace.y, -1.0);
  return sub_10007FCC0(&v10, retstr, v7, v8);
}

- (CGAffineTransform)transformForImageKnobPosition
{
  [(CRLMaskResizeTracker *)self p_currentResizeTransform];
  return CGAffineTransformMakeTranslation(retstr, v9 + CGPointZero.y * v7 + v5 * CGPointZero.x, v10 + CGPointZero.y * v8 + v6 * CGPointZero.x);
}

- (BOOL)isInspectorDrivenTracking
{
  return 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  id v4 = a3;
  if ([v4 count] != (id)1
    || ([v4 anyObject],
        double v5 = (CRLImageRep *)objc_claimAutoreleasedReturnValue(),
        mImageRep = self->mImageRep,
        v5,
        v5 != mImageRep))
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D69C0);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A180((uint64_t)v4, v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D69E0);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker willBeginDynamicOperationForReps:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10, v11, 68, 0, "Unexpected rep(s) for transformation %@", v4 file lineNumber isFatal description];
  }
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4 = a3;
  if ([v4 count] != (id)1
    || ([v4 anyObject],
        double v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) == 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6A00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A23C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6A20);
    }
    int v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker changeDynamicLayoutsForReps:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:80 isFatal:0 description:"image mask editor not given correct reps for resize"];
  }
  double v10 = [(CRLImageRep *)self->mImageRep imageLayout];
  unsigned __int8 v11 = [v10 isInMaskScaleMode];

  if ((v11 & 1) == 0) {
    [(CRLImageRep *)self->mImageRep beginDynamicallyChangingMaskScale];
  }
  v12 = [(CRLImageRep *)self->mImageRep imageLayout];
  [(CRLMaskResizeTracker *)self p_currentResizeTransform];
  [v12 resizeWithTransform:&v15];

  CGFloat v13 = [(CRLImageRep *)self->mImageRep imageLayout];
  id v14 = [v13 maskEditMode];

  if (v14 == (id)3) {
    [(CRLCanvasRep *)self->mImageRep invalidateKnobPositions];
  }
}

- (void)commitChangesForReps:(id)a3
{
  id v4 = self->mImageRep;
  double v5 = [(CRLCanvasRep *)v4 interactiveCanvasController];
  double v6 = [v5 commandController];
  int v7 = [CRLCanvasCommandSelectionBehavior alloc];
  double v8 = [v5 canvasEditor];
  double v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  v41 = v9;
  [v6 openGroupWithSelectionBehavior:v9];
  double v10 = [(CRLImageRep *)v4 actionStringForResize];
  [v6 setCurrentGroupActionString:v10];

  [(CRLMaskResizeTracker *)self p_currentResizeTransform];
  uint64_t v11 = [(CRLImageRep *)v4 resizedGeometryForTransform:v42];
  v12 = [(CRLImageRep *)v4 imageLayout];
  CGFloat v13 = [v12 maskLayout];
  uint64_t v14 = [v13 infoGeometry];

  uint64_t v15 = [(CRLImageRep *)v4 imageLayout];
  CGFloat v16 = [v15 maskLayout];
  double v17 = [v16 pathSource];

  double v18 = [(CRLImageRep *)v4 imageInfo];
  v39 = (void *)v14;
  v40 = (void *)v11;
  CGFloat v19 = [[_TtC8Freeform30CRLCommandSetImageItemGeometry alloc] initWithImageItem:v18 imageGeometry:v11 maskGeometry:v14 maskPathSource:v17];
  [v6 enqueueCommand:v19];
  [v6 closeGroup];
  [(CRLImageRep *)v4 endDynamicallyChangingMaskScale:self->mSliderValue];
  v20 = [(CRLImageRep *)v4 imageLayout];
  id v21 = [v20 maskEditMode];

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v22 = [v5 layerHost];
  v23 = [v22 imageHUDController];
  [v23 setNotAllowedToHideHUD:1];

  [v5 layoutIfNeeded];
  v24 = [(CRLCanvasRep *)self->mImageRep info];
  v25 = [v5 repsForInfo:v24];

  if (v25
    && [v25 count]
    && ([v25 containsObject:self->mImageRep] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    id v38 = v21;
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6A40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A2D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6A60);
    }
    v26 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v26);
    }
    v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker commitChangesForReps:]");
    v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:135 isFatal:0 description:"Image rep was moved to floating to manipulate it. This will probably do something bad for template objects."];

    v29 = [v25 anyObject];
    uint64_t v30 = objc_opt_class();
    v37 = v29;
    v31 = sub_1002469D0(v30, v29);
    [v31 editMaskWithHUD:1];
    v32 = [v31 imageLayout];
    id v33 = [v32 maskEditMode];

    if (v33 != v38)
    {
      if (v38 == (id)3) {
        uint64_t v34 = 3;
      }
      else {
        uint64_t v34 = 2;
      }
      [v31 beginEditingMaskInMaskEditMode:v34];
    }
  }
  v35 = [v5 layerHost];
  v36 = [v35 imageHUDController];
  [v36 setNotAllowedToHideHUD:0];

  +[CATransaction commit];
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014D6A80);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin resize mask with slider operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014D6AA0);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "end resize mask with slider operation", v4, 2u);
  }
  return 1;
}

- (double)sliderValue
{
  return self->mSliderValue;
}

- (void)setSliderValue:(double)a3
{
  self->double mSliderValue = a3;
}

- (void).cxx_destruct
{
}

@end