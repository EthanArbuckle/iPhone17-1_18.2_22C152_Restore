@interface CRLFreehandDrawingToolPixelEraser
- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3;
- (CRLFreehandDrawingToolPixelEraser)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 scaledWidthForSlicingEraser:(double)a5;
- (double)p_unscaledEraserDiameter;
- (double)scaledWidthForSlicingEraser;
- (id)p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:(id)a3 withVisibleRulerBezierPath:(id)a4;
- (int64_t)p_breakApartFilledShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 previousZOrderOffset:(int64_t)a6;
- (int64_t)p_breakApartShape:(id)a3 withGeometry:(id)a4 subpaths:(id)a5 previousZOrderOffset:(int64_t)a6;
- (unint64_t)type;
- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3;
- (void)p_endErasingAndFinalize:(BOOL)a3;
- (void)p_enqueueCommandsToEraseWithin:(id)a3 withErasingStroke:(id)a4;
- (void)p_finalizeBitmapEraseWithStroke:(id)a3;
- (void)p_setUpForManualHitTestingFillEraseForInputPoint:(CGPoint)a3;
- (void)p_updatePathsForSlicingWithErasingStroke:(id)a3;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
- (void)setScaledWidthForSlicingEraser:(double)a3;
- (void)updatePencilKitToolIfAppropriateFor:(id)a3;
@end

@implementation CRLFreehandDrawingToolPixelEraser

- (CRLFreehandDrawingToolPixelEraser)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 scaledWidthForSlicingEraser:(double)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
  v9 = [(CRLFreehandDrawingTool *)&v12 initWithInteractiveCanvasController:a3];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_pencilKitCanvasViewController, v8);
    v10->_scaledWidthForSlicingEraser = a5;
  }

  return v10;
}

- (void)setScaledWidthForSlicingEraser:(double)a3
{
  self->_scaledWidthForSlicingEraser = a3;
  v5 = [(CRLFreehandDrawingTool *)self icc];
  id v9 = [v5 freehandDrawingToolkit];

  v6 = [v9 toolkitUIState];
  [v6 setCurrentToolWidth:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  id v8 = [WeakRetained pencilKitCanvasView];
  [(CRLFreehandDrawingToolPixelEraser *)self updatePencilKitToolIfAppropriateFor:v8];

  [v9 containedToolDidSetWidth:self];
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
  [(CRLFreehandDrawingTool *)&v29 performActionWithInputPoint:v8 isInitialPoint:v6 isFinalPoint:v5];
  id v9 = [(CRLFreehandDrawingTool *)self icc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v11 = [WeakRetained pencilKitCanvasView];

  objc_super v12 = [v11 _tiledView];
  v13 = [v12 canvasView];

  if (v6)
  {
    id v14 = objc_alloc_init((Class)PKDrawing);
    [v11 setDrawing:v14];

    if (v8) {
      [v8 PKInputPoint];
    }
    else {
      memset(v28, 0, sizeof(v28));
    }
    v15 = [v9 canvasView];
    v16 = [v15 unscaledCoordinateSpace];
    [v13 _replayDrawingBegan:v28 coordinateSpace:v16 activeInputProperties:[v8 activeInputProperties] inputType:[v8 PKInputType]];

    [v8 unscaledPoint];
    -[CRLFreehandDrawingToolPixelEraser p_setUpForManualHitTestingFillEraseForInputPoint:](self, "p_setUpForManualHitTestingFillEraseForInputPoint:");
  }
  else if (([v8 wasAddedByTouchesEnded] & 1) == 0)
  {
    if (v8)
    {
      [v8 PKInputPoint];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
    }
    v17 = [(CRLFreehandDrawingTool *)self icc];
    v18 = [v17 canvasView];
    v19 = [v18 unscaledCoordinateSpace];
    [v13 _replayDrawingMoved:&v20 coordinateSpace:v19];
  }
}

- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
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

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
  BOOL v4 = [(CRLFreehandDrawingTool *)&v9 finalizeAndResetWithSuccess:a3];
  [(CRLFreehandDrawingToolPixelEraser *)self p_endErasingAndFinalize:v4];
  id v5 = objc_alloc_init((Class)PKDrawing);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v7 = [WeakRetained pencilKitCanvasView];
  [v7 setDrawing:v5];

  return v4;
}

- (unint64_t)type
{
  return 8;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)PKEraserTool);
  [(CRLFreehandDrawingToolPixelEraser *)self scaledWidthForSlicingEraser];
  id v6 = [v5 initWithEraserType:2];
  [v4 setTool:v6];
}

- (void)p_endErasingAndFinalize:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  id v6 = [WeakRetained pencilKitCanvasView];

  v7 = [v6 _tiledView];
  id v8 = [v7 canvasView];

  if (v3)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = sub_100105FB4;
    long long v20 = sub_100105FC4;
    id v21 = 0;
    objc_super v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    objc_super v12 = sub_100105FCC;
    v13 = &unk_1014D64F0;
    v15 = &v16;
    objc_super v9 = dispatch_semaphore_create(0);
    id v14 = v9;
    [v8 _replayDrawingEndedEstimatesTimeout:&v10 withBackgroundQueueCompletion:0.0];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (v17[5]) {
      -[CRLFreehandDrawingToolPixelEraser p_finalizeBitmapEraseWithStroke:](self, "p_finalizeBitmapEraseWithStroke:", v10, v11, v12, v13);
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    [v8 _replayDrawingCancelled];
  }
}

- (void)p_finalizeBitmapEraseWithStroke:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLFreehandDrawingTool *)self icc];
  v109 = v4;
  [v4 renderBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  id v14 = [(CRLFreehandDrawingTool *)self possibleFreehandDrawingLayoutsInParentContainerAtPoint:sub_100065738(v6, v8, v10, v12)];
  v15 = [v5 commandController];
  [v15 openGroup];

  uint64_t v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Erase" value:0 table:@"UndoStrings"];
  v105 = v5;
  uint64_t v18 = [v5 commandController];
  [v18 setCurrentGroupActionString:v17];

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id obj = v14;
  id v19 = [obj countByEnumeratingWithState:&v124 objects:v140 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v125;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v125 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v23 = *(void **)(*((void *)&v124 + 1) + 8 * i);
        [v23 frameForCullingInRoot];
        v142.origin.x = v7;
        v142.origin.y = v9;
        v142.size.width = v11;
        v142.size.height = v13;
        if (CGRectIntersectsRect(v141, v142))
        {
          uint64_t v24 = objc_opt_class();
          long long v25 = [v23 info];
          long long v26 = sub_1002469D0(v24, v25);

          if (v26) {
            [(CRLFreehandDrawingToolPixelEraser *)self p_enqueueCommandsToEraseWithin:v26 withErasingStroke:v109];
          }
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v124 objects:v140 count:16];
    }
    while (v20);
  }

  long long v27 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
  if ([(CRLBezierHitTester *)self->_fillHitTester pathCount])
  {
    v104 = +[CRLPKStrokeConverter pathFromPKStroke:v109 pencilKitStrokePathData:0];
    -[CRLFreehandDrawingToolPixelEraser p_updatePathsForSlicingWithErasingStroke:](self, "p_updatePathsForSlicingWithErasingStroke:");
    v28 = +[CRLPKStrokeConverter pathFromPKStroke:v109 pencilKitStrokePathData:0];
    [(CRLFreehandDrawingToolPixelEraser *)self p_unscaledEraserDiameter];
    [v28 setLineWidth:];
    [v28 setLineCapStyle:1];
    [v28 setLineJoinStyle:1];
    objc_super v29 = [v28 strokedCopy];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
    v31 = [WeakRetained pencilKitCanvasView];
    unsigned int v32 = [v31 isRulerActive];

    if (v32)
    {
      id v33 = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
      v34 = [v33 unscaledRulerBezierPath];

      v35 = [(CRLFreehandDrawingToolPixelEraser *)self p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:v29 withVisibleRulerBezierPath:v34];
      if (v35)
      {
        uint64_t v36 = [v29 intersectBezierPath:v35];

        objc_super v29 = (void *)v36;
      }
    }
    v37 = [(NSMutableArray *)self->_allHitTesterFillPathsZOrdered crl_arrayWithObjectsInHashTable:self->_hitTesterPathsNeedingFinalizationAtEnd];
    v38 = +[NSHashTable hashTableWithOptions:512];
    v39 = [(CRLFreehandDrawingTool *)self icc];
    v40 = [v39 editingCoordinator];
    v41 = [v40 commandController];

    v107 = v41;
    [v41 openGroup];
    id v111 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v110 = v37;
    v108 = v29;
    v106 = v38;
    id v115 = [v110 countByEnumeratingWithState:&v120 objects:v139 count:16];
    if (v115)
    {
      uint64_t v114 = *(void *)v121;
      v116 = self;
      do
      {
        v42 = 0;
        do
        {
          if (*(void *)v121 != v114) {
            objc_enumerationMutation(v110);
          }
          uint64_t v43 = *(void *)(*((void *)&v120 + 1) + 8 * (void)v42);
          v44 = [(NSMapTable *)self->_shapeFillLayoutsForHitTesterPaths objectForKeyedSubscript:v43];
          v118 = [(NSMapTable *)self->_currentPathsForHitTesterPaths objectForKeyedSubscript:v43];
          v138[0] = v118;
          v138[1] = v29;
          v45 = +[NSArray arrayWithObjects:v138 count:2];
          v46 = +[CRLBezierPath subtractBezierPaths:v45];

          if (!v46)
          {
            unsigned int v47 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D6510);
            }
            v48 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v129 = v47;
              __int16 v130 = 2082;
              v131 = "-[CRLFreehandDrawingToolPixelEraser p_finalizeBitmapEraseWithStroke:]";
              __int16 v132 = 2082;
              v133 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m";
              __int16 v134 = 1024;
              int v135 = 259;
              __int16 v136 = 2082;
              v137 = "pathWithErasure";
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D6530);
            }
            v49 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v77 = v49;
              v78 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v129 = v47;
              __int16 v130 = 2114;
              v131 = v78;
              _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_finalizeBitmapEraseWithStroke:]");
            v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 259, 0, "invalid nil value for '%{public}s'", "pathWithErasure");

            v46 = 0;
            self = v116;
          }
          v117 = v46;
          if ([v46 containsElementsOtherThanMoveAndClose])
          {
            id v52 = [v46 copy];
            [v52 bounds];
            double v54 = v53;
            double v56 = v55;
            CGAffineTransformMakeTranslation(&v119, -v53, -v55);
            [v52 transformUsingAffineTransform:&v119];
            v57 = +[CRLBezierPathSource pathSourceWithBezierPath:v52];
            [v44 beginDynamicOperationWithRealTimeCommands:0];
            [v44 dynamicallySetBezierPathSource:v57 atUnscaledOrigin:v54, v56];

            v58 = [v44 pathSource];
            v59 = [v44 finalInfoGeometryForResize];
            [v44 endDynamicOperation];
            v60 = [v44 shapeInfo];
            v61 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v60 pathSource:v58];
            [v107 enqueueCommand:v61];
            v62 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v60 geometry:v59];
            [v107 enqueueCommand:v62];
            v63 = [v60 parentInfo];
            uint64_t v64 = objc_opt_class();
            v70 = sub_100246DEC(v63, v64, 1, v65, v66, v67, v68, v69, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

            v113 = v61;
            if (v60
              && ([v111 objectForKeyedSubscript:v70],
                  (v71 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v72 = v71;
              v73 = (char *)[v71 integerValue];
            }
            else
            {
              v73 = 0;
            }
            v74 = [v58 bezierPath];
            int64_t v75 = [(CRLFreehandDrawingToolPixelEraser *)v116 p_breakApartFilledShapeIfPossible:v60 withDesiredGeometry:v59 bezierPath:v74 previousZOrderOffset:v73];

            if (v70)
            {
              v76 = +[NSNumber numberWithInteger:&v73[v75]];
              [v111 setObject:v76 forKeyedSubscript:v70];
            }
            self = v116;
            objc_super v29 = v108;
            v38 = v106;
          }
          else
          {
            v58 = [v44 shapeInfo];
            [v38 addObject:v58];
          }

          v42 = (char *)v42 + 1;
        }
        while (v115 != v42);
        id v115 = [v110 countByEnumeratingWithState:&v120 objects:v139 count:16];
      }
      while (v115);
    }

    long long v27 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
    if ([v38 count])
    {
      v79 = [v38 setRepresentation];
      v80 = [v105 canvasEditor];
      v81 = [v80 canvasEditorHelper];
      v82 = [v81 commandForDeletingInfosPossiblyFromMultipleContainers:v79 shouldRemoveEmptyContainers:1];

      [v107 enqueueCommand:v82];
      deletedShapeInfos = self->_deletedShapeInfos;
      v84 = [v38 setRepresentation];
      v85 = [v84 allObjects];
      [(NSMutableSet *)deletedShapeInfos addObjectsFromArray:v85];

      v38 = v106;
    }
    [v107 closeGroup];
  }
  fillHitTester = self->_fillHitTester;
  self->_fillHitTester = 0;

  allHitTesterFillPathsZOrdered = self->_allHitTesterFillPathsZOrdered;
  self->_allHitTesterFillPathsZOrdered = 0;

  shapeFillLayoutsForHitTesterPaths = self->_shapeFillLayoutsForHitTesterPaths;
  self->_shapeFillLayoutsForHitTesterPaths = 0;

  currentPathsForHitTesterPaths = self->_currentPathsForHitTesterPaths;
  self->_currentPathsForHitTesterPaths = 0;

  hitTesterPathsNeedingFinalizationAtEnd = self->_hitTesterPathsNeedingFinalizationAtEnd;
  self->_hitTesterPathsNeedingFinalizationAtEnd = 0;

  uint64_t v91 = v27[541];
  id v92 = [*(id *)((char *)&self->super.super.isa + v91) count];
  v93 = [(CRLFreehandDrawingTool *)self icc];
  v94 = v93;
  if (v92)
  {
    v95 = [v93 canvasEditor];
    v96 = [v95 canvasEditorHelper];
    v97 = [v96 selectionBehaviorForDeletingBoardItems:*(Class *)((char *)&self->super.super.isa + v91)];

    [(CRLCommandSelectionBehavior *)v97 setSelectionFlags:[(CRLCommandSelectionBehavior *)v97 selectionFlags] & 0xFFFFFFFFFFFFFFFBLL];
  }
  else
  {
    v98 = [v93 editorController];
    v99 = [v98 selectionPath];

    v97 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v99 reverseSelectionPath:v99];
  }
  v100 = [(CRLFreehandDrawingTool *)self icc];
  v101 = [v100 pkDrawingProvider];
  [v101 activeDrawingWillEndAfterInsertingFinalizedDrawingItem];

  v102 = [v105 commandController];
  [v102 closeGroupWithSelectionBehavior:v97];

  v103 = *(Class *)((char *)&self->super.super.isa + v91);
  *(Class *)((char *)&self->super.super.isa + v91) = 0;
}

- (double)p_unscaledEraserDiameter
{
  double scaledWidthForSlicingEraser = self->_scaledWidthForSlicingEraser;
  id v4 = (objc_class *)objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  CGFloat v6 = [WeakRetained pencilKitCanvasView];
  CGFloat v7 = [v6 tool];
  CGFloat v8 = sub_10024715C(v4, v7);

  if (v8)
  {
    [v8 width];
    double scaledWidthForSlicingEraser = v9;
  }
  CGFloat v10 = [(CRLFreehandDrawingTool *)self icc];
  [v10 viewScale];
  double v12 = scaledWidthForSlicingEraser / v11;

  return v12;
}

- (void)p_enqueueCommandsToEraseWithin:(id)a3 withErasingStroke:(id)a4
{
  id v6 = a3;
  long long v122 = self;
  id v123 = a4;
  CGFloat v7 = [(CRLFreehandDrawingTool *)self icc];
  id v127 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:16];
  id v8 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:16];
  long long v126 = +[NSMutableArray array];
  double v9 = +[NSMutableSet set];
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v124 = v6;
  CGFloat v10 = [v6 childInfos];
  id v11 = [v10 countByEnumeratingWithState:&v172 objects:v182 count:16];
  long long v125 = v7;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v173;
    uint64_t v142 = *(void *)v173;
    v138 = v10;
    do
    {
      uint64_t v14 = 0;
      id v140 = v12;
      do
      {
        if (*(void *)v173 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v146 = v14;
        uint64_t v15 = *(void *)(*((void *)&v172 + 1) + 8 * v14);
        uint64_t v16 = objc_opt_class();
        v17 = [v7 layoutForInfo:v15];
        uint64_t v18 = sub_1002469D0(v16, v17);

        if (v18)
        {
          id v19 = [v18 shapeInfo];
          unsigned __int8 v20 = [v19 isTreatedAsFillForFreehandDrawing];

          if ((v20 & 1) == 0)
          {
            uint64_t v21 = [v18 pencilKitStrokes];
            v144 = v21;
            if (v21)
            {
              long long v22 = v21;
              if ([v21 count] != (id)1)
              {
                unsigned int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D6590);
                }
                uint64_t v24 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67110402;
                  *(_DWORD *)&uint8_t buf[4] = v23;
                  *(_WORD *)&buf[8] = 2082;
                  *(void *)&buf[10] = "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]";
                  *(_WORD *)&buf[18] = 2082;
                  *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDraw"
                                        "ingToolPixelEraser.m";
                  *(_WORD *)&buf[28] = 1024;
                  *(_DWORD *)&buf[30] = 372;
                  *(_WORD *)&buf[34] = 2082;
                  *(void *)&buf[36] = "strokesInShapeSpace.count";
                  *(_WORD *)&buf[44] = 2082;
                  *(void *)&buf[46] = "1U";
                  _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected equality between %{public}s and %{public}s", buf, 0x36u);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D65B0);
                }
                long long v25 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  v46 = v25;
                  unsigned int v47 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&uint8_t buf[4] = v23;
                  *(_WORD *)&buf[8] = 2114;
                  *(void *)&buf[10] = v47;
                  _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                long long v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]");
                long long v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"];
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 372, 0, "expected equality between %{public}s and %{public}s", "strokesInShapeSpace.count", "1U");
              }
              memset(buf, 0, 48);
              [v18 pureTransformInRoot];
              v168[0] = _NSConcreteStackBlock;
              v168[1] = 3221225472;
              v168[2] = sub_100108214;
              v168[3] = &unk_1014D65D0;
              long long v169 = *(_OWORD *)buf;
              long long v170 = *(_OWORD *)&buf[16];
              long long v171 = *(_OWORD *)&buf[32];
              v28 = [v22 crl_arrayByTransformingWithBlock:v168];
              [v126 addObjectsFromArray:v28];
              long long v166 = 0u;
              long long v167 = 0u;
              long long v164 = 0u;
              long long v165 = 0u;
              id v29 = v28;
              id v30 = [v29 countByEnumeratingWithState:&v164 objects:v180 count:16];
              if (v30)
              {
                id v31 = v30;
                uint64_t v32 = *(void *)v165;
                do
                {
                  for (i = 0; i != v31; i = (char *)i + 1)
                  {
                    if (*(void *)v165 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    v34 = *(void **)(*((void *)&v164 + 1) + 8 * i);
                    v35 = [v34 _strokeUUID];
                    [v9 addObject:v35];

                    uint64_t v36 = [v34 _strokeUUID];
                    [v127 setObject:v18 forKeyedSubscript:v36];

                    v37 = [v34 path];
                    v38 = [v37 _strokeDataUUID];
                    [v8 setObject:v18 forKeyedSubscript:v38];
                  }
                  id v31 = [v29 countByEnumeratingWithState:&v164 objects:v180 count:16];
                }
                while (v31);
              }

              CGFloat v7 = v125;
              CGFloat v10 = v138;
              id v12 = v140;
            }
            else
            {
              unsigned int v39 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D6550);
              }
              v40 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)&uint8_t buf[4] = v39;
                *(_WORD *)&buf[8] = 2082;
                *(void *)&buf[10] = "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]";
                *(_WORD *)&buf[18] = 2082;
                *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawin"
                                      "gToolPixelEraser.m";
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = 369;
                *(_WORD *)&buf[34] = 2082;
                *(void *)&buf[36] = "strokesInShapeSpace";
                _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D6570);
              }
              v41 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v44 = v41;
                v45 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = v39;
                *(_WORD *)&buf[8] = 2114;
                *(void *)&buf[10] = v45;
                _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]");
              uint64_t v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 369, 0, "invalid nil value for '%{public}s'", "strokesInShapeSpace");
            }
            uint64_t v13 = v142;
          }
        }

        uint64_t v14 = v146 + 1;
      }
      while ((id)(v146 + 1) != v12);
      id v12 = [v10 countByEnumeratingWithState:&v172 objects:v182 count:16];
    }
    while (v12);
  }

  id v48 = objc_alloc((Class)PKDrawing);
  id v49 = objc_alloc_init((Class)PKDrawing);
  id v50 = [v48 initWithStrokes:v126 fromDrawing:v49];

  [v50 _eraseWithEraserStroke:v123];
  long long v121 = v50;
  v51 = [v50 strokes];
  unsigned int v129 = +[NSMutableArray array];
  id v52 = [v9 mutableCopy];
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id obj = v51;
  id v53 = [obj countByEnumeratingWithState:&v160 objects:v179 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v161;
    do
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(void *)v161 != v55) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v160 + 1) + 8 * (void)j);
        v58 = [v57 _strokeUUID];
        unsigned __int8 v59 = [v9 containsObject:v58];

        if (v59)
        {
          v60 = [v57 _strokeUUID];
          [v52 removeObject:v60];
        }
        else
        {
          [v129 addObject:v57];
        }
      }
      id v54 = [obj countByEnumeratingWithState:&v160 objects:v179 count:16];
    }
    while (v54);
  }

  v137 = +[NSMutableSet set];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v130 = v52;
  id v61 = [v130 countByEnumeratingWithState:&v156 objects:v178 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v157;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v157 != v63) {
          objc_enumerationMutation(v130);
        }
        uint64_t v65 = [v127 objectForKeyedSubscript:*(void *)(*((void *)&v156 + 1) + 8 * (void)v64)];
        if (!v65)
        {
          unsigned int v66 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D65F0);
          }
          uint64_t v67 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&uint8_t buf[4] = v66;
            *(_WORD *)&buf[8] = 2082;
            *(void *)&buf[10] = "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]";
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m";
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = 406;
            *(_WORD *)&buf[34] = 2082;
            *(void *)&buf[36] = "shapeLayout";
            _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6610);
          }
          uint64_t v68 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v74 = v68;
            int64_t v75 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v66;
            *(_WORD *)&buf[8] = 2114;
            *(void *)&buf[10] = v75;
            _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          uint64_t v69 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]");
          v70 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v69, v70, 406, 0, "invalid nil value for '%{public}s'", "shapeLayout");
        }
        v71 = (objc_class *)objc_opt_class();
        v72 = [v65 info];
        v73 = sub_10024715C(v71, v72);

        [v137 crl_addNonNilObject:v73];
        uint64_t v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      id v62 = [v130 countByEnumeratingWithState:&v156 objects:v178 count:16];
    }
    while (v62);
  }

  v76 = v125;
  v77 = [v125 commandController];
  [v77 openGroup];

  v78 = [v125 editingCoordinator];
  __int16 v134 = [v78 boardItemFactory];

  v79 = v129;
  if ([v129 count])
  {
    v80 = [v125 layoutForInfo:v124];
    v81 = [CRLCanvasInfoGeometry alloc];
    long long v120 = v80;
    v82 = [v80 geometryInRoot];
    v83 = [(CRLCanvasInfoGeometry *)v81 initWithLayoutGeometry:v82];

    v84 = [v124 childItems];
    v133 = +[NSOrderedSet orderedSetWithArray:v84];

    __int16 v136 = +[NSMutableDictionary dictionary];
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v128 = v129;
    id v135 = [v128 countByEnumeratingWithState:&v152 objects:v177 count:16];
    if (v135)
    {
      uint64_t v132 = *(void *)v153;
      do
      {
        uint64_t v85 = 0;
        do
        {
          if (*(void *)v153 != v132) {
            objc_enumerationMutation(v128);
          }
          v86 = *(void **)(*((void *)&v152 + 1) + 8 * v85);
          v87 = [v86 path];
          v88 = [v87 _strokeDataUUID];
          v89 = [v8 objectForKeyedSubscript:v88];

          v90 = [v89 shapeInfo];
          id v91 = [v133 indexOfObject:v90];
          id v92 = [v90 stroke];
          uint64_t v147 = v85;
          v143 = v90;
          v145 = v89;
          id v139 = v91;
          CGRect v141 = v92;
          if (v92)
          {
            [v92 width];
            double v94 = v93;
          }
          else
          {
            v95 = [v137 anyObject];
            v96 = [v95 stroke];
            [v96 width];
            double v94 = v97;
          }
          v98 = [v134 makeShapeItemsForFreehandDrawingWithPKStroke:v86 adjustedBaseWidth:v94];
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v99 = [v98 countByEnumeratingWithState:&v148 objects:v176 count:16];
          if (v99)
          {
            id v100 = v99;
            uint64_t v101 = *(void *)v149;
            do
            {
              for (k = 0; k != v100; k = (char *)k + 1)
              {
                if (*(void *)v149 != v101) {
                  objc_enumerationMutation(v98);
                }
                v103 = *(void **)(*((void *)&v148 + 1) + 8 * (void)k);
                v104 = [v103 geometry];
                v105 = [v104 geometryRelativeToGeometry:v83];
                [v103 setGeometry:v105];
              }
              id v100 = [v98 countByEnumeratingWithState:&v148 objects:v176 count:16];
            }
            while (v100);
          }
          v106 = +[NSNumber numberWithInteger:v139];
          v107 = [v136 objectForKeyedSubscript:v106];

          if (!v107)
          {
            v107 = +[NSMutableArray array];
            v108 = +[NSNumber numberWithInteger:v139];
            [v136 setObject:v107 forKeyedSubscript:v108];
          }
          [v107 addObjectsFromArray:v98];

          uint64_t v85 = v147 + 1;
        }
        while ((id)(v147 + 1) != v135);
        id v135 = [v128 countByEnumeratingWithState:&v152 objects:v177 count:16];
      }
      while (v135);
    }

    v109 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v124 boardItemsByIndex:v136];
    v76 = v125;
    id v110 = [v125 commandController];
    [v110 enqueueCommand:v109];

    v79 = v129;
  }
  id v111 = [v76 canvasEditor];
  v112 = [v111 canvasEditorHelper];
  v113 = [v112 commandForDeletingInfosPossiblyFromMultipleContainers:v137 shouldRemoveEmptyContainers:[v79 count] == 0];

  if (v113)
  {
    uint64_t v114 = [v76 commandController];
    [v114 enqueueCommand:v113];
  }
  id v115 = [v76 commandController];
  [v115 closeGroup];

  deletedShapeInfos = v122->_deletedShapeInfos;
  if (!deletedShapeInfos)
  {
    uint64_t v117 = +[NSMutableSet set];
    v118 = v122->_deletedShapeInfos;
    v122->_deletedShapeInfos = (NSMutableSet *)v117;

    deletedShapeInfos = v122->_deletedShapeInfos;
  }
  CGAffineTransform v119 = [v137 allObjects];
  [(NSMutableSet *)deletedShapeInfos addObjectsFromArray:v119];
}

- (void)p_setUpForManualHitTestingFillEraseForInputPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLFreehandDrawingTool *)self icc];
  [v6 viewScale];
  double v8 = v7;
  double v9 = +[NSMutableArray array];
  allHitTesterFillPathsZOrdered = self->_allHitTesterFillPathsZOrdered;
  self->_allHitTesterFillPathsZOrdered = v9;

  id v11 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
  shapeFillLayoutsForHitTesterPaths = self->_shapeFillLayoutsForHitTesterPaths;
  self->_shapeFillLayoutsForHitTesterPaths = v11;

  uint64_t v13 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
  currentPathsForHitTesterPaths = self->_currentPathsForHitTesterPaths;
  self->_currentPathsForHitTesterPaths = v13;

  uint64_t v15 = +[NSHashTable hashTableWithOptions:512];
  hitTesterPathsNeedingFinalizationAtEnd = self->_hitTesterPathsNeedingFinalizationAtEnd;
  self->_hitTesterPathsNeedingFinalizationAtEnd = v15;

  v17 = [[CRLBezierHitTester alloc] initWithBucketSize:ceil(10.0 / fmin(v8, 1.0))];
  fillHitTester = self->_fillHitTester;
  self->_fillHitTester = v17;

  [v6 visibleUnscaledRect];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  -[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", x, y);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v47 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v56;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v27;
        v28 = *(void **)(*((void *)&v55 + 1) + 8 * v27);
        uint64_t v29 = objc_opt_class();
        id v30 = [v28 info];
        id v31 = sub_1002469D0(v29, v30);

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v48 = v31;
        uint64_t v32 = [v31 childInfos];
        id v33 = [v32 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v52;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v52 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              uint64_t v38 = objc_opt_class();
              unsigned int v39 = [v6 layoutForInfo:v37];
              v40 = sub_1002469D0(v38, v39);

              if (v40)
              {
                v41 = [v40 shapeInfo];
                unsigned int v42 = [v41 isTreatedAsFillForFreehandDrawing];

                if (v42)
                {
                  uint64_t v43 = [v40 pathSource];
                  v44 = [v43 bezierPath];

                  [v40 pureTransformInRoot];
                  [v44 transformUsingAffineTransform:v50];
                  -[CRLBezierHitTester addPath:filled:clippedToRect:](self->_fillHitTester, "addPath:filled:clippedToRect:", v44, 1, v20, v22, v24, v26);
                  [(NSMutableArray *)self->_allHitTesterFillPathsZOrdered addObject:v44];
                  [(NSMapTable *)self->_shapeFillLayoutsForHitTesterPaths setObject:v40 forKeyedSubscript:v44];
                  [(NSMapTable *)self->_currentPathsForHitTesterPaths setObject:v44 forKeyedSubscript:v44];
                }
              }
            }
            id v34 = [v32 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }
          while (v34);
        }

        uint64_t v27 = v49 + 1;
      }
      while ((id)(v49 + 1) != v47);
      id v47 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v47);
  }
}

- (void)p_updatePathsForSlicingWithErasingStroke:(id)a3
{
  id v4 = a3;
  [(CRLFreehandDrawingToolPixelEraser *)self p_unscaledEraserDiameter];
  id v6 = [(CRLBezierHitTester *)self->_fillHitTester pathsCrossingPath:v4 withSearchThreshold:v5 * 0.5];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (![(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd containsObject:v11]) {
          [(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (int64_t)p_breakApartFilledShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 previousZOrderOffset:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v12 = [a5 visuallyDistinctSubregions];
  if ((unint64_t)[v12 count] >= 2) {
    int64_t v13 = [(CRLFreehandDrawingToolPixelEraser *)self p_breakApartShape:v10 withGeometry:v11 subpaths:v12 previousZOrderOffset:a6];
  }
  else {
    int64_t v13 = 0;
  }

  return v13;
}

- (int64_t)p_breakApartShape:(id)a3 withGeometry:(id)a4 subpaths:(id)a5 previousZOrderOffset:(int64_t)a6
{
  id v9 = a3;
  id v34 = a4;
  id v10 = a5;
  id v33 = [(CRLFreehandDrawingTool *)self icc];
  id v11 = [v33 editingCoordinator];
  long long v12 = [v11 boardItemFactory];

  int64_t v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  if ([v10 count])
  {
    unint64_t v14 = 0;
    do
    {
      long long v15 = [v10 objectAtIndexedSubscript:v14];
      uint64_t v16 = (objc_class *)objc_opt_class();
      v17 = [v12 makeDuplicateOfBoardItem:v9];
      uint64_t v18 = sub_10024715C(v16, v17);

      [v15 bounds];
      double v19 = [v34 geometryWithNewBounds:];
      [v18 setGeometry:v19];

      double v20 = +[CRLBezierPathSource pathSourceWithBezierPath:v15];
      [v18 setPathSource:v20];

      [v18 setAspectRatioLocked:[v9 aspectRatioLocked]];
      [v13 addObject:v18];

      ++v14;
    }
    while (v14 < (unint64_t)[v10 count]);
  }
  double v21 = (objc_class *)objc_opt_class();
  double v22 = [v9 parentInfo];
  double v23 = sub_10024715C(v21, v22);

  double v24 = [v23 childInfos];
  double v25 = (char *)[v24 indexOfObject:v9] + a6;

  double v26 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v23 boardItems:v13 index:v25];
  uint64_t v27 = [v33 commandController];
  [v27 enqueueCommand:v26];

  v28 = [[_TtC8Freeform26CRLCommandDeleteBoardItems alloc] initWithBoardItemToDelete:v9];
  uint64_t v29 = [v33 commandController];
  [v29 enqueueCommand:v28];

  id v30 = (char *)[v13 count] - 1;
  return (int64_t)v30;
}

- (id)p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:(id)a3 withVisibleRulerBezierPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 isEmpty])
    {
      double v8 = INFINITY;
      double v9 = INFINITY;
    }
    else
    {
      [v6 elementAtIndex:0 associatedPoints:v45];
      double v8 = *(double *)v45;
      double v9 = *(double *)&v45[1];
    }
    if (sub_100065BF8(v8, v9))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6630);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101079E48();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6650);
      }
      id v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v11);
      }
      long long v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:withVisibleRulerBezierPath:]");
      int64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:589 isFatal:0 description:"Begin point from erasing stroke path should not be null."];
      id v10 = 0;
    }
    else
    {
      unint64_t v14 = [(CRLFreehandDrawingTool *)self icc];
      [v14 visibleBoundsRectForTiling];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      double v23 = [(CRLFreehandDrawingTool *)self icc];
      [v23 convertBoundsToUnscaledRect:v16, v18, v20, v22];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      long long v12 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v25, v27, v29, v31);
      int64_t v13 = [v12 subtractBezierPath:v7];
      uint64_t v32 = [v13 arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:1];
      if ([v32 count])
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v33 = v32;
        id v10 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v10)
        {
          uint64_t v34 = *(void *)v41;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v41 != v34) {
                objc_enumerationMutation(v33);
              }
              uint64_t v36 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              if (objc_msgSend(v36, "containsPoint:", v8, v9, (void)v40))
              {
                id v10 = v36;
                goto LABEL_36;
              }
            }
            id v10 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D6670);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101079EDC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D6690);
        }
        uint64_t v37 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v37);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:withVisibleRulerBezierPath:]");
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"];
        +[CRLAssertionHandler handleFailureInFunction:v33 file:v38 lineNumber:601 isFatal:0 description:"subpathsFromSubtractedPath should never empty."];

        id v10 = 0;
      }
LABEL_36:
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (double)scaledWidthForSlicingEraser
{
  return self->_scaledWidthForSlicingEraser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedShapeInfos, 0);
  objc_storeStrong((id *)&self->_hitTesterPathsNeedingFinalizationAtEnd, 0);
  objc_storeStrong((id *)&self->_currentPathsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_shapeFillLayoutsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_allHitTesterFillPathsZOrdered, 0);
  objc_storeStrong((id *)&self->_fillHitTester, 0);

  objc_destroyWeak((id *)&self->_pencilKitCanvasViewController);
}

@end