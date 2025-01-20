@interface CRLFreehandDrawingToolStroke
+ (BOOL)p_isStrokeToolType:(unint64_t)a3;
- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3;
- (BOOL)shouldCommandsEnqueueInRealTime;
- (CRLFreehandDrawingToolStroke)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 strokeToolType:(unint64_t)a5 opacity:(double)a6 unscaledWidth:(double)a7;
- (double)opacity;
- (double)unscaledWidth;
- (id)p_currentColorWithOpacity;
- (id)p_currentPKInkType;
- (unint64_t)type;
- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3;
- (void)p_endDrawingAndCaptureFinalStroke:(BOOL)a3;
- (void)p_enqueueRealTimeCommandsForPathUpdateIfNeeded;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
- (void)setOpacity:(double)a3;
- (void)setUnscaledWidth:(double)a3;
- (void)updatePencilKitToolIfAppropriateFor:(id)a3;
@end

@implementation CRLFreehandDrawingToolStroke

- (CRLFreehandDrawingToolStroke)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 strokeToolType:(unint64_t)a5 opacity:(double)a6 unscaledWidth:(double)a7
{
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRLFreehandDrawingToolStroke;
  v13 = [(CRLFreehandDrawingTool *)&v18 initWithInteractiveCanvasController:a3];
  if (v13)
  {
    if (!+[CRLFreehandDrawingToolStroke p_isStrokeToolType:a5])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5620);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AB5B0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5640);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:strokeToolType:opacity:unscaledWidth:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 64, 0, "Stroke tool should only be initialized with a stroke tool type (got %zu).", a5);
    }
    objc_storeWeak((id *)&v13->_pencilKitCanvasViewController, v12);
    v13->_toolType = a5;
    v13->_opacity = a6;
    v13->_unscaledWidth = a7;
  }

  return v13;
}

+ (BOOL)p_isStrokeToolType:(unint64_t)a3
{
  return a3 - 10 < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)setUnscaledWidth:(double)a3
{
  self->_unscaledWidth = a3;
  v5 = [(CRLFreehandDrawingTool *)self icc];
  id v9 = [v5 freehandDrawingToolkit];

  v6 = [v9 toolkitUIState];
  [v6 setCurrentToolWidth:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v8 = [WeakRetained pencilKitCanvasView];
  [(CRLFreehandDrawingToolStroke *)self updatePencilKitToolIfAppropriateFor:v8];

  [v9 containedToolDidSetWidth:self];
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
  v5 = [(CRLFreehandDrawingTool *)self icc];
  v6 = [v5 freehandDrawingToolkit];
  v7 = [v6 toolkitUIState];
  [v7 setCurrentToolOpacity:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v8 = [WeakRetained pencilKitCanvasView];
  [(CRLFreehandDrawingToolStroke *)self updatePencilKitToolIfAppropriateFor:v8];
}

- (id)p_currentColorWithOpacity
{
  v3 = [(CRLFreehandDrawingTool *)self icc];
  v4 = [v3 freehandDrawingToolkit];
  v5 = [v4 colorForCurrentTool];
  [(CRLFreehandDrawingToolStroke *)self opacity];
  v6 = [v5 colorWithAlphaComponent:];

  return v6;
}

- (unint64_t)type
{
  return self->_toolType;
}

- (BOOL)shouldCommandsEnqueueInRealTime
{
  v3 = [(CRLFreehandDrawingTool *)self icc];
  self->_isEnqueueingCommandsInRealTime = [v3 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime];

  return self->_isEnqueueingCommandsInRealTime;
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRLFreehandDrawingToolStroke;
  [(CRLFreehandDrawingToolAbstractPathInsertion *)&v28 performActionWithInputPoint:v8 isInitialPoint:v6 isFinalPoint:v5];
  id v9 = [(CRLFreehandDrawingTool *)self icc];
  v10 = [v9 canvasView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  id v12 = [WeakRetained pencilKitCanvasView];

  v13 = [v12 _tiledView];
  v14 = [v13 canvasView];

  v15 = [v10 unscaledCoordinateSpace];
  if (v6)
  {
    id v16 = objc_alloc_init((Class)PKDrawing);
    [v12 setDrawing:v16];

    v25 = v10;
    if (v8) {
      [v8 PKInputPoint];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    [v14 _replayDrawingBegan:v27 coordinateSpace:v15 activeInputProperties:[v8 activeInputProperties] inputType:[v8 PKInputType]];
    v17 = +[CRLBezierPath bezierPath];
    [v8 unscaledPoint];
    [v17 moveToPoint:];
    [v8 unscaledPoint];
    double v19 = v18 + 0.1;
    [v8 unscaledPoint];
    [v17 lineToPoint:v19];
    v20 = +[NSSet set];
    [v9 i_beginSuppressingLayerUpdatesExceptForReps:v20];

    v21 = [CRLPencilKitInkStroke alloc];
    v22 = [(CRLFreehandDrawingToolStroke *)self p_currentPKInkType];
    v23 = [(CRLFreehandDrawingToolStroke *)self p_currentColorWithOpacity];
    [(CRLFreehandDrawingToolStroke *)self unscaledWidth];
    v24 = -[CRLPencilKitInkStroke initWithInkType:color:unadjustedPencilKitWidth:](v21, "initWithInkType:color:unadjustedPencilKitWidth:", v22, v23);

    [(CRLFreehandDrawingToolAbstractPathInsertion *)self openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:v17 stroke:v24 fill:0];
    v10 = v25;
  }
  else if (([v8 wasAddedByTouchesEnded] & 1) == 0)
  {
    if (v8) {
      [v8 PKInputPoint];
    }
    else {
      memset(v26, 0, sizeof(v26));
    }
    [v14 _replayDrawingMoved:v26 coordinateSpace:v15];
    [(CRLFreehandDrawingToolStroke *)self p_enqueueRealTimeCommandsForPathUpdateIfNeeded];
  }
}

- (void)p_enqueueRealTimeCommandsForPathUpdateIfNeeded
{
  if (self->_isEnqueueingCommandsInRealTime)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
    v4 = [WeakRetained pencilKitCanvasView];
    BOOL v5 = [v4 _tiledView];
    BOOL v6 = [v5 canvasView];

    v7 = [v6 currentStroke];
    id v8 = [v7 path];
    id v9 = (char *)[v8 _immutablePointsCount];

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5660);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AB648();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5680);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 193, 0, "invalid nil value for '%{public}s'", "currentPKStroke");
      goto LABEL_78;
    }
    v10 = [v7 path];
    id v11 = [v10 count];

    if ((unint64_t)v11 < 2 || v9 == 0) {
      goto LABEL_79;
    }
    lastPKStrokeSetInRealTime = self->_lastPKStrokeSetInRealTime;
    if (lastPKStrokeSetInRealTime)
    {
      if ([lastPKStrokeSetInRealTime isEqual:v7]) {
        goto LABEL_79;
      }
    }
    v14 = [(CRLFreehandDrawingTool *)self icc];
    v15 = [v14 commandController];
    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F56A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AB6E0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F56C0);
      }
      v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v27);
      }
      v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]");
      v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v20, 204, 0, "invalid nil value for '%{public}s'", "cc");
      goto LABEL_77;
    }
    id v16 = (objc_class *)objc_opt_class();
    v17 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
    uint64_t v18 = sub_10024715C(v16, v17);

    uint64_t v19 = [v14 layoutForInfo:v18];
    v20 = (void *)v19;
    v69 = (void *)v18;
    if (!v19)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F56E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AB778();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5700);
      }
      objc_super v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v28);
      }
      v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]");
      v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v23, 211, 0, "invalid nil value for '%{public}s'", "shapeLayout");
      v25 = (void *)v18;
      goto LABEL_76;
    }
    v68 = (void *)v19;
    v21 = +[CRLPKStrokeConverter pathFromPKStroke:v7 startingAtPointIndex:0 endingAtPointIndex:v9 - 1 pencilKitStrokePathData:0];
    if ([v21 isEmpty])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5720);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AB810();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5740);
      }
      v22 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v22);
      }
      v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]");
      v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 226, 0, "CRLPKStrokeConverter returned an empty path ending at pointIndex: %lu.", v9 - 1);
      v25 = v69;
LABEL_75:

      v20 = v68;
LABEL_76:

LABEL_77:
LABEL_78:

LABEL_79:
      return;
    }
    [v21 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    uint64_t v65 = +[CRLBezierPathSource pathSourceWithBezierPath:v21];
    v37 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v18 pathSource:v65];
    [(CRLCommand *)v37 setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:0];
    [v15 enqueueCommand:v37];
    v38 = [v7 mask];
    v63 = v38;
    v64 = v37;
    if (v38)
    {
      v39 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v38 CGPath]);
      [v68 transformInRoot];
      CGAffineTransformInvert(&v71, &v70);
      [v39 transformUsingAffineTransform:&v71];
    }
    else
    {
      v39 = 0;
    }
    v66 = v21;
    currentStrokePathData = self->_currentStrokePathData;
    if (currentStrokePathData) {
      v41 = [(CRLPKStrokePathCompactData *)currentStrokePathData pointCount];
    }
    else {
      v41 = 0;
    }
    v42 = v69;
    v67 = v39;
    if (v41 >= v9)
    {
      if (v41 != v9)
      {
        int v61 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5760);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AB8A8(v61);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5780);
        }
        v46 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v46);
        }
        v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]");
        v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 274, 0, "expected equality between %{public}s and %{public}s", "currentStrokePathDataCount", "immutablePKPointCount");

        v62 = 0;
        v42 = v69;
        v39 = v67;
        goto LABEL_70;
      }
    }
    else
    {
      v43 = +[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:](CRLPKStrokePathConverter, "strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:", v7);
      v44 = v43;
      if (self->_currentStrokePathData)
      {
        +[CRLPKStrokePathCompactData strokePathCompactDataFrom:](CRLPKStrokePathCompactData, "strokePathCompactDataFrom:");
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        [v45 appendStrokePathCompactData:v44];
      }
      else
      {
        id v45 = v43;
      }

      if (v45)
      {
        v49 = (CRLPKStrokePathCompactData *)v45;
        v47 = self->_currentStrokePathData;
        v62 = v49;
        self->_currentStrokePathData = v49;
LABEL_70:

LABEL_72:
        [v7 crl_anchorPointForTexture];
        [(CRLPKStrokePathCompactData *)self->_currentStrokePathData setAnchorPointForTexture:sub_100064680(v50, v51, v30)];
        v52 = [[_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData alloc] initWithFreehandDrawingShapeItem:v42 strokePathCompactData:self->_currentStrokePathData maskPath:v39];
        [(CRLCommand *)v52 setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:0];
        [v15 enqueueCommand:v52];
        v53 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v30, v32, v34, v36);
        v54 = [CRLCanvasInfoGeometry alloc];
        v55 = [v68 parent];
        uint64_t v56 = [v55 geometryInRoot];
        v57 = [(CRLCanvasInfoGeometry *)v54 initWithLayoutGeometry:v56];
        v58 = [(CRLCanvasInfoGeometry *)v53 geometryRelativeToGeometry:v57];

        v25 = v69;
        v59 = [v69 geometry];
        LOBYTE(v56) = [v59 isEqual:v58];

        if ((v56 & 1) == 0)
        {
          v60 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v69 geometry:v58];
          [(CRLCommand *)v60 setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:0];
          [v15 enqueueCommand:v60];
        }
        v23 = (void *)v65;
        v21 = v66;
        v24 = v64;
        goto LABEL_75;
      }
    }
    v62 = 0;
    goto LABEL_72;
  }
}

- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingToolStroke;
  [(CRLFreehandDrawingTool *)&v10 estimatedPropertiesUpdatedOnInputPoint:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  BOOL v6 = [WeakRetained pencilKitCanvasView];
  v7 = [v6 _tiledView];
  id v8 = [v7 canvasView];
  if (v4) {
    [v4 PKInputPoint];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  [v8 _replayEstimatedPropertiesUpdated:v9];
}

- (void)p_endDrawingAndCaptureFinalStroke:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  BOOL v6 = [WeakRetained pencilKitCanvasView];

  v7 = [v6 _tiledView];
  id v8 = [v7 canvasView];

  if (v3)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1003C6D94;
    v24 = sub_1003C6DA4;
    id v25 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_1003C6D94;
    uint64_t v18 = sub_1003C6DA4;
    id v19 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003C6DAC;
    v10[3] = &unk_1014F57A8;
    id v12 = &v20;
    v13 = &v14;
    id v9 = dispatch_semaphore_create(0);
    id v11 = v9;
    [v8 _replayDrawingEndedEstimatesTimeout:v10 withBackgroundQueueCompletion:0.0];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&self->_finalPKStroke, (id)v21[5]);
    objc_storeStrong((id *)&self->_finalPKShapeStrokes, (id)v15[5]);

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    [v8 _replayDrawingCancelled];
  }
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  v85.receiver = self;
  v85.super_class = (Class)CRLFreehandDrawingToolStroke;
  id v4 = (id)[(CRLFreehandDrawingTool *)&v85 finalizeAndResetWithSuccess:a3];
  BOOL v5 = [(CRLFreehandDrawingTool *)self icc];
  BOOL v6 = [v5 commandController];
  [(CRLFreehandDrawingToolStroke *)self p_endDrawingAndCaptureFinalStroke:v4];
  if (self->_finalPKStroke) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }
  [v5 i_endSuppressingLayerUpdates];
  id v8 = +[NSMutableArray array];
  v76 = v5;
  if (v7 == 1)
  {
    v73 = v6;
    id v9 = (objc_class *)objc_opt_class();
    objc_super v10 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
    id v11 = [v10 parentInfo];
    uint64_t v12 = sub_10024715C(v9, v11);

    if (!v12)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F57C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AB968();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F57E8);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke finalizeAndResetWithSuccess:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 391, 0, "invalid nil value for '%{public}s'", "parentFreehandItem");
    }
    v72 = (void *)v12;
    uint64_t v16 = [v5 layoutForInfo:v12];
    v17 = [CRLCanvasInfoGeometry alloc];
    CGAffineTransform v71 = v16;
    uint64_t v18 = [v16 geometryInRoot];
    id v19 = [(CRLCanvasInfoGeometry *)v17 initWithLayoutGeometry:v18];

    uint64_t v20 = [(CRLFreehandDrawingTool *)self icc];
    v21 = [v20 editingCoordinator];
    uint64_t v22 = [v21 boardItemFactory];

    if ([self->_finalPKStroke _isMaskedStroke])
    {
      id v23 = objc_alloc((Class)PKDrawing);
      finalPKStroke = self->_finalPKStroke;
      v24 = +[NSArray arrayWithObjects:&finalPKStroke count:1];
      id v25 = [v23 initWithStrokes:v24];

      [v25 _clipMaskedStrokes];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      v26 = [v25 strokes];
      id v27 = [v26 countByEnumeratingWithState:&v81 objects:v87 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v82;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v82 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v81 + 1) + 8 * i);
            [(CRLFreehandDrawingToolStroke *)self unscaledWidth];
            double v32 = [v22 makeShapeItemsForFreehandDrawingWithPKStroke:v31];
            [v8 addObjectsFromArray:v32];
          }
          id v28 = [v26 countByEnumeratingWithState:&v81 objects:v87 count:16];
        }
        while (v28);
      }
    }
    else
    {
      double v34 = self->_finalPKStroke;
      [(CRLFreehandDrawingToolStroke *)self unscaledWidth];
      [v22 makeShapeItemsForFreehandDrawingWithPKStroke:v34];
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      [v8 addObjectsFromArray:v25];
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v74 = v8;
    id v35 = v8;
    id v36 = [v35 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v78;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v78 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
          v41 = [v40 geometry];
          v42 = [v41 geometryRelativeToGeometry:v19];
          [v40 setGeometry:v42];
        }
        id v37 = [v35 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v37);
    }

    if ([v35 count] == (id)1)
    {
      v43 = (objc_class *)objc_opt_class();
      v44 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
      double v33 = sub_10024715C(v43, v44);

      id v45 = [v35 firstObject];
      v46 = [v33 commandsToUpdateModelToMatch:v45];
      [v73 enqueueCommand:v46];

      uint64_t v7 = 1;
      v47 = v72;
    }
    else
    {
      uint64_t v7 = 1;
      v47 = v72;
      if ((unint64_t)[v35 count] < 2)
      {
        double v33 = 0;
      }
      else
      {
        v48 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v72 boardItems:v35];
        [v73 enqueueCommand:v48];

        v49 = [_TtC8Freeform26CRLCommandDeleteBoardItems alloc];
        double v50 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
        double v51 = +[NSSet setWithObject:v50];
        v52 = [(CRLCommandDeleteBoardItems *)v49 initWithBoardItemsToDelete:v51 canDeleteNewlyCreatedItems:1];
        [v73 enqueueCommand:v52];

        v47 = v72;
        double v33 = [v35 firstObject];
      }
    }

    BOOL v6 = v73;
    id v8 = v74;
  }
  else
  {
    double v33 = 0;
  }
  [(CRLFreehandDrawingToolAbstractPathInsertion *)self finalizeAndResetAbstractPathInsertionToolWithSuccess:v7];
  if (self->_finalPKShapeStrokes) {
    BOOL v53 = v33 == 0;
  }
  else {
    BOOL v53 = 1;
  }
  if (!v53)
  {
    [v6 openGroup];
    v54 = [CRLFreehandDrawingSnapToShapeHelper alloc];
    v55 = [(CRLFreehandDrawingTool *)self icc];
    uint64_t v56 = [(CRLFreehandDrawingSnapToShapeHelper *)v54 initWithInteractiveCanvasController:v55];

    v57 = [(CRLFreehandDrawingSnapToShapeHelper *)v56 commandForSnappingShapeItem:v33 toStrokesInUnscaledSpace:self->_finalPKShapeStrokes outCreatedAndModifiedShapes:0];
    [v6 enqueueCommand:v57];
    if ((unint64_t)[v8 count] >= 2)
    {
      v58 = [v8 subarrayWithRange:1, (char *)[v8 count] - 1];
      v59 = [_TtC8Freeform26CRLCommandDeleteBoardItems alloc];
      +[NSSet setWithArray:v58];
      v75 = v8;
      int v61 = v60 = v6;
      v62 = [(CRLCommandDeleteBoardItems *)v59 initWithBoardItemsToDelete:v61];
      [v60 enqueueCommand:v62];

      BOOL v6 = v60;
      id v8 = v75;
    }
    [v6 closeGroup];
  }
  id v63 = objc_alloc_init((Class)PKDrawing);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  uint64_t v65 = [WeakRetained pencilKitCanvasView];
  [v65 setDrawing:v63];

  self->_isEnqueueingCommandsInRealTime = 0;
  lastPKStrokeSetInRealTime = self->_lastPKStrokeSetInRealTime;
  self->_lastPKStrokeSetInRealTime = 0;

  v67 = self->_finalPKStroke;
  self->_finalPKStroke = 0;

  finalPKShapeStrokes = self->_finalPKShapeStrokes;
  self->_finalPKShapeStrokes = 0;

  currentStrokePathData = self->_currentStrokePathData;
  self->_currentStrokePathData = 0;

  return v7;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4 = a3;
  id v9 = [(CRLFreehandDrawingToolStroke *)self p_currentPKInkType];
  id v5 = objc_alloc((Class)PKInkingTool);
  BOOL v6 = [(CRLFreehandDrawingToolStroke *)self p_currentColorWithOpacity];
  uint64_t v7 = [v6 UIColor];
  [(CRLFreehandDrawingToolStroke *)self unscaledWidth];
  id v8 = [v5 initWithInkType:v9 color:v7 width:];

  [v4 setTool:v8];
}

- (id)p_currentPKInkType
{
  BOOL v3 = PKInkTypePen;
  p_toolType = &self->_toolType;
  switch(*p_toolType)
  {
    case 0uLL:
      id v5 = (id *)&PKInkTypeMonoline;
      goto LABEL_17;
    case 1uLL:
      break;
    case 2uLL:
      id v5 = (id *)&PKInkTypePencil;
      goto LABEL_17;
    case 3uLL:
      id v5 = (id *)&PKInkTypeCrayon;
      goto LABEL_17;
    case 4uLL:
      id v5 = (id *)&PKInkTypeWatercolor;
      goto LABEL_17;
    case 5uLL:
      id v5 = (id *)&PKInkTypeFountainPen;
      goto LABEL_17;
    case 6uLL:
      id v5 = (id *)&PKInkTypeMarker;
LABEL_17:
      objc_super v10 = (NSString *)*v5;

      BOOL v3 = v10;
      break;
    default:
      int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5808);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ABA00((uint64_t)p_toolType, v6);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5828);
      }
      uint64_t v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_currentPKInkType]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 499, 0, "Unexpected tool type for rendering with PencilKit (%zu). Defaulting to pen ink.", *p_toolType);

      break;
  }

  return v3;
}

- (double)opacity
{
  return self->_opacity;
}

- (double)unscaledWidth
{
  return self->_unscaledWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStrokePathData, 0);
  objc_storeStrong((id *)&self->_finalPKShapeStrokes, 0);
  objc_storeStrong((id *)&self->_finalPKStroke, 0);
  objc_storeStrong((id *)&self->_lastPKStrokeSetInRealTime, 0);

  objc_destroyWeak((id *)&self->_pencilKitCanvasViewController);
}

@end