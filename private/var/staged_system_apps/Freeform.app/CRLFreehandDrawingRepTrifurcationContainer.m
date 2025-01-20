@interface CRLFreehandDrawingRepTrifurcationContainer
- (CGAffineTransform)transformForMiddleRenderable:(SEL)a3;
- (CRLCanvasRenderable)backRenderable;
- (CRLCanvasRenderable)frontRenderable;
- (CRLCanvasRenderable)middleRenderable;
- (CRLFreehandDrawingRepTrifurcationContainer)initWithDelegate:(id)a3 backReps:(id)a4 middleReps:(id)a5 frontReps:(id)a6;
- (NSArray)backReps;
- (NSArray)frontReps;
- (NSArray)middleReps;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)p_createRenderable;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)p_captureInitialGeometry;
- (void)tearDown;
@end

@implementation CRLFreehandDrawingRepTrifurcationContainer

- (CRLFreehandDrawingRepTrifurcationContainer)initWithDelegate:(id)a3 backReps:(id)a4 middleReps:(id)a5 frontReps:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)CRLFreehandDrawingRepTrifurcationContainer;
  v14 = [(CRLFreehandDrawingRepTrifurcationContainer *)&v35 init];
  if (v14)
  {
    id v34 = v11;
    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD248);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082DF4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD268);
      }
      v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]");
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 156, 0, "invalid nil value for '%{public}s'", "delegate");

      id v11 = v34;
    }
    objc_storeWeak((id *)&v14->_delegate, v10);
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD288);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082D60();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD2A8);
      }
      v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v18);
      }
      v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]");
      v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 159, 0, "invalid nil value for '%{public}s'", "backReps");

      id v11 = v34;
    }
    objc_storeStrong((id *)&v14->_backReps, a4);
    if (!v12)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD2C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082CCC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD2E8);
      }
      id v11 = v34;
      v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v21);
      }
      v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]");
      v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 161, 0, "invalid nil value for '%{public}s'", "middleReps");
    }
    objc_storeStrong((id *)&v14->_middleReps, a5);
    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD308);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082C38();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD328);
      }
      v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v24);
      }
      v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]");
      v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 163, 0, "invalid nil value for '%{public}s'", "frontReps");

      id v11 = v34;
    }
    objc_storeStrong((id *)&v14->_frontReps, a6);
    v14->_freehandDrawingInitialUnscaledCanvasFrameOrigin = CGPointZero;
    uint64_t v27 = [(CRLFreehandDrawingRepTrifurcationContainer *)v14 p_createRenderable];
    backRenderable = v14->_backRenderable;
    v14->_backRenderable = (CRLCanvasRenderable *)v27;

    uint64_t v29 = [(CRLFreehandDrawingRepTrifurcationContainer *)v14 p_createRenderable];
    middleRenderable = v14->_middleRenderable;
    v14->_middleRenderable = (CRLCanvasRenderable *)v29;

    uint64_t v31 = [(CRLFreehandDrawingRepTrifurcationContainer *)v14 p_createRenderable];
    frontRenderable = v14->_frontRenderable;
    v14->_frontRenderable = (CRLCanvasRenderable *)v31;

    [(CRLFreehandDrawingRepTrifurcationContainer *)v14 p_captureInitialGeometry];
  }

  return v14;
}

- (id)p_createRenderable
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (objc_class *)[WeakRetained layerClassForTrifurcationContainer:self];

  id v6 = objc_alloc_init(v5);
  [v6 setDrawsAsynchronously:1];
  v7 = +[CRLCanvasRenderable renderableFromLayer:v6];
  [v7 setDelegate:self];
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  [v8 canvasContentsScaleForTrifurcationContainer:self];
  [v7 setContentsScale:];

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  [v9 clipRectInScaledCanvasForTrifurcationContainer:self];

  [v7 setBounds:sub_100064070()];
  double y = CGPointZero.y;
  [v7 setPosition:CGPointZero.x, y];
  [v7 setAnchorPoint:CGPointZero.x, y];
  [v7 setNeedsDisplay];

  return v7;
}

- (void)p_captureInitialGeometry
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD348);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101082E88();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD368);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer p_captureInitialGeometry]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 202, 0, "invalid nil value for '%{public}s'", "_delegate");
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 freehandDrawingUnscaledCanvasFrameOriginForTrifurcationContainer:self];
    self->_freehandDrawingInitialUnscaledCanvasFrameOrigin.x = v10;
    self->_freehandDrawingInitialUnscaledCanvasFrameOrigin.double y = v11;

    if ([(NSArray *)self->_middleReps count])
    {
      id v12 = [(NSArray *)self->_middleReps objectAtIndexedSubscript:0];
      id v13 = [v12 shapeLayout];
      anchorShapeLayoutForTransform = self->_anchorShapeLayoutForTransform;
      self->_anchorShapeLayoutForTransform = v13;

      v15 = [(CRLCanvasAbstractLayout *)self->_anchorShapeLayoutForTransform geometryInRoot];
      anchorShapeLayoutGeometryInRootAtRenderTime = self->_anchorShapeLayoutGeometryInRootAtRenderTime;
      self->_anchorShapeLayoutGeometryInRootAtRenderTime = v15;
    }
  }
}

- (void)tearDown
{
  objc_storeWeak((id *)&self->_delegate, 0);
  backReps = self->_backReps;
  self->_backReps = (NSArray *)&__NSArray0__struct;

  middleReps = self->_middleReps;
  self->_middleReps = (NSArray *)&__NSArray0__struct;

  frontReps = self->_frontReps;
  self->_frontReps = (NSArray *)&__NSArray0__struct;

  backRenderable = self->_backRenderable;
  self->_backRenderable = 0;

  middleRenderable = self->_middleRenderable;
  self->_middleRenderable = 0;

  frontRenderable = self->_frontRenderable;
  self->_frontRenderable = 0;

  anchorShapeLayoutForTransform = self->_anchorShapeLayoutForTransform;
  self->_anchorShapeLayoutForTransform = 0;

  anchorShapeLayoutGeometryInRootAtRenderTime = self->_anchorShapeLayoutGeometryInRootAtRenderTime;
  self->_anchorShapeLayoutGeometryInRootAtRenderTime = 0;
}

- (CGAffineTransform)transformForMiddleRenderable:(SEL)a3
{
  BOOL v4 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD388);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083044();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD3A8);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    CGFloat v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:]");
    CGFloat v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 231, 0, "invalid nil value for '%{public}s'", "_delegate");
  }
  id v12 = objc_loadWeakRetained((id *)p_delegate);

  if (!v12)
  {
    long long v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v19;
    *(_OWORD *)&retstr->double tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    return result;
  }
  double tx = CGAffineTransformIdentity.tx;
  tdouble y = CGAffineTransformIdentity.ty;
  if (v4)
  {
    if (self->_anchorShapeLayoutForTransform)
    {
      anchorShapeLayoutGeometryInRootAtRenderTime = self->_anchorShapeLayoutGeometryInRootAtRenderTime;
      if (anchorShapeLayoutGeometryInRootAtRenderTime)
      {
        [(CRLCanvasLayoutGeometry *)anchorShapeLayoutGeometryInRootAtRenderTime transform];
        CGAffineTransformInvert(&t1, &v40);
        v17 = [(CRLCanvasAbstractLayout *)self->_anchorShapeLayoutForTransform geometryInRoot];
        v18 = v17;
        if (v17) {
          [v17 transform];
        }
        else {
          memset(&t2, 0, sizeof(t2));
        }
        CGAffineTransformConcat(&v42, &t1, &t2);
        double tx = v42.tx;
        tdouble y = v42.ty;
LABEL_39:

        goto LABEL_40;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD3C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082FB0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD3E8);
      }
      v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:]");
      v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 249, 0, "expected nil value for '%{public}s'", "_anchorShapeLayoutForTransform");
    }
    if (self->_anchorShapeLayoutGeometryInRootAtRenderTime)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD408);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082F1C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD428);
      }
      v23 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v23);
      }
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:]");
      v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v24, 250, 0, "expected nil value for '%{public}s'", "_anchorShapeLayoutGeometryInRootAtRenderTime");

      goto LABEL_39;
    }
  }
LABEL_40:
  double v25 = sub_100064698(tx, ty, self->_freehandDrawingInitialUnscaledCanvasFrameOrigin.x);
  double v27 = v26;
  id v28 = objc_loadWeakRetained((id *)p_delegate);
  [v28 canvasViewScaleForTrifurcationContainer:self];
  double v30 = v29;

  double v31 = sub_1000646A4(v25, v27, v30);
  double v33 = v32;
  id v34 = objc_loadWeakRetained((id *)p_delegate);
  [v34 parentScaledCanvasFrameOriginForTrifurcationContainer:self];
  double v36 = v35;

  double v37 = sub_100064680(v31, v33, v36);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->double tx = 0u;
  return CGAffineTransformMakeTranslation(retstr, v37, v38);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6 = a3;
  id v7 = [(CRLCanvasRenderable *)self->_backRenderable layer];

  if (v7 == v6)
  {
    uint64_t v10 = 48;
  }
  else
  {
    id v8 = [(CRLCanvasRenderable *)self->_middleRenderable layer];

    if (v8 == v6)
    {
      uint64_t v10 = 56;
    }
    else
    {
      id v9 = [(CRLCanvasRenderable *)self->_frontRenderable layer];

      if (v9 != v6) {
        goto LABEL_19;
      }
      uint64_t v10 = 64;
    }
  }
  id v11 = *(id *)((char *)&self->super.isa + v10);
  if (v11)
  {
    id v12 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD488);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101083190();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD4A8);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer drawLayer:inContext:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 286, 0, "invalid nil value for '%{public}s'", "_delegate");
    }
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 drawShapeReps:v12 intoContext:a4 forLayer:v6 inTrifurcationContainer:self];
    goto LABEL_28;
  }
LABEL_19:
  int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DD448);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010830D8((uint64_t)v6, v18);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DD468);
  }
  long long v19 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v19);
  }
  id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer drawLayer:inContext:]");
  v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
  +[CRLAssertionHandler handleFailureInFunction:v12, v17, 282, 0, "Should not ask to draw unknown layer (%@).", v6 file lineNumber isFatal description];
LABEL_28:
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (NSArray)backReps
{
  return self->_backReps;
}

- (NSArray)middleReps
{
  return self->_middleReps;
}

- (NSArray)frontReps
{
  return self->_frontReps;
}

- (CRLCanvasRenderable)backRenderable
{
  return self->_backRenderable;
}

- (CRLCanvasRenderable)middleRenderable
{
  return self->_middleRenderable;
}

- (CRLCanvasRenderable)frontRenderable
{
  return self->_frontRenderable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontRenderable, 0);
  objc_storeStrong((id *)&self->_middleRenderable, 0);
  objc_storeStrong((id *)&self->_backRenderable, 0);
  objc_storeStrong((id *)&self->_frontReps, 0);
  objc_storeStrong((id *)&self->_middleReps, 0);
  objc_storeStrong((id *)&self->_backReps, 0);
  objc_storeStrong((id *)&self->_anchorShapeLayoutGeometryInRootAtRenderTime, 0);
  objc_storeStrong((id *)&self->_anchorShapeLayoutForTransform, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end