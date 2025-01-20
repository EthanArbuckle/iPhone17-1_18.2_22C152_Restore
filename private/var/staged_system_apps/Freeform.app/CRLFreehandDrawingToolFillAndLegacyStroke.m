@interface CRLFreehandDrawingToolFillAndLegacyStroke
+ (id)p_copyOfBezierPath:(id)a3 clippedToRect:(CGRect)a4 startsOutside:(BOOL *)a5 endsOutside:(BOOL *)a6;
+ (void)p_appendPath:(id)a3 fromStartPercent:(double)a4 toEndPercent:(double)a5 toPath:(id)a6;
- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3;
- (BOOL)p_floodFillIfPossibleAtPoint:(CGPoint)a3;
- (BOOL)p_isFillTool;
- (BOOL)shouldCommandsEnqueueInRealTime;
- (CRLFreehandDrawingToolFillAndLegacyStroke)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 insertionToolType:(unint64_t)a5 opacity:(double)a6 unscaledWidth:(double)a7;
- (NSArray)decoratorOverlayRenderables;
- (NSSet)drawingReps;
- (double)actualOpacityValueForOutlineFills;
- (double)opacity;
- (double)unscaledWidth;
- (id)p_bezierPathBySnappingOutlineFillBezierPathToShape:(id)a3;
- (id)p_currentColorWithOpacity;
- (id)p_currentStroke;
- (id)p_dashedOutlineFillRenderable;
- (id)p_snappedOutlineFillRenderable;
- (unint64_t)type;
- (void)doWorkBeforeCanvasLayout;
- (void)p_updateDottedPathOpacityForCurrentSnapState;
- (void)p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded;
- (void)p_updatePathForDashedOutlineFillRenderable;
- (void)p_updatePathForSnappedOutlineFillRenderable;
- (void)p_updatePathsFromPathCreatorWithCommitBehavior:(unint64_t)a3;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
- (void)setOpacity:(double)a3;
- (void)setUnscaledWidth:(double)a3;
- (void)shapeGestureCancelledOnShapeDrawingTimerHelper:(id)a3;
- (void)shapeGestureDetectedOnShapeDrawingTimerHelper:(id)a3;
- (void)updatePencilKitToolIfAppropriateFor:(id)a3;
@end

@implementation CRLFreehandDrawingToolFillAndLegacyStroke

- (CRLFreehandDrawingToolFillAndLegacyStroke)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 insertionToolType:(unint64_t)a5 opacity:(double)a6 unscaledWidth:(double)a7
{
  id v12 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  v13 = [(CRLFreehandDrawingTool *)&v29 initWithInteractiveCanvasController:a3];
  if (v13)
  {
    if (a5 >= 8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFCC0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101087748();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFCE0);
      }
      v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v21);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:insertionToolType:opacity:unscaledWidth:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
      v17 = "Path insertion tool only knows how to be a monoline, pen, pencil, crayon, watercolor, fountainPen, marker, or fill tool.";
      v18 = v15;
      v19 = v16;
      uint64_t v20 = 141;
    }
    else
    {
      if (a5 != 7 || a7 == 0.0) {
        goto LABEL_24;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFD00);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010876C0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFD20);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:insertionToolType:opacity:unscaledWidth:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
      v17 = "Fill tool can't have a width.";
      v18 = v15;
      v19 = v16;
      uint64_t v20 = 142;
    }
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:v20 isFatal:0 description:v17];

LABEL_24:
    objc_storeWeak((id *)&v13->_pencilKitCanvasViewController, v12);
    v13->_toolType = a5;
    v13->_opacity = a6;
    v13->_unscaledWidth = a7;
    v13->_initialUnscaledPoint = (CGPoint)xmmword_101175160;
    v13->_currentUnscaledPoint = (CGPoint)xmmword_101175160;
    v13->_initialActionTime = 0.0;
    v13->_currentActionTime = 0.0;
    uint64_t v22 = +[CRLBezierPath bezierPath];
    fullCommittedPath = v13->_fullCommittedPath;
    v13->_fullCommittedPath = (CRLBezierPath *)v22;

    uint64_t v24 = +[CRLBezierPath bezierPath];
    uncommittedPath = v13->_uncommittedPath;
    v13->_uncommittedPath = (CRLBezierPath *)v24;

    v26 = (PKShapeDrawingTimerHelper *)[objc_alloc((Class)PKShapeDrawingTimerHelper) initWithDelegate:v13];
    shapeDrawingTimerHelper = v13->_shapeDrawingTimerHelper;
    v13->_shapeDrawingTimerHelper = v26;
  }
  return v13;
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
  v84.receiver = self;
  v84.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  [(CRLFreehandDrawingToolAbstractPathInsertion *)&v84 performActionWithInputPoint:v8 isInitialPoint:v6 isFinalPoint:v5];
  [v8 unscaledPoint];
  self->_currentUnscaledPoint.x = v9;
  self->_currentUnscaledPoint.y = v10;
  [v8 time];
  self->_currentActionTime = v11;
  if (v6)
  {
    [v8 unscaledPoint];
    self->_initialUnscaledPoint.x = v12;
    self->_initialUnscaledPoint.y = v13;
    [v8 time];
    self->_initialActionTime = v14;
    v15 = [(CRLFreehandDrawingTool *)self icc];
    v16 = objc_alloc_init(CRLFreehandDrawingPathCreator);
    pathCreator = self->_pathCreator;
    self->_pathCreator = v16;

    v18 = self->_pathCreator;
    [v15 viewScale];
    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](v18, "beginDrawingWithViewScale:inputType:", [v8 inputType], v19);
    uint64_t v20 = self->_pathCreator;
    [v8 unscaledPoint];
    double v22 = v21;
    double v24 = v23;
    [v8 time];
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v20, "drawToPoint:atTime:predicted:", [v8 isPredicted], v22, v24, v25);
    [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathsFromPathCreatorWithCommitBehavior:0];
    if ([(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool])
    {
      v26 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_currentColorWithOpacity];
      v27 = +[CRLColorFill colorWithColor:v26];

      [(CRLFreehandDrawingPathCreator *)self->_pathCreator setMinimumLengthForFinalCreatedPath:0.100000001];
      v28 = [(CRLFreehandDrawingTool *)self icc];
      [v28 addDecorator:self];

      if (([v8 isPredicted] & 1) == 0)
      {
        objc_super v29 = [v15 canvasView];
        v30 = [v29 unscaledCoordinateSpace];
        [v8 unscaledPoint];
        double v32 = v31;
        double v34 = v33;
        v35 = [v15 canvasView];
        v36 = [v35 window];
        v37 = [v36 coordinateSpace];
        [v30 convertPoint:v37 toCoordinateSpace:v32];
        double v39 = v38;
        double v41 = v40;

        -[PKShapeDrawingTimerHelper beginStrokeAtPoint:](self->_shapeDrawingTimerHelper, "beginStrokeAtPoint:", v39, v41);
      }
      id v42 = 0;
    }
    else
    {
      v65 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_currentStroke];
      id v42 = [v65 copy];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v42 width];
        v67 = self->_pathCreator;
      }
      else
      {
        v67 = self->_pathCreator;
        double v66 = 0.100000001;
      }
      [(CRLFreehandDrawingPathCreator *)v67 setMinimumLengthForFinalCreatedPath:v66];
      v27 = 0;
    }
    [(CRLFreehandDrawingToolAbstractPathInsertion *)self openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:self->_uncommittedPath stroke:v42 fill:v27];

    goto LABEL_29;
  }
  if (([v8 wasAddedByTouchesEnded] & 1) == 0)
  {
    v43 = self->_pathCreator;
    [v8 unscaledPoint];
    double v45 = v44;
    double v47 = v46;
    [v8 time];
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v43, "drawToPoint:atTime:predicted:", [v8 isPredicted], v45, v47, v48);
  }
  if ([(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool]
    && ([v8 isPredicted] & 1) == 0)
  {
    v49 = [(CRLFreehandDrawingTool *)self icc];
    v50 = [v49 canvasView];
    v51 = [v50 unscaledCoordinateSpace];
    [v8 unscaledPoint];
    double v53 = v52;
    double v55 = v54;
    v56 = [(CRLFreehandDrawingTool *)self icc];
    v57 = [v56 canvasView];
    v58 = [v57 window];
    v59 = [v58 coordinateSpace];
    [v51 convertPoint:v59 toCoordinateSpace:v53];
    double v61 = v60;
    double v63 = v62;

    shapeDrawingTimerHelper = self->_shapeDrawingTimerHelper;
    if (v8) {
      [v8 PKInputPoint];
    }
    else {
      memset(v83, 0, sizeof(v83));
    }
    -[PKShapeDrawingTimerHelper addStrokePoint:inputPoint:](shapeDrawingTimerHelper, "addStrokePoint:inputPoint:", v83, v61, v63);
    if ([v8 inputType] == (id)2)
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v68 = [(CRLFreehandDrawingTool *)self icc];
      uint64_t v69 = [v68 freehandDrawingToolkit];
      v70 = (void *)v69;
      if (v8)
      {
        [v8 PKInputPoint];
        if (v70)
        {
LABEL_21:
          [v70 inputPointInPKCanvasViewFromUnscaledSpace:v74];
LABEL_24:

          v71 = [(CRLFreehandDrawingTool *)self icc];
          v72 = [v71 freehandDrawingToolkit];
          v73[4] = v79;
          v73[5] = v80;
          v73[6] = v81;
          v73[7] = v82;
          v73[0] = v75;
          v73[1] = v76;
          v73[2] = v77;
          v73[3] = v78;
          [v72 updatePencilShadowWithInputPoint:v73];

          goto LABEL_25;
        }
      }
      else
      {
        memset(v74, 0, sizeof(v74));
        if (v69) {
          goto LABEL_21;
        }
      }
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      goto LABEL_24;
    }
  }
LABEL_25:
  if (v5)
  {
    [(CRLFreehandDrawingPathCreator *)self->_pathCreator endDrawing];
    [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathsFromPathCreatorWithCommitBehavior:2];
  }
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded];
  if ([(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool])
  {
    v15 = [(CRLFreehandDrawingTool *)self icc];
    [v15 invalidateLayersForDecorator:self];
LABEL_29:
  }
}

- (void)doWorkBeforeCanvasLayout
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  [(CRLFreehandDrawingTool *)&v3 doWorkBeforeCanvasLayout];
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathForDashedOutlineFillRenderable];
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathForSnappedOutlineFillRenderable];
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updateDottedPathOpacityForCurrentSnapState];
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  v78.receiver = self;
  v78.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  unsigned int v4 = [(CRLFreehandDrawingTool *)&v78 finalizeAndResetWithSuccess:a3];
  BOOL v5 = [(CRLFreehandDrawingTool *)self icc];
  BOOL v6 = [v5 editingCoordinator];
  v7 = [v6 commandController];

  id v8 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
  if (objc_msgSend(v5, "i_currentlySuppressingLayerUpdates")) {
    [v5 i_endSuppressingLayerUpdates];
  }
  if ([(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool])
  {
    [v5 removeDecorator:self];
    [(PKShapeDrawingTimerHelper *)self->_shapeDrawingTimerHelper teardown];
  }
  CGFloat v9 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  CGFloat v10 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  double v11 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  if (![(CRLBezierPath *)self->_fullCommittedPath containsElementsOtherThanMoveAndClose])goto LABEL_16; {
  CGFloat v12 = self->_fullCommittedPath;
  }
  unsigned int v73 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool];
  unsigned int v74 = v4;
  if (!v73)
  {
    if (v4) {
      goto LABEL_12;
    }

LABEL_16:
    [(CRLFreehandDrawingToolAbstractPathInsertion *)self finalizeAndResetAbstractPathInsertionToolWithSuccess:0];
    CGFloat v12 = 0;
    LOBYTE(v38) = 0;
    goto LABEL_29;
  }
  if (self->_currentActionTime - self->_initialActionTime <= 0.25)
  {
    double v13 = sub_1000653B4(self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y, self->_currentUnscaledPoint.x, self->_currentUnscaledPoint.y);
    [v5 viewScale];
    if (v13 * v14 <= 10.0)
    {
      v43 = [_TtC8Freeform26CRLCommandDeleteBoardItems alloc];
      [(CRLFreehandDrawingToolAbstractPathInsertion *)self initialFreehandDrawingItem];
      v45 = double v44 = v8;
      double v46 = +[NSSet setWithObject:v45];
      double v47 = [(CRLCommandDeleteBoardItems *)v43 initWithBoardItemsToDelete:v46 canDeleteNewlyCreatedItems:1];

      id v8 = v44;
      CGFloat v9 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
      [v7 enqueueCommand:v47];
      if (v74) {
        uint64_t v38 = -[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:](self, "p_floodFillIfPossibleAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y);
      }
      else {
        uint64_t v38 = 0;
      }

      [(CRLFreehandDrawingToolAbstractPathInsertion *)self finalizeAndResetAbstractPathInsertionToolWithSuccess:v38];
      CGFloat v12 = 0;
      goto LABEL_28;
    }
  }
  [(CRLBezierPath *)v12 closePath];
  v15 = [v5 freehandDrawingToolkit];
  [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
  v17 = v16 = v8;
  v18 = [v17 id];
  [v15 enqueueAnimationForObjectUUID:v18 animation:@"CRLFreehandDrawingToolkitAnimationNameOutlineFill"];

  CGFloat v9 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  CGFloat v10 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;

  id v8 = v16;
  double v11 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  if (v74)
  {
LABEL_12:
    if (v12)
    {
      [(CRLBezierPath *)v12 bounds];
      double v20 = v19;
      double v22 = v21;
      [v7 openGroup];
      double v23 = +[CRLBezierPathSource pathSourceWithBezierPath:v12];
      v70 = v8;
      double v24 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
      double v25 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
      v68 = v23;
      uint64_t v69 = [(CRLCommandSetPathSource *)v24 initWithShapeItem:v25 pathSource:v23];

      [v7 enqueueCommand:v69];
      v26 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
      v27 = [v5 layoutsForInfo:v26];
      v67 = [v27 anyObject];

      v28 = [CRLCanvasInfoGeometry alloc];
      objc_super v29 = [v23 bezierPath];
      [v29 bounds];
      uint64_t v38 = [(CRLCanvasInfoGeometry *)v28 initWithPosition:v20 size:v22];

      v30 = [CRLCanvasInfoGeometry alloc];
      double v31 = [v67 parent];
      [v31 geometryInRoot];
      double v32 = v71 = v7;
      double v33 = [(CRLCanvasInfoGeometry *)v30 initWithLayoutGeometry:v32];
      double v34 = [(id)v38 geometryRelativeToGeometry:v33];

      CGFloat v9 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
      v35 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
      v36 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
      v37 = [(CRLCommandSetInfoGeometry *)v35 initWithBoardItem:v36 geometry:v34];

      v7 = v71;
      [v71 enqueueCommand:v37];
      [v71 closeGroup];

      double v11 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
      id v8 = v70;

      LOBYTE(v38) = 1;
      [(CRLFreehandDrawingToolAbstractPathInsertion *)self finalizeAndResetAbstractPathInsertionToolWithSuccess:1];
      if ((v73 & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      LOBYTE(v38) = 1;
      [(CRLFreehandDrawingToolAbstractPathInsertion *)self finalizeAndResetAbstractPathInsertionToolWithSuccess:1];
      if (!v73) {
        goto LABEL_29;
      }
    }
    goto LABEL_18;
  }

  [(CRLFreehandDrawingToolAbstractPathInsertion *)self finalizeAndResetAbstractPathInsertionToolWithSuccess:0];
  CGFloat v12 = 0;
LABEL_18:
  double v39 = *(Class *)((char *)&self->super.super.super.isa + v9[142]);
  if (v39)
  {
    id v40 = [v39 copy];
    memset(&v77, 0, sizeof(v77));
    double v41 = [v8 parentItem];
    id v42 = v41;
    v72 = v7;
    if (v41) {
      [v41 transformInRoot];
    }
    else {
      memset(&v76, 0, sizeof(v76));
    }
    CGAffineTransformInvert(&v77, &v76);

    CGAffineTransform v75 = v77;
    [v40 transformUsingAffineTransform:&v75];
    uint64_t v38 = [v40 visuallyDistinctSubregions];
    double v48 = [CRLFreehandDrawingSnapToShapeHelper alloc];
    v49 = [(CRLFreehandDrawingTool *)self icc];
    v50 = [(CRLFreehandDrawingSnapToShapeHelper *)v48 initWithInteractiveCanvasController:v49];

    v51 = (objc_class *)objc_opt_class();
    double v52 = sub_10024715C(v51, v8);
    [(CRLFreehandDrawingSnapToShapeHelper *)v50 commandForSnappingShapeItem:v52 toPathsInParentSpace:v38 outCreatedAndModifiedShapes:0];
    v54 = double v53 = v8;

    v7 = v72;
    [v72 enqueueCommand:v54];

    id v8 = v53;
    LOBYTE(v38) = v74;
    CGFloat v9 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
LABEL_28:
    CGFloat v10 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
    double v11 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
    goto LABEL_29;
  }
  LOBYTE(v38) = v74;
LABEL_29:
  self->_isEnqueueingCommandsInRealTime = 0;
  pathCreator = self->_pathCreator;
  self->_pathCreator = 0;

  self->_initialUnscaledPoint = (CGPoint)xmmword_101175160;
  self->_currentUnscaledPoint = (CGPoint)xmmword_101175160;
  *(Class *)((char *)&self->super.super.super.isa + v11[135]) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v10[136]) = 0;
  v56 = +[CRLBezierPath bezierPath];
  fullCommittedPath = self->_fullCommittedPath;
  self->_fullCommittedPath = v56;

  subpathToCommit = self->_subpathToCommit;
  self->_subpathToCommit = 0;

  v59 = +[CRLBezierPath bezierPath];
  uncommittedPath = self->_uncommittedPath;
  self->_uncommittedPath = v59;

  self->_fullCommittedPathEndsOutsideSpacerShape = 0;
  self->_uncommittedPathBeginsOutsideSpacerShape = 0;
  dashedOutlineFillRenderable = self->_dashedOutlineFillRenderable;
  self->_dashedOutlineFillRenderable = 0;

  dynamicFillPath = self->_dynamicFillPath;
  self->_dynamicFillPath = 0;

  uint64_t v63 = v9[142];
  v64 = *(Class *)((char *)&self->super.super.super.isa + v63);
  *(Class *)((char *)&self->super.super.super.isa + v63) = 0;

  snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
  self->_snappedOutlineFillRenderable = 0;

  return v38;
}

- (unint64_t)type
{
  return self->_toolType;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)PKInkingTool);
  BOOL v6 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_currentColorWithOpacity];
  v7 = [v6 UIColor];
  id v8 = [v5 initWithInkType:PKInkTypePen color:v7];

  [v4 setTool:v8];
}

- (void)setUnscaledWidth:(double)a3
{
  if (self->_toolType == 7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFD40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010877D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFD60);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke setUnscaledWidth:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:411 isFatal:0 description:"Fill tool can't have a width"];
  }
  self->_unscaledWidth = a3;
  id v8 = [(CRLFreehandDrawingTool *)self icc];
  CGFloat v9 = [v8 freehandDrawingToolkit];
  CGFloat v10 = [v9 toolkitUIState];
  [v10 setCurrentToolWidth:a3];
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
  id v6 = [(CRLFreehandDrawingTool *)self icc];
  id v4 = [v6 freehandDrawingToolkit];
  id v5 = [v4 toolkitUIState];
  [v5 setCurrentToolOpacity:a3];
}

- (NSSet)drawingReps
{
  objc_super v3 = +[NSSet set];
  id v4 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
  if ([(CRLFreehandDrawingTool *)self isPerformingActions] && v4)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(CRLFreehandDrawingTool *)self icc];
    v7 = [v6 repForInfo:v4];
    id v8 = sub_1002469D0(v5, v7);

    if (v8 && objc_msgSend(v8, "i_isCurrentlyBeingFreehandDrawn"))
    {
      uint64_t v9 = +[NSSet setWithObject:v8];

      objc_super v3 = (void *)v9;
    }
  }

  return (NSSet *)v3;
}

- (double)actualOpacityValueForOutlineFills
{
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self opacity];
  if (v3 <= 0.0) {
    return 0.100000001;
  }
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self opacity];
  double v5 = 0.100000001 / v4;

  return sub_100407E48(v5, 0.100000001, 1.0);
}

- (NSArray)decoratorOverlayRenderables
{
  if ([(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool] && self->_pathCreator)
  {
    if (!self->_dashedOutlineFillRenderable)
    {
      double v3 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_dashedOutlineFillRenderable];
      dashedOutlineFillRenderable = self->_dashedOutlineFillRenderable;
      self->_dashedOutlineFillRenderable = v3;

      [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathForDashedOutlineFillRenderable];
    }
    snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
    if (!snappedOutlineFillRenderable)
    {
      id v6 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_snappedOutlineFillRenderable];
      v7 = self->_snappedOutlineFillRenderable;
      self->_snappedOutlineFillRenderable = v6;

      [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathForSnappedOutlineFillRenderable];
      snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
    }
    v10[0] = self->_dashedOutlineFillRenderable;
    v10[1] = snappedOutlineFillRenderable;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return (NSArray *)v8;
}

- (void)shapeGestureDetectedOnShapeDrawingTimerHelper:(id)a3
{
  if (self->_dynamicFillPath)
  {
    -[CRLFreehandDrawingToolFillAndLegacyStroke p_bezierPathBySnappingOutlineFillBezierPathToShape:](self, "p_bezierPathBySnappingOutlineFillBezierPathToShape:");
    double v4 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
    dynamicSnappedFillPath = self->_dynamicSnappedFillPath;
    self->_dynamicSnappedFillPath = v4;

    id v9 = [(CRLFreehandDrawingTool *)self icc];
    [v9 invalidateLayersForDecorator:self];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFD80);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101087858();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFDA0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke shapeGestureDetectedOnShapeDrawingTimerHelper:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:474 isFatal:0 description:"_dynamicFillPath should not be nil by the time -shapeGestureDetectedOnShapeDrawingTimerHelper: is called"];
  }
}

- (void)shapeGestureCancelledOnShapeDrawingTimerHelper:(id)a3
{
  dynamicSnappedFillPath = self->_dynamicSnappedFillPath;
  self->_dynamicSnappedFillPath = 0;

  id v5 = [(CRLFreehandDrawingTool *)self icc];
  [v5 invalidateLayersForDecorator:self];
}

- (BOOL)p_isFillTool
{
  return self->_toolType == 7;
}

- (id)p_dashedOutlineFillRenderable
{
  double v3 = +[CRLCanvasShapeRenderable renderable];
  double v4 = [(CRLFreehandDrawingTool *)self icc];
  id v5 = [v4 freehandDrawingToolkit];
  id v6 = [v5 colorForCurrentTool];

  [v6 alphaComponent];
  if (v7 != 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFDC0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010878E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFDE0);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_dashedOutlineFillRenderable]");
    CGFloat v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:500 isFatal:0 description:"Colors from the toolkit should not have reduced alpha."];
  }
  [v3 setLineWidth:2.0];
  [v3 setLineDashPattern:&off_10155CB48];
  [v3 setLineJoin:kCALineJoinRound];
  [v3 setLineCap:kCALineCapRound];
  [v3 setFillColor:0];
  [v3 setStrokeColor:[v6 CGColor]];

  return v3;
}

- (void)p_updatePathForDashedOutlineFillRenderable
{
  if (self->_dashedOutlineFillRenderable)
  {
    double v3 = [(CRLFreehandDrawingTool *)self icc];
    [v3 viewScale];
    CGFloat v5 = v4;

    id v6 = [(CRLBezierPath *)self->_dynamicFillPath copy];
    CGAffineTransformMakeScale(&v8, v5, v5);
    [v6 transformUsingAffineTransform:&v8];
    id v7 = v6;
    -[CRLCanvasShapeRenderable setPath:](self->_dashedOutlineFillRenderable, "setPath:", [v7 CGPath]);
  }
}

- (id)p_snappedOutlineFillRenderable
{
  double v3 = +[CRLCanvasShapeRenderable renderable];
  double v4 = [(CRLFreehandDrawingTool *)self icc];
  CGFloat v5 = [v4 freehandDrawingToolkit];
  id v6 = [v5 colorForCurrentTool];

  [v6 alphaComponent];
  if (v7 != 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFE00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101087968();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFE20);
    }
    CGAffineTransform v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_snappedOutlineFillRenderable]");
    CGFloat v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:526 isFatal:0 description:"Colors from the toolkit should not have reduced alpha."];
  }
  [v3 setLineWidth:2.0];
  [v3 setLineJoin:kCALineJoinRound];
  [v3 setLineCap:kCALineCapRound];
  [v3 setFillColor:0];
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  return v3;
}

- (void)p_updatePathForSnappedOutlineFillRenderable
{
  snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
  if (snappedOutlineFillRenderable)
  {
    if (self->_dynamicSnappedFillPath)
    {
      double v4 = [(CRLFreehandDrawingTool *)self icc];
      [v4 viewScale];
      CGFloat v6 = v5;

      id v7 = [(CRLBezierPath *)self->_dynamicSnappedFillPath copy];
      CGAffineTransformMakeScale(&v9, v6, v6);
      [v7 transformUsingAffineTransform:&v9];
      id v8 = v7;
      -[CRLCanvasShapeRenderable setPath:](self->_snappedOutlineFillRenderable, "setPath:", [v8 CGPath]);
    }
    else
    {
      [(CRLCanvasShapeRenderable *)snappedOutlineFillRenderable setPath:0];
    }
  }
}

- (void)p_updateDottedPathOpacityForCurrentSnapState
{
  double v3 = [(CRLFreehandDrawingTool *)self icc];
  double v4 = [v3 freehandDrawingToolkit];
  double v5 = [v4 colorForCurrentTool];

  [v5 alphaComponent];
  if (v6 != 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFE40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010879F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFE60);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDottedPathOpacityForCurrentSnapState]");
    CGAffineTransform v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:553 isFatal:0 description:"Colors from the toolkit should not have reduced alpha."];
  }
  if (self->_dynamicSnappedFillPath)
  {
    CGFloat v10 = [v5 colorWithAlphaComponent:0.25];
    -[CRLCanvasShapeRenderable setStrokeColor:](self->_dashedOutlineFillRenderable, "setStrokeColor:", [v10 CGColor]);
  }
  else
  {
    -[CRLCanvasShapeRenderable setStrokeColor:](self->_dashedOutlineFillRenderable, "setStrokeColor:", [v5 CGColor]);
  }
}

- (id)p_bezierPathBySnappingOutlineFillBezierPathToShape:(id)a3
{
  id v4 = a3;
  double v5 = [CRLFreehandDrawingSnapToShapeHelper alloc];
  double v6 = [(CRLFreehandDrawingTool *)self icc];
  id v7 = [(CRLFreehandDrawingSnapToShapeHelper *)v5 initWithInteractiveCanvasController:v6];

  id v8 = [(CRLFreehandDrawingSnapToShapeHelper *)v7 bezierPathsBySnappingOutlineFillBezierPath:v4];

  if (v8 && [v8 count])
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v9 = +[CRLBezierPath uniteBezierPaths:v8];
LABEL_7:
      CGFloat v10 = (void *)v9;
      goto LABEL_9;
    }
    if ([v8 count] == (id)1)
    {
      uint64_t v9 = [v8 objectAtIndexedSubscript:0];
      goto LABEL_7;
    }
  }
  CGFloat v10 = 0;
LABEL_9:

  return v10;
}

- (void)p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded
{
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_updatePathsFromPathCreatorWithCommitBehavior:1];
  id v3 = [(CRLBezierPath *)self->_fullCommittedPath copy];
  id v4 = v3;
  BOOL v5 = !self->_fullCommittedPathEndsOutsideSpacerShape && !self->_uncommittedPathBeginsOutsideSpacerShape;
  [v3 appendBezierPath:self->_uncommittedPath skippingInitialMoveIfPossible:v5];
  if ([v4 containsElementsOtherThanMoveAndClose])
  {
    double v6 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
    if (v6)
    {
      id v7 = [(CRLFreehandDrawingTool *)self icc];
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = [v7 repForInfo:v6];
      CGFloat v10 = sub_10024715C(v8, v9);

      if (v10)
      {
        if ((objc_msgSend(v7, "i_currentlySuppressingLayerUpdates") & 1) == 0
          && (![(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool]
           || self->_dashedOutlineFillRenderable))
        {
          double v11 = [v7 renderableForRep:v10];

          if (v11)
          {
            CGFloat v12 = +[NSMutableSet setWithObject:v10];
            uint64_t v13 = [v10 parentRep];
            if (v13)
            {
              double v14 = (void *)v13;
              do
              {
                [v12 addObject:v14];
                uint64_t v15 = [v14 parentRep];

                double v14 = (void *)v15;
              }
              while (v15);
            }
            [v7 i_beginSuppressingLayerUpdatesExceptForReps:v12];
          }
        }
        id v16 = v4;
        id v17 = v16;
        if ([(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_isFillTool])
        {
          id v17 = [v16 copy];

          [v17 closePath];
          v18 = (CRLBezierPath *)[v17 copy];
          dynamicFillPath = self->_dynamicFillPath;
          self->_dynamicFillPath = v18;
        }
        [v16 bounds];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        v28 = +[CRLBezierPathSource pathSourceWithBezierPath:v17];
        [v10 dynamicallySetBezierPathSource:v28 atUnscaledOrigin:0 withCommittedPointRange:-[CRLBezierPath elementCount](self->_fullCommittedPath, "elementCount") v21, v23];
        if (self->_isEnqueueingCommandsInRealTime)
        {
          uint64_t v29 = [v7 commandController];
          v50 = (void *)v29;
          v51 = v28;
          if (v29)
          {
            v30 = (void *)v29;
            double v31 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v6 pathSource:v28];
            [(CRLCommand *)v31 setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:0];
            double v48 = v31;
            [v30 enqueueCommand:v31];
            v49 = v6;
            double v32 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v21, v23, v25, v27);
            double v33 = [CRLCanvasInfoGeometry alloc];
            double v34 = [v10 layout];
            v35 = [v34 parent];
            v36 = [v35 geometryInRoot];
            v37 = [(CRLCanvasInfoGeometry *)v33 initWithLayoutGeometry:v36];
            uint64_t v38 = [(CRLCanvasInfoGeometry *)v32 geometryRelativeToGeometry:v37];

            double v6 = v49;
            double v39 = v50;
            id v40 = [v49 geometry];
            LOBYTE(v37) = [v40 isEqual:v38];

            if ((v37 & 1) == 0)
            {
              double v41 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v49 geometry:v38];
              [(CRLCommand *)v41 setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:0];
              [v50 enqueueCommand:v41];
            }
          }
          else
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DFF00);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101087BA0();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DFF20);
            }
            double v44 = v6;
            double v45 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v45);
            }
            double v46 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded]");
            double v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 642, 0, "invalid nil value for '%{public}s'", "cc");

            double v6 = v44;
            double v39 = 0;
          }

          v28 = v51;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DFEC0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101087B0C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DFEE0);
        }
        v43 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v43);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded]");
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v28, 600, 0, "invalid nil value for '%{public}s'", "shapeRep");
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFE80);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101087A78();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFEA0);
      }
      id v42 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v42);
      }
      id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded]");
      CGFloat v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v10, 593, 0, "invalid nil value for '%{public}s'", "shapeInfo");
    }
  }
}

+ (void)p_appendPath:(id)a3 fromStartPercent:(double)a4 toEndPercent:(double)a5 toPath:(id)a6
{
  double v13 = 0.0;
  double v14 = 0.0;
  id v9 = a6;
  id v10 = a3;
  id v11 = [v10 elementPercentage:&v14 forOverallPercentage:a4];
  id v12 = [v10 elementPercentage:&v13 forOverallPercentage:a5];
  [v9 appendBezierPath:v10 fromSegment:v11 t:v12 toSegment:0 t:v14 withoutMove:v13];
}

+ (id)p_copyOfBezierPath:(id)a3 clippedToRect:(CGRect)a4 startsOutside:(BOOL *)a5 endsOutside:(BOOL *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  *a5 = 0;
  *a6 = 0;
  if (![v13 containsElementsOtherThanMoveAndClose]) {
    goto LABEL_3;
  }
  [v13 bounds];
  v63.origin.CGFloat x = v14;
  v63.origin.CGFloat y = v15;
  v63.size.CGFloat width = v16;
  v63.size.CGFloat height = v17;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  if (!CGRectContainsRect(v62, v63))
  {
    double v19 = +[CRLBezierPath bezierPath];
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = 0;
    uint64_t v54 = 0;
    double v55 = &v54;
    uint64_t v56 = 0x2020000000;
    char v57 = 0;
    uint64_t v50 = 0;
    v51 = (double *)&v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v49[3] = 0;
    double v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = sub_1001D3AFC;
    v36 = &unk_1014DFF48;
    CGFloat v43 = x;
    CGFloat v44 = y;
    CGFloat v45 = width;
    CGFloat v46 = height;
    double v39 = &v54;
    id v40 = &v50;
    double v41 = v49;
    id v47 = a1;
    id v20 = v13;
    id v37 = v20;
    id v18 = v19;
    id v38 = v18;
    id v42 = v58;
    double v48 = a5;
    [v20 iterateOverPathWithPointDistancePerIteration:&v33 usingBlock:1.0];
    char v21 = *((unsigned char *)v55 + 24);
    if (v21)
    {
      double v22 = v51[3];
      if (v22 == 1.0 || fabs(v22 + -1.0) < 0.000000999999997)
      {
        char v21 = 1;
      }
      else
      {
        [a1 p_appendPath:v20 fromStartPercent:v18 toEndPercent:v22 toPath:1.0 v33 v34 v35 v36 v37];
        char v21 = *((unsigned char *)v55 + 24);
      }
    }
    *a6 = v21 ^ 1;
    if (objc_msgSend(v18, "isEmpty", v33, v34, v35, v36))
    {
      BOOL v23 = 0;
    }
    else
    {
      [v18 bounds];
      BOOL v23 = CGSizeZero.height == v25 && CGSizeZero.width == v24;
    }
    if (([v18 containsElementsOtherThanMoveAndClose] ^ 1 | v23) == 1)
    {
      if (v23 && [v18 containsElementsOtherThanMoveAndClose])
      {
        int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DFF68);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101087C34();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DFF88);
        }
        double v27 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          v28 = +[CRLAssertionHandler packedBacktraceString];
          sub_10106CDAC(v28, buf, v26, (os_log_t)v27);
        }

        uint64_t v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingToolFillAndLegacyStroke p_copyOfBezierPath:clippedToRect:startsOutside:endsOutside:]");
        v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
        +[CRLAssertionHandler handleFailureInFunction:v29 file:v30 lineNumber:734 isFatal:0 description:"Clipping produced a zero-sized path"];
      }
      *a5 = 1;
      *a6 = 1;
      uint64_t v31 = +[CRLBezierPath bezierPath];

      id v18 = (id)v31;
    }

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(v58, 8);
  }
  else
  {
LABEL_3:
    id v18 = [v13 copy];
  }

  return v18;
}

- (void)p_updatePathsFromPathCreatorWithCommitBehavior:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2
      || [(CRLFreehandDrawingPathCreator *)self->_pathCreator pointCountAvailableToCommit] >= 5)
    {
      BOOL v5 = [(CRLFreehandDrawingPathCreator *)self->_pathCreator commitAllAvailablePoints];
      subpathToCommit = self->_subpathToCommit;
      self->_subpathToCommit = v5;
    }
    else
    {
      subpathToCommit = self->_subpathToCommit;
      self->_subpathToCommit = 0;
    }
  }
  id v7 = [(CRLFreehandDrawingPathCreator *)self->_pathCreator copyOfUncommittedPath];
  uncommittedPath = self->_uncommittedPath;
  self->_uncommittedPath = v7;

  if (a3)
  {
    if (self->_subpathToCommit)
    {
      -[CRLBezierPath appendBezierPath:skippingInitialMoveIfPossible:](self->_fullCommittedPath, "appendBezierPath:skippingInitialMoveIfPossible:");
      self->_fullCommittedPathEndsOutsideSpacerShape = 0;
    }
  }
}

- (BOOL)p_floodFillIfPossibleAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLFreehandDrawingTool *)self icc];
  [v6 visibleUnscaledRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v15 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self shapeItem];
  v171 = v6;
  [v6 layoutIfNeeded];
  v175 = self;
  CGFloat v16 = -[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", x, y);
  CGFloat v17 = +[NSMutableArray array];
  id v195 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  v169 = v16;
  id v18 = [v16 reverseObjectEnumerator];
  p_vtable = CRLiOSImageHUDSlider.vtable;
  id v20 = &off_1014C1000;
  v181 = v15;
  v194 = v17;
  id v170 = [v18 countByEnumeratingWithState:&v221 objects:v240 count:16];
  if (!v170)
  {
    v180 = 0;
    id v83 = 0;
    goto LABEL_96;
  }
  v180 = 0;
  uint64_t v172 = *(void *)v222;
  v168 = v18;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v222 != v172) {
        objc_enumerationMutation(v18);
      }
      uint64_t v177 = v21;
      double v22 = *(void **)(*((void *)&v221 + 1) + 8 * v21);
      [v22 frameForCullingInRoot];
      v242.origin.double x = v8;
      v242.origin.double y = v10;
      v242.size.CGFloat width = v12;
      v242.size.CGFloat height = v14;
      if (!CGRectIntersectsRect(v241, v242)) {
        goto LABEL_91;
      }
      long long v219 = 0u;
      long long v220 = 0u;
      long long v217 = 0u;
      long long v218 = 0u;
      BOOL v23 = [v22 freehandInfo];
      double v24 = [v23 childInfos];
      double v25 = [v24 reverseObjectEnumerator];

      id obj = v25;
      id v188 = [v25 countByEnumeratingWithState:&v217 objects:v239 count:16];
      if (!v188) {
        goto LABEL_90;
      }
      uint64_t v186 = *(void *)v218;
      while (2)
      {
        int v26 = 0;
        do
        {
          if (*(void *)v218 != v186) {
            objc_enumerationMutation(obj);
          }
          double v27 = *(void **)(*((void *)&v217 + 1) + 8 * (void)v26);
          v28 = (objc_class *)objc_opt_class();
          uint64_t v29 = sub_10024715C(v28, v27);
          if (v29 == v15)
          {
            unsigned int v39 = [p_vtable + 152 _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E0028);
            }
            id v40 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v230 = v39;
              __int16 v231 = 2082;
              v232 = "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]";
              __int16 v233 = 2082;
              v234 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m";
              __int16 v235 = 1024;
              int v236 = 859;
              _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The failed outline fill shouldn't still be hanging around here. It was deleted.", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E0048);
            }
            double v41 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              objc_super v84 = v29;
              v85 = v41;
              v86 = [p_vtable + 152 packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v230 = v39;
              __int16 v231 = 2114;
              v232 = v86;
              _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              uint64_t v29 = v84;
            }
            uint64_t v34 = -[__objc2_class stringWithUTF8String:](v20[107], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]");
            id v42 = [(__objc2_class *)v20[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
            [p_vtable + 152 handleFailureInFunction:v34 file:v42 lineNumber:859 isFatal:0 description:"The failed outline fill shouldn't still be hanging around here. It was deleted."];
            goto LABEL_88;
          }
          uint64_t v30 = objc_opt_class();
          uint64_t v31 = [v22 layoutController];
          [v31 layoutForInfo:v29];
          v33 = double v32 = v29;
          uint64_t v34 = sub_1002469D0(v30, v33);

          v192 = v26;
          if (!v34)
          {
            v184 = v32;
            unsigned int v43 = [p_vtable + 152 _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DFFA8);
            }
            CGFloat v44 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v230 = v43;
              __int16 v231 = 2082;
              v232 = "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]";
              __int16 v233 = 2082;
              v234 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m";
              __int16 v235 = 1024;
              int v236 = 796;
              __int16 v237 = 2082;
              v238 = "shapeLayout";
              _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DFFC8);
            }
            CGFloat v45 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v87 = v45;
              v88 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v230 = v43;
              __int16 v231 = 2114;
              v232 = v88;
              _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
            }
            -[__objc2_class stringWithUTF8String:](v20[107], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]");
            id v42 = (id)objc_claimAutoreleasedReturnValue();
            id v46 = [(__objc2_class *)v20[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
            [p_vtable + 152 handleFailureInFunction:v42 file:v46 lineNumber:796 isFatal:0 description:@"invalid nil value for '%{public}s'", "shapeLayout"];
            goto LABEL_59;
          }
          v35 = [v34 path];
          id v190 = [v35 copy];

          uint64_t v36 = [v32 fill];
          if (v36)
          {
            id v37 = (void *)v36;
            id v38 = [v32 fill];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
            }
            else
            {
              id v47 = [v32 fill];
              unsigned int v48 = [v47 isClear];

              p_vtable = CRLiOSImageHUDSlider.vtable;
              if (!v48)
              {
                int v66 = 1;
                goto LABEL_62;
              }
            }
          }
          v49 = [v34 maskPath];

          if (v49)
          {
            v184 = v32;
            id v46 = objc_alloc_init((Class)NSMutableArray);
            uint64_t v50 = [v34 pencilKitStrokes];
            long long v213 = 0u;
            long long v214 = 0u;
            long long v215 = 0u;
            long long v216 = 0u;
            id v51 = [v50 countByEnumeratingWithState:&v213 objects:v228 count:16];
            if (v51)
            {
              id v52 = v51;
              uint64_t v53 = *(void *)v214;
              do
              {
                for (i = 0; i != v52; i = (char *)i + 1)
                {
                  if (*(void *)v214 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  double v55 = *(void **)(*((void *)&v213 + 1) + 8 * i);
                  uint64_t v56 = [v55 maskedPathRanges];

                  if (v56)
                  {
                    char v57 = +[PKStroke crl_strokePathsExcludingNonMaskedPathRangesForPKStroke:v55];
                    [v46 addObjectsFromArray:v57];
                  }
                }
                id v52 = [v50 countByEnumeratingWithState:&v213 objects:v228 count:16];
              }
              while (v52);
            }
            if ([v46 count])
            {
              long long v211 = 0u;
              long long v212 = 0u;
              long long v209 = 0u;
              long long v210 = 0u;
              id v58 = v46;
              id v59 = [v58 countByEnumeratingWithState:&v209 objects:v227 count:16];
              if (v59)
              {
                id v60 = v59;
                uint64_t v61 = *(void *)v210;
                do
                {
                  for (j = 0; j != v60; j = (char *)j + 1)
                  {
                    if (*(void *)v210 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    CGRect v63 = +[CRLPKStrokePathConverter pathFromPKStrokePath:*(void *)(*((void *)&v209 + 1) + 8 * (void)j) pencilKitStrokePathData:0];
                    v64 = [v34 pureGeometryInRoot];
                    v65 = v64;
                    if (v64) {
                      [v64 transform];
                    }
                    else {
                      memset(v208, 0, sizeof(v208));
                    }
                    [v63 transformUsingAffineTransform:v208];

                    [v194 insertObject:v63 atIndex:0];
                    [v195 setObject:v22 forKey:v63];
                  }
                  id v60 = [v58 countByEnumeratingWithState:&v209 objects:v227 count:16];
                }
                while (v60);
              }

              CGFloat v15 = v181;
            }

            id v20 = &off_1014C1000;
            p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
            id v42 = v190;
LABEL_59:

            int v26 = v192;
            uint64_t v29 = v184;
            goto LABEL_88;
          }
          int v66 = 0;
LABEL_62:
          if (!v190)
          {
            unsigned int v67 = [p_vtable + 152 _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DFFE8);
            }
            v68 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v230 = v67;
              __int16 v231 = 2082;
              v232 = "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]";
              __int16 v233 = 2082;
              v234 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m";
              __int16 v235 = 1024;
              int v236 = 825;
              __int16 v237 = 2082;
              v238 = "shapePathInUnscaledSpace";
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }

            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E0008);
            }
            uint64_t v69 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
            {
              v89 = [p_vtable + 152 packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v230 = v67;
              __int16 v231 = 2114;
              v232 = v89;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v69, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
            }

            v70 = p_vtable + 152;
            v71 = -[__objc2_class stringWithUTF8String:](v20[107], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]");
            v72 = [(__objc2_class *)v20[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
            [v70 handleFailureInFunction:v71 file:v72 lineNumber:825 isFatal:0 description:@"invalid nil value for '%{public}s'", "shapePathInUnscaledSpace"];

            p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
          }
          unsigned int v73 = [v34 pureGeometryInRoot];
          unsigned int v74 = v73;
          if (v73) {
            [v73 transform];
          }
          else {
            memset(v207, 0, sizeof(v207));
          }
          [v190 transformUsingAffineTransform:v207];

          uint64_t v75 = [v34 stroke];
          double v76 = 0.0;
          if (!v75)
          {
            uint64_t v29 = v32;
            id v42 = v190;
            goto LABEL_82;
          }
          CGAffineTransform v77 = (void *)v75;
          objc_super v78 = [v34 stroke];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            uint64_t v29 = v32;
            id v42 = v190;
          }
          else
          {
            long long v79 = [v34 stroke];
            unsigned __int8 v80 = [v79 isNullStroke];

            p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
            uint64_t v29 = v32;
            id v42 = v190;
            if (v80) {
              goto LABEL_82;
            }
            CGAffineTransform v77 = [v34 stroke];
            [v77 width];
            double v76 = v81;
          }

LABEL_82:
          [v42 setLineWidth:v76];
          if (v66 && objc_msgSend(v42, "containsPoint:", x, y))
          {
            long long v82 = [v42 pathByNormalizingClosedPathToRemoveSelfIntersections];

            id v83 = v29;
            id v42 = v82;

            v180 = v42;
          }
          else
          {
            id v83 = 0;
          }
          [v194 insertObject:v42 atIndex:0];
          [v195 setObject:v22 forKey:v42];
          if (v83)
          {

            id v18 = v168;
            CGFloat v17 = v194;
            goto LABEL_96;
          }
          int v26 = v192;
LABEL_88:

          int v26 = (char *)v26 + 1;
        }
        while (v26 != v188);
        id v188 = [obj countByEnumeratingWithState:&v217 objects:v239 count:16];
        if (v188) {
          continue;
        }
        break;
      }
LABEL_90:

      id v18 = v168;
LABEL_91:
      uint64_t v21 = v177 + 1;
      CGFloat v17 = v194;
    }
    while ((id)(v177 + 1) != v170);
    id v83 = 0;
    id v170 = [v18 countByEnumeratingWithState:&v221 objects:v240 count:16];
  }
  while (v170);
LABEL_96:

  id WeakRetained = objc_loadWeakRetained((id *)&v175->_pencilKitCanvasViewController);
  v91 = [WeakRetained rulerEdgePathInUnscaledSpaceForTopOfRuler:1];

  if (v91) {
    [v17 addObject:v91];
  }
  id v92 = objc_loadWeakRetained((id *)&v175->_pencilKitCanvasViewController);
  uint64_t v93 = [v92 rulerEdgePathInUnscaledSpaceForTopOfRuler:0];

  if (v93) {
    [v17 addObject:v93];
  }
  v189 = (void *)v93;
  v94 = +[NSArray array];
  id v206 = v94;
  uint64_t v95 = +[CRLFreehandDrawingFloodFillHelper fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:](CRLFreehandDrawingFloodFillHelper, "fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:", v17, &v206, x, y, 5.0);
  id v96 = v206;

  v193 = (void *)v95;
  if (v95)
  {
    v187 = v91;
    v97 = v20;
    v98 = +[NSMutableSet set];
    long long v202 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    id obja = v96;
    id v99 = v96;
    id v100 = [v99 countByEnumeratingWithState:&v202 objects:v226 count:16];
    if (v100)
    {
      id v101 = v100;
      uint64_t v102 = *(void *)v203;
      do
      {
        for (k = 0; k != v101; k = (char *)k + 1)
        {
          if (*(void *)v203 != v102) {
            objc_enumerationMutation(v99);
          }
          v104 = [v195 objectForKeyedSubscript:*(void *)(*((void *)&v202 + 1) + 8 * (void)k)];
          if (v104) {
            [v98 addObject:v104];
          }
        }
        id v101 = [v99 countByEnumeratingWithState:&v202 objects:v226 count:16];
      }
      while (v101);
    }

    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    id v105 = v169;
    id v106 = [v105 countByEnumeratingWithState:&v198 objects:v225 count:16];
    if (v106)
    {
      id v107 = v106;
      uint64_t v108 = *(void *)v199;
LABEL_112:
      uint64_t v109 = 0;
      while (1)
      {
        if (*(void *)v199 != v108) {
          objc_enumerationMutation(v105);
        }
        v110 = *(void **)(*((void *)&v198 + 1) + 8 * v109);
        if ([v98 containsObject:v110]) {
          break;
        }
        if (v107 == (id)++v109)
        {
          id v107 = [v105 countByEnumeratingWithState:&v198 objects:v225 count:16];
          if (v107) {
            goto LABEL_112;
          }
          goto LABEL_118;
        }
      }
      id v112 = v110;

      v111 = v97;
      if (v112) {
        goto LABEL_129;
      }
    }
    else
    {
LABEL_118:

      v111 = v97;
    }
    [p_vtable + 152 _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0068);
    }
    v113 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_ERROR)) {
      sub_101087DF0();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0088);
    }
    v114 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v114, OS_LOG_TYPE_ERROR)) {
      sub_101087CBC();
    }

    v115 = -[__objc2_class stringWithUTF8String:](v111[107], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]");
    v116 = [(__objc2_class *)v111[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
    [p_vtable + 152 handleFailureInFunction:v115 file:v116 lineNumber:907 isFatal:0 description:"Unable to find correct drawing to fill. Falling back to the bottom drawing."];

    id v112 = [v105 objectAtIndexedSubscript:0];
LABEL_129:
    id v117 = v193;
    v118 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)v175 p_currentColorWithOpacity];
    uint64_t v185 = +[CRLColorFill colorWithColor:v118];

    id v178 = [v112 maxFilledShapeIndex];
    v119 = v112;
    v191 = v83;
    if (v83)
    {
      v120 = v180;
      id v174 = v112;
      if (!v180)
      {
        [p_vtable + 152 _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E00A8);
        }
        v121 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v121, OS_LOG_TYPE_ERROR)) {
          sub_101087D5C();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E00C8);
        }
        v122 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v122, OS_LOG_TYPE_ERROR)) {
          sub_101087CBC();
        }

        v123 = -[__objc2_class stringWithUTF8String:](v111[107], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]");
        v124 = [(__objc2_class *)v111[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
        [p_vtable + 152 handleFailureInFunction:v123 file:v124 lineNumber:916 isFatal:0 description:@"invalid nil value for '%{public}s'", "hitFilledShapePathInRoot"];

        v120 = 0;
      }
      if ([v120 isVisuallyEqualToPath:v117 withThreshold:1.0])
      {

        id v117 = 0;
      }
      v125 = (objc_class *)objc_opt_class();
      v126 = [v83 fill];
      v127 = sub_10024715C(v125, v126);

      v128 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)v175 p_currentColorWithOpacity];
      v129 = +[CRLColorFill colorWithColor:v128];

      if (!v117 && v127 && v129)
      {
        v130 = [v129 color];
        v131 = [v127 color];
        v132 = [v130 colorByCompositingSourceOverDestinationColor:v131];
        v133 = +[CRLColorFill colorWithColor:v132];

        v134 = [[_TtC8Freeform17CRLCommandSetFill alloc] initWithShapeItem:v191 fill:v133];
        v135 = [v191 containingGroup];
        v136 = [v171 canvasEditor];
        v137 = [v136 selectionPathWithInfo:v135];

        v138 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v137 reverseSelectionPath:v137];
        v139 = [v171 commandController];
        [v139 enqueueCommand:v134 withSelectionBehavior:v138];

        if (([v127 isEqual:v129] & 1) == 0)
        {
          v140 = [v171 freehandDrawingToolkit];
          [v191 id];
          v142 = v141 = v134;
          [v140 enqueueAnimationForObjectUUID:v142 animation:@"CRLFreehandDrawingToolkitAnimationNameFloodFill"];

          v134 = v141;
        }

        id v117 = 0;
      }

      id v83 = v191;
      CGFloat v17 = v194;
      v119 = v174;
    }
    else
    {
      CGFloat v17 = v194;
    }
    v143 = (void *)v185;
    v91 = v187;
    if (v117)
    {
      id v144 = [v117 copy];
      v145 = [v119 geometryInRoot];
      v146 = v145;
      id v179 = v117;
      if (v145) {
        [v145 transform];
      }
      else {
        memset(&v196, 0, sizeof(v196));
      }
      CGAffineTransformInvert(&v197, &v196);
      [v144 transformUsingAffineTransform:&v197];

      [v144 bounds];
      double v148 = v147;
      double v150 = v149;
      uint64_t v151 = +[CRLBezierPathSource pathSourceWithBezierPath:v144];
      [(CRLFreehandDrawingTool *)v175 icc];
      v152 = v176 = v144;
      v153 = [v152 editingCoordinator];
      v154 = [v153 boardItemFactory];

      v173 = (void *)v151;
      v155 = [v154 makeShapeItemForFreehandDrawingWithPathSource:v151 position:0 stroke:v185 fill:0 pencilKitStrokePathCompactData:0 maskPath:v148];
      v156 = [_TtC8Freeform26CRLCommandInsertBoardItems alloc];
      v157 = [v119 freehandInfo];
      v158 = [(CRLCommandInsertBoardItems *)v156 initWithParentContainer:v157 boardItem:v155 index:v178];

      v159 = [v119 freehandInfo];
      v160 = [v171 canvasEditor];
      v161 = [v160 selectionPathWithInfo:v159];

      v162 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v161 reverseSelectionPath:v161];
      v163 = [v171 commandController];
      [v163 enqueueCommand:v158 withSelectionBehavior:v162];

      if (!v191)
      {
        v164 = [v171 freehandDrawingToolkit];
        [v155 id];
        v166 = v165 = v119;
        [v164 enqueueAnimationForObjectUUID:v166 animation:@"CRLFreehandDrawingToolkitAnimationNameFloodFill"];

        v119 = v165;
        v143 = (void *)v185;
      }
      id v83 = v191;
      v91 = v187;
      CGFloat v17 = v194;
      id v117 = v179;
    }

    CGFloat v15 = v181;
    id v96 = obja;
  }

  return v193 != 0;
}

- (id)p_currentStroke
{
  id v3 = +[CRLStroke stroke];
  unint64_t toolType = self->_toolType;
  switch(toolType)
  {
    case 3uLL:
      CGFloat v10 = [CRLBrushStroke alloc];
      double v11 = &off_1014E2960;
LABEL_7:
      CGFloat v12 = *v11;
      double v13 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_currentColorWithOpacity];
      [(CRLFreehandDrawingToolFillAndLegacyStroke *)self unscaledWidth];
      double v15 = v14;
      CGFloat v16 = +[CRLStrokePattern solidPattern];
      double v9 = [(CRLBrushStroke *)v10 initWithName:v12 color:v13 width:1 cap:0 join:v16 pattern:v15 miterLimit:1.0];

      goto LABEL_8;
    case 2uLL:
      CGFloat v10 = [CRLBrushStroke alloc];
      double v11 = &off_1014E2958;
      goto LABEL_7;
    case 0uLL:
      BOOL v5 = [(CRLFreehandDrawingToolFillAndLegacyStroke *)self p_currentColorWithOpacity];
      [(CRLFreehandDrawingToolFillAndLegacyStroke *)self unscaledWidth];
      double v7 = v6;
      CGFloat v8 = +[CRLStrokePattern solidPattern];
      double v9 = +[CRLStroke strokeWithColor:v5 width:1 cap:1 join:v8 pattern:v7];

LABEL_8:
      id v3 = v9;
      goto LABEL_18;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E00E8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101087E78();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0108);
  }
  CGFloat v17 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v17);
  }
  id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentStroke]");
  double v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"];
  +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:975 isFatal:0 description:"Shouldn't be trying to get the stroke on this tool type."];

LABEL_18:

  return v3;
}

- (id)p_currentColorWithOpacity
{
  id v3 = [(CRLFreehandDrawingTool *)self icc];
  id v4 = [v3 freehandDrawingToolkit];
  BOOL v5 = [v4 colorForCurrentTool];
  [(CRLFreehandDrawingToolFillAndLegacyStroke *)self opacity];
  double v6 = [v5 colorWithAlphaComponent:];

  return v6;
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
  objc_storeStrong((id *)&self->_snappedOutlineFillRenderable, 0);
  objc_storeStrong((id *)&self->_dynamicSnappedFillPath, 0);
  objc_storeStrong((id *)&self->_shapeDrawingTimerHelper, 0);
  objc_storeStrong((id *)&self->_dynamicFillPath, 0);
  objc_storeStrong((id *)&self->_dashedOutlineFillRenderable, 0);
  objc_storeStrong((id *)&self->_uncommittedPath, 0);
  objc_storeStrong((id *)&self->_subpathToCommit, 0);
  objc_storeStrong((id *)&self->_fullCommittedPath, 0);
  objc_storeStrong((id *)&self->_pathCreator, 0);

  objc_destroyWeak((id *)&self->_pencilKitCanvasViewController);
}

@end