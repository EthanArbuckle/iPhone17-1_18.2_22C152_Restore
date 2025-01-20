@interface CRLFreehandDrawingTool
+ (id)closestDrawingLayout:(id)a3 toPoint:(CGPoint)a4 returningDistance:(double *)a5;
- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3;
- (BOOL)isCurrentlyTracking;
- (BOOL)isPerformingActions;
- (BOOL)selectInsideClosestDrawing:(id)a3 toPoint:(CGPoint)a4;
- (BOOL)shouldCommandsEnqueueInRealTime;
- (BOOL)wantsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4;
- (CRLFreehandDrawingTool)initWithInteractiveCanvasController:(id)a3;
- (CRLInteractiveCanvasController)icc;
- (id)possibleFreehandDrawingLayoutsInParentContainerAtPoint:(CGPoint)a3;
- (int64_t)currentInputType;
- (unint64_t)type;
- (void)clearIsCurrentlyTracking;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
@end

@implementation CRLFreehandDrawingTool

- (CRLFreehandDrawingTool)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingTool;
  v5 = [(CRLFreehandDrawingTool *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v6->_shouldEnableHandwritingIntelligence = +[CRLFeatureFlagsHelper isOSFeatureEnabled:1];
  }

  return v6;
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  if (v5)
  {
    if (self->_isCurrentlyTracking || self->_isPerformingActions)
    {
      int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5568);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101090E4C(v8, v9);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5588);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v10, v8);
      }
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTool.m"];
      +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:55 isFatal:0 description:"Shouldn't be already tracking or performing actions when receiving the initial point."];
    }
    *(_WORD *)&self->_isPerformingActions = 257;
    self->_firstInputType = (int64_t)[v7 inputType];
  }
  self->_currentInputType = (int64_t)[v7 inputType];
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  self->_isPerformingActions = 0;
  int64_t firstInputType = self->_firstInputType;
  uint64_t v5 = 3;
  if (firstInputType) {
    uint64_t v5 = 0;
  }
  if (firstInputType == 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  int v8 = [WeakRetained freehandDrawingToolkit];
  [v8 beginDrawingModeIfNeededForTouchType:v6];

  return a3;
}

- (void)clearIsCurrentlyTracking
{
  self->_isCurrentlyTracking = 0;
}

- (unint64_t)type
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E55A8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLFreehandDrawingTool type]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTool.m";
    __int16 v24 = 1024;
    int v25 = 96;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E55C8);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    int v8 = v7;
    v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTool type]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTool.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 96, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLFreehandDrawingTool type]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)wantsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)shouldCommandsEnqueueInRealTime
{
  return 0;
}

- (BOOL)isPerformingActions
{
  return self->_isPerformingActions;
}

- (BOOL)isCurrentlyTracking
{
  return self->_isCurrentlyTracking;
}

- (int64_t)currentInputType
{
  return self->_currentInputType;
}

- (void).cxx_destruct
{
}

- (CRLInteractiveCanvasController)icc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

+ (id)closestDrawingLayout:(id)a3 toPoint:(CGPoint)a4 returningDistance:(double *)a5
{
  double y = a4.y;
  uint64_t v24 = *(void *)&a4.x;
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v29;
    float64x2_t v22 = (float64x2_t)vdupq_lane_s64(v24, 0);
    double v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (v13) {
          [*(id *)(*((void *)&v28 + 1) + 8 * i) transformInRoot];
        }
        else {
          memset(&v26, 0, sizeof(v26));
        }
        CGAffineTransformInvert(&v27, &v26);
        float64x2_t v25 = vaddq_f64(*(float64x2_t *)&v27.tx, vmlaq_f64(vmulq_n_f64(*(float64x2_t *)&v27.c, y), v22, *(float64x2_t *)&v27.a));
        [v13 boundsForStandardKnobs];
        double v18 = sub_1000653CC(v25.f64[0], v25.f64[1], v14, v15, v16, v17);
        if (v18 <= v11)
        {
          double v19 = v18;
          id v20 = v13;

          double v11 = v19;
          v9 = v20;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
    if (a5) {
      goto LABEL_14;
    }
  }
  else
  {
    v9 = 0;
    double v11 = 1.79769313e308;
    if (a5) {
LABEL_14:
    }
      *a5 = v11;
  }

  return v9;
}

- (id)possibleFreehandDrawingLayoutsInParentContainerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v6 = [WeakRetained parentForFreehandDrawingLayoutsAtPoint:x, y];

  id v7 = [v6 children];
  id v8 = +[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:v7];

  return v8;
}

- (BOOL)selectInsideClosestDrawing:(id)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [objc_opt_class() closestDrawingLayout:v7 toPoint:0 returningDistance:x, y];

  id v9 = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v10 = v9;
  if (v8)
  {
    double v11 = [v9 selectionModelTranslator];
    v12 = [v8 freehandInfo];
    v13 = [v11 selectionPathForNothingSelectedInsideGroup:v12];
    [v10 setSelectionPath:v13 withSelectionFlags:0];
  }
  else
  {
    double v11 = [v9 canvasEditor];
    v12 = [v11 selectionPathWithInfo:0];
    [v10 setSelectionPath:v12 withSelectionFlags:0];
    v13 = v10;
  }

  return v8 != 0;
}

@end